Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B735C5B554
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:28:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2814.1748550498770598512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F35752574
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1EC663F792
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] Prototype go-mod-update-modules class
Date: Thu, 29 May 2025 21:28:02 +0100
Message-ID: <20250529202802.1198179-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529202802.1198179-1-ross.burton@arm.com>
References: <20250529202802.1198179-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217444

Almost entirely based on the create_go.py module for recipetool by
Christian Lindeberg <christian.lindeberg@axis.com>, this instead has the
logic inside a class that can be used to update the list of Go module
that are used, both SRC_URI and LICENSE.

My test case is crucible: simply inherit this class and run the task, it
will rewrite the include files.

There's still plenty to be done:
- Verify that the module list is the set of modules need to _build_ and
  not the longer set of modules need to run all the tests for all
  dependencies.
- Test behaviour when used as part of 'devtool upgrade'
- Determine how to integrate this with 'recipetool create': should the
  code be centralised into lib/oe and called in both places, or should
  recipetool write the skeleton of the recipe and then call the update
  task.
- Port more recipes. Crucible works, etcd is proving tricky as I don't
  really understand Go very well.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../go-mod-update-modules.bbclass             | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 meta/classes-recipe/go-mod-update-modules.bbclass

diff --git a/meta/classes-recipe/go-mod-update-modules.bbclass b/meta/cla=
sses-recipe/go-mod-update-modules.bbclass
new file mode 100644
index 00000000000..3253f7f0a26
--- /dev/null
+++ b/meta/classes-recipe/go-mod-update-modules.bbclass
@@ -0,0 +1,130 @@
+addtask do_update_modules after do_configure
+do_update_modules[nostamp] =3D "1"
+do_update_modules[network] =3D "1"
+
+python do_update_modules() {
+    import subprocess, tempfile, json, re
+    from oe.license_finder import find_licenses
+
+    def unescape_path(path):
+        """Unescape capital letters using exclamation points."""
+        return re.sub(r'!([a-z])', lambda m: m.group(1).upper(), path)
+
+    def fold_uri(uri):
+        """Fold URI for sorting shorter module paths before longer."""
+        return uri.replace(';', ' ').replace('/', '!')
+
+    # TODO duplicated in recipetools
+    def tidy_licenses(value):
+        """Flat, split and sort licenses"""
+        from oe.license import flattened_licenses
+        def _choose(a, b):
+            str_a, str_b  =3D sorted((" & ".join(a), " & ".join(b)), key=
=3Dstr.casefold)
+            return ["(%s | %s)" % (str_a, str_b)]
+        if not isinstance(value, str):
+            value =3D " & ".join(value)
+        return sorted(list(set(flattened_licenses(value, _choose))), key=
=3Dstr.casefold)
+
+    bpn =3D d.getVar("BPN")
+    thisdir =3D d.getVar("THISDIR")
+
+    mod_dir =3D tempfile.mkdtemp(prefix=3D'go-mod-')
+    bb.warn("using tmp mod %s" % mod_dir)
+    #d.setVar('GOMODCACHE', mod_dir)
+    env =3D dict(os.environ, GOMODCACHE=3Dmod_dir)
+
+    # TODO this feels magic
+    source =3D d.expand("${WORKDIR}/${GO_SRCURI_DESTSUFFIX}")
+
+    # TODO is this needed in the refresh case?
+    output =3D subprocess.check_output(("go", "mod", "edit", "-json"), c=
wd=3Dsource, env=3Denv, text=3DTrue)
+    go_mod =3D json.loads(output)
+
+    output =3D subprocess.check_output(("go", "list", "-json=3DDir,Modul=
e", "-deps", f"{go_mod['Module']['Path']}/..."), cwd=3Dsource, env=3Denv,=
 text=3DTrue)
+
+    #
+    # Licenses
+    #
+
+    # The output of this isn't actually valid JSON, but a series of dict=
s.
+    # Wrap in [] and join the dicts with ,
+    # Very frustrating that the json parser in python can't repeatedly
+    # parse from a stream.
+    pkgs =3D json.loads('[' + output.replace('}\n{', '},\n{') + ']')
+    # Collect licenses for the dependencies.
+    licenses =3D set()
+    lic_files_chksum =3D []
+    lic_files =3D {}
+    for pkg in pkgs:
+        # TODO: If the package is in a subdirectory with its own license
+        # files then report those istead of the license files found in t=
he
+        # module root directory.
+        mod =3D pkg.get('Module', None)
+        if not mod or mod.get('Main', False):
+            continue
+        path =3D os.path.relpath(mod['Dir'], mod_dir)
+        for license_name, license_file, license_md5 in find_licenses(mod=
['Dir'], d):
+            lic_files[os.path.join(path, license_file)] =3D (license_nam=
e, license_md5)
+
+    for lic_file in lic_files:
+        license_name, license_md5 =3D lic_files[lic_file]
+        if license_name =3D=3D "Unknown":
+            bb.warn(f"Unknown license: {lic_file} {license_md5}")
+
+        licenses.add(lic_files[lic_file][0])
+        lic_files_chksum.append(
+            f'file://pkg/mod/{lic_file};md5=3D{license_md5}')
+
+    licenses_filename =3D os.path.join(thisdir, f"{bpn}-licenses.inc")
+    with open(licenses_filename, "w") as f:
+        f.write(f'LICENSE +=3D "& {" & ".join(tidy_licenses(licenses))}"=
\n\n')
+        f.write('LIC_FILES_CHKSUM +=3D "\\\n')
+        for lic in sorted(lic_files_chksum, key=3Dfold_uri):
+            f.write('    ' + lic + ' \\\n')
+        f.write('"\n')
+
+    #
+    # Sources
+    #
+
+    # Collect the module cache files downloaded by the go list command a=
s
+    # the go list command knows best what the go list command needs and =
it
+    # needs more files in the module cache than the go install command a=
s
+    # it doesn't do the dependency pruning mentioned in the Go module
+    # reference, https://go.dev/ref/mod, for go 1.17 or higher.
+    src_uris =3D []
+    downloaddir =3D os.path.join(mod_dir, 'cache', 'download')
+    for dirpath, _, filenames in os.walk(downloaddir):
+        # We want to process files under @v directories
+        path, base =3D os.path.split(os.path.relpath(dirpath, downloaddi=
r))
+        if base !=3D '@v':
+            continue
+
+        path =3D unescape_path(path)
+        zipver =3D None
+        for name in filenames:
+            ver, ext =3D os.path.splitext(name)
+            if ext =3D=3D '.zip':
+                chksum =3D bb.utils.sha256_file(os.path.join(dirpath, na=
me))
+                src_uris.append(f'gomod://{path};version=3D{ver};sha256s=
um=3D{chksum}')
+                zipver =3D ver
+                break
+        for name in filenames:
+            ver, ext =3D os.path.splitext(name)
+            if ext =3D=3D '.mod' and ver !=3D zipver:
+                chksum =3D bb.utils.sha256_file(os.path.join(dirpath, na=
me))
+                src_uris.append(f'gomod://{path};version=3D{ver};mod=3D1=
;sha256sum=3D{chksum}')
+
+
+    go_mods_filename =3D os.path.join(thisdir, f"{bpn}-go-mods.inc")
+    with open(go_mods_filename, "w") as f:
+        f.write('SRC_URI +=3D "\\\n')
+        for uri in sorted(src_uris, key=3Dfold_uri):
+            f.write('    ' + uri + ' \\\n')
+        f.write('"\n')
+
+    subprocess.check_output(("go", "clean", "-modcache"), cwd=3Dsource, =
env=3Denv, text=3DTrue)
+}
+
+# This doesn't work as we need to wipe the inc files first so we don't t=
ry looking for LICENSE files that don't yet exist
+# RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_update_modules"
--=20
2.43.0


