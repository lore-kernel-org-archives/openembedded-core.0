Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51937C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.11795.1713948192635729210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TEpLVkwy;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948192; x=1745484192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ssnxYSEbUNMQR2aA/GMWU/3I5vtyyeRUCyi5gjsmPBY=;
  b=TEpLVkwyuEmNZQfYXUVFmNGjpix9fvMuufmv7ZB5qJGLWN4ZZrJuiiez
   pJjlFri107pWx8B0kCWVsePycDQskqYwjUKYyRfyOyhmQNamKTRfQBz0e
   C92A/w6FstFS+92wWHEXnqvs7qf84raInq0ny49iL7vPKxiHTSjsEr+/9
   XknzKByaNZQ2k2M2zq/snS/CEMMZpUz6Nk3jGy66hHSWBrOHmAOLi9v53
   xiDgGuqvay3STe/fCc7eTv933Ng2L36voVQWNueKoLpuEANX2P14a/X9Z
   +CpT95LsTcBmlQUxyrdE7Rw3ju/epCOqReaC4Al3d9E89S/0tdclo+07g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="135369234"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="135369234"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 35337D9DC5
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CA10BDCA8
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 148DF202CE122
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B3FC41A000A;
	Wed, 24 Apr 2024 16:43:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/38] stress-ng: upgrade 0.17.06 -> 0.17.07
Date: Wed, 24 Apr 2024 16:42:27 +0800
Message-Id: <1713948152-13501-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-3.054000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrG24YVeuZGmOjY8EXdBUdH42p
	+2yi2NlX4K9FmervsqVjKNl8TeTtPW0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI3lq3YEgY6JmFp9qfciji9rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNdf/SIq+QYRppYyXEG/w6acZwBrghVhtOK8WyO+YOJYPmB5Ybhi1FHTB4wsEq7Rg4p2fY
	5UelVy9eO0P3MQ5gGcUpZJsR4SurWOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198679

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Porting fixes to support modern Solaris systems
- Improve vecshuf performance (regression due to using -O3 on gcc on vec ops)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.17.06.bb => stress-ng_0.17.07.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.17.06.bb => stress-ng_0.17.07.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.17.06.bb b/meta/recipes-extended/stress-ng/stress-ng_0.17.07.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.17.06.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.17.07.bb
index a52b70d22f..fb88e06a7f 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.17.06.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.17.07.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "e6bda983cb48a201b6af173204372c7b37d6411f"
+SRCREV = "519151f460738cd62b69b84f8096cd218131e0a2"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.34.1


