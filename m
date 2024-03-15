Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D32C54E60
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 03:25:29 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.12481.1710473117392518009
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 20:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y4vGtwXo;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710473117; x=1742009117;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=syuu0ZGK/0S0JrcYbwFlke4C7PrNd0R49H9o7LOISBc=;
  b=Y4vGtwXoMaKDkkEh3OOz7aoNWS5n812aOJwFR47131nvYfb+S/7tqKGU
   b+uynhC/683c+DYIi1aPIxuO3l1l/cO4kDav0vPTOQBr1xfzWYMgFtXTR
   plL53Xg0MvJ8PmALNIDI4w6n+WF7ZCpsk5ffbsHjvEZTWLqrhLr4E5Haa
   dov6fqLlD35BzNi0vOAy/gxWe+D+PrprcrpUBl8lNFqHu5oTZClKwhEb7
   c1zfRdajHWpeNqXXWF+DyR5lyHn0QSqzhi1twhsoFevA99ffRD2GSX/Ib
   HwDJTtAGlUySlykRP/hjc0baOLJihHT8JYvvQo+jqOYQ1F8TpQNDRhDsZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="131125493"
X-IronPort-AV: E=Sophos;i="6.07,127,1708354800"; 
   d="scan'208";a="131125493"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 12:25:14 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B335AC21A6
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 12:25:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E9E8C20535A
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 12:25:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 79C4A20093265
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 12:25:11 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EDD521A006B;
	Fri, 15 Mar 2024 11:25:10 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 1/2] multilib_header.bbclass:Disable multilib_header when fortran is enabled.
Date: Fri, 15 Mar 2024 11:25:07 +0800
Message-Id: <20240315032507.1180727-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28252.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28252.004
X-TMASE-Result: 10--3.457700-10.000000
X-TMASE-MatchedRID: /GwEcVwvwZCzKi4V7faB1wQ6EfMOwvTmQR7lWMXPA1uysPB8dBBorb8F
	Hrw7frluf146W0iUu2tU3a+owMO/ajXcggXei7RXi95/KnWCU3R9LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4I8ZW5ai5WKlycsGWsZ5e56RJtpIRg4oWZLJCJep+CzfHGhJG7cTJwMU7Jy
	gOJZf65o8PoNsnrJrSrbcexBMydGw6gUllh7O6tbmfN3IGGBfZEWW0bEJOTAVAdUD6vW8Z1mZAM
	QMIyK6zB8/x9JIi8hKhgLRzA45JPQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 03:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197125

From: Lei Maohui <leimaohui@fujitsu.com>

It seems that multilib header doesn't work for fortran compiler.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/classes-recipe/multilib_header.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/multilib_header.bbclass b/meta/classes-recipe/multilib_header.bbclass
index 33f7e027f0..5c14c0a7b3 100644
--- a/meta/classes-recipe/multilib_header.bbclass
+++ b/meta/classes-recipe/multilib_header.bbclass
@@ -19,6 +19,12 @@ oe_multilib_header() {
 		;;
 	*)
 	esac
+	case ${FORTRAN} in
+	*fortran*)
+		return
+		;;
+	*)
+	esac
         # For MIPS: "n32" is a special case, which needs to be
         # distinct from both 64-bit and 32-bit.
         case ${TARGET_ARCH} in
-- 
2.25.1


