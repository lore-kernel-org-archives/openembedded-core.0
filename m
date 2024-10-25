Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A891D11706
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.5573.1729834798103729525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q+3YmNRJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834798; x=1761370798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BBMPkcvBY/ZaH4S3oXz8x/smuiZltIC6WgsUfUl+rnY=;
  b=Q+3YmNRJ3alDZ3PNTRr/TkygQMt2R2Fu5G5mxlbAZzIL5GMra1TlElUw
   ivx43D7tSa0lTVs2lOUPBFGcxFjahbQryVFu5siwEs04trtjLPmX7ykGC
   GBdFk/7u3I0hWn1jdWSyMTmg0+9Dd+kc8mIxmiHYYQtFW/4m+W7WHQEH6
   RM5retWPx12kN0ZZGwIgMmTD6JYdsekax5hxgUW5SDXwi8z6LRk/IQPpf
   ZGjWCmapQxQvbpVEBZdf2ZX8lJFBaIdGshduxlp0CgIUKmO287mpvryqh
   oEzL0fQkUzWBzQcCRoNWFnBpHKMbpehjZJ5r8gIUMjdCGQhAiE3nF25kM
   A==;
X-CSE-ConnectionGUID: uihfu9h9S++vxrYcs8U3Cw==
X-CSE-MsgGUID: 70DcSqY+TAu+47Ki7WWtHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="157414278"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="157414278"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA539E8520
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CC2ECF7C3
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BAD98E5A29
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 846621A01E9;
	Fri, 25 Oct 2024 13:39:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/22] libubootenv: upgrade 0.3.5 -> 0.3.6
Date: Fri, 25 Oct 2024 13:39:14 +0800
Message-Id: <1729834769-4717-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10-0.336400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4BRGm59kznCxgH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRsAtH/ey8zRp6B5jk2TXXjFcPJ
	wtFCyaEPi8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFCAcDR+94XwHiIh8kTh0XWq0Po
	+HMGte6mAXBC62rdslVc/T3GV4S+MTi3MGHEla7Sated2yqqYX85D/6A3Vj0lv6mqsIMUY7ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206318

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../u-boot/{libubootenv_0.3.5.bb => libubootenv_0.3.6.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.5.bb => libubootenv_0.3.6.bb} (93%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
similarity index 93%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
index b68bbb430a..8c7a59ba96 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951
 SECTION = "libs"
 
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
-SRCREV = "3f4d15e36ceb58085b08dd13f3f2788e9299877b"
+SRCREV = "5507339628b5caf244e1ff9d58cb3fa534b16beb"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


