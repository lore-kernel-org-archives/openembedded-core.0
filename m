Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC687F428C2
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:33:10 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2223.1776277984172690487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 11:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SfJaxQPd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260415183301333be87dd100020761-k7v8eb@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260415183301333be87dd100020761
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 20:33:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qm2JAneQq7EW2gEX5hD2iday4imNUmpQM9iOx8ahDLQ=;
 b=SfJaxQPdXSFm0LH5E0CgZ7vypw2r/iM5L8aBbV7tj/0vN65oPgoGGLKm9FOMUN0pdAi7KG
 zdWCm9SXaq7fu5rhs1Fq/NOxqibk5Hx0pIR2MFUtAqpkjGyVfTtUgHohaNAghUjFV32LLgtu
 ZMlta01fy011cvXdkg0qxkXSPl1U0BZOrUg8+FZb4b6heviZ8dnHflpLQACkRoSHJ2RHUwkq
 uLzPYyV1gwu4HZt7v0utJh+fVRK04jLGyDBqmN+pM3v1sYp1w5drZZOkpuXgfdPY53I+S4Tg
 ySWFSLlV6f9BGCgKnKBBvR6n77PCbFNS6yRppQh9nA4/dRjlvz3yVhMg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] go: set status for CVE-2024-24786
Date: Wed, 15 Apr 2026 20:32:57 +0200
Message-ID: <20260415183257.1868823-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 18:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235320

From: Peter Marko <peter.marko@siemens.com>

cvelistV5 has wrong CPE:
* "cpe:2.3:a:golang:go:*:*:*:*:*:*:*:*"

The CVE is actually for golang-google-protobuf as links in the CVE
report prove:
* https://pkg.go.dev/vuln/GO-2024-2611

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-binary-native_1.26.2.bb | 1 +
 meta/recipes-devtools/go/go-common.inc              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.2.bb b/meta/recipes-devtools/go/go-binary-native_1.26.2.bb
index 380174f3cb..d9006373f6 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.2.bb
@@ -18,6 +18,7 @@ UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
 CVE_PRODUCT = "golang:go"
 CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2024-24786] = "cpe-incorrect: this CVE is for golang-google-protobuf"
 
 S = "${UNPACKDIR}/go"
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 061db4296c..5d0177bdb6 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -22,6 +22,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 # all recipe variants are created from the same product
 CVE_PRODUCT = "golang:go"
 CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2024-24786] = "cpe-incorrect: this CVE is for golang-google-protobuf"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"

