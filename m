Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1946BC3D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 13:45:03 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id b11so3699925wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 05:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3RhIN8bET13UosO8eB9hz67OvGRyY7bAUgstbgGhhZ8=;
	b=gsfo4h71dbqt+o85gIOj9ZxqP2CD8VeKn7nGk9vVwseZoAD72kRPh9FqKdzvI3Tyq/
	jCx30wbTq2uXYUpHLVdVc9YGDQl0UiDfNAXH6vMGWbN7yy/rUpvu2h8wl+aM4i+C1+ZV
	14w5Db7wKXfLQ5u/IsnzgDijVEgjk8UIIQ0Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3RhIN8bET13UosO8eB9hz67OvGRyY7bAUgstbgGhhZ8=;
	b=tY9EAKqiHVhFgPJH+roVvVCnlyNoRgjGIXanSskqbjwmsb0LsRpDH/Y5BMB44SjUMz
	mH8m/vIoOTLgXQpgxYBDmG3uCvHgEwHWZLki/I3g9aBe2JKlCTaIp11jW5MTHFA4wx40
	4v2EWHWAP3hNM7XLQ1eIjc/jtMqu2NyNao+d8MHaHdXyJPdnmtJiBqWerzpcusQTl+fh
	K1yK1JSW5eY9P3vRTjpRCUjstPMh+6+XlGq182eDO+ZB1F/ZVliJXOQs9giy9B/cnNvg
	Xcf/SRwTTWwGSZWD1TKRBh3x4OA0sbRyWjaZ2yrb96hEelvZxaydg5GyUqwl18erhHkG
	866w==
X-Gm-Message-State: AHQUAubIe+RlJDVfthg3hHA0cWalvCzw8MUT0Oc1+aR+BYx4ScEP6xxv
	qqErErUNBvA/aJj6/H1hOFQKJ62+7eI=
X-Google-Smtp-Source: AHgI3IamaQAEPAWk88JK6Le7simXFREGjqIUIyKT34jybopOUS67wvvrCuW2XjzCkL6jGB34oS5Rsg==
X-Received: by 2002:a1c:27c6:: with SMTP id n189mr3755478wmn.108.1549374303365;
	Tue, 05 Feb 2019 05:45:03 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s3sm11297389wmj.23.2019.02.05.05.45.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 05:45:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 13:44:59 +0000
Message-Id: <20190205134459.29230-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205134459.29230-1-richard.purdie@linuxfoundation.org>
References: <20190205134459.29230-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] archiver/package_rpm: Drop srpm source archiver mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2019 13:45:03 -0000
Content-Transfer-Encoding: 8bit

Creating these 'srpms' misleads users into thinking there is a way of
rebuilding the package when there isn't. They amount to a glorified
tarball. Worse, the code is full of races. In particular, do_package_write_rpm
is writing out files outside of its sstate meaning the source archives
may sometimes appear and sometimes disappear.

In my view the simplest way of dealing with this is to admit these are not
source rpms and stop creating them. The tarballs from the source archiver
are perfectly reasonable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/archiver.bbclass                | 24 +----------
 meta/classes/package_rpm.bbclass             | 43 --------------------
 meta/lib/oeqa/selftest/cases/archiver.py     | 13 ------
 meta/lib/oeqa/selftest/cases/buildoptions.py | 15 -------
 4 files changed, 2 insertions(+), 93 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index e321a0e3621..772b10a412a 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -12,14 +12,12 @@
 # 5) The environment data, similar to 'bitbake -e recipe':
 #    ARCHIVER_MODE[dumpdata] = "1"
 # 6) The recipe (.bb and .inc): ARCHIVER_MODE[recipe] = "1"
-# 7) Whether output the .src.rpm package:
-#    ARCHIVER_MODE[srpm] = "1"
-# 8) Filter the license, the recipe whose license in
+# 7) Filter the license, the recipe whose license in
 #    COPYLEFT_LICENSE_INCLUDE will be included, and in
 #    COPYLEFT_LICENSE_EXCLUDE will be excluded.
 #    COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
 #    COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
-# 9) The recipe type that will be archived:
+# 8) The recipe type that will be archived:
 #    COPYLEFT_RECIPE_TYPES = 'target'
 #
 
@@ -27,7 +25,6 @@
 COPYLEFT_RECIPE_TYPES ?= 'target native nativesdk cross crosssdk cross-canadian'
 inherit copyleft_filter
 
-ARCHIVER_MODE[srpm] ?= "0"
 ARCHIVER_MODE[src] ?= "patched"
 ARCHIVER_MODE[diff] ?= "0"
 ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
