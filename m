Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2561C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 16:48:49 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4681.1784738921869683849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 09:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=V4tWQmAq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260722164839f579a4c6b6000207da-o1efvh@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260722164839f579a4c6b6000207da
        for <openembedded-core@lists.openembedded.org>;
        Wed, 22 Jul 2026 18:48:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BQaIFEJ4ayIiCBMWAG/w4B8lwCyQoSf0HI4NrIYIK7I=;
 b=V4tWQmAqcFr9Mq8y1IFrQWmEbhGDxRGr29/0L3H4C8hFWGkSM9koFh+FeJfyM6xRXpwnQb
 RrI0RyY08x7glaWc8n9QagV+GgabovzWN0EeaZDpgXfdJZpYH8RxWaGuopZBtANOZQM6BXnx
 RPXzAEVb5v/Fw7J+RE96CSWLZzGIDDxIq+9w8rdzwRxbmYeLC6+anXCkFGgBCDq78+ktcqD2
 Oqxxi6edY33xFjFiXyx5bcZ/S7Bm2eSp6vb80dIHRc0Pf16VTdCCKsubVxtt+421xXn+5JS3
 8V6Huf86wNhZNVSzlololPyPrDmn2vFy4o9qdEQm6fwe+n2OTeSZfDuw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] libpng: set status for CVE-2026-40930
Date: Wed, 22 Jul 2026 18:48:12 +0200
Message-ID: <20260722164812.224352-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 16:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241706

From: Peter Marko <peter.marko@siemens.com>

Per [1]:
* The vulnerable code originates from the third-party libpng-apng patch,
which adds APNG support to libpng 1.6.x.
* Upstream libpng 1.6.x (without the apng patch) is not affected.

As Yocto never included libpng-apng patch, we can ignore this CVE.

[1] https://github.com/pnggroup/libpng/security/advisories/GHSA-c4v6-gxrq-6g2x

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.56.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
index 7ede0a6c8b..c6760707cd 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
@@ -70,3 +70,5 @@ do_install_ptest() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-40930] = "cpe-incorrect: Yocto never included affected libpng-apng patch"

