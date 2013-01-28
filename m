Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tzv5u-0005rB-Vx
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 21:14:20 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so1686376pbc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 11:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=cb50+yjIp2qJYVE173U5QNmTxfDfarBvJHcqGNxgMHU=;
	b=mjjPjJZUpiwZ3ow58n6Hkm8tL9RnfnbJTF8rd8waSShRrkSkdaDPDVBp1wQcqqIa1P
	VJlvcmKu3vIoWJck8jSCiK72QsxL1VUNOdHbdKg1pfbMjUK8M0rmc1iNBXKzO73t+i6r
	jUcl9t/0Xch9jWzYEwE9JaT5Am4puhiBhlQsO24wIkeXJVoAc8HQb3jhYYlH1BkHYLZO
	73zB+dNVBpI695cyLBMMKAtO4U+HUCLcST84T6QbP08peWYg3DuPr2Q0cBgi6RZzOC6y
	U9oEw1I/ZgKJGiDnNJjFoTYavOd5PNj3JhAZnxRZ1RgKCn49E8VE0/rAGHitSMzgpybW
	BeZg==
X-Received: by 10.66.79.202 with SMTP id l10mr38538006pax.36.1359403119567;
	Mon, 28 Jan 2013 11:58:39 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id bg6sm7306579pab.33.2013.01.28.11.58.38
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 11:58:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 11:58:26 -0800
Message-Id: <9496d315c6d89dd6e4147cbdfd7b974fa4ed1d43.1359402980.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359402980.git.raj.khem@gmail.com>
References: <cover.1359402980.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] rpcbind: Dont use nss with uclibc
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
X-List-Received-Date: Mon, 28 Jan 2013 20:14:33 -0000
X-List-Received-Date: Mon, 28 Jan 2013 20:14:33 -0000
X-List-Received-Date: Mon, 28 Jan 2013 20:14:33 -0000

Add defines which otherwise are missing in uclibc nss

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpcbind/rpcbind/0001-uclibc-nss.patch          |   30 ++++++++++
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |   60 ++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |    6 ++
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
new file mode 100644
index 0000000..afa55f3
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Pending
+
+From b8f0d7b7318ba344c25785d6f5cf3f8de98012d4 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Tue, 2 Feb 2010 09:36:03 +0000
+Subject: [PATCH 1/2] uclibc-nss
+
+---
+ src/rpcbind.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/src/rpcbind.c b/src/rpcbind.c
+index 525ffba..1fe1a60 100644
+--- a/src/rpcbind.c
++++ b/src/rpcbind.c
+@@ -67,7 +67,11 @@
+ #include <pwd.h>
+ #include <string.h>
+ #include <errno.h>
++#if defined(__UCLIBC__)
++#define __nss_configure_lookup(x,y)
++#else
+ #include <nss.h>
++#endif
+ #include "config.h"
+ #include "rpcbind.h"
+ 
+-- 
+1.6.6.1
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch b/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
new file mode 100644
index 0000000..c54fc96
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Pending
+
+From 077add040c2e30d3ac507362f4afe350f47be027 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Tue, 2 Feb 2010 09:47:57 +0000
+Subject: [PATCH 2/2] uclibc-rpcsvc-defines
+
+---
+ src/security.c |   28 ++++++++++++++++++++++++++++
+ 1 files changed, 28 insertions(+), 0 deletions(-)
+
+diff --git a/src/security.c b/src/security.c
+index 0edeac6..e9fed55 100644
+--- a/src/security.c
++++ b/src/security.c
+@@ -20,6 +20,32 @@
+ /*
+  * XXX for special case checks in check_callit.
+  */
++#if defined(__UCLIBC__)
++
++#define MOUNTPROC_MNT 1
++#define MOUNTPROC_UMNT 3
++
++#define NFS_PROGRAM	100003
++#define YPPROG		100004
++#define MOUNTPROG	100005
++#define YPBINDPROG	100007
++#define YPPASSWDPROG	100009
++#define RQUOTAPROG	100011
++
++#define YPPROC_NULL	0
++#define YPPROC_DOMAIN 	1
++#define YPPROC_DOMAIN_NONACK 2
++#define YPPROC_MATCH	3
++#define YPPROC_FIRST	4
++#define YPPROC_NEXT	5
++#define YPPROC_XFR	6
++#define YPPROC_CLEAR	7
++#define YPPROC_ALL	8
++
++#define YPBINDPROC_SETDOM	2
++
++#else
++
+ #include <rpcsvc/mount.h>
+ #include <rpcsvc/rquota.h>
+ #include <rpcsvc/nfs_prot.h>
+@@ -27,6 +53,8 @@
+ #include <rpcsvc/ypclnt.h>
+ #include <rpcsvc/yppasswd.h>
+ 
++#endif
++
+ #include "rpcbind.h"
+ 
+ #ifdef LIBWRAP
+-- 
+1.6.6.1
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
index 9fb4f51..a438063 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
@@ -13,8 +13,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
            file://fix_host_path.patch \
+           ${UCLIBCPATCHES} \
           "
 
+UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
+                             file://0002-uclibc-rpcsvc-defines.patch \
+                            "
+UCLIBCPATCHES ?= ""
+
 SRC_URI[md5sum] = "1a77ddb1aaea8099ab19c351eeb26316"
 SRC_URI[sha256sum] = "c92f263e0353887f16379d7708ef1fb4c7eedcf20448bc1e4838f59497a00de3"
 
-- 
1.7.9.5



