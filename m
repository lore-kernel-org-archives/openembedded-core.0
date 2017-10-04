Return-Path: <matt@madison.systems>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5B07377ECB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 18:22:09 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id b1so5428380pge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 11:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wQY7D0VXMBLa1zTca6Y67LwYZAfCfpWRNA39BL8X8Tc=;
	b=Ecb0Dx/+gOy/imXbtsPpS6VpB5fILInsVDuhBHo82dyr72EmGPRPebThxGF2yKar1K
	hPRHlPs+5HH4Kx6PuW2u5C5TNwnWitAy5VepbZmW0s1K9jrxi6ZKmpfwbqr+mERz73VJ
	0d9nVAYOjmWIU2Yy9deKWxaLU2X7UU8IOzFsmEsMFmAB6ADZFQ/si+mlCVA0ooEkRNiU
	3yHR24o3D2lWLHFI8rh0WpyxNc5SCIFnimeNJVv/Z9sXo+CenzcVwfqR0JulRvgWNvjv
	njJpPfkILvmPIc12bF/YImov5hbqwR50tr5FPNYi+nQFKsao2JTDVVggBIqHP7spzRJK
	fYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wQY7D0VXMBLa1zTca6Y67LwYZAfCfpWRNA39BL8X8Tc=;
	b=TAfdEGlJoTAHopbRbzS5kZUynyMFsnnkOxsMCzgKmQV8/nh2piNw3kv3JpqvbvL7Q9
	ll/tpelGGoK7cKAx5ytKTL4QQI47lP6C5QWaD+gdZrdat2iTXugCTrTkKz7qX/aJUzOY
	ji1fOC9QvGSu/LXBC7byFqK7RkO8gcpgC3JCR/1bbh9LDRnYDZkSiy/B4uYx0l7XWOg+
	BTnhmHQjQYHL/mw/jHhcxqoQqlhEBiQZHDu/Gs97zSAqh6qTVG5Sk/neeO4DwoDog1R7
	h0rHXzJArGCMQ5BorhNi0kbTz1FJwvoT++8ls1qKaa6dZQ2UcLQcDAEWv01X6j8Vj9rm
	Avew==
X-Gm-Message-State: AHPjjUjHHUEeiuKHqYAHnVi3bf5p3dzivkyx5PIbK8i7Xx98vVTzLlKq
	KkdAnZ/2AROjJLWlDL9e2YaqisUd
X-Google-Smtp-Source: AOwi7QB8/WDQg/YO3l9S7SPuejVXrmvYLGObgB4D9fErliGLVy7HBhVChsC6LntpJnVCmOB4D55hVQ==
X-Received: by 10.101.86.79 with SMTP id m15mr18993259pgs.157.1507141331051;
	Wed, 04 Oct 2017 11:22:11 -0700 (PDT)
Received: from ip-172-31-5-214.us-west-2.compute.internal
	(ec2-52-39-37-57.us-west-2.compute.amazonaws.com. [52.39.37.57])
	by smtp.gmail.com with ESMTPSA id
	y72sm27778884pfa.129.2017.10.04.11.22.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 11:22:09 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Oct 2017 18:21:52 +0000
Message-Id: <1507141312-10348-2-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507141312-10348-1-git-send-email-matt@madison.systems>
References: <1507141312-10348-1-git-send-email-matt@madison.systems>
Cc: otavio@ossystems.br, saul.wold@intel.com
Subject: [PATCH v3 1/1] go-runtime: prevent host leakage into target objects
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
X-List-Received-Date: Wed, 04 Oct 2017 18:22:10 -0000

When building for a target whose architecture matches
the build host's, the second pass through make.bash
to build the shareable runtime would also overwrite
the target's static cgo library with host-compatibile
binaries.

Fix this by running the host-side build once and
target-only passes of make.bash twice, for static
and shareable.  This ensures that what gets installed
is target-compatible.

Also fix an issue with x86-64 targets running MUSL by
removing the pre-built (for glibc) objects for the
race detector runtime before building.

[YOCTO #12136]

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-runtime.inc | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 934d1aa..f181dc7 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -15,7 +15,13 @@ export CC_FOR_TARGET="${CC}"
 export CXX_FOR_TARGET="${CXX}"
 export GOROOT_OVERRIDE = "1"
 
-do_configure[noexec] = "1"
+do_configure() {
+	:
+}
+
+do_configure_libc-musl() {
+	rm -f ${S}/src/runtime/race/*.syso
+}
 
 do_compile() {
 	export GOBIN="${B}/bin"
@@ -23,9 +29,13 @@ do_compile() {
 	rm -rf ${GOBIN} ${B}/pkg
 	mkdir ${GOBIN}
 	cd src
-	GO_FLAGS="" ./make.bash
+	./make.bash --host-only
+	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
+	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
+	./make.bash --target-only
 	if [ -n "${GO_DYNLINK}" ]; then
-		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash
+		cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
+		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash --target-only
 	fi
 	cd ${B}
 }
@@ -41,8 +51,9 @@ do_install() {
 	rm -rf ${D}${libdir}/go/pkg/obj
 	rm -rf ${D}${libdir}/go/pkg/bootstrap
 	find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
-		[ "$srcdir" = "./cmd" ] || cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
+		cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
 	done
+	rm -f ${D}${libdir}/go/src/cmd/dist/dist
 }
 
 # Remove test binaries that cannot be relocated
-- 
2.7.4


