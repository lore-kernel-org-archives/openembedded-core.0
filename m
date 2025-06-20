Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29BBC7EE24
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 15:14:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2677.1750432482569852114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 08:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACAAA16F2;
	Fri, 20 Jun 2025 08:14:22 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7F263F673;
	Fri, 20 Jun 2025 08:14:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: christian.lindeberg@axis.com
Subject: [PATCH 10/12] recipetool/create_go: proxy module fetching to go-mod-update-modules
Date: Fri, 20 Jun 2025 16:14:27 +0100
Message-ID: <20250620151429.3210879-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620151429.3210879-1-ross.burton@arm.com>
References: <20250620151429.3210879-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 15:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219137

Now that the go-mod-update-modules class exists, this Go handler can
create a stub recipe and then proxy the module handling to the class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/recipetool/create_go.py | 152 +++++++---------------------
 1 file changed, 36 insertions(+), 116 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool=
/create_go.py
index 3e9fc857842..78097495bac 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -11,17 +11,15 @@
=20
=20
 from recipetool.create import RecipeHandler, handle_license_vars
-from recipetool.create import find_licenses
=20
 import bb.utils
 import json
 import logging
 import os
 import re
+import subprocess
 import sys
 import tempfile
-import urllib.parse
-import urllib.request
=20
=20
 logger =3D logging.getLogger('recipetool')
@@ -66,97 +64,6 @@ class GoRecipeHandler(RecipeHandler):
=20
         return bindir
