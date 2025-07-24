Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBFAC87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:35:29 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.2653.1753385724004636767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LKQhljoL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31329098ae8so1254534a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753385723; x=1753990523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMrjUjyKPmzSkMnWyBQj9Qat7nXrfevleNoOAd0xybo=;
        b=LKQhljoL2ioOmWCiyMkPjlUzY6T8cBEqaNU/vX0PywieCN8zjhXOpuFV3y0p3w86Zf
         /1MmxdTDV0+RAGGuf+99mSZsmkzGOZdrGg8/WnrhVhBujmN2C6Zi84qYtA9kduCvsl53
         7xXDDjsvPyedRzPPsYbp+VTUP772K9TOI1fIeY2TTfYTTAsxVjnSy+AiSN0LehKoWpta
         ExgWaL/lJbyIV5RXwNGg+/QTFaNXbq16JwqGIemyJsOL5ll05MLbGbcWLtl0hDREwK2Y
         gCMXH5n1Rr1i3QzhYOQscDmz/6WkNWIcXeORBuSnIBst4/nX6yqZBcM3RoJumYbHH9Zb
         mteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753385723; x=1753990523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMrjUjyKPmzSkMnWyBQj9Qat7nXrfevleNoOAd0xybo=;
        b=qA8bNHggXz7czOx6BmETv/SguH+j2Gh31RxMVFUenVj1i+YRFuMGM9HZjRH53hHVDh
         FhvYX+cLxNNfJE9o5Cca6Aq+sUTuGj+k7U65OkqrvoJcmMvR4YuBWFTLXJUHlV89xWH1
         Xla5uDVvpbrZiX9ouJaN/dxIM/NGnqywGLR4VcgLpDDD1xqFiJr5/uqETVgBy0u+jt+a
         qc4KuwR0tAly9SQ8XWr53D5kY4ZhwNJkdv7plYQ3Hl6zDBQLYki1NmS355WbMM2C0H0B
         YvOv9Bo+sLRTr5+pbk3DT+rQO9tsOkAArHt5JL7LiTTAd3pknZpoFcfzoLJ66R2ee0ux
         81qw==
X-Gm-Message-State: AOJu0Yy262EXSZNDBdHbNDEiEs/Xav61k7rZhTK7MBxqNIEpgUojkwmr
	FHGr8JeTPtQ2wF0lpsg22n/k2fVGNG2cjWiGP1B+VBZgEZaAzwjHKLls7jvDUPmeDQ5Po9BwznC
	1FXnt
X-Gm-Gg: ASbGncvwJkIY17CYvwwADHkVTtOnsfjjGrcj7DksDcUuz4q9I+Ciy7hfBu07pZ21DlF
	P3SoWbzo1aJ2w3KxfpLd6VN3XwXM2tokHXfHw2SeRSsuLH7XPGuh+9BX3B2eh5QUyclSZLzNNZS
	MpwzTFOwkSHaG3S86TgEpQsOmltiA4RKwWgOL1yfPlD/PAqHLke2vPy9IN61UgHxdNwJBUag5Ak
	cgdNwpeDndWREh5+Cb7//SXiMpGWGwf9y+tgLxVY1t1vubNN/HW4TH4Cb4XNZnWtyEzKJ6Dp09Z
	s+9zgCrhmzeYR5hMyM370+9Kbfg0fkQSrU+QiiOTMlUfsCwo/N0bpMg2gvVu65eVAJASz77A7Wm
	ctJB/8/2ht2lH
X-Google-Smtp-Source: AGHT+IErWPK7IrOoDHBOr2iTGDBvT/Llh4QHpS0Afq8L8XuaK+b5nGsuDZHB7BEbTzbQS4V9eilEDQ==
X-Received: by 2002:a17:90b:4d81:b0:311:83d3:fd9c with SMTP id 98e67ed59e1d1-31e660dafd8mr4452774a91.0.1753385723087;
        Thu, 24 Jul 2025 12:35:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66267fa4sm1978524a91.5.2025.07.24.12.35.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:35:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 2/6] go: upgrade 1.24.4 -> 1.24.5
Date: Thu, 24 Jul 2025 12:35:06 -0700
Message-ID: <631afac9d81346a5d5b2e2a073ad4664c780e9af.1753385563.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753385563.git.steve@sakoman.com>
References: <cover.1753385563.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220861

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.24.x release [1]:

