Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.26573.1629954194295239256
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 22:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17Q53AG4027736
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 25 Aug 2021 22:03:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17Q53AoC013689
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Aug 2021 22:03:10 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 25 Aug 2021 22:03:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 25 Aug 2021 22:03:09 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 25 Aug 2021 22:03:09 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH] nativesdk-pseudo: Fix to work with glibc 2.34 systems
Date: Wed, 25 Aug 2021 22:03:09 -0700
Message-ID: <20210826050309.26067-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
index 79b7123e38..328177c9bf 100644
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
2.30.2

