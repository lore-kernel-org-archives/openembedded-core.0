Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEC0C2BD05
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.64036.1718936249112223071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Al9bfoQs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936249; x=1750472249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=psYqsM2EkSYjpZdUfqSvAe28QWLHr1Z8GKw5eI/YDpI=;
  b=Al9bfoQsi04pdcW91S9zXT0oUKhvxGPtNcHbxewxqjSVypdZetPiPqGi
   FPZTEmEi5Mj2Ev202/OxuuzXWcHNViZivkLOoBD+gY/TFDqkxyMFjHJZ7
   S9NAMVSCPHtoKOrsD5EeEduIqPAwJEHDn6xdR105w0Xr6K9D1ODNTmbtv
   +uSlzoWSDhppB8yzBTq++I1DK0s11ZQT+nbkzq9Og/rfAZSWj46wdnXWG
   z7OoOBNRL6xpSYK8ciTTcyBwEZrGxOxK2jwOMdhMwey5OJTp3AyFRGGU7
   ATTcBNx47F5dWLYCTIUPVBDTS/LWQQHk/i6oGfV/iZNNyPxM4eetEIwik
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="164461622"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="164461622"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:12 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F99AD8014
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A919BBF4B0
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 37599E5185
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DC3BA1A0002;
	Fri, 21 Jun 2024 10:17:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/22] createrepo-c: upgrade 1.1.1 -> 1.1.2
Date: Fri, 21 Jun 2024 10:16:28 +0800
Message-Id: <1718936206-8080-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--0.267000-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ0nRdgVDNL3Q8rYO92b9NmngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDWbxrqVYQnl0s56lYW06kLcY58va8I/eOmEXHQiOGbnTx9vdPLrpAg0XosaGQOWGtxKsk
	PATUb/eiCVhojB/+YXfZ68Kq3JOvgEOVjMf4VojFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200985

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_1.1.1.bb => createrepo-c_1.1.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.1.1.bb => createrepo-c_1.1.2.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.2.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.1.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.1.2.bb
index e6714629af..85b2901d50 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "78b0c3ff48bd58eb9c0a72879cf1025e9f225684"
+SRCREV = "0ce71adda8a33ede9e9d21b7c18cc58d5a495849"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


