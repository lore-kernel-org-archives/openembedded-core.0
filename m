Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D33AC5472D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:44 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.18867.1724244639861526217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cbiEcqb2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d28023accso4878407b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244639; x=1724849439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+J/0R3R6T9fASOvvDH3qcDBGyC/ApTsqMY7x0zjjiM=;
        b=cbiEcqb2lf9igw/uuDH+HnLDcDEZBd7O7PMRyzuMkqKpa56dM+wO7MwgNuQsffpYh3
         IXAhLOUbnZuXOXdDF3/tbrxHCPC60DOrxEdwkUpVrvxUUuDT1K7b6POu3gTnXqooCQpw
         xKfQ4HY1j+KXNQNC4C7xy/GIhThVlo1L24UKAA5PavgnUD+njI7oweJhSV3SeBXh2gwm
         YDjJ78olgiJW/ZXL5N7poI+rx+CYvLDCkb7FWGGbpeXBBIZcspeYTapaC6VIBHHKmK12
         dLV/Sf/KqSH8dkPnHi5ck3ERvunXUvSZ0LtqHRlhe5CbYU5MyCVNfit7hTUFOStBsBEv
         EdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244639; x=1724849439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+J/0R3R6T9fASOvvDH3qcDBGyC/ApTsqMY7x0zjjiM=;
        b=p+xRHMaD8CAlAJs3Y4ozHBcpvap1OtTTW7jDEHMzFPDuedgmZz5n7xBv4tkNjDJKdb
         oeQBFyvXQHYkDK7OCmPH4V/wsAGCl4nX6iNGc6i3YhdgbaD4b6MiYSFPFTwFYNfvlQ7l
         zXoFJf5Ghukah6QGs5ZGZiKfNnEm3GV/s6Hd4gXJDtr0oKq0Suwaze5d+VcPyj2lUQen
         7a8ylwim/sLh/DBTYMvYoMky7S+EyTYfW60BQn1p+8pjND47Y4QZ5vZZhmkPCPxtN695
         DKzdfc9uefrxGLbhmZX2ctI5zwg1jaqMKdWX9jwcnIFCrCWuIaqB3hTPaMWwauWeNH/n
         LrNw==
X-Gm-Message-State: AOJu0Yw+Ox3zn7UXKH25XH5Z4k7xhy83PRO4U+K0s4xMMIZSOZ1swWgD
	6ywEfgqn82W2IvpD3c+hfCy5+qr6JRNm+zNndIEhJ7mjW5vbflM4bNwgOOo2KCiYVB3nHDaD8FO
	L4RM=
X-Google-Smtp-Source: AGHT+IFA7bitJgTwRRJR/OlvTGcO6oSjb1MoQBh5JWi7UkVVCKioowUbMqnWIiVqvEyG0SpmcPRcGw==
X-Received: by 2002:a05:6a21:e91:b0:1c3:ff89:1fc6 with SMTP id adf61e73a8af0-1cad81a7805mr2213549637.53.1724244639074;
        Wed, 21 Aug 2024 05:50:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/18] go: upgrade 1.22.5 -> 1.22.6
Date: Wed, 21 Aug 2024 05:50:14 -0700
Message-Id: <bd62a437ddd8470ff5a3a3d543885908901b7bce.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203591

From: Jose Quaresma <quaresma.jose@gmail.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.5..go1.22.6
cb4eee693c (tag: go1.22.6, origin/release-branch.go1.22) [release-branch.go1.22] go1.22.6
8c8adffd53 [release-branch.go1.22] cmd/compile: add 0-sized-value simplification to copyelim
70a1aae67f [release-branch.go1.22] cmd/trace/v2: make the -pprof actually useful
2c88c1d599 [release-branch.go1.22] cmd/trace/v2: handle the -pprof flag
4c50f9162c [release-branch.go1.22] cmd/internal/cov: close counter data files eagerly
9e148a4150 [release-branch.go1.22] internal/bytealg: extend memchr result correctly on wasm
4b27560db9 [release-branch.go1.22] go/types: fix assertion failure when range over int is not permitted
4e548f2c8e [release-branch.go1.22] cmd/link: don't let dsymutil delete our temp directory
45f9ded1df [release-branch.go1.22] cmd/compile: don't elide zero extension on top of signed values
49906f9575 [release-branch.go1.22] cmd/go: fix build config before creating actions for 'go list -cover'
ea96074191 [release-branch.go1.22] os/exec: only use cachedLookExtensions if Cmd.Path is unmodified

[1] https://github.com/golang/go/compare/go1.22.5...go1.22.6

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit edaedfce685f13decad7608aefa36dece02665b0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.22.5.inc => go-1.22.6.inc}   | 2 +-
 ...o-binary-native_1.22.5.bb => go-binary-native_1.22.6.bb} | 6 +++---
 ...cross-canadian_1.22.5.bb => go-cross-canadian_1.22.6.bb} | 0
 .../go/{go-cross_1.22.5.bb => go-cross_1.22.6.bb}           | 0
 .../go/{go-crosssdk_1.22.5.bb => go-crosssdk_1.22.6.bb}     | 0
 .../go/{go-runtime_1.22.5.bb => go-runtime_1.22.6.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.5.bb => go_1.22.6.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.5.inc => go-1.22.6.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.5.bb => go-binary-native_1.22.6.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.5.bb => go-cross-canadian_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.5.bb => go-cross_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.5.bb => go-crosssdk_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.5.bb => go-runtime_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.5.bb => go_1.22.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.5.inc b/meta/recipes-devtools/go/go-1.22.6.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.5.inc
rename to meta/recipes-devtools/go/go-1.22.6.inc
index 7f7d8377ca..834debaf9b 100644
--- a/meta/recipes-devtools/go/go-1.22.5.inc
+++ b/meta/recipes-devtools/go/go-1.22.6.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "ac9c723f224969aee624bc34fd34c9e13f2a212d75c71c807de644bb46e112f6"
+SRC_URI[main.sha256sum] = "9e48d99d519882579917d8189c17e98c373ce25abaebb98772e2927088992a51"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.5.bb b/meta/recipes-devtools/go/go-binary-native_1.22.6.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.6.bb
index b00857f001..ea4577f20a 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "904b924d435eaea086515bc63235b192ea441bd8c9b198c507e85009e6e4c7f0"
-SRC_URI[go_linux_arm64.sha256sum] = "8d21325bfcf431be3660527c1a39d3d9ad71535fabdf5041c826e44e31642b5a"
-SRC_URI[go_linux_ppc64le.sha256sum] = "5312bb420ac0b59175a58927e70b4660b14ab7319aab54398b6071fabcbfbb09"
+SRC_URI[go_linux_amd64.sha256sum] = "999805bed7d9039ec3da1a53bfbcafc13e367da52aa823cb60b68ba22d44c616"
+SRC_URI[go_linux_arm64.sha256sum] = "c15fa895341b8eaf7f219fada25c36a610eb042985dc1a912410c1c90098eaf2"
+SRC_URI[go_linux_ppc64le.sha256sum] = "9d99fce3f6f72a76630fe91ec0884dfe3db828def4713368424900fa98bb2bd6"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.5.bb b/meta/recipes-devtools/go/go-cross_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.5.bb
rename to meta/recipes-devtools/go/go-cross_1.22.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.5.bb b/meta/recipes-devtools/go/go-runtime_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.6.bb
diff --git a/meta/recipes-devtools/go/go_1.22.5.bb b/meta/recipes-devtools/go/go_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.5.bb
rename to meta/recipes-devtools/go/go_1.22.6.bb
-- 
2.34.1


