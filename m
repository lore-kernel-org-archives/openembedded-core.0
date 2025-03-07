Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72BAC282D0
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 08:48:37 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.web11.6976.1741337309961407158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 00:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=p+QxjkJP;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=M/4mFtNX;
 spf=pass (domain: zhukoff.net, ip: 103.168.172.146, mailfrom: pavel@zhukoff.net)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 409831382715;
	Fri,  7 Mar 2025 03:48:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 07 Mar 2025 03:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1741337309; x=1741423709; bh=DvHQREcZnYbaxGzSMhn38
	50IlqqyvXWQt9eNK46UU/o=; b=p+QxjkJPnLKFn/NvndNl8hYAHWHtYTzQefcRa
	YGJtbeu/97/p5ThQ2CzTDzC4SrMFUbmqnbtW9lIeCMMIZjVfVYBydipdo7ubm8hj
	rU1R2WPW8MlSoGrxTI4qzsWqbOs40nsW0LcItxAlpVmIACMU6d6nc7e5b36PPJO3
	qVOh0El0QR7TTPwFDu2bJFnaL5zfmtxBTfIyRnV8lpr4IGfF3YECsGWpOqdKye3Z
	EfOqFEyUVSEA2q/o+CuKzJrO1Sjw88yQ6ff+70qABGp4kQXHjQUkX44xPQ+VY07f
	7ps4jLrxodYVe7+FfJg4OzgulWJPzipjFkK6sRAScnl8KpJhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741337309; x=1741423709; bh=DvHQREcZnYbaxGzSMhn3850IlqqyvXWQt9e
	NK46UU/o=; b=M/4mFtNXZmOe89ZmKxf5ZgWPRakeH6NADncH47e3tFknJDy7gvJ
	z6IInQ1ICToRxiiqNygtKiemyw3KK/HvJiRc//ksc2wd/2DRM3wZaPjrvluZHBed
	XPbLvoGKLjD/o8z7MUnrsC3sGi43THGvcirE6g9+M4d/fNbiCRb3UMWJ3hHFoWYJ
	okaD9fvkzW4DpQAGEnwMJNVOujmOmsHh5RHsgzyF1KFshgH+/mvU64655B8rTVn/
	iHINuSZ9R9SKV7MTwkWKlCeCc81xwsNJ8bvcypdmLJc32JW5aT3i/2VaL3mf3heL
	g88ZNsh6KStFOGgJbg+et6O7t6gJeWskaYA==
X-ME-Sender: <xms:3bLKZx7rnXSZHLrfY19LxAsrcdP2AjxOCblxpT59HiJ7vGXDU-xKaA>
    <xme:3bLKZ-4rGJQxjexeXPDGiriT0Iw6SDNIw8Qmr247qof0ZxnlW21Wy2b0jZrpRErjL
    amVV1yzAIN7zRVaeE8>
X-ME-Received: <xmr:3bLKZ4fgiqCsnA-gdDYFUJ4cGCkFmtaubFX356e3OpoBasnKCCj5jq-u5QLHA8GYfat-rfhKA0THeiB7BiKq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcu
    oehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejke
    ejudegledtkeejhfettdefjeeuffehieekvddugfdtffffledvvdefhfenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukh
    hofhhfrdhnvghtpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmh
    gsvgguuggvugdrohhrghdprhgtphhtthhopehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:3bLKZ6JPMnRQhfTGu2wzHyUkMesO3xGip42SfzHXR1ges5IikCMGLQ>
    <xmx:3bLKZ1I4k87b010ex8EztRuIdAvssxeyjac3-XeLC6ktBPnFbudCgg>
    <xmx:3bLKZzxDx8HFFHToLndUrL1UJ4iXQrcdccYnZRMked989VGzU_XyxA>
    <xmx:3bLKZxIaLf5MMKDmcI-P11NQHrLo3LzraKFMeZrpJGYiW4iIbRL2JQ>
    <xmx:3bLKZ8U9mt9UrNB-zQJ6gk7VIn50QMXXvk-mMNpgwV-wuvZWmCMP0IfK>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Mar 2025 03:48:28 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v2] ovmf: Add OVMF_BUILD_TYPE to support debug builds
Date: Fri,  7 Mar 2025 09:48:21 +0100
Message-ID: <20250307084821.451112-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212417

In release mode, OVMF does not output any debug information to the QEMU port, making it extremely difficult to debug boot issues.
This commit introduces the OVMF_BUILD_TYPE variable (RELEASE|DEBUG) to enable debug mode.

Usage:
OVMF_BUILD_TYPE="DEBUG"
runqemu qemuparams="-debugcon file:debug.log -global isa-debugcon.iobase=0x402"

The OVMF debug console output will be written to debug.log.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 559c86b546..920944b713 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -67,6 +67,10 @@ OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLA
 
 export PYTHON_COMMAND = "${HOSTTOOLS_DIR}/python3"
 
+# Build type (RELEASE|DEBUG)
+# in RELEASE mode debug console is disabled. Switch to DEBUG to enable it.
+OVMF_BUILD_TYPE ?= "RELEASE"
+
 do_patch[postfuncs] += "fix_basetools_location"
 fix_basetools_location () {
 }
@@ -200,11 +204,11 @@ do_compile:class-target() {
     fi
     FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
     bbnote FIXED_GCCVER is ${FIXED_GCCVER}
-    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
+    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/${OVMF_BUILD_TYPE}_${FIXED_GCCVER}"
 
     bbnote "Building without Secure Boot."
     rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
-    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS}
+    ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b ${OVMF_BUILD_TYPE} -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS}
     ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.fd
     ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.code.fd
     ln ${build_dir}/FV/OVMF_VARS.fd ${WORKDIR}/ovmf/ovmf.vars.fd
@@ -214,7 +218,7 @@ do_compile:class-target() {
         # Repeat build with the Secure Boot flags.
         bbnote "Building with Secure Boot."
         rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
-        ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS} ${OVMF_SECURE_BOOT_FLAGS}
+        ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b ${OVMF_BUILD_TYPE} -t ${FIXED_GCCVER} ${PACKAGECONFIG_CONFARGS} ${OVMF_SECURE_BOOT_FLAGS}
         ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/ovmf.secboot.fd
         ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/ovmf.secboot.code.fd
         ln ${build_dir}/${OVMF_ARCH}/EnrollDefaultKeys.efi ${WORKDIR}/ovmf/
-- 
2.48.1


