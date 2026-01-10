Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85787D232D3
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 17:37:55 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12785.1768066668169985212
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 09:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eiwrc0ZY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260110173746b8e19b6a900002073b-1srezc@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260110173746b8e19b6a900002073b
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 18:37:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=T+t0TKsNsjMCRvXw1ur6TEVQUfSpOreaqzYbBw9B5X4=;
 b=eiwrc0ZYIO9Wl5AM7oIBWXGtCshSOnOMkpgVt0PEucihv6Bwnbf62pStLeUKS4NURcIhJ6
 ab0ZsBQ+tD5RhvqpfWnHwEF/AKGXdv2iOSfkIqhvOhkjKgt13809UTKyVkiEJkAnLsC16YhT
 nZp9snMyvzzlkK6wq4SJGAr7SGB64T3g0oa2cqnmunMwe1K8pFJFLs3bVI4P/2qXWpFaYz1u
 z36+pYjtp/vY8JqjxuppcUgpylfD95XPVUNC5y5hx3mUwOZ3BFgP6r3GrFW7AFs0lTz39MAN
 2r5Tix123DVCYtPx4u6z5jloA47kVTRzA7+sg5noAyF9cOIWcyM44z4A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/3] curl: patch CVE-2025-15224
Date: Sat, 10 Jan 2026 18:36:35 +0100
Message-Id: <20260110173635.1643307-3-peter.marko@siemens.com>
In-Reply-To: <20260110173635.1643307-1-peter.marko@siemens.com>
References: <20260110173635.1643307-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 17:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229164

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15224.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2025-15224.patch            | 31 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-15224.patch b/meta/recipes-support/curl/curl/CVE-2025-15224.patch
new file mode 100644
index 00000000000..36f5f1b93ab
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
+@@ -741,7 +741,11 @@ static CURLcode myssh_statemach_act(struct Curl_easy *data, bool *block)
+         }
+ 
+         sshc->auth_methods = ssh_userauth_list(sshc->ssh_session, NULL);
+-        if(sshc->auth_methods & SSH_AUTH_METHOD_PUBLICKEY) {
++  /* For public key auth we need either the private key or
++     CURLSSH_AUTH_AGENT. */
++  if((sshc->auth_methods & SSH_AUTH_METHOD_PUBLICKEY) &&
++    (data->set.str[STRING_SSH_PRIVATE_KEY] ||
++     (data->set.ssh_auth_types & CURLSSH_AUTH_AGENT))) {
+           state(data, SSH_AUTH_PKEY_INIT);
+           infof(data, "Authentication using SSH public key file");
+         }
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 9c1a90e1912..72bd1a20881 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -69,6 +69,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-9086.patch \
            file://CVE-2025-14017.patch \
            file://CVE-2025-15079.patch \
+           file://CVE-2025-15224.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

