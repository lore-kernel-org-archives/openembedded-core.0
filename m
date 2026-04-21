Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5029F327DF
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:22 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20437.1776765373718884407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MDGOT9dm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765372; x=1808301372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RKkgQYldqOcDqzOR3jPCZPvYkhcoSnQHfc7XENXheMc=;
  b=MDGOT9dmA78zAYWacd3UFM7AhjJ6hj7OgKXIRp4FL3Ntb6cmE+I7aSJF
   asUXjMGi9gpD20SkxOblL5+NIRAnB35Rvu+5c28tbPqY2TeU8XgrUlNgw
   qNSOLBQBlWlWdl2wzm14O/gG8PVQh1/HwuE6ScLNp3fV8g4GZZVoNc13n
   qN1JdmtGccgdp5Bm/2uDK9BT729kPes574puD5zzHFvhpXPXwDfQazDs2
   Xr0fsVnIaZlIuVFCLfiyyMH4gMfKDwcj5FOjzjZ2IyGRkH8VymtF+Paa8
   ZlE6jnyLwmw6oZwBWG0XTJz+JUUpnmEPjWq1ydPt1Mgz0zqjCpnHtFkdN
   A==;
X-CSE-ConnectionGUID: rLojBL1CQx+A9PUqoviCpQ==
X-CSE-MsgGUID: OxMrgQDjT0KD7t+pjUbEBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237618284"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237618284"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:11 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E981F1000348
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:11 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 947C81800D61
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 18497140027F;
	Tue, 21 Apr 2026 09:56:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/49] dhcpcd: upgrade 10.3.0 -> 10.3.1
Date: Tue, 21 Apr 2026 17:55:14 +0800
Message-ID: <20260421095559.1856-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235612

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- BSD: don't send uninitialised memory using ps_root_indirectioctl
- Fix fallback_time option
- IPv4: Ignore DHCP state when building routes
- options: Ensure ldop is not NULL dereferenced
- route: Routes may not have an
- options: Ensure that an overly long bitflag string does not crash
- options: Don't assume vsio options have an argument
- common: Cast via uintptr_t rather than unsigned long
- privsep: Ensure we recv for real after a successful recv MSG_PEEK
- DHCP: Add parentheses to macro definitions
- ipv6nd: empty IPV6RA_EXPIRE eloop queue when dropping

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dhcpcd/{dhcpcd_10.3.0.bb => dhcpcd_10.3.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.0.bb => dhcpcd_10.3.1.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index fca7d8b11d..c940d6806a 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "385ff246cbdbd1627582999f7705bf9ef2ad0d7d"
+SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.43.0


