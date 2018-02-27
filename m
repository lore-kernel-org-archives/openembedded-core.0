Return-Path: <matt@madison.systems>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A693571C70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:37:05 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l4so7448892pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Xq+ceNtQ5VVjo0kI54JTEDhG5Vl0FuX4yIhcbVxZLdg=;
	b=gvypMJ+yREXfVoveGJA2G1Sd/lsAKsw0qZ/93q34wBLshX77JG+q8IHENusvAzW5id
	m374IC7lLtnCJR1ygN60ags3ZJoPPgKGi9B9Lhui07j2O7bnuVFWV9JVd8CCuj3rWpjQ
	XofTg9bSoq37LAdoRvdc/nuQbzJ7+F5TBpY+AbmRpPZdl4mNaUJCA/9RhU7YNWwOzMHD
	KKMZO6XcXeK3Lt4SUlGAtsjw9iZnFUQuD4qMbNvRdnn+H6Ie/Rjb18lPccO7m2ad1Euy
	62Y1ycE+9ePMog6RmQLwCmKb4z45ozPFG+HnoSDxHb0oTry+8RMKw3W0M2PSD6+eZHy+
	O9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xq+ceNtQ5VVjo0kI54JTEDhG5Vl0FuX4yIhcbVxZLdg=;
	b=HbthpVAe9vIuv2A4xOsrgb1ADZvnQ14HdZ5AnNE9qVfGnEe1VaptXQEv9p+TuXeobe
	xyfJtuZvvowRLcbYcgercXj6+TqQdysQ56TlH8mwplRZxrHlPdHxCVUw3pBB2W0dq7UC
	Hyq2anS6brs93QJbKzjQqXhOYV/XvbWSTeqT+VhJXPF2jKk9HJy8H3u6MBeG94fO79I7
	HNYHvYPvE8ZFxduAqeVCrzS2wTJTmpykb+g+thp4aPHwHE0Wq6Zv1xBCmzKMDNBGq1t/
	bQvV1OxF0TukRIkygBuubyc4NMLmUJQ0n2hWbizO1BuVKs0VC6yX5dw/AqXa/ZW/Q6Yh
	sOxA==
X-Gm-Message-State: APf1xPDJEnwzFrznthmpDi/jF6zLRZQw6FfAG+fA1ao8XCuzaH2dLtuy
	1F2IQa92RqEt7PM0O4hkQnTHxbcc
X-Google-Smtp-Source: AH8x225M7Eq06EwD+viL094FyLZWlRpqmyknAzMO3DYVkl1NzBb44NWNBojvUheB9AKKqzMUSvyF6A==
X-Received: by 10.98.71.217 with SMTP id p86mr13909051pfi.81.1519735026276;
	Tue, 27 Feb 2018 04:37:06 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	o82sm1596760pfj.163.2018.02.27.04.37.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 04:37:05 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 04:36:34 -0800
Message-Id: <20180227123634.2812-9-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180227123634.2812-1-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
Subject: [PATCH v2 8/8] go: move common settings to go-common.inc
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
X-List-Received-Date: Tue, 27 Feb 2018 12:37:06 -0000

Eliminate some redundancy in the recipes by moving
some commonly-used variable settings to the common
include file.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-common.inc         | 4 ++++
 meta/recipes-devtools/go/go-cross-canadian.inc | 5 -----
 meta/recipes-devtools/go/go-cross.inc          | 3 ---
 meta/recipes-devtools/go/go-crosssdk.inc       | 4 ----
 meta/recipes-devtools/go/go-native.inc         | 4 ----
 meta/recipes-devtools/go/go-runtime.inc        | 5 +----
 meta/recipes-devtools/go/go-target.inc         | 4 ----
 7 files changed, 5 insertions(+), 24 deletions(-)

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
index 141a456cca..aa15079537 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -11,10 +11,6 @@ export GO386 = "${TARGET_GO386}"
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


