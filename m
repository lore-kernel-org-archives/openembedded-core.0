Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43379C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 16:46:06 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2071.1787589961045248404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 09:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TXfOkarj;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38deea72eebso4285357a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787589960; x=1788194760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOVjqoF8/fK0Bdwd/Whp8+Q2D8DSnLCkPAMtbk4hEeA=;
        b=TXfOkarjSs15mjmejU5vATbpCgWrfGBQSaBc2Yg3jfy9bkmYaPisUULyj6I8ySH5G3
         C3DyQT06v6dpiyYq79f0DwBuul5aJ2cIf3Uqu0PjTPP7NR2ao9W5lBqlqQ2rVyOycT7I
         FrEXWpNwafPcptjPQz/Ll3/TQXUygRrsRT0HSAcVO77mcS9rOqdi8ZQeU/nszWGnCy++
         QkpgqO9hGvn+OtUpGG+zTJb3HR6bSsEchy4Y5bBSwNptAgXa520WEdhHjKe9/grpIKRd
         RO2beZzJ7bbwF6+fOIkeRN7wWY/NGujpOQJDNx684vmxqU9E9CECts+cE2JaTNRM6xIW
         H3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589960; x=1788194760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOVjqoF8/fK0Bdwd/Whp8+Q2D8DSnLCkPAMtbk4hEeA=;
        b=HgzIokiSwUiuwM3FtmmSjZObI5HYPYIOajG409Pz9/7Va3eAUciQ9esUpABnmVB6/Y
         wFMtRYvKi+AJxaCy3cKT/ab2s5FbCRaKcpYJf0nCcUd/x4TPYdq44alidm97PgN+RahX
         O4bnH0qBFiSdKr0sYGgmmykinSM2JlO/QJ4MfmSDvnYS5SxnqBi1blnNzhu82BlFvZuM
         bTxr23rzKkmCOiEf6U55KNVbNq5HZVnSpJZR9OAs2JHnlPecmKSnqtMx3uuRETX8OKAV
         qxj6bcK9mgYPcOyk14e5sM2XZSaxMvndEI666n8B939qCm2YOLN6n2ZXFK/su0uCDS2k
         U1Vw==
X-Gm-Message-State: AFuF++k4omiigEkszssfSJX9D+AAHGosnZCc3u0sVCgYTYAM3jfpyT39
	J1eA8grVjYD4L7G33ZXfm4i05ahJcewIDpAvOtYQ5rwURJG31Due3zHmtY/rFw==
X-Gm-Gg: AR+sD13lAHFYBdL2wgH2rvL4EY6287slPqPd1Nc4XTUdupTfE5XLNeMceU/R+CGjg6e
	v7gsSBEQ54zgaU4+Dup/Yo2UfgX0oX9CYacENNsaHbf1DZ797tQ/kCq3H+O2tilTEf6U7Es8z6E
	mYYD+qMKWT3d9lqVgkNJVnCpkQjR3IAQHuccUvBX/gniQObI2zJUv6XCAnL9R7SVSVNTyRWzvjr
	3isHjXnVSfq4G1lJDHPFgJ2Dx7qyzWJEUcZUUE/Ibtp0LM+2x51CjvwMGO4qtNPNROnMs3aUFpN
	HuxnyAV15LYGpazJdXwRbnxQ4KmJSBswqEYDqp4kjhWsBDxYbT0p8aqVlHc4WfzX18S6yg1r9A+
	CvhF0ycPAkQjBA0DY3wR5dUvBc1zbuE2sMlyZIqzjqZ7xRBEKfeY0sssTVfC7bYnKjqQngbJCZD
	E5Q3G0WwgZphZMTnGTEpKamjnumVX0zP01mCC269nsNyD3CKAWNbhm6fwkt9Lq8TB5FQmu4XRiH
	QsnXqD+xIRq4K//qQgXoNQj4YlQkgrAOA==
X-Received: by 2002:a17:90b:5790:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395deecf08fmr38677618a91.7.1787589955573;
        Mon, 24 Aug 2026 09:45:55 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com ([103.172.209.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm41861615eec.30.2026.08.24.09.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:45:55 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 4/4] go: upgrade 1.26.7 -> 1.27.0
Date: Mon, 24 Aug 2026 22:15:27 +0530
Message-ID: <20260824164527.296576-4-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824164527.296576-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260824164527.296576-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 16:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244142

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

Release information:

https://groups.google.com/g/golang-announce/c/8gcPInd8SQE
https://go.dev/doc/go1.27

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 meta/recipes-devtools/go/{go-1.26.7.inc => go-1.27.0.inc}   | 2 +-
 ...o-binary-native_1.26.7.bb => go-binary-native_1.27.0.bb} | 6 +++---
 ...cross-canadian_1.26.7.bb => go-cross-canadian_1.27.0.bb} | 0
 .../go/{go-cross_1.26.7.bb => go-cross_1.27.0.bb}           | 0
 .../go/{go-crosssdk_1.26.7.bb => go-crosssdk_1.27.0.bb}     | 0
 .../go/{go-runtime_1.26.7.bb => go-runtime_1.27.0.bb}       | 0
 meta/recipes-devtools/go/{go_1.26.7.bb => go_1.27.0.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.7.inc => go-1.27.0.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.7.bb => go-binary-native_1.27.0.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.7.bb => go-cross-canadian_1.27.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.7.bb => go-cross_1.27.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.7.bb => go-crosssdk_1.27.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.7.bb => go-runtime_1.27.0.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.7.bb => go_1.27.0.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.7.inc b/meta/recipes-devtools/go/go-1.27.0.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.7.inc
rename to meta/recipes-devtools/go/go-1.27.0.inc
index fed87015b2..4162a2b225 100644
--- a/meta/recipes-devtools/go/go-1.26.7.inc
+++ b/meta/recipes-devtools/go/go-1.27.0.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "0ed24eac755105085b89fe9cabc2742b91a0ad7b94b59d3ad364918ebc8956ad"
+SRC_URI[main.sha256sum] = "7002403d7cc44529ef6d26f69a44818263395ead7c16c05a5808ae047ebeb0e5"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb b/meta/recipes-devtools/go/go-binary-native_1.27.0.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.27.0.bb
index 753f1b13bb..a3750653c8 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.27.0.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ffb5f8de10c62550dfddab66b36b57030721e0a44a3218e9e1181d7b59f121ca"
-SRC_URI[go_linux_arm64.sha256sum] = "5a4ec883379d51ee9ce1040d5e87f8d35e20387574dd8c947feb01eabc3c1b37"
-SRC_URI[go_linux_ppc64le.sha256sum] = "22d3b362d557175fd16b79651cab0cad64f8aaaedca745f66d16f44d56bc5de1"
+SRC_URI[go_linux_amd64.sha256sum] = "675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685"
+SRC_URI[go_linux_arm64.sha256sum] = "51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda"
+SRC_URI[go_linux_ppc64le.sha256sum] = "068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.27.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.27.0.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.7.bb b/meta/recipes-devtools/go/go-cross_1.27.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.7.bb
rename to meta/recipes-devtools/go/go-cross_1.27.0.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.27.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.27.0.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.7.bb b/meta/recipes-devtools/go/go-runtime_1.27.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.27.0.bb
diff --git a/meta/recipes-devtools/go/go_1.26.7.bb b/meta/recipes-devtools/go/go_1.27.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.7.bb
rename to meta/recipes-devtools/go/go_1.27.0.bb

