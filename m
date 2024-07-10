Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81F2C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:18 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10228.1720604655855506421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t28sQYli;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604656; x=1752140656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aQBKXL7gdI+LbW9ugXuVd9ymGHErAFCfHx/u49mjnn0=;
  b=t28sQYlih6VOls6OvBsT/4CvEPOn9Pr3mEjSNTMrL0Oa/0UZaNOCoBmu
   ifJys1na+eVcFJGdpVFH6wkM4q0UOHVYCQtwEQMA+cml2lXIqhByTemCE
   i8r2b6fSr+tuYRCqCOIVHqFhfDfPj9RCofdWoAxntHlgqfDCrhWeSxnUQ
   c8c12J/ASgrWo90FTxRsg0l4qGsuJ8T8X6PY2+3NNXim+wuZelQvyzWqj
   41iuJWxf/3GFqVoMmORvnwbRADyRblRjbYQmvXhX8aArgUZa6oITB3B30
   uw6ASjTVY2IUjQhktdRfZAQQjQjss43OoXXRE7dO/KPF3NCoEiVUtWYPx
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="145971263"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="145971263"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:14 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E5BCC9160
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C3466D5110
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A8E82005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1BAFB1A0002;
	Wed, 10 Jul 2024 17:44:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/30] debianutils: upgrade 5.19 -> 5.20
Date: Wed, 10 Jul 2024 17:43:30 +0800
Message-Id: <1720604634-23406-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--1.538500-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeWAI7Mvq/sL53X2
	dWwZpMyX4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLzflyoTkWhRYAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzt7qnAEflsDv9UG
	redZVGbhZVTyEauMzJMSEDg5QWMNpY7pySMmrimtr3WqUPkDtUb/NmEV3iFDRcw3xy6iCbpd/y1
	QU+JJcsiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201702

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- acinclude.m4: Bump DEBIANUTILS_VERSION from 5.18 to 5.20.
- installkernel: Recognize "Image" as an uncompressed image basename

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../debianutils/{debianutils_5.19.bb => debianutils_5.20.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.19.bb => debianutils_5.20.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.19.bb b/meta/recipes-support/debianutils/debianutils_5.20.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.19.bb
rename to meta/recipes-support/debianutils/debianutils_5.20.bb
index 0fe9b1ec14..61438121da 100644
--- a/meta/recipes-support/debianutils/debianutils_5.19.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.20.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "295d7674cdd526f3c9ec9de76db50efa280a5df0"
+SRCREV = "9f3d6fa6b8d91849a78d681294fa8ea7bfa9086f"
 
 inherit autotools update-alternatives
 
-- 
2.34.1


