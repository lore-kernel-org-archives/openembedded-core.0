Return-Path: <matt@madison.systems>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 152FB78AB4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:57 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j2so4204973pff.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dUElBFWxQIUGJls5l0XaQUUuuUqguBsxVkLCGTwD/pw=;
	b=Yb/sT8wiwTzU0ZB7VLxEL8F96bNWrQj3zQHxyz3SbqzZC9jfe1w4GE3Kml2Cc6IbRI
	438HcZc2dfU1M2MGycZ0vznBDZxgejAxwrmZ4mojMJQ/Ylg9Yb6971Ua0KIRZPCojCuP
	j5PQ8gcGN+2RedH6VvbedsnnFLyc3cxixQAD9oeqccx48pzOvNOqNRtJFsXhKYtH/Qxn
	HVbXObN1nJv8oerziW4hgrTRDpi9AW5mXe0oLva0o0mRJdKsfogIZGNdy3el/ljGVWxI
	jy+o7TZE+SWzO8iDL7lLjawitQTkBHMmIeYx0mncrUAXL9RXF7lPXJj0JuwQrrIcBsFW
	1l7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dUElBFWxQIUGJls5l0XaQUUuuUqguBsxVkLCGTwD/pw=;
	b=U9ahfnhD5HUCZUYaVQewO4Ap9FyfAmcWaKI9bNLws7cG2vdnPcn1LJMPSzQRARx9+n
	NrPhXJy10gP3pzQ42WnXwlmxa4Ngdc00s2fVNRgvCwZFv/vay5mnmfomRFuycxtM2Lwq
	rIDw/I2PhgnIROghBxOX/NIJHHvnDiKmWEzOXs/o7ELbh0gTal13JzCVusfuhslxsUmn
	2DGmb6e/413C0JXBeXW8XuYt+tZBIV4o2qWGTcSW9C/iBHyI669cFrEOWbtBcWfY5aoC
	1EQ2ZHekhJ9/OmeMnRt4UlNSZ4IiQPHwDc0nNcr7cUGNgD8yuOH638YkiAOu7JWGHOFa
	nqRw==
X-Gm-Message-State: AElRT7H8mFCRO5HrJ2vi6UQDeCxxMgrnRYfIaGgZu8p/Wxl0Ck4MfCz7
	oigoxqe6cdrhAR71gJWlywRPorSo
X-Google-Smtp-Source: AG47ELvNpwC6FGfqxa3ZvaLMdtwrT55WDPoukQBYv3Mewfyjp839MBl8RSh2cFwCaXzHmLdnTKZD6A==
X-Received: by 10.99.37.7 with SMTP id l7mr5596384pgl.212.1520197798971;
	Sun, 04 Mar 2018 13:09:58 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:57 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:34 -0800
Message-Id: <20180304210937.29727-11-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 10/13] go: disable PIE CFLAGS for nativesdk and cross-canadian builds
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:58 -0000

The statically-linked Go code in the toolchain is not compatible
with PIE, so disable its use in the C compiler during the
toolchain build.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-cross-canadian.inc    | 6 +++---
 meta/recipes-devtools/go/go-cross-canadian_1.9.bb | 4 ++--
 meta/recipes-devtools/go/go-target.inc            | 3 +--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index e630b83df8..ea68b8875d 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -12,13 +12,13 @@ export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/$
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
-export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
+export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'
 
 do_configure[noexec] = "1"
 
 do_compile() {
-	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
-	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
+	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
+	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
 	cd src
 	./make.bash --host-only --no-banner
 	cd ${B}
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.9.bb b/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
index 0306fdf684..367a967056 100644
--- a/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
+++ b/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
@@ -3,8 +3,8 @@ require go-${PV}.inc
 
 export GOHOSTOS_CROSS = "${HOST_GOOS}"
 export GOHOSTARCH_CROSS = "${HOST_GOARCH}"
-export CC_FOR_TARGET = "${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
-export CXX_FOR_TARGET = "${HOST_PREFIX}g++ --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
+export CC_FOR_TARGET = "${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
+export CXX_FOR_TARGET = "${HOST_PREFIX}g++ --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
 
 do_compile_prepend() {
 	export GOBIN="${B}/bin"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 3bc32f3bec..29a1344675 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -14,8 +14,7 @@ GO_LDFLAGS = ""
 GO_LDFLAGS_class-nativesdk = "-linkmode external"
 export GO_LDFLAGS
 
-SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
-SECURITY_LDFLAGS = ""
+CC_append_class-nativesdk = " ${SECURITY_NOPIE_CFLAGS}"
 
 do_configure[noexec] = "1"
 
-- 
2.14.1


