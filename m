Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33691C54756
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:21 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.105647.1747238299464445364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JD66/2PO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e4db05fe8so66254525ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238299; x=1747843099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsO106W0iLCrrHlNRuP1afeg0yNUBT05qoIKq5bdQvw=;
        b=JD66/2POxL6ogB+U63iSdFmBLW3fuuJ0D6XYB3DbuL4WLycVJCgeBMfTZ4QK44mmLx
         8H6oTFlLE4esRisl1/zG2faStNd9dr+UKL9Hje4VclMmylFbRHSHxq8XiBg2HnzWAYLN
         Ij4En464BuMQz3tQ0UNMg5GDC0kRIslZ2HUSW/R/9TXsearm3JEp4eh+zZWXqm1u3Osg
         LbJhuW/65B8UsDyflRSpOefoo93JTlD7G/YNHWuMY9n5tbBYG7Rtd/mSKTmbpPip4rCU
         /Q0MYK/VpZn13mjsH9qTS36RFJIxUg0AyqEpxgYk4ftCB1pdA9XCM66+WT4NTysgYKX2
         h1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238299; x=1747843099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsO106W0iLCrrHlNRuP1afeg0yNUBT05qoIKq5bdQvw=;
        b=LGI8ZesAbV3pAI9hl6UV1t7JMVayjkmI7aSY0PZ9wHHlNCdpBzr92eqYX9QtlPgj/R
         sdINkVwws6ATmV69InEbvUgVYT1uIAIw0UnWI9VebLx+1J1HA1xK7j/VmhiGDeoDWA4t
         nPdzR4AzLDqKNOD9PPYxR2JWNkk53VnqDFFQNlF3Ilu+0ZpVJneQtMkJkqlJoWqleG5k
         YSyCwfb79eYphMrgw6pRrHexuS0mpv+VmfRxBD1Lj+XzjuTJaSY7MeSjQAE8JqgwVymu
         BQ6/5AjZqHe5D35ZijRZhPV8HLfDhGMQyn0ibRmhfxyAFNMotsHx+Cixo27FivewcTZE
         gTvA==
X-Gm-Message-State: AOJu0YxV7MVcC+K7pyfkrsJ1+rhdRo/96sYmM9k/bACFN0aFnbsFZflF
	TwyxnwvugnmM9hdAY6lxNj6/Rhi1eTixEeDXYzQVg/FIoC4taN43GILsPA43NiqyX1xoCt9nB5G
	D
X-Gm-Gg: ASbGnctLKGatz8Qh0q2grVDyxmKQvdlHKSg8UTxgZDhLZOlZeCFHVWqffNclRD+LU44
	AaPwBv8t8Eyfl93ym5FL096wZdIZmBQ0ASH82WuVUr69ocepwO39ysTjLuhHy5UhQqtpjVxr+fO
	hWGwcxehrbY+R3sujPgw4R/eWRdSFA0aKcAOO+imS7wsBKp/OPR0cAi9P8TXxGekEsGjXbsUHSz
	6oSrfWORHT/MHyZTe0j3z6WApgtpk5+t3UFnnMoE633BEYWvsq9vQ4Wlv7K0risfI052mkWVfHK
	e5hjf752ezighdWjCjdFxWCEJL0FC68lFBhfgWDs
X-Google-Smtp-Source: AGHT+IFsi9l+TYP+SSkOOAnLIWlbxP+GHnxN4lf6YkfNayuQXia4fbYqoSozAO2PZiE1y0Zszm/6sQ==
X-Received: by 2002:a17:903:41c7:b0:22e:59cc:a44e with SMTP id d9443c01a7336-231981b736cmr66290715ad.44.1747238298622;
        Wed, 14 May 2025 08:58:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/12] go: upgrade 1.24.1 -> 1.24.2
Date: Wed, 14 May 2025 08:57:55 -0700
Message-ID: <0507f4709fb379e369f0abd5c37b9cee8de1fcb1.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216511

From: Archana Polampalli <archana.polampalli@windriver.com>

Fixes CVE-2025-22871

https://github.com/golang/go/compare/go1.24.1...go1.24.2

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.24.1.inc => go-1.24.2.inc}   | 2 +-
 ...o-binary-native_1.24.1.bb => go-binary-native_1.24.2.bb} | 6 +++---
 ...cross-canadian_1.24.1.bb => go-cross-canadian_1.24.2.bb} | 0
 .../go/{go-cross_1.24.1.bb => go-cross_1.24.2.bb}           | 0
 .../go/{go-crosssdk_1.24.1.bb => go-crosssdk_1.24.2.bb}     | 0
 .../go/{go-runtime_1.24.1.bb => go-runtime_1.24.2.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.1.bb => go_1.24.2.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.1.inc => go-1.24.2.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.1.bb => go-binary-native_1.24.2.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.1.bb => go-cross-canadian_1.24.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.1.bb => go-cross_1.24.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.1.bb => go-crosssdk_1.24.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.1.bb => go-runtime_1.24.2.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.1.bb => go_1.24.2.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.24.1.inc b/meta/recipes-devtools/go/go-1.24.2.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.24.1.inc
rename to meta/recipes-devtools/go/go-1.24.2.inc
index 4cf66e705a..cb4ae9ef80 100644
--- a/meta/recipes-devtools/go/go-1.24.1.inc
+++ b/meta/recipes-devtools/go/go-1.24.2.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "8244ebf46c65607db10222b5806aeb31c1fcf8979c1b6b12f60c677e9a3c0656"
+SRC_URI[main.sha256sum] = "9dc77ffadc16d837a1bf32d99c624cb4df0647cee7b119edd9e7b1bcc05f2e00"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.1.bb b/meta/recipes-devtools/go/go-binary-native_1.24.2.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.24.1.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.2.bb
index ffe3d50b7b..65ef93e2e0 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.1.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.2.bb
@@ -9,10 +9,10 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "cb2396bae64183cdccf81a9a6df0aea3bce9511fc21469fb89a0c00470088073"
-SRC_URI[go_linux_arm64.sha256sum] = "8df5750ffc0281017fb6070fba450f5d22b600a02081dceef47966ffaf36a3af"
-SRC_URI[go_linux_ppc64le.sha256sum] = "0fb522efcefabae6e37e69bdc444094e75bfe824ea6d4cc3cbc70c7ae1b16858"
 
+SRC_URI[go_linux_amd64.sha256sum] = "68097bd680839cbc9d464a0edce4f7c333975e27a90246890e9f1078c7e702ad"
+SRC_URI[go_linux_arm64.sha256sum] = "756274ea4b68fa5535eb9fe2559889287d725a8da63c6aae4d5f23778c229f4b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "5fff857791d541c71d8ea0171c73f6f99770d15ff7e2ad979104856d01f36563"
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.24.1.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.24.1.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.2.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.24.1.bb b/meta/recipes-devtools/go/go-cross_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.24.1.bb
rename to meta/recipes-devtools/go/go-cross_1.24.2.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.24.1.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.24.1.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.2.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.24.1.bb b/meta/recipes-devtools/go/go-runtime_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.24.1.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.2.bb
diff --git a/meta/recipes-devtools/go/go_1.24.1.bb b/meta/recipes-devtools/go/go_1.24.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.24.1.bb
rename to meta/recipes-devtools/go/go_1.24.2.bb
-- 
2.43.0


