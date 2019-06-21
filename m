Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6471D6D6C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 08:06:06 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id i11so8839572edq.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aNrFPQePDLHm6biNUXL+jibRUBp+Z9lOAf/VcWMlFVI=;
	b=GL97wKW7brzCF0EQsyS7qe2heqSaYNClfXU6eG5T8Wh36dp2AKAsfnAFLD851Ewjx6
	9jnez5ZOCqGfGEM2zXFwMlos7CZ535bTO/za3sciHxyywKBpLVXHw3Ksetn48vdIor/Y
	0YlgoYSq0AXDHObVWTzLN65fen2LCQNYnuKFauSvP0MQVa/GYJ6vtClfYAyulNLO7cWC
	APxPj8UvqzyBw9d74vfdMtDJIgV38a12xOiIRY/SEaNkP8OkApP5WkWsGHsfo7Tjtfsn
	H36a04+Q/SYgT6lRJZS/7uq+db8d6ZKZd/crnLz1O89Cu7dvqm7AQrSz4baDWh/Dq4Xe
	0icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=aNrFPQePDLHm6biNUXL+jibRUBp+Z9lOAf/VcWMlFVI=;
	b=RdiXiAL2F4A+q9iXDrox75FiKRxmjHHXBJ3HzSn2nJtjDaXRyRc2FVWIYzMru6f5kH
	/N3tWffXkMmZCX+xJaJIbw+DXi4Oljjh0bNDyfWwYKemqNRZGNxNsWPx+u9j4mBXCzuc
	F7sGXRA0khR6ZnfwyLSZ5x6faAEFakZLIKOQ2OZiHTYicRwp0qVSBGTjfXGJnTn3p9VH
	AbepIMwtpsWyLFCW2Rc2vTZoKTv44gl2xnDrCnO97Je7Ls+u1y/YOT8iH+i76S8totfz
	WKkoFAniJBt+JzcgJiFT3SiPQKY7ugoAguH80diG1JIlxBNgK4/v4WY6SnvJigg7Hxm/
	nG0g==
X-Gm-Message-State: APjAAAWdXdqgj4q5UgBJC9pT/5EG+CA0Pwn8mhRF6iewfA/y0sC3aplb
	b8nIhyUXuexBsVvMjan/KPxYpontDUg=
X-Google-Smtp-Source: APXvYqxgC4ABUMVr78i+WhNLGqqZeWMXYux+3vzUZDztl2f9AekGA6vAYtFoV0pyo6v0WaBt5+1oig==
X-Received: by 2002:a50:bd83:: with SMTP id y3mr7236819edh.120.1561104366798; 
	Fri, 21 Jun 2019 01:06:06 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id s26sm301028ejl.50.2019.06.21.01.06.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 01:06:05 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 10:06:02 +0200
Message-Id: <20190621080602.25394-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] go: avoid host contamination by GOCACHE
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
X-List-Received-Date: Fri, 21 Jun 2019 08:06:06 -0000
Content-Transfer-Encoding: 8bit

By default GOCACHE is set to $HOME/.cache.

Fixes:
ERROR: go-cross-dbfp4-1.12.1-r0 do_compile: Function failed: do_compile (log file is located at /workdir/build/tmp/work/x86_64-linux/go-cross-dbfp4/1.12.1-r0/temp/log.do_compile.8120)
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/x86_64-linux/go-cross-dbfp4/1.12.1-r0/temp/log.do_compile.8120
Log data follows:
| DEBUG: Executing shell function do_compile
| Building Go cmd/dist using /workdir/build/tmp/work/x86_64-linux/go-cross-dbfp4/1.12.1-r0/recipe-sysroot-native/usr/lib/go.
| failed to initialize build cache at /home/pokyuser/.cache/go-build: mkdir /home/pokyuser/.cache: permission denied
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /workdir/build/tmp/work/x86_64-linux/go-cross-dbfp4/1.12.1-r0/temp/log.do_compile.8120)
ERROR: Task (/workdir/repo/poky/meta/recipes-devtools/go/go-cross_1.12.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 23 tasks of which 16 didn't need to be rerun and 1 failed.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/classes/go.bbclass                 | 1 +
 meta/recipes-devtools/go/go-cross.inc   | 1 +
 meta/recipes-devtools/go/go-runtime.inc | 1 +
 meta/recipes-devtools/go/go-target.inc  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index b6d9372c56..e05a5c641c 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -7,6 +7,7 @@ GOROOT_class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
 GOROOT = "${STAGING_LIBDIR}/go"
 export GOROOT
 export GOROOT_FINAL = "${libdir}/go"
+export GOCACHE = "${B}/.cache"
 
 export GOARCH = "${TARGET_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 29ce7f6e84..3d344a74d3 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -14,6 +14,7 @@ export GO386 = "${TARGET_GO386}"
 export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
+export GOCACHE = "${B}/.cache"
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
 do_configure[noexec] = "1"
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index c219aa3789..e282195619 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -15,6 +15,7 @@ export CGO_CFLAGS = "${CFLAGS}"
 export CGO_CPPFLAGS = "${CPPFLAGS}"
 export CGO_CXXFLAGS = "${CXXFLAGS}"
 export CGO_LDFLAGS = "${LDFLAGS}"
+export GOCACHE = "${B}/.cache"
 
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
 GO_SHLIB_LDFLAGS ?= '-ldflags="--linkmode=external -extldflags '${GO_EXTLDFLAGS}'"'
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 379f87b498..91efd3e977 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -10,6 +10,7 @@ export GO386 = "${TARGET_GO386}"
 export GOMIPS = "${TARGET_GOMIPS}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
+export GOCACHE = "${B}/.cache"
 GO_LDFLAGS = ""
 GO_LDFLAGS_class-nativesdk = "-linkmode external"
 export GO_LDFLAGS
-- 
2.20.1


