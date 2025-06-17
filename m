Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6066C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:12 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.23009.1750176006733169949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kk6dIxNM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so5572425a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176006; x=1750780806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91/Ofv8OT0QYh7qtczoGKUhQm/A69/aPyHlH6LuaMqo=;
        b=Kk6dIxNM57U4eOO/xsmEJ4XTRWYi3fARJj99tM9pw4N5VdLNUix5XY37zLHbAK0wJC
         Miap5uxYic8HhkYiDDPWV+6vGYuABYdNJASj/2b+h9mBjk8YZMlbFO8+h6b0Hi/jxRFL
         BMudksZmBYZWSQwLOFHV9cuKXlodj7cvbnlUZqImMo3FoU/a7+p3k2Si8z6vqLDQkBkj
         y3aH7wpLjL6OySM4vMmiYG+iqwAN6EApIAzt7h0T8hS/seCpsg7lSv7a6iBLCFMSTZrt
         lL72NlHeIroAkowkDED8zawvaLVno9IuwcP2QxlslVxWzbYAsxeF/STNTov9QNPHr92v
         BLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176006; x=1750780806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91/Ofv8OT0QYh7qtczoGKUhQm/A69/aPyHlH6LuaMqo=;
        b=UpM9PHcFKse7TnMoJdMjPBANyw7OAm6X225KfjpxaY2xAToIQkL4+ryWrzyQAaUFOD
         eg6gsJPqWreaZ16DnuQpshSf1xt2I7eHFNv/+TRiQLLGOj5JZMeyZtojHEAlYDM0Ullq
         xF4ZHDgYKPphnfFXv0u6TyKBliEprS5QYnFaT6FVpqFCmDrl61baqbgFZL9i2kqV0QQl
         KoUyo9j3TkpN+l/cj7vLO41a6sfYa3rNgfo5y/XGCz/Rxtn06q8/KgBHewsrZAKo85pX
         GEdS4ETYEUgFdffAQxK+6fbZ5omagDL9Kvju1BxOlX0xsCy1iaRBLeDYaXCqvgLYIrO/
         QAjw==
X-Gm-Message-State: AOJu0YySIBv7wG44HmVi2sNLbXp7piLODtFbEigRzqimb9y0ptzayUwS
	rlHp77O6wcbLoKnsX7kt4veDz2MEiBnzgmFCLDHiKgKZtaef6qRhhHZvwhtYsY+x12iOgK4SaGE
	mat9e
X-Gm-Gg: ASbGncv0ts8icI3TL9Pr+oyJxkn9EUA+fMdi3fl1NaQl0BS9F837LI42YyY0fpb5nTs
	6vMZNXIc6V492sL4yHCF0z2eUvR8rpR7z33d1LmjLv/gNl43wUlJtuQhwLr5DeG9kaD42H031S3
	s8XeQiF7fePLfg2etvMUmvF1e3AR2iFupuEMP0Zw0zpKAtliiQFVsVboP0CJr5glazJ2Nh29/+t
	tMSSS42uvY9nDnRCYXPLkutOa7nDUgWNolhuAEdqo6ByCeStnH2VsP9L3nh6a87qj1XDXMlZphs
	P7Aa+JHuZtzm8sZi9Nl9S8DYVBG6RNfyFJKnvO/ABHMoTe4IbcMrOQ==
X-Google-Smtp-Source: AGHT+IEjZdD3UcQmf7EXk8ZmMGiifH7EAxCE0BnoOqRXgB4MD2/EKAE5EdQo1J6SfrGh5Q5FBVSdgw==
X-Received: by 2002:a17:90b:4ed0:b0:313:17ec:80ec with SMTP id 98e67ed59e1d1-313f1dee7d8mr16643370a91.26.1750176005560;
        Tue, 17 Jun 2025 09:00:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/12] go: upgrade 1.24.3 -> 1.24.4
Date: Tue, 17 Jun 2025 08:59:43 -0700
Message-ID: <50fe0b3832f741bc7f9ea0b996a7e99c5696c0ba.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218891

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.24.x release [1]:

