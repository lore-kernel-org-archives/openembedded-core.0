Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F71CD3435
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.18358.1725352396754184972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XNx8OJmM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352401; x=1756888401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=77xxr82fVr37g1BgZAIrtJwmZSU4Y1H89q3E5OoAPuY=;
  b=XNx8OJmMHlYCOTTZFucU3XTqNtehQVa/k6+Scwr7Vj6KI3kiqSklTsj1
   2VqNnfdEANl2wIYJUiurD46XWJPRLeK/IL0bR9tTlEm7CsgLkXSvGwZyl
   lt9kSznPLwdIWrcAmwrXahz2xEs25EEmmzcQ5iiTUalLKbKODV4Yccxxf
   wlpiOTUsYrnLVzQK7Hb0l87R3Ow9W7bEMW21MjwzEmnPSGfn7aG6fNHNe
   3pcqf0YXuhyBnf9XLt4qHsmjgRaKifB2HB2pWRFWohF3mk4vnk7zOgw/x
   JVyX+n/Uadk91Ti+fArGWy2keIrBVgBOKekmu2e3A0oPImglTbZmuDg63
   A==;
X-CSE-ConnectionGUID: l5KJynekS62PSdjR32tq3A==
X-CSE-MsgGUID: NOej/ezhRB2ARxfuT4r8Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="151429539"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="151429539"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EB753CC156
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AB65BF3D4
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BCD696C811
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 623621A000C;
	Tue,  3 Sep 2024 16:33:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/22] python3-websockets: upgrade 12.0 -> 13.0.1
Date: Tue,  3 Sep 2024 16:32:55 +0800
Message-Id: <1725352379-20334-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10-4.894700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBhR1Y/uhfqyPyg
	PFWK0n1N4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFLp/aTlSME7aV8HpVS+c1Hoqzg
	1TR4hFGOeHHqi1tz2dfptiMFqVoapjpqGqtiGthKN/MfgXlGZ+gbuEGjTI2ihjllzengWsdux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204142

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/python-websockets/websockets/blob/main/docs/project/changelog.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-websockets_12.0.bb => python3-websockets_13.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_12.0.bb => python3-websockets_13.0.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_12.0.bb b/meta/recipes-devtools/python/python3-websockets_13.0.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_12.0.bb
rename to meta/recipes-devtools/python/python3-websockets_13.0.1.bb
index e7f5e29523..6a66375cdf 100644
--- a/meta/recipes-devtools/python/python3-websockets_12.0.bb
+++ b/meta/recipes-devtools/python/python3-websockets_13.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "81df9cbcbb6c260de1e007e58c011bfebe2dafc8435107b0537f393dd38c8b1b"
+SRC_URI[sha256sum] = "4d6ece65099411cfd9a48d13701d7438d9c34f479046b34c50ff60bb8834e43e"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


