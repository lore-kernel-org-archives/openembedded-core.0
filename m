Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2139CD98E1
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71891.1781274406598020494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b0hcRThv;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b9318997so7906965e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274405; x=1781879205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX8vSyS8xxE1FNa1uQN/JAFm5D39b9A8/4bFt+FIpRo=;
        b=b0hcRThvrZRQgySlIgmQNysgFNhIAjvAIqNkl5F7fWBXT4f500K3QqZFuXEuzvlDMR
         9PFGTXNy5vsyS5orJrhXGLFvp0gdm/34ogMB7nGZ+Df4AALXcQSDkdrAelO3cKQYjwPh
         jg6xIVozgYLZ5mRMukpKBoEgRFApEnmmW0/0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274405; x=1781879205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aX8vSyS8xxE1FNa1uQN/JAFm5D39b9A8/4bFt+FIpRo=;
        b=CuTXYhienUQV0rD4HIDTxczj/EsTchpEQm/XbQy5vi3dUQo7GN84BlhxNBUEuRcbq8
         ozv7/JnyF3FsMNYtM4wNv9WOrvtNCX6HHP8GNuq43EwmPREM6r0Ux2vIfjSmCcaMV4u7
         b84IdrC3kAj/7OCsCv6ghYD15+jAGW+QRjSYHtITN4j31V8SjgB6YVHJiC7QASo/HLal
         L8C8pyIHjYmcE7zCWoR2ZP2nmndW98ZEzC9ocaJO1S4tR2tQxkUl9s+RoirvEIwHZ30t
         l7QUjYo3Qp7FUuYaoBcnUM9SQGafE6cXJoz1e0rh5hSyHzhRh4t77UQaXZIo78UYGuNS
         Bp/w==
X-Gm-Message-State: AOJu0YzFTsJF7skebYCX35CnyOhPckKejev0z90ZJkVSwmoKaMOZjBAg
	VINZ+pUpXovquivGH11hcFsns+jn8PLBk0zbjbHa6PREqAP6FG7MnOkI7T/LcO6Sh2M1vc3Q/99
	NP2pMMw==
X-Gm-Gg: Acq92OG/ImF9zF6os6OKnIKVIV16pQa0QhQi7alC+zYBCR5zv80SIbun1xmwlOXCSlZ
	Rde4gUUtGvCzk6mFnfcVgFsViV2z6r8RlojxrjFdnJQYzDoSBz9zm1pkt0AzhJBsGfkxzswL3uz
	qfKCUTcpiKmp7lphf2yrtPc0CTzIVPfOxc9cd1BcZPY3LYhvG8Ap+CRyLC82TnKVNtrUDBKuVE5
	SpkxZlRicqGC3mPlJpWXflltHjiaKzmUu7JLOUmZ8YL5XX3z0Ae8pCwpyD5oioRkq/6x2MZc7kq
	QS5LUljKkTI/31iaw2B/QsNuKGKgfBxtq8uNGOhtFjO5zqkPjTde8y19Im/CWiIJZnAQci/vo7l
	peXJ8zSMfGiucapFRafIumAGZSQYEQMW3vyprx/bMXoFBamvVWPJGIz8qwBvfHlG4KH1IiEoP3f
	3KJMvB/C4/CZ0QDlleXMVbLuQ=
X-Received: by 2002:a05:600c:37c6:b0:492:1e7f:d41e with SMTP id 5b1f17b1804b1-4921e7fd528mr5988935e9.10.1781274404836;
        Fri, 12 Jun 2026 07:26:44 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:44 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 11/21] go: patch CVE-2026-33811
Date: Fri, 12 Jun 2026 16:26:01 +0200
Message-ID: <7daf5667fa96f78e847e39a2d06e3576338e3b91.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238633

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/767860

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-33811.patch                | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33811.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 288cd5c95f..9a7695e754 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -45,6 +45,7 @@ SRC_URI += "\
     file://CVE-2026-32280.patch \
     file://CVE-2026-32283.patch \
     file://CVE-2026-32289.patch \
+    file://CVE-2026-33811.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-33811.patch b/meta/recipes-devtools/go/go/CVE-2026-33811.patch
new file mode 100644
index 0000000000..216b33ed8b
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-33811.patch
@@ -0,0 +1,46 @@
+From 9082277a0a78af39190c1f23b622f02b89e46196 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 26 Mar 2026 12:17:06 -0700
+Subject: [PATCH] net: avoid double-free of cgo pointer when handling large DNS
+ response
+
+No test, unfortunately: I've had no luck triggering this without
+the ability to override the local recursive resolver.
+
+Thanks to hamayanhamayan for reporting this issue.
+
+Fixes CVE-2026-33811
+Fixes #78803
+
+Change-Id: I9e51410337316c20e4b9fd5b86657f436a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/767860
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+
+CVE: CVE-2026-33811
+Upstream-Status: Backport [https://github.com/golang/go/commit/ab2c7eb1c43011dda118282c1e757d8c27cd7d4f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/cgo_unix.go | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/net/cgo_unix.go b/src/net/cgo_unix.go
+index 7ed5daad73..bd694859ab 100644
+--- a/src/net/cgo_unix.go
++++ b/src/net/cgo_unix.go
+@@ -343,7 +343,10 @@ func cgoResSearch(hostname string, rtype, class int) ([]dnsmessage.Resource, err
+ 	// useful in the response, even though there *is* a response.
+ 	bufSize := maxDNSPacketSize
+ 	buf := (*_C_uchar)(_C_malloc(uintptr(bufSize)))
+-	defer _C_free(unsafe.Pointer(buf))
++	defer func() {
++		// Free in a closure which captures buf to pick up a reallocated buffer from below.
++		_C_free(unsafe.Pointer(buf))
++	}()
+ 
+ 	s, err := syscall.BytePtrFromString(hostname)
+ 	if err != nil {
+-- 
+2.43.0
+
-- 
2.53.0


