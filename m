Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FFDD277FC
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:15 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12831.1768066634168243881
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dgym940E;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260110173712693f1fc3ae000207e9-go5q4t@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260110173712693f1fc3ae000207e9
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/dDuYuVkktUU/JLBgB0PlxrCEvHxnLy2hGlTRbgCAyU=;
 b=dgym940E5pluTjq6NRMPETaq1trYWYjeWScH5nCsmUotXktcdw8tWk/bMyNqY//FJH/PK0
 KGeXnT1zpJrjzv1oO1m+5Z0Mc59z95exWAsk+VH4E+4DfBJOI8fWsZ6h4lHVvLkDA/HhGLBg
 wlbIkoZidoiHjDk2d7S+WW+oBJ76OSVO+vyWvh+S0JcqQ1/IciwipmgJmleisn9q/Q9tcl/c
 SjTuT2J7kpEgQZaOsmbjg5jXBJgufzUF1AJ2x0vsp8I6M6X1ux/Vogpl87LH9+V5fGIiJwRN
 nt73UeWpdy4SlUinpgkD1Ty88y72C2Ai3wWc0zw59bezwdDMK+tvhCJA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 5/6] curl: patch CVE-2025-15079
Date: Sat, 10 Jan 2026 18:36:38 +0100
Message-Id: <20260110173639.1643322-5-peter.marko@siemens.com>
In-Reply-To: <20260110173639.1643322-1-peter.marko@siemens.com>
References: <20260110173639.1643322-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229156

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15079.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-15079.patch            | 32 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-15079.patch b/meta/recipes-support/curl/curl/CVE-2025-15079.patch
new file mode 100644
index 0000000000..2320e56d68
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
+@@ -2670,6 +2670,11 @@ static CURLcode myssh_connect(struct Curl_easy *data, bool *done)
+     infof(data, "Known hosts: %s", data->set.str[STRING_SSH_KNOWNHOSTS]);
+     rc = ssh_options_set(sshc->ssh_session, SSH_OPTIONS_KNOWNHOSTS,
+                          data->set.str[STRING_SSH_KNOWNHOSTS]);
++    if(rc == SSH_OK)
++      /* libssh has two separate options for this. Set both to the same file
++         to avoid surprises */
++      rc = ssh_options_set(sshc->ssh_session, SSH_OPTIONS_GLOBAL_KNOWNHOSTS,
++                           data->set.str[STRING_SSH_KNOWNHOSTS]);
+     if(rc != SSH_OK) {
+       failf(data, "Could not set known hosts file path");
+       return CURLE_FAILED_INIT;
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 948769e0fb..a0022f3a3f 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://CVE-2025-14017.patch \
     file://CVE-2025-14524.patch \
     file://CVE-2025-14819.patch \
+    file://CVE-2025-15079.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

