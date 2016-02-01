Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 43E2B771C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:08:33 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id s68so46323915qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Do3soKE5jLzPHZRNK5vDBk/TrUXhFs1X+A4IcgIveiI=;
	b=f6uJLlOlUIZi474t6OzdWHAi60GffVkP5qrQOe+QOX5NQGyFyiU6BxSPk841VY/upn
	Hp8fxjR2Q8HDpje90wGVLVLSV1YfJOlCWYsnx99Fo3MFmvADhA8saH/bFGnHZN6kS6gM
	3l9xx8vNpjiJYukun0XTcJKzNH+/gd/SwPwGognqsOwpnvK6HFPD/376rT/DrBBJswXr
	pJ+zgHg1zHsw01FVWaUxtmDNGwCCqUrPYrsuuH/b2+o5OkzbW7hTe/AKSdx3mvN6J2Gy
	MBTtnubafSLMbTHnmMhRYga0ZFi2zxXuqmvFYO5J3w8ysvgGkGnxQp0yMGYzk1Wpy4v0
	CyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Do3soKE5jLzPHZRNK5vDBk/TrUXhFs1X+A4IcgIveiI=;
	b=gZz43xPE3DNz2G6ZilxIz0Vd9jjqKDT72+fDJyyr4+Wa4B2Q2Pqcirm5mwKPYuh7w7
	V2dYl81iQ2tvCfb7VhDF084wtptKNk2w+00xXkNtULa2STFYSXobTbbT+gZ/v5ePMq+L
	Gh4QXrA8LDyTVX/2/fdh8yidKO3/u57fLeMkZ2aLKaBWDG3lLwByfqD7cefuunH7Y4AO
	pVQjyhxNAeOFVPYBL323T+/X3wLyjLbDPbcgRs86uCVuHN+aD6UZaDxy4g6FKEHMCMNt
	0Br1Of+sXRA+YdSWBnxDVg7GOh/3lRksBneHHTCCb70o7B8rh3SuFiSXnXz65Q0n9rDC
	wNGw==
X-Gm-Message-State: AG10YOSlqZg92lTqz0SpUBC2uT6D2N7kxHvhuVU1PEXNdKQV3W8G6+ufga1Yfq+QQDGOpw==
X-Received: by 10.55.22.204 with SMTP id 73mr26042989qkw.41.1454303314456;
	Sun, 31 Jan 2016 21:08:34 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	b6sm12058940qkh.12.2016.01.31.21.08.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 21:08:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 05:08:22 +0000
Message-Id: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
Subject: [PATCH 1/8] libnss-mdns: Check for nss.h before using
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
X-List-Received-Date: Mon, 01 Feb 2016 05:08:35 -0000

nss.h is not available on all libcs
so check for it and if its not there provide
the needed data types.

Fixed buil with musl
../../nss-mdns-0.10/src/nss.c:32:17: fatal error: nss.h: No such file or
directory
compilation terminated.
make[2]: *** [libnss_mdns4_la-nss.lo] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libnss-mdns/0001-check-for-nss.h.patch         | 56 ++++++++++++++++++++++
 .../libnss-mdns/libnss-mdns_0.10.bb                |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch b/meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch
new file mode 100644
index 0000000..f63eb90
--- /dev/null
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch
@@ -0,0 +1,56 @@
+From bdf01a581d58eb5340e9238d143dbcac9db5b11c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Jan 2016 19:29:45 +0000
+Subject: [PATCH] check for nss.h
+
+nss.h may not available on all libc implementations, e.g. musl does not
+have this header, this patch detects nss.h presence and defines the data
+types that are required if nss.h is missing on platform
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac |  2 +-
+ src/nss.c    | 11 +++++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index aa66bc6..ce19b07 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,7 +71,7 @@ AC_PROG_LIBTOOL
+ 
+ # Checks for header files.
+ AC_HEADER_STDC
+-AC_CHECK_HEADERS([arpa/inet.h fcntl.h inttypes.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h nss.h sys/ioctl.h])
++AC_CHECK_HEADERS([arpa/inet.h fcntl.h inttypes.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h nss.h sys/ioctl.h nss.h])
+ 
+ # Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+diff --git a/src/nss.c b/src/nss.c
+index e48e315..406733b 100644
+--- a/src/nss.c
++++ b/src/nss.c
+@@ -29,7 +29,18 @@
+ #include <assert.h>
+ #include <netdb.h>
+ #include <sys/socket.h>
++#ifdef HAVE_NSS_H
+ #include <nss.h>
++#else
++enum nss_status {
++    NSS_STATUS_TRYAGAIN = -2,
++    NSS_STATUS_UNAVAIL,
++    NSS_STATUS_NOTFOUND,
++    NSS_STATUS_SUCCESS,
++    NSS_STATUS_RETURN
++};
++#endif
++
+ #include <stdio.h>
+ #include <stdlib.h>
+ 
+-- 
+2.7.0
+
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index 0b936ef..8d2feec 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "avahi"
 PR = "r7"
 
-SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
+SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz \
+           file://0001-check-for-nss.h.patch \
+           "
 
 SRC_URI[md5sum] = "03938f17646efbb50aa70ba5f99f51d7"
 SRC_URI[sha256sum] = "1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d8134fa6d"
-- 
2.7.0


