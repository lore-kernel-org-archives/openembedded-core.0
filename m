Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C68CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 21:01:46 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.1067.1759352495322814816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 14:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=iqfDdsUb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20251001210132e34b47b0500002077d-7jyiov@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251001210132e34b47b0500002077d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 01 Oct 2025 23:01:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eMkMHbTu4TbkvpTDVXMHaNfQP3/3prCpuKzBz1tNiEk=;
 b=iqfDdsUbb4aH0COBrJe+lksvX/ma+LFWrv4seFOQrIGJGRkN1vPZ7sjVuiOPFiCh/eG1Os
 MCA1NUVPWx7hXfxx+R9DAueHsleOCxWRWs6APb8GTtvMa/fTYg0jWGUEEm1ssklNuGpwuN40
 biYZSSr2/D+MCI43ix3vBYhVTIz/3VkBzK6h6tO26fv1hhwkRIfTLE0MH91+Hftm1g8P7NKA
 j11Bp7lA5Tl072EPizS4OEmGRAaWUpZSlBrn+R1ezErAw0ZIhUuOZ2TkRunJDV7/SfbCOBJA
 fwP1OdfiI2Hkh3KnklLP18Ohw58RTSqYRJ4qpL8u+c44gRQnWkHrQpWA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 5/6] expect: Fix build with GCC 15
Date: Wed,  1 Oct 2025 22:58:37 +0200
Message-ID: <20251001210111.1444441-6-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224326

From: Khem Raj <raj.khem@gmail.com>

Stick to C17 standard as GCC 15 switches to C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 48f7e1a539..a89b48ef1c 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -41,6 +41,8 @@ S = "${WORKDIR}/${BPN}${PV}"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
+CFLAGS += "-std=gnu17"
+
 do_install:append() {
     mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
     install -m 0755 ${S}/fixline1 ${D}${libdir}/expect${PV}/
-- 
2.51.0


