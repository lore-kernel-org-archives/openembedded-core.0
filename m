Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F30CCCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:59 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19438.1762873130791092180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qhQuh6sQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso3093990a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873130; x=1763477930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lC1clICtj5we1Yrjqv/svp5LqHH0wnvrbYwNLvoy7w=;
        b=qhQuh6sQb7lq2Cn9KFqSOv8UaNth1vODAOVvuzjG4U3A5zw0DEJutHuEKH7WP3l9ab
         pKx+0c/jx9CYOdFubj1Zp8QrZkOLnk85m5kxandqB9DYGYTTZXLQuGjuOcGqPobHbqMe
         Br0l6tTe7zY3g53NjhKkVNMpbm3oyfrql4iKr3c03o0Rsr9QGyHNWp6VW7aiaZS2tzWg
         DGsJwsVVxD6o/zSNFY+Zzj8fu1I6sW1sP1t2gjgVmtMTP9ttQWYCZBtLht99AL38MzvJ
         5XRL4COTxoxfMrGUo3o+Udv4+SnFz+sv95empx0aRRVncXsNCjRW4+KLZx42Gt74Fa8K
         YuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873130; x=1763477930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5lC1clICtj5we1Yrjqv/svp5LqHH0wnvrbYwNLvoy7w=;
        b=uTCXIH36uZOs5CXdZ1XRySHUSf+PiBypev9Y/2J4BwWw097dK5SM9KDvF+xBYRNACa
         3jOqilh7Zo0VR1Yw04SQGvEbF3gD4w3VqQHsGLPOofjLs8aUlfa6LXSB3qQMAvxBuool
         y1g6iKivKXOXxOge+pplyuXJifV8JVK+fXrGL9VPcYDV2xcDIVYQuj7pJEJ0/jNBAqVI
         emqlcMYwuNSII0MwoEzvBMaw4u6Hf07fhR04BN4q9bKrfToT0yaZqDcokawXQCY3Q1FC
         O+8TIJ+kgXSau3g449LDxlvBBs9ufO7fVBkA39JMLLurMVHb+3Uwt4PfUL4/epzoAhLO
         cDZg==
X-Gm-Message-State: AOJu0Yyc1w0RPWVQ3FOVNbm+LfyVzJZY1vCbOYa44wuUTIScNw6hz5Pm
	JFnb/Ae3kHsHdULV5gAX8NNPKtobywHg8skuDHoCdWY18UGYsOmBBmW/exuNxyWidqodMcgSaQA
	l/G3paes=
X-Gm-Gg: ASbGncuBG/QY+5kq2uhAcoE4qIMAS0a2IntBqpwvoq+XaMLGsc/F2QpeonuWGmWXsjm
	hsAqzDfIIBW/3ioh+9O1XNE1b6Tf6aMpFgkPE2ptu3pRdAwKaxg3Fj3ZDi+1zZz0EF/9DgA2uDv
	Qzg2ml10FgMtppwmi4HDX6zSrqIicJ50n8i5TfRqhV4+5fLOWCsuDEJF9/Gpw0ZcXkDdkGOwi8D
	jyFVDnV1Wg8spGf+81+nXBY2rvKeGKRP7EROA1yY+04ZmP+zHlJl3o8Eizv5nIJUxFsJo4q8e+G
	i8ofImGetIq0eZXQYFbCcC5PXPSoNTRTosKdnds0nNSlzXqIWxKJcjG+hfT/D+vduGjUUkge41U
	4U5Zv67b5g/NA9f+yTbj2i5mQ3rWZkIrbqV/jQAbh81CDX+icQ9x3ujlkFD+cfyW1zyU=
X-Google-Smtp-Source: AGHT+IFyI6cnzYZirkG+6g78qphnxo+c/yi89qsZ4cSlmhLiXilX8MBdO1nOaJ1aSlfxf79oXK6pWw==
X-Received: by 2002:a17:90b:258c:b0:340:4abf:391d with SMTP id 98e67ed59e1d1-3436cbab15dmr16510521a91.16.1762873129990;
        Tue, 11 Nov 2025 06:58:49 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/19] go: fix CVE-2025-58189
Date: Tue, 11 Nov 2025 06:58:13 -0800
Message-ID: <e734cf62f24640d116c901dd97e09ddbb1f0cc4f.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226170

From: Archana Polampalli <archana.polampalli@windriver.com>

When Conn.Handshake fails during ALPN negotiation the error contains attacker
controlled information (the ALPN protocols sent by the client) which is not escaped.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2025-58189.patch                | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58189.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index b619fc48f4..1e4139148e 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -24,6 +24,7 @@ SRC_URI += "\
     file://CVE-2025-58185.patch \
     file://CVE-2025-58187.patch \
     file://CVE-2025-58188.patch \
+    file://CVE-2025-58189.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58189.patch b/meta/recipes-devtools/go/go/CVE-2025-58189.patch
new file mode 100644
index 0000000000..4908cf6400
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-58189.patch
@@ -0,0 +1,50 @@
+From 2e1e356e33b9c792a9643749a7626a1789197bb9 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Mon, 29 Sep 2025 10:11:56 -0700
+Subject: [PATCH] crypto/tls: quote protocols in ALPN error message
+
+Quote the protocols sent by the client when returning the ALPN
+negotiation error message.
+
+Fixes CVE-2025-58189
+Updates #75652
+Fixes #75660
+
+Change-Id: Ie7b3a1ed0b6efcc1705b71f0f1e8417126661330
+Reviewed-on: https://go-review.googlesource.com/c/go/+/707776
+Auto-Submit: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+Auto-Submit: Nicholas Husin <nsh@golang.org>
+Reviewed-by: Nicholas Husin <husin@google.com>
+TryBot-Bypass: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Daniel McCarney <daniel@binaryparadox.net>
+(cherry picked from commit 4e9006a716533fe1c7ee08df02dfc73078f7dc19)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/708096
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+CVE: CVE-2025-58189
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2e1e356e33b9c792a9643749a7626a1789197bb9]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/crypto/tls/handshake_server.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/crypto/tls/handshake_server.go b/src/crypto/tls/handshake_server.go
+index 4e84aa9..17b6891 100644
+--- a/src/crypto/tls/handshake_server.go
++++ b/src/crypto/tls/handshake_server.go
+@@ -312,7 +312,7 @@ func negotiateALPN(serverProtos, clientProtos []string, quic bool) (string, erro
+	if http11fallback {
+		return "", nil
+	}
+-	return "", fmt.Errorf("tls: client requested unsupported application protocols (%s)", clientProtos)
++	return "", fmt.Errorf("tls: client requested unsupported application protocols (%q)", clientProtos)
+ }
+
+ // supportsECDHE returns whether ECDHE key exchanges can be used with this
+--
+2.40.0
-- 
2.43.0


