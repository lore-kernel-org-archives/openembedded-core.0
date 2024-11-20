Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33458D63947
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.13937.1732111041723553129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bx3jHVy5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso20286515ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111041; x=1732715841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iF1qL6cU+wL65+BWb0ap1CMsN2m4A+H8CHdy0cUwqnU=;
        b=Bx3jHVy5mr7gj3wLsBOERYwmTKK6WwcwsnSg1DgNXW4jkRUYmWr6Ee3sP013q0/y6L
         7LqzaSZA7cqroXPggTvhF3z3HR+MlwA73GVya1gyN9g5bsVpozzOnRr9PgAFQOdjzS9h
         lKYojhWnoeqlnb93E+QtyoAdqLnyEFnK9P7Jh6XpFDwkYLPMhfx7F8f+XpAXwKRJM+Sn
         0zfUXSrl/8XhNQItp9Ej32JKGgtyf4vJ8ZDLqHToWUrl/z5fXt6IffL3b0lVzYJlFC60
         xVlWCBuPdUx1afAKfsYAgIiFwh7z9lwCyL7cFaRA7NMGdTog+rPbGXqwbkyLlqRpuldD
         1F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111041; x=1732715841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iF1qL6cU+wL65+BWb0ap1CMsN2m4A+H8CHdy0cUwqnU=;
        b=CyDMMjGlqlrQB5PTyZ7L+mxRPd/l2wANI9o307L/sbixp7PObuPWLY7md8D3Tg2fmL
         98v8hYnJuxgf3HydLKn+Sd22QTA6cBmX4S18NY6P97QudQiTfE0QTuvWQUhfT0AVMxFB
         Fqkf/i6367AgJO+61LBkBeE2dskIwJ8fX8c0KAtoEnhQMrUEeFYWjzTGk3Px7TgxA1Su
         +wIH7cwNDpkIDrB8lR7BfRB0dni7JCydLog9yOchf1UuZvbunIJGUH0L3zDthlHYs4jW
         ZZBAAB6eRQGfkbwJyh1SA39cOdIBw/xp8e0hnkr4lGWx0RY8lkvR1Wsmterp9GFzP8Vn
         u9Kw==
X-Gm-Message-State: AOJu0Ywcvn4cfQ1BnYBpN8puR9w2ltK9lNsj4z1vL8tVp39JZbskbJR3
	K9GNA1N13ERH9Ejv+dco5lAqqNnyOzLAF+Hg/nwTmIt/21sx842hmjUhk1g4lGneCHB52VrdkYc
	e
X-Gm-Gg: ASbGncuLwpkBkeyA8XhRLc3SY4lqDBWieBVf7LEp5VghqpxSBihOZq21m88VoJRgZjE
	d/N40AG021dTfmBOsyDDfkBk6ydTe/wrZ7fI2vEyLN1+HoWFD+1vt2n3o+40YkhTiFdfXDGogtG
	Z0zoI6aC75kWz4D91tT5/s1Arloxc+LIdTEob4ZUczv5f3cVQqUqHsmQF872o0l5m/pevDekJDn
	cidS7ku1bs/J6y94wgUMQHOByCujF9Xr793j2w=
X-Google-Smtp-Source: AGHT+IGiycYVlZOvn68ijelPZHNacDBRow/xkkgdgPPnFQuH3dQk6MrywTeE6mL5dlyvK4joBRMljA==
X-Received: by 2002:a17:902:ccd2:b0:20c:da66:3875 with SMTP id d9443c01a7336-2126a3e8efamr39088145ad.24.1732111040950;
        Wed, 20 Nov 2024 05:57:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 06/31] go: upgrade 1.22.6 -> 1.22.7
Date: Wed, 20 Nov 2024 05:56:38 -0800
Message-Id: <6d034099570e38d4b6244ab90b4b78f25b1dcc24.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207430

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

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92d609c49c0870ca10fcc39d52a801109d65a98b)
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


