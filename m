Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1U1YYA-0006AH-Ah
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Feb 2013 09:34:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r128IQfV005609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Feb 2013 00:18:27 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sat, 2 Feb 2013 00:18:26 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Feb 2013 16:18:22 +0800
Message-ID: <ed93d87cb93c110cb897b45e53c84a660898f7bc.1359791689.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359791689.git.rongqing.li@windriver.com>
References: <cover.1359791689.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tcp-wrappers: remove size_t.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Feb 2013 08:34:29 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. it introduces bug in 64bit big endian process with __GLIBC__, At that
condition, size_t is 8byte, and the third parameter of getpeername is
socklen_t which is 4 byte. As a result, getpeername sees third parameter
is always 0, and can not return right value.

The similar program is below, the output is 0, not 9 on PPC64 cpu
	main()
	{
		long aa=9;
		printf("%d \n", *((int *)&aa));
	}

2. The correct fix is to change getpeername/getsockopt/recvfrom.. last
parameter type from int to socklen_t, but to simplify, we can remove
size_t.patch, since the size of int is same as socklen_t in 32bit/64bit
cpu. and size_t.patch only change three places, there are other places
which uses int, and work well.

2. Fedora, redhat el4 do not use this patch, but Debian uses it, does not
find why this patch is written, maybe it is gcc legency issue which does
not exist.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |   44 --------------------
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    3 +-
 2 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
deleted file mode 100644
index 8373e8a..0000000
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-
-diff -ruN tcp_wrappers_7.6.orig/fix_options.c tcp_wrappers_7.6/fix_options.c
---- tcp_wrappers_7.6.orig/fix_options.c	2003-08-21 03:41:33.000000000 +0200
-+++ tcp_wrappers_7.6/fix_options.c	2003-08-21 03:41:27.000000000 +0200
-@@ -38,7 +38,11 @@
- #ifdef IP_OPTIONS
-     unsigned char optbuf[BUFFER_SIZE / 3], *cp;
-     char    lbuf[BUFFER_SIZE], *lp;
-+#ifdef __GLIBC__
-+    size_t  optsize = sizeof(optbuf), ipproto;
-+#else
-     int     optsize = sizeof(optbuf), ipproto;
-+#endif
-     struct protoent *ip;
-     int     fd = request->fd;
-     unsigned int opt;
-diff -ruN tcp_wrappers_7.6.orig/socket.c tcp_wrappers_7.6/socket.c
---- tcp_wrappers_7.6.orig/socket.c	2003-08-21 03:41:33.000000000 +0200
-+++ tcp_wrappers_7.6/socket.c	2003-08-21 03:40:51.000000000 +0200
-@@ -90,7 +90,11 @@
-     static struct sockaddr_in client;
-     static struct sockaddr_in server;
- #endif
-+#ifdef __GLIBC__
-+    size_t  len;
-+#else
-     int     len;
-+#endif
-     char    buf[BUFSIZ];
-     int     fd = request->fd;
- 
-@@ -421,7 +425,11 @@
- #else
-     struct sockaddr_in sin;
- #endif
-+#ifdef __GLIBC__
-+    size_t  size = sizeof(sin);
-+#else
-     int     size = sizeof(sin);
-+#endif
- 
-     /*
-      * Eat up the not-yet received datagram. Some systems insist on a
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 9b865ba..51ec7b2 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-PR ="r9"
+PR ="r10"
 
 
 PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev ${PN} ${PN}-doc"
@@ -36,7 +36,6 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://safe_finger.patch \
            file://sig_fix.patch \
            file://siglongjmp.patch \
-           file://size_t.patch \
            file://tcpdchk_libwrapped.patch \
            file://ldflags.patch \
            \
-- 
1.7.10.4



