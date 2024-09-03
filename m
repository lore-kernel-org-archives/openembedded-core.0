Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40688CD3420
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.18355.1725352392627218283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CWxWM8uw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352393; x=1756888393;
  h=from:to:cc:subject:date:message-id;
  bh=Aikx2pMA60QMFt+kwsTNKZSkzdqx48ANjb8vGc+Gabk=;
  b=CWxWM8uwKtCypciI1OyuzWURkiWd0bseR0b4ej6NB9r20ZgwQNri8RWB
   Q+Awnaq0ynESbfyvZO4bxc23HF50Z+YaOGrwpYxmbvBqwQwANrHzSr/B5
   WHS9yiq9iq0PdxBimnqNIIFGejyKGPc1pljvvpnyAGY9K2JLkKVL6Z20K
   PxyEHuWz13B5mz1RvQttp0jZxPtr7Xr4nzWYrNOmFFsyvJ3opxoNid46N
   sgEkw0ZMNfJ6DGEp11zzDvE0J6BIeoxcZhHUV4ZU244gIGhqvaPWQGFoX
   QDMcEIFIgQyUscTys4NaJhYlNIyZdnlo5EDzjveJNPAM4ffqubCRW0ohP
   w==;
X-CSE-ConnectionGUID: cw5CJYSkQTaJ42BVxSYxJA==
X-CSE-MsgGUID: vy/1yv2RRdiyaut1RBU0+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="172584287"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="172584287"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:11 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EF75FE428A
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A7F9D50EB
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6B1320076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C92D1A000C;
	Tue,  3 Sep 2024 16:33:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/22] acpica: upgrade 20240322 -> 20240827
Date: Tue,  3 Sep 2024 16:32:38 +0800
Message-Id: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--9.961200-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyudzjX37VUcWroS
	0GHxlnK4xRbNnDxaWANaOK3wW8BDkflL4i9cjuYNvybt3bgNxoIXivwflisSrCbSnFTk1p0EI7c
	nzSpYxIM/sGLVOizDTj3oRcKd8wjgsEBAuoaUqK8/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bo4Uu3eSZVG75hW+L+ngWDw3KXWd30Ii3RRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07b4iO
	wQQ4jNi5kgj8TqGKZ00EfBxu3vRG47HXQvyKSPGFLOblxtoOM0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204128

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix the PHAT table working: ensure that the PHAT firmware health record offset
  works correctly, fix various sub-table offsets, prevent segmentation faults
  when encountering invalid device paths.
- Fix the optional table 4-byte signature.
- Correct the dumping of SLIC and DBG2 tables.
- Add support for QWordPCC and DWordPCC
- Fix the integer to hex string conversions
- Detecting FACS in reduced HW mode and allowing setting waking vector thereby waking up from S3 state
- Fixing issues with crossing page boundaries when mapping operation regions
- Update the support for IORT, HMAT, MPAM, AEST, CEDT, SPCR etc. tables
- Fix multiple issues with table parsing, compilation and disassembly
- Allow for more flexibility in _DSM usage.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../acpica/{acpica_20240322.bb => acpica_20240827.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20240322.bb => acpica_20240827.bb} (96%)

diff --git a/meta/recipes-extended/acpica/acpica_20240322.bb b/meta/recipes-extended/acpica/acpica_20240827.bb
similarity index 96%
rename from meta/recipes-extended/acpica/acpica_20240322.bb
rename to meta/recipes-extended/acpica/acpica_20240827.bb
index 90e3599d32..7e8c68db90 100644
--- a/meta/recipes-extended/acpica/acpica_20240322.bb
+++ b/meta/recipes-extended/acpica/acpica_20240827.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
-SRCREV = "170fc3076a86777077637f10b05c32ac21ac13aa"
+SRCREV = "e80cbd7b52de20aa8c75bfba9845e9cb61f2e681"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


