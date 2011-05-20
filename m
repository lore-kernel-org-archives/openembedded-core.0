Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNDDj-0002v5-4u
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 02:05:35 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1479835pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 17:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=h6sMcD6wQy3nwtrJTLRX6k+5doQJKex2j4pwGqy13iE=;
	b=nM1dXnmbdOeITga6cBPEjeRKMwAzp/1+m/B+QRCTGDVtvkEOddBt0GLHyWs264wOgZ
	h4YjnqZZ8X9LusuGe726VkOvu1atg+PmIqXsWvPjav2BPeNJGJbFwFf7Ys9BV03Z1dFi
	d2Va7kTDvbBBJ42CXJMtCdfT7ErhVaXD0EpRA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eXP4MPYqAhOOeoBOh/781MxL+JD4ZimqVjZLYtsKEE6rK4e7ovOo/7X6dJfG8za/BV
	ePgAPyrVUNL4J+4X6nyDPju5Sw0Te8cT9jTxDFJjtLCCMMS24PjuPBIe+Jhm5kWdjPaQ
	HnqYAYcjuYvKUuwBBJ1fw8TaepYAE8KGnHEes=
Received: by 10.68.20.38 with SMTP id k6mr5885755pbe.410.1305849760883;
	Thu, 19 May 2011 17:02:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w1sm2072427pbf.1.2011.05.19.17.02.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 17:02:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 17:02:21 -0700
Message-Id: <5ac9f1e7375560518982d22bd7a6c745a559f0cb.1305849572.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <2cc9510de67bbf735856adb033c2eb352ffedc04.1305849572.git.raj.khem@gmail.com>
References: <2cc9510de67bbf735856adb033c2eb352ffedc04.1305849572.git.raj.khem@gmail.com>
In-Reply-To: <cover.1305849572.git.raj.khem@gmail.com>
References: <cover.1305849572.git.raj.khem@gmail.com>
Subject: [PATCHv3 3/3] nfs-utils_1.2.3.bb: Fix compile failure on uclibc
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
X-List-Received-Date: Fri, 20 May 2011 00:05:35 -0000

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
1.7.4.1



