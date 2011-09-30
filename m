Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fLN-0003th-BJ
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 17:49:47 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3201846fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Yxpd1sPh9R5usk+/tUX1RVp5VflBaXt4WAfWQ+sIfWw=;
	b=oUyf2TIxW7CQBB2ewjziWEPuWGdMsBBjuYQX8H20tO90n5DmUKohKwKZ4uV6yMuGqw
	AYnCAck4V6/wObJLSPFpu3pC3dG3nJv8P7gIQf0SAGHt1TaARmnaHiRMvi21iZ+wgms2
	BRnITlzdKmVdoUhOXq2/hLTCK5tkvmmbvgsNM=
Received: by 10.223.35.202 with SMTP id q10mr5826938fad.138.1317397458215;
	Fri, 30 Sep 2011 08:44:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x22sm7197119faa.5.2011.09.30.08.44.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:44:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:43:25 +0200
Message-Id: <5cc8029b63f74035c3cd30bc78afdd0460b03844.1317397204.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
References: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397204.git.Martin.Jansa@gmail.com>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 6/9] zlib: fix inverted LFS logic
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
X-List-Received-Date: Fri, 30 Sep 2011 15:49:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch   |   20 ++++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.5.bb               |    5 +++--
 2 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch

diff --git a/meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch b/meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
new file mode 100644
index 0000000..038c1a2
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Pending
+
+see
+https://bugs.gentoo.org/316377?id=316377
+https://bugs.freedesktop.org/show_bug.cgi?id=33710
+http://lists.freedesktop.org/archives/poppler-bugs/2011-January/006014.html
+for details
+
+diff -up zlib-1.2.5/zlib.h.pom zlib-1.2.5/zlib.h
+--- zlib-1.2.5/zlib.h.pom	2010-04-20 06:12:48.000000000 +0200
++++ zlib-1.2.5/zlib.h	2010-06-16 13:08:59.000000000 +0200
+@@ -1578,7 +1578,7 @@ ZEXTERN int ZEXPORT inflateBackInit_ OF(
+ #  define gzoffset gzoffset64
+ #  define adler32_combine adler32_combine64
+ #  define crc32_combine crc32_combine64
+-#  ifdef _LARGEFILE64_SOURCE
++#  ifndef _LARGEFILE64_SOURCE
+      ZEXTERN gzFile ZEXPORT gzopen64 OF((const char *, const char *));
+      ZEXTERN z_off_t ZEXPORT gzseek64 OF((gzFile, z_off_t, int));
+      ZEXTERN z_off_t ZEXPORT gztell64 OF((gzFile));
diff --git a/meta/recipes-core/zlib/zlib_1.2.5.bb b/meta/recipes-core/zlib/zlib_1.2.5.bb
index 96dab25..bca400c 100644
--- a/meta/recipes-core/zlib/zlib_1.2.5.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.5.bb
@@ -7,11 +7,12 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=084e9c30e4e6272c3b057b13c6467f3d"
 
 DEPENDS = "libtool-cross"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
            file://configure.ac \
-           file://Makefile.am"
+           file://Makefile.am \
+	   file://fix.inverted.LFS.logic.patch"
 
 SRC_URI[md5sum] = "be1e89810e66150f5b0327984d8625a0"
 SRC_URI[sha256sum] = "239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
-- 
1.7.6.1