$ git --no-pager log --oneline go1.24.3..go1.24.4
6796ebb2cb [release-branch.go1.24] go1.24.4
85897ca220 [release-branch.go1.24] net/http: strip sensitive proxy headers from redirect requests
9f9cf28f8f [release-branch.go1.24] os: don't follow symlinks on Windows when O_CREATE|O_EXCL
a31c931adf [release-branch.go1.24] cmd/link: allow linkname reference to a TEXT symbol regardless of size
03811ab1b3 [release-branch.go1.24] crypto/x509: decouple key usage and policy validation
04a9473847 [release-branch.go1.24] lib/fips140: set inprocess.txt to v1.0.0
db8f1dc948 [release-branch.go1.24] hash/maphash: hash channels in purego version of maphash.Comparable
664cf832ec [release-branch.go1.24] runtime/debug: document DefaultGODEBUG as a BuildSetting
431f75a0b9 [release-branch.go1.24] os: fix Root.Mkdir permission bits on OpenBSD

Fixes CVE-2025-4673, CVE-2025-0913 and CVE-2025-22874 [2].

[1] https://github.com/golang/go/compare/go1.24.3...go1.24.4
[2] https://groups.google.com/g/golang-announce/c/ufZ8WpEsA3A

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.24.3.inc => go-1.24.4.inc}   | 2 +-
 ...o-binary-native_1.24.3.bb => go-binary-native_1.24.4.bb} | 6 +++---
 ...cross-canadian_1.24.3.bb => go-cross-canadian_1.24.4.bb} | 0
 .../go/{go-cross_1.24.3.bb => go-cross_1.24.4.bb}           | 0
 .../go/{go-crosssdk_1.24.3.bb => go-crosssdk_1.24.4.bb}     | 0
 .../go/{go-runtime_1.24.3.bb => go-runtime_1.24.4.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.3.bb => go_1.24.4.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.3.inc => go-1.24.4.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.3.bb => go-binary-native_1.24.4.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.3.bb => go-cross-canadian_1.24.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.3.bb => go-cross_1.24.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.3.bb => go-crosssdk_1.24.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.3.bb => go-runtime_1.24.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.3.bb => go_1.24.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.24.3.inc b/meta/recipes-devtools/go/go-1.24.4.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.24.3.inc
rename to meta/recipes-devtools/go/go-1.24.4.inc
index 78e26146b5..eff3f2f605 100644
--- a/meta/recipes-devtools/go/go-1.24.3.inc
+++ b/meta/recipes-devtools/go/go-1.24.4.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "229c08b600b1446798109fae1f569228102c8473caba8104b6418cb5bc032878"
+SRC_URI[main.sha256sum] = "5a86a83a31f9fa81490b8c5420ac384fd3d95a3e71fba665c7b3f95d1dfef2b4"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.3.bb b/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.24.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.4.bb
index af56dc9111..9f788536c4 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "3333f6ea53afa971e9078895eaa4ac7204a8c6b5c68c10e6bc9a33e8e391bdd8"
-SRC_URI[go_linux_arm64.sha256sum] = "a463cb59382bd7ae7d8f4c68846e73c4d589f223c589ac76871b66811ded7836"
-SRC_URI[go_linux_ppc64le.sha256sum] = "341a749d168f47b1d4dad25e32cae70849b7ceed7c290823b853c9e6b0df0856"
+SRC_URI[go_linux_amd64.sha256sum] = "77e5da33bb72aeaef1ba4418b6fe511bc4d041873cbf82e5aa6318740df98717"
+SRC_URI[go_linux_arm64.sha256sum] = "d5501ee5aca0f258d5fe9bfaed401958445014495dc115f202d43d5210b45241"
+SRC_URI[go_linux_ppc64le.sha256sum] = "9ca4afef813a2578c23843b640ae0290aa54b2e3c950a6cc4c99e16a57dec2ec"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.24.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.24.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.24.3.bb b/meta/recipes-devtools/go/go-cross_1.24.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.24.3.bb
rename to meta/recipes-devtools/go/go-cross_1.24.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.24.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.24.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.24.3.bb b/meta/recipes-devtools/go/go-runtime_1.24.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.24.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.4.bb
diff --git a/meta/recipes-devtools/go/go_1.24.3.bb b/meta/recipes-devtools/go/go_1.24.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.24.3.bb
rename to meta/recipes-devtools/go/go_1.24.4.bb
-- 
2.43.0


