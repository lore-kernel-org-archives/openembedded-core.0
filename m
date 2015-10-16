Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE8E77108
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:00:05 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so113590689pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qHyE1n0iOPZHsUy67TX1A0DT8qqjhYqXwNLJoWzXPm8=;
	b=DTi5MFZOu1cbcfRDlr64XqKBJiUs+V88FVY0AC8drXDen1Fxo064VBYee1BaaDLqZw
	kD9pWPR7SIgdltelDjBx/d2VN2f28oM8NN6vRgA+2fceASk11qLrf2bVakUqVZpzD3gG
	RGUzRgnHh8r6LM0hvEr1sMLEbcuIgc+T3kKtSVXuTVddkdfLBrZaQha+4dBvDBWvTzrO
	k4MxdnO2SaGO0HhX7DqrSFZEi/WtFQnuNd677IZz4cEjUk97250g0xvD527TY7uLe/lH
	v7EongO1n+JDpoDevVI9AKJCOMzoWK6vKMs6mG+jnVSqY5y/vQVMMTbMQvwwDWwoVvOB
	tvQQ==
X-Received: by 10.68.197.196 with SMTP id iw4mr14910973pbc.153.1444982406244; 
	Fri, 16 Oct 2015 01:00:06 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ln10sm19671535pab.29.2015.10.16.01.00.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 01:00:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 00:59:55 -0700
Message-Id: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1444982178.git.raj.khem@gmail.com>
References: <cover.1444982178.git.raj.khem@gmail.com>
Subject: [PATCH 1/9] rpcbind: Fix build with uclibc
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:08 -0000

The 0001-uclibc-nss.patch has been applied upstream
in a bit different way but solves the issue at hand

Change-Id: I7312d109d01c08338d4673383e2eaccee219b7bd
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpcbind/rpcbind/0001-uclibc-nss.patch          | 30 ----------------------
 meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     |  2 --
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
deleted file mode 100644
index afa55f3..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Pending
-
-From b8f0d7b7318ba344c25785d6f5cf3f8de98012d4 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Tue, 2 Feb 2010 09:36:03 +0000
-Subject: [PATCH 1/2] uclibc-nss
-
----
- src/rpcbind.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/src/rpcbind.c b/src/rpcbind.c
-index 525ffba..1fe1a60 100644
---- a/src/rpcbind.c
-+++ b/src/rpcbind.c
-@@ -67,7 +67,11 @@
- #include <pwd.h>
- #include <string.h>
- #include <errno.h>
-+#if defined(__UCLIBC__)
-+#define __nss_configure_lookup(x,y)
-+#else
- #include <nss.h>
-+#endif
- #include "config.h"
- #include "rpcbind.h"
- 
--- 
-1.6.6.1
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
index 3336021..237018b 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
@@ -22,8 +22,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
           "
 MUSLPATCHES_libc-musl = "file://musl-sunrpc.patch"
 
-UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
-                            "
 UCLIBCPATCHES ?= ""
 MUSLPATCHES ?= ""
 
-- 
2.6.1


