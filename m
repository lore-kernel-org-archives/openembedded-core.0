Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F56D2ED1F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5029.1768910964577065789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Idid7ryH;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so33429925e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910963; x=1769515763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0YgtcVhkJ7CP6nGcujqmnxpQ2XHlercjg7OBocF/6Q=;
        b=Idid7ryHfT9qDNWHHSnyRMDXrfiQENx0so5X9pV+8iRmbyJEO9G78bQtKN/2dbmqxh
         AHCRV1s0+Iz9zr+RKQRHhWxIIUnTPeSWPNzf+inpcI+30p3c5xoqb3dI0AY49fPodwLv
         KRxnNJDxftYJnOUIS7mt1TcyTc5yh/HmKHjxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910963; x=1769515763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g0YgtcVhkJ7CP6nGcujqmnxpQ2XHlercjg7OBocF/6Q=;
        b=oDk7t2CJGwZ663JGj8ncJmCIZzzoxg+SyzRxD43poEcwcVu6GulAFN5QTtVaiqMUJd
         WaKcXUF0nuYN6W67broA+6CTJVL5/68H68bigbsCEsrkqE+uadp42g0CcZP9CN6neGsx
         C+yRQQr5KbYwVY5sRyUMVrjhchlU6huLQS0+Ug23dvtz0KtW46odgMdjrRgOJ5qJWvNL
         dHKuOQJnn6QDtEPFvEw56yz7YWO4y7oy7VsL13vCa0befDWOfzFe/sssG2o+B9HmfIdx
         m2o0lf9bdJzSeBZZEOjCdVIx8C38E3wkBj0Ior6Ifng95URQOk2uv2+JAtIn/kcqXo4+
         kB4w==
X-Gm-Message-State: AOJu0YwiW1c5cgqhOjEFoQiO/oRbpiu/glEzHzu3o4NwVLTKpU8OOX1I
	GyRzCik/9RFVn03QUljahtpfz0kAVgIpV+M3VcaT+6obM2+nxy2t3XObJWu2F3mSwOktePMyiK7
	MiL9f
X-Gm-Gg: AY/fxX6+pe3NEMwZ4TK1IRbabXppnACaF5sAnp1Bi4V6U4Q7+HCqKBm9zChtdkzbAMq
	xHt28/AYPGQT8nqKiLKmHW/DHPfThu6uL2Rb9Rw3Av3rq6ZEWJ5aAPCDrOmFi6BjYxztg0sOHiU
	1hoik5xb3EzcIlE4kecr+exup4oHsQZybsEqzo69CqdkRNJmm+DkYC1zcAJViwNU3xYoWLzeTzQ
	hw+v/pFMqhCWyz6AAu6vaHPVzK6Sv0aI1kVH7dvoJ7R4cP1lXz5l4WlqlHxH5mrYLTxZNRzZZho
	ohW/aIP+xY75XVnT75Uq0O3iXaS2xt2fDrATpX4jf4dNK7ipqgbbVHXW0JCVD2CYfktta2nSFik
	XZSmhU60yWX4zO8R+kNzhcntiA8xPOZtxLkpvY1u80et7rvyzxxZVu+nWf3EseOYsgPkIUfOaiT
	0t8YGo72JoVeJmiooPN+xq7zB9stkoAuAIUpbNwJF+aOpgPbEol6bo045Q1xLUsLtE8SP7o5Ngs
	Fb/Yn9hr8Nteyju2PNAfQ==
X-Received: by 2002:a05:600c:354a:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-4801e3503c2mr168718935e9.37.1768910962779;
        Tue, 20 Jan 2026 04:09:22 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/22] curl: patch CVE-2025-15079
Date: Tue, 20 Jan 2026 13:08:29 +0100
Message-ID: <e9f3003b124d7390a88c2c8f4ca22c4f07b71cd6.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229693

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15079.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-15079.patch            | 32 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-15079.patch b/meta/recipes-support/curl/curl/CVE-2025-15079.patch
new file mode 100644
index 0000000000..47fa518309
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
index 3134846e57..85b91ef958 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://CVE-2025-14017.patch \
     file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
     file://CVE-2025-14819.patch \
+    file://CVE-2025-15079.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

