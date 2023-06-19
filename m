Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633CAEB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:00 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.24.1687143355060229708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UzcDwxhn;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.180, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3f9d8aa9025so21133721cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143354; x=1689735354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TM0L9cvUjg7LNks6Jio2n0g+VlLbAtNGDoMXypVtv3o=;
        b=UzcDwxhnAu5UbL1xjWYDv82259Ac6VXCtIVQk1TWuJYSEgxfARjXd36m/JlMygmYVb
         /Imn4cN9UhAai3LX80dJ22aEmxtKsidVSKNwu296/Y4EzUxWG7SVXi6OAERIEWdmV/OA
         R4FNhJQ9WI8TbSqGalmUrgIyMYqejh+He5Fz8i4vJcHsh2ENb8Ccj8yBj686kmPuDxdr
         pxZ+QoBX45knib6QzN01LKYNofosq0PUdgU7YHMBPWAnN+sbAFUnwCCf8j/Y1EKlIcAS
         asXVTeaOHg8k+sKqxPZZbp1ittNB7Nn1YrcPo74zJlleyEiMC4g9k9PHE0vVi5MBiUK1
         vR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143354; x=1689735354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM0L9cvUjg7LNks6Jio2n0g+VlLbAtNGDoMXypVtv3o=;
        b=WPYGNFXGfsuho09Eqb/BN5gBhF6htPIEG1s8AqeZSbjxlT7XgYDzYYGWa8iTFWd7F+
         PvFiOMRLX7OBoEDjQ4yhi/Y1UWEF026CkAqiCM++4rgqCjCV2Ap4xHo+v6NcBTxvb1qR
         FvnFiNyLPuoPFeUNM/DfAmsmsWtqRqw2CoJUGFiuGhdx5894w8B628pKCqZO02hI92TH
         tPlciN3e59Qtcg74Kor8F/9EGF6t6gl7VGm13M6GH2ldEkzHWsKhLS88fbM1BYWvbEW0
         +hNuJwR04fgwo7eisl98qzALFae0COrc6O6t30snxg/7O/mWV2TnpHB6NKokB2I13paF
         AJfg==
X-Gm-Message-State: AC+VfDxYIbS6lL7eAvVueVGO2yCSpiaik1PkBada/EWV/T9PTRm9V4yQ
	WvW9a2VBxJjNnYaDvne6s53zSJeS8q5RCY5kboQ=
X-Google-Smtp-Source: ACHHUZ5teHCVEuTH74TLzeheB5ItRprbSWXNIlpdTplbsKxKrZHLrMA5VljWJZVSxqIe6GnGWZIptA==
X-Received: by 2002:ac8:5dd0:0:b0:3f9:c9d7:389a with SMTP id e16-20020ac85dd0000000b003f9c9d7389amr10640580qtx.57.1687143353721;
        Sun, 18 Jun 2023 19:55:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/18] webkitgtk: fix CVE-2022-42867
Date: Sun, 18 Jun 2023 16:55:25 -1000
Message-Id: <d4a872b6ac8c41d9c3f4d5f7255d4561684ef7d5.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183072

From: Yogita Urade <yogita.urade@windriver.com>

