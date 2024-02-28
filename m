Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B157BC47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8409.1709105595601028936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DdOQttcw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105595; x=1740641595;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZRJDGlnreQA0tI62ao7mlphyyq7SMQSAvUVLKqX+iBU=;
  b=DdOQttcwUjacwTx4JN6AA+B6eRgpFljMg+zNFauiO4S8iT9vjdYxlF0Y
   ZAaBuu6cYVXVT+7ZiakRfxhufejolDRZYQ84rNjvGZmPK7bAOJ7USq92w
   ceNAEi3ons0BbBTtHtb86U9Hcz9zb4FF7bthAStNEWMli3SxLR3YEfAUk
   lQ4i9no+uwh59tVn86vFVjI1RBe3I39TT2sjKo0Uxd/bh3unsWiv1TVxm
   qwI0zDD6TVteDOP4x6BbT5b/Hm07yQZ+rqtuayvAtw2ScnykdAAG65hhD
   hZ+Y2oPigQuU6EUA1V5GdeehhYUxoJah0hZOExmVFs9MhkQuq25pgA9BG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129444107"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129444107"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:12 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 52ABAE9581
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 810603A064
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DD352008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF28C1A006A;
	Wed, 28 Feb 2024 15:33:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/48] efivar: upgrade 38 -> 39
Date: Wed, 28 Feb 2024 15:32:13 +0800
Message-Id: <1709105575-24259-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--3.659800-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzZYpED/x+QhWMW
	vMMU24Z7lsVuD4sM+B5CNEei2kg1tEPbYPqd/GaJlXePXNM4FjMxXH/dlhvLv79QpKTfxwYMuqy
	8ogmFqibDKKXtpTQT/ioOCLtIuRbjGCpgzjMdzqDjB2htmJXMOG6wif7cBL4ozZg4F8Luwl0cM+
	9sw875DuWR3argMCqBYg2Xu73qzl8dTq+etMZ+xj4RbdPTGu78m/t43d5OEX7SJfGV2JAq5J/bu
	mQx78u3Xud9Or/HeUPpbjohq3lphvBH7LH3Cjlq/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwUe
	vDt+uW5/XjpbSJS7a1fT+4ebToXI2qjKAYV8LUY6N/cDgNNi4U50qcJ5WOMhmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1XFvBhI5Hg85PlsTyr5vGOSb46oX5jn1janP9v/+ib9S0KIbjZZ3lmmzVHY
	BIQkgpWMoEMiLb7UU4nALDUfkMyfkCPmVu/KHsqgQYbcz5U7JTyZ1y9sjWHZLqPOO5dObQxMzMg
	JrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196330

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add -T workaround for GNU ld 2.36
-Add extern "C" to headers for easier use by C++
-Avoid format error on i686
-Fix the -march issue for riscv64
-Fix musl build
-Fix invalid free in main()
-Remove deprecated --add-needed linker flag
-src/Makefile: build util.c separately for makeguids
-Adjust dependency for libefivar and libefiboot objects
-Set LC_ALL=C to force English output from ld
-LLD: fix detection and remove not needed workarounds
-Fix glibc 2.36 build (mount.h conflicts)
-File device paths: don't print "File(" or ")"
-Use off_t instead of off64_t
-Revamp efi_well_known_* variable handling
-Allow overriding PKG_CONFIG
-Allow passing of hex values to -A
-Allow -a to create a non-existent variable
-make: add option to disable building/installing the docs
-esl-iter.h: fix type declaration of return value for gcc-13
-Minor code updates
-src/Makefile: do not override LIBS and CFLAGS for prerequisites
-linux: handle non-ACPI systems in device_get()
-Change set&append data to be const.
-dp.h: check _ucs2size in format_ucs2()
-Fix wrong if condition in efi_variable_get_data
-Make README statement match license
-Remove needless access() in efivarfs_probe()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/efivar/{efivar_38.bb => efivar_39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/efivar/{efivar_38.bb => efivar_39.bb} (94%)

diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_39.bb
similarity index 94%
rename from meta/recipes-bsp/efivar/efivar_38.bb
rename to meta/recipes-bsp/efivar/efivar_39.bb
index d88eb3fef5..aab319be91 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_39.bb
@@ -10,7 +10,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            "
-SRCREV = "90e88b221e8bc60dc50f3246051369b8f580c0d0"
+SRCREV = "c47820c37ac26286559ec004de07d48d05f3308c"
 PV .= "+39+git"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


