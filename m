Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DE2CD98D3
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33656.1781132126393873671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JIvX/OiT;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5522856f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132125; x=1781736925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SU9cmVSz8DeFJKydEumBU3QMy6WHKhhMCfXjwX5X23M=;
        b=JIvX/OiT/tyu4xO01KPVwpPyw7YHUfgfQGw2vbNI1njfoXrCQZ0RJRnMVktPPZwlHJ
         ytycAAJzO7/ZFP8A0YCVuplKqG6KSj3kLKOVWXea7zKFp88IwKFOhc5acJ75puQbDCtR
         Ymkr5Midex1H2UiLpuMWp9OijOVoZDcrV+piA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132125; x=1781736925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SU9cmVSz8DeFJKydEumBU3QMy6WHKhhMCfXjwX5X23M=;
        b=QGH/UggbdvPbgq2o4Nl9wC+9yw+IAT7s1xVGDyPWcfzKZftRb15BIW/ef+Duy6GcuV
         Ko5w+S6yHExXhYlHCLhEeTf/hbUPEnz7kl9tcxDr1Vo8zNinJexcYabaLDuy4gJ8hJnW
         Y6q9KXEOcZqA9Kj/e8cymUIz3DXd4FwHbZXWfEnR4mHY82df5Y50gIEdi6w2fLIw88aB
         zMQHCDbxKnqfq3MxuyWDJ/z9PDa28Ngskf0U2Ot+1PMUuoj9FP9YQhJx/RuxL0VJ+M+K
         6x3QcVUZD3tpBrWQb9tViaUUaHz5G2G71gPHbUmOc/HGqohAL7Tl2qhVsnfEgKJQCqtc
         SCmA==
X-Gm-Message-State: AOJu0YykaVMKLpyWoqXSwLEcTEwZ+e1z5I56/yi7K7CZYTD3Xt1TWS/r
	ZfHGozD7ly0Ednb1iZgLk5ED0ugxxtLvOeUSIoVBzTEKjJ/QX+uSIbvRUxIc4VQPUFVAwR6ULAV
	evhuY
X-Gm-Gg: Acq92OF399Y65n02/gfyEwUcpdSfqfleP99vIh3jmHOiCTpO2vBiuFi9e0mX4HULqpy
	rcAEMzKfKzjuqXlPpWSGZxIo0IXL/n0OyJWYexPST6e5++aYnsTL/e6LDLJH8+rtsDF6N3GwzD1
	qJKKlGrOjeOGwvK5RG9UembH0+K07UfxI33C7xLSfJns0N9RS8QyOVEIGWxMlYoaWelU5r76bSK
	7dbEhlPH+kdJTdk5LK+dUnJ7/Wr/1AYKo5QMTp+jbvW8KgajLvsGHlE8z2lDDPSgmhllyirzGCA
	/JxyBIRUxJ/KfSV4Sj14qoqEoEoHYT7wWUOUZ98B0RJMk+bvADzPPuv6MrzxMzREJ6bIZG4Y9MP
	BR2qaJUZ9J4hV8RxiIV+x+PhxRLrb3BeXdd5H8DMYD1QPnWscIDgwiHprnKPQJaz9TcTN2Deqs9
	BK3+ClHPYN1IHc87exUNrFmiP/pckGogU7QTaXHW1Ady2mQxPlaDypio2S/1iZEqHMfjt0R0AXT
	jSmpRjj0+dVHkl4J13ryR+0I7phMvI20nolmIY=
X-Received: by 2002:a05:6000:46d9:b0:45e:b215:12e9 with SMTP id ffacd0b85a97d-4606758d27emr165417f8f.6.1781132124699;
        Wed, 10 Jun 2026 15:55:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/21] go: upgrade 1.26.3 -> 1.26.4
