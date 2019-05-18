Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B6BD27D5A1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 18:05:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 455tNm1pkHz5R
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 20:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558202712;
	bh=dzV3dOFMpVzelmZCtVyqtQOqSX0MSQKZUSnmsCpxlrM=;
	h=From:To:Subject:Date:From;
	b=BoogO36GHI2BFWQJd+UWCI4of0IzfaU4XFDPXO4Z0KswiBf8S3XM3flZboOMZ6Azi
	e1QOe/spn55mxWjHe+lh3E65SWNV9X1A7Uqd+aa1SrDLvNSmcXScV2JnBnGvuJ5krZ
	yIjR7GVfbJVcFejOveYqjPUVsaOABSni+arsA5QYWO1bxUxaJ1SjjtWRZi7uQ17GU4
	nZsGbpF6XojDyMqEEth5O0s1/UU4vKOG93Z3cdvRwOdWBNMTAHReR64ZYAn/iPdO09
	zsupK5De1Z6R3mKr7O8a2oAi9DLp4/94ZQMhsf9Zcq0w9/b8yB+2kjXHzTg5aeRx+z
	XlY3OmqFjCSeeQAkLsD+ybT0IxkNp6t6NXOrVsWuB32FtJzPCEGVSbl1JRidDN12+I
	+LEu3dBTwiync436fYnSR9eGA8sRWN+YvAf2xDOJB31NS+pjOgn2IXGEzUXI9RHwo7
	Q9uHmorsdpWaH7SOYbdMHyPmdjC0esMXGZsHA7US4z9Frt4aJ7znzWJPl1c/jIM+Lh
	hgxQY16621a2CjB21t+13m8KiqZBRxT4bCDjsjNxEqxkiCWhxVGZd8iQhIi0Y1RgFa
	8oe3wt2udPSwmjhQEGhgdBrCwbEhOwUsv4kYZmHyh3zqX9MA1GHKPT2k9MuN2vMVoX
	EPGJ4T9Ocna9JZwQ/ZpI1vcI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 21:05:11 +0300
Message-Id: <20190518180511.12157-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] socat: Remove workaround for musl issue now fixed upstream
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
X-List-Received-Date: Sat, 18 May 2019 18:05:13 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...NETDB_INTERNAL-to-1-if-not-available.patch | 32 -------------------
 .../socat/socat_1.7.3.3.bb                    |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/socat/socat/0001-define-NETDB_INTERNAL-to-1-if-not-available.patch

diff --git a/meta/recipes-connectivity/socat/socat/0001-define-NETDB_INTERNAL-to-1-if-not-available.patch b/meta/recipes-connectivity/socat/socat/0001-define-NETDB_INTERNAL-to-1-if-not-available.patch
deleted file mode 100644
index 4bbd36766d..0000000000
--- a/meta/recipes-connectivity/socat/socat/0001-define-NETDB_INTERNAL-to-1-if-not-available.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e6a7d96fa3675bdd3f4d7a3d7682381789eef22f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 15 Feb 2016 20:25:34 +0000
-Subject: [PATCH] define NETDB_INTERNAL to -1 if not available
-
-helps build with musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- compat.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/compat.h b/compat.h
-index c8bee4d..bfb013a 100644
---- a/compat.h
-+++ b/compat.h
-@@ -666,6 +666,10 @@ typedef int sig_atomic_t;
- #  define NETDB_INTERNAL h_NETDB_INTERNAL
- #endif
- 
-+#if !defined(NETDB_INTERNAL)
-+#  define NETDB_INTERNAL (-1)
-+#endif
-+
- #ifndef INET_ADDRSTRLEN
- #  define INET_ADDRSTRLEN sizeof(struct sockaddr_in)
- #endif
--- 
-2.7.1
-
diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.3.bb b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
index 7a889a3801..067f7c6444 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
-           file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
 "
 
 SRC_URI[md5sum] = "b2a032a47b8b89a18485697fa975154f"
-- 
2.17.1


