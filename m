Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCC3C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 16:52:12 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.4669.1750351922403446669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 09:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=DzhPKHh7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250619165159e3b9541f70fac65be2-qn0a1b@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250619165159e3b9541f70fac65be2
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Jun 2025 18:51:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=N62YoT3KF8AbXgzrljRROTxJ6UUk3mz7UtCH/ZgTNu8=;
 b=DzhPKHh7s4Jo5ABwK6nlKIze0kOfM7WcFwdD0QTRyiqfNNQeWLE9nWuEA8UzkzJPx6sVyl
 4yAtToH+BiKDsjnZtq6cv/rWDsHCaZgLgWryWJ5ACxp7VdHwbMAy+qc2oBLqIgxUu315rpL8
 RAXWjIAVntsko8ZPKa/0gXCjHgUj1KuLcmVd/pVEjPQnOJdTP0DoIxgcXODRqNEF42P+2S2H
 Aa+ILugoBCgDnfNejQhJeNn432JExFeOlkWBuYdeUdlOIitBYq53ZtG8GXBhLHgJlDksV6dk
 8d6SqUSuMQxcD3hN2l7Nvmdo0TewH0QET910BxcjcI8VbMG2kr3OA+nQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] go: set status of CVE-2024-3566
Date: Thu, 19 Jun 2025 18:51:13 +0200
Message-Id: <20250619165113.15120-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 16:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219092

From: Peter Marko <peter.marko@siemens.com>

NVD ([1]) tracks this as:
cpe:2.3:a:golang:go:*:*:*:*:*:*:*:*
Running on/with
  cpe:2.3:o:microsoft:windows:-:*:*:*:*:*:*:*

Yocto cve-check ignores the "Running on/with", so it needs to be ignored
explicitly.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-3566

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-binary-native_1.24.4.bb | 1 +
 meta/recipes-devtools/go/go-common.inc              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb b/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
index 9f788536c4..a5324d0f06 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
 CVE_PRODUCT = "golang:go"
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
 
 S = "${WORKDIR}/go"
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index ca8469dbd9..a79c90faf8 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -21,6 +21,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 
 # all recipe variants are created from the same product
 CVE_PRODUCT = "golang:go"
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"

