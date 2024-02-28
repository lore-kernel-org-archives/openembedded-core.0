Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03858C54E5B
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8408.1709105593017007319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X5HaOad3;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105593; x=1740641593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uH251X7odUTVZt/Wr+bJ3w2NtlYurFfnzffUMNL4QOI=;
  b=X5HaOad3nS0QMJ9pZzOe3ov7/K8OxrEegdg8vRcWs+STCv/usGtDslpi
   pwuEePJYLQRcfu4GNFr/UFdl9lrgf30dLpZHDgNPEQSZgY53Bb3hoRh0z
   PNCYS5yoMg9EAu00th4wlrNni5Y/yef8R8/5CDmIPpAuvq8vqXIxk1klQ
   vzvqLFbjqwgRQj5EnmFIfopDFIqeYugneya0cbJBboGkywPGETzxma+S9
   HJfgjLzf3X9VKcrGCC9HIUdXW9YRxFxJbAl3egdDvQXECdXi1gYHwG/lT
   3T4ts3mdaPovHOXIcOjVnUCd9sGKISE2yiuPr9Uj6jGG9zaUqxzIGchPj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="139129110"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="139129110"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:10 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C4971590F7
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BF74D5C3C
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E83DF2008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 948071A006A;
	Wed, 28 Feb 2024 15:33:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/48] dnf: upgrade 4.18.2 -> 4.19.0
Date: Wed, 28 Feb 2024 15:32:11 +0800
Message-Id: <1709105575-24259-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--6.829500-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mr2+EDPw+8xreElHW9I/+NxdcO
	gA4OgUBvjDVMw6TJvuGZdBSihoG27oadzrWEfJJMqoeab9Xgz8/Q2dRRUyVMprKw8Hx0EGitgg8
	W5tsFXIChOywUZIftbeaffHI8kAmiHY/bzRmIaZGTeuX4xo2DECUnLzk1+IxzLEzDQUyQGVmRcy
	UBIWzD8aTEm5WTmjEytz9kIuTkBq64lcR4ssnr7G9OepgphdNGfS0Ip2eEHnwj/1Rbkzl1E2nuo
	SGaY+DLjoczmuoPCq0bLXitUoxARCfF0E9LdKPYHgiWkFbjQaq8eYS9iik4XPkctFWYM4nT
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196328

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Do not load filelists metadata by default
-Disable deltarpm support
-Add a hint for user on transaction file dependency failure
-Fix failing API unit test on rawhide (RhBug:2261066)
-automatic: Use add_security_filters, not _update_security_filters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dnf/{dnf_4.18.2.bb => dnf_4.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.18.2.bb => dnf_4.19.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.18.2.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.18.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.19.0.bb
index dc0c18be5e..784d7a94b3 100644
--- a/meta/recipes-devtools/dnf/dnf_4.18.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "1c43d0999178d492381ad0b43917ffd9c74016f8"
+SRCREV = "566a61f9d8a2830ac6dcc3a94c59224cef1c3d03"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


