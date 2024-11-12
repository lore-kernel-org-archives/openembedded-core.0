Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52466D32D65
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.82747.1731403556554476026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cTgetMyw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403556; x=1762939556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1JG8f6iC+5d0m8yPVkfH/uEeEJ4eP28Z20fPEnTUN88=;
  b=cTgetMywbkp6a3RnTvcv/DSKLeZ2gZjismLVICbnu2rlsuud3kYOrrL+
   5tTAXgohvLyCCIBUHjcopIqNSkH/7jTvZ40hjmLHkd6nVxLBbXfrJtJaD
   AYrtrOhMky6tg9GjKZtpXlvIjav2YdGtUViekUejzCsyZumZCxEKl+O0u
   tn8fVEawZEEiKyT9Djr1HvTg1u/m+CShMyHCWFnyYqGRS4y1fKJb33rCD
   UfqvR0QbaM7FfmZ8O9RrM0uajpopNvZGYclNDLtJvFmVlmOHoZbVgj5ZW
   JXw4uNaiJZFrYFIcvVOIGnzGOjetMLAzd74F2sgzsi6c+ReUvYABlLqMs
   w==;
X-CSE-ConnectionGUID: Nexw2xg1RsmqzdfJU4JXcw==
X-CSE-MsgGUID: Bz+VfCBEQnKr3XXdlJNFAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180266532"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180266532"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:54 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70BBCD647A
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EF854BCB82
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F15920071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3EA2D1A000A;
	Tue, 12 Nov 2024 17:25:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/47] python3-websockets: upgrade 13.1 -> 14.0
Date: Tue, 12 Nov 2024 17:24:34 +0800
Message-Id: <1731403483-21399-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-3.677700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhFeNs5tWYvjCfyg
	PFWK0n1N4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFE6ZYpl+Iebkbn6jQszF3YGJnb
	P7NFAwafSXo0LRyPKS6KfgvlAytnjInkS4m2YQACRPj5GGVRWnQRTQxA9AjRX3M3YFNlH12ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207025

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://websockets.readthedocs.io/en/stable/project/changelog.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-websockets_13.1.bb => python3-websockets_14.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_13.1.bb => python3-websockets_14.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_13.1.bb b/meta/recipes-devtools/python/python3-websockets_14.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_13.1.bb
rename to meta/recipes-devtools/python/python3-websockets_14.0.bb
index 36838745ca..00c6109864 100644
--- a/meta/recipes-devtools/python/python3-websockets_13.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a3b3366087c1bc0a2795111edcadddb8b3b59509d5db5d7ea3fdd69f954a8878"
+SRC_URI[sha256sum] = "be90aa6dab180fed523c0c10a6729ad16c9ba79067402d01a4d8aa7ce48d4084"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


