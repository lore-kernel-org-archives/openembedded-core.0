Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7418C04A6A
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 16:25:49 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.1512.1689870340823838368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 09:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JA2JgKFk;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-316feb137a7so877842f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689870339; x=1690475139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6tAxuvz7lGZOCQwgc50gloZoMKnav6d85hydzZovlA=;
        b=JA2JgKFkJFr2r1bnCkMl8WGGcnQJnMCLMFIHXbnOws4bQILA8ZFwr8v+0gbaU4u+p/
         NH54wF8QQn9GRq/nyXLTmeqnMEhPwMZTE53gXLctp674lM0fXJlzlH9Jg8GNQIen50qw
         b0G9vcYyCzqjqp4igoNQM5+tjD+Bb6ohQ0swkbQBC12tcYXhNYJSezsJOtTyrbyAtJYw
         guK4ekCDIURwc35YnzqWEjc1EyaN3q7xNMMZKzMgev4+DliRfolnhP/ks9TNZZsMgRJl
         YTUo9pvIfSgl82nx+9T2HX0szrQCOgqPkM83rTwxsLLCR+Qdu3ZIPv5YEPttiYpAJahz
         ixxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689870339; x=1690475139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6tAxuvz7lGZOCQwgc50gloZoMKnav6d85hydzZovlA=;
        b=JJSIj+qbZ4iOzd7op3jT+OVxSeKsG3zX1gP023ZRUM/0akhsXebImM7tevowy8zs8D
         L7CmKhfuDSIX+9Zq+j9VPf5yysZH14mBueR1ZH4DJz7fHMUQB2nJUDVXaLtos7VDly5a
         /X+IFBLi/qwDx8JTo7RdS5zaSLh8BIMuJUYoavQ2OZjNTS7UkmpkyTE3+kLy61yFZm6n
         Mc4WPCZ2dxHxtEUfaojTl2uywx1ZMebvhEDZmHuD1uzm90NBsKbiPXSXb0mqy5rauFrY
         A+leHC2CJvpKDeMjIIJBpJWjN8m3ueUhwjCf/RbAWFbt15LDFg9unYE7M96rL2IyOLvU
         cSqw==
X-Gm-Message-State: ABy/qLanoBD2hBG5ttnlF+coEbrrdPnfIsCSEWzwSY3fVNdgEZUR9q44
	bUn9En6tTtOIInXRSypPnOK8K4gOxErLAA==
X-Google-Smtp-Source: APBJJlEtlt/6zpMrZCvL1tHLyz30voJS32xJiBYt0QLagsRJ6Ke9iSGLDKqm8qxEN56/5gazZsSaAw==
X-Received: by 2002:a5d:5691:0:b0:313:ee4b:b58f with SMTP id f17-20020a5d5691000000b00313ee4bb58fmr2851939wrv.31.1689870338612;
        Thu, 20 Jul 2023 09:25:38 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id z8-20020adff748000000b00314374145e0sm1749076wrp.67.2023.07.20.09.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 09:25:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC PATCH 2/4] devtools: protobuf: add utf8-range recipe
Date: Thu, 20 Jul 2023 18:23:00 +0200
Message-ID: <20230720162535.116519-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720162535.116519-1-peron.clem@gmail.com>
References: <20230720162535.116519-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 16:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184646

Utf8 range is a new algorithm that implement fast UTF8 validation.

It is required to compile examples for new protobuf.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../protobuf/utf8-range_git.bb                | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/utf8-range_git.bb

diff --git a/meta-oe/recipes-devtools/protobuf/utf8-range_git.bb b/meta-oe/recipes-devtools/protobuf/utf8-range_git.bb
new file mode 100644
index 000000000..86ecb74d6
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/utf8-range_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Fast UTF-8 validation with Range algorithm"
+DESCRIPTION = "This is a brand new algorithm to leverage SIMD for fast UTF-8 \
+string validation. Both NEON(armv8a) and SSE4 versions are implemented."
+HOMEPAGE = "https://github.com/protocolbuffers/utf8_range"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d4974d297231477b2ff507c35d61c13c"
+
+DEPENDS = "abseil-cpp"
+
+SRC_URI = "git://github.com/protocolbuffers/utf8_range.git;branch=main;protocol=https"
+SRCREV = "d863bc33e15cba6d873c878dcca9e6fe52b2f8cb"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += "\
+    -Dutf8_range_ENABLE_TESTS=OFF \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.41.0


