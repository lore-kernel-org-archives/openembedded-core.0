Return-Path: <matt@madison.systems>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13611789FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:33:43 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 61-v6so6337746plf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 12:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UB8LSnPQ1GSQHlDJaddN0SsuDrWLTHyYTYALqbWNG2Y=;
	b=eUrn7yl/uSiC3Wordz18XpgN4oheTG31zNCJTMaNC1Elf+tjyUAIWgYuoKuN85WFhc
	eQEG79rK5o2Bf6qmwOtAnSOW4HQX3Okho4kCnmiNJ1am6ghBxyI1dXzz14EvJfXBMyC6
	rlaQSNukst2UzO22Y9ppeKuem1tcshn6BGhsOm4g/0h7YI3xgvY/AqGA5GPj+U7T4TYf
	IXZTdOiYOgxGTCgMViOYrS8xPCKKy+vAVY4X2wEHHgzm7Tk6uScYkTR8XDxUrDHeCYOZ
	/ADyFdW1NiZPKoRWtXeZcXMSnC9BZTyC/nC9h0+VOzsn1qa8LuuuY2oKkbekDKsKDqxD
	beLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UB8LSnPQ1GSQHlDJaddN0SsuDrWLTHyYTYALqbWNG2Y=;
	b=R/PdaU3ssRDx70PgWP9TQuHS86lm1xGd6Vdz/secYaI+3aFVncuVOrXpVaI2RN+ssS
	vfCsQZi/KGnRDbzjekab/xh+kmZMz7L4d5ynZER26/LSsUr2P5ZrrbB8pu8oWZfKQ23V
	boywaRHwL6BI85nF478NXfjWYtz8nW2dMVEd3tG//2eZSvE0ZZQFSMD+ru3iqtVlUdjp
	V3XSGfi2/ziHnCZq7K/Df88KfxwBA32o151GJ1xf6boeOPODle9DH9RaiMUI8vqnPLI3
	7RgfvTTDFKFnm6ibTnzzYcl53fZbWpGDjPt7k+8ZAhwgTMeFri+JIS1SlIzae2SVN2p8
	EOiA==
X-Gm-Message-State: APf1xPD7sjC2B432vdDHOYBS7vo9rcu7xQd2cwYowQNKGIGCNGvX4LG3
	Df/p2VXxdS1g5j51+pnx+7E+ZuJM
X-Google-Smtp-Source: AG47ELuETAFuI5UX/t//DtwXmFLm27uAPryTzK6FshtKw771AxLN5IFTgsOi3Z+HEiEJQ/xdavSrUg==
X-Received: by 2002:a17:902:b210:: with SMTP id
	t16-v6mr6291586plr.373.1520022824182; 
	Fri, 02 Mar 2018 12:33:44 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	m12sm11193338pgr.35.2018.03.02.12.33.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 12:33:43 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:33:09 -0800
Message-Id: <20180302203314.32737-9-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
Subject: [PATCH v4 08/13] go: move common settings to go-common.inc
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
X-List-Received-Date: Fri, 02 Mar 2018 20:33:43 -0000

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


