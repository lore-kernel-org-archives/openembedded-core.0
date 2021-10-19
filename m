Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA89C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:04 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.15356.1634673303813802065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FexTjecX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id k26so911035pfi.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A3riYlO4N2dHbRaK5gMvit4ElSqfLzMWH0gEb6EHpt0=;
        b=FexTjecXv6jUaDw6dP29ntz1u8YVRImFh0/Th3+TxaZHcc8gR1mmu9Vc0OKdtTrPmx
         PAdmV3qwoAHQ4bORh8lT1MA6Ges9pGGqxFbW14I1Y/+a32aZ1t9dcFw9OoYUDHo58cAv
         GJhguk2vsK1RlIfhzWypOx3EhjSJMt1ahAqqmjMvflgNS1FVMInMa5GyXVP9nW5w4qSp
         hitGkzDUOIYukUy88iWnSwyqfdVLeRuBcymecmUQl+IIHt6dQW/cYAEBV+wULUN4wBBJ
         iaqnRsRTLpRFyccZynT3Wg+xH1g+L0cohHrzihhTdPrcW38N7YivsRMb+OXDdeW8rAru
         mhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A3riYlO4N2dHbRaK5gMvit4ElSqfLzMWH0gEb6EHpt0=;
        b=Lx5O0kXy728RYDWrpWoA17dEWLqeVLIZuDt5g8hARJ2pw1PB7gk98KWX3XFqbRqaZ1
         KtzSfIlc7AjmFNN3UYWlV1re2VufGW/9IGlEwu3f0pna2Uv97/luFj6azor3TUu3++v9
         SutDegWqE/0XVVT8lJUfi/rVy6Asg01ezRFa9ziZ7rIMHFyLsWZglKZlkgTJyWA6nAPH
         fm6ZJ6KSywfzzygozrGeQ9Zk5NQOkuwoZ5p7UwDgArrpMy0K+mzJjcK7Z1l5OvnFSSCR
         e6VS9B38mZNw0DsygaBED4jBCxS2bd1vJaWfkbUWFbO2KlJdS7HFFiiQV4QbFYu6lyeT
         CXgQ==
X-Gm-Message-State: AOAM5327d9PArXfYJE/qgYSFCfFIeT/3RcAXjIZpp7QB+y0LUrEJldkk
	+7abt87KvXwzGWERVVLjbQc1yK4yZqGqdJT0AjM=
X-Google-Smtp-Source: 
 ABdhPJxun7QeA8Ka6HUTkFxJr6Jgyin8U0DQousV09K333G/LAQjzuSXLgTK65cw+wm105NmTP5SHg==
X-Received: by 2002:a63:f80a:: with SMTP id
 n10mr29894448pgh.303.1634673302832;
        Tue, 19 Oct 2021 12:55:02 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/38] nativesdk-pseudo: Fix to work with glibc
 2.34 systems
Date: Tue, 19 Oct 2021 09:53:34 -1000
Message-Id: 
 <b7d269c84838f646b2915e7ff66d81db0bc16b9e.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157228

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 28e8a1c6be..f36dfa589f 100644
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
 
 SRCREV = "21ff2fb690efbe57e7dd867c39aff36ab72a6ac5"
-- 
2.25.1