Date: Thu, 11 Jun 2026 00:55:06 +0200
Message-ID: <00c4a3832a7320ec86708df95690d6c9e7911103.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238411

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.3..go1.26.4
a9ce111d58 (tag: go1.26.4) [release-branch.go1.26] go1.26.4
babc19e1ad [release-branch.go1.26] cmd/compile: do not misscompile x+x << 63 to x << 0 on amd64
7d24489b2b [release-branch.go1.26] runtime/race: build race detector linux/arm64 syso with no-outline-atomics
ce5a3e718c [release-branch.go1.26] crypto/x509: split candidate hostname only once
ec1c380418 [release-branch.go1.26] net/textproto: escape arbitrary input when including them in errors
7f24db453a [release-branch.go1.26] mime: avoid quadratic complexity in WordDecoder.DecodeHeader
ccffd99f3c [release-branch.go1.26] cmd/fix: pull in CL 783960
26c2ac5f94 [release-branch.go1.26] crypto/internal/fips140/drbg: fix Wasm stub

Fixes CVE-2026-42504, CVE-2026-42507 and CVE-2026-27145.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.3...go1.26.4
[2] https://groups.google.com/g/golang-announce/c/tKs3rmcBcKw

(From OE-Core rev: b9b3b3098eece17d29d41b1923ae5a26511d9b4b)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/{go-1.26.3.inc => go-1.26.4.inc}   | 2 +-
 ...o-binary-native_1.26.3.bb => go-binary-native_1.26.4.bb} | 6 +++---
 ...cross-canadian_1.26.3.bb => go-cross-canadian_1.26.4.bb} | 0
 .../go/{go-cross_1.26.3.bb => go-cross_1.26.4.bb}           | 0
 .../go/{go-crosssdk_1.26.3.bb => go-crosssdk_1.26.4.bb}     | 0
 .../go/{go-runtime_1.26.3.bb => go-runtime_1.26.4.bb}       | 0
 meta/recipes-devtools/go/{go_1.26.3.bb => go_1.26.4.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.3.inc => go-1.26.4.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.3.bb => go-binary-native_1.26.4.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.3.bb => go-cross-canadian_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.3.bb => go-cross_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.3.bb => go-crosssdk_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.3.bb => go-runtime_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.3.bb => go_1.26.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.3.inc b/meta/recipes-devtools/go/go-1.26.4.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.3.inc
rename to meta/recipes-devtools/go/go-1.26.4.inc
index db7b18ed2d2..8bc6f4d4def 100644
--- a/meta/recipes-devtools/go/go-1.26.3.inc
+++ b/meta/recipes-devtools/go/go-1.26.4.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8"
+SRC_URI[main.sha256sum] = "4f668a32fbfc1132e6a881fb968c2f1dada631492a339211735fbb255a42602d"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.3.bb b/meta/recipes-devtools/go/go-binary-native_1.26.4.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.4.bb
index 135c7fbf5ee..3757b9f6a52 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.4.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556"
-SRC_URI[go_linux_arm64.sha256sum] = "9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565"
-SRC_URI[go_linux_ppc64le.sha256sum] = "dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75"
+SRC_URI[go_linux_amd64.sha256sum] = "1153d3d50e0ac764b447adfe05c2bcf08e889d42a02e0fe0259bd47f6733ad7f"
+SRC_URI[go_linux_arm64.sha256sum] = "ef758ae7c6cf9267c9c0ef080b8965f453d89ab2d25d9eb22de4405925238768"
+SRC_URI[go_linux_ppc64le.sha256sum] = "53f49b8c7eace2d30389327b4a516b13321f90377fdf5929a6b63174609bc22e"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.3.bb b/meta/recipes-devtools/go/go-cross_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.3.bb
rename to meta/recipes-devtools/go/go-cross_1.26.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.3.bb b/meta/recipes-devtools/go/go-runtime_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.4.bb
diff --git a/meta/recipes-devtools/go/go_1.26.3.bb b/meta/recipes-devtools/go/go_1.26.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.3.bb
rename to meta/recipes-devtools/go/go_1.26.4.bb

