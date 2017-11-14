Return-Path: <matt@madison.systems>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8E472784F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 17:20:23 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id z184so10453997pgd.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 09:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=06B6b6eq786c4g1c5JZsRlsLOpw6pQ6NSIDLjtBPVaw=;
	b=jAiE9JeEFXVeGXI0NuTKcvKYpKDoHyTEVSp2aCdulOC1p7VgVGRY735evB+IYR5cG5
	4s6hFDcn5ZAoX2zL7E7lQgnPm9fCLtGb0TxNcb1qa1FWKqJDOV9VA/xcYyz/DtuqMImy
	9nwnWj7OLns/J1SVvgQoj+/Oe/7UHwAiZPk5qzAOGa9qbv57QDyMFNMjTHaCOmJzJpru
	hPCgGhc/DmgdYq6Dyzn1MvY5TtIowhMcosiKOAbHEV1IGENJsWwds5JlUyLzRGmze6zN
	K+aNGJGp2YJs53ORMhmUDk/DeqwuC7wXPiJMvYd8hWAOPP/yyLh5a8NMUnE4UsVgXbfP
	moVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=06B6b6eq786c4g1c5JZsRlsLOpw6pQ6NSIDLjtBPVaw=;
	b=mkV0+sv/ApD0nkarDI2AKf2uEARLUnZJXy7BSV9pt5vWC53CMxvl/fNQkOLWaMXyxw
	XzD74EU/toSBxQbHLMEESJongJzVI8fWX1y7EmA7WQL/kcycv289o/fROO07w4drJb4Y
	zNz8pM/MnMdMbNHamsrkEWssEENbYWkngHedLPEWRpiJz7wYju8zoph/dzxbgec/ZLoj
	vadty2msq+NYu1QQZGDt2qSl3nXxLGrnO8lB6+4HDVo4RXvSVnlfzWl8nEp4WoFeLSQ0
	xmqDPt5fZJ0u7GsPfKnHwNq910R24GZVA7N2cVLQ6Sf2/pwSoS8Qqj2IU1nNhJM0q6Kw
	dpsA==
X-Gm-Message-State: AJaThX6/W+rr99xAW7Zxi8tzX7E2Z7KZUt1VqyGTjL1jI2L8u5aID+Ft
	Ya+HCsMyabbGM51tdcuUe+g0MdZT
X-Google-Smtp-Source: AGs4zMYjLMpbVklgywydWX4DyKXwXo3T8GAmzViM71aDMTl2dKLeO/PxGdD2bNG+mBBiq8f6rptZTw==
X-Received: by 10.98.10.77 with SMTP id s74mr8967353pfi.104.1510680024355;
	Tue, 14 Nov 2017 09:20:24 -0800 (PST)
Received: from workhorse.madison.systems
	(c-67-170-200-185.hsd1.ca.comcast.net. [67.170.200.185])
	by smtp.gmail.com with ESMTPSA id y5sm37802155pfk.3.2017.11.14.09.20.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 09:20:23 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 09:20:15 -0800
Message-Id: <1510680015-24735-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com, otavio.salvador@ossystems.com.br
Subject: [PATCH v3] go: ensure use of BUILD_CC when building bootstrap tools
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
X-List-Received-Date: Tue, 14 Nov 2017 17:20:24 -0000

For cross-canadian builds, we were accidentally using
the crosssdk C compiler when building the Go compiler
bootstrap.  Add a patch to the make script to let us
use BUILD_CC, and prepend do_compile to set it in
the local environment to ensure that the trailing
blank gets stripped, since that confuses Go.

[YOCTO #12341]

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/go/go-1.9.inc                |  1 +
 ...verride-CC-when-building-dist-and-go_boot.patch | 43 ++++++++++++++++++++++
 meta/recipes-devtools/go/go-common.inc             |  4 ++
 3 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 65adaa8..1dbb5ef 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -15,6 +15,7 @@ SRC_URI += "\
         file://0007-ld-add-soname-to-shareable-objects.patch \
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
         file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
+        file://0010-make.bash-override-CC-when-building-dist-and-go_boot.patch \
 "
 SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
 SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
diff --git a/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
new file mode 100644
index 0000000..83fd78c
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
index ce1eb86..9af6873 100644
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
2.7.4


