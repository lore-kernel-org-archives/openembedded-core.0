Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720B8112587E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:27:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4874.1773257261301437439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oerAy5Mp;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439bcec8613so184081f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773257259; x=1773862059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moo+DXo+6H6ZbNchJCsulvKgL3hOmbwDLeVQdsoZNp8=;
        b=oerAy5MpYFGqrsgpy5Wn3Qg2sklgIpQe/KeleRKCy6ktvBHwe74AF7hj4WmU5RV6mi
         fp+dHhj1EQiCaIvrTNb21DNmHzNmh4PK/Wiaxs+nVeefVUeyV0ZBZI2UnKv4plYJFYaS
         YTZuMMbdb5x+TWQ81VluYOU788MRoegcrxVfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257259; x=1773862059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=moo+DXo+6H6ZbNchJCsulvKgL3hOmbwDLeVQdsoZNp8=;
        b=BBs+geApK98kYQa24OIsindG1ZCaDE31Y0SUrZB19sUToCMj9fXqMNzfqCNHe9YzZQ
         TWXTll6m77R2EiIwN2vq3Sp3g3yyr+QrWFyuFHUSPqJUmCQFV0J0I/LWxedNZ4q7sF8J
         EvYbYJo+/OkUlLdYgly8ipwQyvHaAzIfb7gjkExkCm+aLuX/1ymq/6wrCN0677X1FcPF
         pPHEqloE49mK7G1fZbquGRoQ1+FV/A2vrkq80LKs9YpO0ujcTP/BwoUOo4PbzhY2JFeM
         c1WhV6ik+yWuX6soStqbQk+yDXzstqmHE2LXZ5E3jKko9Wzi7ltLSacseTh2f3P3M6SL
         9dDA==
X-Gm-Message-State: AOJu0YwgdqeD11p/EV0766JnSltYI1ztrIPvMvgKd/EffGfs8JawuPGz
	OCCd+k+AxFEyAUU3/7OzlrhKLJtSdyiUHWiwwTrsVgwH3D5xeG3UA28rl+wRAw+uzTLXewGEpcX
	cRT/5
X-Gm-Gg: ATEYQzy5VGmBsZBEeYhnQdYeQd0usCbW4zD9mNa61zf25ON7ly0Xoxy6KXfO9W/CvYw
	+eLc8WCsFMpGKq1P9/pNsagFHew5+66WDpH9KvHpW/DODkPKS/+ct9SvJ7YH9xG1fYAua30lcVi
	ZXa1I1ZdArFOUKPTTqZ5NQVwaKVUfQgrTCzYpLDZkxYjLYMQG2zj+3n2GnYUPJxmveOHKorSb3a
	BSZPuJtst3dpw2638wIscAxyd7z2QAHFXRcHO43JOOxifOw3CU/piqazA6u9IyA6qRv5/zKRZXs
	4jnLJ04o6/e6dixzi0T3dqpOWclfpY7hTCmyUE2u8G1zTw9rnjyClOux3t7SI6bproqNG30BP9U
	F8hZQ/C5ILYgJrBX9Ywds2mf2EAjL1yx9c/8g/+IsW60q4yW9UJ6ZnwXvigHF/Mig/7yjJStJdS
	8vR9MxFTJYuMeEfhlxsKm1QtMXrSHLD2tU1lW4ndG6k1uRrbUBM4kzmIodiWGZAItja+kdcnzQw
	rb2yJhc1gVfCpvtnPqs5LU0/0k=
X-Received: by 2002:a05:6000:26d1:b0:439:abcd:b317 with SMTP id ffacd0b85a97d-439f81c7005mr7342632f8f.14.1773257259195;
        Wed, 11 Mar 2026 12:27:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22f3a4sm1452450f8f.38.2026.03.11.12.27.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:27:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 4/6] go: upgrade 1.25.7 -> 1.25.8
