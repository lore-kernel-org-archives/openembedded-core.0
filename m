Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70D5CA0FE2
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:27 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.723.1755790822843412923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xvDF5zUK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24458194d83so9848175ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790822; x=1756395622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErCK+j8xVqJA1uAm9m8dtJBgEM7C6dieVgCEarLfaGg=;
        b=xvDF5zUKZ82XRMgoR7m5vwUjze1d0or0nczgSHivgAYtQ9usDBpdgn0mb3ivdumVWr
         cwzEWHtxBNs+aZvyUq88J2rIKvLQN49627/j1NrEYJR7PYCJpbMEGlqmcgrpfiNmjs2N
         G3yxVumBolhV7RUS0iRCx1B2MpNWLMvDEFNx9XCdIMurOuj2duG2pLAaV1vkVWcf3v1x
         a8W1kjU742LWKxPRfGQK+Xtk8kqmEiQujsh3gPZ8gg3XluAIkTIR638ZkO1tHk5KQWy/
         ZNadeHRCX6e0EHGYWpy+t+dTRYfTigiTtXXGrYrwRkP0jEP9R7SD3kquIJ/Jl2aa2wWd
         rniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790822; x=1756395622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErCK+j8xVqJA1uAm9m8dtJBgEM7C6dieVgCEarLfaGg=;
        b=gjDojllqLz7sotcPWeIeo10Fv+n7Abb8I+nbc5kSYYtqRsb2v6Za3uOCVtgr1yPTxB
         Lz33tq2Io6XkhVXv2Zt1+sd0oqE3toJxa5zEV04wxipS/GBZWOrh+2leaEs2No3SohCP
         juUakyu7XqvNrch1ND28AoTxPncRHvAe9qf4fiYb1//RKtZgLfYqN4KvyoPHhAdhxDm5
         rmb1RYBLlDvm860Jh4/aqA05udY1Ta5xMnKib2nBDdVoPk7lLgcIw5Iql8WeEhD5jRmk
         kO7kHOBXkIm8ZOQ/wEh+EV6IWQqypWZ0HyM59FL+Mm61lb0pOz+Y7Cb/lrq8jP4XRFG1
         qCDA==
X-Gm-Message-State: AOJu0YxxxPcBpc939zkDv9buZ9/ymxCn/SwFA4YdIh/+iNrLCEfMWROY
	Ih0GBFg8IN6A/hW6XQ0mRawZIvuzodqRSF7y4JQ3H4G4ci4Lkox6YRAlun3bXZzR24FirqrL2S2
	cX0V+
X-Gm-Gg: ASbGnctaRuFIuOeCGPdtU9YmN45rlAXP+iqPIroMTUQEE7vcaPp1Q1opnYPi2GjbRAR
	rwazd89+ducVdbulsLpkMavHNcReqfYLJA0i05ALg9u/fNtmb5yF87K+hyM9uWMrQkq5ALL3xsN
	rFDEZ0KqMw0pKJOTvP4ZMhy0HjPOcDGp7lnw6juYfL7LH8tPXbakUaARFiIOWlBIjX4UPKn1YAx
	q5xE63S2XpECAnKUMbiMszf5q/5JxllXDyFoTk+oQnKe4wPbVJT9LEA5t1gV8rnOcuOy5ewWUn0
	hS4zFmfj0feEs496KF4jnMuBT2u9ye3/nGB6ohwxyE4DrOYyy4tlDfPzmaeDkf+eb/RmfhIrR7J
	Iv/9tyQTil3lYcQ==
X-Google-Smtp-Source: AGHT+IFcTVbLrDx5Qs1HyJcUbbSEdTHt3wvF+9ut9A01fjAojNAj2At0Iby6cjB7V0EY1ufp7GdLig==
X-Received: by 2002:a17:902:c942:b0:234:ba37:87ae with SMTP id d9443c01a7336-245febefa70mr40315905ad.4.1755790822000;
        Thu, 21 Aug 2025 08:40:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/15] go: upgrade 1.24.5 -> 1.24.6
Date: Thu, 21 Aug 2025 08:39:52 -0700
Message-ID: <a348c04d449c0ba36b2ef278bea08919f0e6d19f.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222260

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.24.x release [1]:

