Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC0278421
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 02:40:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w152eSUb029854
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Feb 2018 18:40:28 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Sun, 4 Feb 2018 18:40:25 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Feb 2018 10:41:04 +0800
Message-ID: <fdad56afc0b04ea511507234935c6029303902b5.1517798422.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517798422.git.liezhi.yang@windriver.com>
References: <cover.1517798422.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] nfs-utils: 2.1.1 -> 2.3.1
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
X-List-Received-Date: Mon, 05 Feb 2018 02:40:27 -0000
Content-Type: text/plain

* Remove 0001-configure-Allow-to-explicitly-disable-nfsidmap.patch, now the
  nfsidmap can't be disabled when nfsv4 is enabled, and nfsidmap requires
  keyutils, so we have to disable nfsv4 by default since keyutils is not
  available in oe-core, or we can add it oe-core.

* Drop nfs-utils-1.2.3-sm-notify-res_init.patch and
  0001-include-stdint.h-for-UINT16_MAX-definition.patch which are already in the
  source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...gure-Allow-to-explicitly-disable-nfsidmap.patch | 43 ----------------------
 ...nclude-stdint.h-for-UINT16_MAX-definition.patch | 27 --------------
 .../nfs-utils-1.2.3-sm-notify-res_init.patch       | 36 ------------------
 .../{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb}     |  9 ++---
 4 files changed, 3 insertions(+), 112 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb} (92%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
deleted file mode 100644
index 7025fb5..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 9b84cff305866abd150cf1a4c6e7e5ebf8a7eb3a Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 15 Nov 2013 23:21:35 +0100
-Subject: [PATCH] configure: Allow to explicitly disable nfsidmap
-
-* keyutils availability is autodetected and builds aren't reproducible
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index bf433d6..28a8f62 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -69,6 +69,12 @@ AC_ARG_ENABLE(nfsv4,
- 	AC_SUBST(enable_nfsv4)
- 	AM_CONDITIONAL(CONFIG_NFSV4, [test "$enable_nfsv4" = "yes"])
- 
-+AC_ARG_ENABLE(nfsidmap,
-+        [AC_HELP_STRING([--enable-nfsidmap],
-+                        [enable support for NFSv4 idmapper @<:@default=yes@:>@])],
-+        enable_nfsidmap=$enableval,
-+        enable_nfsidmap=yes)
-+
- AC_ARG_ENABLE(nfsv41,
- 	[AC_HELP_STRING([--enable-nfsv41],
-                         [enable support for NFSv41 @<:@default=yes@:>@])],
-@@ -296,7 +302,7 @@ fi
- 
- dnl enable nfsidmap when its support by libnfsidmap
- AM_CONDITIONAL(CONFIG_NFSDCLTRACK, [test "$enable_nfsdcltrack" = "yes" ])
--AM_CONDITIONAL(CONFIG_NFSIDMAP, [test "$ac_cv_header_keyutils_h$ac_cv_lib_nfsidmap_nfs4_owner_to_uid" = "yesyes"])
-+AM_CONDITIONAL(CONFIG_NFSIDMAP, [test "$enable_nfsidmap$ac_cv_header_keyutils_h$ac_cv_lib_nfsidmap_nfs4_owner_to_uid" = "yesyesyes"])
- 
- 
- if test "$knfsd_cv_glibc2" = no; then
--- 
-1.8.4.3
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
deleted file mode 100644
index 235a2c7..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 36b48057bce76dced335d67a2894a420967811c9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 20 May 2017 14:07:53 -0700
-Subject: [PATCH] include stdint.h for UINT16_MAX definition
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- support/nsm/rpc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/nsm/rpc.c b/support/nsm/rpc.c
-index 4e5f40e..d91c6ea 100644
---- a/support/nsm/rpc.c
-+++ b/support/nsm/rpc.c
-@@ -40,6 +40,7 @@
- 
- #include <time.h>
- #include <stdbool.h>
-+#include <stdint.h>
- #include <string.h>
- #include <unistd.h>
- #include <fcntl.h>
--- 
-2.13.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
deleted file mode 100644
index d8f8181..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fixes errors like
-sm-notify[1070]: DNS resolution of a.b.c.d..com failed; retrying later
-This error will occur anytime sm-notify is run before the network if fully up,
-which is happening more and more with parallel startup systems.
-The res_init() call is simple, safe, quick, and a patch to use it should be
-able to go upstream.  Presumably the whole reason sm-notify tries several
-times is to wait for possible changes to the network configuration, but without
-calling res_init() it will never be aware of those changes
-
-Backported drom Fedora
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-
-diff -up nfs-utils-1.2.3/utils/statd/sm-notify.c.orig nfs-utils-1.2.3/utils/statd/sm-notify.c
---- nfs-utils-1.2.3/utils/statd/sm-notify.c.orig	2010-09-28 08:24:16.000000000 -0400
-+++ nfs-utils-1.2.3/utils/statd/sm-notify.c	2010-10-15 16:44:43.487119601 -0400
-@@ -28,6 +28,9 @@
- #include <netdb.h>
- #include <errno.h>
- #include <grp.h>
-+#include <netinet/in.h>
-+#include <arpa/nameser.h>
-+#include <resolv.h>
- 
- #include "sockaddr.h"
- #include "xlog.h"
-@@ -84,6 +87,7 @@ smn_lookup(const char *name)
- 	};
- 	int error;
- 
-+	res_init();
- 	error = getaddrinfo(name, NULL, &hint, &ai);
- 	if (error != 0) {
- 		xlog(D_GENERAL, "getaddrinfo(3): %s", gai_strerror(error));
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
similarity index 92%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
index 79453ad..c1c626a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
@@ -19,8 +19,6 @@ USERADD_PARAM_${PN}-client = "--system  --home-dir /var/lib/nfs \
 			      --shell /bin/false --user-group rpcuser"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
-           file://0001-configure-Allow-to-explicitly-disable-nfsidmap.patch \
-           file://nfs-utils-1.2.3-sm-notify-res_init.patch \
            file://nfsserver \
            file://nfscommon \
            file://nfs-utils.conf \
@@ -31,11 +29,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
-           file://0001-include-stdint.h-for-UINT16_MAX-definition.patch \
 "
 
-SRC_URI[md5sum] = "59dfcb2e6254b129f901f40c86086b13"
-SRC_URI[sha256sum] = "0faeb54c70b84e6bd3b9b6901544b1f6add8d246f35c1683e402daf4e0c719ef"
+SRC_URI[md5sum] = "d77b182a9ee396aa6221ac2401ad7046"
+SRC_URI[sha256sum] = "96d06b5a86b185815760d8f04c34fdface8fa8b9949ff256ac05c3ebc08335a5"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -67,10 +64,10 @@ PACKAGECONFIG ??= "tcp-wrappers \
 "
 PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
-PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # libdevmapper is available in meta-oe
 PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper"
+PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
 
-- 
2.7.4


