Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.4638.1629838323861038423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 13:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bMV3l0b2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso3129936wmi.5
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 13:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IyUybPvIiYXLptPZ95unEinKqhlNSh/By5bIfWZ/ZCQ=;
        b=bMV3l0b2HFxu+mIB24HNi64wguCDoT8L1GUiyGdzTIHkj+V9TJmtBM85MkBXFn9kB6
         03bIaXCweaDuiI+ECfQdo7umrnUmhhHVD0UuxADxvdhC/UB959a4k2sfx61TSWszlWnf
         pdcQ6ZfPKlxGKsg2gkTRRPANoE5MItJbra/xY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IyUybPvIiYXLptPZ95unEinKqhlNSh/By5bIfWZ/ZCQ=;
        b=Wji4M49GDxvKI8dEIhu0LA8fMjV524irclhU+UEi2i+6kJDu12rsttefFIed+YrFVX
         srkm1WiEFbZeZiKEc8um3ZEVYynp9bVkYe00IENxubhzxc1M//j++9Tkmz0MS3++Rwei
         HrMnnd5XNlZ3S7RA4nw6qwcczlVUCsdVSHQAh+W8X5IF+tO+oibxsuiNnct5pMjYJvcL
         MegAPrDQA/tT0rAclIUrx1yAr9i2mnD1Vm8utTzBXZ871qwdyrbOdi0X+vgrc7CVmEkS
         Gk8KQlpOGtFzI7WmnnugpBWU1xxSgG6I9EIg8pEZr/joaSIEkDdCcuiSh65mxDUumgFF
         ao8g==
X-Gm-Message-State: AOAM532+I3616OBJVUT8cuPoB78JU5kyU9yNBq/Jw+hoUCCjeCpbHFZc
	65Q7IMEEX7gJyr8m/jeorzr2xYsNDJ7cqA==
X-Google-Smtp-Source: ABdhPJwLYtLJ0nHZfzjux7gVJUhNdLb78TapNl8+vN0nvmGCNF6Gqs0mPC/t0k0uu9jQsFdSiDVI8g==
X-Received: by 2002:a7b:c396:: with SMTP id s22mr5697028wmj.131.1629838322119;
        Tue, 24 Aug 2021 13:52:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:139a:6a20:b11e:f656])
        by smtp.gmail.com with ESMTPSA id w9sm3190944wmc.19.2021.08.24.13.52.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 13:52:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Fix to work with glibc 2.34 systems
Date: Tue, 24 Aug 2021 21:52:01 +0100
Message-Id: <20210824205201.675951-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The merge of libdl into libc in glibc 2.34 causes problems for pseudo. Add a fix
that works around this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/build-oldlibc                | 20 ++++++++
 .../pseudo/files/older-glibc-symbols.patch    | 49 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  4 ++
 3 files changed, 73 insertions(+)
 create mode 100755 meta/recipes-devtools/pseudo/files/build-oldlibc
 create mode 100644 meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch

diff --git a/meta/recipes-devtools/pseudo/files/build-oldlibc b/meta/recipes-devtools/pseudo/files/build-oldlibc
new file mode 100755
index 00000000000..85c438de4e0
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
index 00000000000..1552c69b525
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
index dacaef1a66b..79b7123e389 100644
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
2.32.0