A use after free issue was addressed with improved memory management.
This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS
16.2 and iPadOS 16.2, watchOS 9.2. Processing maliciously crafted web
content may lead to arbitrary code execution.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-42867
https://support.apple.com/en-us/HT213537

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/webkitgtk/CVE-2022-42867.patch     | 104 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch
new file mode 100644
index 0000000000..bf06809051
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch
@@ -0,0 +1,104 @@
+From f67a882170609d15836204a689dc552322fbe653 Mon Sep 17 00:00:00 2001
+From: Yogita Urade <yogita.urade@windriver.com>
+Date: Wed, 7 Jun 2023 08:15:11 +0000
+Subject: [oe-core][kirkstone][PATCH 1/1] RenderElement::updateFillImages
+ should take pointer arguments  like other similar functions
+ https://bugs.webkit.org/show_bug.cgi?id=247317  rdar://100273147
+
+Reviewed by Alan Baradlay.
+
+* Source/WebCore/rendering/RenderElement.cpp:
+(WebCore::RenderElement::updateFillImages):
+(WebCore::RenderElement::styleDidChange):
+* Source/WebCore/rendering/RenderElement.h:
+
+Canonical link: https://commits.webkit.org/256215@main
+
+CVE: CVE-2022-42867
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/091a04e55c801ac6ba13f4b328fbee2eece853fc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ Source/WebCore/rendering/RenderElement.cpp | 27 ++++++++++++++--------
+ Source/WebCore/rendering/RenderElement.h   |  2 +-
+ 2 files changed, 19 insertions(+), 10 deletions(-)
+
+diff --git a/Source/WebCore/rendering/RenderElement.cpp b/Source/WebCore/rendering/RenderElement.cpp
+index da43bf3d..931686b8 100644
+--- a/Source/WebCore/rendering/RenderElement.cpp
++++ b/Source/WebCore/rendering/RenderElement.cpp
+@@ -358,7 +358,7 @@ inline bool RenderElement::shouldRepaintForStyleDifference(StyleDifference diff)
+     return diff == StyleDifference::Repaint || (diff == StyleDifference::RepaintIfTextOrBorderOrOutline && hasImmediateNonWhitespaceTextChildOrBorderOrOutline());
+ }
+
+-void RenderElement::updateFillImages(const FillLayer* oldLayers, const FillLayer& newLayers)
++void RenderElement::updateFillImages(const FillLayer* oldLayers, const FillLayer* newLayers)
+ {
+     auto fillImagesAreIdentical = [](const FillLayer* layer1, const FillLayer* layer2) -> bool {
+         if (layer1 == layer2)
+@@ -379,7 +379,7 @@ void RenderElement::updateFillImages(const FillLayer* oldLayers, const FillLayer
+     };
+
+     auto isRegisteredWithNewFillImages = [&]() -> bool {
+-        for (auto* layer = &newLayers; layer; layer = layer->next()) {
++        for (auto* layer = newLayers; layer; layer = layer->next()) {
+             if (layer->image() && !layer->image()->hasClient(*this))
+                 return false;
+         }
+@@ -388,11 +388,11 @@ void RenderElement::updateFillImages(const FillLayer* oldLayers, const FillLayer
+
+     // If images have the same characteristics and this element is already registered as a
+     // client to the new images, there is nothing to do.
+-    if (fillImagesAreIdentical(oldLayers, &newLayers) && isRegisteredWithNewFillImages())
++    if (fillImagesAreIdentical(oldLayers, newLayers) && isRegisteredWithNewFillImages())
+         return;
+
+     // Add before removing, to avoid removing all clients of an image that is in both sets.
+-    for (auto* layer = &newLayers; layer; layer = layer->next()) {
++    for (auto* layer = newLayers; layer; layer = layer->next()) {
+         if (layer->image())
+             layer->image()->addClient(*this);
+     }
+@@ -937,11 +937,20 @@ static inline bool areCursorsEqual(const RenderStyle* a, const RenderStyle* b)
+
+ void RenderElement::styleDidChange(StyleDifference diff, const RenderStyle* oldStyle)
+ {
+-    updateFillImages(oldStyle ? &oldStyle->backgroundLayers() : nullptr, m_style.backgroundLayers());
+-    updateFillImages(oldStyle ? &oldStyle->maskLayers() : nullptr, m_style.maskLayers());
+-    updateImage(oldStyle ? oldStyle->borderImage().image() : nullptr, m_style.borderImage().image());
+-    updateImage(oldStyle ? oldStyle->maskBoxImage().image() : nullptr, m_style.maskBoxImage().image());
+-    updateShapeImage(oldStyle ? oldStyle->shapeOutside() : nullptr, m_style.shapeOutside());
++    auto registerImages = [this](auto* style, auto* oldStyle) {
++        if (!style && !oldStyle)
++            return;
++        updateFillImages(oldStyle ? &oldStyle->backgroundLayers() : nullptr, style ? &style->backgroundLayers() : nullptr);
++        updateFillImages(oldStyle ? &oldStyle->maskLayers() : nullptr, style ? &style->maskLayers() : nullptr);
++        updateImage(oldStyle ? oldStyle->borderImage().image() : nullptr, style ? style->borderImage().image() : nullptr);
++        updateImage(oldStyle ? oldStyle->maskBoxImage().image() : nullptr, style ? style->maskBoxImage().image() : nullptr);
++        updateShapeImage(oldStyle ? oldStyle->shapeOutside() : nullptr, style ? style->shapeOutside() : nullptr);
++    };
++
++    registerImages(&style(), oldStyle);
++
++    // Are there other pseudo-elements that need the resources to be registered?
++    registerImages(style().getCachedPseudoStyle(PseudoId::FirstLine), oldStyle ? oldStyle->getCachedPseudoStyle(PseudoId::FirstLine) : nullptr);
+
+     SVGRenderSupport::styleChanged(*this, oldStyle);
+
+diff --git a/Source/WebCore/rendering/RenderElement.h b/Source/WebCore/rendering/RenderElement.h
+index f376cecb..d6ba2cdf 100644
+--- a/Source/WebCore/rendering/RenderElement.h
++++ b/Source/WebCore/rendering/RenderElement.h
+@@ -349,7 +349,7 @@ private:
+     bool shouldRepaintForStyleDifference(StyleDifference) const;
+     bool hasImmediateNonWhitespaceTextChildOrBorderOrOutline() const;
+
+-    void updateFillImages(const FillLayer*, const FillLayer&);
++    void updateFillImages(const FillLayer*, const FillLayer*);
+     void updateImage(StyleImage*, StyleImage*);
+     void updateShapeImage(const ShapeValue*, const ShapeValue*);
+
+--
+2.35.5
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 8f6514a82b..062f209932 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2022-32923.patch \
            file://CVE-2022-46691.patch \
            file://CVE-2022-46699.patch \
+           file://CVE-2022-42867.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.34.1


