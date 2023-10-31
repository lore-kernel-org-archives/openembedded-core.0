Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07F6C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 18:10:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.2999.1698775840456372131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 11:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KRRiUH4B;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202310311810373ace985eab983ee325-r7haxr@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202310311810373ace985eab983ee325
        for <openembedded-core@lists.openembedded.org>;
        Tue, 31 Oct 2023 19:10:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=m2DRyAcNaMFeoHw3MU3NS5p1l/LJlFVGR2TDJTrP+Wc=;
 b=KRRiUH4Bj9RwpL3qiLxGc5GxVl00GWzyT55Qm2v3mWjWF0kEAFJj+2t2J034Arfma08pCe
 eSiCjR5GNYzI1FF7UnoJoPXdDIWEGBGHEXq69lXCqTzlOHRFgpJIORPqPQlTey+a5wuUu24I
 atpQTlkgaeB9AuJUqliR0n9hs4Ius=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] glibc: ignore CVE-2023-4527
Date: Tue, 31 Oct 2023 19:09:55 +0100
Message-Id: <20231031180955.8430-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 18:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189866

From: Peter Marko <peter.marko@siemens.com>

This vulnerability was introduced in 2.36, so 2.31 is not vulnerable.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc_2.31.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 1862586749..8298088323 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -29,6 +29,13 @@ CVE_CHECK_WHITELIST += "CVE-2019-1010025"
 # https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=dunfell&id=e1e89ff7d75c3d2223f9e3bd875b9b0c5e15836b
 CVE_CHECK_WHITELIST += "CVE-2021-35942"
 
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4527
+# This vulnerability was introduced in 2.36 by commit
+# f282cdbe7f436c75864e5640a409a10485e9abb2 resolv: Implement no-aaaa stub resolver option
+# so our version is not yet vulnerable
+# See https://sourceware.org/bugzilla/show_bug.cgi?id=30842
+CVE_CHECK_WHITELIST += "CVE-2023-4527"
+
 DEPENDS += "gperf-native bison-native make-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.30.2


