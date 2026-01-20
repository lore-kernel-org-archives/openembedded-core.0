Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881FCD2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4168.1768908275061883636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AaDuFRJL;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-432755545fcso2994928f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908273; x=1769513073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caeEUam+4SDwAj9PiXIWQvz7DkU63+3j1U9pf3E76+Y=;
        b=AaDuFRJL1IqIem97TiaAleMZ4ZKsxGDiXjOakiGQ3oPyLO+A1X1yts7C5/CleXWOVa
         bKmvtGZv7VFaSfYVANMAVxGJrBspPMLPBGstqDuyAQAr/WcvESaTY/tWogCUgeiHfkT8
         im7wCNkh+YV+GcyECbelJj0zxAWpmU7SnHF8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908273; x=1769513073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=caeEUam+4SDwAj9PiXIWQvz7DkU63+3j1U9pf3E76+Y=;
        b=RTFWf3RdFLxq9oOVJyFFdyZXEhcTeSoBz+1lSplUMtIfmRrZ1Tr5xY2muIV9D5bHhs
         UuqQfHeujmjYXfkFjWFT408A1zp6p8fHYA7jYBuNOQmvue8tOvI2xSt/vR53xwfj0m2g
         nOVEZ1t2n/wEGP64/a4PjqGg32Gq9O+SVmbhgYy+0u66p2fYWggSBtdRfKpWHu/IfpAd
         ZrKknn3NtkbSICSxBTvyS+7I5pGBig7xnnjhf5aSjaBjFmbhHkTB9YdKmg38wJAFoHcc
         dY7fjC0l0TdrwBQ+XcuFTCDKrPCVRRCE+Qu7kVcV1xYk3BcXMtVHXS9eKvtIKcfIbfeE
         CQ4A==
X-Gm-Message-State: AOJu0YwI7tV0Pfi5yvIy9TTcP30LjCmFNZozYwWocilxtgW2ZIb+Ixeg
	9292jwcYasdLUWRjKMYLtHNM1RoibzMBKKSDahPsfIZGMZ3QYp6xO/PGS6VlW+I+Pvq9bhTImr6
	4rTgA
X-Gm-Gg: AZuq6aJsfDSa2GMEDS8pZFlTYbCqg5ZnKLRjRvscJEFBlKK5lQovbC8YrQv5/Hz564t
	RssH2kZT1P6FJYG1ihya/n1M+9c1A1AAcGFfrmXKZtmOYWMcqDBczMcg5y+EGZtPo77qJBmSoN+
	b74EV0UXAHLrun8utxpOcosJoHYdLoK033+FXNntZehs1bMfwhWtMeNyK7xiS2GuQoWz1JhxcRo
	+uGiCvd7+NT8rovG2L+addxyAMA0/jHYvSScdnOzHxqwSNHtWLwd8ko+SIr1EJQT7artFYpkKuv
	MbOcH3l4JdmaPtYaWcFNaFAx9zDsfWL3WzOll6RuD0S0s9u/qYWl8kicXGXTbp23A5yXtfHYydV
	EwTMFIqyqz08sfuPBwjo6SFABVI6SW1YZsamG0vynzc8na1p+D815x9SpHiQIanOkNtyFjTXtCA
	RZDLq4WGLS74AKC3bbTt93PEQYBYd7utxc67ufD9f4mDiZUV4lIpYWocgB/ynLV6rt3B4p+LSYS
	cpwEFxzFKzYYFCXam0zYg==
X-Received: by 2002:a5d:5f94:0:b0:431:1d4:3a8a with SMTP id ffacd0b85a97d-43569972d22mr17455393f8f.7.1768908273089;
        Tue, 20 Jan 2026 03:24:33 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 14/15] curl: patch CVE-2025-15224
Date: Tue, 20 Jan 2026 12:23:59 +0100
Message-ID: <d6ba218162c400acb8d60dd795d2d3ba20b1fb8f.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229674

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15224.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

