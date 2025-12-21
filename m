Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE8DE6749A
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:46 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68637.1766353059004591306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x8qB3HlP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso2790407b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353058; x=1766957858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVv3GxMsMiMtupDBRTtr7cwTD6a/D3jVXMcpCVWeheY=;
        b=x8qB3HlPlbAQmJKZt1zNFSW6RJB2ygRVZJr6EPtomxTf5XJJCJ7Oc6dMVJgeUpeffo
         PztwEjvemkYT3K0Yf57jwBkKRmXVyz9HQx6reEhf8Ypp5blAAyClpl1Gd0i3wwZxiInX
         QWrzoA0PwQpjcTq1qSOjzTbBDwg/ujyfS5EIybZ6Vt0UCcxigIpxtssWQzJ4oVnJUGqL
         0DUS00BXfHUUBoOkdl8DCOH6P4/JIkfNOQGZ+5/VXBKiZWzTkbdbBFN2L+i4anaTvGGM
         aGMvmX4V93gzK4qIQwy4KsqqWzIRMXwocGbLobzTEBAIol1zwe+yBVMz7a/wSvCORfeQ
         TGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353058; x=1766957858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sVv3GxMsMiMtupDBRTtr7cwTD6a/D3jVXMcpCVWeheY=;
        b=m5knkJzpV2rWCyinLC5YeiLHzQ9neOfEUVxA8uRdUnF7DS1JnoCraPtVgdLlaqkEla
         quxC0cwzPgAEjs2Z8GSHCL5MMmLr/lgQ2wenngYXyplK9lT2nnm8zr3LAM96T6H2bd+3
         yDC4eyzCaQNWR2pOOvi5h+NrnBvFUeDWoXUADnhojJaD5Pw87k+j3qLuV2Lkve7N9bRj
         VwIARQRZubdXh0n4cEqLkJ0+6mm7FWdC4nk43/cV5UjVgpduXpCpWW6iQ6zoyo3NUX7h
         5Tn/EzI5vf9T8skv4iswVyA/AFfen0VejMRQY1pT9YT8JLL1M7xNQi+aE3UU4r7co4aT
         NhIA==
X-Gm-Message-State: AOJu0YxuGhv3lOKlBdddmoqLhm5OOVrKsxg/2ApdVX8g+0gxd37+0lZG
	FJ2NyRT8Xb6LRunaPIeYl5cAw87vn3pCgT4FZjzSafC1RcmqAQ6LVzThXda42fGm3kpk8fjuVjz
	EXxZcIBs=
X-Gm-Gg: AY/fxX7k/vtbu2q6ELNEEFFOM1TrcmsfVR474mdni4hhHs8zIDeBs+NCEPd2NIxmeVb
	Cf44g5LfUnkHmvBAl5RPsLAuRAQOKnXWL93TwZB/wbTUXDXl0U0GrWTAS3OiGsv+C+FDoL/po+P
	FlU9Qls2k9jFgA+F5jPal/g3zw0+1rvMvEiL98k9F50PIRCGPd6azrcnlab1mPQ/LaqdWENvGc2
	rdhuyWeNyRLLFFVXF4WMSSVVzAZQdAYDERZSI86VDwmF5M9Xjzr61e075nKs3rFhd1M1LSG/mBA
	00YuqaqalNxG929lEYYqS33LTVf/iR6peU2JZucdBbSSLzcHVAsQ2nza2bSTibTh9q/o+umcGkY
	oktQkf2vi/4hfMxl0EJPNdXK5/QI47aX7TAL+T6aoxRclicWWZqAcGUm60KaVZj80+wJ6+jXfjZ
	vb
X-Google-Smtp-Source: AGHT+IHC1AeGF3HYVoS4wvWukzDBleeaPL4r4zJuDzJW8BgAqwX+WNV43dh9vy8y+O7SUb+tKNe7bw==
X-Received: by 2002:a05:6a00:1c99:b0:7e8:4587:e8be with SMTP id d2e1a72fcca58-7ff66479a60mr7816486b3a.49.1766353058147;
        Sun, 21 Dec 2025 13:37:38 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 10/18] go: upgrade 1.25.4 -> 1.25.5
Date: Sun, 21 Dec 2025 13:37:03 -0800
Message-ID: <f778e44dedd316e391babf9bda09cf0df580953b.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228268

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