=20
-    @staticmethod
-    def __unescape_path(path):
-        """Unescape capital letters using exclamation points."""
-        return re.sub(r'!([a-z])', lambda m: m.group(1).upper(), path)
-
-    @staticmethod
-    def __fold_uri(uri):
-        """Fold URI for sorting shorter module paths before longer."""
-        return uri.replace(';', ' ').replace('/', '!')
-
-    @staticmethod
-    def __go_run_cmd(cmd, cwd, d):
-        env =3D dict(os.environ, PATH=3Dd.getVar('PATH'), GOMODCACHE=3Dd=
.getVar('GOMODCACHE'))
-        return bb.process.run(cmd, env=3Denv, shell=3DTrue, cwd=3Dcwd)
-
-    def __go_mod(self, go_mod, srctree, localfilesdir, extravalues, d):
-        moddir =3D d.getVar('GOMODCACHE')
-
-        # List main packages and their dependencies with the go list com=
mand.
-        stdout, _ =3D self.__go_run_cmd(f"go list -json=3DDir,Module -de=
ps {go_mod['Module']['Path']}/...", srctree, d)
-        pkgs =3D json.loads('[' + stdout.replace('}\n{', '},\n{') + ']')
-
-        # Collect licenses for the dependencies.
-        licenses =3D set()
-        lic_files_chksum =3D []
-        lic_files =3D {}
-        for pkg in pkgs:
-            # TODO: If the package is in a subdirectory with its own lic=
ense
-            # files then report those istead of the license files found =
in the
-            # module root directory.
-            mod =3D pkg.get('Module', None)
-            if not mod or mod.get('Main', False):
-                continue
-            path =3D os.path.relpath(mod['Dir'], moddir)
-            for lic in find_licenses(mod['Dir'], d):
-                lic_files[os.path.join(path, lic[1])] =3D (lic[0], lic[2=
])
-
-        for lic_file in lic_files:
-            licenses.add(lic_files[lic_file][0])
-            lic_files_chksum.append(
-                f'file://pkg/mod/{lic_file};md5=3D{lic_files[lic_file][1=
]}')
-
-        # Collect the module cache files downloaded by the go list comma=
nd as
-        # the go list command knows best what the go list command needs =
and it
-        # needs more files in the module cache than the go install comma=
nd as
-        # it doesn't do the dependency pruning mentioned in the Go modul=
e
-        # reference, https://go.dev/ref/mod, for go 1.17 or higher.
-        src_uris =3D []
-        downloaddir =3D os.path.join(moddir, 'cache', 'download')
-        for dirpath, _, filenames in os.walk(downloaddir):
-            path, base =3D os.path.split(os.path.relpath(dirpath, downlo=
addir))
-            if base !=3D '@v':
-                continue
-            path =3D self.__unescape_path(path)
-            zipver =3D None
-            for name in filenames:
-                ver, ext =3D os.path.splitext(name)
-                if ext =3D=3D '.zip':
-                    chksum =3D bb.utils.sha256_file(os.path.join(dirpath=
, name))
-                    src_uris.append(f'gomod://{path};version=3D{ver};sha=
256sum=3D{chksum}')
-                    zipver =3D ver
-                    break
-            for name in filenames:
-                ver, ext =3D os.path.splitext(name)
-                if ext =3D=3D '.mod' and ver !=3D zipver:
-                    chksum =3D bb.utils.sha256_file(os.path.join(dirpath=
, name))
-                    src_uris.append(f'gomod://{path};version=3D{ver};mod=
=3D1;sha256sum=3D{chksum}')
-
-        self.__go_run_cmd("go clean -modcache", srctree, d)
-
-        licenses_basename =3D "{pn}-licenses.inc"
-        licenses_filename =3D os.path.join(localfilesdir, licenses_basen=
ame)
-        with open(licenses_filename, "w") as f:
-            f.write(f'GO_MOD_LICENSES =3D "{" & ".join(sorted(licenses))=
}"\n\n')
-            f.write('LIC_FILES_CHKSUM +=3D "\\\n')
-            for lic in sorted(lic_files_chksum, key=3Dself.__fold_uri):
-                f.write('    ' + lic + ' \\\n')
-            f.write('"\n')
-
-        extravalues['extrafiles'][f"../{licenses_basename}"] =3D license=
s_filename
-
-        go_mods_basename =3D "{pn}-go-mods.inc"
-        go_mods_filename =3D os.path.join(localfilesdir, go_mods_basenam=
e)
-        with open(go_mods_filename, "w") as f:
-            f.write('SRC_URI +=3D "\\\n')
-            for uri in sorted(src_uris, key=3Dself.__fold_uri):
-                f.write('    ' + uri + ' \\\n')
-            f.write('"\n')
-
-        extravalues['extrafiles'][f"../{go_mods_basename}"] =3D go_mods_=
filename
-
     def process(self, srctree, classes, lines_before,
                 lines_after, handled, extravalues):
=20
@@ -167,37 +74,52 @@ class GoRecipeHandler(RecipeHandler):
         if not files:
             return False
=20
-        d =3D bb.data.createCopy(tinfoil.config_data)
         go_bindir =3D self.__ensure_go()
         if not go_bindir:
             sys.exit(14)
=20
-        d.prependVar('PATH', '%s:' % go_bindir)
         handled.append('buildsystem')
         classes.append("go-mod")
=20
-        tmp_mod_dir =3D tempfile.mkdtemp(prefix=3D'go-mod-')
-        d.setVar('GOMODCACHE', tmp_mod_dir)
+        # Use go-mod-update-modules to set the full SRC_URI and LICENSE
+        classes.append("go-mod-update-modules")
+        extravalues["run_task"] =3D "update_modules"
=20
-        stdout, _ =3D self.__go_run_cmd("go mod edit -json", srctree, d)
-        go_mod =3D json.loads(stdout)
-        go_import =3D re.sub(r'/v([0-9]+)$', '', go_mod['Module']['Path'=
])
+        with tempfile.TemporaryDirectory(prefix=3D"go-mod-") as tmp_mod_=
dir:
+            env =3D dict(os.environ)
+            env["PATH"] +=3D f":{go_bindir}"
+            env['GOMODCACHE'] =3D tmp_mod_dir
=20
-        localfilesdir =3D tempfile.mkdtemp(prefix=3D'recipetool-go-')
-        extravalues.setdefault('extrafiles', {})
+            stdout =3D subprocess.check_output(["go", "mod", "edit", "-j=
son"], cwd=3Dsrctree, env=3Denv, text=3DTrue)
+            go_mod =3D json.loads(stdout)
+            go_import =3D re.sub(r'/v([0-9]+)$', '', go_mod['Module']['P=
ath'])
=20
-        # Write the ${BPN}-licenses.inc and ${BPN}-go-mods.inc files
-        self.__go_mod(go_mod, srctree, localfilesdir, extravalues, d)
+            localfilesdir =3D tempfile.mkdtemp(prefix=3D'recipetool-go-'=
)
+            extravalues.setdefault('extrafiles', {})
=20
-        # Do generic license handling
-        handle_license_vars(srctree, lines_before, handled, extravalues,=
 d)
-        self.__rewrite_lic_vars(lines_before)
+            # Write the stub ${BPN}-licenses.inc and ${BPN}-go-mods.inc =
files
+            basename =3D "{pn}-licenses.inc"
+            filename =3D os.path.join(localfilesdir, basename)
+            with open(filename, "w") as f:
+                f.write("# FROM RECIPETOOL\n")
+            extravalues['extrafiles'][f"../{basename}"] =3D filename
=20
-        self.__rewrite_src_uri(lines_before)
+            basename =3D "{pn}-go-mods.inc"
+            filename =3D os.path.join(localfilesdir, basename)
+            with open(filename, "w") as f:
+                f.write("# FROM RECIPETOOL\n")
+            extravalues['extrafiles'][f"../{basename}"] =3D filename
=20
-        lines_before.append('require ${BPN}-licenses.inc')
-        lines_before.append('require ${BPN}-go-mods.inc')
-        lines_before.append(f'GO_IMPORT =3D "{go_import}"')
+            # Do generic license handling
+            d =3D bb.data.createCopy(tinfoil.config_data)
+            handle_license_vars(srctree, lines_before, handled, extraval=
ues, d)
+            self.__rewrite_lic_vars(lines_before)
+
+            self.__rewrite_src_uri(lines_before)
+
+            lines_before.append('require ${BPN}-licenses.inc')
+            lines_before.append('require ${BPN}-go-mods.inc')
+            lines_before.append(f'GO_IMPORT =3D "{go_import}"')
=20
     def __update_lines_before(self, updated, newlines, lines_before):
         if updated:
@@ -210,10 +132,8 @@ class GoRecipeHandler(RecipeHandler):
         return updated
=20
     def __rewrite_lic_vars(self, lines_before):
-
         def varfunc(varname, origvalue, op, newlines):
-            if varname =3D=3D 'LICENSE':
-                return ' & '.join((origvalue, '${GO_MOD_LICENSES}')), No=
ne, -1, True
+            import urllib.parse
             if varname =3D=3D 'LIC_FILES_CHKSUM':
                 new_licenses =3D []
                 licenses =3D origvalue.split('\\')
@@ -235,7 +155,7 @@ class GoRecipeHandler(RecipeHandler):
             return origvalue, None, 0, True
=20
         updated, newlines =3D bb.utils.edit_metadata(
-            lines_before, ['LICENSE', 'LIC_FILES_CHKSUM'], varfunc)
+            lines_before, ['LIC_FILES_CHKSUM'], varfunc)
         return self.__update_lines_before(updated, newlines, lines_befor=
e)
=20
     def __rewrite_src_uri(self, lines_before):
--=20
2.43.0


