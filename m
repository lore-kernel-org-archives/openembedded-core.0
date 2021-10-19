Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA16C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:02 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.15098.1634673299394381041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=72Er3koy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id e65so17961830pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KBMsgurNZWylD3VDKl42+v0MTuh8/UcKcWBchLhNqJA=;
        b=72Er3koyi8taWmpF7bv3tWAK/KaA7XXRiuhCexIi3n8SdKxfXgTyR5x6j94KCGatRm
         xNUo+RGyzpFCRzYL8NjbSKHRoOtvQZaH/TSiCPTzolgm3egvhRQdfq/Sxunmt9K47N7d
         G5eftdtXTXlghkgAu62Yue+FnRh34aY8+ii04KbDFMFRM3Uw84MLI/uJJIjxx02HQgOE
         eGcPbcJwpTdl0JXj/Itl6SOAfjx4j0n9X+ZQsGKZPA4/fIzIkxAKKVoIPq1ff1sFcbr8
         2OmYoWanS4iDHVzQxpeVPCfiixIKNpyFgRW8ZSsAyTngONLiOjl1A3r9FABPMkDf3KX0
         g3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KBMsgurNZWylD3VDKl42+v0MTuh8/UcKcWBchLhNqJA=;
        b=SEEFRXFR62AIifXGVXHoS0BLpmY+NlRmEuXYaWgP0Lat5HzeUQH1b3GbVmnDHCegUW
         lefNMxXaLXP82Lw18i01EeSTWzNldCtNCL2+vsG85TlWBt5YijwqsyrfRFKvEGrtti+s
         1U5tgpc8hcsmuIvP75PsQDErFiBX96E9LAWiPRo5jo7Ila2pULaUu2xESZ30Hv7of/+u
         PBXk7cjdGQI56/gfpqUYL0No2ZW06eWuWPbELSMHDYfaSPV4oUWb+PA+R/c7pAsYS+cI
         Z/TTfF2LCCGooieWpn8iszYVmSGtiTCsqtdFgyzlH4XbSByvdPpvDOeUDhOKgrnHMULq
         llEQ==
X-Gm-Message-State: AOAM53322eIsw/+L2BOyr0YMxwEnkw82wTfxvpsD9Fd9sQx2w9OW4ifV
	ILiKH4OOAKttNoipzBueqF2C9Oc6DVKz5IRNOaM=
X-Google-Smtp-Source: 
 ABdhPJwwjcZa5LWIxBa21tO7SZmQxx72/EacoaoKXWQsWHSHhQH/fZoBjy2gVEBjIHBO8UElEhvn1A==
X-Received: by 2002:aa7:93d2:0:b0:44d:4a13:5267 with SMTP id
 y18-20020aa793d2000000b0044d4a135267mr1862696pff.52.1634673298446;
        Tue, 19 Oct 2021 12:54:58 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/38] pseudo: Fix to work with glibc 2.34 systems
Date: Tue, 19 Oct 2021 09:53:32 -1000
Message-Id: 
 <449bb53b3ebfc838ba674c1c3a39407620103c8d.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157226

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The merge of libdl into libc in glibc 2.34 causes problems for pseudo. Add a fix
that works around this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd3e46a043c81cd4d81731a0f691868d3c059742)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/build-oldlibc                | 20 ++++++++
 .../pseudo/files/older-glibc-symbols.patch    | 49 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  4 ++
 3 files changed, 73 insertions(+)
 create mode 100755 meta/recipes-devtools/pseudo/files/build-oldlibc
 create mode 100644 meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch

diff --git a/meta/recipes-devtools/pseudo/files/build-oldlibc b/meta/recipes-devtools/pseudo/files/build-oldlibc
new file mode 100755
index 0000000000..85c438de4e
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/build-oldlibc
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# Script to re-generate pseudo-prebuilt-2.33.tar.xz
+#
+# Copyright (C) 2021 Richard Purdie
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+for i in x86_64 aarch64 i686; do
+    if [ ! -e $i-nativesdk-libc.tar.xz ]; then
+        wget http://downloads.yoctoproject.org/releases/uninative/3.2/$i-nativesdk-libc.tar.xz
+    fi
+    tar -xf $i-nativesdk-libc.tar.xz --wildcards \*/lib/libpthread\* \*/lib/libdl\*
+    cd $i-linux/lib
+    ln -s libdl.so.2 libdl.so
+    ln -s libpthread.so.0 libpthread.so
+    cd ../..
+done
+tar -cJf pseudo-prebuilt-2.33.tar.xz *-linux
\ No newline at end of file
diff --git a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
new file mode 100644
index 0000000000..1552c69b52
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
@@ -0,0 +1,49 @@
+If we link against a newer glibc 2.34 and then try and our LD_PRELOAD is run against a
+binary on a host with an older libc, we see symbol errors since in glibc 2.34, pthread 
+and dl are merged into libc itself.
+
+We need to use the older form of linking so use glibc binaries from an older release
+to force this. We only use minimal symbols from these anyway.
+
+pthread_atfork is problematic, particularly on arm so use the internal glibc routine
+it maps too. This was always present in the main libc from 2.3.2 onwards.
+
+Yes this is horrible. Better solutions welcome.
+
+There is more info in the bug: [YOCTO #14521]
+
+Upstream-Status: Inappropriate [this patch is native only]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/Makefile.in
+===================================================================
+--- git.orig/Makefile.in
++++ git/Makefile.in
+@@ -122,7 +122,7 @@ libpseudo: $(LIBPSEUDO)
+ $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS) | $(LIB)
+ 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
+ 		pseudo_client.o pseudo_ipc.o \
+-		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
++		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) -Lprebuilt/$(shell uname -m)-linux/lib/ $(CLIENT_LDFLAGS)
+ 
+ # *everything* now relies on stuff that's generated in the
+ # wrapper process.
+Index: git/pseudo_wrappers.c
+===================================================================
+--- git.orig/pseudo_wrappers.c
++++ git/pseudo_wrappers.c
+@@ -100,10 +100,13 @@ static void libpseudo_atfork_child(void)
+ 	pseudo_mutex_holder = 0;
+ }
+ 
++extern void *__dso_handle;
++extern int __register_atfork (void (*) (void), void (*) (void), void (*) (void), void *);
++
+ static void
+ _libpseudo_init(void) {
+ 	if (!_libpseudo_initted)
+-		pthread_atfork(NULL, NULL, libpseudo_atfork_child);
++		__register_atfork (NULL, NULL, libpseudo_atfork_child, &__dso_handle == NULL ? NULL : __dso_handle);
+ 
+ 	pseudo_getlock();
+ 	pseudo_antimagic();
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0ba460f3e6..64cbb40641 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -5,6 +5,10 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-passwd \
            file://fallback-group \
            "
+SRC_URI:append:class-native = " \
+    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=git/prebuilt;name=prebuilt \
+    file://older-glibc-symbols.patch"
+SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
 SRCREV = "b988b0a6b8afd8d459bc9a2528e834f63a3d59b2"
 S = "${WORKDIR}/git"
-- 
2.25.1


