Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FC6CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 21:01:46 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.1066.1759352495322513910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 14:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=FmAXPdsy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202510012101326fa62520920002077e-zeqnjc@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202510012101326fa62520920002077e
        for <openembedded-core@lists.openembedded.org>;
        Wed, 01 Oct 2025 23:01:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gJ9uIrr+erzLeszDESrmIFhEZoSSkQOG5KmgieaXjx0=;
 b=FmAXPdsycfuZt1ucedd+LJ4qTjAOUSso1PTKF90y1TpdiFeaqPKaTf8N/v4+WAnjMecCkK
 0bXlX2L4PslY7DOUe+BH8u6Dto4YE966fLxutRE8nBT75lSOhBeFMbfmhjJEi7SEfFk9LaHV
 XjcSjmJIroCMU/U5AyVdfwhTqD12MmeNjcEvs3gTRgo2o36DR1hRVSHg7U4FFZ79j6arojso
 TzG8KO3+UNndyaKBjoEMAxs75r5HQPGZUFl3T+zcLMtFSPfDQztZNxSlTROTIlYQevV7UCdM
 QqFUHuU2aLMSpSVZvEu9+ho5Cc3M9CUdTl+Ij93jFvmEnaXgduU1cWcg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/6] expect: update code for Tcl channel implementation
Date: Wed,  1 Oct 2025 22:58:34 +0200
Message-ID: <20251001210111.1444441-3-adrian.freihofer@siemens.com>
In-Reply-To: <20251001210111.1444441-1-adrian.freihofer@siemens.com>
References: <20251001210111.1444441-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 21:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224327

From: Ross Burton <ross.burton@arm.com>

Tcl 8.4.0 changed the channel implementation, take a patch submitted
upstream to update the code for the new interface and remove the silencing
of the incompatible assignment error which was due to this issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../expect/expect/tcl840.patch                | 27 +++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb |  5 +---
 2 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/expect/expect/tcl840.patch

diff --git a/meta/recipes-devtools/expect/expect/tcl840.patch b/meta/recipes-devtools/expect/expect/tcl840.patch
new file mode 100644
index 0000000000..8c7b0e7a7f
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/tcl840.patch
@@ -0,0 +1,27 @@
+Adjustments for compatibility with the currrent (Tcl 8.4.0+) channel
+implementation.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/expect/patches/24/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/exp_chan.c b/exp_chan.c
+index c92e26b6fbd02305..944200a63b102672 100644
+--- a/exp_chan.c
++++ b/exp_chan.c
+@@ -60,7 +60,7 @@ void			exp_background_channelhandler _ANSI_ARGS_((ClientData,
+ 
+ Tcl_ChannelType expChannelType = {
+     "exp",				/* Type name. */
+-    ExpBlockModeProc,			/* Set blocking/nonblocking mode.*/
++    TCL_CHANNEL_VERSION_2,
+     ExpCloseProc,			/* Close proc. */
+     ExpInputProc,			/* Input proc. */
+     ExpOutputProc,			/* Output proc. */
+@@ -70,6 +70,7 @@ Tcl_ChannelType expChannelType = {
+     ExpWatchProc,			/* Initialize notifier. */
+     ExpGetHandleProc,			/* Get OS handles out of channel. */
+     NULL,				/* Close2 proc */
++    ExpBlockModeProc,			/* Set blocking/nonblocking mode.*/
+ };
+ 
+ typedef struct ThreadSpecificData {
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 174b35ec73..461a2c093a 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-fixline1-fix-line-1.patch \
            file://0001-Add-prototype-to-function-definitions.patch \
            file://expect-configure-c99.patch \
+           file://tcl840.patch \
            file://run-ptest \
            "
 SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
@@ -82,7 +83,3 @@ FILES:${PN} += "${libdir}/libexpect${PV}.so \
                "
 
 BBCLASSEXTEND = "native nativesdk"
-
-# http://errors.yoctoproject.org/Errors/Details/766950/
-# expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.51.0