Date: Wed, 11 Mar 2026 20:27:06 +0100
Message-ID: <5204e5698cccfc55562b0d5c0eba904b12f911e5.1773257124.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773257124.git.yoann.congal@smile.fr>
References: <cover.1773257124.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 19:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232903

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.7..go1.25.8
439ff996f0 (tag: go1.25.8) [release-branch.go1.25] go1.25.8
a9db31e6d9 [release-branch.go1.25] html/template: properly escape URLs in meta content attributes
d8174a9500 [release-branch.go1.25] net/url: reject IPv6 literal not at start of host
4091800393 [release-branch.go1.25] os: avoid escape from Root via ReadDir or Readdir
0ee4ab4c3f [release-branch.go1.25] internal/syscall/windows: correct some enums and syscall signatures
9f8fa93be5 [release-branch.go1.25] os: support deleting inaccessible files in RemoveAll
df7331dc32 [release-branch.go1.25] all: update x/sys
92544bbc98 [release-branch.go1.25] runtime: don't negate eventfd errno
0c56fa2818 [release-branch.go1.25] net/smtp: prevent test failures due to expired test certificate
592530ed6b [release-branch.go1.25] cmd/go: fix pkg-config flag sanitization
0222717377 [release-branch.go1.25] cmd/compile: fix mis-compilation for static array initialization

Fixes CVE-2026-27137, CVE-2026-27138, CVE-2026-27142, CVE-2026-25679 and
      CVE-2026-27139.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.25.7...go1.25.8
[2] https://groups.google.com/g/golang-announce/c/EdhZqrQ98hk

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/{go-1.25.7.inc => go-1.25.8.inc}   | 2 +-
 ...o-binary-native_1.25.7.bb => go-binary-native_1.25.8.bb} | 6 +++---
 ...cross-canadian_1.25.7.bb => go-cross-canadian_1.25.8.bb} | 0
 .../go/{go-cross_1.25.7.bb => go-cross_1.25.8.bb}           | 0
 .../go/{go-crosssdk_1.25.7.bb => go-crosssdk_1.25.8.bb}     | 0
 .../go/{go-runtime_1.25.7.bb => go-runtime_1.25.8.bb}       | 0
 meta/recipes-devtools/go/{go_1.25.7.bb => go_1.25.8.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.7.inc => go-1.25.8.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.7.bb => go-binary-native_1.25.8.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.7.bb => go-cross-canadian_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.7.bb => go-cross_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.7.bb => go-crosssdk_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.7.bb => go-runtime_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.7.bb => go_1.25.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.7.inc b/meta/recipes-devtools/go/go-1.25.8.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.7.inc
rename to meta/recipes-devtools/go/go-1.25.8.inc
index ab58f712ef1..5db1b1c04cb 100644
--- a/meta/recipes-devtools/go/go-1.25.7.inc
+++ b/meta/recipes-devtools/go/go-1.25.8.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "178f2832820274b43e177d32f06a3ebb0129e427dd20a5e4c88df2c1763cf10a"
+SRC_URI[main.sha256sum] = "e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.7.bb b/meta/recipes-devtools/go/go-binary-native_1.25.8.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.8.bb
index 19951344810..df6cb542fb6 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.8.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "12e6d6a191091ae27dc31f6efc630e3a3b8ba409baf3573d955b196fdf086005"
-SRC_URI[go_linux_arm64.sha256sum] = "ba611a53534135a81067240eff9508cd7e256c560edd5d8c2fef54f083c07129"
-SRC_URI[go_linux_ppc64le.sha256sum] = "42124c0edc92464e2b37b2d7fcd3658f0c47ebd6a098732415a522be8cb88e3f"
+SRC_URI[go_linux_amd64.sha256sum] = "ceb5e041bbc3893846bd1614d76cb4681c91dadee579426cf21a63f2d7e03be6"
+SRC_URI[go_linux_arm64.sha256sum] = "7d137f59f66bb93f40a6b2b11e713adc2a9d0c8d9ae581718e3fad19e5295dc7"
+SRC_URI[go_linux_ppc64le.sha256sum] = "28ed144a945e4d7188c93f8d85fb772a98ed18f8f9f8d3a650696b739f8cc57c"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.7.bb b/meta/recipes-devtools/go/go-cross_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.7.bb
rename to meta/recipes-devtools/go/go-cross_1.25.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.7.bb b/meta/recipes-devtools/go/go-runtime_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.8.bb
diff --git a/meta/recipes-devtools/go/go_1.25.7.bb b/meta/recipes-devtools/go/go_1.25.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.7.bb
rename to meta/recipes-devtools/go/go_1.25.8.bb

