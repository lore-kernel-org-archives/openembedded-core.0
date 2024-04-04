Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46743CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 10:17:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.34687.1712225834214955436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 03:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jeY8XUey;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4162bac959cso1556965e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 03:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712225832; x=1712830632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljoseFL4bhRMtU3Tqh5jLVew3MAJZz1/eO4+SVwYT3w=;
        b=jeY8XUeyk/oI4E2Ssue/p3Go9uRVouFui4ubCSIkB5F/H+9QKbLFIJJQE+GrP0Bdv1
         /p0rbz9GQI2x86uTmSro4Ps3AY/aTnz+wo+h8tIG0ZsEspQritZ+JkwI2GqwFkCl3slv
         knDGOkfrO9oV1X9KkNQmtrSDHOIUVbIBRevCNu5cJAll79F5/U8XCrj8PHlK6/Ivp0vG
         5wYraAbPMZPE43IwpcjM5KHus1MU4lsIbBNv7Ksy9k/7pyHEV83M60WWCDOJxIHF5pPH
         ttYrZpgbwxRPYTtD2mTFmOXJ4jH76ZVetA6h0pOySJpm8Rg8wTdx85neaXUNSzUPFQN4
         XBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712225832; x=1712830632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljoseFL4bhRMtU3Tqh5jLVew3MAJZz1/eO4+SVwYT3w=;
        b=imZqC2nMOWGnHazZqGpsuOJWZ2ottz47xSqqMbOobEW3RVvfQAftc3HAgu7/Pwyosh
         +AvcxFPMuCQzu5+bJTA+Vl4VEWa56bbrXJzzO1H63D6Nlau9Y2ZM6wl3fr630sbwpXVC
         wWX9f+4+HsOJYUOuaFbXOzLvXesUq4tcpreX5uEMfXUVOB8q8PJ99iUT95BGUZLahV3Q
         /9hSWsakQx9zVqp0PXMHFS73a1OUp/C8KHVK/lEdt5qM6VUVgt4isnSwhZ386OBqW21z
         ZsdgNfiJKg95Wk1q9lD64pF7ql6QMoGzwTkO0HmWBHLVKfYC4YBjuBKFr2B5tooFUjMh
         xRRw==
X-Gm-Message-State: AOJu0YyWjHj46hxvwOTQrt3C/KrumnS39tq3kiKvonCFuWSMQL/k5Iv3
	vF6fudBtc2w3vzrbMbrm3WimfC8FUHZUx2DU1GrNRARpIdwLQUcXWITu7YpD
X-Google-Smtp-Source: AGHT+IHLT7gk45RlyDG2coUzIoKCyRWLFcqRWGEo5QlBPMSFGaVWkJVe7fWDtYCOzLdvEvyBL8fpSw==
X-Received: by 2002:a5d:42c4:0:b0:343:81ea:c534 with SMTP id t4-20020a5d42c4000000b0034381eac534mr1649839wrr.64.1712225832043;
        Thu, 04 Apr 2024 03:17:12 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d4b0d000000b0034356c434d0sm4685463wrq.117.2024.04.04.03.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:17:11 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/2] go: upgrade 1.22.1 -> 1.22.2
Date: Thu,  4 Apr 2024 11:16:58 +0100
Message-ID: <20240404101658.2444210-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404101658.2444210-1-jose.quaresma@foundries.io>
References: <20240404101658.2444210-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 10:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197954

Include fixes for CVE-2023-45288

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.1..go1.22.2
dddf0ae40f (tag: go1.22.2) [release-branch.go1.22] go1.22.2
e55d7cf843 [release-branch.go1.22] net/http: update bundled golang.org/x/net/http2
4edf4bb2c6 [release-branch.go1.22] all: update golang.org/x/net
2c6d106541 [release-branch.go1.22] cmd/compile: don't assume args are always zero-extended
46587483e3 [release-branch.go1.22] cmd/compile: fix sign/zero-extension removal
0a5b33a883 [release-branch.go1.22] encoding/gob: make x509.Certificate marshalable again
0c53f93faa [release-branch.go1.22] cmd/go/internal/modfetch: pass "-c" arguments to git before subcommands
abfd578156 [release-branch.go1.22] runtime: fix EvFrequency event value on Windows in the new tracer
7fb7acb82d [release-branch.go1.22] cmd/link/internal/riscv64: generate local text symbols for R_RISCV_CALL
e23707b59c [release-branch.go1.22] go/types, types2: handle Alias types in substitution
3826650c99 [release-branch.go1.22] cmd/compile: fix early deadcode with label statement
e71b0b1fee [release-branch.go1.22] cmd/compile: fix copying SSA-able variables optimization
9508eae5d1 [release-branch.go1.22] cmd/internal/obj/ppc64: don't modify runtime.elf_* symbols
35b1a146d9 [release-branch.go1.22] cmd/go: respect -coverpkg for unselected no-test packages

