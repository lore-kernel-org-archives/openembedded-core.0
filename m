Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D317CA5FE1
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6485.1768916295988209559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fnj4iQOM;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so34779075e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916294; x=1769521094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLT4YZE5m8VbWdopF60E4ue1v01bcgO5i6rckNOiJNk=;
        b=fnj4iQOMga0lNmkGM9BiwLnJQ5XbVRB/aIUU8NNaw+mtdTJ9lVMzS4mwHEYWukvrln
         ypyfK7qdAw7VOVGiBDBZIRfIYyoSlbnrNaiJ9etBZZFaBXHS2dTHeGr7LoPXhewJV7cj
         DEt7+KhU+MiBH1dXjEqhG+4Ebto+NpWyT4qJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916294; x=1769521094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLT4YZE5m8VbWdopF60E4ue1v01bcgO5i6rckNOiJNk=;
        b=I5Nn61qf9AXoRECeKTZLUVHd7c2R5VENLLzUPNYGMi3rfYnWMhtzBahUCUkaMtzf3V
         js/jhyovxP831LbZKlSamX1DP1UnKK2qVn8K5WWfGRy7UWani28UIJPC7xH2ln/XSB8j
         I/DERUgtJFD3UyItvBl1xptBU9M2vzlOvDmRI3a5HXLDEVHQpO8lHoMUX/FO4KbXeO5j
         xJsaInQ+u8Wfm/Q164FUNmuxTNA+qNGKqLlfKoWuqpU8wjcJ/vOqBR+MXGKMOiLXctHz
         OUZGa3Xx+j1IAbntSewaYcztPM/crWnQsHuvxO/tw4MIjjf0hFJBKUdLcXNE6xu3ha3E
         dNjg==
X-Gm-Message-State: AOJu0Yxf3DIBmIVYiAC5zGcPImFz0Dal2QY4zFKrCGE4qoO779sTv51d
	oOudppS+rLBXvNueyabQ9dK7ns520LLs4EqhRZG7xZdihQT02ScmBV1per4vRvT83Pi33F+/Hct
	SYqv1
X-Gm-Gg: AY/fxX5U7VbTxhF8/4Cc5dKHL7z4n3S9iEE/X4RYrQqamunoVGyWOr67r/b1Pk90bjl
	uXDQVksqPZryBuaSZ0x7DJF40Wn5zpu5nJwJBlFg6LBtPjL6JKVoGFFHPkyvY+r2o8AI4Nv+KeD
	Ob6EdysuhWPu36mn2Yr6rctS/p0dy3Twdiv0xOGpfO0X9GyIYrNkIhCC7doiVMAVwSTp1SNkl+c
	D1ljlbQpOq7s3yLjLgRznOhe0Xvx5UFlhVUjITGcf4gEhpZPz1xFLbZKwVRDVXxPWnqMNa63X0T
	DoAMqViB2txLoX5Ie4gxgwI7Ap4S1303ooNd8K/fHhQpKJeSlr42ph+tKJ/sP9UI5qc0qT+Q9X5
	3rHVfTr+orBxw7zJz9KUTt14fhl72d7u8bYnWsqOKsrZjyWMGr2p5U/WPoiXJmOibBMyKnbnrsB
	0Jcqe3cvS1dx7xw8jS5TjSem7EFTR7UHgSZrYlCr3HIB92A3XixFRpbJ94F8beK74n68cTDSnxx
	ux85yJKkBKoo9RN/h7yS/qf8DOkbTcM
X-Received: by 2002:a05:600c:3483:b0:471:1717:411 with SMTP id 5b1f17b1804b1-4801e334248mr191836825e9.24.1768916294079;
        Tue, 20 Jan 2026 05:38:14 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:13 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/26] curl: patch CVE-2025-15079
Date: Tue, 20 Jan 2026 14:37:38 +0100
Message-ID: <6f7346a691a40c07aa958c4f29135eddb2f87ac7.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229722

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2025-15079.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-15079.patch            | 32 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
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
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index db3dc01929..9c1a90e191 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -68,6 +68,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-0167.patch \
            file://CVE-2025-9086.patch \
            file://CVE-2025-14017.patch \
+           file://CVE-2025-15079.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

