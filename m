Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A97ED1D48A
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:45 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12783.1768066664091418904
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KXInk5e6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202601101737429f5d3d544d000207a6-okxw7y@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202601101737429f5d3d544d000207a6
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mMg86Biz7BV4ukMbUMUfrbe6xoDKFYHOADaA8RZc4S4=;
 b=KXInk5e6mD8cHKFWQiFh2nBtj/MfRMjasB2x/PebcJngCwIJitCNom1jUf4QIhX3ChJfe6
 5kYmYViYzs7XnPGMR/Pap2wNaoq+vyzMDiPl/bsR6lMlD2rg5Oi8TuytTjEZ+ia2BlUw0eG8
 awHS0+eVjk0LI+rDA1XQykcWkD6YP5urdMt4JbKOGBcCVEBE1WSk3anIUd0PhkI65SkxWnOM
 ukcTwTK+pKvq1DaJV/HYQ97+VlTnLFIc4O0KOg2YbthPZK9koju4OyLTYy2hMdJO8BjHdYEZ
 wM67sOqGbD/SLYHrkOlxV1lwhxx5ntxY6w8tHfcWRUHCGvnVRVfOLcQg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/3] curl: patch CVE-2025-15079
Date: Sat, 10 Jan 2026 18:36:34 +0100
Message-Id: <20260110173635.1643307-2-peter.marko@siemens.com>
In-Reply-To: <20260110173635.1643307-1-peter.marko@siemens.com>
References: <20260110173635.1643307-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229163

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15079.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-15079.patch            | 32 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
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
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index db3dc019290..9c1a90e1912 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -68,6 +68,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-0167.patch \
            file://CVE-2025-9086.patch \
            file://CVE-2025-14017.patch \
+           file://CVE-2025-15079.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