[1] https://github.com/golang/go/compare/go1.22.1...go1.22.2

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.22.1.inc => go-1.22.2.inc}   | 2 +-
 ...o-binary-native_1.22.1.bb => go-binary-native_1.22.2.bb} | 6 +++---
 ...cross-canadian_1.22.1.bb => go-cross-canadian_1.22.2.bb} | 0
 .../go/{go-cross_1.22.1.bb => go-cross_1.22.2.bb}           | 0
 .../go/{go-crosssdk_1.22.1.bb => go-crosssdk_1.22.2.bb}     | 0
 .../go/{go-native_1.22.1.bb => go-native_1.22.2.bb}         | 0
 .../go/{go-runtime_1.22.1.bb => go-runtime_1.22.2.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.1.bb => go_1.22.2.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.1.inc => go-1.22.2.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.1.bb => go-binary-native_1.22.2.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.1.bb => go-cross-canadian_1.22.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.1.bb => go-cross_1.22.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.1.bb => go-crosssdk_1.22.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.22.1.bb => go-native_1.22.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.1.bb => go-runtime_1.22.2.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.1.bb => go_1.22.2.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.1.inc b/meta/recipes-devtools/go/go-1.22.2.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.1.inc
rename to meta/recipes-devtools/go/go-1.22.2.inc
index f1cf4beebb..b399207311 100644
--- a/meta/recipes-devtools/go/go-1.22.1.inc
+++ b/meta/recipes-devtools/go/go-1.22.2.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "79c9b91d7f109515a25fc3ecdaad125d67e6bdb54f6d4d98580f46799caea321"
+SRC_URI[main.sha256sum] = "374ea82b289ec738e968267cac59c7d5ff180f9492250254784b2044e90df5a9"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.1.bb b/meta/recipes-devtools/go/go-binary-native_1.22.2.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.1.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.2.bb
index 8d8248df8a..0f00509f03 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.1.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.2.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "aab8e15785c997ae20f9c88422ee35d962c4562212bb0f879d052a35c8307c7f"
-SRC_URI[go_linux_arm64.sha256sum] = "e56685a245b6a0c592fc4a55f0b7803af5b3f827aaa29feab1f40e491acf35b8"
-SRC_URI[go_linux_ppc64le.sha256sum] = "ac775e19d93cc1668999b77cfe8c8964abfbc658718feccfe6e0eb87663cd668"
+SRC_URI[go_linux_amd64.sha256sum] = "5901c52b7a78002aeff14a21f93e0f064f74ce1360fce51c6ee68cd471216a17"
+SRC_URI[go_linux_arm64.sha256sum] = "36e720b2d564980c162a48c7e97da2e407dfcc4239e1e58d98082dfa2486a0c1"
+SRC_URI[go_linux_ppc64le.sha256sum] = "251a8886c5113be6490bdbb955ddee98763b49c9b1bf4c8364c02d3b482dab00"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.1.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.1.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.2.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.1.bb b/meta/recipes-devtools/go/go-cross_1.22.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.1.bb
rename to meta/recipes-devtools/go/go-cross_1.22.2.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.1.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.1.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.2.bb
diff --git a/meta/recipes-devtools/go/go-native_1.22.1.bb b/meta/recipes-devtools/go/go-native_1.22.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.22.1.bb
rename to meta/recipes-devtools/go/go-native_1.22.2.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.1.bb b/meta/recipes-devtools/go/go-runtime_1.22.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.1.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.2.bb
diff --git a/meta/recipes-devtools/go/go_1.22.1.bb b/meta/recipes-devtools/go/go_1.22.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.1.bb
rename to meta/recipes-devtools/go/go_1.22.2.bb
-- 
2.44.0


