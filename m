Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0B7C4332F
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:31:13 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.358.1652841071535317489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EvPpXryN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id l14so653510pjk.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mH8dC2AqJJwFx+vSD/6oQpu+KtZDuwgV1DEvDGaB0jI=;
        b=EvPpXryNF+Tc9tyDdba7tEmJJpHKH8LEmxU3AFPyNiVHHWW6o8MU7TDsMZ5o+tTQEY
         OYmA1LEonSyxytufDUDwOoZGc3fJltp1wxs49J5mygv30ZG8PMxpEBVnFGIPIRhJKWQY
         k0qD7VUgBfIo3fdqlYNfRYlOZfHz7PmpFjBKp7kDd4FKA8jC6XsfIH5aFY+Dz5Zi9rg7
         WbmmlIkK/PP09AR7e4uro2ePAZZwI9PypDpQ+V2RyDDRf5hUjR0E2hRmjiVlS3y+RWpJ
         5BZgSUHb0tJ+eVjt3QI7Rrk+AAp062h8QRnhADKoHQObFPsBmtZ6a7y0WguX25ya6u+9
         U4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mH8dC2AqJJwFx+vSD/6oQpu+KtZDuwgV1DEvDGaB0jI=;
        b=geHrzh2hupemVeNhogKkSmjT0/80SInEasIYKNtg6la992E3XMc103Nl2s6dfgo4dx
         gTtZHE2JPZaieYxzBlPmJ/RTon1JxEYMlkNQcXwz615l+7ssOB01uvEv/t8M/9fCffdU
         H5Kai9r1wUu231FK01fkTTWm4zX71yaf81rFs8LWUkIihD77t07bh1CAPHGOJd+m3Oor
         LhH77WEfCD6dp8kJun4n1Kf6zH+t9+uQhbqvtxhN1It9sq+SDRT6mLYyqhEG1I91AV9a
         U/t/NJqev7Z0s1fzZwXAPpbMTgqr7jSMpVkOx7TuuzCiiUnFSSQmTp2NNwFVY6icFH2r
         Jzzw==
X-Gm-Message-State: AOAM531Yd/dMugBrES1+IvlgAvRd1yXl56aYIMQfWyUYiqH+WRq2Y5Oo
	Nrx+wmh7FFhyBMAGHA4rlw02PosmjlEFiARD
X-Google-Smtp-Source: 
 ABdhPJzYKUC+ylMn4qtT7xyjYKuxgv3ps7XITczeZW5Inf+/bRACRd+q8DCE+AQbv67/jdPd3QE/JQ==
X-Received: by 2002:a17:902:f60e:b0:158:5c4d:d9b0 with SMTP id
 n14-20020a170902f60e00b001585c4dd9b0mr25527365plg.63.1652841070258;
        Tue, 17 May 2022 19:31:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.31.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:31:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/9] linux-firmware: replace mkdir by install
Date: Tue, 17 May 2022 16:30:35 -1000
Message-Id: 
 <c89bc0fc7f8afdf8ff0e93c3ebd7538987170a0c.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652840866.git.steve@sakoman.com>
References: <cover.1652840866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:31:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165789

From: Konrad Weihmann <kweihmann@outlook.com>

if a setup is using RPM for packaging and there are multiple
recipes that install to ${nonarch_base_libdir}/firmware by using
install -d ${nonarch_base_libdir}/firmware, it will create installation
clashes on image install, as linux-firmware in before this patch
used mkdir -p, which creates different file mode bits (depending
on the current user's settings).

In a particular example
linux-fimware created /lib/firmware with 0600
while other-firmware-package created it with 0644
making the combination not installable by rpm backend

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98bf3f427702687bf81ed759e7cde5d6d15e77eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...01-Makefile-replace-mkdir-by-install.patch | 84 +++++++++++++++++++
 .../linux-firmware/linux-firmware_20220411.bb |  5 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch

diff --git a/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch b/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
new file mode 100644
index 0000000000..b1ac5a16ab
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
@@ -0,0 +1,84 @@
+From 71514e74f35f2b51ca24062573d6d913525b30db Mon Sep 17 00:00:00 2001
+From: Konrad Weihmann <kweihmann@outlook.com>
+Date: Mon, 9 May 2022 12:57:57 +0200
+Subject: [PATCH] Makefile: replace mkdir by install
+
+mkdir -p creates paths that are bound to user's settings and therefore
+can lead to different file mode bits of the base paths accross different
+machines.
+Use install instead, as this tool is not prone to such behavior.
+
+Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
+Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/PR2PR09MB310088EA719E6D7CA5C268F1A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com/]
+---
+ Makefile                      | 2 +-
+ carl9170fw/toolchain/Makefile | 4 ++--
+ copy-firmware.sh              | 6 +++---
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e1c362f..83a0ec6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -9,5 +9,5 @@ check:
+ 	@./check_whence.py
+ 
+ install:
+-	mkdir -p $(DESTDIR)$(FIRMWAREDIR)
++	install -d $(DESTDIR)$(FIRMWAREDIR)
+ 	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
+diff --git a/carl9170fw/toolchain/Makefile b/carl9170fw/toolchain/Makefile
+index 2b25ffe..aaea8e8 100644
+--- a/carl9170fw/toolchain/Makefile
++++ b/carl9170fw/toolchain/Makefile
+@@ -46,14 +46,14 @@ src/gcc-$(GCC_VER): src/$(GCC_TAR) src/newlib-$(NEWLIB_VER)
+ 	ln -s $(BASEDIR)/src/newlib-$(NEWLIB_VER)/libgloss $@
+ 
+ binutils: src/binutils-$(BINUTILS_VER)
+-	mkdir -p build/binutils
++	install -d build/binutils
+ 	cd build/binutils; \
+ 	$(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst; \
+ 	$(MAKE) -j3; \
+ 	$(MAKE) install
+ 
+ gcc: src/gcc-$(GCC_VER) binutils
+-	mkdir -p build/gcc
++	install -d build/gcc
+ 	cd build/gcc; \
+ 	$(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst -enable-languages=c --without-pkgversion --with-newlib; \
+ 	$(MAKE) -j3; \
+diff --git a/copy-firmware.sh b/copy-firmware.sh
+index 9b46b63..bbacb92 100755
+--- a/copy-firmware.sh
++++ b/copy-firmware.sh
+@@ -34,7 +34,7 @@ done
+ grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
+     test -f "$f" || continue
+     $verbose "copying file $f"
+-    mkdir -p $destdir/$(dirname "$f")
++    install -d $destdir/$(dirname "$f")
+     cp -d "$f" $destdir/"$f"
+ done
+ 
+@@ -42,7 +42,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
+     if test -L "$f"; then
+         test -f "$destdir/$f" && continue
+         $verbose "copying link $f"
+-        mkdir -p $destdir/$(dirname "$f")
++        install -d $destdir/$(dirname "$f")
+         cp -d "$f" $destdir/"$f"
+ 
+         if test "x$d" != "x"; then
+@@ -63,7 +63,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
+         fi
+     else
+         $verbose "creating link $f -> $d"
+-        mkdir -p $destdir/$(dirname "$f")
++        install -d $destdir/$(dirname "$f")
+         ln -sf "$d" "$destdir/$f"
+     fi
+ done
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index ad8dbac17f..34ed0c04c4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -203,7 +203,10 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
+SRC_URI = "\
+  ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
+  file://0001-Makefile-replace-mkdir-by-install.patch \
+"
 
 SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
 
-- 
2.25.1


