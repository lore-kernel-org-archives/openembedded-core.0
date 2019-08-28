Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7944F7EC43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 10:39:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7SAdQDw004412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 03:39:26 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 28 Aug 2019 03:39:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2019 19:04:57 +0800
Message-ID: <14efb2c62adc9bfc04482294fdbc7a6ec972f880.1566990265.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1566990265.git.liezhi.yang@windriver.com>
References: <cover.1566990265.git.liezhi.yang@windriver.com>
Subject: [PATCH 2/2] nfs-utils: 2.3.3 -> 2.4.1
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
X-List-Received-Date: Wed, 28 Aug 2019 10:39:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

- Remove 0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch, the new api
  can check the pointer before free it.

- Rmove 0001-makefile.am-update-the-path-of-libnfs.a.patch, it is already in
  the source.

- Rmove nfs-utils-musl-limits.patch, it is already fixed.

-  Rebased the following patches:
   0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
   0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch
   bugfix-adjust-statd-service-name.patch
   nfs-utils-musl-res_querydomain.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-Do-not-pass-null-pointer-to-freeaddrinfo.patch |  32 -----
 ...le.am-fix-undefined-function-for-libnsm.a.patch |  22 ++--
 ...1-Makefile.am-update-the-path-of-libnfs.a.patch |  50 --------
 ...re.ac-Do-not-fatalize-Wmissing-prototypes.patch |   9 +-
 .../bugfix-adjust-statd-service-name.patch         |  30 +++--
 .../nfs-utils/nfs-utils-musl-limits.patch          | 133 ---------------------
 .../nfs-utils/nfs-utils-musl-res_querydomain.patch |  23 +---
 .../{nfs-utils_2.3.3.bb => nfs-utils_2.4.1.bb}     |  10 +-
 8 files changed, 41 insertions(+), 268 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-update-the-path-of-libnfs.a.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.3.3.bb => nfs-utils_2.4.1.bb} (92%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch
deleted file mode 100644
index a44d1bf..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4f115fc314646500f7b4178d7248a02654c7cd10 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Nov 2018 16:47:57 -0800
-Subject: [PATCH] Do not pass null pointer to freeaddrinfo()
-
-Passing null pointer as input parameter to freeaddrinfo() is undefined
-behaviour, some libcs e.g. glibc might just call free() which does
-accept null pointer but other libcs e.g. musl might not and instead
-cause the program to segfault. Therefore do not rely on undefined
-behaviour instead make it deterministic
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- support/export/client.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: nfs-utils-2.3.2/support/export/client.c
-===================================================================
---- nfs-utils-2.3.2.orig/support/export/client.c
-+++ nfs-utils-2.3.2/support/export/client.c
-@@ -309,7 +309,8 @@ client_lookup(char *hname, int canonical
- 		init_addrlist(clp, ai);
- 
- out:
--	freeaddrinfo(ai);
-+	if (ai)
-+		freeaddrinfo(ai);
- 	return clp;
- }
- 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
index aa551eb..fcb0e99 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
@@ -22,25 +22,28 @@ so rename ../support/misc/file.c to ../support/misc/misc.c.
 Upstream-Status: Submitted[https://marc.info/?l=linux-nfs&m=154502780423058&w=2]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+
+Rebase it.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
  support/misc/Makefile.am |   2 +-
- support/misc/file.c      | 111 -----------------------------------------------
- support/misc/misc.c      | 111 +++++++++++++++++++++++++++++++++++++++++++++++
+ support/misc/file.c      | 111 ---------------------------------------------------------------------------------------------------------------
+ support/misc/misc.c      | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  support/nsm/Makefile.am  |   2 +-
  4 files changed, 113 insertions(+), 113 deletions(-)
- delete mode 100644 support/misc/file.c
- create mode 100644 support/misc/misc.c
 
 diff --git a/support/misc/Makefile.am b/support/misc/Makefile.am
-index 8936b0d..d4c1f76 100644
+index f9993e3..8b0e9db 100644
 --- a/support/misc/Makefile.am
 +++ b/support/misc/Makefile.am
-@@ -1,6 +1,6 @@
+@@ -1,7 +1,7 @@
  ## Process this file with automake to produce Makefile.in
  
  noinst_LIBRARIES = libmisc.a
--libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c file.c
-+libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c misc.c
+-libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c file.c \
++libmisc_a_SOURCES = tcpwrapper.c from_local.c mountpoint.c misc.c \
+ 		    nfsd_path.c workqueue.c xstat.c
  
  MAINTAINERCLEANFILES = Makefile.in
 diff --git a/support/misc/file.c b/support/misc/file.c
@@ -290,6 +293,3 @@ index 8f5874e..68f1a46 100644
  
  BUILT_SOURCES = $(GENFILES)
  
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-update-the-path-of-libnfs.a.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-update-the-path-of-libnfs.a.patch
deleted file mode 100644
index 906ac0f..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-update-the-path-of-libnfs.a.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From fcece65d1b713eaeef41706898440302f8ce92d9 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Thu, 12 Jul 2018 15:19:41 +0800
-Subject: [PATCH] Makefile.am: update the path of libnfs.a
-
-The libnfs.a is under ../support/nfs/.libs/ now,
-update the reference path accordingly to fix below
-build error when run "make -C tests statdb_dump":
-| make: *** No rule to make target '../support/nfs/libnfs.a', needed by 'statdb_dump'.  Stop.
-
-And below error when run "make -C tests/nsm_client nsm_client"
-| make: *** No rule to make target '../../support/nfs/libnfs.a', needed by 'nsm_client'.  Stop.
-
-Upstream-Status: Submitted[https://marc.info/?l=linux-nfs&m=154502636522745&w=2]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- tests/Makefile.am            | 2 +-
- tests/nsm_client/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 1f96264..74aa629 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -3,7 +3,7 @@
- check_PROGRAMS = statdb_dump
- statdb_dump_SOURCES = statdb_dump.c
- 
--statdb_dump_LDADD = ../support/nfs/libnfs.a \
-+statdb_dump_LDADD = ../support/nfs/.libs/libnfs.a \
- 		    ../support/nsm/libnsm.a $(LIBCAP)
- 
- SUBDIRS = nsm_client
-diff --git a/tests/nsm_client/Makefile.am b/tests/nsm_client/Makefile.am
-index a8fc131..43db9c2 100644
---- a/tests/nsm_client/Makefile.am
-+++ b/tests/nsm_client/Makefile.am
-@@ -13,7 +13,7 @@ check_PROGRAMS	= nsm_client
- nsm_client_SOURCES = $(GENFILES) nsm_client.c
- 
- BUILT_SOURCES = $(GENFILES)
--nsm_client_LDADD = ../../support/nfs/libnfs.a \
-+nsm_client_LDADD = ../../support/nfs/.libs/libnfs.a \
- 		   ../../support/nsm/libnsm.a $(LIBCAP) $(LIBTIRPC)
- 
- if CONFIG_RPCGEN
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch
index 17aabb9..d14f078 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch
@@ -26,18 +26,15 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e82ff14..d0cc5d5 100644
+index 50002b4..aebff01 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -548,7 +548,7 @@ my_am_cflags="\
+@@ -582,7 +582,7 @@ my_am_cflags="\
   -Wall \
   -Wextra \
-  -Werror=strict-prototypes \
+  $rpcgen_cflags \
 - -Werror=missing-prototypes \
 + -Wmissing-prototypes \
   -Werror=missing-declarations \
   -Werror=format=2 \
   -Werror=undef \
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
index 822939f..f13d7b3 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
@@ -12,20 +12,28 @@ instead but forgot to update the mount.nfs helper 'start-statd' accordingly.
 Upstream-Status: Inappropriate [other]
 
 Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
+
+Rebase it.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- utils/statd/start-statd | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ utils/statd/start-statd | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: nfs-utils-2.1.1/utils/statd/start-statd
-===================================================================
---- nfs-utils-2.1.1.orig/utils/statd/start-statd
-+++ nfs-utils-2.1.1/utils/statd/start-statd
-@@ -28,7 +28,7 @@ fi
+diff --git a/utils/statd/start-statd b/utils/statd/start-statd
+index af5c950..df9b9be 100755
+--- a/utils/statd/start-statd
++++ b/utils/statd/start-statd
+@@ -28,10 +28,10 @@ fi
  # First try systemd if it's installed.
  if [ -d /run/systemd/system ]; then
      # Quit only if the call worked.
--    systemctl start rpc-statd.service && exit
-+    systemctl start nfs-statd.service && exit
+-    if systemctl start rpc-statd.service; then
++    if systemctl start nfs-statd.service; then
+         # Ensure systemd knows not to stop rpc.statd or its dependencies
+         # on 'systemctl isolate ..'
+-        systemctl add-wants --runtime remote-fs.target rpc-statd.service
++        systemctl add-wants --runtime remote-fs.target nfs-statd.service
+         exit 0
+     fi
  fi
- 
- cd /
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch
deleted file mode 100644
index 25ca415..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-Fixed:
-| file.c: In function 'generic_make_pathname':
-| file.c:48:13: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'RAND_MAX'?
-|   if (size > PATH_MAX)
-|              ^~~~~~~~
-[snip]
-
-Upstream-Status: Pending [https://git.alpinelinux.org/cgit/aports/tree/main/nfs-utils/limits.patch?id=f6734a77d3caee73325f8cc1f77d1b5117a75096]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- support/export/export.c          | 1 +
- support/export/xtab.c            | 1 +
- support/misc/file.c              | 1 +
- support/nfs/xcommon.c            | 1 +
- support/nsm/file.c               | 1 +
- utils/blkmapd/device-discovery.c | 1 +
- utils/gssd/krb5_util.c           | 1 +
- utils/mountd/cache.c             | 1 +
- utils/mountd/mountd.c            | 1 +
- utils/mountd/rmtab.c             | 1 +
- 10 files changed, 10 insertions(+)
-
-diff --git a/support/export/export.c b/support/export/export.c
---- a/support/export/export.c
-+++ b/support/export/export.c
-@@ -17,6 +17,7 @@
- #include <stdlib.h>
- #include <dirent.h>
- #include <errno.h>
-+#include <limits.h>
- #include "xmalloc.h"
- #include "nfslib.h"
- #include "exportfs.h"
-diff --git a/support/export/xtab.c b/support/export/xtab.c
---- a/support/export/xtab.c
-+++ b/support/export/xtab.c
-@@ -18,6 +18,7 @@
- #include <sys/stat.h>
- #include <errno.h>
- #include <libgen.h>
-+#include <limits.h>
- 
- #include "nfslib.h"
- #include "exportfs.h"
-diff --git a/support/misc/file.c b/support/misc/file.c
---- a/support/misc/file.c
-+++ b/support/misc/file.c
-@@ -27,6 +27,7 @@
- #include <dirent.h>
- #include <stdlib.h>
- #include <stdbool.h>
-+#include <limits.h>
- 
- #include "xlog.h"
- #include "misc.h"
-diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
---- a/support/nfs/xcommon.c
-+++ b/support/nfs/xcommon.c
-@@ -16,6 +16,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <limits.h>
- 
- #include "xcommon.h"
- #include "nls.h"	/* _() */
-diff --git a/support/nsm/file.c b/support/nsm/file.c
---- a/support/nsm/file.c
-+++ b/support/nsm/file.c
-@@ -85,6 +85,7 @@
- #include <fcntl.h>
- #include <dirent.h>
- #include <grp.h>
-+#include <limits.h>
- 
- #include "xlog.h"
- #include "nsm.h"
-diff --git a/utils/blkmapd/device-discovery.c b/utils/blkmapd/device-discovery.c
---- a/utils/blkmapd/device-discovery.c
-+++ b/utils/blkmapd/device-discovery.c
-@@ -49,6 +49,7 @@
- #include <unistd.h>
- #include <libgen.h>
- #include <errno.h>
-+#include <limits.h>
- #include <libdevmapper.h>
- 
- #ifdef HAVE_CONFIG_H
-diff --git a/utils/gssd/krb5_util.c b/utils/gssd/krb5_util.c
---- a/utils/gssd/krb5_util.c
-+++ b/utils/gssd/krb5_util.c
-@@ -120,6 +120,7 @@
- #endif
- #include <krb5.h>
- #include <rpc/auth_gss.h>
-+#include <limits.h>
- 
- #include "gssd.h"
- #include "err_util.h"
-diff --git a/utils/mountd/cache.c b/utils/mountd/cache.c
---- a/utils/mountd/cache.c
-+++ b/utils/mountd/cache.c
-@@ -26,6 +26,7 @@
- #include <pwd.h>
- #include <grp.h>
- #include <mntent.h>
-+#include <limits.h>
- #include "misc.h"
- #include "nfslib.h"
- #include "exportfs.h"
-diff --git a/utils/mountd/mountd.c b/utils/mountd/mountd.c
---- a/utils/mountd/mountd.c
-+++ b/utils/mountd/mountd.c
-@@ -22,6 +22,7 @@
- #include <fcntl.h>
- #include <sys/resource.h>
- #include <sys/wait.h>
-+#include <limits.h>
- 
- #include "conffile.h"
- #include "xmalloc.h"
-diff --git a/utils/mountd/rmtab.c b/utils/mountd/rmtab.c
---- a/utils/mountd/rmtab.c
-+++ b/utils/mountd/rmtab.c
-@@ -16,6 +16,7 @@
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <netdb.h>
-+#include <limits.h>
- 
- #include "misc.h"
- #include "exportfs.h"
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
index 22002fa..921f5ed 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
@@ -11,30 +11,19 @@ Upstream-Status: Pending [https://github.com/alpinelinux/aports/blob/master/main
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
 ---
- configure.ac | 13 ++++++-------
- 1 file changed, 6 insertions(+), 7 deletions(-)
+ configure.ac | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 276dec3..760238b 100644
+index 50002b4..dcadb23 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -408,7 +408,7 @@ if test "$enable_gss" = yes; then
- fi
- 
- dnl libdnsidmap specific checks
--AC_CHECK_LIB([resolv], [__res_querydomain], , AC_MSG_ERROR(res_querydomain needed))
-+AC_CHECK_LIB([resolv], [res_querydomain], , AC_MSG_ERROR(res_querydomain needed))
- 
- AC_ARG_ENABLE([ldap],
- 	[AS_HELP_STRING([--disable-ldap],[Disable support for LDAP @<:default=detect@:>@])])
-@@ -547,11 +547,11 @@ my_am_cflags="\
-  -pipe \
+@@ -582,10 +582,10 @@ my_am_cflags="\
   -Wall \
   -Wextra \
-- -Werror=strict-prototypes \
+  $rpcgen_cflags \
 - -Werror=missing-prototypes \
 - -Werror=missing-declarations \
-+ -Wstrict-prototypes \
 + -Wmissing-prototypes \
 + -Wmissing-declarations \
   -Werror=format=2 \
@@ -43,7 +32,7 @@ index 276dec3..760238b 100644
   -Werror=missing-include-dirs \
   -Werror=strict-aliasing=2 \
   -Werror=init-self \
-@@ -579,10 +579,9 @@ AC_DEFUN([CHECK_CCSUPPORT], [
+@@ -614,10 +614,9 @@ AC_DEFUN([CHECK_CCSUPPORT], [
  
  CHECK_CCSUPPORT([-Werror=format-overflow=2], [flg1])
  CHECK_CCSUPPORT([-Werror=int-conversion], [flg2])
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
similarity index 92%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
index 28f9898..8b673c8 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.1.bb
@@ -28,19 +28,16 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://proc-fs-nfsd.mount \
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
-           file://nfs-utils-musl-limits.patch \
            file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
-           file://0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch \
            file://clang-format-string.patch \
-           file://0001-Makefile.am-update-the-path-of-libnfs.a.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
 "
 SRC_URI_append_libc-glibc = " file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch"
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
 
-SRC_URI[md5sum] = "b6c9c032995af1c08fea9fbcc1ce33e9"
-SRC_URI[sha256sum] = "f68b34793831b05f1fd5760d6bdec92772c7684177586a99a61e7b444f336322"
+SRC_URI[md5sum] = "161efe469ec1b06f1c750bd87f8ba6dd"
+SRC_URI[sha256sum] = "85274ada94479b1beba9f8eeffd19f477c53a6710b9998d1192c807854087736"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -108,9 +105,6 @@ FILES_${PN} += "${systemd_unitdir}"
 do_configure_prepend() {
         sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
             ${S}/utils/mount/Makefile.am
-
-        sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
-            ${S}/utils/osd_login/Makefile.am
 }
 
 # Make clean needed because the package comes with
-- 
2.7.4


