Return-Path: <matt@madison.systems>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 994AD784E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 16:53:26 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 4so6888108pge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 08:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YUAhwMcBqWz0Z4TSUNiShQVG54x+eUe5VWo66K/dI9I=;
	b=s5Unkz0oOt520Kt8F/m8Wir1OdQhy9DLTmf/xk2Pw90Jo+iDRzyf/HJRXwSISVS+Pr
	d67E7klZUx071jDnQ9ugp0xeqAlRUcJQvy1ke1QX3TmQuFQnRqdjEAXjriPOAmsMc2ag
	2+8cXGgrUBlBvm/AkP5cc+ombNvMwuYnzlQeMjwULj2P3rqtFUOXFHWCcLsEWNHCbgpo
	4ciG1pf47/g/8Qe9XuD5wI2boBYd/YLz+YjQP9Ob13QFRhCVfeY5libtXfE57ZkUl184
	bp2MZ9SPTYnClf7i5clz2yNZePS0mjLTgurAjeumT4w5H86Z+jgXR/YwToiezekjKZNS
	1x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YUAhwMcBqWz0Z4TSUNiShQVG54x+eUe5VWo66K/dI9I=;
	b=uljeWmEMhBJX5sbXR09mD82BMILX15e6XFJe12ONzvT/zNHEq0lx22Su1fURB8Z0Ww
	ti0XSOf/Kp1xUu9/beqtFT2FW6kt8HWiSrx3ejQ4ScQrAA2ySgIgq/E+1xhwqprkQUqS
	V9riH0Eo/QsT5gPsp49ud+uvktpcTTVZeSPblqK6/UPjyMt8c8eYmr7sGe6673YLa2AU
	xd5MVxep17195YS9WFzDQpLDwdvIoD5dAU+andT7SlkVa1CYX+KEyzoLHqLgGNzqcu5f
	mqmJ5ceUpmYc/vuyOIPV+5xgw+qixNEhJ2aoEOAtNrtSfQS2NkysCk4mJ0Pi38ioi7BA
	1rgA==
X-Gm-Message-State: AJaThX6ErrfHrN2Z7wMi/VbXRoJoMdWjHmP26kTPEKKIOv8mbD9pQLli
	ZDxR8flJed2ooSMVmpZDIyLTC3cR
X-Google-Smtp-Source: AGs4zMZMl3MQpl7RivjY+SkhJCVAPzIh1puAvqkr1VKzcckUu546JO7Xuans5fkYiqq0ovQ3YH8SCQ==
X-Received: by 10.99.156.26 with SMTP id f26mr12816192pge.433.1510678407284;
	Tue, 14 Nov 2017 08:53:27 -0800 (PST)
Received: from workhorse.madison.systems
	(c-67-170-200-185.hsd1.ca.comcast.net. [67.170.200.185])
	by smtp.gmail.com with ESMTPSA id
	t81sm39248406pfg.187.2017.11.14.08.53.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 08:53:25 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 08:52:54 -0800
Message-Id: <1510678374-23415-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com, otavio.salvador@ossystems.com.br
Subject: [PATCH] go: ensure use of BUILD_CC when building bootstrap tools
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
X-List-Received-Date: Tue, 14 Nov 2017 16:53:26 -0000

For cross-canadian builds, we were accidentally using
the nativesdk C compiler when building the Go compiler
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
index 0000000..94ea197
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0010-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -0,0 +1,43 @@
+From 36787fbf0e0a6298ba1038bbbae526654597eee4 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: pending
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


