Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F4BD2ED13
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:35 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5046.1768910965658905061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eBR7EL21;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2876576f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910964; x=1769515764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSDvS/oeanhbzqflXQfS8oQwRdB3iUO16SxdvONYB8Q=;
        b=eBR7EL219+WaMxDvQDddYXl9kEPDNka3HvoW8VyvSxDlbu2KuWOaUjVDu1B9W5zOEr
         QzjsJdY+JlSO9J11iudtqfhf2izg+bxACyInnKq+EtCjxN1FVgQaLl+2fQFmXYSbYCi3
         wkX99dVe6gq8SvIUYYMiIIlACdZp35Om/Vm4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910964; x=1769515764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cSDvS/oeanhbzqflXQfS8oQwRdB3iUO16SxdvONYB8Q=;
        b=VkMYf8MjsSrXVJO7ugtzXnAJ5LE4Wd/8QYLMQXorICguNSjQNGI5++xZLSdp/9KiNI
         jwt0duWK3WaMu3uhdbYiuSh+HFZl4UleBvrbxqY02D3qIjL+tu2sFTGjLh4OVlzb4uA4
         b2E2ZnaIgY3QoCWWnvOFiKLT7ohwBwdEiujbSSYn/0xNh5TdDzth/FRDJEQdzBVpra1t
         2vtpXpkz5tGX+dcFmD2X3IeGFTY07Kb/A12ZbzuJ9NsmK6LDrx59sQ0wM8XP8fY42+JA
         0uXRjnNhnY32OBWNXLtQLdGiJmPuywZ1puTKCV1cPUc4exhiJ869d6Z71z0SUCilJvrC
         rITg==
X-Gm-Message-State: AOJu0YyG8PQ5GfWz4qitIXvRIsEa2dCbz7m0LdHa1qCRCIlcCJv6XHq0
	BA9y+HLxlaIqXikdXkc02GiUrXUen+eIuD0C9Ooj3r8SD88jLNXJEyWuCG0M7++rhCYGAEHqztu
	QGVJ6
X-Gm-Gg: AZuq6aL0p8m0d/OrsBYSvoSnllgFW1XyZQ+ChT0zIGmxbVyyRJiickVGiLihx0rpzi5
	3YZ2vs7kkl0h0DfoE3EFL70cMPajym1xfWnaQ79/C41Vwhf2niBlLNA+SzauJlCKzyfxBHY/+bF
	bApFPE3sFuEGEfrP7qGZhIJcI5Q693pfKUgSaK5qP3ZcLNTAaCTGwc4s5O8gJPu5n5J22ubgYhv
	u/rN1plzdfb29TGipqrh3ScDGzfs6qA4AM8lQYTjVa5nN3ThLkIkkNDzHQcHblJR38DspAEEGE/
	SBOfPiRAJOWjYc2VIQujBXaiDX0w7gtCO+TinoMZ8n9bXS1tf2TiZ0bQOIVzG6En9HXwMkObopn
	Ubm3oNx+r4m9ygRsr1rTx8JeoaN578bHlhOEE88YVUKfuyGGw1ValMsyE6hmgrAZQKpSmKOtiqC
	HZVMtRz+QFu7DSucxyw4ctWdykBP4aJTK8JfiNpOWXMZw+aNmeb+ma/iVW6s9vGzgGdcfCFkP05
	tCEYrx3qr8s/PdjpHotWA==
X-Received: by 2002:a5d:5d0f:0:b0:431:a38:c2f9 with SMTP id ffacd0b85a97d-4359017f5b1mr2337005f8f.63.1768910963709;
        Tue, 20 Jan 2026 04:09:23 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/22] curl: patch CVE-2025-15224
Date: Tue, 20 Jan 2026 13:08:30 +0100
Message-ID: <38881f68750f3f34cf425b1eec11b46058ab5f90.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229694

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15224.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-15224.patch            | 31 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-15224.patch b/meta/recipes-support/curl/curl/CVE-2025-15224.patch
new file mode 100644
index 0000000000..dc07f92100
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
index 85b91ef958..ecda13a04e 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
     file://CVE-2025-14819.patch \
     file://CVE-2025-15079.patch \
+    file://CVE-2025-15224.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

