Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E49C021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.14681.1739864485588248530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OJK9hNm6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864485; x=1771400485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=V3zXNxszoAB+PF1oo3awVP/W+sZePylrcqb7CU/VJfE=;
  b=OJK9hNm6y7LTOgNJY1AmCFSou9/lQycdb6++s3zwKL3eUvlcX+ujSH6r
   GJT8zZhju8yLQZNwmbMF8I1OyUIlbCZRKaN6hrL/dYZT8Ub9DaFjEnsXm
   eWuGHYjBdXcmnjZmoiuLcPp6kagEDOQeexhhgePyZJ+koINk61HAdZNVU
   9ujdwr5CwcxENhYU0wuouJlig4xhPyIfGTvt6zuprm9OEZ3aKXksCAfrY
   MbmhgdStYQQ43/HmuCh4AB4O/avqceI/mQaYSTR0/UuleUEcLIbZ15ltS
   9YzBOHOLp6nUwiu4osesHU5q68WwbYsuSs4jcy/OT48yJiafnvyWF0jWD
   g==;
X-CSE-ConnectionGUID: oP9qDlpeS/CE5U54blyqjA==
X-CSE-MsgGUID: DbGOyJLRTXeJ7zmJcSWV6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190602664"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190602664"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:23 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D5CCC2260
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2649C4B1A5
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BECBC1A000B;
	Tue, 18 Feb 2025 15:41:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/32] libffi: upgrade 3.4.6 -> 3.4.7
Date: Tue, 18 Feb 2025 15:39:10 +0800
Message-Id: <1739864375-21394-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211571

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add static trampoline support for Linux on s390x.
- Fix BTI support for ARM64.
- Support pointer authentication for ARM64.
- Fix ASAN compatibility.
- Fix x86-64 calls with 6 GP registers and some SSE registers.
- Miscellaneous fixes for ARC and Darwin ARM64.
- Fix OpenRISC or1k and Solaris 10 builds.
- Remove nios2 port.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/libffi/{libffi_3.4.6.bb => libffi_3.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libffi/{libffi_3.4.6.bb => libffi_3.4.7.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi_3.4.6.bb b/meta/recipes-support/libffi/libffi_3.4.7.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.4.6.bb
rename to meta/recipes-support/libffi/libffi_3.4.7.bb
index a6857a3981..b2caaa88ba 100644
--- a/meta/recipes-support/libffi/libffi_3.4.6.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.7.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1db54c9fd307a12218766c3c7f650ca7"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e"
+SRC_URI[sha256sum] = "138607dee268bdecf374adf9144c00e839e38541f75f24a1fcf18b78fda48b2d"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.43.0