$ git --no-pager log --oneline go1.24.4..go1.24.5
9d828e80fa (tag: go1.24.5) [release-branch.go1.24] go1.24.5
825eeee3f7 [release-branch.go1.24] cmd/go: disable support for multiple vcs in one module
dbf30d88f3 [release-branch.go1.24] cmd/link: permit a larger size BSS reference to a smaller DATA symbol
6b51660c8c [release-branch.go1.24] runtime: set mspan limit field early and eagerly
cc604130c8 [release-branch.go1.24] runtime: prevent mutual deadlock between GC stopTheWorld and suspendG
21b488bb60 [release-branch.go1.24] runtime: handle system goroutines later in goroutine profiling
e038690847 [release-branch.go1.24] cmd/go/internal/fips140: ignore GOEXPERIMENT on error
1575127ef8 [release-branch.go1.24] runtime: add missing unlock in sysReserveAlignedSbrk
7d08a16fba [release-branch.go1.24] cmd/compile/internal/ssa: fix PPC64 merging of (AND (S[RL]Dconst ...)
5f2cbe1f64 [release-branch.go1.24] cmd/compile: do nil check before calling duff functions, on arm64 and amd64

Fixes CVE-2025-4674 [2].

[1] https://github.com/golang/go/compare/go1.24.4...go1.24.5
[2] https://groups.google.com/g/golang-announce/c/gTNJnDXmn34

(From OE-Core rev: a3cc5038ea10a4857627e6f4de25bdc43023a349)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.24.4.inc => go-1.24.5.inc}   | 2 +-
 ...o-binary-native_1.24.4.bb => go-binary-native_1.24.5.bb} | 6 +++---
 ...cross-canadian_1.24.4.bb => go-cross-canadian_1.24.5.bb} | 0
 .../go/{go-cross_1.24.4.bb => go-cross_1.24.5.bb}           | 0
 .../go/{go-crosssdk_1.24.4.bb => go-crosssdk_1.24.5.bb}     | 0
 .../go/{go-runtime_1.24.4.bb => go-runtime_1.24.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.4.bb => go_1.24.5.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.4.inc => go-1.24.5.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.4.bb => go-binary-native_1.24.5.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.4.bb => go-cross-canadian_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.4.bb => go-cross_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.4.bb => go-crosssdk_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.4.bb => go-runtime_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.4.bb => go_1.24.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.24.4.inc b/meta/recipes-devtools/go/go-1.24.5.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.24.4.inc
rename to meta/recipes-devtools/go/go-1.24.5.inc
index eff3f2f605..fae0d3f333 100644
--- a/meta/recipes-devtools/go/go-1.24.4.inc
+++ b/meta/recipes-devtools/go/go-1.24.5.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "5a86a83a31f9fa81490b8c5420ac384fd3d95a3e71fba665c7b3f95d1dfef2b4"
+SRC_URI[main.sha256sum] = "74fdb09f2352e2b25b7943e56836c9b47363d28dec1c8b56c4a9570f30b8f59f"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb b/meta/recipes-devtools/go/go-binary-native_1.24.5.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.24.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.5.bb
index a5324d0f06..3de63060c7 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "77e5da33bb72aeaef1ba4418b6fe511bc4d041873cbf82e5aa6318740df98717"
-SRC_URI[go_linux_arm64.sha256sum] = "d5501ee5aca0f258d5fe9bfaed401958445014495dc115f202d43d5210b45241"
-SRC_URI[go_linux_ppc64le.sha256sum] = "9ca4afef813a2578c23843b640ae0290aa54b2e3c950a6cc4c99e16a57dec2ec"
+SRC_URI[go_linux_amd64.sha256sum] = "10ad9e86233e74c0f6590fe5426895de6bf388964210eac34a6d83f38918ecdc"
+SRC_URI[go_linux_arm64.sha256sum] = "0df02e6aeb3d3c06c95ff201d575907c736d6c62cfa4b6934c11203f1d600ffa"
+SRC_URI[go_linux_ppc64le.sha256sum] = "00bdfb16d1094e78473b681d2d09d42c19c886d4dfed743853769f1665c7a552"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.24.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.24.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.24.4.bb b/meta/recipes-devtools/go/go-cross_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.24.4.bb
rename to meta/recipes-devtools/go/go-cross_1.24.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.24.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.24.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.24.4.bb b/meta/recipes-devtools/go/go-runtime_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.24.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.5.bb
diff --git a/meta/recipes-devtools/go/go_1.24.4.bb b/meta/recipes-devtools/go/go_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.24.4.bb
rename to meta/recipes-devtools/go/go_1.24.5.bb
-- 
2.43.0


