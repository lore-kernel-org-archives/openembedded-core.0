Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 952FB7703A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 11:45:24 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so11657245wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OK+KlvuY/a95L+8F8pAIpygfy0fMosH/0elhL338X1s=;
	b=uizQdouVcpqBECJx6gF/P5BUIlaJIUjDO7ZIGgVcPR8HiYCXsOLI9QDtZp6j3VKgBt
	EvWt0JRl2r+KvrhdT4wGbAvzwLI1FpAPxWUTwDIPp6mRU+k/4+asHNHkb62SmlvrurYf
	bFTw/kUD1q8Wt5n746BzVgRwUe43wIzNTGiRpFTMP6c6LXgYX19X2yqBhQUsYPbeNKJ6
	kzL6UG0PzoxkwwHK8/COAR8C8F0B27xyYV1KmQ3l2JE3VgdpukltdTvZxY4O1wtZfhPi
	U+5q/uZCb73i8Riq0biOs2Th2ov7z8U0JNuB9bpQV6kyxLYeAE32mMyOGR+3rjvgc9He
	Yk9A==
X-Received: by 10.194.94.71 with SMTP id da7mr28250766wjb.8.1443527125076;
	Tue, 29 Sep 2015 04:45:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l1sm23511395wjx.13.2015.09.29.04.45.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Sep 2015 04:45:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 13:45:59 +0200
Message-Id: <1443527159-27494-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
Subject: [dizzy][PATCH] sstate: run recipe-provided hooks outside of ${B}
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
X-List-Received-Date: Tue, 29 Sep 2015 11:45:27 -0000

From: Ross Burton <ross.burton@intel.com>

To avoid races between the sstate tasks/hooks using ${B} as the cwd, and other
tasks such as cmake_do_configure which deletes and re-creates ${B}, ensure that
all sstate hooks are run in the right directory, and run the prefunc/postfunc in WORKDIR.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f17db0b..9128ada 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -42,16 +42,6 @@ EXTRA_STAGING_FIXMES ?= ""
 
 SIGGEN_LOCKEDSIGS_CHECK_LEVEL ?= 'error'
 
-# Specify dirs in which the shell function is executed and don't use ${B}
-# as default dirs to avoid possible race about ${B} with other task.
-sstate_create_package[dirs] = "${SSTATE_BUILDDIR}"
-sstate_unpack_package[dirs] = "${SSTATE_INSTDIR}"
-
-# Do not run sstate_hardcode_path() in ${B}:
-# the ${B} maybe removed by cmake_do_configure() while
-# sstate_hardcode_path() running.
-sstate_hardcode_path[dirs] = "${SSTATE_BUILDDIR}"
-
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'))
@@ -144,6 +134,8 @@ def sstate_install(ss, d):
     shareddirs = []
     bb.utils.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
 
+    sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
+
     d2 = d.createCopy()
     extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
     if extrainf:
@@ -237,7 +229,8 @@ def sstate_install(ss, d):
             oe.path.copyhardlinktree(state[1], state[2])
 
     for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
-        bb.build.exec_func(postinst, d)
+        # All hooks should run in the SSTATE_INSTDIR
+        bb.build.exec_func(postinst, d, (sstateinst,))
 
     for lock in locks:
         bb.utils.unlockfile(lock)
@@ -273,7 +266,8 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_PKG', sstatepkg)
 
     for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
-        bb.build.exec_func(f, d)
+        # All hooks should run in the SSTATE_INSTDIR
+        bb.build.exec_func(f, d, (sstateinst,))
 
     for state in ss['dirs']:
         prepdir(state[1])
@@ -545,8 +539,9 @@ def sstate_package(ss, d):
 
     for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + ['sstate_create_package'] + \
              (d.getVar('SSTATEPOSTCREATEFUNCS', True) or '').split():
-        bb.build.exec_func(f, d)
-  
+        # All hooks should run in SSTATE_BUILDDIR.
+        bb.build.exec_func(f, d, (sstatebuild,))
+
     bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
 
     return
@@ -604,19 +599,22 @@ python sstate_task_prefunc () {
     shared_state = sstate_state_fromvars(d)
     sstate_clean(shared_state, d)
 }
+sstate_task_prefunc[dirs] = "${WORKDIR}"
 
 python sstate_task_postfunc () {
     shared_state = sstate_state_fromvars(d)
+
     sstate_install(shared_state, d)
     for intercept in shared_state['interceptfuncs']:
-        bb.build.exec_func(intercept, d)
+        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR", True),))
     omask = os.umask(002)
     if omask != 002:
        bb.note("Using umask 002 (not %0o) for sstate packaging" % omask)
     sstate_package(shared_state, d)
     os.umask(omask)
 }
-  
+sstate_task_postfunc[dirs] = "${WORKDIR}"
+
 
 #
 # Shell function to generate a sstate package from a directory
-- 
2.6.0


