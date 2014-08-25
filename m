Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1EA70FD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 23:41:21 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so21271680pde.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=s8kfDuBikPIPxp1gdYn2uZtA44SacnZGmjbsvnV8Stw=;
	b=jfAUIDXVmF/EZdt/aXhlYPoAuvuNenYx7i0IAkvKq2E+qQAd9vkMgkuseCwY9Qw2Nb
	eWbYNw08Jw9bVXmeWc99RTeA50K/DYNAU/BtVy49oqDnRCmtURCsVpT7vAYYUu/oOujh
	9sq8cSYla3VQ+rDKsxfdHQqkCA4Ofc/rsxCvyjWwPGKI/sILfq7plZPu0ItUhF8uhfVG
	HcXmqKV4vt2VYDpFxGOkXC4l5rFflkux6F8VnFFrVOK/NnUZUciuaaKrzi5YJ3Ddew8m
	pLjF8d9f/zUlqzF3DW4GzqN1Bc4M4cuJDYsGYTEehoMCaYUwEdRMUR1dbwo6PRJIh7zq
	GB5w==
X-Received: by 10.68.215.106 with SMTP id oh10mr469891pbc.98.1409010083014;
	Mon, 25 Aug 2014 16:41:23 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id r2sm1615785pdj.29.2014.08.25.16.41.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 16:41:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 16:45:02 -0700
Message-Id: <11876decf7424d36eaa027999aee8de6d3e6a00f.1409010172.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <20ca5b9e346abbb3015f8a67a249858d8195df11.1409010172.git.raj.khem@gmail.com>
References: <20ca5b9e346abbb3015f8a67a249858d8195df11.1409010172.git.raj.khem@gmail.com>
In-Reply-To: <cover.1409010172.git.raj.khem@gmail.com>
References: <cover.1409010172.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] uclibc: Upgrade to tip of master
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
X-List-Received-Date: Mon, 25 Aug 2014 23:41:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adjust mips to cater for new mips32r2 defaulttune
Remove upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |    4 +-
 ...tl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch |  377 --------------------
 .../0004-Add-clock_adjtime-syscall.patch           |   75 ----
 .../uclibc-git/remove_attribute_optimize_Os.patch  |  125 +------
 meta/recipes-core/uclibc/uclibc.inc                |    6 +-
 5 files changed, 6 insertions(+), 581 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 69e834d..a6b9f65 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,4 +1,4 @@
-SRCREV="5eddde8f094ef52dca06695cc598e3b2556dcccb"
+SRCREV = "48a0006012679ff0eda6f256da958d73a924fb57"
 
 PV = "0.9.33+git${SRCPV}"
 
@@ -23,7 +23,5 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch \
 	file://0001-Add-eventfd_read-and-eventfd_write.patch \
 	file://0002-wire-setns-syscall.patch \
