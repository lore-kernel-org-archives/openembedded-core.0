Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446DBC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 16:50:12 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.4644.1750351804787495024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 09:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=yOA/2yQj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2025061916500173099a7bcd1d457f0d-3pzyn6@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2025061916500173099a7bcd1d457f0d
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Jun 2025 18:50:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QTU4ks5a5FCQS6lsfKQ7dxMgPVTT6jFVVlT0uyoPgTE=;
 b=yOA/2yQjNZXov35E8QQBy835Bsvrs0SIt5Zf1CgjR1bZL/l6fJjaoTBkjCCD3k+AvIG3y6
 PjnFDihBK+k3ulPAooehRTvQFNZ4u3awO4/NQ668gpfIwLY2n+Tx6oxNCFQF/AlbQ4yOraXf
 ncLXP+zuG/vSikaXvGuWf14uBoIA5HgdFgzuskhhbOOG6kEFMoOJAFjTW5jqXsHAdrQCNMMn
 90M6pmM+76rgcBBSkNlRrlGxpEMKq+OvR1iC0kUnUdp1tkEDwZOwhO5JRsIpKg1R9UzOBBB7
 rE6sd1xHkjLy6eQ7I4OwapmQKhIj6EvtnumdWzfGD+CXRtvRW32+fBSQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] go: ignore CVE-2024-3566
Date: Thu, 19 Jun 2025 18:49:11 +0200
Message-Id: <20250619164911.14992-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 16:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219090

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
 meta/recipes-devtools/go/go-binary-native_1.17.13.bb | 3 +++
 meta/recipes-devtools/go/go-common.inc               | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.13.bb b/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
index 4ee0148417..0f356b0e79 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
@@ -14,6 +14,9 @@ SRC_URI[go_linux_arm64.sha256sum] = "914daad3f011cc2014dea799bb7490442677e4ad6de
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2024-3566"
+
 S = "${WORKDIR}/go"
 
 inherit goarch native
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 83f8db7b39..e2ffba27bd 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -19,6 +19,9 @@ S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2024-3566"
+
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
 

