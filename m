Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6A81477025
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 11:45:01 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so11641981wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pVivabSDTGvCEP7QobTEQx7vznTebgC9Myxrs16LPMo=;
	b=xlCfiEdpFh33efl+i3jfNWCAAmrbHQFHhjYI9quK3OC1E7cDGsjVDs5iel/New3oEE
	vOlz5fTcUyR4mmNbWpJG9VT3xC65X4g3mzfkuKG4Rcv4wCHqq/oRpSty30FHIWt1bON4
	ZQ2toRUw1fT8WZUDYK5WNZBXww1k7eIfY/3GikgEv5aM74VZMlHEGKCSv3CpE3dsfC1+
	ok2DFfz1stmHHmstQHgpGWo69isLbpg14uJvLq2w2yyW7+oeHC7wTOR63fA1D7WCJuf+
	LMeVu8ALSaGWofuEpBZ40L0YB34CC6IXI28XYvW8kSmZ3DWZrMQDANQGmEEQ5uSMoH9Z
	89hw==
X-Received: by 10.194.190.75 with SMTP id go11mr27027710wjc.80.1443527101014; 
	Tue, 29 Sep 2015 04:45:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jq3sm10127034wjb.26.2015.09.29.04.44.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Sep 2015 04:44:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 13:45:36 +0200
Message-Id: <1443527136-27370-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
Subject: [PATCH][fido] sstate: run recipe-provided hooks outside of ${B}
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
X-List-Received-Date: Tue, 29 Sep 2015 11:45:06 -0000

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
index a710305..5c81a1c 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -44,16 +44,6 @@ EXTRA_STAGING_FIXMES ?= ""
 
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
@@ -146,6 +136,8 @@ def sstate_install(ss, d):
     shareddirs = []
     bb.utils.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
 
+    sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
+
     d2 = d.createCopy()
     extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
     if extrainf:
@@ -239,7 +231,8 @@ def sstate_install(ss, d):
             oe.path.copyhardlinktree(state[1], state[2])
 
     for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
-        bb.build.exec_func(postinst, d)
+        # All hooks should run in the SSTATE_INSTDIR
+        bb.build.exec_func(postinst, d, (sstateinst,))
 
     for lock in locks:
         bb.utils.unlockfile(lock)
@@ -275,7 +268,8 @@ def sstate_installpkg(ss, d):
     d.setVar('SSTATE_PKG', sstatepkg)
 
     for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
-        bb.build.exec_func(f, d)
+        # All hooks should run in the SSTATE_INSTDIR
+        bb.build.exec_func(f, d, (sstateinst,))
 
     for state in ss['dirs']:
         prepdir(state[1])
@@ -547,8 +541,9 @@ def sstate_package(ss, d):
 
     for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + ['sstate_create_package'] + \
              (d.getVar('SSTATEPOSTCREATEFUNCS', True) or '').split():
-        bb.build.exec_func(f, d)
-  
+        # All hooks should run in SSTATE_BUILDDIR.
+        bb.build.exec_func(f, d, (sstatebuild,))
+
     bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
 
     return
@@ -606,19 +601,22 @@ python sstate_task_prefunc () {
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


