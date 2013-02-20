Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <farrah.rashid@windriver.com>) id 1U8HAy-0006d6-I9
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 22:26:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1KL9o8d017646
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 13:09:50 -0800 (PST)
Received: from yow-blade1.wrs.com (128.224.137.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 20 Feb 2013 13:09:49 -0800
From: farrah rashid <farrah.rashid@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 16:09:47 -0500
Message-ID: <1361394588-30527-2-git-send-email-farrah.rashid@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
References: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] tcp-wrappers: remove size_t.patch
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
X-List-Received-Date: Wed, 20 Feb 2013 21:26:09 -0000
Content-Type: text/plain

Incorrect data type for socket calls

Signed-off-by: farrah rashid <farrah.rashid@windriver.com>
---
 .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |   44 --------------------
 1 files changed, 0 insertions(+), 44 deletions(-)
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
-- 
1.7.4.1



