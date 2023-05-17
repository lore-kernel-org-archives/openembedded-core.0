Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB8CC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:07:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.44474.1684310818134451298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=qbA9o09G;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3078aa0b152so254576f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310816; x=1686902816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILnq6Rb8l1/L2m3Q8D9cY1IobVIl8KNyV/HmQeyOwm8=;
        b=qbA9o09GSVC9eRlnAZ7dHYknk/XzGkIC5tQTcDdTLmmFmHungNI5PmJM9btJ9FPaHi
         ftkZH3wXEKM4ukApDSGOsoIIxiw+E3QutOKYH9GQiWNTVZS+RCPLf2lEd4QFFLPVkGMR
         UVOhNf8xSXO+mMee8Uz4rCNNEUmiPSq3up2SW5noYPqqP4j9tyDMNHLeExZn5Sa+yf2E
         ZFMc5zjVYr558M+lLSLwNvzRoVY94VM2UyNXn4H3G6W0j4JYkXCUa1mfWscjauquwDff
         hriLHwi0P0l2XfgX54ccMmFVdKagSMzG1Wjxo+zU5ZCxL/ApVuk7dcRwDRkqIASuzmp5
         IuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310816; x=1686902816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILnq6Rb8l1/L2m3Q8D9cY1IobVIl8KNyV/HmQeyOwm8=;
        b=jEk8hv6rTDvvhU1fs2+GPGa7r+Gn1IRkK7CPUpdAQq4Qeohp1XxMC8XjYVyArRIFbc
         swFAvX03ibfa0sh1B/Mi1awU0eDgEspnX/+gDV2GmsntCcbC1+RXTAl1akIpIQ510Zd7
         gdEiGAoRRb/cwMm5Ex1KOC5MoMy/Qux2KljTG03fvj9YVgeREabMzPIzlquOiDkrrW2g
         Jsb7a4YSBhkqljAee44RPIPB5FJhaXEdYVfqoFrw4vFuSySYnUX22PnTPtoJPJf8WtJQ
         gMEAz2J4pCO+sUGJMOm7cT2cemKivGmONIt4v7GbedfG30a91L0PkyU8rLIhRI1ss/Ic
         ecWA==
X-Gm-Message-State: AC+VfDwYAdg70Ze3GIFR3uKDUzPygOvOJEWDWqdJHMT+vImnp6A/HxBJ
	fKud9N25A83U+c7lXnxcVYfBTA==
X-Google-Smtp-Source: ACHHUZ56rX0nPKCTrbxIVHFiv51xwWGjj9dLelScc/B2HkXOg6vhqsDIM+wDtdcIapDHZT4vwHzy1Q==
X-Received: by 2002:a5d:69cc:0:b0:306:42bb:53be with SMTP id s12-20020a5d69cc000000b0030642bb53bemr28340305wrw.10.1684310816701;
        Wed, 17 May 2023 01:06:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 13/20] python3-setuptools-rust: fix RDEPENDS and allow target build
Date: Wed, 17 May 2023 10:06:32 +0200
Message-Id: <20230517080639.9336-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181462

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Cargo and rustc can now be built for the target architecture. There's no
reason to limit the setuptools rust extensions to native build only so
make the RDEPENDS global. Also: add the missing ones.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-setuptools-rust_1.5.2.bb     | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb
index 502967fd20..01e29cc6d8 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb
@@ -18,13 +18,16 @@ inherit cargo pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
 
-RDEPENDS:${PN}:class-native += " \
-    python3-semantic-version-native \
-    python3-setuptools-native \
-    python3-setuptools-scm-native \
-    python3-toml-native \
-    python3-typing-extensions-native \
-    python3-wheel-native \
+RDEPENDS:${PN} += " \
+    python3-distutils \
+    python3-json \
+    python3-semantic-version \
+    python3-setuptools \
+    python3-setuptools-scm \
+    python3-shell \
+    python3-toml \
+    python3-typing-extensions \
+    python3-wheel \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.39.2


