Return-Path: <matt@madison.systems>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3310778933
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:17:17 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id m22-v6so1031361pls.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pCRd0jdDNokk6IKK8oEwhHDpAgWP9AjjX+8D+gN1vBE=;
	b=LM0Nfh/jYuD+ddWRZzs3TkmyBni9ANKrBtXrS2xeLi/sJwNZ2yB45mL14xC6KXI6+X
	SbDYY/qDIh0aAA5yorr7JEIw5RGS39o9eb5UJpqrQeH7GhUXy8z6HV+c5IAA2ZdTGzJh
	oc10EyDfYAE5OiHQIdmCZbK6eKIyUvoFJ55xq+b1IUCnyYbJu0SOZwQcdXdfBR12vrqQ
	dm+v+NwO+NwYlc3tG9+tAr861XRsJEQwic/dZvL7j38QB7ki+i01Im8Z6tDrxJFbIAX8
	KsgzI9c1IK1k705kodKMeSYV+u244X4DziIIGMEOQBhgQLGQ4isYr4NugEW05oKum5r4
	MHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pCRd0jdDNokk6IKK8oEwhHDpAgWP9AjjX+8D+gN1vBE=;
	b=AZGtRUUtrGqIsvpuAEx9PtfXOkjPGrrKsAPEzspDLDpm8eSsN9gQle3flFf8UVRH45
	V2T3jbqR2k4WOObITrkdqpwdjx3pZ8FEg/s3R+I2sUzUYPKd7hM7UqE0rX0LSfUKWign
	i1uTHpBVLjOmd2qkhx00aArV/63zl01srB+tWAbEGipcyuFWFmbd64vaE74Tk4NDCDb4
	5ZxI2wTLwG4NL1A0ogeR/LYfL96evCOMmaHPRAkGtvBBuGTn+lFcrCUTrPoCqwuA/CQ/
	YXbYyzVFSZ5EhKqQveLstOgxyInwZwDmQwpt+hs58vFmS2BI3TES5bRAbXuO9molPDkp
	z4tw==
X-Gm-Message-State: APf1xPCcofXKNNHQ8p5gFUW7VLmF7yTJqgVN69WdyyyluyN9MZHUcKMI
	5bFPJvmJw9onWjyCH7Gr4g2XyUTJ
X-Google-Smtp-Source: AG47ELtUFKKjOyXix5xnj94/aJVUrH2TU1DFczEnTNkZPAdEvhnKxQIBvetcDVyvKky11LFw+zm7gg==
X-Received: by 2002:a17:902:b40e:: with SMTP id
	x14-v6mr3112898plr.442.1519946238910; 
	Thu, 01 Mar 2018 15:17:18 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	p128sm7853503pga.45.2018.03.01.15.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:17:17 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 15:16:51 -0800
Message-Id: <20180301231654.24018-11-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180301231654.24018-1-matt@madison.systems>
References: <20180301231654.24018-1-matt@madison.systems>
Subject: [PATCH v3 10/13] go: disable PIE CFLAGS for nativesdk and cross-canadian builds
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
X-List-Received-Date: Thu, 01 Mar 2018 23:17:18 -0000

The statically-linked Go code in the toolchain is not compatible
with PIE, so disable its use in the C compiler during the
toolchain build.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 6 +++---
 meta/recipes-devtools/go/go-target.inc         | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 7a39e4509b..1d6453712e 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -12,13 +12,13 @@ export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/$
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
-export GO_LDFLAGS = '-v -linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
+export GO_LDFLAGS = '-v -linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'
 
 do_configure[noexec] = "1"
 
 do_compile() {
-	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
-	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
+	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
+	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
 	cd src
 	./make.bash --host-only --no-banner
 	cd ${B}
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


