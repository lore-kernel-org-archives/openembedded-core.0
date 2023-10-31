Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C5EC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 18:04:03 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.2682.1698775439751937537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 11:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=R1WRMsFi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20231031180356246ddd478656e162eb-yvyd8_@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20231031180356246ddd478656e162eb
        for <openembedded-core@lists.openembedded.org>;
        Tue, 31 Oct 2023 19:03:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mstnfo+Z/gUPJ+rN6EHDAPVsHjkEFZ9Cp3HUWGyrvJU=;
 b=R1WRMsFimyi9VpPke4IqZp9LoLIg8dLbeVWFWJta/b1AsPCeeLkEY6+YEbeJggQzXj2hnx
 qzdYTVTKhXwXW/gemzZIl8FGf068Rq68Y5yMKfuRZiiQGEpSl9fUIGn8NTcbIAUGindTU+xE
 j935URso4diXimC8qghRXaWNDl5Ao=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glibc: ignore CVE-2023-4527
Date: Tue, 31 Oct 2023 19:03:14 +0100
Message-Id: <20231031180314.7585-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 18:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189865

From: Peter Marko <peter.marko@siemens.com>

This vulnerability was introduced in 2.36, so 2.35 is not vulnerable.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc_2.35.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 271520f76b..21cd99dfdd 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -16,6 +16,13 @@ CVE_CHECK_IGNORE += "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
 # Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=22853
 CVE_CHECK_IGNORE += "CVE-2019-1010025"
 
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4527
+# This vulnerability was introduced in 2.36 by commit
+# f282cdbe7f436c75864e5640a409a10485e9abb2 resolv: Implement no-aaaa stub resolver option
+# so our version is not yet vulnerable
+# See https://sourceware.org/bugzilla/show_bug.cgi?id=30842
+CVE_CHECK_IGNORE += "CVE-2023-4527"
+
 # To avoid these in cve-check reports since the recipe version did not change
 CVE_CHECK_IGNORE += "CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156"
 
-- 
2.30.2


