Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E69DCD129C
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.130221.1712646653922232115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HuY6xmfp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646656; x=1744182656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XreI7jFERzmVREKpeGMfrQuShTDlxhaafjWyPpYFjtQ=;
  b=HuY6xmfpfkNqakHrThHtrv5p11lv1Fs+WLM6TM4X7P0MxVr7h0arJ6f+
   sA/g96Vn0+x1kw946nwRXlvYDgLb9/7HB8q5QaV4+cXFDdF6NPlXJAbG7
   27fiBZYz12KwTPuxVthlg/gG0MzsxdNBpue6vYKsodlQIMw61N1xbzfMK
   bmAGeN72+pEJ1lJtu60RP3RRv5XM9ucNXNVHtJJ5TA5Jod78qhyW/p6Tl
   1LoIY/ibvrU9RPzNRvv1H3gTaFS5Kj5rxWQ3umL25bVANt5ziQcVHYfR8
   FKfzd8QchdfRqjjz3O7257SQn/OMZqxdsUvqI2GhBiwg5v+u9astbmK/a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="143011386"
X-IronPort-AV: E=Sophos;i="6.07,189,1708354800"; 
   d="scan'208";a="143011386"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BAA752E9CD
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 029AD4E706
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E99420093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D9351A0002;
	Tue,  9 Apr 2024 15:10:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/33] u-boot: upgrade 2024.01 -> 2024.04
Date: Tue,  9 Apr 2024 15:10:19 +0800
Message-Id: <1712646620-16608-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10--1.035800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yfx0ykrbAxjCRzUPAqhCjtg5PNIHdYIVoNnf
	JrUSEbFDJMPD8FR5f58boCivyaDEErVQ6XPWwtdyEXjPIvKd74D2W3gEBC4gVJ41oureLzB3sVb
	pW3HjybGmIBacX3IhSmFp9qfciji9kfRhdidsajMURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO25V9
	z3vqk3Krj3eRwDU5014nIyoKptA4DsSqDpL0+eGmPobuxtqoeo1/9xaUoZgul612PQu9GSRl7IE
	BRjpAisWhIpbeg6m75VtUpMiiBMFvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198052

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2024.01.bb => u-boot-tools_2024.04.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2024.01.bb => u-boot_2024.04.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2024.01.bb => u-boot-tools_2024.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2024.01.bb => u-boot_2024.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1f17bd7d0a..ca5357392a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
+SRCREV = "25049ad560826f7dc1c4740883b0016014a59789"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot_2024.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2024.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2024.04.bb
-- 
2.34.1


