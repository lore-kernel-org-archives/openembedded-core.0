Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDD4C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:47:49 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12389.1784134066573641799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ssG7XJng;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43cce8288c7so2796456fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134066; x=1784738866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9Dw/ftMsDIrb0ARATIAoaY3cKnwdZPw0U3hO8OveEY=;
        b=ssG7XJngvVrUD1RPD1RgoYxpg2HBJMneHnpblTAd6Q7pE96n+/5f0sG3u/dIu9XXaZ
         K8nnhbh3x+4WQM0OPmFPcItT0dBvWvLpOx3B7ARV3hfw4uC9ONsYaJB+SO1gD2nVB7HB
         Eiup/e2Gdz8fNcyszvuDOtxEylT18qaBxBzbCFBJJYVQbgM6ac98VFwuuReD4lcudUg8
         xdCE8rlshe7WEG7dMpBEaVwJd31nMoQ0VMWOjeB9qLw7q9r5q/ARV44a6KcXlNFk3UFq
         x61AyXrSc9Qx0AH9b4MZ9bQy7torbKr1HShnDkx5Ld6eb4QWAZaQ4lGhUv7/WtTSm+I7
         lSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134066; x=1784738866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9Dw/ftMsDIrb0ARATIAoaY3cKnwdZPw0U3hO8OveEY=;
        b=QSnapj8hyMN57lfah5XlybS5IKByZ1gCsEjwnDPJ8e8haPae2nk4QMegSfQhc+8746
         fC++i6dDrbQqKuHcW1VcxpFobiBmdudO0xHfTUMGkruyYaxko/wPqJ/LlmjIFYFE881W
         V8XwcS8UoTFLDOULDQgb8xVeJSVS0SiOiULMfVGhDXM1h/vyUsuyHxmE1qaYMqCHB2YX
         MTB1h6I6h2/etlM2swL67dAOiPyZVbUQmGLH3feNsCYtJWB+f+LDWAoM1p1srA3/+CSA
         CXi2ByMsdCecqywpQP+mdu5z0Cjpc/+hRJIGb/Dqops2qtsvAJaVbik4UcG8YcVNEA70
         B5Dg==
X-Gm-Message-State: AOJu0YzaZ6rEDOhC/2kmKpg6HB9kNthzce+5xU4kvDtesNKO/or/4E5H
	I1dKturbp9jgs3+s9yg0OaNf+0jjVyBCAvGjWkXyUg5poNbKSSxz8Yz94RAtWw==
X-Gm-Gg: AfdE7cnWJH3cncNDA6KbW8xSpG0iyRWfUqHKCB3+3bDpWQL69AABZxh5s/60CfORKsY
	JmM4n/pEuLNBArniBUxqgEKKBifbXzCcBEAFJx+NPpus2JK4y+2bVlCjDtm5IwUmIXhGViQXFX3
	b0XpINVnqbD0LwPaMeP82GWb2O3wS9nrW19dpHBp3i1HiHXpNxgb7rI7mBFF3fA1lYbUHnk9phs
	Ljp5kieIj/ALcnueVMKU2Jn1AaaF+NAjr1f49yICdXb0u/9OFRqoUKgfddsyI1BH16dDveKJqjh
	g+GLjV++xhCfWAuZ+Qd0SLmn+g5o6AlLIc5UmG9uZ6WED4MRJGb+jbYGJCglyVtG1dQ8o2zvJJe
	1o+Jce9gSOtQci2uu2c4b+zZ0QS078YEGHo+H7XxC1bDykEUN54bUYveOmCMMGAqOG7yNev2Bsl
	Jp+jMoyF8EEAEGpjS3QsQ=
X-Received: by 2002:a05:6820:200f:b0:6a1:3e91:dcae with SMTP id 006d021491bc7-6a3d9ff3497mr1972699eaf.33.1784134065322;
        Wed, 15 Jul 2026 09:47:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:44 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 04/25] Parse LICENSE as SPDX Expression
Date: Wed, 15 Jul 2026 10:45:00 -0600
Message-ID: <20260715164739.364323-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240996

Reworks the LICENSE parsing code to parse the expressions as SPDX
license expressions. An initial conversion is done to convert legacy
LICENSE expressions to SPDX expressions in case recipes are still using
the older style, but this is idempotent so it is a no-op if the license
is already an SPDX expression.

If LICENSE is detected to be in the old format, a warning is issued to
the user to tell them to upgrade, with the new license string that
should be used.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/insane.bbclass            |   8 +-
 meta/classes-global/license.bbclass           | 113 ++---
 meta/classes-recipe/license_image.bbclass     |   6 +-
 meta/classes/buildhistory.bbclass             |   3 +-
 meta/classes/copyleft_filter.bbclass          |   4 +-
 meta/conf/licenses.conf                       |   4 +
 meta/lib/oe/license.py                        | 468 ++++++++++--------
 meta/lib/oe/spdx30_tasks.py                   | 173 +++----
 .../oeqa/selftest/cases/incompatible_lic.py   |   7 +-
 meta/lib/oeqa/selftest/cases/oelib/license.py | 296 ++++++++---
 10 files changed, 623 insertions(+), 459 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index c1d8b16586..c0868849fb 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -990,8 +990,8 @@ def package_qa_check_unlisted_pkg_lics(package, d):
     if not pkg_lics:
         return
 
