Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BECC4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.1090.1652811926802058993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=63/F113v;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d17so18117605plg.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iaKPdOqsVmEeMVlYEQeQi6jY4Lbez3dqwvahZTKS/6g=;
        b=63/F113vi75mYsIfDV3p9btdcm/yrlSxnoQ+QDQwKQmIK/c6DbIByz5QUPpLPi+WUX
         VBW8auX2lVibW1D6LbPeWGTsLqRpj1uGu9h/Uz0jdC2sTLHyU0URhAf+N3dlmQ+lWvD6
         eb6IpwraVHS1kSdb/R2jlcEs/mCpq/3KOFwfwczKX4eCLGnrF4uSp23qjS0z7qTrhPJl
         ULx2J6ppoJ9u8FHtsGQ6ESKbzufEAs+8mtlXRQIu+3dzl7p4JyZsh8ulNcB5Ux/kHNQ8
         oQSdEI4pP1yIz5hZqdlPAAPc7yYlmjrGk1qVe5TS6+U5VNaaupe1VUWcrRsRwQBTMGi7
         ECqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iaKPdOqsVmEeMVlYEQeQi6jY4Lbez3dqwvahZTKS/6g=;
        b=mQfGNVQCXtD1CTQkimnZCt11gHKbfD6irSy0aNes3XJwTUCiba+ApWbKnO7R92Q6ej
         32TKZ/ZuYUHPVP/6T2WT+HjeYkTqDiotK76vU9mN++n1cZRvXEliAzcdkGfzsnAWfcd7
         RSGCxqkty/j0DwLCFr9YqNKN8GL+BIcz5UBtRZBOq86IXbbFCB1liJNdI7Ae2XH/sRg7
         ZdCkBZjqED1Kg5Bk4C2f4JSwieTMa0zzxnTMkw8fAW9jWfNxghz5N1qdjG/j0nGseWlB
         gCIeogDKjd3MvXumdWxgR70s4/Hs7GuSqZWc3dI49MMwgrp43XVfbLbx444foTAfDbiD
         3H+Q==
X-Gm-Message-State: AOAM5319/0z3CsQuw1MJKZD1hhk3nbfMOdSgtjAgAkTHcBIVXUW+rvIT
	4ZNGpkMvMpGOCMuOZGQW4GgxnHb+1703nn4x
X-Google-Smtp-Source: 
 ABdhPJy5xrvPRFVCJTJ46ywOynKYnsdynkXzkGP+VS/ovYjzAjJL/AmIpxpk9/JBx3GADHGv1sjIDw==
X-Received: by 2002:a17:90b:1a86:b0:1dc:eae9:9b5b with SMTP id
 ng6-20020a17090b1a8600b001dceae99b5bmr26515417pjb.100.1652811925596;
        Tue, 17 May 2022 11:25:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/31] linux-firmware: replace mkdir by install
Date: Tue, 17 May 2022 08:24:06 -1000
Message-Id: 
 <e16b9768a2e3eb931d11558f448149c16afa490b.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165765

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
index 4a443d14d1..d396702690 100644
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