@@ -112,23 +109,6 @@ python () {
 
     if ar_recipe == "1":
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_recipe' % pn)
-
-    # Output the SRPM package
-    if d.getVarFlag('ARCHIVER_MODE', 'srpm') == "1" and d.getVar('PACKAGES'):
-        if "package_rpm" in d.getVar('PACKAGE_CLASSES'):
-            d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_package_write_rpm' % pn)
-            if ar_dumpdata == "1":
-                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_dumpdata' % pn)
-            if ar_recipe == "1":
-                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_recipe' % pn)
-            if ar_src == "original":
-                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_original' % pn)
-            elif ar_src == "patched":
-                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_patched' % pn)
-            elif ar_src == "configured":
-                d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_configured' % pn)
-        else:
-            bb.fatal("ARCHIVER_MODE[srpm] needs package_rpm in PACKAGE_CLASSES")
 }
 
 # Take all the sources for a recipe and puts them in WORKDIR/archiver-work/.
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 5dafb3e7cb6..72fb2f602e6 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -97,34 +97,6 @@ def write_rpm_perfiledata(srcname, d):
 python write_specfile () {
     import oe.packagedata
 
-    # append information for logs and patches to %prep
-    def add_prep(d,spec_files_bottom):
-        if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
-            spec_files_bottom.append('%%prep -n %s' % d.getVar('PN') )
-            spec_files_bottom.append('%s' % "echo \"include logs and patches, Please check them in SOURCES\"")
-            spec_files_bottom.append('')
-
-    # append the name of tarball to key word 'SOURCE' in xxx.spec.
-    def tail_source(d):
-        if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
-            ar_outdir = d.getVar('ARCHIVER_OUTDIR')
-            if not os.path.exists(ar_outdir):
-                return
-            source_list = os.listdir(ar_outdir)
-            source_number = 0
-            for source in source_list:
-                # do_deploy_archives may have already run (from sstate) meaning a .src.rpm may already 
-                # exist in ARCHIVER_OUTDIR so skip if present.
-                if source.endswith(".src.rpm"):
-                    continue
-                # The rpmbuild doesn't need the root permission, but it needs
-                # to know the file's user and group name, the only user and
-                # group in fakeroot is "root" when working in fakeroot.
-                f = os.path.join(ar_outdir, source)
-                os.chown(f, 0, 0)
-                spec_preamble_top.append('Source%s: %s' % (source_number, source))
-                source_number += 1
-
     # In RPM, dependencies are of the format: pkg <>= Epoch:Version-Release
     # This format is similar to OE, however there are restrictions on the
     # characters that can be in a field.  In the Version field, "-"
@@ -386,11 +358,6 @@ python write_specfile () {
 
         # Gather special src/first package data
         if srcname == splitname:
-            archiving = d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and \
-                        bb.data.inherits_class('archiver', d)
-            if archiving and srclicense != splitlicense:
-                bb.warn("The SRPM produced may not have the correct overall source license in the License tag. This is due to the LICENSE for the primary package and SRPM conflicting.")
-
             srclicense     = splitlicense
             srcrdepends    = splitrdepends
             srcrrecommends = splitrrecommends
@@ -515,7 +482,6 @@ python write_specfile () {
 
         del localdata
     
-    add_prep(d,spec_files_bottom)
     spec_preamble_top.append('Summary: %s' % srcsummary)
     spec_preamble_top.append('Name: %s' % srcname)
     spec_preamble_top.append('Version: %s' % srcversion)
@@ -529,7 +495,6 @@ python write_specfile () {
         spec_preamble_top.append('URL: %s' % srchomepage)
     if srccustomtagschunk:
         spec_preamble_top.append(srccustomtagschunk)
-    tail_source(d)
 
     # Replaces == Obsoletes && Provides
     robsoletes = bb.utils.explode_dep_versions2(srcrobsoletes or "")
@@ -692,14 +657,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
-    if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
-        cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
-        cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR') + "'"
-        cmdsrpm = cmdsrpm + " -bs " + outspecfile
-        # Build the .src.rpm
-        d.setVar('SBUILDSPEC', cmdsrpm + "\n")
-        d.setVarFlag('SBUILDSPEC', 'func', '1')
-        bb.build.exec_func('SBUILDSPEC', d)
     cmd = cmd + " -bb " + outspecfile
 
     # rpm 4 creates various empty directories in _topdir, let's clean them up
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 0a6d4e325fb..f61a5220178 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -116,16 +116,3 @@ class Archiver(OESelftestTestCase):
 
         excluded_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[1]))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % target_recipes[1])
-
-
-
-    def test_archiver_srpm_mode(self):
-        """
-        Test that in srpm mode, the added recipe dependencies at least exist/work [YOCTO #11121]
-        """
-
-        features = 'INHERIT += "archiver"\n'
-        features += 'ARCHIVER_MODE[srpm] = "1"\n'
-        self.write_config(features)
-
-        bitbake('-n core-image-sato')
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 6a18eb83665..a7b2b13a98b 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -152,21 +152,6 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
-class ArchiverTest(OESelftestTestCase):
-    @OETestID(926)
-    def test_arch_work_dir_and_export_source(self):
-        """
-        Test for archiving the work directory and exporting the source files.
-        """
-        self.write_config("INHERIT += \"archiver\"\nARCHIVER_MODE[src] = \"original\"\nARCHIVER_MODE[srpm] = \"1\"")
-        res = bitbake("xcursor-transparent-theme", ignore_status=True)
-        self.assertEqual(res.status, 0, "\nCouldn't build xcursortransparenttheme.\nbitbake output %s" % res.output)
-        deploy_dir_src = get_bb_var('DEPLOY_DIR_SRC')
-        pkgs_path = g.glob(str(deploy_dir_src) + "/allarch*/xcurs*")
-        src_file_glob = str(pkgs_path[0]) + "/xcursor*.src.rpm"
-        tar_file_glob = str(pkgs_path[0]) + "/xcursor*.tar.gz"
-        self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/allarch*/xcursor*" % deploy_dir_src)
-
 class ToolchainOptions(OESelftestTestCase):
 
     def test_toolchain_fortran(self):
-- 
2.20.1


