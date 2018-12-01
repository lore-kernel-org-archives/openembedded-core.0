Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id D92FD6D435
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 18:14:22 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id s198so3915296pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2018 10:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5/gtk81e/XNwosmeuRAHrdvTDTK9rQDykJhOmfYi+0w=;
	b=kK4ZrBFWLNqt/Mwjd4DPPv29KNvRsmxPOn3AHD9mMdbvtwrC+dHc2qdzY62UJ4oY25
	jdS6PoGPn40yUveXJr7SOgaYkMB14Vd0GIrKwVWnwhPDTp80wqo78jQmcGYFutftQ+/G
	QwYOjeYLtO8Dshf0br2J3r4sqx+qtBN7P2UeFx9UrPbFgp8GTFqZlJ4HvrtdaAQZI6qx
	iR5ZGFJ7pUj7kCSomCh5Bdfe+mBvrQq9IhYCpTVtNI/RsLboM2OQp+HL0zwdrNOR/E36
	40qe0F3lLkznkRcjEXFdpWtWHl1tvjBVE1w1hdSnsgUi3fRmJIAhwQW2P+H0MCmUAw7S
	4ePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5/gtk81e/XNwosmeuRAHrdvTDTK9rQDykJhOmfYi+0w=;
	b=nV2wEZ/zitQsQ/CHlCpwyr6GdWQwI278tRq9yUkvRidukG2OsermWpOTwwtYZBd0dm
	oq8JZGlonLIvwO5SzBgcXQ6qPAfOYpZsMsGC41m5jW4xt3/9qt/oWjEtDWFSBcU+2Lh9
	JBAVinY8zolmrHlLcwJ0ivLYWK5FyktUBpIzGGPeddMk/jc7nS34lTMIX26P7pm8n25o
	1FIeiRngjK2YfXcJ1Uz6CcjPCX2+n3I3NmbUkR+iZFzJrG1iiQROjFZEYjJBtkzfZHzp
	zQw+7dVndBCUMnFS00RT6CoOgiXi/54FusLLPsw++8/mR6Y1CV27+UmIDJUHexHcGRUu
	oyXA==
X-Gm-Message-State: AA+aEWbgNHDr/O/t8BONnsOEl1/3xfaFlsw7Gno0SoXtjNREh5v0KvgA
	lwWhKdzIhYUCoQT04iotgJSlG0iIZDY=
X-Google-Smtp-Source: AFSGD/X2czoxjcLGaapgFxzbbyZvIVXvJ/5HSKD6ciQyyKjjozlxkbZICy4uOvy3Yz9CHgQQ1tpfqQ==
X-Received: by 2002:aa7:81d0:: with SMTP id c16mr9966401pfn.153.1543688063426; 
	Sat, 01 Dec 2018 10:14:23 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id t3sm8949728pgv.31.2018.12.01.10.14.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Dec 2018 10:14:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Dec 2018 10:12:53 -0800
Message-Id: <20181201181254.42701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH V2 1/2] nfs-utils: Upgrade to 2.3.3
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
X-List-Received-Date: Sat, 01 Dec 2018 18:14:23 -0000
Content-Transfer-Encoding: 8bit

enhance the musl-only patch to degrade certain Werros into Warnings
which helps in compiling on musl, since its checking for __GLIBC__
defines which are undefined on musl.

