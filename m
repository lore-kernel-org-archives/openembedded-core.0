Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D93E7F138
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.3554.1695764621950657896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qD8tYuR9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c62d61dc96so21485365ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764621; x=1696369421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJnrAQHJUw6VJW61xXzxbTEC0uXKIwdjtalzIWz7R3M=;
        b=qD8tYuR94p87wd4Hlep6OEalurZyB3OoCTNKUS91q4RNnvvwOoKag8eZMEuEACiNUS
         ZJAxPInLyGZQ/fLilZwn5GkSTCgW3lYsGapkMgLIF5FrJscpMw9Cv3Mn1OgdwsS1GnJh
         FnljuF/Zpt/QnJp0dj7qXCkQWizueuAprRwWlMXVuyhBRxt/N8Fk7XCWnqEI49c57fy8
         6LuNB5Je1Xh2O6bdAJaIkteqmLfnMA8RjJlz0S7XNnlS/K/rHKSNYwgwthaO0Phkjapf
         K0o3l+gRA+4gn4K+G7o2oW2ekcbdYSfV8M4Gg2orVWbc1dzpBorNm0VXo2/gDXokikH0
         AtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764621; x=1696369421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJnrAQHJUw6VJW61xXzxbTEC0uXKIwdjtalzIWz7R3M=;
        b=MddVT5p1BWRIMn1DUaMOqK4j/tDB16rtQ7mY6SYTPyKFDtlLtz+rIzuXYVomgaIAjw
         zhU/iTEDzHmX21zbhesJetdjg+XOGBubadqvz6+XpyDek5tVpUZarR6HMBQ/w3Qwtbol
         D3xI8gMvW+xi72xKsuCD7OYKoiHVtXicFt7SVV6mmNNSxn0EuReDzQ0h0klV9wcvoNGw
         /n/aIpbP6qmBSPjOJsN/yBmEVxf8xOU1Rbidv7/o5hyYY4TiHlwL21hV1ZMZeOdVq+HG
         ggN+0ke8sT6Ik4TxGrfifWpAE2b1w4x7hdvyIgWggpfhYnmLIL4rawOXLSDM8EcMo9/3
         ZKBg==
X-Gm-Message-State: AOJu0Yx1rxLeie1A1tPy8U6JwKDQqY9P8l6MShnV6W3YkOtRUBep6Mu6
	mfIb87KZALwnro26UEqCCcvWobpi1MoW4NTSNrk=
X-Google-Smtp-Source: AGHT+IE3CziRgfvl34kZ1+uOlHMq11RntQQdWn90PawLSVx8qZqubsmNAAAUJWtoxhOY5W84SgM8zw==
X-Received: by 2002:a17:902:f693:b0:1bf:13a7:d3ef with SMTP id l19-20020a170902f69300b001bf13a7d3efmr9294374plg.66.1695764621139;
        Tue, 26 Sep 2023 14:43:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/10] gcc-crosssdk: ignore MULTILIB_VARIANTS in signature computation
Date: Tue, 26 Sep 2023 11:43:18 -1000
Message-Id: <6b87f7c9e955abe5833820ee7eda9d525c77d2ea.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695764457.git.steve@sakoman.com>
References: <cover.1695764457.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188277

From: Chen Qi <Qi.Chen@windriver.com>

The gcc_multilib_setup function is a function that is run at the
do_configure step, so it's counted into the signature computation.
The MULTILIB_VARIANTS this function uses is also extracted to be
taken into consideration. After the change of setting MULTILIB_VARIANTS
explictly vardeps on MULTILIBS, the change of MULTILIBS changes the
signature, thus causing rebuilding. However, in case of gcc-crosssdk,
the setting of multilib should have no effect on it, as it's used
to build nativesdk packages, not the target packages. So ignore
MULTILIB_VARIANTS in signature computation. This fixes oe-selftest
case sstatetests.SStateHashSameSigs2.test_sstate_nativesdk_samesigs_multilib.

(From OE-Core rev: 537c71162a711dec32a63a657c4b101269a3e267)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-crosssdk.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index bd2e71d63f..74c4537f4f 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -10,3 +10,5 @@ GCCMULTILIB = "--disable-multilib"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk gettext-native ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
+
+gcc_multilib_setup[vardepsexclude] = "MULTILIB_VARIANTS"
-- 
2.34.1


