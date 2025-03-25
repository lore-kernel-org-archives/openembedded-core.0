Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF1CC35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 08:53:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.61010.1742892818058828552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 01:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm2 header.b=C2W8SfoH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-456497-20250325085335d12aa0b532e6964640-uxe_or@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250325085335d12aa0b532e6964640
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Mar 2025 09:53:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rwP0P83R5SKSRw3shlUpOydMRamO6GAmcaQ0peh+6wU=;
 b=C2W8SfoHJOI9FXhXMEUO6QczUY8iMN7S+mCQDqtz1UE+5naL9RpGb8VgAnZOUjq5CS8BSg
 EvbpJfaCSdC282q0Tni6j0VC5rnfiBjghtWAtweewAHOisxgp9MJonmbAN7CglUmdq85GG5O
 S67uXHouabnpzxcH51Tp4528V4hvvd1KVQ7nhtkRlZH7XYky+0LWJyLlYkFr3zaAIS/41mfI
 uKOnEEoEUY+/WVeoFU7crYDt5FUitoEXiM77svYmhyUGruDBdaoy6Kxxg+IZ4MAedUbiNNqB
 KTyc7bhw0j1UzkeOmWbbuqZhb3kHEwqVZVra2uRGfoKa/EflvfFu3xjg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Mueller-Klieser <S.Mueller-Klieser@phytec.de>,
	=?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [OE-core][scarthgap][PATCH] kernel-arch: add macro-prefix-map in KERNEL_CC
Date: Tue, 25 Mar 2025 09:53:07 +0100
Message-ID: <20250325085316.14571-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 08:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213594

From: Stefan Mueller-Klieser <S.Mueller-Klieser@phytec.de>

When building external modules, macros can include absolute names of
kernel headers. The macro-prefix-map for the STAGING_KERNEL_DIR is
currently missing. Add it in the same way as its done in bitbake.conf.

This fixes reproducible builds and following build error:
ERROR: cryptodev-module-1.14-r0 do_package_qa: QA Issue: File <..>
cryptodev.ko <..> contains reference to TMPDIR [buildpaths]

(From OE-Core rev: a741e11751bfb8f52be58cf51abeddca4559e5e9)

Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index b32f6137a2f..36a6e0a60a6 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -71,7 +71,13 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
 HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
+KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
+ -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
+ -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -fmacro-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+ -fmacro-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+"
 KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
-- 
2.48.1


