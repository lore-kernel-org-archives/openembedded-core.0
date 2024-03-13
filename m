Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF8FC54E78
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10639.1710313762879667234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jsnt4OTn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313763; x=1741849763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vaztHwMUMHso//zIThe0MUDdllRLcEGu0UgorqyId5o=;
  b=Jsnt4OTnatKnyQAb8hBnrcV8Xpb+ajNmk4pvY56A9M08jllYSWvi756A
   85nV6hW6oWWgf0xR6y4YsyZstyVqv1IkbOIVhqtvX4VYdSoev31sJ/Y5Q
   fGe+66gh0dRJ9o7kqzvow7XXh/1lLAABsLRTpvohe2TufmwcMCD1jsSvI
   jQQlJIkHIPIGWOK0zXqmI/LMytez1FLG+Peg66XgKJfBlx+0vxt3ieyGQ
   /0vLGBng2jolN+DIpQUV58ZBybE4B8KS2gk5+1P1ZsMIr1O+8gGxGUTki
   RfmbXrcTQ0NcKlCCEgts1BKjgr7AbUYphibINMESrR6XdWdTTRsCKn97e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="152149440"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="152149440"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B067AD4802
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E1677D88DC
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E07C20097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B6BB1A006B;
	Wed, 13 Mar 2024 15:09:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/36] lzip: upgrade 1.24 -> 1.24.1
Date: Wed, 13 Mar 2024 15:08:13 +0800
Message-Id: <1710313714-12541-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-2.071400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr9avse85ISVp4YeSlHZYFou79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gEQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSz6F6AVfMoPeMmUe
	6py6TTLNubfPp0Xlj+DJLSbK8yTojo5aA+4Hq+PrzFMoj33+2iSlGRh6vNrbq0pd2okq1lfnn77
	UOOa91yiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197018

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 main.cc: Fix compilation failure on MinGW because of mkdir.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/lzip/{lzip_1.24.bb => lzip_1.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzip_1.24.bb => lzip_1.24.1.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzip_1.24.bb b/meta/recipes-extended/lzip/lzip_1.24.1.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzip_1.24.bb
rename to meta/recipes-extended/lzip/lzip_1.24.1.bb
index 73040a6f00..6eda012734 100644
--- a/meta/recipes-extended/lzip/lzip_1.24.bb
+++ b/meta/recipes-extended/lzip/lzip_1.24.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d42659229b10e066eeb6e81eb673cdd893b672e512d26719c2d95975556ca56c"
+SRC_URI[sha256sum] = "30c9cb6a0605f479c496c376eb629a48b0a1696d167e3c1e090c5defa481b162"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.34.1


