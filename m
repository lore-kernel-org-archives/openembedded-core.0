Return-Path: <matt@madison.systems>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id DBAD3788C0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:14 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id q27so2965657pgn.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UB8LSnPQ1GSQHlDJaddN0SsuDrWLTHyYTYALqbWNG2Y=;
	b=JfC9XV9a5eMpUYQC8lnroT0KSrxoJjKxTh5TvSDXlQL9UOqUxSRYC265CiT3smvNhI
	eMnx7m16B8VlID1i11pIrs7tFkigTZislXxxkmRzaEJF4exFSukULeLIrv3FB8/xAyCs
	0trdIxHV3ObpnHxec1IyYgaEIWX0FjdG0aMidBDQ1lSKm5N1aeDJyDv7OX+Ncq/EerC0
	1gE+W8ghwivw3Y8XIKdPjKNDct9a6Ysq0wBNX3cu2ZXY25c4JFM2jkYVZojJFHwNEjxc
	CQJOpM6I2TycD4rHleBw7DMneQFZjhjKfbVUfPabpFj3J64m4LiFyP+iO+v/chhcRsOG
	wVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UB8LSnPQ1GSQHlDJaddN0SsuDrWLTHyYTYALqbWNG2Y=;
	b=eQrDANjJvLzN9b7yS7+RVeO7yilPnB/FcAI3UdaL3qZv4ORQCmBfIxvkopCRDICVF9
	q65NHYbpi6X/Lun5I+9sx46EUkn5zIk+LGQ7iXn9nBqhOzyH0Hlna1UPq6r2k0B/8cln
	eBYI875wDukM06NncFYAQ9uuwVl3XioPrlhyt702U9vVwz/Bwa1ZfwOxZUhMi0C0r5bZ
	LhI908XQ50Wz5SFUtqigljQLFv1MHTizNLYTFfo8Hf1ft1XwrxP85Er41VR8HDCIjHHl
	VZICix9dqVI/tY6bs4HdxVBDE3ncgjg0/Vn/qq0Ut0Xj+WMd+1cxEU0IAIuVaUAkr8HW
	Wqig==
X-Gm-Message-State: APf1xPCarB68HDLtgrkyHooZG1NnCQYRLcQpXysNhO8qzvhUZN4tVHu/
	k6SmfBB1sA9uxKBILUyto2xSdkaB
X-Google-Smtp-Source: AG47ELvtrNB2ylasho2ZcVMjVH6KaM5COpLYjVVl953oGR3hVlflGkhubRah5wT/hsRH9DqglmTtog==
X-Received: by 10.99.120.193 with SMTP id t184mr2958706pgc.348.1519946235697; 
	Thu, 01 Mar 2018 15:17:15 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:14 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:49 -0800
Message-Id: <20180301231654.24018-9-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 08/13] go: move common settings to go-common.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 23:17:15 -0000

Eliminate some redundancy in the recipes by moving
some commonly-used variable settings to the common
include file.  Also removed a duplicate inherit
from go-target.inc that was already in go-common.inc.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-common.inc         | 4 ++++
 meta/recipes-devtools/go/go-cross-canadian.inc | 5 -----
 meta/recipes-devtools/go/go-cross.inc          | 3 ---
 meta/recipes-devtools/go/go-crosssdk.inc       | 4 ----
 meta/recipes-devtools/go/go-native.inc         | 4 ----
 meta/recipes-devtools/go/go-runtime.inc        | 5 +----
 meta/recipes-devtools/go/go-target.inc         | 5 -----
 7 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 611775b2cc..11d55c4d36 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -23,6 +23,10 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
 
 export GOROOT_OVERRIDE = "1"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
+export GOCACHE = "off"
+export CGO_ENABLED = "1"
 
 do_compile_prepend() {
 	BUILD_CC=${BUILD_CC}
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 3b98ea449f..7a39e4509b 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -10,11 +10,6 @@ export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOROOT_FINAL = "${libdir}/go"
-export CGO_ENABLED = "1"
-export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
-#CC = "${HOST_PREFIX}gcc"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
 export GO_LDFLAGS = '-v -linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 289ae77104..44f230b8bc 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -15,9 +15,6 @@ export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
-export CGO_ENABLED = "1"
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
 do_configure[noexec] = "1"
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 05ca62eba8..4391b32424 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -10,10 +10,6 @@ export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
-export CGO_ENABLED = "1"
-export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
 
 do_configure[noexec] = "1"
 
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 31e899da82..5fbb72b087 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -10,12 +10,8 @@ SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96
 
 export GOOS = "${BUILD_GOOS}"
 export GOARCH = "${BUILD_GOARCH}"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
-export CGO_ENABLED = "1"
-
 do_configure() {
 	cd ${WORKDIR}/go1.4/go/src
 	CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 0fe4566360..a79295df47 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -11,14 +11,11 @@ export GO386 = "${TARGET_GO386}"
 export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
-export CGO_ENABLED = "1"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_CPPFLAGS = "${CPPFLAGS}"
 export CGO_CXXFLAGS = "${CXXFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
-export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
+
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
 GO_LINKMODE ?= ""
 GO_LINKMODE_class-nativesdk = "--linkmode=external"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 141a456cca..3bc32f3bec 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -1,4 +1,3 @@
-inherit goarch
 DEPENDS = "virtual/${TARGET_PREFIX}go go-native"
 DEPENDS_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk go-native"
 
@@ -11,10 +10,6 @@ export GO386 = "${TARGET_GO386}"
 export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
-export CGO_ENABLED = "1"
-export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
 GO_LDFLAGS = ""
 GO_LDFLAGS_class-nativesdk = "-linkmode external"
 export GO_LDFLAGS
-- 
2.14.1


