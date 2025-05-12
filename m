Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D365C3ABD8
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.45970.1747040639100764065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sSPWOq41;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040639; x=1778576639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SvNWevn/AS0u5FOe7dar23KPxOgLMqhgY8+HLxj092c=;
  b=sSPWOq41AKrwvTC4M6Wwfs/YLJpzdTAQuKrCCkI2sxR9J2BJdo9BQ6OM
   Hc7LEIfofQY5ec5XK0Nt8XwkTm8vXeAgTNzDZxAolEMhDNqGOzr1fko8s
   EwJJQeLA5xIqROLBpWPTox3E9zHDnI2+SK/raiAuBljXI0Dpfjj0RlngN
   bPv4yxCm18UA2KTldHHXVeZhmddH9s0evpKed38IHtMuPoGr8TuSLRW04
   Mw0G9kDUDVJWPBkYs00eLg2eqQMJ7mzsAs9diC3zmMc4wdJZj1maKgCnq
   Qee/MmI5T4lQ1hlfMw/2yBgG2LOnmLYyDiwUoRhQrEbITczkv4YNYkO26
   Q==;
X-CSE-ConnectionGUID: 8LYVZtScTeG066LMmufwvw==
X-CSE-MsgGUID: uroGcm6qTYO2gBH/TxGEcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="198343068"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="198343068"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3E20D5054
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 651C7CFB9C
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2617F1A00A0;
	Mon, 12 May 2025 17:03:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/56] cups: upgrade 2.4.11 -> 2.4.12
Date: Mon, 12 May 2025 17:02:52 +0800
Message-Id: <1747040619-7566-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216307

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- GnuTLS follows system crypto policies now
- Added 'NoSystem' SSLOptions value
- Now we raise alert for certificate issues
- Added Kyocera USB quirk
- The scheduler now logs a job's debugging history if the backend fails
- Fixed a potential timing issue with 'cupsEnumDests'
- Fixed a potential "lost PPD" condition in the scheduler
- Fixed a compressed file error handling bug
- Fixed a bug in the make-and-model whitespace trimming code
- Fixed a removal of IPP Everywhere permanent queue if installation failed
- Fixed 'ServerToken None' in scheduler
- Fixed invalid IPP keyword values created from PPD option names
- Fixed handling of "media" and "PageSize" in the same print request
- Fixed client raster printing from macOS
- Fixed the default User-Agent string.
- Fixed a recursion issue in 'ippReadIO'.
- Fixed handling incorrect radix in 'scan_ps()'
- Fixed validation of dateTime values with time zones more than UTC+11
- Fixed attributes returned by the Create-Xxx-Subscriptions requests
- Fixed 'ippDateToTime' when using a non GMT/UTC timezone
- Fixed 'job-completed' event notifications for jobs that are cancelled before
  started
- Fixed DNS-SD discovery with 'ippfind'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/cups/{cups_2.4.11.bb => cups_2.4.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.11.bb => cups_2.4.12.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.11.bb b/meta/recipes-extended/cups/cups_2.4.12.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.11.bb
rename to meta/recipes-extended/cups/cups_2.4.12.bb
index 71568295cb..ac73c2780f 100644
--- a/meta/recipes-extended/cups/cups_2.4.11.bb
+++ b/meta/recipes-extended/cups/cups_2.4.12.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9a88fe1da3a29a917c3fc67ce6eb3178399d68e1a548c6d86c70d9b13651fd71"
+SRC_URI[sha256sum] = "b1dde191a4ae2760c47220c82ca6155a28c382701e6c1a0159d1054990231d59"
-- 
2.43.0


