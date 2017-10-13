Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E62087827F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 19:25:58 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id u138so23749880wmu.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 12:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=L3eI6EAIWGNLku9Z70igc76ULezSEKZJxUWK/1SsY8E=;
	b=2RBbW+lAxfTSn0hKsq7BJTN0L4KcuEbEESzyPEPUWmmmyil5yKGXRWbY4bU/M/uKiV
	wyQKd7H/vu5IKDiIp3x37lo/vCn1gmi8t0Le3WrNIvEndfniu3j7o1xhJeRRrKmHzZ81
	O0By5xrjYRR3xzkcc3OjuiADoF7w1RAaQVZfCs0yCNqZXSqEWMPytJIqe0nsTKiMUoJa
	AArCa4LGEI5Ec+er5j9jbu0p2IuB9aensv7Uc9a/sg2y2Rk70sUzQGCPgk8rshLZkXZY
	m+JNN5O5tONFGaTTn7mSCT29kqRfoZytkym3XzeAClGrEo65Z1Gggtc8VSJOQjkmHTii
	+CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=L3eI6EAIWGNLku9Z70igc76ULezSEKZJxUWK/1SsY8E=;
	b=d52ZsnZpPl3UC7471HJ6P45CVz2vRaSz3PAS/u2YXGmHZROF6UiM443+QTyKy2xx5N
	F20Ip/RmyffbMt9GqRXY8LLjg/WktrGzgCPYFbCdANwTg3tqpWHpjUeG/WZaKMA5+FRM
	qST+RveSjBhEoz4bi1GKNTVi5GOLpHWayUeAzvOfHGic4lmKTgWU7lMoq84KH3bruhEr
	k98m7SUZ3WoNtNgBSUNT8ebY4k3nOXxDLJyj/S9+MPHeiArRQWMn2jA9+3DENYvRqpvI
	9AwNxM0afAwSbgAK75vh6wRVRhctD8xwgN0KSPEfQ2dVsCCHL8wF8/o7sNw+80biIY+2
	WWnw==
X-Gm-Message-State: AMCzsaVWpalDTueUlexXFVngkoGyG8WmMyRsn71jXnDx64iePzSxEO5c
	SeV6rdbsmTZbKDgGieN0GGAfgz0c
X-Google-Smtp-Source: ABhQp+RMkUg8UG1oGP4OMd0mY6V5qm0VN87NRteap+SWGjFtcjEq2hgxhy/bSvbqmFs7YvUdCk40ng==
X-Received: by 10.28.217.136 with SMTP id q130mr2093546wmg.89.1507922759377;
	Fri, 13 Oct 2017 12:25:59 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q188sm1538362wmb.43.2017.10.13.12.25.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 12:25:58 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Oct 2017 19:25:29 +0000
Message-Id: <1507922729-17240-3-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
References: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 2/2] go: Export correct GO386 value for target
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
X-List-Received-Date: Fri, 13 Oct 2017 19:25:59 -0000

When compiling go code for the target we need to ensure that GO386 is exported
and set appropriately. This controls whether sse/sse2 instructions are used to
implement floating-point operations or not.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 1 +
 meta/recipes-devtools/go/go-cross.inc          | 2 ++
 meta/recipes-devtools/go/go-runtime.inc        | 1 +
 meta/recipes-devtools/go/go-target.inc         | 1 +
 4 files changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index f3ab735..8afda6b 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -41,6 +41,7 @@ native_goroot=\`readlink -f \$here/../../lib/${TARGET_SYS}/go\`
 export GOARCH="${TARGET_GOARCH}"
 export GOOS="${TARGET_GOOS}"
 test -n "\$GOARM" || export GOARM="${TARGET_GOARM}"
+test -n "\$GO386" || export GO386="${TARGET_GO386}"
 export GOTOOLDIR="\$native_goroot/pkg/tool/${HOST_GOTUPLE}"
 test -n "\$GOROOT" || export GOROOT="\$OECORE_TARGET_SYSROOT/${target_libdir}/go"
 \$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index dac0dfd..3ac7211 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -10,6 +10,7 @@ export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
+export GO386 = "${TARGET_GO386}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
@@ -37,6 +38,7 @@ here=\`dirname \$0\`
 export GOARCH="${TARGET_GOARCH}"
 export GOOS="${TARGET_GOOS}"
 export GOARM="\${GOARM:-${TARGET_GOARM}}"
+export GO386="\${GO386:-${TARGET_GO386}}"
 \$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
 END
     chmod +x ${D}${bindir}/$2
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index f181dc7..29ae86e 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -7,6 +7,7 @@ export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
+export GO386 = "${TARGET_GO386}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export GO_TARGET_INSTALL = "std"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index b9689c0..cac5d78 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -7,6 +7,7 @@ export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
+export GO386 = "${TARGET_GO386}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-- 
2.7.4


