Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236C4C9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 01:46:28 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48336.1790559979101972435
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 18:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.53 with ESMTP; 28 Sep 2026 10:46:17 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.125 with ESMTP; 28 Sep 2026 10:46:17 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH 2/2] toolchain-scripts/meta-environment: use each variant's own site files
Date: Mon, 28 Sep 2026 10:46:13 +0900
Message-ID: <20260928014613.2399839-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928014613.2399839-1-mark.yang@lge.com>
References: <20260928014613.2399839-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 01:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246719

From: "mark.yang" <mark.yang@lge.com>

Compute TOOLCHAIN_CONFIGSITE_NOCACHE for TARGET_ARCH and TARGET_OS
instead of HOST_ARCH and HOST_OS, so each multilib variant's
site-config matches its own tune.

Commit 1e13d1fd22 ("meta-environment: ensure corret
TOOLCHAIN_CONFIGSITE_NOCACHE value") expanded the variable with :=
before cross-canadian changes HOST_ARCH to SDK_ARCH. Since then, every
multilib variant has used the default tune's site files.

On qemux86-64 with the multilib-x86-lib32 fragment, the lib32
site-config has:

  before: ac_cv_sizeof_long=${ac_cv_sizeof_long=8}
  after:  ac_cv_sizeof_long=${ac_cv_sizeof_long=4}

An i686 configure run that loads it uses the cached 8 instead of
running the compile test.

Drop the := as it is no longer needed. Collect
do_generate_content[file-checksums] with all_multilib_tune_values(),
as the [depends] flag does, instead of in an anonymous function that
covered one variant only.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 3 ++-
 meta/recipes-core/meta/meta-environment.bb    | 9 ++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index e971b9a270..fe7333afa2 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -213,7 +213,8 @@ EOF
 }
 
 #we get the cached site config in the runtime
-TOOLCHAIN_CONFIGSITE_NOCACHE = "${@' '.join(siteinfo_get_files(d)[0])}"
+# cross-canadian changes HOST_ARCH/HOST_OS to the SDK host
+TOOLCHAIN_CONFIGSITE_NOCACHE = "${@' '.join(siteinfo_get_files_for_machine(d.getVar('TARGET_ARCH'), d.getVar('TARGET_OS'), d)[0])}"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
 DEPENDS += "${TOOLCHAIN_NEED_CONFIGSITE_CACHE}"
 
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index f814061281..8162b70294 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -9,8 +9,6 @@ REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 inherit toolchain-scripts
 TOOLCHAIN_NEED_CONFIGSITE_CACHE:append = " zlib"
-# Need to expand here before cross-candian changes HOST_ARCH -> SDK_ARCH
-TOOLCHAIN_CONFIGSITE_NOCACHE := "${TOOLCHAIN_CONFIGSITE_NOCACHE}"
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
@@ -22,6 +20,8 @@ do_generate_content[cleandirs] = "${SDK_OUTPUT}"
 do_generate_content[dirs] = "${SDK_OUTPUT}/${SDKPATH}"
 # Need to ensure we have the virtual mappings and site files for all multtilib variants
 do_generate_content[depends] = "${@oe.utils.build_depends_string(oe.utils.all_multilib_tune_values(d, 'TOOLCHAIN_NEED_CONFIGSITE_CACHE'), 'do_populate_sysroot')}"
+TOOLCHAIN_CONFIGSITE_SEARCHED = "${@' '.join(siteinfo_get_files_for_machine(d.getVar('TARGET_ARCH'), d.getVar('TARGET_OS'), d)[1])}"
+do_generate_content[file-checksums] += "${@oe.utils.all_multilib_tune_values(d, 'TOOLCHAIN_CONFIGSITE_SEARCHED')}"
 python do_generate_content() {
     # Handle multilibs in the SDK environment, siteconfig, etc files...
     localdata = bb.data.createCopy(d)
@@ -46,11 +46,6 @@ python do_generate_content() {
 }
 addtask generate_content before do_install after do_compile
 
-python () {
-    sitefiles, searched = siteinfo_get_files(d, sysrootcache=False)
-    d.appendVarFlag("do_generate_content", "file-checksums", " " + " ".join(searched))
-}
-
 create_sdk_files() {
 	# Setup site file for external use
 	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}

