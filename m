Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BACD72C6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:16:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7GiDv018159
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:16:44 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:16:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:16:39 -0800
Message-ID: <499fb03fa39e395611457fcef22527394ffe051f.1421651689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421651689.git.liezhi.yang@windriver.com>
References: <cover.1421651689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] opkg: fix libtoolize error
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
X-List-Received-Date: Mon, 19 Jan 2015 07:16:47 -0000
Content-Type: text/plain

Fixed:
libtoolize:   error: AC_CONFIG_MACRO_DIRS([m4]) conflicts with ACLOCAL_AMFLAGS=-I shave.

They are already included by configure.ac:
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_MACRO_DIR([shave])

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch |   32 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           |    1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch

diff --git a/meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch b/meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch
new file mode 100644
index 0000000..8bde02a
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch
@@ -0,0 +1,32 @@
+From d480d837ff57e855d1cf0b63054d6b1ad7aaf2ee Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 6 Jan 2015 17:54:43 -0800
+Subject: [PATCH] Makefile.am: remove ACLOCAL_AMFLAGS = -I shave -I m4
+
+Fixed:
+libtoolize:   error: AC_CONFIG_MACRO_DIRS([m4]) conflicts with ACLOCAL_AMFLAGS=-I shave.
+
+They are already included by configure.ac:
+AC_CONFIG_MACRO_DIR([m4])
+AC_CONFIG_MACRO_DIR([shave])
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am |    2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8baa62c..6679f77 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,5 +1,3 @@
+-ACLOCAL_AMFLAGS = -I shave -I m4
+-
+ SUBDIRS = libbb libopkg src tests utils man
+ 
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 2cca63c..0d08bf9 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -5,6 +5,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://add-exclude.patch \
            file://opkg-configure.service \
            file://libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch \
+           file://remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch \
 "
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.7.9.5


