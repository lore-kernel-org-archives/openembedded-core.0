Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E211178AC3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 04:02:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6342AC4001145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2018 21:02:10 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Mon, 2 Jul 2018 21:02:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jul 2018 12:11:56 +0800
Message-ID: <3a2e74ca70ef870734858b159cd38ee2443067ed.1530591075.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530591075.git.liezhi.yang@windriver.com>
References: <cover.1530591075.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] nfs-utils: 2.1.1 -> 2.3.1
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
X-List-Received-Date: Tue, 03 Jul 2018 04:02:09 -0000
Content-Type: text/plain

* Removed 001-configure-Allow-to-explicitly-disable-nfsidmap.patch,
  the nfsidmap is enabled when --enable-nfsv4, so I added a
  PACKAGECONFIG[nfsv4], and default is no since keyutils is not in oe-core by
  default.

* Removed 0001-include-stdint.h-for-UINT16_MAX-definition.patch and
  nfs-utils-1.2.3-sm-notify-res_init.patch since they are already in the
  source.

* Backported two patches from git://git.alpinelinux.org/aports to fix build with musl

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...gure-Allow-to-explicitly-disable-nfsidmap.patch |  40 -------
 ...nclude-stdint.h-for-UINT16_MAX-definition.patch |  27 -----
 .../nfs-utils-1.2.3-sm-notify-res_init.patch       |  37 ------
 .../nfs-utils/nfs-utils-musl-limits.patch          | 133 +++++++++++++++++++++
 .../nfs-utils/nfs-utils-musl-res_querydomain.patch |  22 ++++
 .../{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb}     |  12 +-
 6 files changed, 161 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb} (92%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
deleted file mode 100644
index 26b558c..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
+++ /dev/null
@@ -1,40 +0,0 @@
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
-Index: nfs-utils-2.1.1/configure.ac
-===================================================================
---- nfs-utils-2.1.1.orig/configure.ac
-+++ nfs-utils-2.1.1/configure.ac
-@@ -92,6 +92,12 @@ AC_ARG_ENABLE(nfsv4,
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
- 	[AC_HELP_STRING([--disable-nfsv41],
-                         [disable support for NFSv41 @<:@default=no@:>@])],
-@@ -339,7 +345,7 @@ fi
- 
- dnl enable nfsidmap when its support by libnfsidmap
- AM_CONDITIONAL(CONFIG_NFSDCLTRACK, [test "$enable_nfsdcltrack" = "yes" ])
--AM_CONDITIONAL(CONFIG_NFSIDMAP, [test "$ac_cv_header_keyutils_h$ac_cv_lib_nfsidmap_nfs4_owner_to_uid" = "yesyes"])
-+AM_CONDITIONAL(CONFIG_NFSIDMAP, [test "$enable_nfsidmap$ac_cv_header_keyutils_h$ac_cv_lib_nfsidmap_nfs4_owner_to_uid" = "yesyesyes"])
- 
- 
- if test "$knfsd_cv_glibc2" = no; then
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
index 89a8a57..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
+++ /dev/null
@@ -1,37 +0,0 @@
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
-Index: nfs-utils-2.1.1/utils/statd/sm-notify.c
-===================================================================
---- nfs-utils-2.1.1.orig/utils/statd/sm-notify.c
-+++ nfs-utils-2.1.1/utils/statd/sm-notify.c
-@@ -28,6 +28,9 @@
- #include <netdb.h>
- #include <errno.h>
- #include <grp.h>
-+#include <netinet/in.h>
-+#include <arpa/nameser.h>
-+#include <resolv.h>
- 
- #include "conffile.h"
- #include "sockaddr.h"
-@@ -89,6 +92,7 @@ smn_lookup(const char *name)
- 	};
- 	int error;
- 
-+	res_init();
- 	error = getaddrinfo(name, NULL, &hint, &ai);
- 	if (error != 0) {
- 		xlog(D_GENERAL, "getaddrinfo(3): %s", gai_strerror(error));
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch
new file mode 100644
index 0000000..7a4604b
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch
@@ -0,0 +1,133 @@
+Fixed:
+| file.c: In function 'generic_make_pathname':
+| file.c:48:13: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'RAND_MAX'?
+|   if (size > PATH_MAX)
+|              ^~~~~~~~
+[snip]
+
+Upstream-Status: Backport [https://git.alpinelinux.org/cgit/aports/tree/main/nfs-utils/limits.patch?id=f6734a77d3caee73325f8cc1f77d1b5117a75096]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ support/export/export.c          | 1 +
+ support/export/xtab.c            | 1 +
+ support/misc/file.c              | 1 +
+ support/nfs/xcommon.c            | 1 +
+ support/nsm/file.c               | 1 +
+ utils/blkmapd/device-discovery.c | 1 +
+ utils/gssd/krb5_util.c           | 1 +
+ utils/mountd/cache.c             | 1 +
+ utils/mountd/mountd.c            | 1 +
+ utils/mountd/rmtab.c             | 1 +
+ 10 files changed, 10 insertions(+)
+
+diff --git a/support/export/export.c b/support/export/export.c
+--- a/support/export/export.c
++++ b/support/export/export.c
+@@ -17,6 +17,7 @@
+ #include <stdlib.h>
+ #include <dirent.h>
+ #include <errno.h>
++#include <limits.h>
+ #include "xmalloc.h"
+ #include "nfslib.h"
+ #include "exportfs.h"
+diff --git a/support/export/xtab.c b/support/export/xtab.c
+--- a/support/export/xtab.c
++++ b/support/export/xtab.c
+@@ -18,6 +18,7 @@
+ #include <sys/stat.h>
+ #include <errno.h>
+ #include <libgen.h>
++#include <limits.h>
+ 
+ #include "nfslib.h"
+ #include "exportfs.h"
+diff --git a/support/misc/file.c b/support/misc/file.c
+--- a/support/misc/file.c
++++ b/support/misc/file.c
+@@ -27,6 +27,7 @@
+ #include <dirent.h>
+ #include <stdlib.h>
+ #include <stdbool.h>
++#include <limits.h>
+ 
+ #include "xlog.h"
+ #include "misc.h"
+diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
+--- a/support/nfs/xcommon.c
++++ b/support/nfs/xcommon.c
+@@ -16,6 +16,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ 
+ #include "xcommon.h"
+ #include "nls.h"	/* _() */
+diff --git a/support/nsm/file.c b/support/nsm/file.c
+--- a/support/nsm/file.c
++++ b/support/nsm/file.c
+@@ -85,6 +85,7 @@
+ #include <fcntl.h>
+ #include <dirent.h>
+ #include <grp.h>
++#include <limits.h>
+ 
+ #include "xlog.h"
+ #include "nsm.h"
+diff --git a/utils/blkmapd/device-discovery.c b/utils/blkmapd/device-discovery.c
+--- a/utils/blkmapd/device-discovery.c
++++ b/utils/blkmapd/device-discovery.c
+@@ -49,6 +49,7 @@
+ #include <unistd.h>
+ #include <libgen.h>
+ #include <errno.h>
++#include <limits.h>
+ #include <libdevmapper.h>
+ 
+ #ifdef HAVE_CONFIG_H
+diff --git a/utils/gssd/krb5_util.c b/utils/gssd/krb5_util.c
+--- a/utils/gssd/krb5_util.c
++++ b/utils/gssd/krb5_util.c
+@@ -120,6 +120,7 @@
+ #endif
+ #include <krb5.h>
+ #include <rpc/auth_gss.h>
++#include <limits.h>
+ 
+ #include "gssd.h"
+ #include "err_util.h"
+diff --git a/utils/mountd/cache.c b/utils/mountd/cache.c
+--- a/utils/mountd/cache.c
++++ b/utils/mountd/cache.c
+@@ -26,6 +26,7 @@
+ #include <pwd.h>
+ #include <grp.h>
+ #include <mntent.h>
++#include <limits.h>
+ #include "misc.h"
+ #include "nfslib.h"
+ #include "exportfs.h"
+diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
+--- a/utils/mountd/mountd.c
++++ b/utils/mountd/mountd.c
+@@ -22,6 +22,7 @@
+ #include <fcntl.h>
+ #include <sys/resource.h>
+ #include <sys/wait.h>
++#include <limits.h>
+ 
+ #include "conffile.h"
+ #include "xmalloc.h"
+diff --git a/utils/mountd/rmtab.c b/utils/mountd/rmtab.c
+--- a/utils/mountd/rmtab.c
++++ b/utils/mountd/rmtab.c
+@@ -16,6 +16,7 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <netdb.h>
++#include <limits.h>
+ 
+ #include "misc.h"
+ #include "exportfs.h"
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
new file mode 100644
index 0000000..7a93450
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
@@ -0,0 +1,22 @@
+Fixed:
+configure: error: res_querydomain needed
+
+Upstream-Status: Backport [https://git.alpinelinux.org/cgit/aports/tree/main/nfs-utils/musl-res_querydomain.patch?id=f6734a77d3caee73325f8cc1f77d1b5117a75096]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -401,7 +401,7 @@ if test "$enable_gss" = yes; then
+ fi
+ 
+ dnl libdnsidmap specific checks
+-AC_CHECK_LIB([resolv], [__res_querydomain], , AC_MSG_ERROR(res_querydomain needed))
++AC_CHECK_LIB([resolv], [res_querydomain], , AC_MSG_ERROR(res_querydomain needed))
+ 
+ AC_ARG_ENABLE([ldap],
+ 	[AS_HELP_STRING([--disable-ldap],[Disable support for LDAP @<:default=detect@:>@])])
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
similarity index 92%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
index 79453ad..52edfb6 100644
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
@@ -31,11 +29,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
-           file://0001-include-stdint.h-for-UINT16_MAX-definition.patch \
+           file://nfs-utils-musl-res_querydomain.patch \
+           file://nfs-utils-musl-limits.patch \
 "
 
-SRC_URI[md5sum] = "59dfcb2e6254b129f901f40c86086b13"
-SRC_URI[sha256sum] = "0faeb54c70b84e6bd3b9b6901544b1f6add8d246f35c1683e402daf4e0c719ef"
+SRC_URI[md5sum] = "d77b182a9ee396aa6221ac2401ad7046"
+SRC_URI[sha256sum] = "96d06b5a86b185815760d8f04c34fdface8fa8b9949ff256ac05c3ebc08335a5"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -67,10 +66,11 @@ PACKAGECONFIG ??= "tcp-wrappers \
 "
 PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
-PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 # libdevmapper is available in meta-oe
 PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper"
+# keyutils is available in meta-security
+PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
 
-- 
2.7.4


