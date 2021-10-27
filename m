Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD78C43217
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:38 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.13223.1635347857108672005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456858"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456858"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:34 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617239"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 26/36] nativesdk-pseudo: Fix to work with glibc
 2.34 systems
Date: Wed, 27 Oct 2021 23:16:34 +0800
Message-Id: 
 <1cbf45e39e6a9d043691fb236946c6717dd666b7.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157541

From: Hongxu Jia <hongxu.jia@windriver.com>

Since commit [df313aa810 pseudo: Fix to work with glibc 2.34
systems] applied, it fixed native only. And nativesdk has
the similar issue

Tweak library search order, make prebuilt lib ahead of recipe lib,
after apply the fix:
...
$ readelf -a lib/pseudo/lib64/libpseudo.so | grep 'Shared library'
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
 0x0000000000000001 (NEEDED)             Shared library:[libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6d116b5db78645958ea30be3d0572e0f6d7bd92)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../pseudo/files/older-glibc-symbols.patch    | 38 +++++++++++--------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  3 ++
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
index 1552c69b52..c453b5f735 100644
--- a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
+++ b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
@@ -12,26 +12,31 @@ Yes this is horrible. Better solutions welcome.
 
 There is more info in the bug: [YOCTO #14521]
 
-Upstream-Status: Inappropriate [this patch is native only]
+Upstream-Status: Inappropriate [this patch is native and nativesdk]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: git/Makefile.in
-===================================================================
---- git.orig/Makefile.in
-+++ git/Makefile.in
-@@ -122,7 +122,7 @@ libpseudo: $(LIBPSEUDO)
+Tweak library search order, make prebuilt lib ahead of recipe lib
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in       | 2 +-
+ pseudo_wrappers.c | 5 ++++-
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -120,7 +120,7 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o | $(BIN)
+ libpseudo: $(LIBPSEUDO)
+ 
  $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS) | $(LIB)
- 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
+-	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
++	$(CC) $(CFLAGS)  -Lprebuilt/$(shell uname -m)-linux/lib/ $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
  		pseudo_client.o pseudo_ipc.o \
--		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
-+		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) -Lprebuilt/$(shell uname -m)-linux/lib/ $(CLIENT_LDFLAGS)
+ 		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
  
- # *everything* now relies on stuff that's generated in the
- # wrapper process.
-Index: git/pseudo_wrappers.c
-===================================================================
---- git.orig/pseudo_wrappers.c
-+++ git/pseudo_wrappers.c
+diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
+--- a/pseudo_wrappers.c
++++ b/pseudo_wrappers.c
 @@ -100,10 +100,13 @@ static void libpseudo_atfork_child(void)
  	pseudo_mutex_holder = 0;
  }
@@ -47,3 +52,6 @@ Index: git/pseudo_wrappers.c
  
  	pseudo_getlock();
  	pseudo_antimagic();
+-- 
+2.27.0
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 64cbb40641..3a4cdbe794 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,6 +8,9 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=git/prebuilt;name=prebuilt \
     file://older-glibc-symbols.patch"
+SRC_URI:append:class-nativesdk = " \
+    http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=git/prebuilt;name=prebuilt \
+    file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
 SRCREV = "b988b0a6b8afd8d459bc9a2528e834f63a3d59b2"
-- 
2.31.1


