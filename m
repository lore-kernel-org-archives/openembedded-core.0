Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9AFD2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6477.1768916296584566867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZNyqxvVL;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso37083735e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916295; x=1769521095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IP+gWHcrbR3B2OGth+a8+VcW+YBAhBfqrJynvXZrQt4=;
        b=ZNyqxvVL5DzdPk1/r4A8fk5RsdCnaqSsMZDXYiE+f/LvYFLw/DjE2HEtrMb/mBfYMF
         gtf8b/h0c6ixHC7Pus3s2Tv6ys0BEJWLSFcXtIeE9EahV7wLCDjYdM62+ns3b9VDT4Ly
         nYdV2v+9szm4xonLk6Y9rtGKVWkijIFtDHq7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916295; x=1769521095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IP+gWHcrbR3B2OGth+a8+VcW+YBAhBfqrJynvXZrQt4=;
        b=BlMCt+q0wSLJF4HLuTERqiVUHzoADEJ6ORKzY+B3Cgn4M4Te1fVwl2OExZVunjOP6L
         +ihEejbAFv6NAb92SKKYW1H3tsy5SdOysWCwZPSJTJoRppmjrZ6FttkYYKk3I+JD2+8M
         WdogQKmsAipDJV3r9rIeqUPmu/2rvOhhUJ82DiCL5JRMEvVIWzaKAtsDzq+u/qRiHghK
         1UlVOba8D8cYshcBOeBS0yL5kQttlSo+gXg+p8zniaboni0kBiVZ+4SkDGoirIT7bG01
         MEtQLfSnXOkdrBKiZYAuZbWJJ16xRsNsIm9yoT770V7zBvLjMS9c/dh81ew7wUQ5MP5h
         TykQ==
X-Gm-Message-State: AOJu0YzWzYkEWotYrq8nuDb6oUO0L5TEazC+YiOz9OLIRjLKUJOHfJ2j
	mO7KWJCb0i4jNjjnMK6C3ZfSUfOLYTt0xG/Uw2razQw95MnTWy/AgIHOYbKtRA2XCNlfnLWqE35
	LYVMu
X-Gm-Gg: AY/fxX6i6BUa3wZV2t5VObg6ZxKbe+1ADg3fiusKbjBi4axjH50qL+Nr3En9FDnKhjX
	4oeHrNPMVCnFuOwKzi12wE1KMQ88UEGRXURq+VV7mSJLdO++RSnHqe5NAyDAqB0nEWEWkNHbSFw
	ekDTBa5HkyEIT8oJjsSa3QXEBe2dbCLw0JhIPvrWvfRKfROXbgUpEAtBSnLGwRHTtDHbHBR7U5B
	k/pUqkJDbBCoCICOXS+0N7pvIo1UtdUSH0HIjxDqT1vL/6CkrQUAjwWL7LUiNmqMT+qE8e2nVkL
	+NmWmCKmJHBa4m/E0xmY/pIhZUARF1DsIQCmDY3czpY5NzdJWua8MUtLpMwKx/wehZeP4FscDX/
	mSdE0gfCDnc904cI9KfPTSXvo5DWjjzXiSJ3o0NnX/jE37VdvigVfjRBYqBR6hgAuv8Pctb8eKC
	IxQRiZG6BkHHHtVd97FGjPSDojC/lcEHPL0C/aMW2b3m0nqG043OwgORxcnDztAz7KYT3XGPX/Y
	nJG/PfbkxsQDEOkzvKGJg==
X-Received: by 2002:a05:600c:3554:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-4801e34cac0mr175389085e9.28.1768916294607;
        Tue, 20 Jan 2026 05:38:14 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:14 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/26] curl: patch CVE-2025-15224
Date: Tue, 20 Jan 2026 14:37:39 +0100
Message-ID: <ef970b6e7ca48412731295ff2929ba66655e8f17.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229723

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15224.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-15224.patch            | 31 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-15224.patch b/meta/recipes-support/curl/curl/CVE-2025-15224.patch
new file mode 100644
index 0000000000..36f5f1b93a
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
index 9c1a90e191..72bd1a2088 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -69,6 +69,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-9086.patch \
            file://CVE-2025-14017.patch \
            file://CVE-2025-15079.patch \
+           file://CVE-2025-15224.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

