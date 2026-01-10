Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCAFD277F1
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:35 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12774.1768066650610851911
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TubP/0nw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260110173729f65ba0fa5e0002075f-kvrsaw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260110173729f65ba0fa5e0002075f
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iksBmNjvpYgemXH9P96sUmOAYw/1qzVUKtwtXRRAD1Q=;
 b=TubP/0nweZ+s/d0j3Zilj4aZE4kFBi5exnd62GqY+oqlgKwKQ0SyyGYhJbvPIRRnStLILR
 h6ziZwEjt2+YO5qiqMkdOCSmOSOD+lrsfipLWKENNKZwQMdSxV7YOTDApQFx01Xh/Y8T2dYl
 tUs4gJeNUwUQE89U4Mi/qxVtVYreYwwgY1f79CJ/e0KpxVY6bOquLgOfKsgR535Ovjw2K8l/
 KJosNekNNAEy8JOyL+j05F0Am4u+yaEy4eaY180vkotejm8OCdRfzx82G/ZdpS+VSd2E0fj5
 Wrzaxlh9/3bonh46ETNebTiMw5/g7QfIxNneClQ8lh+12A5RsN2YEXug==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 3/4] curl: patch CVE-2025-15079
Date: Sat, 10 Jan 2026 18:36:26 +0100
Message-Id: <20260110173627.1643290-3-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229160

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15079.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-15079.patch            | 32 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-15079.patch b/meta/recipes-support/curl/curl/CVE-2025-15079.patch
new file mode 100644
index 00000000000..47fa518309f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-15079.patch
@@ -0,0 +1,32 @@
+From adca486c125d9a6d9565b9607a19dce803a8b479 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 24 Dec 2025 17:47:03 +0100
+Subject: [PATCH] libssh: set both knownhosts options to the same file
+
+Reported-by: Harry Sintonen
+
+Closes #20092
+
+CVE: CVE-2025-15079
+Upstream-Status: Backport [https://github.com/curl/curl/commit/adca486c125d9a6d9565b9607a19dce803a8b479]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vssh/libssh.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/vssh/libssh.c b/lib/vssh/libssh.c
+index 7d5905c83d..98c109ab59 100644
+--- a/lib/vssh/libssh.c
++++ b/lib/vssh/libssh.c
+@@ -2224,6 +2224,11 @@ static CURLcode myssh_connect(struct Curl_easy *data, bool *done)
+     infof(data, "Known hosts: %s", data->set.str[STRING_SSH_KNOWNHOSTS]);
+     rc = ssh_options_set(ssh->ssh_session, SSH_OPTIONS_KNOWNHOSTS,
+                          data->set.str[STRING_SSH_KNOWNHOSTS]);
++    if(rc == SSH_OK)
++      /* libssh has two separate options for this. Set both to the same file
++         to avoid surprises */
++      rc = ssh_options_set(ssh->ssh_session, SSH_OPTIONS_GLOBAL_KNOWNHOSTS,
++                           data->set.str[STRING_SSH_KNOWNHOSTS]);
+     if(rc != SSH_OK) {
+       failf(data, "Could not set known hosts file path");
+       return CURLE_FAILED_INIT;
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 3134846e57c..85b91ef9582 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://CVE-2025-14017.patch \
     file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
     file://CVE-2025-14819.patch \
+    file://CVE-2025-15079.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

