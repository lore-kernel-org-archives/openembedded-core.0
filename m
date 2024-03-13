Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A72BC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:19 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10636.1710313752750671576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EnjzlmLU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313753; x=1741849753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XCLiZdzTfBpdO+QVHlpap8uMJQp+Ll6COiOhDs+iXQY=;
  b=EnjzlmLUPepp5RcPxlyixVQM5v8itzt3FtZcioRJXywos+KQZS68qGgs
   xCOoq832boUr8AYE559NzsT6wgktwdCS4hLU+7D/xKNgJaMGstcVSZUah
   j3O1wBkD/fX15UdRyhMc7wlLcGfHCyn7ny5orZl7pgF4SWxm7FGLp8bFB
   +ttXtc2gbcqv2cXSDgZfVloJaUk8f/ut2G8D3fSwmI5XOSZ//rXmxw6gZ
   7ZVBzYFElqUugNI62q3P3VK+lf32993WyM/XrKie8ieWr98w+UdMWzeIE
   164Vnb2AvEbgWBVguV5pcthewdxf6APZplRQz/TBJlHLFGkoj0vmwWHet
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="152149419"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="152149419"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:10 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1924E232B2
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 62823D548D
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EEDDA20097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9C2521A006B;
	Wed, 13 Mar 2024 15:09:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/36] libassuan: upgrade 2.5.6 -> 2.5.7
Date: Wed, 13 Mar 2024 15:08:06 +0800
Message-Id: <1710313714-12541-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--5.491600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrKQNhMboqZlowAYdq1VTXo6Ug
	jNaMeaDmql0Ai4V8E/cMXjQFbZmmFE7HN6DyoeIKA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnx4LalWvXBvh38bnPLEpPHdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt/++33r9ZjXwFdIUW/6YUDh2udC3vTJK7NLV/ET4ja6RajAMSQAkD8w==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197010

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* New configure option --with-libtool-modification.
* Change the naming of the 64 bit Windows DLL from libassuan6-0.dll
  to libassuan-0.dll to sync this with what we did for libgpg-error.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libassuan/{libassuan_2.5.6.bb => libassuan_2.5.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.6.bb => libassuan_2.5.7.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.5.6.bb b/meta/recipes-support/libassuan/libassuan_2.5.7.bb
similarity index 93%
rename from meta/recipes-support/libassuan/libassuan_2.5.6.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.7.bb
index 7e899e7399..d1e622635f 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.6.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[sha256sum] = "e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426"
+SRC_URI[sha256sum] = "0103081ffc27838a2e50479153ca105e873d3d65d8a9593282e9c94c7e6afb76"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.34.1


