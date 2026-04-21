Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4978AF89225
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20395.1776765397204310410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VKApQrmz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765397; x=1808301397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3dRRTkIdgWh/dXOTQMZj3bioWBt+tDqp1KDQ6k8TOnU=;
  b=VKApQrmzGyM2o7DA7HSvPTTQ5i1FsR24ZeiCVB9v2E/10sBxHhZ68S+0
   cvXN77mKyFYJbbIzjg363Wc2tAMnQa6aL8/dEiYMLdCivNDcXlHkk3suv
   xTXT8boVr7IU21MNCSsxPZYRT4u9t4XhZb+1yaDdJwsR1W/mJQY8IGGGa
   OHbSbALiXOVRbDhiJ6zVHIS8N69q44oQa3WeS6o5NTI/RTkYbREW2DTr6
   Adb4adoDZz31cwqCZD8/HG/tzxzfZicLoN181BR3z9nv8LzvExPOKnYuf
   qti4ui5AoaeOLH6jA1IdfCsDan3VF1/CB3ypGx7k6jr7Ae52K92wB942r
   Q==;
X-CSE-ConnectionGUID: 9EziMQYuRdewYvg8kCdCoA==
X-CSE-MsgGUID: WV70fPOGTGuNWdYYRKyUmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225157888"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225157888"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C75524DDD
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:35 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 71A951800D43
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E6C16140027F;
	Tue, 21 Apr 2026 09:56:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/49] libcap: upgrade 2.77 -> 2.78
Date: Tue, 21 Apr 2026 17:55:26 +0800
Message-ID: <20260421095559.1856-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235624

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix a security vulnerability (CVE-2026-4878).
- Fix a typo in a capset error
- Reverted some build macrology to get back to something that worked (admittedly sub-optimally).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.77.bb => libcap_2.78.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.77.bb => libcap_2.78.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.77.bb b/meta/recipes-support/libcap/libcap_2.78.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.77.bb
rename to meta/recipes-support/libcap/libcap_2.78.bb
index 9968cd5f50..449260f7dc 100644
--- a/meta/recipes-support/libcap/libcap_2.77.bb
+++ b/meta/recipes-support/libcap/libcap_2.78.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "897bc18b44afc26c70e78cead3dbb31e154acc24bee085a5a09079a88dbf6f52"
+SRC_URI[sha256sum] = "0d621e562fd932ccf67b9660fb018e468a683d7b827541df27813228c996bb11"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.43.0