fix build on x32 ABI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Upgrade to 2.3.3 and fix build with x32 ABI

 ...acheio-use-intmax_t-for-formatted-IO.patch | 38 ++++++++++++++++
 .../nfs-utils-musl-res_querydomain.patch      | 43 +++++++++++++++++--
 ...{nfs-utils_2.3.1.bb => nfs-utils_2.3.3.bb} |  5 ++-
 3 files changed, 80 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-use-intmax_t-for-formatted-IO.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.3.1.bb => nfs-utils_2.3.3.bb} (96%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-use-intmax_t-for-formatted-IO.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-use-intmax_t-for-formatted-IO.patch
new file mode 100644
index 0000000000..bafff5b9c0
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-use-intmax_t-for-formatted-IO.patch
@@ -0,0 +1,38 @@
+From ac32b813f5d6f9a2de944015cf9bb98d68e0203a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 1 Dec 2018 10:02:12 -0800
+Subject: [PATCH] cacheio: use intmax_t for formatted IO
+
+time_t is not same size on x32 ABI (ILP32)
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ support/nfs/cacheio.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/support/nfs/cacheio.c b/support/nfs/cacheio.c
+index 9dc4cf1..2086a95 100644
+--- a/support/nfs/cacheio.c
++++ b/support/nfs/cacheio.c
+@@ -17,6 +17,7 @@
+ 
+ #include <nfslib.h>
+ #include <stdio.h>
++#include <inttypes.h>
+ #include <stdio_ext.h>
+ #include <string.h>
+ #include <ctype.h>
+@@ -234,7 +235,7 @@ cache_flush(int force)
+ 	    stb.st_mtime > now)
+ 		stb.st_mtime = time(0);
+ 	
+-	sprintf(stime, "%ld\n", stb.st_mtime);
++	sprintf(stime, "%jd\n", (intmax_t)stb.st_mtime);
+ 	for (c=0; cachelist[c]; c++) {
+ 		int fd;
+ 		sprintf(path, "/proc/net/rpc/%s/flush", cachelist[c]);
+-- 
+2.19.2
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
index a169e6a222..22002fadca 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
@@ -1,17 +1,24 @@
+From caa19231196d73541445728e6813c8fa70345acb Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 26 Jun 2018 15:59:00 +0800
+Subject: [PATCH] nfs-utils: 2.1.1 -> 2.3.1
+
 Fixed:
 configure: error: res_querydomain needed
 
-Upstream-Status: Pending [https://git.alpinelinux.org/cgit/aports/tree/main/nfs-utils/musl-res_querydomain.patch?id=f6734a77d3caee73325f8cc1f77d1b5117a75096]
+Upstream-Status: Pending [https://github.com/alpinelinux/aports/blob/master/main/nfs-utils/musl-configure_ac.patch]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ configure.ac | 13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
+index 276dec3..760238b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -401,7 +401,7 @@ if test "$enable_gss" = yes; then
+@@ -408,7 +408,7 @@ if test "$enable_gss" = yes; then
  fi
  
  dnl libdnsidmap specific checks
@@ -20,3 +27,31 @@ diff --git a/configure.ac b/configure.ac
  
  AC_ARG_ENABLE([ldap],
  	[AS_HELP_STRING([--disable-ldap],[Disable support for LDAP @<:default=detect@:>@])])
+@@ -547,11 +547,11 @@ my_am_cflags="\
+  -pipe \
+  -Wall \
+  -Wextra \
+- -Werror=strict-prototypes \
+- -Werror=missing-prototypes \
+- -Werror=missing-declarations \
++ -Wstrict-prototypes \
++ -Wmissing-prototypes \
++ -Wmissing-declarations \
+  -Werror=format=2 \
+- -Werror=undef \
++ -Wundef \
+  -Werror=missing-include-dirs \
+  -Werror=strict-aliasing=2 \
+  -Werror=init-self \
+@@ -579,10 +579,9 @@ AC_DEFUN([CHECK_CCSUPPORT], [
+ 
+ CHECK_CCSUPPORT([-Werror=format-overflow=2], [flg1])
+ CHECK_CCSUPPORT([-Werror=int-conversion], [flg2])
+-CHECK_CCSUPPORT([-Werror=incompatible-pointer-types], [flg3])
+ CHECK_CCSUPPORT([-Werror=misleading-indentation], [flg4])
+ 
+-AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg3 $flg4"])
++AC_SUBST([AM_CFLAGS], ["$my_am_cflags $flg1 $flg2 $flg4"])
+ 
+ # Make sure that $ACLOCAL_FLAGS are used during a rebuild
+ AC_SUBST([ACLOCAL_AMFLAGS], ["-I $ac_macro_dir \$(ACLOCAL_FLAGS)"])
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
similarity index 96%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
index 6d450c7510..35587dfb7a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
@@ -30,12 +30,13 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
            file://nfs-utils-musl-limits.patch \
+           file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
 "
 
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
 
-SRC_URI[md5sum] = "d77b182a9ee396aa6221ac2401ad7046"
-SRC_URI[sha256sum] = "96d06b5a86b185815760d8f04c34fdface8fa8b9949ff256ac05c3ebc08335a5"
+SRC_URI[md5sum] = "b6c9c032995af1c08fea9fbcc1ce33e9"
+SRC_URI[sha256sum] = "f68b34793831b05f1fd5760d6bdec92772c7684177586a99a61e7b444f336322"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.19.2


