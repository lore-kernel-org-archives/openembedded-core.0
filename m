Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNJqq-00083M-Pl
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:10:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 00:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439578061"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 00:07:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 00:06:55 -0700
Message-Id: <35eb00d66db3ac8c62bf33c71777ebe92d36ba87.1305874831.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
Subject: [PATCH 05/12] nfs-utils_1.2.3.bb: Fix compile failure on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2011 07:10:25 -0000

From: Khem Raj <raj.khem@gmail.com>

libio.h is not needed even in case of eglibc but
still the patch is uclibc specific

Refreshed nfs-utils-1.0.6-uclibc.patch against
nfs-utils_1.2.3 no code change

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   16 +++++++-----
 .../nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch |   26 ++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    1 +
 3 files changed, 36 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
index e82480a..6d46d3a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
@@ -1,20 +1,22 @@
 Upstream-Status: Inappropriate [embedded specific]
 
---- ./support/nfs/svc_socket.c.orig	2004-12-12 06:43:52.000000000 +0000
-+++ ./support/nfs/svc_socket.c	2004-12-12 06:50:04.000000000 +0000
-@@ -66,6 +66,7 @@
-   memset ((char *) &addr, sizeof (addr));
+Index: nfs-utils-1.2.3/support/nfs/svc_socket.c
+===================================================================
+--- nfs-utils-1.2.3.orig/support/nfs/svc_socket.c
++++ nfs-utils-1.2.3/support/nfs/svc_socket.c
+@@ -67,6 +67,7 @@ svc_socket (u_long number, int type, int
+   memset (&addr, 0, sizeof (addr));
    addr.sin_family = AF_INET;
  
 +#ifndef __UCLIBC__	/* neither getrpcbynumber() nor getrpcbynumber_r() is SuSv3 */
    ret = getrpcbynumber_r (number, &rpcbuf, rpcdata, sizeof rpcdata,
  			  &rpcp);
    if (ret == 0 && rpcp != NULL)
-@@ -99,6 +100,7 @@
+@@ -100,6 +101,7 @@ svc_socket (u_long number, int type, int
  	}
      }
    else
 +#endif
      {
-       if (bindresvport (sock, &addr))
- 	{
+ 	  addr.sin_port = 0;
+ 	  if (bind (sock, (struct sockaddr *) &addr, len) < 0)
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch
new file mode 100644
index 0000000..465144a
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch
@@ -0,0 +1,26 @@
+[PATCH] fix build with uClibc
+
+uClibc doesn't have/need libio.h, so don't include it from sockaddr.h
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ support/include/sockaddr.h |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+Upstream-Status: Pending
+
+Index: nfs-utils-1.2.3/support/include/sockaddr.h
+===================================================================
+--- nfs-utils-1.2.3.orig/support/include/sockaddr.h
++++ nfs-utils-1.2.3/support/include/sockaddr.h
+@@ -20,7 +20,10 @@
+ #ifndef NFS_UTILS_SOCKADDR_H
+ #define NFS_UTILS_SOCKADDR_H
+ 
++/* uClibc doesn't have/need libio.h */
++#ifndef __UCLIBC__
+ #include <libio.h>
++#endif
+ #include <stdbool.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
index b456474..d344f3d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
@@ -17,6 +17,7 @@ PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
+           file://nfs-utils-1.2.3-uclibc-libio.h.patch \
            file://nfsserver"
 
 SRC_URI[md5sum] = "1131dc5f27c4f3905a6e7ee0d594fd4d"
-- 
1.7.3.4



