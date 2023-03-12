Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3678C6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 08:46:31 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.63046.1678610788508753407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 00:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SKR0vWtl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202303120846241b3be235e047a221a2-8byyw8@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202303120846241b3be235e047a221a2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 12 Mar 2023 09:46:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mixitP0onxj7ldmqvIWkFT3WexKmt15A+bliMFnr6hc=;
 b=SKR0vWtlVD5SLX1x17CgC5OGpGxokFpdQka23ibvLzxdrcMOpnHNzg5JmXJ/zEcyZPnAUU
 ao5SKl18cRAwTdbtzQuOcxLJAfuz2rsQI/pSqGssxL0oYhDLfMw1UzI1BFpINtqe6eqjffav
 1EY3uiYdIV5b9AcyKvo0+O8Vn7yZo=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] go: use go as CVE product for all golang recipe veriants
Date: Sun, 12 Mar 2023 09:45:43 +0100
Message-Id: <20230312084543.6279-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 08:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178379

All golang vulnerabilities are reported under product 'go'.

By default there is no vulnerability reported for images with
golang components because none of used golang packages
have correct CVE product set:
* go-binary-native
* go-runtime
* go-cross-*

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-binary-native_1.20.1.bb | 2 ++
 meta/recipes-devtools/go/go-common.inc              | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb b/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
index 3eb80fdcce..239334552a 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
@@ -16,6 +16,8 @@ SRC_URI[go_linux_ppc64le.sha256sum] = "85cfd4b89b48c94030783b6e9e619e35557862358
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
+CVE_PRODUCT = "go"
+
 S = "${WORKDIR}/go"
 
 inherit goarch native
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 83f8db7b39..96e32eeb97 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -19,6 +19,9 @@ S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 
+# all recipe variants are created from the same product
+CVE_PRODUCT = "go"
+
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
 
-- 
2.30.2


