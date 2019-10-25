Return-Path: <>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id C7E0B7FB89
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 19:19:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id v3so4932709wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ObCf2Nl0E2nJr+RaxJFDlN9P4sLdYzrntJQOo5z+arY=;
	b=QvUBFzrv8rmSI3kG1ZH8JXOyFN2VtqPwoQPIAjkHk6eTAOyVlxHdEMpgE7eDjh/q5Y
	3NmocvP93PW6E5pnP8vii+nsA3D0YmRiGvc5L8u0/fifttmFD8fZHPeIDyOHsCcLrWlr
	uUfhgLa/Y8zHbomTdY23QqukTbKbrdP0ES0gGsIXjWSenZ9hRUHTH4k8pwGXrCoTSJe3
	dnvyNurDV/HepIE7Lyva79NT48wxY3SrlDMgfjDLdxLgkRpeQrxen+Ovpv0AVAWI7MqZ
	kcQ6Y0dtAd2FJOhPoA1gXbW7wklsfCtvmKsOKHeS9lNZ9zDiZYGPkFG/OvAAeDiGwHnR
	s87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ObCf2Nl0E2nJr+RaxJFDlN9P4sLdYzrntJQOo5z+arY=;
	b=uao5Cn4RaYL2lrdz4O4JHESEJ/O8ct/KkUcLADPbITn/kO+56f0MHisjZgYOG/Ryj6
	27RE8sNW8jA2UnubDFIeI3cGW0brjKSxKh8Db5WLHlc/KNOsN0sDCX1Zvee8YauibmNU
	xOPE/Wn33fGkilE/covI0BQDDQoRppdDd6FNCO8PyFKtIdpn4igHzWFXgvgQt/T/wmrc
	74lukb7ILx1gLzLCNfq5NbDqZ8Dr0KitdpiOMPjm2Uty6h1VoplRPZa2fToZ9BlNFXop
	ut/CLbqb9BFh5OTb7GcPQXpRh93iJeGkdKRzUWdemhIWeo8rEPH/18C7UizyibOrbXan
	s0ig==
X-Gm-Message-State: APjAAAWLTq4Hrth43JcRd4Xu2/R17xau8HG48Du6Kxf7hRxWlbkCskNL
	wozC1BvPnyzqpcNKPi1b1axrHNvM
X-Google-Smtp-Source: APXvYqxxe3KIQJxM10GMLus83ydFvE//Ym+VDGrR+0Tnfp5w97prDnnh7vmOymdsetDDXsxWabQLPA==
X-Received: by 2002:a7b:c186:: with SMTP id y6mr5143267wmi.67.1572031177184;
	Fri, 25 Oct 2019 12:19:37 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id l5sm2388137wmj.44.2019.10.25.12.19.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 12:19:36 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:15 +0430
Message-Id: <20191025191915.80874-5-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191025191915.80874-1-alexander.j.kube@gmail.com>
References: <20191025191915.80874-1-alexander.j.kube@gmail.com>
Subject: [PATCH v5 5/5] go: Extract common environment setup.
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
X-List-Received-Date: Fri, 25 Oct 2019 19:19:37 -0000

From: Alex Kube <alexander.j.kube@gmail.com>

