Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25009.1628524828621108348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 09:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25AF5D6E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Aug 2021 09:00:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3BD83F718
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Aug 2021 09:00:27 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] parted: drop unneeded ld-is-gold patch
Date: Mon,  9 Aug 2021 17:00:23 +0100
Message-Id: <20210809160024.3337575-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch doesn't appear to be needed anymore, so drop it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ize-link-against-libuuid-explicitly-.patch | 34 -------------------
 meta/recipes-extended/parted/parted_3.4.bb    |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta/recipes-extended/parted/files/0002-libparted_fs_=
resize-link-against-libuuid-explicitly-.patch

diff --git a/meta/recipes-extended/parted/files/0002-libparted_fs_resize-=
link-against-libuuid-explicitly-.patch b/meta/recipes-extended/parted/fil=
es/0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch
deleted file mode 100644
index bd2b5c55b18..00000000000
--- a/meta/recipes-extended/parted/files/0002-libparted_fs_resize-link-ag=
ainst-libuuid-explicitly-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5c99d7e4c2b5e7a957dc922aff03debfebbd6154 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Fri, 3 Mar 2017 21:49:15 +0100
-Subject: [PATCH] libparted_fs_resize: link against libuuid explicitly to
- unbreak gold linking on test
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-| ../libparted/fs/.libs/libparted-fs-resize.so: error: undefined referen=
ce to 'uuid_generate'
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
----
- libparted/fs/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libparted/fs/Makefile.am b/libparted/fs/Makefile.am
-index d3cc8bc..c301b0b 100644
---- a/libparted/fs/Makefile.am
-+++ b/libparted/fs/Makefile.am
-@@ -113,6 +113,8 @@ libparted_fs_resize_la_SOURCES =3D \
-   r/hfs/reloc_plus.c		\
-   r/hfs/reloc_plus.h
-=20
-+libparted_fs_resize_la_LIBADD   =3D $(UUID_LIBS)
-+
- AM_CPPFLAGS =3D \
-   -I$(top_srcdir)/libparted/labels	\
-   $(partedincludedir)			\
---=20
-2.9.3
-
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-ex=
tended/parted/parted_3.4.bb
index 8924bdb478c..ffab6271102 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -8,7 +8,6 @@ DEPENDS =3D "ncurses util-linux virtual/libiconv"
=20
 SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
-           file://0002-libparted_fs_resize-link-against-libuuid-explicit=
ly-.patch \
            file://run-ptest \
            file://check-vfat.patch \
            "
--=20
2.25.1

