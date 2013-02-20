Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <farrah.rashid@windriver.com>) id 1U8HAw-0006d4-EG
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 22:26:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1KL9poL013720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 13:09:51 -0800 (PST)
Received: from yow-blade1.wrs.com (128.224.137.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 20 Feb 2013 13:09:50 -0800
From: farrah rashid <farrah.rashid@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 16:09:48 -0500
Message-ID: <1361394588-30527-3-git-send-email-farrah.rashid@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
References: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tcp-wrappers: add socklen_t.patch
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

Replace incorrect size_t data type with socket length data type

Signed-off-by: farrah rashid <farrah.rashid@windriver.com>
---
 .../tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch  |   59 ++++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
new file mode 100644
index 0000000..8e46df8
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
@@ -0,0 +1,59 @@
+commit 88b6984ef0bf3b703c1c851092662b95e91db1ff
+Author: farrah rashid <farrah.rashid@windriver.com>
+Date:   Tue Feb 12 09:53:50 2013 -0500
+
+    tcp-wrappers Support for building with glibc
+    
+    Added support for socklen_t type to len argument passed to socket related
+    calls. This fixes a bug that causes tcp wrappers to fail when using sshd.
+    
+    Upstream-Status: Pending
+    
+    Signed-off-by: farrah rashid <farrah.rashid@windriver.com>
+
+diff --git a/fix_options.c b/fix_options.c
+index 7473adf..fe2b442 100644
+--- a/fix_options.c
++++ b/fix_options.c
+@@ -38,7 +38,12 @@ struct request_info *request;
+ #ifdef IP_OPTIONS
+     unsigned char optbuf[BUFFER_SIZE / 3], *cp;
+     char    lbuf[BUFFER_SIZE], *lp;
+-    int     optsize = sizeof(optbuf), ipproto;
++#ifdef __GLIBC__
++    socklen_t  optsize = sizeof(optbuf);
++#else
++    int     optsize = sizeof(optbuf);
++#endif
++    int ipproto;
+     struct protoent *ip;
+     int     fd = request->fd;
+     unsigned int opt;
+diff --git a/socket.c b/socket.c
+index 4b2c575..a0d2987 100644
+--- a/socket.c
++++ b/socket.c
+@@ -95,7 +95,11 @@ struct request_info *request;
+     static struct sockaddr_in client;
+     static struct sockaddr_in server;
+ #endif
++#ifdef __GLIBC__
++    socklen_t  len;
++#else
+     int     len;
++#endif
+     char    buf[BUFSIZ];
+     int     fd = request->fd;
+ 
+@@ -426,7 +430,11 @@ int     fd;
+ #else
+     struct sockaddr_in sin;
+ #endif
++#ifdef __GLIBC__
++    socklen_t  size = sizeof(sin);
++#else
+     int     size = sizeof(sin);
++#endif
+ 
+     /*
+      * Eat up the not-yet received datagram. Some systems insist on a
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 9b865ba..ba94008 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-PR ="r9"
+PR ="r10"
 
 
 PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev ${PN} ${PN}-doc"
@@ -36,7 +36,7 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://safe_finger.patch \
            file://sig_fix.patch \
            file://siglongjmp.patch \
-           file://size_t.patch \
+           file://socklen_t.patch \
            file://tcpdchk_libwrapped.patch \
            file://ldflags.patch \
            \
-- 
1.7.4.1



