Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69708C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:29:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8616.1702978144270377044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143913639"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143913639"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:29:01 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AD6699694
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:28:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A91AD9489
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:28:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 38F131EAC02
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:28:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EAEEF1A006F;
	Tue, 19 Dec 2023 17:28:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libatomic-ops: upgrade 7.8.0 -> 7.8.2
Date: Tue, 19 Dec 2023 17:28:20 +0800
Message-Id: <1702978100-7475-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--8.426600-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrsBSA1tuZVSb5V4X/65DwbwjJ
	lierVE/nOuzeNmOGKnM8XcRycFzyQL3Q3hZ5tpfxMGAKZueP0maBs03RHrzjM0z5vzLEGq8Dm0I
	5Q/LYFVp7KpXcvEKP/BJwcdfSstcE7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3i3Tu5wqq1RK+zXVR6bXx5ep1U1lojafr/IGvcBvtI0NoCGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSAHAopEd76vltaHPodj5yRz1tPCZsLJYOOjSDdbvRBaDFz5
	LQcElw2OGN8tY8A4jA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192696

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Eliminate 'atomic_thread_fence is unsupported with tsan' gcc-11 warning
* Eliminate 'comparing signed/unsigned values' lcc warning in add_chunk_as
* Fix 'undefined reference to AO_pt_lock' if configure is using clang-16
* Fix 'undefined reference to __atomic_load/store/cas_16' Mingw64-gcc error
* Fix 'undefined reference' linker errors if shared build on OpenBSD (CMake)
* Fix get_chunk for case of mmap area is located before AO_initial_heap
* Fix typo in AO_HAVE_compare_and_swap_double name in atomic_ops_stack.h
* Fix typo in comment of run_one_test of test_stack
* Fix typos in comments of atomic_ops_malloc.c and atomic_ops_stack.c/h
* Update cmake minimum required version to 3.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libatomic-ops_7.8.0.bb => libatomic-ops_7.8.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.0.bb => libatomic-ops_7.8.2.bb} (89%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
similarity index 89%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
index d4b77f6244..824400e743 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
-SRC_URI[sha256sum] = "15676e7674e11bda5a7e50a73f4d9e7d60452271b8acf6fd39a71fefdf89fa31"
+SRC_URI[sha256sum] = "d305207fe207f2b3fb5cb4c019da12b44ce3fcbc593dfd5080d867b1a2419b51"
 
 S = "${WORKDIR}/libatomic_ops-${PV}"
 
-- 
2.34.1