Add default values for go environment variables to go-common.inc.
Override where appropriate in other go*.inc files, and use
host/target tuples from goarch for setting CC flags.

Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
---
 meta/recipes-devtools/go/go-common.inc         | 10 ++++++++++
 meta/recipes-devtools/go/go-cross-canadian.inc |  8 ++------
 meta/recipes-devtools/go/go-cross.inc          | 13 ++-----------
 meta/recipes-devtools/go/go-crosssdk.inc       | 11 ++---------
 meta/recipes-devtools/go/go-runtime.inc        | 15 +++------------
 meta/recipes-devtools/go/go-target.inc         |  9 ---------
 6 files changed, 19 insertions(+), 47 deletions(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 93a3d3b5fb..f18d928c70 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -27,6 +27,16 @@ export GOTMPDIR ?= "${WORKDIR}/go-tmp"
 GOTMPDIR[vardepvalue] = ""
 export CGO_ENABLED = "1"
 
+export GOHOSTOS ?= "${BUILD_GOOS}"
+export GOHOSTARCH ?= "${BUILD_GOARCH}"
+export GOROOT_BOOTSTRAP ?= "${STAGING_LIBDIR_NATIVE}/go"
+export GOOS ?= "${TARGET_GOOS}"
+export GOARCH ?= "${TARGET_GOARCH}"
+export GOARM ?= "${TARGET_GOARM}"
+export GO386 ?= "${TARGET_GO386}"
+export GOMIPS ?= "${TARGET_GOMIPS}"
+export GOROOT_FINAL ?= "${libdir}/go"
+
 do_compile_prepend() {
 	BUILD_CC=${BUILD_CC}
 }
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 945d0f9d10..d49250a8e2 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -13,11 +13,7 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                     "
 
-export GOHOSTOS = "${BUILD_GOOS}"
-export GOHOSTARCH = "${BUILD_GOARCH}"
-export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
-export GOROOT_FINAL = "${libdir}/go"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
 export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'
@@ -25,8 +21,8 @@ export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--
 do_configure[noexec] = "1"
 
 do_compile() {
-	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
-	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
+	export CC_FOR_${HOST_GOTUPLE}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
+	export CXX_FOR_${HOST_GOTUPLE}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
 	cd src
 	./make.bash --host-only --no-banner
 	cd ${B}
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 3d344a74d3..3d5803bf07 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -5,23 +5,14 @@ DEPENDS = "go-native"
 
 PN = "go-cross-${TUNE_PKGARCH}"
 
-export GOHOSTOS = "${BUILD_GOOS}"
-export GOHOSTARCH = "${BUILD_GOARCH}"
-export GOOS = "${TARGET_GOOS}"
-export GOARCH = "${TARGET_GOARCH}"
-export GOARM = "${TARGET_GOARM}"
-export GO386 = "${TARGET_GO386}"
-export GOMIPS = "${TARGET_GOMIPS}"
-export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
-export GOROOT_FINAL = "${libdir}/go"
 export GOCACHE = "${B}/.cache"
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
 do_configure[noexec] = "1"
 
 do_compile() {
-	export CC_FOR_${GOOS}_${GOARCH}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-	export CXX_FOR_${GOOS}_${GOARCh}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+	export CC_FOR_${TARGET_GOTUPLE}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+	export CXX_FOR_${TARGET_GOTUPLE}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
 	cd src
 	./make.bash --host-only --no-banner
 	cd ${B}
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 94f6fb8eb7..f0bec79719 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -4,18 +4,11 @@ DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TA
 PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
 
-export GOHOSTOS = "${BUILD_GOOS}"
-export GOHOSTARCH = "${BUILD_GOARCH}"
-export GOOS = "${TARGET_GOOS}"
-export GOARCH = "${TARGET_GOARCH}"
-export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
-export GOROOT_FINAL = "${libdir}/go"
-
 do_configure[noexec] = "1"
 
 do_compile() {
-	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
-	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
+	export CC_FOR_${TARGET_GOTUPLE}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
+	export CXX_FOR_${TARGET_GOTUPLE}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
 	cd src
 	./make.bash --host-only --no-banner
 	cd ${B}
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 9731e164e9..21179a83a0 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -2,15 +2,6 @@ DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
 DEPENDS_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk"
 PROVIDES = "virtual/${TARGET_PREFIX}go-runtime"
 
-export GOHOSTOS = "${BUILD_GOOS}"
-export GOHOSTARCH = "${BUILD_GOARCH}"
-export GOOS = "${TARGET_GOOS}"
-export GOARCH = "${TARGET_GOARCH}"
-export GOARM = "${TARGET_GOARM}"
-export GO386 = "${TARGET_GO386}"
-export GOMIPS = "${TARGET_GOMIPS}"
-export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
-export GOROOT_FINAL = "${libdir}/go"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_CPPFLAGS = "${CPPFLAGS}"
 export CGO_CXXFLAGS = "${CXXFLAGS}"
@@ -29,14 +20,14 @@ do_configure_libc-musl() {
 }
 
 do_compile() {
-	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CC}"
-	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CXX}"
+	export CC_FOR_${TARGET_GOTUPLE}="${CC}"
+	export CXX_FOR_${TARGET_GOTUPLE}="${CXX}"
 
 	cd src
 	./make.bash --target-only --no-banner std
 	if [ -n "${GO_DYNLINK}" ]; then
 		export GOTOOLDIR="${B}/pkg/tool/native_native"
-		CC="$CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}" GOARCH="${TARGET_GOARCH}" GOOS="${TARGET_GOOS}" GOROOT=${B} \
+		CC="$CC_FOR_${TARGET_GOTUPLE}" GOARCH="${TARGET_GOARCH}" GOOS="${TARGET_GOOS}" GOROOT=${B} \
 			$GOTOOLDIR/go_bootstrap install -linkshared -buildmode=shared ${GO_SHLIB_LDFLAGS} std
 	fi
 	cd ${B}
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 91efd3e977..316bf6f038 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -1,15 +1,6 @@
 DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
 DEPENDS_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk go-native"
 
-export GOHOSTOS = "${BUILD_GOOS}"
-export GOHOSTARCH = "${BUILD_GOARCH}"
-export GOOS = "${TARGET_GOOS}"
-export GOARCH = "${TARGET_GOARCH}"
-export GOARM = "${TARGET_GOARM}"
-export GO386 = "${TARGET_GO386}"
-export GOMIPS = "${TARGET_GOMIPS}"
-export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
-export GOROOT_FINAL = "${libdir}/go"
 export GOCACHE = "${B}/.cache"
 GO_LDFLAGS = ""
 GO_LDFLAGS_class-nativesdk = "-linkmode external"
-- 
2.17.1 (Apple Git-112)


