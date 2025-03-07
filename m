Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92F3C282D0
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 08:40:17 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.web11.6907.1741336813525794666
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 00:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=VXBVzpf8;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Cv7BZ9EF;
 spf=pass (domain: zhukoff.net, ip: 103.168.172.146, mailfrom: pavel@zhukoff.net)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C2181382821;
	Fri,  7 Mar 2025 03:40:12 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 07 Mar 2025 03:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1741336812; x=1741423212; bh=XIsfO11WI4oWTrhsyuvxz
	tDs5HZA3kI5YqFRYbYLyaA=; b=VXBVzpf8wholAdEEBSZRXckJTwcWcwAI4ArvS
	vPn7K/lnSMbINP6RjsVzwHniXBEv3UfUkuJrfoQ4+1Ps21TmLv1FmpV8N4du2Fom
	YbCLkFuBIoR2zcjDFsCqqvlWS/1/AwYrToSLFq/WZVfnFWtdtgEP2ZBwe+x5IlKF
	y8ra3U2ZGFWaPwO9we/Ee9zZxIuQeadKclKsHCoL26xT2NDW2+QE8m3yIPHRuBSf
	nKP4zCxRv0Y1XNTyP6xOgux1VMExwg6ZBfv58vDYgwkWrFSPgNMZAZ7p8rie1fhW
	NzRZswUZ32U8g5Nx8Fka7MGjV4JbpJw5dMIxcoVXFkEO4m9iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741336812; x=1741423212; bh=XIsfO11WI4oWTrhsyuvxztDs5HZA3kI5YqF
	RYbYLyaA=; b=Cv7BZ9EFzlj2h4ZdIllpXN3GtUKI5uF7K/OzLV4kWG8dwH5HFJl
	MZ8FLudlpSAG59F74aYLIrPwjLH4fwZj0Lp8bLCsoiMcd+odK1zG8ZzUpD8GKqTQ
	gpOkd68qp2NZz7wNjwYp05C5Kcpvdf87kDM/zl4fLN3VF6hiLNfzEL/VGJnPaDJa
	siS9UzQexeKR27oA3VONubYF5fVY46viQXlwPBpOMnGpVVOy/i6m+hVDQi3khejY
	uRy7wjnntnuifmA1BluIKRgp282ZnICIX1Keba3lzieNkJ4GmbAKgQ5QSke/0Dn/
	DQHKIRV2yUJF/q9bU9g/qjl+3S+cz0cC0PA==
X-ME-Sender: <xms:7LDKZ-JTUZ4Siz9RoDJOWzmeUWcvN1NCWYX2MtGSyPxSiwgoTqz0Hg>
    <xme:7LDKZ2LfSxLJIHe18AHvZ4fOBLXgY6snP9LeNwd4uPOIaTbr8sTRcA4yX47OfNvb-
    U2juy9QDA1Dse73XVg>
X-ME-Received: <xmr:7LDKZ-uAuNby2nHunidQhChmKu5t0YAkIg6zrBrod0WkdmBCE10EXxGMaP9L4J9HiF7juafQJon1e-CcWD7e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcu
    oehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejke
    ejudegledtkeejhfettdefjeeuffehieekvddugfdtffffledvvdefhfenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukh
    hofhhfrdhnvghtpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmh
    gsvgguuggvugdrohhrghdprhgtphhtthhopehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:7LDKZzZy6RfEoTpAKGzEV7R5cIuJIK1YGWSKMGlZ4msYp58absBxOg>
    <xmx:7LDKZ1bpDUXk037htQT8DmvKXytHGlN7ocy4Ffihzi8t_KqGSPyimw>
    <xmx:7LDKZ_A5vhahusvp8hUVPQA-ywIEPZPecJmmmxxhU1aZJjxxt7L2wQ>
    <xmx:7LDKZ7bc6ZKqROROPf4KVqkWtj4M4t4F9bu4oXs1nAFCdsVgE9TshQ>
    <xmx:7LDKZ0mL8GqEkyWZSycFP63dNNsf7m_YwZ3oyYNccftKYce-JsbEdUya>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Mar 2025 03:40:11 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] ovmf: Add OVMF_BUILD_TYPE to support debug builds
Date: Fri,  7 Mar 2025 09:40:08 +0100
Message-ID: <20250307084008.450059-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 08:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212415

In release mode, OVMF does not output any debug information to the QEMU port, making it extremely difficult to debug boot issues.
This commit introduces the OVMF_BUILD_TYPE variable (RELEASE|DEBUG) to enable debug mode.

Usage:
OVMF_BUILD_TYPE="DEBUG"
runqemu qemuparams="-debugcon file:debug.log -global isa-debugcon.iobase=0x402"

The OVMF debug console output will be written to debug.log.
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


