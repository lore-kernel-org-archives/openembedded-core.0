Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id EDD2B78587
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 19:22:56 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id b1so221884qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=8dI0d2xeV+Pvs+BH2LlYtBIYPGe9LG7obO04rc+q/DI=;
	b=sTSJ44klDXZSc7IpdAEdv1L+E2mdMhKc6dddhjZzvuZvi4Lz3EwnFm3I8nP7beEB6i
	55KdMNTmUrhzN2ToIyu7Y1fChJDuIdAXGu8kXPL738BVtVnvTEZ7cfRIZ5gGMle64USL
	Dh3j6sLFt7uub7c4PeLnJnirdXdRbhBq0LXBsRAI0pPa76LJORTysPuEj6S1wnLFdtn6
	5MzbRu/yiFRPxyykox+UE+Nhb/OcQ6C2O0H+bn/GFko/VVMRYkQKzp85m/ULQXn93dn3
	S6nWU0n2/xmRVFR9am9BQoSiVA5bPZpXjHAhduEiUS12ArQibi5thep7ITQonAbzkVQp
	K6Tg==
X-Gm-Message-State: AHPjjUiwx2G0lvNIL5wJzeZjkXTcgmcg8LN5qWvyXaQDqeIH0NPNeVKV
	fp1jh7awlXbqIpSh
X-Google-Smtp-Source: AOwi7QAopB5ZfyejvxLxuaNgOP5Bl+nm4kNw5Odi6/Z1nBmAZht7Zo2NgJz73cOP6xp85Zk+lOAiqQ==
X-Received: by 10.200.55.228 with SMTP id e33mr34369280qtc.170.1505416978086; 
	Thu, 14 Sep 2017 12:22:58 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	k2sm11778319qtk.53.2017.09.14.12.22.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 12:22:57 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 14 Sep 2017 16:22:50 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 16:22:28 -0300
Message-Id: <20170914192231.15002-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170914192231.15002-1-otavio@ossystems.com.br>
References: <20170914192231.15002-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v10 2/5] go: fix linking issues for nativesdk builds
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
X-List-Received-Date: Thu, 14 Sep 2017 19:22:57 -0000

From: Matt Madison <matt@madison.systems>

Switch to using an external linker for nativesdk
go, go-runtime, and go package builds, which works
more reliably when building 32-bit SDKs.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v10:
- new patch

 meta/classes/go.bbclass                 | 4 +++-
 meta/recipes-devtools/go/go-runtime.inc | 5 +++++
 meta/recipes-devtools/go/go-target.inc  | 3 +++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 33502bf722..863b578e5c 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -37,7 +37,9 @@ GO_RPATH = "${@'-r ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_D
 GO_RPATH_class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
 GO_RPATH_LINK_class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
-GO_LDFLAGS ?= '-ldflags="${GO_RPATH} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_LINKMODE ?= ""
+GO_LINKMODE_class-nativesdk = "--linkmode=external"
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
 export GOPTESTFLAGS ?= "-test.v"
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index a074238e47..934d1aaeb9 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -45,6 +45,11 @@ do_install() {
 	done
 }
 
+# Remove test binaries that cannot be relocated
+do_install_append_class-nativesdk() {
+	rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
+}
+
 # These testdata directories aren't needed for builds and contain binaries
 # that can cause errors in sysroot_strip(), so just remove them.
 sysroot_stage_all_append() {
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 0d80bf0d97..b88d0166e5 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -14,6 +14,9 @@ export CC_FOR_TARGET = "${CC}"
 export CXX_FOR_TARGET = "${CXX}"
 export GO_TARGET_INSTALL = "cmd"
 export GO_FLAGS = "-a"
+GO_LDFLAGS = ""
+GO_LDFLAGS_class-nativesdk = "-linkmode external"
+export GO_LDFLAGS
 
 do_configure[noexec] = "1"
 
-- 
2.14.1