-    recipe_lics_set = oe.license.list_licenses(d.getVar('LICENSE'))
-    package_lics = oe.license.list_licenses(pkg_lics)
+    recipe_lics_set = oe.license.list_licenses(d.getVar('LICENSE'), d)
+    package_lics = oe.license.list_licenses(pkg_lics, d)
     unlisted = package_lics - recipe_lics_set
     if unlisted:
         oe.qa.handle_error("unlisted-pkg-lics",
@@ -1113,7 +1113,7 @@ python do_package_qa () {
     import oe.packagedata
 
     # Check for obsolete license references in main LICENSE (packages are checked below for any changes)
-    main_licenses = oe.license.list_licenses(d.getVar('LICENSE'))
+    main_licenses = oe.license.list_licenses(d.getVar('LICENSE'), d)
     obsolete = set(oe.license.obsolete_license_list()) & main_licenses
     if obsolete:
         oe.qa.handle_error("obsolete-license", "Recipe LICENSE includes obsolete licenses %s" % ' '.join(obsolete), d)
@@ -1332,7 +1332,7 @@ python do_qa_patch() {
 
     # Detect cargo-based tests
     elif os.path.exists(os.path.join(srcdir, "Cargo.toml")) and (
-        match_line_in_files(srcdir, "**/*.rs", r'\s*#\s*\[\s*test\s*\]') or 
+        match_line_in_files(srcdir, "**/*.rs", r'\s*#\s*\[\s*test\s*\]') or
         match_line_in_files(srcdir, "**/*.rs", r'\s*#\s*\[\s*cfg\s*\(\s*test\s*\)\s*\]')
     ):
         oe.qa.handle_error("unimplemented-ptest", "%s: cargo-based tests detected" % d.getVar('PN'), d)
diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index 2d4ad6df26..86c9ee5878 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -52,10 +52,12 @@ python perform_packagecopy:prepend () {
 perform_packagecopy[vardeps] += "LICENSE_CREATE_PACKAGE"
 
 def get_recipe_info(d):
+    import oe.license
+
     info = {}
     info["PV"] = d.getVar("PV")
     info["PR"] = d.getVar("PR")
-    info["LICENSE"] = d.getVar("LICENSE")
+    info["LICENSE"] = oe.license.convert_legacy_license_to_spdx(d, d.getVar("LICENSE"))
     return info
 
 def add_package_and_files(d):
@@ -116,6 +118,7 @@ def find_license_files(d):
     """
     import shutil
     import oe.license
+    import oe.spdx_license
     from collections import defaultdict, OrderedDict
 
     # All the license files for the package
@@ -128,86 +131,18 @@ def find_license_files(d):
     # List of basename, path tuples
     lic_files_paths = []
     # hash for keep track generic lics mappings
-    non_generic_lics = {}
+    non_generic_lics = set()
     # Entries from LIC_FILES_CHKSUM
     lic_chksums = {}
-    license_source_dirs = []
-    license_source_dirs.append(generic_directory)
-    try:
-        additional_lic_dirs = d.getVar('LICENSE_PATH').split()
-        for lic_dir in additional_lic_dirs:
-            license_source_dirs.append(lic_dir)
-    except:
-        pass
-
-    class FindVisitor(oe.license.LicenseVisitor):
-        def visit_Str(self, node):
-            #
-            # Until I figure out what to do with
-            # the two modifiers I support (or greater = +
-            # and "with exceptions" being *
-            # we'll just strip out the modifier and put
-            # the base license.
-            find_licenses(node.s.replace("+", "").replace("*", ""))
-            self.generic_visit(node)
-
-        def visit_Constant(self, node):
-            find_licenses(node.value.replace("+", "").replace("*", ""))
-            self.generic_visit(node)
-
-    def find_licenses(license_type):
-        try:
-            bb.utils.mkdirhier(gen_lic_dest)
-        except:
-            pass
-        spdx_generic = None
-        license_source = None
-        # If the generic does not exist we need to check to see if there is an SPDX mapping to it,
-        # unless NO_GENERIC_LICENSE is set.
-        for lic_dir in license_source_dirs:
-            if not os.path.isfile(os.path.join(lic_dir, license_type)):
-                if d.getVarFlag('SPDXLICENSEMAP', license_type) != None:
-                    # Great, there is an SPDXLICENSEMAP. We can copy!
-                    bb.debug(1, "We need to use a SPDXLICENSEMAP for %s" % (license_type))
-                    spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type)
-                    license_source = lic_dir
-                    break
-            elif os.path.isfile(os.path.join(lic_dir, license_type)):
-                spdx_generic = license_type
-                license_source = lic_dir
-                break
-
-        non_generic_lic = d.getVarFlag('NO_GENERIC_LICENSE', license_type)
-        if spdx_generic and license_source:
-            # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
-            # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)
-
-            lic_files_paths.append(("generic_" + license_type, os.path.join(license_source, spdx_generic),
-                                    None, None))
-
-            # The user may attempt to use NO_GENERIC_LICENSE for a generic license which doesn't make sense
-            # and should not be allowed, warn the user in this case.
-            if d.getVarFlag('NO_GENERIC_LICENSE', license_type):
-                oe.qa.handle_error("license-no-generic",
-                    "%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type), d)
-
-        elif non_generic_lic and non_generic_lic in lic_chksums:
-            # if NO_GENERIC_LICENSE is set, we copy the license files from the fetched source
-            # of the package rather than the license_source_dirs.
-            lic_files_paths.append(("generic_" + license_type,
-                                    os.path.join(srcdir, non_generic_lic), None, None))
-            non_generic_lics[non_generic_lic] = license_type
-        else:
-            # Explicitly avoid the CLOSED license because this isn't generic
-            if license_type != 'CLOSED':
-                # And here is where we warn people that their licenses are lousy
-                oe.qa.handle_error("license-exists",
-                    "%s: No generic license file exists for: %s in any provider" % (pn, license_type), d)
-            pass
 
     if not generic_directory:
         bb.fatal("COMMON_LICENSE_DIR is unset. Please set this in your distro config")
 
+    try:
+        bb.utils.mkdirhier(gen_lic_dest)
+    except:
+        pass
+
     for url in lic_files.split():
         try:
             (method, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
@@ -221,14 +156,28 @@ def find_license_files(d):
         endline = parm.get('endline')
         lic_chksums[path] = (chksum, beginline, endline)
 
-    v = FindVisitor()
+    def walk_license(node):
+        if isinstance(node, oe.spdx_license.Identifier):
+            p, non_generic_fn = oe.license.get_license_path(d, node)
+            if p is not None and (not non_generic_fn or non_generic_fn in lic_chksums):
+                lic_files_paths.append(("generic_" + node.ident, p, None, None))
+                if non_generic_fn:
+                    non_generic_lics.add(non_generic_fn)
+            else:
+                oe.qa.handle_error("license-exists",
+                    "%s: No generic license file exists for: %s in any provider" % (pn, node.ident), d)
+
+        for child in node.children:
+            walk_license(child)
+
     try:
-        v.visit_string(d.getVar('LICENSE'))
-    except oe.license.InvalidLicense as exc:
-        bb.fatal('%s: %s' % (d.getVar('PF'), exc))
-    except SyntaxError:
-        oe.qa.handle_error("license-syntax",
-            "%s: Failed to parse LICENSE: %s" % (d.getVar('PF'), d.getVar('LICENSE')), d)
+        licensestr = d.getVar("LICENSE")
+        if licensestr and licensestr != "CLOSED":
+            node = oe.license.parse_legacy_license(d, licensestr)
+            walk_license(node)
+    except oe.spdx_license.ParseError as e:
+        oe.qa.handle_error("license-syntax", e.format(prefix=f"{d.getVar('PF')}: "), d)
+
     # Add files from LIC_FILES_CHKSUM to list of license files
     lic_chksum_paths = defaultdict(OrderedDict)
     for path, data in sorted(lic_chksums.items()):
diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 1ecd8f88bc..258082c82a 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -131,10 +131,10 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs):
                     oe.qa.handle_error('license-exception', "Including %s with incompatible license(s) %s into the image, because it has been allowed by exception list." %(pkg, ' '.join(incompatible_licenses)), d)
             try:
                 (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
-                    oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
-                    remaining_bad_licenses, oe.license.canonical_license, d)
+                    oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"],
+                    remaining_bad_licenses)
             except oe.license.LicenseError as exc:
-                bb.fatal('%s: %s' % (d.getVar('P'), exc))
+                bb.fatal(exc.format(prefix=d.getVar("P") + ": "))
 
             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
                 # Rootfs manifest
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8f605a720e..ce6ef8971a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -82,6 +82,7 @@ python buildhistory_emit_pkghistory() {
     import shlex
     import errno
     import shutil
+    import oe.license
 
     if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
         return 0
@@ -199,7 +200,7 @@ python buildhistory_emit_pkghistory() {
     pv = d.getVar('PV')
     pr = d.getVar('PR')
     layer = bb.utils.get_file_layer(d.getVar('FILE'), d)
-    license = d.getVar('LICENSE')
+    license = oe.license.convert_legacy_license_to_spdx(d, d.getVar('LICENSE'))
 
     pkgdata_dir = d.getVar('PKGDATA_DIR')
     packages = ""
diff --git a/meta/classes/copyleft_filter.bbclass b/meta/classes/copyleft_filter.bbclass
index 83cd90060d..89bb779ebc 100644
--- a/meta/classes/copyleft_filter.bbclass
+++ b/meta/classes/copyleft_filter.bbclass
@@ -61,9 +61,9 @@ def copyleft_should_include(d):
         exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
 
         try:
-            is_included, reason = oe.license.is_included(d.getVar('LICENSE'), include, exclude)
+            is_included, reason = oe.license.is_included(d, d.getVar('LICENSE'), include, exclude)
         except oe.license.LicenseError as exc:
-            bb.fatal('%s: %s' % (d.getVar('PF'), exc))
+            bb.fatal(exc.format(prefix=d.getVar("PF") + ": "))
         else:
             if is_included:
                 if reason:
diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index dcb499c3f3..c639477b72 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -114,6 +114,10 @@ SPDXLICENSEMAP[vim] = "Vim"
 # Silicon Graphics variations
 SPDXLICENSEMAP[SGIv1] = "SGI-OpenGL"
 
+SPDXLICENSEMAP[Apache-2.0-with-LLVM-exception] = "Apache-2.0 WITH LLVM-exception"
+SPDXLICENSEMAP[GPL-3-with-bison-exception] = "GPL-3.0-or-later WITH Bison-exception-2.2"
+SPDXLICENSEMAP[GPL-2.0-with-Linux-syscall-note] = "GPL-2.0-only WITH Linux-syscall-note"
+
 # Additional license directories. Add your custom licenses directories this path.
 # LICENSE_PATH += "${COREBASE}/custom-licenses"
 
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index bd28a247c9..9e59d82f8d 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -9,6 +9,7 @@ import ast
 import re
 import oe.qa
 from fnmatch import fnmatchcase as fnmatch
+import oe.spdx_license
 
 def license_ok(license, dont_want_licenses):
     """ Return False if License exist in dont_want_licenses else True """
@@ -27,89 +28,34 @@ def obsolete_license_list():
             "Artistic-1", "AFL-2", "AFL-1", "AFLv2", "AFLv1", "CDDLv1", "CDDL-1", "EPLv1.0", "FreeType", "Nauman",
             "tcl", "vim", "SGIv1"]
 
-class LicenseError(Exception):
-    pass
-
-class LicenseSyntaxError(LicenseError):
-    def __init__(self, licensestr, exc):
-        self.licensestr = licensestr
-        self.exc = exc
-        LicenseError.__init__(self)
-
-    def __str__(self):
-        return "error in '%s': %s" % (self.licensestr, self.exc)
-
-class InvalidLicense(LicenseError):
-    def __init__(self, license):
-        self.license = license
-        LicenseError.__init__(self)
-
-    def __str__(self):
-        return "invalid characters in license '%s'" % self.license
-
-license_operator_chars = '&|() '
-license_operator = re.compile(r'([' + license_operator_chars + '])')
-license_pattern = re.compile(r'[a-zA-Z0-9.+_\-]+$')
-
-class LicenseVisitor(ast.NodeVisitor):
-    """Get elements based on OpenEmbedded license strings"""
-    def get_elements(self, licensestr):
-        new_elements = []
-        elements = list([x for x in license_operator.split(licensestr) if x.strip()])
-        for pos, element in enumerate(elements):
-            if license_pattern.match(element):
-                if pos > 0 and license_pattern.match(elements[pos-1]):
-                    new_elements.append('&')
-                element = '"' + element + '"'
-            elif not license_operator.match(element):
-                raise InvalidLicense(element)
-            new_elements.append(element)
-
-        return new_elements
-
-    """Syntax tree visitor which can accept elements previously generated with
-    OpenEmbedded license string"""
-    def visit_elements(self, elements):
-        self.visit(ast.parse(' '.join(elements)))
-
-    """Syntax tree visitor which can accept OpenEmbedded license strings"""
-    def visit_string(self, licensestr):
-        self.visit_elements(self.get_elements(licensestr))
-
-class FlattenVisitor(LicenseVisitor):
-    """Flatten a license tree (parsed from a string) by selecting one of each
-    set of OR options, in the way the user specifies"""
-    def __init__(self, choose_licenses):
-        self.choose_licenses = choose_licenses
-        self.licenses = []
-        LicenseVisitor.__init__(self)
-
-    def visit_Constant(self, node):
-        self.licenses.append(node.value)
-
-    def visit_BinOp(self, node):
-        if isinstance(node.op, ast.BitOr):
-            left = FlattenVisitor(self.choose_licenses)
-            left.visit(node.left)
-
-            right = FlattenVisitor(self.choose_licenses)
-            right.visit(node.right)
-
-            selected = self.choose_licenses(left.licenses, right.licenses)
-            self.licenses.extend(selected)
-        else:
-            self.generic_visit(node)
 
-def flattened_licenses(licensestr, choose_licenses):
+LicenseError = oe.spdx_license.ParseError
+
+def flattened_licenses(d, licensestr, choose_licenses):
     """Given a license string and choose_licenses function, return a flat list of licenses"""
-    flatten = FlattenVisitor(choose_licenses)
-    try:
-        flatten.visit_string(licensestr)
-    except SyntaxError as exc:
-        raise LicenseSyntaxError(licensestr, exc)
-    return flatten.licenses
+    def walk_license(node):
+        if isinstance(node, oe.spdx_license.Identifier):
+            return [node.ident]
+
+        if isinstance(node, oe.spdx_license.OrOp):
+            left = walk_license(node.left)
+            right = walk_license(node.right)
+
+            return choose_licenses(left, right)
+
+        ret = []
+        for child in node.children:
+            ret.extend(walk_license(child))
+
+        return ret
+
+    n = parse_legacy_license(d, licensestr)
+    if n is None:
+        return []
+
+    return walk_license(n)
 
-def is_included(licensestr, include_licenses=None, exclude_licenses=None):
+def is_included(d, licensestr, include_licenses=None, exclude_licenses=None):
     """Given a license string, a list of licenses to include and a list of
     licenses to exclude, determine if the license string matches the include
     list and does not match the exclude list.
@@ -147,7 +93,7 @@ def is_included(licensestr, include_licenses=None, exclude_licenses=None):
     if not exclude_licenses:
         exclude_licenses = []
 
-    licenses = flattened_licenses(licensestr, choose_licenses)
+    licenses = flattened_licenses(d, licensestr, choose_licenses)
     excluded = [lic for lic in licenses if exclude_license(lic)]
     included = [lic for lic in licenses if include_license(lic)]
     if excluded:
@@ -155,100 +101,76 @@ def is_included(licensestr, include_licenses=None, exclude_licenses=None):
     else:
         return True, included
 
-class ManifestVisitor(LicenseVisitor):
-    """Walk license tree (parsed from a string) removing the incompatible
-    licenses specified"""
-    def __init__(self, dont_want_licenses, canonical_license, d):
-        self._dont_want_licenses = dont_want_licenses
-        self._canonical_license = canonical_license
-        self._d = d
-        self._operators = []
-
-        self.licenses = []
-        self.licensestr = ''
-
-        LicenseVisitor.__init__(self)
-
-    def visit(self, node):
-        if isinstance(node, ast.Constant):
-            lic = node.value
-
-            if license_ok(self._canonical_license(self._d, lic),
-                    self._dont_want_licenses) == True:
-                if self._operators:
-                    ops = []
-                    for op in self._operators:
-                        if op == '[':
-                            ops.append(op)
-                        elif op == ']':
-                            ops.append(op)
-                        else:
-                            if not ops:
-                                ops.append(op)
-                            elif ops[-1] in ['[', ']']:
-                                ops.append(op)
-                            else:
-                                ops[-1] = op 
-
-                    for op in ops:
-                        if op == '[' or op == ']':
-                            self.licensestr += op
-                        elif self.licenses:
-                            self.licensestr += ' ' + op + ' '
-
-                    self._operators = []
-
-                self.licensestr += lic
-                self.licenses.append(lic)
-        elif isinstance(node, ast.BitAnd):
-            self._operators.append("&")
-        elif isinstance(node, ast.BitOr):
-            self._operators.append("|")
-        elif isinstance(node, ast.List):
-            self._operators.append("[")
-        elif isinstance(node, ast.Load):
-            self.licensestr += "]"
-
-        self.generic_visit(node)
-
-def manifest_licenses(licensestr, dont_want_licenses, canonical_license, d):
+def manifest_licenses(d, licensestr, dont_want_licenses):
     """Given a license string and dont_want_licenses list,
        return license string filtered and a list of licenses"""
-    manifest = ManifestVisitor(dont_want_licenses, canonical_license, d)
 
-    try:
-        elements = manifest.get_elements(licensestr)
+    node = parse_legacy_license(d, licensestr)
+    licenses = []
+
+    def walk_license(node):
+        nonlocal licenses
+        if isinstance(node, oe.spdx_license.Identifier):
+            if license_ok(node.ident, dont_want_licenses):
+                licenses.append(node.ident)
+                return node
+
+            return None
+
+        old_children = node.children
+        node.children = []
 
-        # Replace '()' to '[]' for handle in ast as List and Load types.
-        elements = ['[' if e == '(' else e for e in elements]
-        elements = [']' if e == ')' else e for e in elements]
+        for child in old_children:
+            node.children.append(walk_license(child))
 
-        manifest.visit_elements(elements)
-    except SyntaxError as exc:
-        raise LicenseSyntaxError(licensestr, exc)
+        # If all children are removed, remove this node also
+        if not any(node.children):
+            return None
 
-    # Replace '[]' to '()' for output correct license.
-    manifest.licensestr = manifest.licensestr.replace('[', '(').replace(']', ')')
+        # Elide a binary operation if it now only has one child
+        if isinstance(node, (oe.spdx_license.AndOp, oe.spdx_license.OrOp)):
+            if node.left is None:
+                return node.right
+            if node.right is None:
+                return node.left
 
-    return (manifest.licensestr, manifest.licenses)
+        # The left side (the license side) of a WITH can be removed, but not
+        # the right (the exception)
+        if isinstance(node, oe.spdx_license.WithOp):
+            if node.license is None:
+                return None
 
-class ListVisitor(LicenseVisitor):
-    """Record all different licenses found in the license string"""
-    def __init__(self):
-        self.licenses = set()
+        # If one of the above cases doesn't catch everything, raise an error
+        if not all(node.children):
+            node.children = old_children
+            pn = d.getVar("PN")
+            bb.fatal(f"{pn}: Removing licenses from {node.to_string} results in an invalid license expression")
 
-    def visit_Constant(self, node):
-        self.licenses.add(node.value)
+        return node
 
-def list_licenses(licensestr):
-    """Simply get a list of all licenses mentioned in a license string.
+    if node:
+        node = walk_license(node)
+
+    if not node:
+        return ("", licenses)
+
+    return (node.to_string(), licenses)
+
+def list_licenses(licensestr, d):
+    """Simply get a set of all licenses mentioned in a license string.
        Binary operators are not applied or taken into account in any way"""
-    visitor = ListVisitor()
-    try:
-        visitor.visit_string(licensestr)
-    except SyntaxError as exc:
-        raise LicenseSyntaxError(licensestr, exc)
-    return visitor.licenses
+    licenses = []
+
+    def walk_license(node):
+        nonlocal licenses
+        if isinstance(node, oe.spdx_license.Identifier):
+            licenses.append(node.ident)
+
+        for child in node.children:
+            walk_license(child)
+
+    walk_license(parse_legacy_license(d, licensestr))
+    return set(licenses)
 
 def apply_pkg_license_exception(pkg, bad_licenses, exceptions):
     """Return remaining bad licenses after removing any package exceptions"""
@@ -293,31 +215,38 @@ def expand_wildcard_licenses(d, wildcard_licenses):
 
     return list(licenses)
 
-def incompatible_license_contains(license, truevalue, falsevalue, d):
+def incompatible_license_contains(d, license, truevalue, falsevalue):
     license = canonical_license(d, license)
     bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
     bad_licenses = expand_wildcard_licenses(d, bad_licenses)
     return truevalue if license in bad_licenses else falsevalue
 
 def incompatible_pkg_license(d, dont_want_licenses, license):
-    # Handles an "or" or two license sets provided by
-    # flattened_licenses(), pick one that works if possible.
-    def choose_lic_set(a, b):
-        return a if all(license_ok(canonical_license(d, lic),
-                            dont_want_licenses) for lic in a) else b
+    def walk_license(node):
+        if isinstance(node, oe.spdx_license.Identifier):
+            if license_ok(node.ident, dont_want_licenses):
+                return []
+            return [node.ident]
+
+        incompatible_lic = []
+        for child in node.children:
+            c = walk_license(child)
+            if not c and isinstance(node, oe.spdx_license.OrOp):
+                return []
+            incompatible_lic.extend(c)
+
+        return incompatible_lic
 
     try:
-        licenses = flattened_licenses(license, choose_lic_set)
-    except LicenseError as exc:
-        bb.fatal('%s: %s' % (d.getVar('P'), exc))
+        node = parse_legacy_license(d, license)
+    except oe.spdx_license.ParseError as e:
+        bb.fatal(e.format(prefix=d.getVar('P') + ":"))
+        return []
 
-    incompatible_lic = []
-    for l in licenses:
-        license = canonical_license(d, l)
-        if not license_ok(license, dont_want_licenses):
-            incompatible_lic.append(license)
+    if not node:
+        return []
 
-    return sorted(incompatible_lic)
+    return sorted(walk_license(node))
 
 def incompatible_license(d, dont_want_licenses, package=None):
     """
@@ -394,6 +323,92 @@ def check_license_flags(d):
             return unmatched_flags
     return None
 
+
+def _substitute_legacy_license(licensestr):
+    if not licensestr or licensestr == "CLOSED":
+        return None
+
+    licensestr = licensestr.replace("&", " AND ").replace("|", " OR ")
+
+    return licensestr
+
+def _parse_legacy_license(d, licensestr):
+    node = oe.spdx_license.parse(licensestr, allow_unknown=True)
+
+    unknown_found = False
+
+    def convert_unknown(node):
+        nonlocal unknown_found
+
+        if isinstance(node, oe.spdx_license.UnknownId):
+            if d is not None:
+                v = d.getVarFlag("SPDXLICENSEMAP", node.ident)
+                if v:
+                    return oe.spdx_license.parse(v)
+
+            if node.ident == "Unknown":
+                return node
+
+            ident = re.sub(r'[^a-zA-Z0-9\.\-]', '-', node.ident)
+            unknown_found = True
+            return oe.spdx_license.LicenseRef("LicenseRef-" + ident, node.ident, token=node.token)
+
+        node.children = [convert_unknown(child) for child in node.children]
+        return node
+
+    return convert_unknown(node), unknown_found
+
+def parse_legacy_license(d, licensestr):
+    """
+    Converts a legacy license string to a SPDX license string and parses it,
+    returning a SPDX license abstract syntax tree
+
+    This can be removed and replaced with oe.spdx_license.parse(licensestr)
+    once legacy licenses are not longer allowed.
+
+    Unknown license IDs in the string are automatically converted to
+    LicenseRefs, assuming that they are provided as either a common license
+    file or a NO_GENERIC_LICENSE
+    """
+    licensestr = _substitute_legacy_license(licensestr)
+    if licensestr is None:
+        return None
+
+    node, _ = _parse_legacy_license(d, licensestr)
+    return node
+
+def convert_legacy_license_to_spdx(d, licensestr):
+    """
+    Converts a legacy license string to an SPDX-compatible license string
+    """
+    s = parse_legacy_license(d, licensestr)
+    if not s:
+        return licensestr
+
+    return s.to_string()
+
+def get_license_path(d, node):
+    """
+    Given an node from an SPDX AST, return the path to the license file
+    """
+    if isinstance(node, oe.spdx_license.LicenseRef):
+        filename = d.getVarFlag("NO_GENERIC_LICENSE", node.name)
+        if filename:
+            return d.expand("${S}/" + filename), filename
+
+    for lic_dir in [d.getVar("COMMON_LICENSE_DIR")] + (d.getVar("LICENSE_PATH") or "").split():
+        p = os.path.join(lic_dir, node.name)
+        if os.path.isfile(p):
+            return p, None
+
+        # Some license expressions already contain the "LicenseRef-" prefix, so
+        # look for a matching license name
+        p = os.path.join(lic_dir, node.ident)
+        if os.path.isfile(p):
+            return p, None
+
+    return None, None
+
 def check_license_format(d):
     """
     This function checks if LICENSE is well defined,
@@ -401,22 +416,75 @@ def check_license_format(d):
         No spaces are allowed between LICENSES.
     """
     pn = d.getVar('PN')
-    licenses = d.getVar('LICENSE')
-
-    elements = list(filter(lambda x: x.strip(), license_operator.split(licenses)))
-    for pos, element in enumerate(elements):
-        if license_pattern.match(element):
-            if pos > 0 and license_pattern.match(elements[pos - 1]):
-                oe.qa.handle_error('license-format',
-                        '%s: LICENSE value "%s" has an invalid format - license names ' \
-                        'must be separated by the following characters to indicate ' \
-                        'the license selection: %s' %
-                        (pn, licenses, license_operator_chars), d)
-        elif not license_operator.match(element):
-            oe.qa.handle_error('license-format',
-                    '%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
-                    'in the valid list of separators (%s)' %
-                    (pn, licenses, element, license_operator_chars), d)
+    packages = d.getVar("PACKAGES").split()
+
+    for v in ["LICENSE"] + [f"LICENSE:{p}" for p in packages]:
+        licenses = d.getVar(v)
+
+        if licenses == "INVALID":
+            continue
+
+        if licenses == "CLOSED":
+            bb.warn(f'{pn}: {v} is using "CLOSED", which is deprecated. Convert to using a license ref pointing to an actual license file, e.g.\n{v} = "LicenseRef-{pn}-CLOSED"')
+            continue
+
+        if not licenses:
+            continue
+
+        try:
+            spdx_license = _substitute_legacy_license(licenses)
+
+            s, unknown_found = _parse_legacy_license(d, spdx_license)
+            if not s:
+                continue
+
+            if spdx_license != licenses or unknown_found:
+                bb.warn(f'{pn}: {v} is using an old syntax and should be upgraded to: "{s.sort().to_string()}"')
+
+            if s:
+                # Check license refs
+                missing_generic_refs = set()
+                missing_refs = set()
+                deprecated = set()
+                def walk_license(node):
+                    nonlocal missing_generic_refs
+                    nonlocal missing_refs
+
+                    if isinstance(node, oe.spdx_license.LicenseRef):
+                        p, non_generic_fn = get_license_path(d, node)
+                        if not p:
+                            if non_generic_fn:
+                                missing_refs.add(node.ident)
+                            else:
+                                missing_generic_refs.add(node.ident)
+
+                    if isinstance(node, (oe.spdx_license.LicenseId, oe.spdx_license.ExceptionId)):
+                        if node.deprecated:
+                            deprecated.add(node.ident)
+
+                    for child in node.children:
+                        walk_license(child)
+
+                walk_license(s)
+                if missing_refs:
+                    missing_refs = ', '.join(sorted(missing_refs))
+                    oe.qa.handle_error("license-format",
+                                        f'{pn}: LICENSE contains a reference to license(s) {missing_refs} which are not defined in NO_GENERIC_LICENSE',
+                                        d)
+
+                if missing_generic_refs:
+                    missing_generic_refs = ', '.join(sorted(missing_generic_refs))
+                    oe.qa.handle_error("license-format",
+                                        f'{pn}: LICENSE contains a reference to license(s) {missing_generic_refs} for which no generic license was found',
+                                        d)
+
+                if deprecated:
+                    deprecated = ", ".join(sorted(deprecated))
+                    bb.warn(f'{pn}: {v} contains deprecated licenses {deprecated}')
+
+        except oe.spdx_license.ParseError as e:
+            oe.qa.handle_error("license-format",
+                            f'{pn}: {v} value has an invalid format:\n{e.format()}\n', d)
 
 def skip_incompatible_package_licenses(d, pkgs):
     if not pkgs:
@@ -461,13 +529,11 @@ def tidy_licenses(value):
     """
     Flat, split and sort licenses.
     """
-    from oe.license import flattened_licenses
-
     def _choose(a, b):
-        str_a, str_b  = sorted((" & ".join(a), " & ".join(b)), key=str.casefold)
-        return ["(%s | %s)" % (str_a, str_b)]
+        str_a, str_b  = sorted((" AND ".join(a), " AND ".join(b)), key=str.casefold)
+        return ["(%s OR %s)" % (str_a, str_b)]
 
     if not isinstance(value, str):
-        value = " & ".join(value)
+        value = " AND ".join(value)
 
-    return sorted(list(set(flattened_licenses(value, _choose))), key=str.casefold)
+    return sorted(list(set(flattened_licenses(None, value, _choose))), key=str.casefold)
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 79e18db11d..987f8692f6 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -6,12 +6,14 @@
 
 import json
 import oe.cve_check
+import oe.license
 import oe.packagedata
 import oe.patch
 import oe.sbom30
+import oe.sdk
 import oe.spdx30
 import oe.spdx_common
-import oe.sdk
+import oe.spdx_license
 import os
 import re
 import urllib.parse
@@ -37,101 +39,52 @@ def set_timestamp_now(d, o, prop):
 def add_license_expression(
     d, objset, license_expression, license_data, search_objsets=[]
 ):
-    simple_license_text = {}
     license_text_map = {}
+    pn = d.getVar("PN")
 
-    def add_license_text(name):
-        nonlocal objset
-        nonlocal simple_license_text
-
-        if name in simple_license_text:
-            return simple_license_text[name]
-
-        for o in [objset] + search_objsets:
-            lic = o.find_filter(
-                oe.spdx30.simplelicensing_SimpleLicensingText,
-                name=name,
-            )
-
-            if lic is not None:
-                simple_license_text[name] = lic
-                return lic
-
-        lic = objset.add(
-            oe.spdx30.simplelicensing_SimpleLicensingText(
-                _id=objset.new_spdxid("license-text", name),
-                creationInfo=objset.doc.creationInfo,
-                name=name,
-            )
-        )
-        objset.set_element_alias(lic)
-        simple_license_text[name] = lic
-
-        if name == "PD":
-            lic.simplelicensing_licenseText = "Software released to the public domain"
-            return lic
-
-        # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PATH
-        for directory in [d.getVar("COMMON_LICENSE_DIR")] + (
-            d.getVar("LICENSE_PATH") or ""
-        ).split():
-            try:
-                with (Path(directory) / name).open(errors="replace") as f:
-                    lic.simplelicensing_licenseText = f.read()
-                    return lic
-
-            except FileNotFoundError:
-                pass
-
-        # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be set
-        filename = d.getVarFlag("NO_GENERIC_LICENSE", name)
-        if filename:
-            filename = d.expand("${S}/" + filename)
-            with open(filename, errors="replace") as f:
-                lic.simplelicensing_licenseText = f.read()
-                return lic
-        else:
-            bb.fatal("Cannot find any text for license %s" % name)
-
-    def convert(l):
+    def walk_license(node):
         nonlocal license_text_map
 
-        if l == "(" or l == ")":
-            return l
-
-        if l == "&":
-            return "AND"
-
-        if l == "|":
-            return "OR"
-
-        if l == "CLOSED":
-            return "NONE"
+        if isinstance(node, oe.spdx_license.LicenseRef):
+            if node.ident not in license_text_map:
+                lic = None
+                for o in [objset] + search_objsets:
+                    lic = o.find_filter(
+                        oe.spdx30.simplelicensing_SimpleLicensingText,
+                        name=node.name,
+                    )
+                    if lic:
+                        break
 
-        spdx_license = d.getVarFlag("SPDXLICENSEMAP", l) or l
-        if spdx_license in license_data["licenses"]:
-            return spdx_license
+                if lic is None:
+                    p, _ = oe.license.get_license_path(d, node)
+                    if p is None:
+                        bb.fatal(f"{pn}: No generic license file exists for: {node.ident} in any provider")
+                        return
+
+                    with open(p, errors="replace") as f:
+                        lic_text = f.read()
+
+                    lic = objset.add(
+                        oe.spdx30.simplelicensing_SimpleLicensingText(
+                            _id=objset.new_spdxid("license-text", node.name),
+                            creationInfo=objset.doc.creationInfo,
+                            name=node.name,
+                            simplelicensing_licenseText=lic_text,
+                        )
+                    )
+                    objset.set_element_alias(lic)
 
-        spdx_license = "LicenseRef-" + l
-        if spdx_license not in license_text_map:
-            license_text_map[spdx_license] = oe.sbom30.get_element_link_id(
-                add_license_text(l)
-            )
+                license_text_map[node.ident] = lic
 
-        return spdx_license
+        for child in node.children:
+            walk_license(child)
 
-    lic_split = (
-        license_expression.replace("(", " ( ")
-        .replace(")", " ) ")
-        .replace("|", " | ")
-        .replace("&", " & ")
-        .split()
-    )
-    spdx_license_expression = " ".join(convert(l) for l in lic_split)
+    s = oe.license.parse_legacy_license(d, license_expression)
+    if s is None:
+        return None
 
-    o = objset.new_license_expression(
-        spdx_license_expression, license_data, license_text_map
-    )
+    o = objset.new_license_expression(s.to_string(), license_data, license_text_map)
     objset.set_element_alias(o)
     return o
 
@@ -862,11 +815,18 @@ def create_spdx(d):
     recipe_spdx_license = add_license_expression(
         d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
     )
-    build_objset.new_relationship(
-        source_files,
-        oe.spdx30.RelationshipType.hasDeclaredLicense,
-        [oe.sbom30.get_element_link_id(recipe_spdx_license)],
-    )
+    if recipe_spdx_license:
+        build_objset.new_relationship(
+            source_files,
+            oe.spdx30.RelationshipType.hasDeclaredLicense,
+            [oe.sbom30.get_element_link_id(recipe_spdx_license)],
+        )
+    else:
+        build_objset.new_relationship(
+            source_files,
+            oe.spdx30.RelationshipType.hasDeclaredLicense,
+            None,
+        )
 
     dep_sources = {}
     if oe.spdx_common.process_sources(d) and include_sources:
@@ -1022,11 +982,18 @@ def create_spdx(d):
             else:
                 package_spdx_license = recipe_spdx_license
 
-            pkg_objset.new_relationship(
-                [spdx_package],
-                oe.spdx30.RelationshipType.hasDeclaredLicense,
-                [oe.sbom30.get_element_link_id(package_spdx_license)],
-            )
+            if package_spdx_license:
+                pkg_objset.new_relationship(
+                    [spdx_package],
+                    oe.spdx30.RelationshipType.hasDeclaredLicense,
+                    [oe.sbom30.get_element_link_id(package_spdx_license)],
+                )
+            else:
+                pkg_objset.new_relationship(
+                    [spdx_package],
+                    oe.spdx30.RelationshipType.hasDeclaredLicense,
+                    None,
+                )
 
             # Add concluded license relationship if manually set
             # Only add when license analysis has been explicitly performed
@@ -1037,12 +1004,12 @@ def create_spdx(d):
                 concluded_spdx_license = add_license_expression(
                     d, build_objset, concluded_license_str, license_data
                 )
-
-                pkg_objset.new_relationship(
-                    [spdx_package],
-                    oe.spdx30.RelationshipType.hasConcludedLicense,
-                    [oe.sbom30.get_element_link_id(concluded_spdx_license)],
-                )
+                if concluded_spdx_license:
+                    pkg_objset.new_relationship(
+                        [spdx_package],
+                        oe.spdx30.RelationshipType.hasConcludedLicense,
+                        [oe.sbom30.get_element_link_id(concluded_spdx_license)],
+                    )
 
             bb.debug(1, "Adding package files to SPDX for package %s" % pkg_name)
             package_files, excluded_files = add_package_files(
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 12f4d14f16..5467640cdd 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -96,7 +96,7 @@ class IncompatibleLicenseTests(OESelftestTestCase):
     # Verify that a package with a non-SPDX license cannot be built when
     # INCOMPATIBLE_LICENSE contains this license
     def test_incompatible_nonspdx_license(self):
-        self.lic_test('incompatible-nonspdx-license', 'FooLicense', 'FooLicense')
+        self.lic_test('incompatible-nonspdx-license', 'LicenseRef-FooLicense', 'LicenseRef-FooLicense')
 
 class IncompatibleLicensePerImageTests(OESelftestTestCase):
     def default_config(self):
@@ -104,6 +104,7 @@ class IncompatibleLicensePerImageTests(OESelftestTestCase):
 IMAGE_INSTALL:append = " bash"
 INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove = "tar"
+NO_GENERIC_LICENSE[SomeLicense] = "COPYING"
 """
 
     def test_bash_default(self):
@@ -116,7 +117,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove = "tar"
 
     def test_bash_and_license(self):
         self.disable_class("create-spdx")
-        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " & SomeLicense"\nERROR_QA:remove:pn-bash = "license-exists"')
+        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " AND LicenseRef-SomeLicense"\nERROR_QA:remove:pn-bash = "license-exists"')
         error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Some packages cannot be installed into the image because they have incompatible licenses:\n\tbash (GPL-3.0-or-later)"
 
         result = bitbake('core-image-minimal', ignore_status=True)
@@ -125,7 +126,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS:remove = "tar"
 
     def test_bash_or_license(self):
         self.disable_class("create-spdx")
-        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " | SomeLicense"\nERROR_QA:remove:pn-bash = "license-exists"\nERROR_QA:remove:pn-core-image-minimal = "license-file-missing"')
+        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " OR LicenseRef-SomeLicense"\nERROR_QA:remove:pn-bash = "license-exists"\nERROR_QA:remove:pn-core-image-minimal = "license-file-missing"')
 
         bitbake('core-image-minimal')
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
index 49b28951f7..33a08ada67 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -6,14 +6,8 @@
 
 from unittest.case import TestCase
 import oe.license
+import oe.spdx_license
 
-class SeenVisitor(oe.license.LicenseVisitor):
-    def __init__(self):
-        self.seen = []
-        oe.license.LicenseVisitor.__init__(self)
-
-    def visit_Constant(self, node):
-        self.seen.append(node.value)
 
 class TestSingleLicense(TestCase):
     licenses = [
@@ -22,84 +16,266 @@ class TestSingleLicense(TestCase):
         "Artistic-1.0",
         "MIT",
         "GPL-3.0-or-later",
-        "FOO_BAR",
+        "LicenseRef-FOO-BAR",
     ]
     invalid_licenses = ["GPL/BSD"]
 
     @staticmethod
     def parse(licensestr):
-        visitor = SeenVisitor()
-        visitor.visit_string(licensestr)
-        return visitor.seen
+        return oe.spdx_license.parse(licensestr)
 
     def test_single_licenses(self):
         for license in self.licenses:
-            licenses = self.parse(license)
-            self.assertListEqual(licenses, [license])
+            n = oe.spdx_license.parse(license)
+            self.assertListEqual([n.ident], [license])
 
     def test_invalid_licenses(self):
         for license in self.invalid_licenses:
-            with self.assertRaises(oe.license.InvalidLicense) as cm:
-                self.parse(license)
-            self.assertEqual(cm.exception.license, license)
+            with self.assertRaises(oe.spdx_license.ParseError) as cm:
+                oe.spdx_license.parse(license)
+            self.assertEqual(cm.exception.expression, license)
+
 
 class TestSimpleCombinations(TestCase):
-    tests = {
-        "FOO&BAR": ["FOO", "BAR"],
-        "BAZ & MOO": ["BAZ", "MOO"],
-        "ALPHA|BETA": ["ALPHA"],
-        "BAZ&MOO|FOO": ["FOO"],
-        "FOO&BAR|BAZ": ["FOO", "BAR"],
-    }
-    preferred = ["ALPHA", "FOO", "BAR"]
+    tests = [
+        (
+            "LicenseRef-FOO AND LicenseRef-BAR",
+            ["LicenseRef-FOO", "LicenseRef-BAR"],
+        ),
+        (
+            "LicenseRef-BAZ AND LicenseRef-MOO",
+            ["LicenseRef-BAZ", "LicenseRef-MOO"],
+        ),
+        (
+            "LicenseRef-ALPHA OR LicenseRef-BETA",
+            ["LicenseRef-ALPHA"],
+        ),
+        (
+            "LicenseRef-BAZ AND LicenseRef-MOO OR LicenseRef-FOO",
+            ["LicenseRef-FOO"],
+        ),
+        (
+            "LicenseRef-FOO AND LicenseRef-BAR OR LicenseRef-BAZ",
+            ["LicenseRef-FOO", "LicenseRef-BAR"],
+        ),
+    ]
+    preferred = ["LicenseRef-ALPHA", "LicenseRef-FOO", "LicenseRef-BAR"]
 
     def test_tests(self):
         def choose(a, b):
+            print(a, b)
             if all(lic in self.preferred for lic in b):
                 return b
             else:
                 return a
 
-        for license, expected in self.tests.items():
-            licenses = oe.license.flattened_licenses(license, choose)
+        for license, expected in self.tests:
+            licenses = oe.license.flattened_licenses(None, license, choose)
             self.assertListEqual(licenses, expected)
 
+
 class TestComplexCombinations(TestSimpleCombinations):
-    tests = {
-        "FOO & (BAR | BAZ)&MOO": ["FOO", "BAR", "MOO"],
-        "(ALPHA|(BETA&THETA)|OMEGA)&DELTA": ["OMEGA", "DELTA"],
-        "((ALPHA|BETA)&FOO)|BAZ": ["BETA", "FOO"],
-        "(GPL-2.0-only|Proprietary)&BSD-4-clause&MIT": ["GPL-2.0-only", "BSD-4-clause", "MIT"],
-    }
-    preferred = ["BAR", "OMEGA", "BETA", "GPL-2.0-only"]
+    tests = [
+        (
+            "LicenseRef-FOO AND (LicenseRef-BAR OR LicenseRef-BAZ) AND LicenseRef-MOO",
+            ["LicenseRef-FOO", "LicenseRef-BAR", "LicenseRef-MOO"],
+        ),
+        (
+            "(LicenseRef-ALPHA OR (LicenseRef-BETA AND LicenseRef-THETA) OR LicenseRef-OMEGA) AND LicenseRef-DELTA",
+            ["LicenseRef-OMEGA", "LicenseRef-DELTA"],
+        ),
+        (
+            "((LicenseRef-ALPHA OR LicenseRef-BETA) AND LicenseRef-FOO) OR LicenseRef-BAZ",
+            ["LicenseRef-BETA", "LicenseRef-FOO"],
+        ),
+        (
+            "(GPL-2.0-only OR LicenseRef-Proprietary) AND BSD-4-clause AND MIT",
+            ["GPL-2.0-only", "BSD-4-Clause", "MIT"],
+        ),
+    ]
+    preferred = [
+        "LicenseRef-BAR",
+        "LicenseRef-OMEGA",
+        "LicenseRef-BETA",
+        "GPL-2.0-only",
+    ]
+
 
 class TestIsIncluded(TestCase):
-    tests = {
-        ("FOO | BAR", None, None):
-            [True, ["FOO"]],
-        ("FOO | BAR", None, "FOO"):
-            [True, ["BAR"]],
-        ("FOO | BAR", "BAR", None):
-            [True, ["BAR"]],
-        ("FOO | BAR & FOOBAR", "*BAR", None):
-            [True, ["BAR", "FOOBAR"]],
-        ("FOO | BAR & FOOBAR", None, "FOO*"):
-            [False, ["FOOBAR"]],
-        ("(FOO | BAR) & FOOBAR | BARFOO", None, "FOO"):
-            [True, ["BAR", "FOOBAR"]],
-        ("(FOO | BAR) & FOOBAR | BAZ & MOO & BARFOO", None, "FOO"):
-            [True, ["BAZ", "MOO", "BARFOO"]],
-        ("GPL-3.0-or-later & GPL-2.0-only & LGPL-2.1-only | Proprietary", None, None):
-            [True, ["GPL-3.0-or-later", "GPL-2.0-only", "LGPL-2.1-only"]],
-        ("GPL-3.0-or-later & GPL-2.0-only & LGPL-2.1-only | Proprietary", None, "GPL-3.0-or-later"):
-            [True, ["Proprietary"]],
-        ("GPL-3.0-or-later & GPL-2.0-only & LGPL-2.1-only | Proprietary", None, "GPL-3.0-or-later Proprietary"):
-            [False, ["GPL-3.0-or-later"]]
-    }
+    tests = [
+        (
+            "LicenseRef-FOO OR LicenseRef-BAR",
+            None,
+            None,
+            True,
+            ["LicenseRef-FOO"],
+        ),
+        (
+            "LicenseRef-FOO OR LicenseRef-BAR",
+            None,
+            "LicenseRef-FOO",
+            True,
+            ["LicenseRef-BAR"],
+        ),
+        (
+            "LicenseRef-FOO OR LicenseRef-BAR",
+            "LicenseRef-BAR",
+            None,
+            True,
+            ["LicenseRef-BAR"],
+        ),
+        (
+            "LicenseRef-FOO OR LicenseRef-BAR AND LicenseRef-FOOBAR",
+            "*BAR",
+            None,
+            True,
+            ["LicenseRef-BAR", "LicenseRef-FOOBAR"],
+        ),
+        (
+            "LicenseRef-FOO OR LicenseRef-BAR AND LicenseRef-FOOBAR",
+            None,
+            "LicenseRef-FOO*",
+            False,
+            ["LicenseRef-FOOBAR"],
+        ),
+        (
+            "(LicenseRef-FOO OR LicenseRef-BAR) AND LicenseRef-FOOBAR OR LicenseRef-BARFOO",
+            None,
+            "LicenseRef-FOO",
+            True,
+            ["LicenseRef-BAR", "LicenseRef-FOOBAR"],
+        ),
+        (
+            "(FOO OR BAR) AND FOOBAR OR BAZ AND MOO AND BARFOO",
+            None,
+            "FOO",
+            True,
+            ["LicenseRef-BAZ", "LicenseRef-MOO", "LicenseRef-BARFOO"],
+        ),
+        (
+            "GPL-3.0-or-later AND GPL-2.0-only AND LGPL-2.1-only OR Proprietary",
+            None,
+            None,
+            True,
+            ["GPL-3.0-or-later", "GPL-2.0-only", "LGPL-2.1-only"],
+        ),
+        (
+            "GPL-3.0-or-later AND GPL-2.0-only AND LGPL-2.1-only OR Proprietary",
+            None,
+            "GPL-3.0-or-later",
+            True,
+            ["LicenseRef-Proprietary"],
+        ),
+        (
+            "GPL-3.0-or-later AND GPL-2.0-only AND LGPL-2.1-only OR Proprietary",
+            None,
+            "GPL-3.0-or-later LicenseRef-Proprietary",
+            False,
+            ["GPL-3.0-or-later"],
+        ),
+    ]
 
     def test_tests(self):
-        for args, expected in self.tests.items():
-            is_included, licenses = oe.license.is_included(
-                args[0], (args[1] or '').split(), (args[2] or '').split())
-            self.assertEqual(is_included, expected[0])
-            self.assertListEqual(licenses, expected[1])
+        for (
+            expression,
+            include,
+            exclude,
+            expect_included,
+            expect_licenses,
+        ) in self.tests:
+            actual_included, actual_licenses = oe.license.is_included(
+                None,
+                expression,
+                (include or "").split(),
+                (exclude or "").split(),
+            )
+            self.assertEqual(actual_included, expect_included)
+            self.assertListEqual(actual_licenses, expect_licenses)
+
+
+class TestSort(TestCase):
+    tests = [
+        (
+            "MIT AND MIT",
+            "MIT",
+        ),
+        (
+            "MIT OR MIT",
+            "MIT",
+        ),
+        (
+            "MIT AND 0BSD",
+            "0BSD AND MIT",
+        ),
+        (
+            "MIT OR 0BSD",
+            "0BSD OR MIT",
+        ),
+        (
+            "(MIT AND 0BSD) AND (MIT AND 0BSD)",
+            "0BSD AND MIT",
+        ),
+        (
+            "(MIT AND 0BSD) OR (MIT AND GPL-3.0-or-later)",
+            "0BSD AND MIT OR GPL-3.0-or-later AND MIT",
+        ),
+        (
+            "(MIT OR 0BSD) AND (MIT OR GPL-3.0-or-later)",
+            "(0BSD OR MIT) AND (GPL-3.0-or-later OR MIT)",
+        ),
+        (
+            "(MIT AND 0BSD) AND (MIT AND GPL-3.0-or-later)",
+            "0BSD AND GPL-3.0-or-later AND MIT",
+        ),
+        (
+            "(MIT OR 0BSD) OR (MIT OR GPL-3.0-or-later)",
+            "0BSD OR GPL-3.0-or-later OR MIT",
+        ),
+        (
+            "((MIT OR 0BSD) OR MIT) OR GPL-3.0-or-later",
+            "0BSD OR GPL-3.0-or-later OR MIT",
+        ),
+        (
+            "MIT OR (0BSD OR (MIT OR GPL-3.0-or-later))",
+            "0BSD OR GPL-3.0-or-later OR MIT",
+        ),
+        (
+            "MIT OR (0BSD OR MIT) OR GPL-3.0-or-later",
+            "0BSD OR GPL-3.0-or-later OR MIT",
+        ),
+        (
+            "(MIT AND (0BSD OR MIT)) AND (0BSD AND GPL-3.0-or-later)",
+            "0BSD AND GPL-3.0-or-later AND MIT AND (0BSD OR MIT)",
+        ),
+        (
+            "(MIT OR (0BSD AND MIT)) OR (0BSD OR GPL-3.0-or-later)",
+            "0BSD AND MIT OR 0BSD OR GPL-3.0-or-later OR MIT",
+        ),
+        (
+            "(MIT AND ((0BSD OR MIT) AND LGPL-3.0-or-later)) AND (0BSD AND GPL-3.0-or-later)",
+            "0BSD AND GPL-3.0-or-later AND LGPL-3.0-or-later AND MIT AND (0BSD OR MIT)",
+        ),
+        (
+            "(MIT AND ((0BSD OR MIT) AND LGPL-3.0-or-later)) AND ((0BSD AND (0BSD OR MIT)) AND GPL-3.0-or-later)",
+            "0BSD AND GPL-3.0-or-later AND LGPL-3.0-or-later AND MIT AND (0BSD OR MIT)",
+        ),
+        (
+            # GPL-3.0-later is split across an otherwise sorted list; make sure
+            # it can be detected and merged
+            "(0BSD AND GPL-3.0-or-later) AND (GPL-3.0-or-later AND MIT)",
+            "0BSD AND GPL-3.0-or-later AND MIT",
+        ),
+        (
+            "GPL-3.0-or-later WITH GCC-exception-3.1 AND GPL-3.0-or-later WITH GCC-exception-3.1",
+            "GPL-3.0-or-later WITH GCC-exception-3.1",
+        ),
+        (
+            "GPL-3.0-or-later WITH GCC-exception-3.1 AND GPL-3.0-or-later",
+            "GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception-3.1",
+        ),
+    ]
+
+    def test_sort(self):
+        for expression, expected in self.tests:
+            actual = oe.spdx_license.parse(expression).sort()
+            self.assertEqual(actual.to_string(), expected)
-- 
2.54.0


