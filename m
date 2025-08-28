Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D32FC8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 10:32:24 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web11.17707.1756377142303251937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 03:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BJ13IK8h;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2237; q=dns/txt;
  s=iport01; t=1756377142; x=1757586742;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pk7yKTT3O3KiDg29E/h5qx/vg0EkX0BsDyMipykDo6k=;
  b=BJ13IK8hsXc6KS7bxyvliWHvw7ZUyUMAuPmHN0Q6Th2P0E2henj+2/H+
   x9QqHYcSn9PT887FCi1bvAOHMDiqkP3RFAnIYWEDJ0N8p0zOdkq4chekO
   +zXAhN/ZwWDbOsKEl3P0kwW85pjxEG9Jq31g0EZENFsB1bk3XD9WIpKHI
   GAaL4CvqgQOT6t7rL7R3+5ePpHJeq6xL6Xftq4qLdP7+c1r/INLKf0J9S
   0gLFoCFeLMMpuJyW1COBt+U3435eGgit0WMBz+e9S08EcsqO0zWZsU2EX
   AwSBTFIDkGR+1hUYWIalzaXlHqQmlJcml132mYodL8+b7VCRFgbuehA9h
   Q==;
X-CSE-ConnectionGUID: 3BeGNs5ARrS4TsWiWqdxNw==
X-CSE-MsgGUID: SKp5bXmFT8KzXCLyPKnNjA==
X-IPAS-Result: =?us-ascii?q?A0D6AAA6L7Bo/43/Ja1aHQEBAQEJARIBBQUBggAHAQsBg?=
 =?us-ascii?q?kZ6WkJJh1+LdQGhDRSBaw8BAQEPRA0EAQGFB4wnAiY1CA4BAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZdNgEYAS0wXESDAgGCcgIBE?=
 =?us-ascii?q?Qa5O4IsgQGDCR8BgVPbKYFJAY1MhWcnGxuBcoJQgi2CYQECARiBLGeFdwSCI?=
 =?us-ascii?q?oECFIovhgSCYCAUh0JIgR4DWSwBVRMNCgsHBYFjAzUMCy4VbjIdgSeFDYQeK?=
 =?us-ascii?q?0+FAoRqJGsPBoEVg18GgzhAAwsYDUgRLDcUGwY+bgeUI4MugQ4qAqggoQ4KK?=
 =?us-ascii?q?IN0jB6VORozqmuZBo4IlWhohGmBagI4gVlwFYMiCUkZD5c0tU0jNQIBCDECB?=
 =?us-ascii?q?wsBAQMJk2cBAQ?=
IronPort-Data: A9a23:7j6laap+llMqE0dBJEyad994RbNeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmGaPqIZTfxLY8kYNng8RwBvJDWmIQxSFds/n88RSgToOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9z8ljPvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYQ/NNwJcaDpOtvrT8kw355wehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0r1dDE5o7
 qExEio2MiyYuOOJ2b6rbPY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUfrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXHpoMxR7E/
 j+uE2LROTICadavzBS5olG+tsTrjBvYXqQQPejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:+UGwkas9gS5iYEd6h2we4egg7skDfdV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldK0Ec
 xbAs9D4BqaNykfsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3A6r0OEWgGwiiClcko/hRNGZ1yczJuKVfQ41HLfma?=
 =?us-ascii?q?CE101dKaqSGCJ9LNCjJ87?=
X-Talos-MUID: 9a23:1uc/JQsh74LxEpoYV82nvxJ6ac1Y5oqSWGMfob4iqvGnMwpyEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,217,1751241600"; 
   d="scan'208";a="537130405"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Aug 2025 10:32:21 +0000
Received: from sjc-ads-5834.cisco.com (sjc-ads-5834.cisco.com [171.68.197.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 43588180001A2;
	Thu, 28 Aug 2025 10:32:21 +0000 (GMT)
Received: by sjc-ads-5834.cisco.com (Postfix, from userid 1795984)
	id DF28ACC128E; Thu, 28 Aug 2025 03:32:20 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] rpm: keep leading `/' from sed operation
Date: Thu, 28 Aug 2025 03:32:10 -0700
Message-Id: <20250828103210.1096671-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.197.49, sjc-ads-5834.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 10:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222556

From: Hongxu Jia <hongxu.jia@windriver.com>

For /usr/lib/rpm/macros, Yocto explicitly set OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM
= "ONLY" [1][2] to search tools from CMAKE_FIND_ROOT_PATH [5] which locates in
native recipe sysroot or HOSTTOOLS_DIR. If found in native recipe sysroot or
HOSTTOOLS_DIR, the sed operation removed leading `/'

root@qemux86-64:~# vi /usr/lib/rpm/macros
...
%__xz                   usr/bin/xz
%__make                 usr/bin/make
%__zstd                 usr/bin/zstd
%__quilt                usr/bin/quilt
%__patch                usr/bin/patch
...

root@qemux86-64:~# rpm --eval "%{__xz} %{__make} %{__zstd} %{__quilt} %{__patch}"
usr/bin/xz usr/bin/make usr/bin/zstd usr/bin/quilt usr/bin/patch

This commit keeps leading `/' from sed operation, and similar reason for
/usr/lib/cmake/rpm/rpm-targets.cmake

After applying this commit:
root@qemux86-64:~# rpm --eval "%{__xz} %{__make} %{__zstd} %{__quilt} %{__patch}"
/usr/bin/xz /usr/bin/make /usr/bin/zstd /usr/bin/quilt /usr/bin/patch

[1] https://git.openembedded.org/openembedded-core/commit/?id=f4ea12f6635125ee793f4dd801c538c0186f9dc3
[2] https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_ROOT_PATH_MODE_PROGRAM.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d0773879ab9520c475c4a8c930b2e663de0e032)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-devtools/rpm/rpm_4.19.1.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
index 9330323797..7505e3452c 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
@@ -130,10 +130,10 @@ do_install:append:class-nativesdk() {
 }
 
 do_install:append () {
-	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
-            -e 's:${STAGING_DIR_NATIVE}/::g' \
+	sed -i -e 's:${HOSTTOOLS_DIR}::g' \
+            -e 's:${STAGING_DIR_NATIVE}::g' \
 	    ${D}/${libdir}/rpm/macros
-	sed -i -e 's:${RECIPE_SYSROOT}/::g' \
+	sed -i -e 's:${RECIPE_SYSROOT}::g' \
 	    ${D}/${libdir}/cmake/rpm/rpm-targets.cmake
 
 }
-- 
2.35.6


