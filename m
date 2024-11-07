Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E84ED5AE59
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:11 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.64437.1730950689975511819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KA8FOMQ5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-656d8b346d2so395466a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950689; x=1731555489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdWANORKdxN694Lt5LFUyeZ/wLAG33V1m0hCepc1wws=;
        b=KA8FOMQ5xdjoqWfHHzzGfLlLuzw1wt9MI57iyucJ1J6DA291c5by7x4Kjok41Q3F9D
         NE2DvO9A6nRhBvFqgrDHSf2hrBjdVTAgoDpgzd5fsT33RiiXLOmlxQASfHznYmaahyIP
         zXHDQG6IMcGqwpZAMm9ypdowlTSgZj61fl7+jPuO3ezyMeADqKX71S1HJcnKZIUiED0R
         qz2HVP/BNZ/N/OyWTj4vNDnTL5A2di/z9rAxFcdUW4eVnQJHn6z5fZjp04TFAGyGEEZD
         YnAN05fmTBoApoG6nrWLx6A9aavkIb3A9SXo1eZrF+QoiWP5VBB/ywoBmSmgYBFRBZSh
         js6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950689; x=1731555489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdWANORKdxN694Lt5LFUyeZ/wLAG33V1m0hCepc1wws=;
        b=jJOMYFi249YVA/oMSBqwhWlfNtQ8dUHsFBREptVSCo+KgtFyPjeKLBQ3A5wXoV0+hF
         SBZvKRV5npcwJH1crxOlBpJbNGJIGjd+TXKUbqe2/08PVp9WKl0/5oZTRluiTxBKkVi6
         FHewZe0NJl5mT/IgJF2AeZM9s36RB/4XMFkvcyAatlfsJ95UszQb0appVsQYKkI0DKji
         k3HzwmnJBzYpZu6ePAjf84KK3Qjmqqu0hQyy1i0jSr4S9AhU5FvhPtUNmcK3WKVKPogS
         SshGrj7XK07kxXY+Xq5d5H8Or0D7u/a1UJisuEB5j5PQJY+yoiP6qvCuXw37sDKYYACB
         /wog==
X-Gm-Message-State: AOJu0YzU5hbF7O4uSmWfVQY+dUZosdXkMzs1Cfz9MRinaKh6FrLAWAHa
	L3CVd9Ptfr8xHL4n3OJtbe3XA42afRA+i5C8QziCxCqpnrypReVhH4nIX4nHpt6M0R2IOodj2hf
	r
X-Google-Smtp-Source: AGHT+IH0YT7AIsJdauHLSJFgPFaxMTWOIAFD/pimwqOrvNRWRHMDDV+IgV/0ueP/1iTpWWQjYX1y9g==
X-Received: by 2002:a05:6a21:7894:b0:1db:e917:5755 with SMTP id adf61e73a8af0-1dbe91771e6mr15014124637.30.1730950689053;
        Wed, 06 Nov 2024 19:38:09 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.38.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:38:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/10] go: upgrade 1.22.6 -> 1.22.7
Date: Wed,  6 Nov 2024 19:37:45 -0800
Message-Id: <4a0ccebab099b3654097ca6ba591eefce58a410e.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206823

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.6..go1.22.7
7529d09a11 (tag: go1.22.7) [release-branch.go1.22] go1.22.7
d4c53812e6 [release-branch.go1.22] go/build/constraint: add parsing limits
2092294f2b [release-branch.go1.22] encoding/gob: cover missed cases when checking ignore depth
b232596139 [release-branch.go1.22] go/parser: track depth in nested element lists
e87be9833e [release-branch.go1.22] runtime: on AIX, fix call to _cgo_sys_thread_create in _rt0_ppc64_aix_lib
676d6100d8 [release-branch.go1.22] cmd/fix: support go versions with patch release
0a525a3ed0 [release-branch.go1.22] os: fix Chtimes test flakes

Fixes CVE-2024-34155, CVE-2024-34156 and CVE-2024-34158

[1] https://github.com/golang/go/compare/go1.22.6...go1.22.7

(From OE-Core rev: 92d609c49c0870ca10fcc39d52a801109d65a98b)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.22.6.inc => go-1.22.7.inc}   | 2 +-
 ...o-binary-native_1.22.6.bb => go-binary-native_1.22.7.bb} | 6 +++---
 ...cross-canadian_1.22.6.bb => go-cross-canadian_1.22.7.bb} | 0
 .../go/{go-cross_1.22.6.bb => go-cross_1.22.7.bb}           | 0
 .../go/{go-crosssdk_1.22.6.bb => go-crosssdk_1.22.7.bb}     | 0
 .../go/{go-runtime_1.22.6.bb => go-runtime_1.22.7.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.6.bb => go_1.22.7.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.6.inc => go-1.22.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.6.bb => go-binary-native_1.22.7.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.6.bb => go-cross-canadian_1.22.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.6.bb => go-cross_1.22.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.6.bb => go-crosssdk_1.22.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.6.bb => go-runtime_1.22.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.6.bb => go_1.22.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.6.inc b/meta/recipes-devtools/go/go-1.22.7.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.6.inc
rename to meta/recipes-devtools/go/go-1.22.7.inc
index 834debaf9b..e54a902741 100644
--- a/meta/recipes-devtools/go/go-1.22.6.inc
+++ b/meta/recipes-devtools/go/go-1.22.7.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "9e48d99d519882579917d8189c17e98c373ce25abaebb98772e2927088992a51"
+SRC_URI[main.sha256sum] = "66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.6.bb b/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.7.bb
index ea4577f20a..aba317fd38 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "999805bed7d9039ec3da1a53bfbcafc13e367da52aa823cb60b68ba22d44c616"
-SRC_URI[go_linux_arm64.sha256sum] = "c15fa895341b8eaf7f219fada25c36a610eb042985dc1a912410c1c90098eaf2"
-SRC_URI[go_linux_ppc64le.sha256sum] = "9d99fce3f6f72a76630fe91ec0884dfe3db828def4713368424900fa98bb2bd6"
+SRC_URI[go_linux_amd64.sha256sum] = "fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb"
+SRC_URI[go_linux_arm64.sha256sum] = "ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885"
+SRC_URI[go_linux_ppc64le.sha256sum] = "a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.6.bb b/meta/recipes-devtools/go/go-cross_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.6.bb
rename to meta/recipes-devtools/go/go-cross_1.22.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.6.bb b/meta/recipes-devtools/go/go-runtime_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.7.bb
diff --git a/meta/recipes-devtools/go/go_1.22.6.bb b/meta/recipes-devtools/go/go_1.22.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.6.bb
rename to meta/recipes-devtools/go/go_1.22.7.bb
-- 
2.34.1


