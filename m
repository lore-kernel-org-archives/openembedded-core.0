Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E13C25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.5660.1716369316183619180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cwvwzQbW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369321; x=1747905321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QcEe/4r2jMH/LCFVouMGCK888HE8OmlMI1TxSUP1ODg=;
  b=cwvwzQbWd9QcIw0Hgc2/PH6yPcfyeO5xxiTYo6jCBjqaX8jaHm+LoaCE
   5gc9/+0FsXhs16HzEVJAjGXfbl/N6rwUVyZ3hU3msUDBsjkeiVKF5O3j0
   BV8DyXF9F84OhuSN8iE2EPAiHticd4ohXJIpgYG/fTKtFDc4Zr5uxZ239
   OQIUsGCDdj2J8Ll5gsLmMd2ekMlkEFuT+DPPUf5DIgxA+IKWZXWwXb9+q
   5HEzf1+ODcyxPhxL1iPb36i9wUSg9M2uv3223E2gHMoC+eykLHdpo8TRs
   OJFjO6PVUfza/s6Vds4ccvvy8hhd34nyrrL/owB3U4hM+efYdsZ2GW7dj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="161119187"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="161119187"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:20 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B667C68E6
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CCD28D969A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D8D921CB3A
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0960F1A000B;
	Wed, 22 May 2024 17:15:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/42] ed: upgrade 1.20.1 -> 1.20.2
Date: Wed, 22 May 2024 17:14:17 +0800
Message-Id: <1716369289-22526-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-1.975100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr9avse85ISVrG5dXdQTj2OJZh
	jmb07zEXCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BMkOX0UoduuUyqa9s+GJg+8FS
	rkmy6/FJjNWj1u8bOO3k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w7JDy
	zkLZ6dgOFoZ/+nBr+sPCAL2zepvqYpwQBVq+8PC+w2IH3x/l5Br/vPB9e4+f8bDD1YRxSkxIYCM
	u3WnHrxIrvEQYn+AQiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199705

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- main_loop.c (command_s): Fix g/x/s/x/x, which failed to skip the
  final newline, printing lines twice.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.20.1.bb => ed_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.20.1.bb => ed_1.20.2.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.20.1.bb b/meta/recipes-extended/ed/ed_1.20.2.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.20.1.bb
rename to meta/recipes-extended/ed/ed_1.20.2.bb
index 9ae53002c3..2b78b080ba 100644
--- a/meta/recipes-extended/ed/ed_1.20.1.bb
+++ b/meta/recipes-extended/ed/ed_1.20.2.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "b1a463b297a141f9876c4b1fcd01477f645cded92168090e9a35db2af4babbca"
+SRC_URI[sha256sum] = "65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.34.1


