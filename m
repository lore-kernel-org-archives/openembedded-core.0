Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.5505.1620860176391248976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 15:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=anDCPZ0u;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id l1so1307653ejb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 15:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dZz3uqL7CqKUrzQUjJ914U3pzMokzOmI4ufQIvqukQ0=;
        b=anDCPZ0uJ4LeLfy4MGPoziXE6uwLgwmfsZ1IKQORpr3Q8f4PeCSxCzYrMp88aFxriW
         tyMTvefPG2tCCg75GatMThrF+wUsyTqEToW9rQK3aLCjMBLKee5YyGAhSjnCSzHm760H
         Q9eqDYkpLWLMSnP5mEEp8eQU5CgimPD+vBPhiTUi2lMwNh14t/oGzc1sS9AgXljjW31R
         5XOk8eToEJX/mFDEQR9ghRV21JWs6AkiSl9p7rGPY+UJOB9chhQe7s7EsGTHdf/7qms8
         vr8AzMp1EoN2ZwSKokRPInnKoqcNTZvGZXWjmpyS29fDco0n91YoiYqOUyMiD3NzbnTN
         1XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dZz3uqL7CqKUrzQUjJ914U3pzMokzOmI4ufQIvqukQ0=;
        b=VYyI049B6Hghp1xJWw/KpaC3e9smKLYq1Q8Ga8qxTCoiSpYFMCnnMAUP3Q/9dXNqsE
         5TETJbV4LaAGZ0GNSKvssxq6HYjNvLEWGBqGr7/FGM2jNEA2A3zzvgQXq/r5RlGkJ6Cm
         p8Pq4YgU51LtJEpc7RDZfRqGWkUGsYq15r0R0D0cm/qT4pFDiSGdD/D1f917XzfE/LNH
         yTZTl/i5HDUwj2TSYEsL7GyI+w5nveeJ2+ywMQfmyBmRgA3N5PBtBUJlChI9ci08DO+z
         n8a32uGrGhFTs82AbVuJLV+FdL+U2cxOKtLo1rke5tBX9Thw10Mk8IAzOQZbbKYxJuhb
         qD6w==
X-Gm-Message-State: AOAM530POjydE2BtTUlCMPloYZXAdMCuRvbtU8/nw94wpvQLgC14mPXT
	RZ9oUtorCQKS1y8MWKXH/nbpya30aeI=
X-Google-Smtp-Source: ABdhPJzie6rREoQRuKVyQoi2dFQ2FHA7uCxlO6nTygom9LsLHwlvB2KZ0FDiOWr0l7EaVlIVgeEpXQ==
X-Received: by 2002:a17:906:9141:: with SMTP id y1mr41882086ejw.111.1620860174723;
        Wed, 12 May 2021 15:56:14 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d9sm1014595eds.68.2021.05.12.15.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 15:56:14 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] webkitgtk: fix build without opengl in DISTRO_FEATURES
Date: Thu, 13 May 2021 00:56:06 +0200
Message-Id: <20210512225606.3830968-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...pletionHandler-when-USE_OPENGL_OR_ES.patch | 37 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.32.0.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch
new file mode 100644
index 0000000000..b5367022d8
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch
@@ -0,0 +1,37 @@
+From 834f335bb3e63e0bf78eed0520df33d5c55e5e8a Mon Sep 17 00:00:00 2001
+From: "commit-queue@webkit.org"
+ <commit-queue@webkit.org@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Sat, 10 Apr 2021 22:02:50 +0000
+Subject: [PATCH] Properly use CompletionHandler when USE_OPENGL_OR_ES is set
+ to OFF https://bugs.webkit.org/show_bug.cgi?id=224149
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Patch by Charlène Wendling <julianaito@posteo.jp> on 2021-04-10
+Reviewed by Fujii Hironori.
+
+* WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:
+(WebKit::LayerTreeHost::forceRepaintAsync):
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk@275802 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+
+Upstream-Status: Backport
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ .../WebPage/CoordinatedGraphics/LayerTreeHost.h        |  2 +-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
+index 6727d16c8c0b..db65f813267d 100644
+--- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
++++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
+@@ -213,7 +213,7 @@ inline void LayerTreeHost::setRootCompositingLayer(WebCore::GraphicsLayer*) { }
+ inline void LayerTreeHost::setViewOverlayRootLayer(WebCore::GraphicsLayer*) { }
+ inline void LayerTreeHost::scrollNonCompositedContents(const WebCore::IntRect&) { }
+ inline void LayerTreeHost::forceRepaint() { }
+-inline bool LayerTreeHost::forceRepaintAsync(CompletionHandler<void()>&) { return false; }
++inline void LayerTreeHost::forceRepaintAsync(CompletionHandler<void()>&&) { }
+ inline void LayerTreeHost::sizeDidChange(const WebCore::IntSize&) { }
+ inline void LayerTreeHost::pauseRendering() { }
+ inline void LayerTreeHost::resumeRendering() { }
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
index 8a07fadd9b..31a6c97a32 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://musl-lower-stack-usage.patch \
            file://0001-MiniBrowser-Fix-reproduciblity.patch \
            file://49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch \
+           file://0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch \
            "
 
 SRC_URI[sha256sum] = "9d7df4dae9ada2394257565acc2a68ace9308c4c61c3fcc00111dc1f11076bf0"
-- 
2.30.2

