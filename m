Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE3473243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 14:18:52 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so194624471wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 07:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AkRc61PkAL+Gijy8WHAQwm+1qTf6cHSDvU3PFWjFIPs=;
	b=YfgWpGHOmjkMgDi7QoIRS/FSo1g2Z6OneJCEIyCN/GJfxUGIc4DU4shy9s2eRASJZt
	XfRg+WGZbfrDTA+/jehu/q3VhAkplPEt6vfsyey9csZbl6IvlF8Y9BeR7xxg5OFl65DV
	Sio8r7gqGV5Q87E/PM7YaMfqZ50RWDhnUi8O0USWaNxytE6/hJkuNa2og3eWCijs9+M3
	FTrbO327P9Ddrew60RsQlWjvcf6pOfYzpqhqN6Wb2NYAwBtKXPKHHnJpn/OfA23hhBnG
	ZksL+QHQcHg4iOs6L/vmyUF4ubiQlzOp6Dy3AbLfb2oCFppxej51qdo5fxJmN73RZh8w
	EJog==
X-Gm-Message-State: ALoCoQnMLBcLzdxalkA7WqDPkoEAL1oHzbUBDosi6LvfE31leztEnCGL3WrYu9OJHYImetJ8Qfc7
X-Received: by 10.180.187.142 with SMTP id fs14mr19543841wic.6.1442931531594; 
	Tue, 22 Sep 2015 07:18:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id go5sm3412054wib.3.2015.09.22.07.18.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Sep 2015 07:18:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 15:11:53 +0100
Message-Id: <1442931113-25056-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [RFC][PATCH] sstate: run recipe-provided hooks outside of ${B}
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
X-List-Received-Date: Tue, 22 Sep 2015 14:18:54 -0000

To avoid races between the sstate tasks/hooks using ${B} as the cwd, and other
tasks such as cmake_do_configure which deletes and re-creates ${B}, ensure that
all sstate hooks are run in the right directory, and run the prefunc/postfunc in WORKDIR.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b9ad6da..695929c 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -61,16 +61,6 @@ SSTATE_SIG_PASSPHRASE ?= ""
 # Whether to verify the GnUPG signatures when extracting sstate archives
 SSTATE_VERIFY_SIG ?= "0"
 
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
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
@@ -267,7 +257,7 @@ def sstate_install(ss, d):
             oe.path.copyhardlinktree(state[1], state[2])
 
     for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
-        bb.build.exec_func(postinst, d)
+        bb.build.exec_func(postinst, d, (os.getcwd(),))
 
     for lock in locks:
         bb.utils.unlockfile(lock)
@@ -307,7 +297,8 @@ def sstate_installpkg(ss, d):
             bb.warn("Cannot verify signature on sstate package %s" % sstatepkg)
 
     for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
-        bb.build.exec_func(f, d)
+        # All hooks should run in the SSTATE_INSTDIR
+        bb.build.exec_func(f, d, (sstateinst,))
 
     for state in ss['dirs']:
         prepdir(state[1])
@@ -579,8 +570,9 @@ def sstate_package(ss, d):
 
     for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + ['sstate_create_package'] + \
              (d.getVar('SSTATEPOSTCREATEFUNCS', True) or '').split():
-        bb.build.exec_func(f, d)
-  
+        # All hooks should run in SSTATE_BUILDDIR.
+        bb.build.exec_func(f, d, (sstatebuild,))
+
     bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
 
     return
@@ -642,19 +634,21 @@ python sstate_task_prefunc () {
     shared_state = sstate_state_fromvars(d)
     sstate_clean(shared_state, d)
 }
+sstate_task_prefunc[dirs] = "${WORKDIR}"
 
 python sstate_task_postfunc () {
     shared_state = sstate_state_fromvars(d)
     sstate_install(shared_state, d)
     for intercept in shared_state['interceptfuncs']:
-        bb.build.exec_func(intercept, d)
+        bb.build.exec_func(intercept, d, (os.getcwd(),))
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
2.1.4