-	file://0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch \
-	file://0004-Add-clock_adjtime-syscall.patch \ 
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch b/meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
deleted file mode 100644
index f4387db..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
+++ /dev/null
@@ -1,377 +0,0 @@
-From 7791d129d777e481a1e429815edcd05978438840 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 20 Feb 2014 01:12:14 -0800
-Subject: [PATCH 3/3] fcntl.h:  Define F_SETPIPE_SZ and F_GETPIPE_SZ
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- libc/sysdeps/linux/alpha/bits/fcntl.h      | 2 ++
- libc/sysdeps/linux/arc/bits/fcntl.h        | 2 ++
- libc/sysdeps/linux/arm/bits/fcntl.h        | 2 ++
- libc/sysdeps/linux/bfin/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/cris/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/e1/bits/fcntl.h         | 2 ++
- libc/sysdeps/linux/frv/bits/fcntl.h        | 2 ++
- libc/sysdeps/linux/h8300/bits/fcntl.h      | 2 ++
- libc/sysdeps/linux/hppa/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/i386/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/i960/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/ia64/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/m68k/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/metag/bits/fcntl.h      | 2 ++
- libc/sysdeps/linux/microblaze/bits/fcntl.h | 2 ++
- libc/sysdeps/linux/mips/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/nios/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/nios2/bits/fcntl.h      | 2 ++
- libc/sysdeps/linux/powerpc/bits/fcntl.h    | 2 ++
- libc/sysdeps/linux/sh/bits/fcntl.h         | 2 ++
- libc/sysdeps/linux/sh64/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/sparc/bits/fcntl.h      | 2 ++
- libc/sysdeps/linux/v850/bits/fcntl.h       | 2 ++
- libc/sysdeps/linux/vax/bits/fcntl.h        | 2 ++
- libc/sysdeps/linux/x86_64/bits/fcntl.h     | 2 ++
- libc/sysdeps/linux/xtensa/bits/fcntl.h     | 2 ++
- 26 files changed, 52 insertions(+)
-
-diff --git a/libc/sysdeps/linux/alpha/bits/fcntl.h b/libc/sysdeps/linux/alpha/bits/fcntl.h
-index dd32529..a44be9e 100644
---- a/libc/sysdeps/linux/alpha/bits/fcntl.h
-+++ b/libc/sysdeps/linux/alpha/bits/fcntl.h
-@@ -94,6 +94,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* for F_[GET|SET]FD */
-diff --git a/libc/sysdeps/linux/arc/bits/fcntl.h b/libc/sysdeps/linux/arc/bits/fcntl.h
-index 71136da..1cb9600 100755
---- a/libc/sysdeps/linux/arc/bits/fcntl.h
-+++ b/libc/sysdeps/linux/arc/bits/fcntl.h
-@@ -87,6 +87,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/arm/bits/fcntl.h b/libc/sysdeps/linux/arm/bits/fcntl.h
-index f1a54f0..aedc154 100644
---- a/libc/sysdeps/linux/arm/bits/fcntl.h
-+++ b/libc/sysdeps/linux/arm/bits/fcntl.h
-@@ -99,6 +99,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FD.  */
-diff --git a/libc/sysdeps/linux/bfin/bits/fcntl.h b/libc/sysdeps/linux/bfin/bits/fcntl.h
-index c6cba56..e987824 100644
---- a/libc/sysdeps/linux/bfin/bits/fcntl.h
-+++ b/libc/sysdeps/linux/bfin/bits/fcntl.h
-@@ -98,6 +98,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/cris/bits/fcntl.h b/libc/sysdeps/linux/cris/bits/fcntl.h
-index acc5e25..029bb80 100644
---- a/libc/sysdeps/linux/cris/bits/fcntl.h
-+++ b/libc/sysdeps/linux/cris/bits/fcntl.h
-@@ -99,6 +99,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/e1/bits/fcntl.h b/libc/sysdeps/linux/e1/bits/fcntl.h
-index da699c8..2e0e6ba 100644
---- a/libc/sysdeps/linux/e1/bits/fcntl.h
-+++ b/libc/sysdeps/linux/e1/bits/fcntl.h
-@@ -93,6 +93,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/frv/bits/fcntl.h b/libc/sysdeps/linux/frv/bits/fcntl.h
-index 3aacc9d..5a7d9ef 100644
---- a/libc/sysdeps/linux/frv/bits/fcntl.h
-+++ b/libc/sysdeps/linux/frv/bits/fcntl.h
-@@ -95,6 +95,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/h8300/bits/fcntl.h b/libc/sysdeps/linux/h8300/bits/fcntl.h
-index d0b8310..45deec4 100644
---- a/libc/sysdeps/linux/h8300/bits/fcntl.h
-+++ b/libc/sysdeps/linux/h8300/bits/fcntl.h
-@@ -93,6 +93,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/hppa/bits/fcntl.h b/libc/sysdeps/linux/hppa/bits/fcntl.h
-index 1bb41ce..abb3372 100644
---- a/libc/sysdeps/linux/hppa/bits/fcntl.h
-+++ b/libc/sysdeps/linux/hppa/bits/fcntl.h
-@@ -96,6 +96,8 @@
- # define F_NOTIFY       1026    /* Request notfications on a directory.  */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* for F_[GET|SET]FL */
-diff --git a/libc/sysdeps/linux/i386/bits/fcntl.h b/libc/sysdeps/linux/i386/bits/fcntl.h
-index d48e62a..79b69d4 100644
---- a/libc/sysdeps/linux/i386/bits/fcntl.h
-+++ b/libc/sysdeps/linux/i386/bits/fcntl.h
-@@ -99,6 +99,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FD.  */
-diff --git a/libc/sysdeps/linux/i960/bits/fcntl.h b/libc/sysdeps/linux/i960/bits/fcntl.h
-index e2fcbe6..f6e145d 100644
---- a/libc/sysdeps/linux/i960/bits/fcntl.h
-+++ b/libc/sysdeps/linux/i960/bits/fcntl.h
-@@ -93,6 +93,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/ia64/bits/fcntl.h b/libc/sysdeps/linux/ia64/bits/fcntl.h
-index 1ff0ed5..fedefb6 100644
---- a/libc/sysdeps/linux/ia64/bits/fcntl.h
-+++ b/libc/sysdeps/linux/ia64/bits/fcntl.h
-@@ -95,6 +95,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FD.  */
-diff --git a/libc/sysdeps/linux/m68k/bits/fcntl.h b/libc/sysdeps/linux/m68k/bits/fcntl.h
-index d7beb6c..66df337 100644
---- a/libc/sysdeps/linux/m68k/bits/fcntl.h
-+++ b/libc/sysdeps/linux/m68k/bits/fcntl.h
-@@ -98,6 +98,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/metag/bits/fcntl.h b/libc/sysdeps/linux/metag/bits/fcntl.h
-index c4f641b..e10abd7 100644
---- a/libc/sysdeps/linux/metag/bits/fcntl.h
-+++ b/libc/sysdeps/linux/metag/bits/fcntl.h
-@@ -100,6 +100,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FD.  */
-diff --git a/libc/sysdeps/linux/microblaze/bits/fcntl.h b/libc/sysdeps/linux/microblaze/bits/fcntl.h
-index a2e3573..20b7597 100644
---- a/libc/sysdeps/linux/microblaze/bits/fcntl.h
-+++ b/libc/sysdeps/linux/microblaze/bits/fcntl.h
-@@ -98,6 +98,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- # define F_SETPIPE_SZ	1031	/* Set of pipe page size array */
- # define F_GETPIPE_SZ	1032	/* Get of pipe page size array */
- #endif
-diff --git a/libc/sysdeps/linux/mips/bits/fcntl.h b/libc/sysdeps/linux/mips/bits/fcntl.h
-index 4291f6e..8c4c115 100644
---- a/libc/sysdeps/linux/mips/bits/fcntl.h
-+++ b/libc/sysdeps/linux/mips/bits/fcntl.h
-@@ -111,6 +111,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/nios/bits/fcntl.h b/libc/sysdeps/linux/nios/bits/fcntl.h
-index 5854c18..36ca766 100644
---- a/libc/sysdeps/linux/nios/bits/fcntl.h
-+++ b/libc/sysdeps/linux/nios/bits/fcntl.h
-@@ -96,6 +96,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/nios2/bits/fcntl.h b/libc/sysdeps/linux/nios2/bits/fcntl.h
-index d7beb6c..66df337 100644
---- a/libc/sysdeps/linux/nios2/bits/fcntl.h
-+++ b/libc/sysdeps/linux/nios2/bits/fcntl.h
-@@ -98,6 +98,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/powerpc/bits/fcntl.h b/libc/sysdeps/linux/powerpc/bits/fcntl.h
-index 217f54a..d150a31 100644
---- a/libc/sysdeps/linux/powerpc/bits/fcntl.h
-+++ b/libc/sysdeps/linux/powerpc/bits/fcntl.h
-@@ -99,6 +99,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FD.  */
-diff --git a/libc/sysdeps/linux/sh/bits/fcntl.h b/libc/sysdeps/linux/sh/bits/fcntl.h
-index 5c9f047..aceaec6 100644
---- a/libc/sysdeps/linux/sh/bits/fcntl.h
-+++ b/libc/sysdeps/linux/sh/bits/fcntl.h
-@@ -99,6 +99,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FD.  */
-diff --git a/libc/sysdeps/linux/sh64/bits/fcntl.h b/libc/sysdeps/linux/sh64/bits/fcntl.h
-index ff741cb..b319e8b 100644
---- a/libc/sysdeps/linux/sh64/bits/fcntl.h
-+++ b/libc/sysdeps/linux/sh64/bits/fcntl.h
-@@ -95,6 +95,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/sparc/bits/fcntl.h b/libc/sysdeps/linux/sparc/bits/fcntl.h
-index 235d2ad..7e80d9e 100644
---- a/libc/sysdeps/linux/sparc/bits/fcntl.h
-+++ b/libc/sysdeps/linux/sparc/bits/fcntl.h
-@@ -106,6 +106,8 @@
- # define F_NOTIFY       1026	/* Request notfications on a directory.  */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- #if __WORDSIZE == 64
-diff --git a/libc/sysdeps/linux/v850/bits/fcntl.h b/libc/sysdeps/linux/v850/bits/fcntl.h
-index d0b8310..45deec4 100644
---- a/libc/sysdeps/linux/v850/bits/fcntl.h
-+++ b/libc/sysdeps/linux/v850/bits/fcntl.h
-@@ -93,6 +93,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/vax/bits/fcntl.h b/libc/sysdeps/linux/vax/bits/fcntl.h
-index ff5bff3..a30d5e1 100644
---- a/libc/sysdeps/linux/vax/bits/fcntl.h
-+++ b/libc/sysdeps/linux/vax/bits/fcntl.h
-@@ -92,6 +92,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FL.  */
-diff --git a/libc/sysdeps/linux/x86_64/bits/fcntl.h b/libc/sysdeps/linux/x86_64/bits/fcntl.h
-index a899dcf..02e011d 100644
---- a/libc/sysdeps/linux/x86_64/bits/fcntl.h
-+++ b/libc/sysdeps/linux/x86_64/bits/fcntl.h
-@@ -113,6 +113,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FD.  */
-diff --git a/libc/sysdeps/linux/xtensa/bits/fcntl.h b/libc/sysdeps/linux/xtensa/bits/fcntl.h
-index 5d28547..4e9aa7e 100644
---- a/libc/sysdeps/linux/xtensa/bits/fcntl.h
-+++ b/libc/sysdeps/linux/xtensa/bits/fcntl.h
-@@ -99,6 +99,8 @@
- # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
- # define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
- 				   close-on-exit set on new fd.  */
-+# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
-+# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
- #endif
- 
- /* For F_[GET|SET]FD.  */
--- 
-1.9.0
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch b/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch
deleted file mode 100644
index c596db6..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Upstream-Status: Pending
-
-From 8e19e651145554fbcb90179f3dfbc7ea8a07c900 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Mar 2014 09:32:20 -0700
-Subject: [PATCH 4/4] Add clock_adjtime syscall
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/sys/timex.h                       |  5 ++++-
- libc/sysdeps/linux/common/Makefile.in     |  2 +-
- libc/sysdeps/linux/common/clock_adjtime.c | 15 +++++++++++++++
- 3 files changed, 20 insertions(+), 2 deletions(-)
- create mode 100644 libc/sysdeps/linux/common/clock_adjtime.c
-
-diff --git a/include/sys/timex.h b/include/sys/timex.h
-index 621afce..9082a28 100644
---- a/include/sys/timex.h
-+++ b/include/sys/timex.h
-@@ -20,6 +20,7 @@
- 
- #include <features.h>
- #include <sys/time.h>
-+#include <time.h>
- 
- /* These definitions from linux/timex.h as of 2.2.0.  */
- 
-@@ -125,7 +126,9 @@ libc_hidden_proto(adjtimex)
- extern int ntp_gettime (struct ntptimeval *__ntv) __THROW;
- extern int ntp_adjtime (struct timex *__tntx) __THROW;
- #endif
--
-+#if defined __UCLIBC_HAS_REALTIME__
-+extern int clock_adjtime (clockid_t __clock_id, struct timex *__ntx) __THROW;
-+#endif
- __END_DECLS
- 
- #endif /* sys/timex.h */
-diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
-index 10d9884..bb985b6 100644
---- a/libc/sysdeps/linux/common/Makefile.in
-+++ b/libc/sysdeps/linux/common/Makefile.in
-@@ -84,7 +84,7 @@ CSRC-$(ARCH_USE_MMU) += msync.c
- CSRC-$(UCLIBC_BSD_SPECIFIC) += mincore.c setdomainname.c
- CSRC-$(UCLIBC_NTP_LEGACY) += ntp_gettime.c
- # aio_cancel|aio_error|aio_fsync|aio_read|aio_return|aio_suspend|aio_write|clock_getres|clock_gettime|clock_settime|clock_settime|fdatasync|lio_listio|mlockall|munlockall|mlock|munlock|mq_close|mq_getattr|mq_notify|mq_open|mq_receive|mq_timedreceive|mq_send|mq_timedsend|mq_setattr|mq_unlink|nanosleep|sched_getparam|sched_get_priority_max|sched_get_priority_min|sched_getscheduler|sched_rr_get_interval|sched_setparam|sched_setscheduler|sem_close|sem_destroy|sem_getvalue|sem_init|sem_open|sem_post|sem_trywait|sem_wait|sem_unlink|sem_wait|shm_open|shm_unlink|sigqueue|sigtimedwait|sigwaitinfo|timer_create|timer_delete|timer_getoverrun|timer_gettime|timer_settime
--CSRC-$(UCLIBC_HAS_REALTIME) += clock_getres.c clock_gettime.c clock_settime.c \
-+CSRC-$(UCLIBC_HAS_REALTIME) += clock_adjtime.c clock_getres.c clock_gettime.c clock_settime.c \
- 	fdatasync.c mlockall.c mlock.c munlockall.c munlock.c \
- 	nanosleep.c __rt_sigtimedwait.c __rt_sigwaitinfo.c sched_getparam.c \
- 	sched_get_priority_max.c sched_get_priority_min.c sched_getscheduler.c \
-diff --git a/libc/sysdeps/linux/common/clock_adjtime.c b/libc/sysdeps/linux/common/clock_adjtime.c
-new file mode 100644
-index 0000000..968ec27
---- /dev/null
-+++ b/libc/sysdeps/linux/common/clock_adjtime.c
-@@ -0,0 +1,15 @@
-+/*
-+ * clock_adjtime() for uClibc
-+ *
-+ * Copyright (C) 2005 by Peter Kjellerstedt <pkj@axis.com>
-+ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
-+ *
-+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <sys/syscall.h>
-+#include <sys/timex.h>
-+
-+#ifdef __NR_clock_adjtime
-+_syscall2(int, clock_adjtime, clockid_t, clock_id, struct timex*, ntx)
-+#endif
--- 
-1.9.0
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
index d2a8a81..fb52faa 100644
--- a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
@@ -5,8 +5,8 @@ Upstream-Status: Pending
 
 Index: git/libpthread/nptl/pthread_mutex_timedlock.c
 ===================================================================
---- git.orig/libpthread/nptl/pthread_mutex_timedlock.c	2013-01-21 16:22:20.000000000 -0800
-+++ git/libpthread/nptl/pthread_mutex_timedlock.c	2013-01-21 16:24:12.275557670 -0800
+--- git.orig/libpthread/nptl/pthread_mutex_timedlock.c	2014-08-25 10:58:06.000000000 -0700
++++ git/libpthread/nptl/pthread_mutex_timedlock.c	2014-08-25 11:00:42.078242266 -0700
 @@ -28,7 +28,9 @@
   * error: can't find a register in class ‘GENERAL_REGS’ while reloading ‘asm’
   */
