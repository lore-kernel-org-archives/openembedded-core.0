Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1D7D74942
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9476.1766114581791265268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f9HpNmet;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso1345149b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114581; x=1766719381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HA3nWb10qIe01+Agsu2V+GRVWvXBoxhKTwYGqBVIvIA=;
        b=f9HpNmet7rBPg6URE0VxJGNcvDZX0YPE6UYIO/zhwJfWIw2mF+IbK0QNs90bB5bSCw
         Tg83YK4uJU060BTiIY59uMTRI/g+j5VH2MpfN6qC9apJOUkafHQy19/AtpyPKhkg5eFQ
         S+kFJmBRg90A8vcdz34y8l7qQavw9KapTGSky/t8yrGTrvWiT18jCgtZn98lJ7bK4oe0
         NEf19csWTx497n2nAO0rXtvRBPiTb1zoXYyMG0Dn+JZsayN0WECMVWCt5W9FTMA731ph
         +BDyK585hbaJ3sRdJVS8edz5EvFD3vxBDRXdsiFyo4IQ8WI/+xXGDO4AnTrh2uR15Qr6
         ZCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114581; x=1766719381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HA3nWb10qIe01+Agsu2V+GRVWvXBoxhKTwYGqBVIvIA=;
        b=qdfSrhHX/+Utu4Qam9G+Hu4ZbFgfjtw5ivcnCcTs2yErix0FkYjjvqp2SZH4jCY68D
         dXko6GQs97dz3PjpKBtsEhDIuTeXpAt2Rgl4U1yP7lBF6dtfFXNj+vXGw4G+D1TVVsuq
         wCu3lLa2iSTPLBOC331Oc+C4Bo7Nj6NkizLCfUXvvg8PtHAFl4nJYmFW6su58CtLBcGo
         riJwoRjU+nmpkJ/yATTEZQIcelzhwaNmJxcFKVynnKQaIxChnnZr8E0rESB+1YxqsX1b
         DIMiUUNt3fwU2mfGLX+LJTQvdYy/Xng7I+Eci/ZgnQtWt3hCbY3+ajaLvNc+d/fUa0EH
         kAlQ==
X-Gm-Message-State: AOJu0Ywwk32jQfmp26GQoYEQ9ETm53pSe9zAM4owoAZdaadLtWcdUyrd
	qDXXapJ5B/FY4ma0TISLMwcSv5QA3lBm2IwRcPfM9S7CNZ7+b3Ou/egcx82XGw==
X-Gm-Gg: AY/fxX5cSZLlcDJNGWNy2lJYAz95aWhtQwotB97cbZCKvCUwEN6gUGQzRkQx3yiw9Lx
	fLGpXgVRM+R6lBOh0p/0h+qqnR7ezjloVrWVoCGB/E084yBzcU+FXzVRa7sUimi2vMwXkoP0bTz
	WY2XgfoJiqB2pMJKjQswDxsjvKgC31A9spAgHKFdMxlRLmN3J+eg4DBREem4JZrpOYeIIhzB88l
	6USUl7Gi0M+/LFoVbt9mkChNN3FUPhH+HHaEbHKQTU2h8ZBPbAljA/TBSjEyFcXFJeDZtHpc3/F
	J85dVzcpveE4BnxRNwS/V005C4LySFkNVohbyThElemmWZ0e/1mO1FS1Rn6q4XSfRf5zPe0WHDx
	6gv+yYpmXBsvTIVQCWZxK4l3smfS1lWYP/BDFn5T+yQ84GjPD9/UFrrX4EPxi75WvKp5zcDN/Eb
	rYV5K9naHBrvXeVSwbtDwXIrb2
X-Google-Smtp-Source: AGHT+IGYqvXafiYX422UM1q80VC8AmwnAo/6UrqTIt06oJtKKix/Y2TeX6Jc62E2ujIAeleoOxMJzg==
X-Received: by 2002:a05:6a00:a90e:b0:7e8:450c:61cd with SMTP id d2e1a72fcca58-7ff66c65757mr1176536b3a.61.1766114580908;
        Thu, 18 Dec 2025 19:23:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 17/29] go: upgrade 1.25.4 -> 1.25.5
Date: Fri, 19 Dec 2025 08:51:56 +0530
Message-ID: <20251219032209.960840-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228185

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