$ git --no-pager log --oneline go1.24.5..go1.24.6
7f36edc26d [release-branch.go1.24] go1.24.6
83b4a5db24 [release-branch.go1.24] database/sql: avoid closing Rows while scan is in progress
0f5133b742 [release-branch.go1.24] os/exec: fix incorrect expansion of "", "." and ".." in LookPath
6e1c4529e4 [release-branch.go1.24] cmd/compile: for arm64 epilog, do SP increment with a single instruction
731de13dc3 [release-branch.go1.24] os/user: user random name for the test user account
390ffce7d6 [release-branch.go1.24] runtime: prevent unnecessary zeroing of large objects with pointers
b454859a8a [release-branch.go1.24] runtime: stash allpSnapshot on the M

Fixes CVE-2025-47906 and CVE-2025-47907 [2].

[1] https://github.com/golang/go/compare/go1.24.5...go1.24.6
[2] https://groups.google.com/g/golang-announce/c/x5MKroML2yM

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit f3072c210ac0a1e4d8046d920c3ebc29f9916b72)
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.24.5.inc => go-1.24.6.inc}   | 2 +-
 ...o-binary-native_1.24.5.bb => go-binary-native_1.24.6.bb} | 6 +++---
 ...cross-canadian_1.24.5.bb => go-cross-canadian_1.24.6.bb} | 0
 .../go/{go-cross_1.24.5.bb => go-cross_1.24.6.bb}           | 0
 .../go/{go-crosssdk_1.24.5.bb => go-crosssdk_1.24.6.bb}     | 0
 .../go/{go-runtime_1.24.5.bb => go-runtime_1.24.6.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.5.bb => go_1.24.6.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.5.inc => go-1.24.6.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.5.bb => go-binary-native_1.24.6.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.5.bb => go-cross-canadian_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.5.bb => go-cross_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.5.bb => go-crosssdk_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.5.bb => go-runtime_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.5.bb => go_1.24.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.24.5.inc b/meta/recipes-devtools/go/go-1.24.6.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.24.5.inc
rename to meta/recipes-devtools/go/go-1.24.6.inc
index fae0d3f333..a3933c2a61 100644
--- a/meta/recipes-devtools/go/go-1.24.5.inc
+++ b/meta/recipes-devtools/go/go-1.24.6.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "74fdb09f2352e2b25b7943e56836c9b47363d28dec1c8b56c4a9570f30b8f59f"
+SRC_URI[main.sha256sum] = "e1cb5582aab588668bc04c07de18688070f6b8c9b2aaf361f821e19bd47cfdbd"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.5.bb b/meta/recipes-devtools/go/go-binary-native_1.24.6.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.24.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.6.bb
index 3de63060c7..86a3ad8556 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "10ad9e86233e74c0f6590fe5426895de6bf388964210eac34a6d83f38918ecdc"
-SRC_URI[go_linux_arm64.sha256sum] = "0df02e6aeb3d3c06c95ff201d575907c736d6c62cfa4b6934c11203f1d600ffa"
-SRC_URI[go_linux_ppc64le.sha256sum] = "00bdfb16d1094e78473b681d2d09d42c19c886d4dfed743853769f1665c7a552"
+SRC_URI[go_linux_amd64.sha256sum] = "bbca37cc395c974ffa4893ee35819ad23ebb27426df87af92e93a9ec66ef8712"
+SRC_URI[go_linux_arm64.sha256sum] = "124ea6033a8bf98aa9fbab53e58d134905262d45a022af3a90b73320f3c3afd5"
+SRC_URI[go_linux_ppc64le.sha256sum] = "63fc9559a3d6dfd63aa902f714375b879bbc848466181c035c122489b9646e27"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.24.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.24.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.24.5.bb b/meta/recipes-devtools/go/go-cross_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.24.5.bb
rename to meta/recipes-devtools/go/go-cross_1.24.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.24.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.24.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.24.5.bb b/meta/recipes-devtools/go/go-runtime_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.24.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.6.bb
diff --git a/meta/recipes-devtools/go/go_1.24.5.bb b/meta/recipes-devtools/go/go_1.24.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.24.5.bb
rename to meta/recipes-devtools/go/go_1.24.6.bb
-- 
2.43.0


