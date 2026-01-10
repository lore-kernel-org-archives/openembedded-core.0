Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833E3D277FE
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:35 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12839.1768066654477478283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XCXKlmz2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026011017373252942fa44900020719-irj9cr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026011017373252942fa44900020719
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=H21TxdATjQdHcj9uA6sHKD+zgpwFg0QaWBWfJGhQtr0=;
 b=XCXKlmz2eTJl/ivp71VwCBFescWgS182M4Bk+sRR+CjiqTo6GQ15RrVwUf1f+MQx523Pxm
 N55fDvZh0PwjFFKw3kBmdKxBl611j37Zbnoi1d91UeYH06TJMxgBRdmI5OEMQ3lToq7CrGhf
 IdaA7ies9NOTzc0HR49y/s8QUspxblCm0eBIX9FTk3C7Mb6ihIgvFDFLPxIADN2gfHPsONxi
 bTr3PdFi6TB16Ji9EcHIe0VRM7gjsqGSZQHsSsB+aQUkhLzM84KJYSdV26eRDli7E2RotyvH
 U+iVdXwHLZes8jqVz6rzYKFC1Q0gDYMh4xbQHqU2jM5un7SqT/w7c4dw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 4/4] curl: patch CVE-2025-15224
Date: Sat, 10 Jan 2026 18:36:27 +0100
Message-Id: <20260110173627.1643290-4-peter.marko@siemens.com>
In-Reply-To: <20260110173627.1643290-1-peter.marko@siemens.com>
References: <20260110173627.1643290-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229161

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15224.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-15224.patch            | 31 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-15224.patch b/meta/recipes-support/curl/curl/CVE-2025-15224.patch
new file mode 100644
index 00000000000..dc07f921006
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-15224.patch
@@ -0,0 +1,31 @@
+From 16d5f2a5660c61cc27bd5f1c7f512391d1c927aa Mon Sep 17 00:00:00 2001
+From: Harry Sintonen <sintonen@iki.fi>
+Date: Mon, 29 Dec 2025 16:56:39 +0100
+Subject: [PATCH] libssh: require private key or user-agent for public key auth
+
+Closes #20110
+
+CVE: CVE-2025-15224
+Upstream-Status: Backport [https://github.com/curl/curl/commit/16d5f2a5660c61cc27bd5f1c7f512391d1c927aa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vssh/libssh.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/vssh/libssh.c b/lib/vssh/libssh.c
+index 5d5125b526..bde6355f73 100644
+--- a/lib/vssh/libssh.c
++++ b/lib/vssh/libssh.c
+@@ -751,7 +751,11 @@ static CURLcode myssh_statemach_act(struct Curl_easy *data, bool *block)
+                 "keyboard-interactive, " : "",
+                 sshc->auth_methods & SSH_AUTH_METHOD_PASSWORD ?
+                 "password": "");
+-        if(sshc->auth_methods & SSH_AUTH_METHOD_PUBLICKEY) {
++  /* For public key auth we need either the private key or
++     CURLSSH_AUTH_AGENT. */
++  if((sshc->auth_methods & SSH_AUTH_METHOD_PUBLICKEY) &&
++    (data->set.str[STRING_SSH_PRIVATE_KEY] ||
++     (data->set.ssh_auth_types & CURLSSH_AUTH_AGENT))) {
+           state(data, SSH_AUTH_PKEY_INIT);
+           infof(data, "Authentication using SSH public key file");
+         }
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 85b91ef9582..ecda13a04e1 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
     file://CVE-2025-14819.patch \
     file://CVE-2025-15079.patch \
+    file://CVE-2025-15224.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