@@ -17,124 +17,3 @@ Index: git/libpthread/nptl/pthread_mutex_timedlock.c
  pthread_mutex_timedlock (
       pthread_mutex_t *mutex,
       const struct timespec *abstime)
-Index: git/libc/sysdeps/linux/powerpc/bits/mathinline.h
-===================================================================
---- git.orig/libc/sysdeps/linux/powerpc/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
-+++ git/libc/sysdeps/linux/powerpc/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
-@@ -26,7 +26,7 @@
- #ifdef __cplusplus
- # define __MATH_INLINE __inline
- #else
--# define __MATH_INLINE extern __inline
-+# define __MATH_INLINE __extern_inline
- #endif  /* __cplusplus */
- 
- #if defined __GNUC__ && !defined _SOFT_FLOAT
-Index: git/libc/sysdeps/linux/alpha/bits/mathinline.h
-===================================================================
---- git.orig/libc/sysdeps/linux/alpha/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
-+++ git/libc/sysdeps/linux/alpha/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
-@@ -24,7 +24,7 @@
- #ifdef __cplusplus
- # define __MATH_INLINE __inline
- #else
--# define __MATH_INLINE extern __inline
-+# define __MATH_INLINE __extern_inline
- #endif
- 
- #if defined __USE_ISOC99 && defined __GNUC__ && !__GNUC_PREREQ(3,0)
-Index: git/libc/sysdeps/linux/i386/bits/mathinline.h
-===================================================================
---- git.orig/libc/sysdeps/linux/i386/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
-+++ git/libc/sysdeps/linux/i386/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
-@@ -25,7 +25,7 @@
- #ifdef __cplusplus
- # define __MATH_INLINE __inline
- #else
--# define __MATH_INLINE extern __inline
-+# define __MATH_INLINE __extern_inline
- #endif
- 
- 
-Index: git/libc/sysdeps/linux/ia64/bits/mathinline.h
-===================================================================
---- git.orig/libc/sysdeps/linux/ia64/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
-+++ git/libc/sysdeps/linux/ia64/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
-@@ -23,7 +23,7 @@
- #ifdef __cplusplus
- # define __MATH_INLINE __inline
- #else
--# define __MATH_INLINE extern __inline
-+# define __MATH_INLINE __extern_inline
- #endif
- 
- #if defined __USE_ISOC99 && defined __GNUC__ && __GNUC__ >= 2
-Index: git/libc/sysdeps/linux/m68k/bits/mathinline.h
-===================================================================
---- git.orig/libc/sysdeps/linux/m68k/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
-+++ git/libc/sysdeps/linux/m68k/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
-@@ -91,7 +91,7 @@
- # ifdef __cplusplus
- #  define __m81_inline		__inline
- # else
--#  define __m81_inline		extern __inline
-+#  define __m81_inline		__extern_inline
- # endif
- # define __M81_MATH_INLINES	1
- #endif
-@@ -350,14 +350,14 @@
- /* Note that there must be no whitespace before the argument passed for
-    NAME, to make token pasting work correctly with -traditional.  */
- # define __inline_forward_c(rettype, name, args1, args2)	\
--extern __inline rettype __attribute__((__const__))		\
-+__extern_inline rettype __attribute__((__const__))		\
-   name args1							\
- {								\
-   return __CONCAT(__,name) args2;				\
- }
- 
- # define __inline_forward(rettype, name, args1, args2)	\
--extern __inline rettype name args1			\
-+__extern_inline rettype name args1			\
- {							\
-   return __CONCAT(__,name) args2;			\
- }
-Index: git/libc/sysdeps/linux/mips/sys/tas.h
-===================================================================
---- git.orig/libc/sysdeps/linux/mips/sys/tas.h	2013-01-21 16:22:20.000000000 -0800
-+++ git/libc/sysdeps/linux/mips/sys/tas.h	2013-01-21 16:24:12.275557670 -0800
-@@ -29,7 +29,7 @@
- #ifdef __USE_EXTERN_INLINES
- 
- # ifndef _EXTERN_INLINE
--#  define _EXTERN_INLINE extern __inline
-+#  define _EXTERN_INLINE __extern_inline
- # endif
- 
- _EXTERN_INLINE int
-Index: git/libc/sysdeps/linux/sparc/bits/mathinline.h
-===================================================================
---- git.orig/libc/sysdeps/linux/sparc/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
-+++ git/libc/sysdeps/linux/sparc/bits/mathinline.h	2013-01-21 16:24:12.279557671 -0800
-@@ -130,7 +130,7 @@
- # ifdef __cplusplus
- #  define __MATH_INLINE __inline
- # else
--#  define __MATH_INLINE extern __inline
-+#  define __MATH_INLINE __extern_inline
- # endif  /* __cplusplus */
- 
- /* The gcc, version 2.7 or below, has problems with all this inlining
-Index: git/libc/sysdeps/linux/x86_64/bits/mathinline.h
-===================================================================
---- git.orig/libc/sysdeps/linux/x86_64/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
-+++ git/libc/sysdeps/linux/x86_64/bits/mathinline.h	2013-01-21 16:24:12.279557671 -0800
-@@ -24,7 +24,7 @@
- #ifdef __cplusplus
- # define __MATH_INLINE __inline
- #else
--# define __MATH_INLINE extern __inline
-+# define __MATH_INLINE __extern_inline
- #endif
- 
- 
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index a86ac3d..18587ca 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -93,10 +93,10 @@ python () {
     # if we use TARGET_CC_ARCH="-march=mips32" we end up 
     # with conflicting march options to gcc. Here we
     # ask for MIPS32 ISA to match the chosen arch
-
-    if "mips32" in d.getVar("TUNE_FEATURES",True):
+    tune = d.getVar("DEFAULTTUNE", True)
+    if tune in ['mips32', 'mips32r2']:
         d.setVar('configmangle_append',
-                 "/^### MIPS32_CHECK$/a\\\nCONFIG_MIPS_ISA_MIPS32=y\n\n")
+                 "/^### MIPS32_CHECK$/a\\\nCONFIG_MIPS_ISA_%s=y\n\n" % (tune.upper()))
     if "${OE_FEATURES}":
         d.setVar('configmangle_append',
                    "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
-- 
1.7.10.4


