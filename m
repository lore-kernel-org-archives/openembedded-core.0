Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id C5AEF78F6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 14:44:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id r10-v6so1559065edp.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qQL5rGeubs/mfWACC+pWvtUOXmm19EQNQ225LNAg9VA=;
	b=MZHcmWGitPHfOupOVvLmyJhh3s1qtjYuDHmwGdVr1p83ACQmOaIAGYBTRBFE7LV/T9
	CHSfaT/XfAZVtoWsMiqHE7kHrDYIBugDbzm5xThU5fUHJ7k8qwaZbbEdQzo+fkkSmD8h
	kMtXWl8EqUDN0BVu2LS+Sna4e4lQUk3rP+DGJMNbzFrBU24wwJbDw8tzKfov3K8U/gG8
	nesVPYU5JupMjw9Q1enBWoRaJp49lRoYkdriXJa+mdIe5fyrk63aAJ3nUEwUrsh7XOHd
	2KSaoHGzUm2bwLP/MpPx7oIBfaaMgHKXSI+bvyAjv2kHVX6x36Mj8AiKr362JrzdLvdL
	5f/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qQL5rGeubs/mfWACC+pWvtUOXmm19EQNQ225LNAg9VA=;
	b=WcZzsVoU4mqT9huAxb9syxvuBIAY5bo/FxD9b0AArNcqNfRoBlr7WZRYSUqiWYU2ng
	aFxasgmRpAG99Qxdk2BxTmUWcM0gHmahuby7ybB/YgZP5zwTGyw1km0qhXXM6L+6OUq7
	nHJaNbDXG3dqi1yW1nCnEoEmgEsTUIHbsweyxW8J33Da7OpKZpJ8c+nop60aa5zDkxP7
	dxjiRWdZ7m8H2mcUPwgDmUNqo9ZkxXlltcUhNImzSapGuxH1yxc0sflRYCHi8UYr2Bl3
	TTtFzKJS1txVW/8A4+k8dEMEvtK3ytfpW2RNO+fWT1rssRDatncuwaCbxVBHT2e7xq5b
	FNew==
X-Gm-Message-State: APzg51A1bMPlfa3cjVr5TX8WVYUBG91VczLvZJZRIOCRDlClvNGg9bkO
	G2TIyfwhDonbCNGluX9urbBPY2sp
X-Google-Smtp-Source: ANB0VdYdXcEsgmHR2uBogjaodGgU/9aajG0s5a/TwnIDnF/g93iYU4AcQdTR5e1VNOZJ322eQyjH9g==
X-Received: by 2002:a50:8d5e:: with SMTP id
	t30-v6mr2871959edt.256.1535467447339; 
	Tue, 28 Aug 2018 07:44:07 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	g39-v6sm844865edg.63.2018.08.28.07.44.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 07:44:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 16:43:59 +0200
Message-Id: <1535467439-14475-2-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535467439-14475-1-git-send-email-alex.kanavin@gmail.com>
References: <1535467439-14475-1-git-send-email-alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] lib/oe/package_manager: turn postinst failure warnings into bitbake failures
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
X-List-Received-Date: Tue, 28 Aug 2018 14:44:07 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Sumo release provides a transition period so that deferrals to first boot
via 'exit 1' can be converted to pkg_postinst_ontarget(). For the next release
however, postinst script failures should be treated as such.

[YOCTO #12607]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py               | 22 +++++++---------------
 meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 3988388..a17de5d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -84,10 +84,10 @@ def opkg_query(cmd_output):
 
     return output
 
-# Note: this should be bb.fatal in the future.
-def failed_postinsts_warn(pkgs, log_path):
-    bb.warn("""Intentionally failing postinstall scriptlets of %s to defer them to first boot is deprecated. Please place them into pkg_postinst_ontarget_${PN} ().
-If deferring to first boot wasn't the intent, then scriptlet failure may mean an issue in the recipe, or a regression elsewhere.
+def failed_postinsts_abort(pkgs, log_path):
+    bb.fatal("""Postinstall scriptlets of %s have failed. If the intention is to defer them to first boot,
+then please place them into pkg_postinst_ontarget_${PN} ().
+Deferring to first boot via 'exit 1' is no longer supported.
 Details of the failure are in %s.""" %(pkgs, log_path))
 
 def generate_locale_archive(d, rootfs, target_arch, localedir):
@@ -858,9 +858,7 @@ class RpmPM(PackageManager):
                 failed_scriptlets_pkgnames[line.split()[-1]] = True
 
         if len(failed_scriptlets_pkgnames) > 0:
-            failed_postinsts_warn(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
-        for pkg in failed_scriptlets_pkgnames.keys():
-            self.save_rpmpostinst(pkg)
+            failed_postinsts_abort(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
 
     def remove(self, pkgs, with_dependencies = True):
         if len(pkgs) == 0:
@@ -1341,7 +1339,7 @@ class OpkgPM(OpkgDpkgPM):
                     bb.warn(line)
                     failed_pkgs.append(line.split(".")[0])
             if failed_pkgs:
-                failed_postinsts_warn(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
+                failed_postinsts_abort(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
         except subprocess.CalledProcessError as e:
             (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
                                               "Command '%s' returned %d:\n%s" %
@@ -1594,7 +1592,6 @@ class DpkgPM(OpkgDpkgPM):
         os.environ['INTERCEPT_DIR'] = self.intercepts_dir
         os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
-        failed_pkgs = []
         for pkg_name in installed_pkgs:
             for control_script in control_scripts:
                 p_full = os.path.join(info_dir, pkg_name + control_script.suffix)
@@ -1609,12 +1606,7 @@ class DpkgPM(OpkgDpkgPM):
                         bb.warn("%s for package %s failed with %d:\n%s" %
                                 (control_script.name, pkg_name, e.returncode,
                                     e.output.decode("utf-8")))
-                        failed_postinsts_warn([pkg_name], self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
-                        failed_pkgs.append(pkg_name)
-                        break
-
-        if len(failed_pkgs):
-            self.mark_packages("unpacked", failed_pkgs)
+                        failed_postinsts_abort([pkg_name], self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
 
     def update(self):
         os.environ['APT_CONFIG'] = self.apt_conf_file
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 30fd9b2..376c3c5 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -249,8 +249,8 @@ class Postinst(OESelftestTestCase):
                 features = 'CORE_IMAGE_EXTRA_INSTALL = "postinst-rootfs-failing"\n'
                 features += 'PACKAGE_CLASSES = "%s"\n' % classes
                 self.write_config(features)
-                bb_result = bitbake('core-image-minimal')
-                self.assertGreaterEqual(bb_result.output.find("Intentionally failing postinstall scriptlets of ['postinst-rootfs-failing'] to defer them to first boot is deprecated."), 0,
+                bb_result = bitbake('core-image-minimal', ignore_status=True)
+                self.assertGreaterEqual(bb_result.output.find("Postinstall scriptlets of ['postinst-rootfs-failing'] have failed."), 0,
                     "Warning about a failed scriptlet not found in bitbake output: %s" %(bb_result.output))
 
                 self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs-before-failure")),
-- 
2.7.4


