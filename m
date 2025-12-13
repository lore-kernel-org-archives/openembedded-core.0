Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9BAD5AE7E
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:19 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3017.1765620131292219837
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YkrwLj1x;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297d4ac44fbso9953375ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620130; x=1766224930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HA3nWb10qIe01+Agsu2V+GRVWvXBoxhKTwYGqBVIvIA=;
        b=YkrwLj1xHZHoITDxdUh4MdL/C5ZjpfOO4G0Op576gAbC5G21KyWQpbhiKQApmly387
         vX1gzD8YjIuGfvQ06n3fhK3X3hZifJ447ivGK8NqyABEDaVcoEiMwlcDx30kFk7TIsgl
         euA9rnyiq5luUelSXzsqfOxYGCG19FObMCMorWrO+wrKoGpJar7WKlZOC+xc40AfhXyN
         BNGwvQwsS7N1f+N0APuUf0gh1pql0dwLnaQVyzf+/wzwwik4V5OtuGkqLfpKt5QSMEVJ
         8lWsqvMReWTSFxvhyL+rI2631MVArDpgO/Q/TsSN9W/3OcSSL4TXg+2JdBgVU8Mns7jM
         8upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620130; x=1766224930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HA3nWb10qIe01+Agsu2V+GRVWvXBoxhKTwYGqBVIvIA=;
        b=utcJogXY+CTNv2Xqw/sbymMIieg9SEIitatWdYGjelqlUdQgUiNAZXMvANsSSOOjBo
         G0CylKi7iJOaC1yVE0S/CSCIxbAXtblzU7lCfPOxKLcTWO3ee+HPyy5RH2dB3HjELsXy
         GWvZQZQwiPXIXYaOMMIjTa9viZUGsdlqKy2UrGt7XikQ0SlKoOrWe9UYdX4Lhk5R8ran
         ZcCNBIkHtVUgbrsmdFBmPGoWbyttmnkQ7wby3OhPUP4uZOunGo1+I06T6xd9fNUEspkZ
         Py6Elnz9RuPjU9tTKGW42qXKEx1LUQNNrOPh2b9qZ2FECWmj5WgHjujN4jq7KJYNN+p8
         NR4A==
X-Gm-Message-State: AOJu0YzR23FiwrRC5Av+jfs/j5Qlvd4Jqjc9Nyvg+2I2J7L3HSWKNZ7P
	DEoN+1Dx07AwtTCEhVFgs8LX5EsVe1nbQxPHeuOXiQM6isMh2016qXoKvOhWSdvS
X-Gm-Gg: AY/fxX4KzL85T9auFjAxKjlHoYxbVHwwFXJjkciCoTkNvqlu76zSRMoTlVs7/UoxdXS
	/9/3DXCYsJe84pRQe6aZ9K9ukjOZ2A5gfBS411l/rf0wGtpViN5JfcRko6P3lSqVQDkj29bIsPE
	xdHLzFvKoJQ4uQUZwejFIdH99DrwNuuH1cmnkClPdUFDJyUeJPLFBg1rj745WCi84kSq6zg7u/Q
	ZuRAcn1xnq0hBXMsCT3KmE3HinlQ9WDNdTYRpJce0s17JikO1rGs6UY9CUpiboNZkmici4VTw/p
	L0YLasFTC1E6Ln1fMUVD1AqWE9xszucYhYGGdza+EKONA7ECv0D/fxGlrgFIITZL5cUFws08/wC
	HKJxRGmNDoOBO2EqJCLECu4+HhnjV9LzSkurvtRwWqLBaIUIhT7yW5zeQlIq1RgcVWo7npF2IeO
	apBKRMQ7J0baM1BzEKq9C9Py0S
