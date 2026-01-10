Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882F8D277FD
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:25 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12831.1768066634168243881
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JLgywwnM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260110173716776d4da1090002079f-zhzw8x@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260110173716776d4da1090002079f
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9ctDsfMYfFoUbEe06nj8qnqed5deoawvmDjfLg55+RM=;
 b=JLgywwnMU0A5QfYYfjSfMNoPU+a1K00kpkR4VrprPWBUn14z3UBrC03WQwrPK5/LJKHxu1
 60+3rK//wniaw+VDC0993+fr6jg+9ScAsDl8LDNIqBZ/85vBQ2t8mYAYZlRI0vGhG1piUCt7
 5NYBESGtBZ+2y5OxaVAJa13hDLD0Q3vysM1CT3sjeeB6SVI4OCLIXv4NggGkyt0M6zaRPyFf
 7DkdI5ORodiVvLgYb6qVk7Qlt1/ajofrRHUFBxp0oTrTNfY/6ecfm0LAKIzhTZrYMnxk+jpp
 T/7iZE66MbZAQP/cGFjWpm5+/jKXFZfUGX82xbV9MiBKL6z3RxZX+s5g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 6/6] curl: patch CVE-2025-15224
Date: Sat, 10 Jan 2026 18:36:39 +0100
Message-Id: <20260110173639.1643322-6-peter.marko@siemens.com>
In-Reply-To: <20260110173639.1643322-1-peter.marko@siemens.com>
References: <20260110173639.1643322-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229157

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15224.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-15224.patch            | 31 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-15224.patch b/meta/recipes-support/curl/curl/CVE-2025-15224.patch
new file mode 100644
index 0000000000..a8308b87a1
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
+@@ -935,7 +935,11 @@ static int myssh_in_AUTHLIST(struct Curl_easy *data,
+           "keyboard-interactive, " : "",
+           sshc->auth_methods & SSH_AUTH_METHOD_PASSWORD ?
+           "password": "");
+-  if(sshc->auth_methods & SSH_AUTH_METHOD_PUBLICKEY) {
++  /* For public key auth we need either the private key or
++     CURLSSH_AUTH_AGENT. */
++  if((sshc->auth_methods & SSH_AUTH_METHOD_PUBLICKEY) &&
++    (data->set.str[STRING_SSH_PRIVATE_KEY] ||
++     (data->set.ssh_auth_types & CURLSSH_AUTH_AGENT))) {
+     myssh_to(data, sshc, SSH_AUTH_PKEY_INIT);
+     infof(data, "Authentication using SSH public key file");
+   }
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index a0022f3a3f..739838c3e8 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://CVE-2025-14524.patch \
     file://CVE-2025-14819.patch \
     file://CVE-2025-15079.patch \
+    file://CVE-2025-15224.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

