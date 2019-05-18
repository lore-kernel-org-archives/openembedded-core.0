Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 106867DEA5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 17:21:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 455sQT5gmMz5R
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 19:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558200097;
	bh=QvNHzk9rsCOkhQZx3/R9vSjdgXmOBRcZx7LbH8qjMfA=;
	h=From:To:Subject:Date:From;
	b=Qt5CTkdRoQjGETXG+pN+DxfQxJbB3qGGbnBioolkv6eh6CoKGAbYtm7JUNmiqQlVg
	tN6SxCVSnetZzoAN5nHGPd2/56KQIQeQeq0I2XZk57fSQCkNPphrOShD8bc/3ZBTCZ
	1Aa2KrMTzNVcxdq/SbV/ctmdQud7uCTZOD9f6qkV82JxvQoWpxCCBxKjAdqiSMw7nz
	UPAmsa86aLAeOo6W3EtI0aMp2tInC1PxcKqJd8Dj5HVKB5MGLxUNDL0Ek2aynxkXJn
	Z/QmQrZQpj1bYjLnlugsiTpPg2Icr3+8PKBRYIvDaYhVgJP/PmZhfXFzcOv9NO3mzR
	wRFx1E96PjTUlBvDMIRclrhWLtb9xzrmEtEUaawwF9FxTVHg8Vh1bA19G9KZ3nySZZ
	bIyKXCGru9mKiS9tSZZt6Zf99CtoIwcC7ewJxCcscyv8b7iFbvN4PwHTuPogDvw/vn
	ZMikH7MgrzPXUzxh7hPFbICQUEqyV/6n5FiKOuDLwtrE2g2j3Qw2EDO7B65a9oz1M1
	ymbglPFpJXCV3JO6YkX3Z3G+m3JiSRoWOsWD7dI4G9VrpQ8+XMDxIvvSB/vJL/NDnw
	RJUOLG1SPxhwU2NqU7FcMgOFUGA+yJxpHsp3gIdMguVraeQD1U6ywEmFPO9tVS5NIB
	WTs8gU6dzMecp0KvK897pg+Y=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 20:21:35 +0300
Message-Id: <20190518172136.11368-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libnss-mdns: Stop trying to build for musl
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
X-List-Received-Date: Sat, 18 May 2019 17:21:38 -0000

There's no point in building an NSS module for a C library
that doesn't support NSS.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libnss-mdns/0001-check-for-nss.h.patch    | 56 -------------------
 .../libnss-mdns/libnss-mdns_0.10.bb           |  3 +-
 2 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch b/meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch
deleted file mode 100644
index f63eb90cdc..0000000000
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From bdf01a581d58eb5340e9238d143dbcac9db5b11c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Jan 2016 19:29:45 +0000
-Subject: [PATCH] check for nss.h
-
-nss.h may not available on all libc implementations, e.g. musl does not
-have this header, this patch detects nss.h presence and defines the data
-types that are required if nss.h is missing on platform
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac |  2 +-
- src/nss.c    | 11 +++++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index aa66bc6..ce19b07 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,7 +71,7 @@ AC_PROG_LIBTOOL
- 
- # Checks for header files.
- AC_HEADER_STDC
--AC_CHECK_HEADERS([arpa/inet.h fcntl.h inttypes.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h nss.h sys/ioctl.h])
-+AC_CHECK_HEADERS([arpa/inet.h fcntl.h inttypes.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h nss.h sys/ioctl.h nss.h])
- 
- # Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
-diff --git a/src/nss.c b/src/nss.c
-index e48e315..406733b 100644
---- a/src/nss.c
-+++ b/src/nss.c
-@@ -29,7 +29,18 @@
- #include <assert.h>
- #include <netdb.h>
- #include <sys/socket.h>
-+#ifdef HAVE_NSS_H
- #include <nss.h>
-+#else
-+enum nss_status {
-+    NSS_STATUS_TRYAGAIN = -2,
-+    NSS_STATUS_UNAVAIL,
-+    NSS_STATUS_NOTFOUND,
-+    NSS_STATUS_SUCCESS,
-+    NSS_STATUS_RETURN
-+};
-+#endif
-+
- #include <stdio.h>
- #include <stdlib.h>
- 
--- 
-2.7.0
-
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index d0eb2768d1..953505971a 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -9,7 +9,6 @@ DEPENDS = "avahi"
 PR = "r7"
 
 SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz \
-           file://0001-check-for-nss.h.patch \
            "
 
 SRC_URI[md5sum] = "03938f17646efbb50aa70ba5f99f51d7"
@@ -21,6 +20,8 @@ localstatedir = "/"
 
 inherit autotools
 
+COMPATIBLE_HOST_libc-musl = 'null'
+
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
 
 # suppress warning, but don't bother with autonamer
-- 
2.17.1