X-Google-Smtp-Source: AGHT+IGI+hAIw4C7zPM9LhZd0vKxcCvw5YVvLbg/gND1l25ABUBN3yMI1Mi1C9OCUnuxSTxIWNuaiQ==
X-Received: by 2002:a17:903:32c1:b0:29d:67f8:38b5 with SMTP id d9443c01a7336-29eee9f2bf1mr86550055ad.3.1765620130458;
        Sat, 13 Dec 2025 02:02:10 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 54/67] go: upgrade 1.25.4 -> 1.25.5
Date: Sat, 13 Dec 2025 15:29:18 +0530
Message-ID: <20251213095931.2571498-54-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227672

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.4..go1.25.5
fefb02adf4 (tag: go1.25.5) [release-branch.go1.25] go1.25.5
f7bce4bd6f [release-branch.go1.25] crypto/x509: prevent HostnameError.Error() from consuming excessive resource
287017aceb [release-branch.go1.25] crypto/x509: excluded subdomain constraints preclude wildcard SANs
e1ce1bfa7f [release-branch.go1.25] mime: parse media types that contain braces
433c01e94e [release-branch.go1.25] internal/syscall/windows: fix ReOpenFile sentinel error value

Fixes CVE-2025-61729 and CVE-2025-61727.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.25.4...go1.25.5
[2] https://groups.google.com/g/golang-announce/c/8FJoBkPddm4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91c007b0f5fff728cc7803a56a4df8438f20bdea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-devtools/go/{go-1.25.4.inc => go-1.25.5.inc}   | 2 +-
 ...o-binary-native_1.25.4.bb => go-binary-native_1.25.5.bb} | 6 +++---
 ...cross-canadian_1.25.4.bb => go-cross-canadian_1.25.5.bb} | 0
 .../go/{go-cross_1.25.4.bb => go-cross_1.25.5.bb}           | 0
 .../go/{go-crosssdk_1.25.4.bb => go-crosssdk_1.25.5.bb}     | 0
 .../go/{go-runtime_1.25.4.bb => go-runtime_1.25.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.25.4.bb => go_1.25.5.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.4.inc => go-1.25.5.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.4.bb => go-binary-native_1.25.5.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.4.bb => go-cross-canadian_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.4.bb => go-cross_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.4.bb => go-crosssdk_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.4.bb => go-runtime_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.4.bb => go_1.25.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.4.inc b/meta/recipes-devtools/go/go-1.25.5.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.4.inc
rename to meta/recipes-devtools/go/go-1.25.5.inc
index f88d7feef1..47d5c3912c 100644
--- a/meta/recipes-devtools/go/go-1.25.4.inc
+++ b/meta/recipes-devtools/go/go-1.25.5.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "160043b7f17b6d60b50369436917fda8d5034640ba39ae2431c6b95a889cc98c"
+SRC_URI[main.sha256sum] = "22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.4.bb b/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.5.bb
index 921005c21b..5ecbca6d17 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "9fa5ffeda4170de60f67f3aa0f824e426421ba724c21e133c1e35d6159ca1bec"
-SRC_URI[go_linux_arm64.sha256sum] = "a68e86d4b72c2c2fecf7dfed667680b6c2a071221bbdb6913cf83ce3f80d9ff0"
-SRC_URI[go_linux_ppc64le.sha256sum] = "38c8ac8463537c99fbc1ef368f243b626144446c09db71b1d20634a4237c966d"
+SRC_URI[go_linux_amd64.sha256sum] = "9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b"
+SRC_URI[go_linux_arm64.sha256sum] = "b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9"
+SRC_URI[go_linux_ppc64le.sha256sum] = "f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.4.bb b/meta/recipes-devtools/go/go-cross_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.4.bb
rename to meta/recipes-devtools/go/go-cross_1.25.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.4.bb b/meta/recipes-devtools/go/go-runtime_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.5.bb
diff --git a/meta/recipes-devtools/go/go_1.25.4.bb b/meta/recipes-devtools/go/go_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.4.bb
rename to meta/recipes-devtools/go/go_1.25.5.bb

