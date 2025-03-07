Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEC4C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 09:53:18 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.web11.7731.1741341192701597229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 01:53:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=NZj5AJei;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=x8uNSNPr;
 spf=pass (domain: zhukoff.net, ip: 103.168.172.147, mailfrom: pavel@zhukoff.net)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id C451E13826AB;
	Fri,  7 Mar 2025 04:53:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 07 Mar 2025 04:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1741341191; x=1741427591; bh=38uxszOJXPDUItpvD18q9
	S7mC1Y/Frz0HudY6UVx8e8=; b=NZj5AJei9xc4A7IgyDXGwwaXMhYoW1fRLGCKd
	XlzzihAggTcIYz87QHnegrZhq56qsnVCS+m9vnVfz7aiKN2zlhAXxsnzmMOcJDwP
	FTnix6MDEo5lIAqA+6KPMRHcH0aR4pVUoJ4JhVf9BqHXZeUQVpw1wmI59so2fSvB
	D97/8CmMvA36SvSrAOJHYgvmKaZZgf5QqisytJ58j19R8i1vPMX/yodIEzYFmv30
	HLIMV2Tx3CgLW3+RAyzES9xev9sFysulet9lhekgpifiDvaOAI+Bb7W6hFoMNhLM
	V7lkw4C/5EbFMqjn0CAamgqr0vutDaWxL5ENSvwEeAgjgJTCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741341191; x=1741427591; bh=38uxszOJXPDUItpvD18q9S7mC1Y/Frz0Hud
	Y6UVx8e8=; b=x8uNSNPrRCH4/m+zD8TdKSlpZXiFWZPaYV5l/FdVF/gk/8oIDa1
	uJoDsrjSjkgkHdHJ8FCuBzO5FWZwOluJ3HvEJL2Uc5rm3pkxvjC7QirbUKS7wFSP
	54bg46pQhHh93fJVxUF83+w8AQNAGJAixdvngo4l8NmTA87uHP8fk7pqZih7POrf
	n3PjTPaHdB8ZvJG5HCl6KwY8XKztHm2NhKxQaP0+HvvLblw3aQClLAja8J9pBaZM
	XO3mj+FuyKo6xobQQpiydUyJjR3nS2RzOpcmxwAIs0bP//an87u1PaHsa0d6qI02
	h0cKyBOESCugSdPAxIupEfuTn4OId5mklBA==
X-ME-Sender: <xms:B8LKZ7o6nCzZWKvpOKRmXoOeBEB93K7WpMcicAgo9ZzyGcDaNC2emA>
    <xme:B8LKZ1o5thIlZmtxw4RmG3LZl8lNyJSppWQToxYqi5EnjFRFj9gx2e3SEAUcEnzI7
    bownxfhDZ67NQh-z2o>
X-ME-Received: <xmr:B8LKZ4OfdZHpbQo_yK0rr-Ovu0s8gC-9VPmPaIK3AMd4HLr6OZBVVZLDLJyn9s89-1ZGG-aEEu26zuCaz8EG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtfeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcu
    oehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeeikeffhe
    eigeffffegtdekgfefhfevgfeuieevudduffevgfffffelleeludeuveenucffohhmrghi
    nhepfhgvughorhgrphhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvghtpdhn
    sggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnh
    gvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhr
    ghdprhgtphhtthhopehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:B8LKZ-4IDIh8s6IunnbcvFrCg_Hn8_LGwFULeuw7h1B4CS6gtbwNsA>
    <xmx:B8LKZ65l0ZjCaLim_h9TpftvYuyAFyjmKGhfQjKluucOHtH36HHP0A>
    <xmx:B8LKZ2g70VPjhQdpyE8DxnOt0UjUXE9Ov_x-FM8ApBOI7NQS82UAqg>
    <xmx:B8LKZ85M8xFHldx4zf7oxAHil2-sRa8l1Q_rxCp-hknXnutru87rVw>
    <xmx:B8LKZ6E6FkKEz3OXO4DZxGCS_8o2X6TjSUtZhHJFdMpCQkDvW9Ov7rfS>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Mar 2025 04:53:10 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v3] ovmf: Add PACKAGECONFIG[debug]
Date: Fri,  7 Mar 2025 10:52:57 +0100
Message-ID: <20250307095256.482939-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 09:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212423

In release mode, OVMF does not output any debug information to the QEMU port, making it extremely difficult to debug boot issues.
This commit introduces packageconfig debug flag to enable it

Usage:
PACKAGECONFIG:append:pn-ovmf = " debug"
runqemu qemuparams="-debugcon file:debug.log -global isa-debugcon.iobase=0x402"

The OVMF debug console output will be written to debug.log.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 559c86b546..764d79854f 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -12,9 +12,11 @@ LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=06357ddc23f46577c2aeaeaf7b776
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 'tpm', '', d)}"
 PACKAGECONFIG += "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tpm', '', d)}"
+PACKAGECONFIG[debug] = ",,,"
 PACKAGECONFIG[secureboot] = ",,,"
 PACKAGECONFIG[tpm] = "-D TPM_ENABLE=TRUE,-D TPM_ENABLE=FALSE,,"
 
+
 # GCC12 trips on it
 #see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools-turn-off-gcc12-warning.patch
 BUILD_CFLAGS += "-Wno-error=stringop-overflow"
@@ -67,6 +69,8 @@ OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLA
 
 export PYTHON_COMMAND = "${HOSTTOOLS_DIR}/python3"
 
+OVMF_BUILD_TYPE = "${@bb.utils.contains('PACKAGECONFIG', 'debug', 'DEBUG', 'RELEASE', d)}"
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


