Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330A2C433F5
	for <webhook@archiver.kernel.org>; Sat,  1 Jan 2022 11:30:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.24120.1641036607259407405
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UEWZdlrT;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id a9so60075831wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X09jThlCJBJOWIRUzoIyY7Jjs3T/ua7iGBL9rLWIFHk=;
        b=UEWZdlrTpXRfDvWTePjvc/tlfsJi+qJOTveaFluazl+0BoJHzG2oWVG9UcsUAXbNES
         ypXfmWnABM68mdYdcw1Rr4ikb5R63sf1l39c8favI3kI2kqiT8gH1ZGlfZ8/ZC/v4Wks
         hnR71eXSqyR1mvBwhz6kF2xCebvqk04dA9j3kFy/RMAWVaQxT4kodS76ggDTOwcDB6k7
         I0CUWIpJ6VK4VNqnHzpOz7QKEoEg5NusBTOjkHGNsSWv03j5/EtXhCw1og4pi0sIl2JO
         /7iuNmmf2AUfGDCuj2ip3tUDngAvj6be8K1A33Wyp1iKsLcTxvanht9I4QSrzt81S8wt
         JE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X09jThlCJBJOWIRUzoIyY7Jjs3T/ua7iGBL9rLWIFHk=;
        b=FA5tZDKSiANnPKHu2doxpuHBmDZaDkogHn+mFDHqvJ0wTx0Ipeqxk0JXAAm9RmauHH
         nMdh35dCZk/9s40lxrXVaWvjHCSqyQn/f2Q+Gb8QtiG96h3b+3kSB3CRUTklMhdX44pQ
         Gh37UlB6bvPEbqVSNqP4QLAWDx2UuvOi5tbli/Bd1WW8BUWJ3VRASzGmkFAvdWDAM9zF
         i63rNL2TfyAEEjnX9btJn/fzKsvIk4wTY2Y5xd4UzLHEyvT3j+nRUxT6fIJx3AK/o690
         Hk02SfkMurjBZYHFpRTRxOtesDF3PvCOgcgeysblrjE/lduQ4AzUujpX+35JMJK64e55
         DT1A==
X-Gm-Message-State: AOAM531NVoFxnD67blis4Qi7/ZXSu1UjrigGXFrkSq3YMhBwFgEhjn3x
	UXdgYZFp6aCxXzut9DoscizCnG60SyU=
X-Google-Smtp-Source: 
 ABdhPJyiF15TP6MblCBYjbUdXV6M07/3YcPI6oaRWGJhYlUGkKfCxvncJmcYIBjV2ijssWvZykH++g==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr31195284wrz.666.1641036605775;
        Sat, 01 Jan 2022 03:30:05 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j85sm44679935wmj.3.2022.01.01.03.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 03:30:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/6] go: correctly set debug-prefix-map and build directory
Date: Sat,  1 Jan 2022 12:29:56 +0100
Message-Id: <20220101112959.1866747-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220101112959.1866747-1-alex@linutronix.de>
References: <20220101112959.1866747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jan 2022 11:30:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160096

Go has its own system for creating temporary build
sub-directories with randomized names, and setting
up debug-prefix-map on the fly to prevent those
directories leaking into target binaries. OE's own
settings were clashing with it, so this change
carefully avoids the two stepping on each other.

Additionally, the top level build directory cannot
be named 'go-something'.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/go.bbclass                 |  2 +-
 meta/recipes-devtools/go/go-common.inc  |  2 +-
 meta/recipes-devtools/go/go-runtime.inc |  7 ++++++-
 meta/recipes-devtools/go/go-target.inc  | 10 ++++++++++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 5c1fdd7d5f..9c4c92bffd 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -67,7 +67,7 @@ GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
 B = "${WORKDIR}/build"
 export GOPATH = "${B}"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+export GOTMPDIR ?= "${WORKDIR}/build-tmp"
 GOTMPDIR[vardepvalue] = ""
 
 python go_do_unpack() {
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 5bbf35b787..83f8db7b39 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -23,7 +23,7 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
 
 export GOROOT_OVERRIDE = "1"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+export GOTMPDIR ?= "${WORKDIR}/build-tmp"
 GOTMPDIR[vardepvalue] = ""
 export CGO_ENABLED = "1"
 
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 617e6b5414..a08d44dd3a 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -2,10 +2,15 @@ DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
 DEPENDS:class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk"
 PROVIDES = "virtual/${TARGET_PREFIX}go-runtime"
 
+DEBUG_PREFIX_MAP = "\
+                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
+                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+"
+
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_CPPFLAGS = "${CPPFLAGS}"
 export CGO_CXXFLAGS = "${CXXFLAGS}"
-export CGO_LDFLAGS = "${LDFLAGS}"
+export CGO_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${SECURITY_LDFLAGS}"
 export GOCACHE = "${B}/.cache"
 
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 47b4411d54..51f1b79cc3 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -1,6 +1,16 @@
 DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
 DEPENDS:class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk go-native"
 
+DEBUG_PREFIX_MAP = "\
+                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
+                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+"
+
+export CGO_CFLAGS = "${CFLAGS}"
+export CGO_CPPFLAGS = "${CPPFLAGS}"
+export CGO_CXXFLAGS = "${CXXFLAGS}"
+export CGO_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${SECURITY_LDFLAGS}"
+
 export GOCACHE = "${B}/.cache"
 GO_LDFLAGS = ""
 GO_LDFLAGS:class-nativesdk = "-linkmode external"
-- 
2.20.1


