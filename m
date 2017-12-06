Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF5F78784
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:17:27 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u10so8031817qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 03:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=9Is6ZoVEEVzFZe58KyBbURrvqMmOpCIiokx6h88Pwhk=;
	b=BdV7cc6Zt8bxFHzw54wPx6lwWOA28Idd9DrJhv9ljP3lmeh6Zin1id+miiYp5g2XM7
	JMVxorpdHz+OpemVB+DK1920detx3d//NbXiqBNPRdavzbevtctRC3XMPDOzSvppkMTA
	8CaDcovFIGgkeAUMEGoY/Ig2gxYl/Ir3w5KbHmcRbBq0pLq+oceEOiq5LtQny8W2G7eT
	Jr5HgDvHe6HlK9FKiWGBAnyhBUcqVzgZKnb1EkHw9NpYrRCXEu64TQUeLbJ4EgwqgE2t
	exapY3OlS6vxkGLZUvXrVHJNaZI+9Zmf6l8L7JqzgmsT6fRkVlTvhudy5GC/e/qOej3K
	yODw==
X-Gm-Message-State: AKGB3mI5l6kCycwKjzxXROnutg//PJCWdLdUVbbEb0L/U0oh1iBhgSBE
	7E011XzvooQrD8/LUGzMJDDaQQ==
X-Google-Smtp-Source: AGs4zMaQyffqYIvvqe/UxUK0dYA1d+kSoG8/r4u+AZeUoJSxsgsUBLMrIDzDGXfOhQhnn1NqDn5GBg==
X-Received: by 10.55.5.139 with SMTP id 133mr23131117qkf.220.1512559048306;
	Wed, 06 Dec 2017 03:17:28 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	c16sm1390614qke.53.2017.12.06.03.17.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Dec 2017 03:17:27 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 06 Dec 2017 09:17:21 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  6 Dec 2017 09:17:03 -0200
Message-Id: <20171206111703.13684-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171206111703.13684-1-otavio@ossystems.com.br>
References: <20171206111703.13684-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko PATCH 3/3] go: ensure use of BUILD_CC when building bootstrap tools
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
X-List-Received-Date: Wed, 06 Dec 2017 11:17:27 -0000

From: Matt Madison <matt@madison.systems>

For cross-canadian builds, we were accidentally using
the crosssdk C compiler when building the Go compiler
bootstrap.  Add a patch to the make script to let us
use BUILD_CC, and prepend do_compile to set it in
the local environment to ensure that the trailing
blank gets stripped, since that confuses Go.

[YOCTO #12341]

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 0dbb860924fc157880b52d8e08bad3c6c6b019b8)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-1.9.inc                |  1 +
 ...verride-CC-when-building-dist-and-go_boot.patch | 43 ++++++++++++++++++++++
 meta/recipes-devtools/go/go-common.inc             |  4 ++
 3 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 60292651df..7f12241dc1 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -15,6 +15,7 @@ SRC_URI += "\
         file://0007-ld-add-soname-to-shareable-objects.patch \
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
         file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
+        file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
 "
 SRC_URI_append_libc-musl = " file://set-external-linker.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
new file mode 100644
index 0000000000..83fd78c3d7
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -0,0 +1,43 @@
+From 21d83dd9499e5be30eea28dd7034d1ea2a01c838 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Tue, 14 Nov 2017 07:38:42 -0800
+Subject: [PATCH 10/10] make.bash: override CC when building dist and
+ go_bootstrap
+
+For cross-canadian builds, dist and go_bootstrap
+run on the build host, so CC needs to point to the
+build host's C compiler.  Add a BUILD_CC environment
+for this, falling back to $CC if not present.
+
+Upstream-Status: Pending
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/make.bash | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/make.bash b/src/make.bash
+index 0bdadc6..f199349 100755
+--- a/src/make.bash
++++ b/src/make.bash
+@@ -131,7 +131,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+ 	exit 1
+ fi
+ rm -f cmd/dist/dist
+-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
++CC=${BUILD_CC:-${CC}} GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
+ 
+ # -e doesn't propagate out of eval, so check success by hand.
+ eval $(./cmd/dist/dist env -p || echo FAIL=true)
+@@ -167,7 +167,7 @@ elif [ "$1" = "--host-only" ]; then
+ fi
+ 
+ if [ "$do_host_build" = "yes" ]; then
+-	./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
++	CC=${BUILD_CC:-${CC}} ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstrap
+ 	# Delay move of dist tool to now, because bootstrap may clear tool directory.
+ 	mv cmd/dist/dist "$GOTOOLDIR"/dist
+ 	echo
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index ce1eb86812..9af68738a6 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -20,3 +20,7 @@ B = "${S}"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
+
+do_compile_prepend() {
+	BUILD_CC=${BUILD_CC}
+}
-- 
2.15.1


