Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA5BC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.13223.1635347857108672005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456849"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456849"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:32 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617233"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 25/36] pseudo: Fix to work with glibc 2.34 systems
Date: Wed, 27 Oct 2021 23:16:33 +0800
Message-Id: 
 <c9203671d638edb6a063d7522b29b8a8e776c2f3.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157540

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The merge of libdl into libc in glibc 2.34 causes problems for pseudo. Add a fix
that works around this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd3e46a043c81cd4d81731a0f691868d3c059742)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.31.1


