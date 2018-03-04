Return-Path: <matt@madison.systems>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9E30078A86
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:54 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l24so6027938pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WCvnB3ygQzzh761SPqU+MbL4zjDPzbMiB4K1KlTVOYA=;
	b=BS+CPxsjLDVSphSgf03p2MsVT7wMKIPP90Txv3qJrzVSd2uGYxpkGwIzoo8ENmoYqx
	w7tTbqfGkmaFbk1sp4HFdQKlzE3OpvoCan01M/d2AH1zsAz0SWC2SZqz1i2ssaxUX9sb
	2kXIIvgXDpjJ1joekuak62tAAzw6gfyE5K24dSb6nSi8LBe4Xi80bT+64mQHJQ34ya36
	iu1Pz+TlniP0FFNvR/0J7kk4fWvCIzIsUXgOiLTvLCnTaaOrJiyPOurfr+RALg7HeScw
	AkyU1+NWNHLYhjUK/iSg09AMB7srAy2ospcRpi1/5fwbeKSruVzZPJUraYbC26/rorrK
	AZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WCvnB3ygQzzh761SPqU+MbL4zjDPzbMiB4K1KlTVOYA=;
	b=srJDxQSaPi4Vm6A0A7tbSudyafX/t9BHIMm5d0Y7QkJ8hCqw7RhP8rYlziokbeNcPc
	dEP1qmupu7hoXXW3+/2FKeO7oFNXjEr3TRFFbV73Bki7SSql7QSM9K6cpgNT0yu/Adh8
	oDBlA6xyhq8xxVpx3IykQHszfG2F3/APL0zbOBu/kpDAvzi9whiiZ2AK69Nt+u2AE+ub
	pFZ7+FvYPIZrvjBBfoVHIpeFGoXXTISittvN99ZHxHjjnin3NK0V3pb/WS8UhdJGWljX
	RAofOaSwlaBwm1ehCLLLokwGnTjcS4ZWF5at9bDNx+gSvpb+SBSdWmHsxW2Xo/J0DhH1
	6Wvw==
X-Gm-Message-State: APf1xPDbYVPcPohHZlUdR6JtO+WniAquZA1Dvt4UqmnTlTqhsgEmzutg
	esl1VLzK4wDKHZz4RIgyxmcnidOa
X-Google-Smtp-Source: AG47ELsCWClnF+jHHOPkmX/uzDbiPa29mpXYsopGU096R/AUHw0B9/urdCg/Psp1ZR8R5dCkiNxSKA==
X-Received: by 10.99.116.25 with SMTP id p25mr10521092pgc.109.1520197795410;
	Sun, 04 Mar 2018 13:09:55 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:54 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:32 -0800
Message-Id: <20180304210937.29727-9-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 08/13] go: move common settings to go-common.inc
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:54 -0000

Eliminate some redundancy in the recipes by moving
some commonly-used variable settings to the common
include file.  Also removed a duplicate inherit
from go-target.inc that was already in go-common.inc.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-common.inc         | 4 ++++
 meta/recipes-devtools/go/go-cross-canadian.inc | 4 ----
 meta/recipes-devtools/go/go-cross.inc          | 3 ---
 meta/recipes-devtools/go/go-crosssdk.inc       | 4 ----
 meta/recipes-devtools/go/go-native.inc         | 3 ---
 meta/recipes-devtools/go/go-runtime.inc        | 5 +----
 meta/recipes-devtools/go/go-target.inc         | 5 -----
 7 files changed, 5 insertions(+), 23 deletions(-)

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
index 4a43d831fa..e630b83df8 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -10,10 +10,6 @@ export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOROOT_FINAL = "${libdir}/go"
-export CGO_ENABLED = "1"
-export GOCACHE = "off"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
 export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
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
index 35561768df..b76fb0825e 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -10,11 +10,8 @@ SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96
 
 export GOOS = "${BUILD_GOOS}"
 export GOARCH = "${BUILD_GOARCH}"
-export GOTMPDIR ?= "${WORKDIR}/go-tmp"
-GOTMPDIR[vardepvalue] = ""
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
-export CGO_ENABLED = "1"
 GOMAKEARGS ?= "--no-banner"
 
 do_configure() {
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


