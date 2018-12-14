Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 2037 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Dec 2018 13:26:52 UTC
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id AF5DD71A88
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 13:26:52 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBECqslB020121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 13:52:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1544791975;
	bh=68cwx3Tf9Fq14stIfkmkPONm0GmqMnM1vMLgVgNdhL8=; l=74926;
	h=From:To:Cc:Subject:Date;
	b=PfZTxQUcze3TPNLVZIPUpW0bIvm4wFLrrGIRA0pZGbdbhQ3PDTX2eIVumZ40biR47
	6zkzAFFPh5YvGanQzviyFRs4d9+i5tGrL5P5hwgkzyxpJDMzsTsqvztOiClGIgL5JK
	yqB88xqXjisvRuUq2oE0UGtg1tsmNv1rATvwXaKY=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBECqdnR029882 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 14 Dec 2018 13:52:40 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id E698D06EEC;
	Fri, 14 Dec 2018 13:53:20 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBECqcwe029879
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 14 Dec 2018 13:52:38 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.91) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1gXmxJ-00EBys-M1; Fri, 14 Dec 2018 13:52:37 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 13:52:25 +0100
Message-Id: <20181214125225.3376172-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] attr: updated acl + attr
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
X-List-Received-Date: Fri, 14 Dec 2018 13:26:53 -0000
Content-Transfer-Encoding: 8bit

Recent acl and attr package versions changed their buildsystem to
standard automake so that previous buildsystem related patches are not
needed anymore and recipes become very simple.

Other, functionality related patches are integrated in upstream and
were removed too.

Because of the buildsystem changes, the 'ptest' parts of the recipes do
not work anymore and would not a complete rewrite.  For now, 'ptest'
has been removed.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 ...file-libacl-should-depend-on-include.patch |  51 --
 ...-order-of-expected-output-of-getfacl.patch | 198 ------
 meta/recipes-support/attr/acl/configure.ac    |  49 --
 meta/recipes-support/attr/acl/run-ptest       |  64 --
 .../acl/test-fix-directory-permissions.patch  |  37 -
 .../test-fix-insufficient-quoting-of.patch    | 100 ---
 ...-SELinux-machines-for-root-testcases.patch |  84 ---
 meta/recipes-support/attr/acl_2.2.52.bb       |  52 --
 meta/recipes-support/attr/acl_2.2.53.bb       |  23 +
 meta/recipes-support/attr/attr.inc            |  46 --
 .../0001-Use-stdint-types-consistently.patch  |  69 --
 .../attr/attr/attr-Missing-configure.ac.patch |  63 --
 .../attr/attr/dont-use-decl-macros.patch      |  56 --
 meta/recipes-support/attr/attr_2.4.47.bb      |  15 -
 meta/recipes-support/attr/attr_2.4.48.bb      |  27 +
 meta/recipes-support/attr/ea-acl.inc          |  52 --
 ...option-to-enable-disable-static-libr.patch |  70 --
 ...e-attr.5-man-page-moved-to-man-pages.patch | 240 -------
 .../Remove-the-section-2-man-pages.patch      | 666 ------------------
 .../attr/files/relative-libdir.patch          |  25 -
 meta/recipes-support/attr/files/run-ptest     |   5 -
 21 files changed, 50 insertions(+), 1942 deletions(-)
 delete mode 100644 meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch
 delete mode 100644 meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch
 delete mode 100644 meta/recipes-support/attr/acl/configure.ac
 delete mode 100644 meta/recipes-support/attr/acl/run-ptest
 delete mode 100644 meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
 delete mode 100644 meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
 delete mode 100644 meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch
 delete mode 100644 meta/recipes-support/attr/acl_2.2.52.bb
 create mode 100644 meta/recipes-support/attr/acl_2.2.53.bb
 delete mode 100644 meta/recipes-support/attr/attr.inc
 delete mode 100644 meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch
 delete mode 100644 meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch
 delete mode 100644 meta/recipes-support/attr/attr/dont-use-decl-macros.patch
 delete mode 100644 meta/recipes-support/attr/attr_2.4.47.bb
 create mode 100644 meta/recipes-support/attr/attr_2.4.48.bb
 delete mode 100644 meta/recipes-support/attr/ea-acl.inc
 delete mode 100644 meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch
 delete mode 100644 meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
 delete mode 100644 meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
 delete mode 100644 meta/recipes-support/attr/files/relative-libdir.patch
 delete mode 100644 meta/recipes-support/attr/files/run-ptest

diff --git a/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch b/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch
deleted file mode 100644
index 4c7cba3b88..0000000000
--- a/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From d82457ce5ca7455e336da5e244d95f90e52aaef8 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 18 Apr 2017 01:17:26 -0700
-Subject: [PATCH] Makefile: libacl should depend on include
-
-Fixed race issue:
- In file included from acl_copy_entry.c:22:0:
- libacl.h:19:21: fatal error: sys/acl.h: No such file or directory
-  #include <sys/acl.h>
-
-[snip]
-
- compilation terminated.
- acl_get_file.c:27:24: fatal error: acl/libacl.h: No such file or directory
-  #include <acl/libacl.h>
-                         ^
-
-The acl.h is in "include" directory, and include/Makefile creates
-symlink "sys" and "acl" poinst to current dirctory:
-$ ls include/ -l
-acl -> .
-sys -> .
-
-So if "libacl" target runs before "include", the error would happen
-since no "acl" or "sys" directory.
-
-Let libacl depend on include can fix the problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index dce32d3..8a79379 100644
---- a/Makefile
-+++ b/Makefile
-@@ -48,7 +48,7 @@ else
- endif
- 
- # tool/lib dependencies
--libacl: libmisc
-+libacl: include libmisc
- getfacl setfacl chacl: libacl
- 
- ifeq ($(HAVE_BUILDDEFS), yes)
--- 
-2.10.2
-
diff --git a/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch b/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch
deleted file mode 100644
index cf765fdbb8..0000000000
--- a/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch
+++ /dev/null
@@ -1,198 +0,0 @@
-acl: fix the order of expected output of getfacl
-
-The result of getfacl is sorted by user id.
-In Centos or RHEL, bin user id is 1 and daemon user id is 2.
-But in our image, bin user id is 2 and daemon user id is 1.
-The patch fixes this issue to make ptest pass.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- test/misc.test |   38 +++++++++++++++++++-------------------
- 1 file changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/test/misc.test b/test/misc.test
-index 6e98053..53ae5b0 100644
---- a/test/misc.test
-+++ b/test/misc.test
-@@ -79,8 +79,8 @@ Multiple users
- 
- 	$ getfacl --omit-header f
- 	> user::rw-
--	> user:bin:rw-
- 	> user:daemon:r--
-+	> user:bin:rw-
- 	> group::r--
- 	> mask::rw-
- 	> other::r--
-@@ -94,8 +94,8 @@ Multiple groups
- 
- 	$ getfacl --omit-header f
- 	> user::rw-
--	> user:bin:rw-
- 	> user:daemon:r--
-+	> user:bin:rw-
- 	> group::r--
- 	> group:daemon:r--
- 	> group:users:rw-
-@@ -111,8 +111,8 @@ Remove one group
- 
- 	$ getfacl --omit-header f
- 	> user::rw-
--	> user:bin:rw-
- 	> user:daemon:r--
-+	> user:bin:rw-
- 	> group::r--
- 	> group:daemon:r--
- 	> mask::rw-
-@@ -146,8 +146,8 @@ Default ACL
- 
- 	$ getfacl --omit-header d
- 	> user::rwx
--	> user:bin:rwx
- 	> user:daemon:rw-
-+	> user:bin:rwx
- 	> group::r-x
- 	> mask::rwx
- 	> other::---
-@@ -236,16 +236,16 @@ Add some users and groups
- 
- 	$ getfacl --omit-header d/d
- 	> user::rwx
--	> user:bin:rwx	#effective:r-x
- 	> user:daemon:r-x
-+	> user:bin:rwx	#effective:r-x
- 	> group::r-x
- 	> group:daemon:rwx	#effective:r-x
- 	> group:users:r-x
- 	> mask::r-x
- 	> other::---
- 	> default:user::rwx
--	> default:user:bin:rwx	#effective:r-x
- 	> default:user:daemon:r-x
-+	> default:user:bin:rwx	#effective:r-x
- 	> default:group::r-x
- 	> default:mask::r-x
- 	> default:other::---
-@@ -262,16 +262,16 @@ Symlink in directory with default ACL?
- 
- 	$ getfacl --omit-header d/l
- 	> user::rwx
--	> user:bin:rwx	#effective:r-x
- 	> user:daemon:r-x
-+	> user:bin:rwx	#effective:r-x
- 	> group::r-x
- 	> group:daemon:rwx	#effective:r-x
- 	> group:users:r-x
- 	> mask::r-x
- 	> other::---
- 	> default:user::rwx
--	> default:user:bin:rwx	#effective:r-x
- 	> default:user:daemon:r-x
-+	> default:user:bin:rwx	#effective:r-x
- 	> default:group::r-x
- 	> default:mask::r-x
- 	> default:other::---
-@@ -287,16 +287,16 @@ Does mask manipulation work?
- 
- 	$ getfacl --omit-header d/d
- 	> user::rwx
--	> user:bin:r-x
- 	> user:daemon:r-x
-+	> user:bin:r-x
- 	> group::r-x
- 	> group:daemon:r-x
- 	> group:users:r-x
- 	> mask::r-x
- 	> other::---
- 	> default:user::rwx
--	> default:user:bin:rwx	#effective:r-x
- 	> default:user:daemon:r-x
-+	> default:user:bin:rwx	#effective:r-x
- 	> default:group::r-x
- 	> default:mask::r-x
- 	> default:other::---
-@@ -308,16 +308,16 @@ Does mask manipulation work?
- 
- 	$ getfacl --omit-header d/d
- 	> user::rwx
--	> user:bin:r-x
- 	> user:daemon:r-x
-+	> user:bin:r-x
- 	> group::r-x
- 	> group:daemon:r-x
- 	> group:users:r-x
- 	> mask::r-x
- 	> other::---
- 	> default:user::rwx
--	> default:user:bin:rwx
- 	> default:user:daemon:r-x
-+	> default:user:bin:rwx
- 	> default:group::r-x
- 	> default:mask::rwx
- 	> default:other::---
-@@ -333,8 +333,8 @@ Remove the default ACL
- 
- 	$ getfacl --omit-header d
- 	> user::rwx
--	> user:bin:rwx
- 	> user:daemon:rw-
-+	> user:bin:rwx
- 	> group::r-x
- 	> mask::rwx
- 	> other::---
-@@ -373,14 +373,14 @@ Now, chmod should change the group_obj entry
- 
- 	$ getfacl --omit-header d
- 	> user::rwx
--	> user:bin:r-x
- 	> user:daemon:rwx
-+	> user:bin:r-x
- 	> group::rwx
- 	> mask::rwx
- 	> other::r-x
- 	> default:user::rwx
--	> default:user:bin:r-x
- 	> default:user:daemon:rwx
-+	> default:user:bin:r-x
- 	> default:group::rwx
- 	> default:mask::rwx
- 	> default:other::r-x
-@@ -392,14 +392,14 @@ Now, chmod should change the group_obj entry
- 
- 	$ getfacl --omit-header d
- 	> user::rwx
--	> user:bin:r-x
- 	> user:daemon:rwx	#effective:r-x
-+	> user:bin:r-x
- 	> group::rwx	#effective:r-x
- 	> mask::r-x
- 	> other::---
- 	> default:user::rwx
--	> default:user:bin:r-x
- 	> default:user:daemon:rwx
-+	> default:user:bin:r-x
- 	> default:group::rwx
- 	> default:mask::rwx
- 	> default:other::r-x
-@@ -411,14 +411,14 @@ Now, chmod should change the group_obj entry
- 
- 	$ getfacl --omit-header d
- 	> user::rwx
--	> user:bin:r-x
- 	> user:daemon:rwx	#effective:r-x
-+	> user:bin:r-x
- 	> group::rwx	#effective:r-x
- 	> mask::r-x
- 	> other::---
- 	> default:user::rwx
--	> default:user:bin:r-x
- 	> default:user:daemon:rwx
-+	> default:user:bin:r-x
- 	> default:group::rwx
- 	> default:mask::rwx
- 	> default:other::r-x
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/attr/acl/configure.ac b/meta/recipes-support/attr/acl/configure.ac
deleted file mode 100644
index 7af2e8d886..0000000000
--- a/meta/recipes-support/attr/acl/configure.ac
+++ /dev/null
@@ -1,49 +0,0 @@
-# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
-#
-# This program is free software: you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by
-# the Free Software Foundation, either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program.  If not, see <http://www.gnu.org/licenses/>.
-#
-AC_INIT(include/acl.h)
-AC_CONFIG_AUX_DIR([.])
-AC_CONFIG_MACRO_DIR([m4])
-AC_CONFIG_HEADER(include/config.h)
-AC_PREFIX_DEFAULT(/usr)
-
-AC_PROG_LIBTOOL
-
-AC_ARG_ENABLE(shared,
-[ --enable-shared=[yes/no] Enable use of shared libraries [default=yes]],,
-	enable_shared=yes)
-AC_SUBST(enable_shared)
-
-AC_ARG_ENABLE(gettext,
-[ --enable-gettext=[yes/no] Enable alternate language support [default=yes]],,
-	enable_gettext=yes)
-AC_SUBST(enable_gettext)
-
-AC_ARG_ENABLE(lib64,
-[ --enable-lib64=[yes/no] Enable lib64 support [default=no]],,
-	enable_lib64=no)
-AC_SUBST(enable_lib64)
-
-AC_PACKAGE_GLOBALS(acl)
-AC_PACKAGE_UTILITIES(acl)
-AC_PACKAGE_NEED_ATTR_XATTR_H
-AC_PACKAGE_NEED_ATTR_ERROR_H
-AC_MULTILIB($enable_lib64)
-AC_PACKAGE_NEED_GETXATTR_LIBATTR
-AC_MANUAL_FORMAT
-
-AC_FUNC_GCC_VISIBILITY
-
-AC_OUTPUT(include/builddefs)
diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
deleted file mode 100644
index a56946d8e6..0000000000
--- a/meta/recipes-support/attr/acl/run-ptest
+++ /dev/null
@@ -1,64 +0,0 @@
-#!/bin/sh
-#
-#This script is used to run acl test suites
-
-#umask 077
-
-EXT3_IMAGE=ext3.img
-EXT3_MOUNT_POINT=/mnt/ext3
-
-trap 'rm -f ${EXT3_IMAGE}' EXIT
-
-dd if=/dev/zero of=${EXT3_IMAGE} bs=1M count=1
-if [ "$?" -eq 0 ]; then
-	echo "PASS: dump ext3.img"
-else
-	echo "FAIL: dump ext3.img"
-	exit 1
-fi
-
-mkfs.ext3 -F ${EXT3_IMAGE}
-if [ "$?" -eq 0 ]; then
-	echo "PASS: mkfs.ext3 -F ext3.img"
-else
-	echo "FAIL: mkfs.ext3 -F ext3.img"
-	exit 1
-fi
-
-if [ -d $EXT3_MOUNT_POINT ]; then
-	echo "mount point exist"
-else
-	mkdir -p $EXT3_MOUNT_POINT
-fi
-
-
-mount -o loop,rw,acl  ${EXT3_IMAGE} $EXT3_MOUNT_POINT
-if [ "$?" -eq 0 ]; then
-	echo "PASS: mount ext3.img"
-else
-	echo "FAIL: mount ext3.img"
-	exit 1
-fi
-
-cp -rf ./test/ $EXT3_MOUNT_POINT
-
-cd $EXT3_MOUNT_POINT/test/
-
-if	sed -e 's!^bin:x:2:$!bin:x:2:daemon!' < /etc/group > gtmp
-then	if	cp /etc/group group.orig;
-	then	cp gtmp /etc/group
-		make  -k tests root-tests | sed \
-			-e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
-	  		-e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
-		cp group.orig /etc/group
-	else	echo "FAIL: couldn't save original group file."
-		exit 1
-	fi
-else	echo "FAIL: couldn't create modified group file."
-	exit 1
-fi
-
-cd -
-umount $EXT3_MOUNT_POINT
-rm -rf $EXT3_MOUNT_POINT
-rm $EXT3_IMAGE
diff --git a/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch b/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
deleted file mode 100644
index e64990ad5b..0000000000
--- a/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 311589fedf196168382d8f0db303ab328bcf9d83 Mon Sep 17 00:00:00 2001
-From: Peter Seebach <peter.seebach@windriver.com>
-Date: Wed, 11 May 2016 15:16:06 -0500
-Subject: [PATCH] acl.inc, run-ptest: improve ptest functionality on limited
-
-commit c45bae84817a70fef6c2b661a07a492a0d23ae85
-
-    Fix permissions on temporary directory
-
-    The temporary directory's permissions have to allow other users to
-    view the directory. A default umask of 022 is common, but not mandatory,
-    and secure systems may have more restrictive defaults.
-
-    Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
-
-Upstream-Status: Backport [ http://git.savannah.gnu.org/cgit/acl.git/commit/?id=c6772a958800de064482634f77c20a0faafc5af6 ]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- test/root/permissions.test | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/test/root/permissions.test b/test/root/permissions.test
-index 42615f5..098b52a 100644
---- a/test/root/permissions.test
-+++ b/test/root/permissions.test
-@@ -16,6 +16,7 @@ Cry immediately if we are not running as root.
- First, set up a temporary directory and create a regular file with
- defined permissions.
- 
-+	$ umask 022
- 	$ mkdir d
- 	$ cd d
- 	$ umask 027
--- 
-2.8.1
-
diff --git a/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch b/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
deleted file mode 100644
index f392465b58..0000000000
--- a/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From e98ce8acf84d12ea67a3ac76bf63c6d87d9af86d Mon Sep 17 00:00:00 2001
-From: Kamil Dudka <kdudka@redhat.com>
-Date: Mon, 20 May 2013 16:38:06 +0200
-Subject: [PATCH] test: fix insufficient quoting of '\'
-
-This is a follow-up to 7f2c91b8369242a8dbc2b304a5b71b2a85f5b855, which
-caused sbits-restore.test to fail in the following way in case SELinux
-was disabled:
-
-*** sbits-restore.test ***
-[3] $ umask 022 -- ok
-[4] $ mkdir d -- ok
-[5] $ touch d/g -- ok
-[6] $ touch d/u -- ok
-[7] $ chmod u+s d/u -- ok
-[8] $ chmod g+s d/g -- ok
-[9] $ chmod +t d -- ok
-[10] $ getfacl -R d > d.acl -- ok
-[11] $ rm -R d -- ok
-[12] $ mkdir d -- ok
-[13] $ touch d/g -- ok
-[14] $ touch d/u -- ok
-[15] $ setfacl --restore d.acl -- ok
-[16] $ ls -dl d | awk '{print $1}' | sed 's/.$//g' -- failed
-drwxr-xr-                             != drwxr-xr-t
-[18] $ ls -dl d/u | awk '{print $1}' | sed 's/.$//g' -- failed
--rwSr--r-                             != -rwSr--r--
-[20] $ ls -dl d/g | awk '{print $1}' | sed 's/.$//g' -- failed
--rw-r-Sr-                             != -rw-r-Sr--
-[22] $ rm -Rf d -- ok
-17 commands (14 passed, 3 failed)
-
-Upstream-Status: Backport
-http://git.savannah.gnu.org/cgit/acl.git/commit/?id=e98ce8acf84d12ea67a3ac76bf63c6d87d9af86d
-
-Signed-off-by: Kamil Dudka <kdudka@redhat.com>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-
-Index: acl-2.2.52/test/cp.test
-===================================================================
---- acl-2.2.52.orig/test/cp.test
-+++ acl-2.2.52/test/cp.test
-@@ -9,7 +9,7 @@ The cp utility should only copy ACLs if
- 	> -rw-rw-r--+
- 	
- 	$ cp f g
--	$ ls -l g | awk -- '{ print $1 }' | sed 's/\.$//g'
-+	$ ls -l g | awk -- '{ print $1 }' | sed 's/\\.$//g'
- 	> -rw-r--r--
- 	
- 	$ rm g
-Index: acl-2.2.52/test/misc.test
-===================================================================
---- acl-2.2.52.orig/test/misc.test
-+++ acl-2.2.52/test/misc.test
-@@ -254,7 +254,7 @@ Add some users and groups
- Symlink in directory with default ACL?
- 	 
- 	$ ln -s d d/l
--	$ ls -dl d/l | awk '{print $1}' | sed 's/\.$//g'
-+	$ ls -dl d/l | awk '{print $1}' | sed 's/\\.$//g'
- 	> lrwxrwxrwx
- 
- 	$ ls -dl -L d/l | awk '{print $1}'
-@@ -343,7 +343,7 @@ Remove the default ACL
- Reset to base entries
- 	 
- 	$ setfacl -b d
--	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
-+	$ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
- 	> drwxr-x---
- 
- 	$ getfacl --omit-header d
-@@ -355,7 +355,7 @@ Reset to base entries
- Now, chmod should change the group_obj entry
- 	 
- 	$ chmod 775 d
--	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
-+	$ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
- 	> drwxrwxr-x
- 	
- 	$ getfacl --omit-header d
-Index: acl-2.2.52/test/sbits-restore.test
-===================================================================
---- acl-2.2.52.orig/test/sbits-restore.test
-+++ acl-2.2.52/test/sbits-restore.test
-@@ -13,10 +13,10 @@ Ensure setting of SUID/SGID/sticky via -
- 	$ touch d/g
- 	$ touch d/u
- 	$ setfacl --restore d.acl
--	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
-+	$ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
- 	> drwxr-xr-t
--	$ ls -dl d/u | awk '{print $1}' | sed 's/\.$//g'
-+	$ ls -dl d/u | awk '{print $1}' | sed 's/\\.$//g'
- 	> -rwSr--r--
--	$ ls -dl d/g | awk '{print $1}' | sed 's/\.$//g'
-+	$ ls -dl d/g | awk '{print $1}' | sed 's/\\.$//g'
- 	> -rw-r-Sr--
- 	$ rm -Rf d
diff --git a/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch b/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch
deleted file mode 100644
index 8cc11a63e1..0000000000
--- a/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From d2f49ee6fe4850b8dda5b08676b36201d3c43710 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Wed, 2 Mar 2016 15:46:57 +0800
-Subject: [PATCH] test: fixups on SELinux machines for root testcases
-
-ls adds a '.' at the end of the permission field list on SELinux
-machines, filter this out so root tests work on SELinux machines.
-
-Upstream-Status: Accepted
-http://git.savannah.gnu.org/cgit/acl.git/commit/?id=26a87d36f80d5e98bccb5878834d9e69dadfe3e9
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- test/root/permissions.test | 8 ++++----
- test/root/restore.test     | 2 +-
- test/root/setfacl.test     | 2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/test/root/permissions.test b/test/root/permissions.test
-index 9b9e3de..665339a 100644
---- a/test/root/permissions.test
-+++ b/test/root/permissions.test
-@@ -19,7 +19,7 @@ defined permissions.
- 	$ cd d
- 	$ umask 027
- 	$ touch f
--	$ ls -l f | awk -- '{ print $1, $3, $4 }'
-+	$ ls -l f | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
- 	> -rw-r----- root root
-
-
-@@ -39,7 +39,7 @@ Now, change the ownership of the file to bin:bin and verify that this
- gives user bin write access.
-
- 	$ chown bin:bin f
--	$ ls -l f | awk -- '{ print $1, $3, $4 }'
-+	$ ls -l f | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
- 	> -rw-r----- bin bin
- 	$ su bin
- 	$ echo bin >> f
-@@ -256,12 +256,12 @@ directories if the file has an ACL and only CAP_FOWNER would grant them.
- 	$ mkdir -m 600 x
- 	$ chown daemon:daemon x
- 	$ echo j > x/j
--	$ ls -l x/j | awk -- '{ print $1, $3, $4 }'
-+	$ ls -l x/j | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
- 	> -rw-r----- root root
-
- 	$ setfacl -m u:daemon:r x
-
--	$ ls -l x/j | awk -- '{ print $1, $3, $4 }'
-+	$ ls -l x/j | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
- 	> -rw-r----- root root
- 	(With the bug this gives: `ls: x/j: Permission denied'.)
-
-diff --git a/test/root/restore.test b/test/root/restore.test
-index 63a9d01..c85097c 100644
---- a/test/root/restore.test
-+++ b/test/root/restore.test
-@@ -21,7 +21,7 @@ Cry immediately if we are not running as root.
- 	$ chown bin passwd
- 	$ chmod u+s passwd
- 	$ setfacl --restore passwd.acl
--	$ ls -dl passwd | awk '{print $1 " " $3 " " $4}'
-+	$ ls -dl passwd | awk '{print $1 " " $3 " " $4}' | sed 's/\\.//g'
- 	> -rwsr-xr-x root root
-
- 	$ rm passwd passwd.acl
-diff --git a/test/root/setfacl.test b/test/root/setfacl.test
-index a46a9f4..7efbad7 100644
---- a/test/root/setfacl.test
-+++ b/test/root/setfacl.test
-@@ -12,7 +12,7 @@ Cry immediately if we are not running as root.
- 	$ sg bin
- 	$ umask 027
- 	$ touch g
--	$ ls -dl g | awk '{print $1}'
-+	$ ls -dl g | awk '{print $1}' | sed 's/\\.//g'
- 	> -rw-r-----
-
- 	$ setfacl -m m:- g
---
-1.9.1
-
diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
deleted file mode 100644
index 6bc77d868d..0000000000
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-SUMMARY = "Utilities for managing POSIX Access Control Lists"
-HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
-SECTION = "libs"
-
-LICENSE = "LGPLv2.1+ & GPLv2+"
-LICENSE_${PN} = "GPLv2+"
-LICENSE_lib${BPN} = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
-                    file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
-
-DEPENDS = "attr"
-
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
-           file://configure.ac;subdir=${BP} \
-           file://run-ptest \
-           file://acl-fix-the-order-of-expected-output-of-getfacl.patch \
-           file://test-fix-insufficient-quoting-of.patch \
-           file://test-fixups-on-SELinux-machines-for-root-testcases.patch \
-           file://test-fix-directory-permissions.patch \
-           file://Makefile-libacl-should-depend-on-include.patch \
-"
-
-SRC_URI[md5sum] = "a61415312426e9c2212bd7dc7929abda"
-SRC_URI[sha256sum] = "179074bb0580c06c4b4137be4c5a92a701583277967acdb5546043c7874e0d23"
-
-require ea-acl.inc
-
-# avoid RPATH hardcode to staging dir
-do_configure_append() {
-	sed -i ${S}/config.status -e s,^\\\(hardcode_into_libs=\\\).*$,\\1\'no\',
-	${S}/config.status
-}
-
-# libdir should point to .la
-do_install_append() {
-	sed -i ${D}${libdir}/libacl.la -e \
-	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
-}
-
-inherit ptest
-
-PTEST_BUILD_HOST_FILES = "builddefs"
-PTEST_BUILD_HOST_PATTERN = "^RPM"
-do_install_ptest() {
-	tar -c --exclude=nfs test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	install -d ${D}${PTEST_PATH}/include
-	install -m 644 ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
-}
-
-RDEPENDS_${PN}-ptest = "acl bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/attr/acl_2.2.53.bb b/meta/recipes-support/attr/acl_2.2.53.bb
new file mode 100644
index 0000000000..fb3309ffaa
--- /dev/null
+++ b/meta/recipes-support/attr/acl_2.2.53.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Utilities for managing POSIX Access Control Lists"
+HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1+ & GPLv2+"
+LICENSE_${PN} = "GPLv2+"
+LICENSE_lib${BPN} = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
+                    file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
+
+DEPENDS = "attr"
+
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "007aabf1dbb550bcddde52a244cd1070"
+SRC_URI[sha256sum] = "06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7"
+
+inherit autotools gettext
+
+BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES =+ "lib${BPN}"
+FILES_lib${BPN} = "${libdir}/lib*${SOLIBS}"
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
deleted file mode 100644
index cfa38a7196..0000000000
--- a/meta/recipes-support/attr/attr.inc
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "Utilities for manipulating filesystem extended attributes"
-HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
-SECTION = "libs"
-
-DEPENDS = "virtual/libintl"
-
-LICENSE = "LGPLv2.1+ & GPLv2+"
-LICENSE_${PN} = "GPLv2+"
-LICENSE_lib${BPN} = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
-                    file://attr/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
-                    file://libattr/libattr.c;endline=17;md5=7970f77049f8fa1199fff62a7ab724fb"
-
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.src.tar.gz \
-           file://run-ptest \
-"
-
-require ea-acl.inc
-
-# libdir should point to .la
-do_install_append() {
-	sed -i ${D}${libdir}/libattr.la -e \
-	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
-}
-
-inherit ptest update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "setfattr"
-ALTERNATIVE_TARGET[setfattr] = "${bindir}/setfattr"
-
-PTEST_BUILD_HOST_FILES = "builddefs"
-PTEST_BUILD_HOST_PATTERN = "^RPM"
-
-do_install_ptest() {
-	tar -c --exclude=ext test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	mkdir ${D}${PTEST_PATH}/include
-	for i in builddefs buildmacros buildrules; \
-	  do cp ${S}/include/$i ${D}${PTEST_PATH}/include/; \
-	done
-	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
-}
-
-RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch b/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch
deleted file mode 100644
index dcd6507bcc..0000000000
--- a/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 37a27b6fd09ecb37097b85e5db74e4f77b80fe0a Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Tue, 12 Jan 2016 22:20:33 +0100
-Subject: [PATCH] Use stdint types consistently
-
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- include/attributes.h | 6 ++++--
- man/man3/attr_list.3 | 8 ++++----
- 2 files changed, 8 insertions(+), 6 deletions(-)
-
-Index: attr-2.4.47/include/attributes.h
-===================================================================
---- attr-2.4.47.orig/include/attributes.h
-+++ attr-2.4.47/include/attributes.h
-@@ -22,6 +22,7 @@
- extern "C" {
- #endif
- 
-+#include <stdint.h>
- /*
-  *	An almost-IRIX-compatible extended attributes API
-  *	(the IRIX attribute "list" operation is missing, added ATTR_SECURE).
-@@ -69,7 +70,7 @@ typedef struct attrlist {
-  * al_offset[i] entry points to.
-  */
- typedef struct attrlist_ent {	/* data from attr_list() */
--	u_int32_t	a_valuelen;	/* number bytes in value of attr */
-+	uint32_t	a_valuelen;	/* number bytes in value of attr */
- 	char		a_name[1];	/* attr name (NULL terminated) */
- } attrlist_ent_t;
- 
-@@ -90,7 +91,7 @@ typedef struct attrlist_ent {	/* data fr
-  * operation on a cursor is to bzero() it.
-  */
- typedef struct attrlist_cursor {
--	u_int32_t	opaque[4];	/* an opaque cookie */
-+	uint32_t	opaque[4];	/* an opaque cookie */
- } attrlist_cursor_t;
- 
- /*
-Index: attr-2.4.47/man/man3/attr_list.3
-===================================================================
---- attr-2.4.47.orig/man/man3/attr_list.3
-+++ attr-2.4.47/man/man3/attr_list.3
-@@ -72,9 +72,9 @@ The contents of an \f4attrlist_t\fP stru
- .nf
- .ft 4
- .ta 9n 22n
--__int32_t al_count; /\(** number of entries in attrlist \(**/
--__int32_t al_more; /\(** T/F: more attrs (do syscall again) \(**/
--__int32_t al_offset[1]; /\(** byte offsets of attrs [var-sized] \(**/
-+int32_t al_count; /\(** number of entries in attrlist \(**/
-+int32_t al_more; /\(** T/F: more attrs (do syscall again) \(**/
-+int32_t al_offset[1]; /\(** byte offsets of attrs [var-sized] \(**/
- .ft 1
- .fi
- .RE
-@@ -113,7 +113,7 @@ include the following members:
- .nf
- .ft 4
- .ta 9n 22n
--u_int32_t a_valuelen; /\(** number bytes in value of attr \(**/
-+uint32_t a_valuelen; /\(** number bytes in value of attr \(**/
- char a_name[]; /\(** attr name (NULL terminated) \(**/
- .ft 1
- .fi
diff --git a/meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch b/meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch
deleted file mode 100644
index 20fcc3cee7..0000000000
--- a/meta/recipes-support/attr/attr/attr-Missing-configure.ac.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Subject: [PATCH] attr: Missing configure.ac
-
-Upstream-Status: Backport [Upstream released tarball missing this file]
-Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
----
- configure.ac |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 48 insertions(+)
- create mode 100644 configure.ac
-
-diff --git a/configure.ac b/configure.ac
-new file mode 100644
-index 0000000..b966d0e
---- /dev/null
-+++ b/configure.ac
-@@ -0,0 +1,48 @@
-+# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
-+#
-+# This program is free software: you can redistribute it and/or modify it
-+# under the terms of the GNU General Public License as published by
-+# the Free Software Foundation, either version 2 of the License, or
-+# (at your option) any later version.
-+#
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+#
-+# You should have received a copy of the GNU General Public License
-+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
-+#
-+AC_INIT(include/attributes.h)
-+AC_CONFIG_AUX_DIR([.])
-+AC_CONFIG_MACRO_DIR([m4])
-+AC_CONFIG_HEADER(include/config.h)
-+AC_PREFIX_DEFAULT(/usr)
-+
-+AC_PROG_LIBTOOL
-+
-+AC_ARG_ENABLE(shared,
-+[ --enable-shared=[yes/no] Enable use of shared libraries [default=yes]],,
-+	enable_shared=yes)
-+AC_SUBST(enable_shared)
-+
-+AC_ARG_ENABLE(gettext,
-+[ --enable-gettext=[yes/no] Enable alternate language support [default=yes]],,
-+	enable_gettext=yes)
-+AC_SUBST(enable_gettext)
-+
-+AC_ARG_ENABLE(lib64,
-+[ --enable-lib64=[yes/no] Enable lib64 support [default=no]],,
-+	enable_lib64=no)
-+AC_SUBST(enable_lib64)
-+
-+AC_PACKAGE_GLOBALS(attr)
-+AC_PACKAGE_UTILITIES(attr)
-+AC_MANUAL_FORMAT
-+AC_MULTILIB($enable_lib64)
-+
-+AC_C_CONST
-+AC_TYPE_MODE_T
-+AC_FUNC_ALLOCA
-+
-+AC_OUTPUT(include/builddefs)
diff --git a/meta/recipes-support/attr/attr/dont-use-decl-macros.patch b/meta/recipes-support/attr/attr/dont-use-decl-macros.patch
deleted file mode 100644
index 9d4b8929e8..0000000000
--- a/meta/recipes-support/attr/attr/dont-use-decl-macros.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Use extern "C" instead of __BEGIN_DECL/__END_DECL macros
-these macros are defined in sys/cdefs.h for glibc and this header is not available on all libc
-
-anyway they defined like below
-
-#ifdef __cplusplus
-# define __BEGIN_DECLS extern "C" {
-# define __END_DECLS }
-#else
-# define __BEGIN_DECLS /* empty */
-# define __END_DECLS /* empty */
-#endif
-
-__THROW macro is also not available on musl, defined thusly
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: attr-2.4.47/include/xattr.h
-===================================================================
---- attr-2.4.47.orig/include/xattr.h	2014-04-02 00:01:30.252091280 -0700
-+++ attr-2.4.47/include/xattr.h	2014-04-02 00:12:57.985428099 -0700
-@@ -30,8 +30,20 @@
- #define XATTR_CREATE  0x1       /* set value, fail if attr already exists */
- #define XATTR_REPLACE 0x2       /* set value, fail if attr does not exist */
- 
--
--__BEGIN_DECLS
-+#ifndef __THROW
-+# ifndef __GNUC_PREREQ
-+#  define __GNUC_PREREQ(maj, min) (0)
-+# endif
-+# if defined __cplusplus && __GNUC_PREREQ (2,8)
-+#  define __THROW       throw ()
-+# else
-+#  define __THROW
-+# endif
-+#endif
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- extern int setxattr (const char *__path, const char *__name,
- 		      const void *__value, size_t __size, int __flags) __THROW;
-@@ -58,6 +70,8 @@
- extern int lremovexattr (const char *__path, const char *__name) __THROW;
- extern int fremovexattr (int __filedes,   const char *__name) __THROW;
- 
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
- 
- #endif	/* __XATTR_H__ */
diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-support/attr/attr_2.4.47.bb
deleted file mode 100644
index fc88bef830..0000000000
--- a/meta/recipes-support/attr/attr_2.4.47.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require attr.inc
-
-# configure.ac was missing from the release tarball. This should be fixed in
-# future releases of attr, remove this when updating the recipe.
-SRC_URI += "file://attr-Missing-configure.ac.patch \
-            file://dont-use-decl-macros.patch \
-            file://Remove-the-section-2-man-pages.patch \
-            file://Remove-the-attr.5-man-page-moved-to-man-pages.patch \
-            file://0001-Use-stdint-types-consistently.patch \
-           "
-
-SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
-SRC_URI[sha256sum] = "25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/attr/attr_2.4.48.bb b/meta/recipes-support/attr/attr_2.4.48.bb
new file mode 100644
index 0000000000..32967b8ea5
--- /dev/null
+++ b/meta/recipes-support/attr/attr_2.4.48.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Utilities for manipulating filesystem extended attributes"
+HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
+SECTION = "libs"
+
+DEPENDS = "virtual/libintl"
+
+LICENSE = "LGPLv2.1+ & GPLv2+"
+LICENSE_${PN} = "GPLv2+"
+LICENSE_lib${BPN} = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
+                    file://tools/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
+                    file://libattr/libattr.c;endline=17;md5=7970f77049f8fa1199fff62a7ab724fb"
+
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz"
+SRC_URI[md5sum] = "bc1e5cb5c96d99b24886f1f527d3bb3d"
+SRC_URI[sha256sum] = "5ead72b358ec709ed00bbf7a9eaef1654baad937c001c044fe8b74c57f5324e7"
+
+inherit autotools gettext update-alternatives
+
+BBCLASSEXTEND = "native nativesdk"
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "setfattr"
+ALTERNATIVE_TARGET[setfattr] = "${bindir}/setfattr"
+
+PACKAGES =+ "lib${BPN}"
+FILES_lib${BPN} = "${libdir}/lib*${SOLIBS}"
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
deleted file mode 100644
index 9336ffc938..0000000000
--- a/meta/recipes-support/attr/ea-acl.inc
+++ /dev/null
@@ -1,52 +0,0 @@
-# this build system is mostly shared by attr and acl
-
-SRC_URI += "file://relative-libdir.patch;striplevel=0 \
-           "
-# This patch should be applied after '(attr\|acl)-Missing-configure.ac.patch' 
-SRC_URI_append = " file://0001-Added-configure-option-to-enable-disable-static-libr.patch"
-
-inherit autotools-brokensep gettext
-
-# When upstream is using automake properly, this can be removed
-CLEANBROKEN = "1"
-
-# the package comes with a custom config.h.in, it cannot be
-# overwritten by autoheader
-EXTRA_AUTORECONF += "--exclude=autoheader"
-EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
-EXTRA_OECONF_append_class-native = " --enable-gettext=no"
-EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS') == 'no')]}"
-
-EXTRA_OEMAKE = "PKG_LIB_DIR=${base_libdir} PKG_DEVLIB_DIR=${libdir}"
-
-do_install () {
-	oe_runmake install install-lib install-dev DIST_ROOT="${D}" ZIP="gzip -n"
-}
-
-do_install_append_class-native () {
-	if test "${libdir}" = "${base_libdir}" ; then
-		return
-	fi
-	librelpath=${@os.path.relpath(d.getVar('libdir'), d.getVar('base_libdir'))}
-	baselibrelpath=${@os.path.relpath(d.getVar('base_libdir'), d.getVar('libdir'))}
-
-	# Remove bad symlinks & create the correct symlinks
-	if test -L ${D}${libdir}/lib${BPN}.so ; then
-		rm -rf ${D}${libdir}/lib${BPN}.so
-		ln -sf $baselibrelpath/lib${BPN}.so ${D}${libdir}/lib${BPN}.so
-	fi
-	if test -L ${D}${base_libdir}/lib${BPN}.a ; then
-		rm -rf ${D}${base_libdir}/lib${BPN}.a
-		ln -sf $librelpath/lib${BPN}.a ${D}${base_libdir}/lib${BPN}.a
-	fi
-	if test -L  ${D}${base_libdir}/lib${BPN}.la ; then
-		rm -rf ${D}${base_libdir}/lib${BPN}.la
-		ln -sf $librelpath/lib${BPN}.la ${D}${base_libdir}/lib${BPN}.la
-	fi
-}
-
-PACKAGES =+ "lib${BPN}"
-
-FILES_lib${BPN} = "${base_libdir}/lib*${SOLIBS}"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch b/meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch
deleted file mode 100644
index 1c1159f2c9..0000000000
--- a/meta/recipes-support/attr/files/0001-Added-configure-option-to-enable-disable-static-libr.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 01256c61ba126449c46dd4ab5d5e145488b981fa Mon Sep 17 00:00:00 2001
-From: Amarnath Valluri <amarnath.valluri@intel.com>
-Date: Mon, 23 Jan 2017 13:25:13 +0200
-Subject: [PATCH] Added configure option to enable/disable static library
-
-Create static library archive only in case of --enable-static.
-
-Upstream-Status: Pending
-
-Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
----
- configure.ac         | 6 ++++++
- include/builddefs.in | 1 +
- include/buildmacros  | 3 +++
- 3 files changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index b966d0e..e48268b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -26,6 +26,12 @@ AC_ARG_ENABLE(shared,
- 	enable_shared=yes)
- AC_SUBST(enable_shared)
- 
-+AC_ARG_ENABLE(static,
-+[ --enable-static=[yes/no] Enable use of static libraries [default=yes]],,
-+	enable_static=yes)
-+AC_SUBST(enable_static)
-+
-+
- AC_ARG_ENABLE(gettext,
- [ --enable-gettext=[yes/no] Enable alternate language support [default=yes]],,
- 	enable_gettext=yes)
-diff --git a/include/builddefs.in b/include/builddefs.in
-index d9931db..3b3dbd2 100644
---- a/include/builddefs.in
-+++ b/include/builddefs.in
-@@ -71,6 +71,7 @@ RPMBUILD	= @rpmbuild@
- RPM_VERSION	= @rpm_version@
- 
- ENABLE_SHARED	= @enable_shared@
-+ENABLE_STATIC 	= @enable_static@
- ENABLE_GETTEXT	= @enable_gettext@
- 
- HAVE_ZIPPED_MANPAGES = @have_zipped_manpages@
-diff --git a/include/buildmacros b/include/buildmacros
-index 39fa7e2..b0f25c5 100644
---- a/include/buildmacros
-+++ b/include/buildmacros
-@@ -80,6 +80,7 @@ endif
- # /usr/lib.
- ifeq ($(ENABLE_SHARED),yes)
- INSTALL_LTLIB_DEV = \
-+	set -x; \
- 	cd $(TOPDIR)/$(LIBNAME)/.libs; \
- 	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR); \
- 	../$(INSTALL) -m 644 -T old_lib $(LIBNAME).lai $(PKG_DEVLIB_DIR); \
-@@ -88,7 +89,9 @@ INSTALL_LTLIB_DEV = \
- 	../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_LIB_DIR); \
- 	if test "x$(PKG_DEVLIB_DIR)" != "x$(PKG_LIB_DIR)" ; then \
- 	rel_lib_prefix=$$(echo $(PKG_LIB_DIR) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
-+	if test "$(ENABLE_STATIC)" = "yes" ; then \
- 	../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \
-+	fi ;\
- 	../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \
- 	rel_devlib_prefix=$$(echo $(PKG_DEVLIB_DIR) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
- 	../$(INSTALL) -S $$rel_devlib_prefix$(PKG_LIB_DIR)/$(LIBNAME).so $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \
--- 
-2.7.4
-
diff --git a/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch b/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
deleted file mode 100644
index d5ab83d7c6..0000000000
--- a/meta/recipes-support/attr/files/Remove-the-attr.5-man-page-moved-to-man-pages.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-From 6047c8522b91235ad1e835f44f5e36472d9d49b2 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
-Date: Wed, 22 Apr 2015 11:46:59 +0200
-Subject: [PATCH 2/2] Remove the attr.5 man page (moved to man-pages)
-
-Commit dce9b4448c7f2b22bd206cd068fb05cb2f3255b9 from
-https://git.savannah.nongnu.org/git/attr.git
-
-The attr.5 page is part of the extended attribute system call documentation,
-which has been moved into the man-pages package. Move the attr.5 page there
-as well.
-
-Upstream-Status: Backport
-
-[MA: updated to apply directly to v2.4.47]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- man/Makefile      |   2 +-
- man/man5/Makefile |  35 -------------
- man/man5/attr.5   | 153 ------------------------------------------------------
- 3 files changed, 1 insertion(+), 189 deletions(-)
- delete mode 100644 man/man5/Makefile
- delete mode 100644 man/man5/attr.5
-
-diff --git a/man/Makefile b/man/Makefile
-index 755daed..9301f09 100644
---- a/man/Makefile
-+++ b/man/Makefile
-@@ -19,7 +19,7 @@
- TOPDIR = ..
- include $(TOPDIR)/include/builddefs
- 
--SUBDIRS = man1 man3 man5
-+SUBDIRS = man1 man3
- 
- default : $(SUBDIRS)
- 
-diff --git a/man/man5/Makefile b/man/man5/Makefile
-deleted file mode 100644
-index 6b70d3d..0000000
---- a/man/man5/Makefile
-+++ /dev/null
-@@ -1,35 +0,0 @@
--#
--# Copyright (c) 2000, 2002 Silicon Graphics, Inc.  All Rights Reserved.
--# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
--#
--# This program is free software: you can redistribute it and/or modify it
--# under the terms of the GNU General Public License as published by
--# the Free Software Foundation, either version 2 of the License, or
--# (at your option) any later version.
--#
--# This program is distributed in the hope that it will be useful,
--# but WITHOUT ANY WARRANTY; without even the implied warranty of
--# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--# GNU General Public License for more details.
--#
--# You should have received a copy of the GNU General Public License
--# along with this program.  If not, see <http://www.gnu.org/licenses/>.
--#
--
--TOPDIR = ../..
--include $(TOPDIR)/include/builddefs
--
--MAN_SECTION	= 5
--
--MAN_PAGES	= $(shell echo *.$(MAN_SECTION))
--MAN_DEST	= $(PKG_MAN_DIR)/man$(MAN_SECTION)
--LSRCFILES	= $(MAN_PAGES)
--
--default : $(MAN_PAGES)
--
--include $(BUILDRULES)
--
--install : default
--	$(INSTALL) -m 755 -d $(MAN_DEST)
--	$(INSTALL_MAN)
--install-dev install-lib:
-diff --git a/man/man5/attr.5 b/man/man5/attr.5
-deleted file mode 100644
-index a02757d..0000000
---- a/man/man5/attr.5
-+++ /dev/null
-@@ -1,153 +0,0 @@
--.\" Extended attributes manual page
--.\"
--.\" Copyright (C) 2000, 2002, 2007  Andreas Gruenbacher <agruen@suse.de>
--.\" Copyright (C) 2001, 2002, 2004, 2007 Silicon Graphics, Inc.
--.\" All rights reserved.
--.\"
--.\" This is free documentation; you can redistribute it and/or
--.\" modify it under the terms of the GNU General Public License as
--.\" published by the Free Software Foundation; either version 2 of
--.\" the License, or (at your option) any later version.
--.\"
--.\" The GNU General Public License's references to "object code"
--.\" and "executables" are to be interpreted as the output of any
--.\" document formatting or typesetting system, including
--.\" intermediate and printed output.
--.\"
--.\" This manual is distributed in the hope that it will be useful,
--.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
--.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--.\" GNU General Public License for more details.
--.\"
--.\" You should have received a copy of the GNU General Public
--.\" License along with this manual.  If not, see
--.\" <http://www.gnu.org/licenses/>.
--.\"
--.TH ATTR 5
--.SH NAME
--attr - Extended attributes
--.SH DESCRIPTION
--Extended attributes are name:value pairs associated permanently with
--files and directories, similar to the environment strings associated
--with a process.
--An attribute may be defined or undefined.
--If it is defined, its value may be empty or non-empty.
--.PP
--Extended attributes are extensions to the normal attributes which are
--associated with all inodes in the system (i.e. the
--.BR stat (2)
--data).
--They are often used to provide additional functionality
--to a filesystem \- for example, additional security features such as
--Access Control Lists (ACLs) may be implemented using extended attributes.
--.PP
--Users with search access to a file or directory may retrieve a list of
--attribute names defined for that file or directory.
--.PP
--Extended attributes are accessed as atomic objects.
--Reading retrieves the whole value of an attribute and stores it in a buffer.
--Writing replaces any previous value with the new value.
--.PP
--Space consumed for extended attributes is counted towards the disk quotas
--of the file owner and file group.
--.PP
--Currently, support for extended attributes is implemented on Linux by the
--ext2, ext3, ext4, XFS, JFS and reiserfs filesystems.
--.SH EXTENDED ATTRIBUTE NAMESPACES
--Attribute names are zero-terminated strings.
--The attribute name is always specified in the fully qualified
--.IR namespace.attribute
--form, eg.
--.IR user.mime_type ,
--.IR trusted.md5sum ,
--.IR system.posix_acl_access ,
--or
--.IR security.selinux .
--.PP
--The namespace mechanism is used to define different classes of extended
--attributes.
--These different classes exist for several reasons, e.g. the permissions
--and capabilities required for manipulating extended attributes of one
--namespace may differ to another.
--.PP
--Currently the
--.IR security ,
--.IR system ,
--.IR trusted ,
--and
--.IR user
--extended attribute classes are defined as described below. Additional
--classes may be added in the future.
--.SS Extended security attributes
--The security attribute namespace is used by kernel security modules,
--such as Security Enhanced Linux.  
--Read and write access permissions to security attributes depend on the
--policy implemented for each security attribute by the security module.
--When no security module is loaded, all processes have read access to
--extended security attributes, and write access is limited to processes
--that have the CAP_SYS_ADMIN capability.
--.SS Extended system attributes
--Extended system attributes are used by the kernel to store system
--objects such as Access Control Lists and Capabilities.  Read and write
--access permissions to system attributes depend on the policy implemented
--for each system attribute implemented by filesystems in the kernel.
--.SS Trusted extended attributes
--Trusted extended attributes are visible and accessible only to processes that
--have the CAP_SYS_ADMIN capability (the super user usually has this
--capability).
--Attributes in this class are used to implement mechanisms in user
--space (i.e., outside the kernel) which keep information in extended attributes
--to which ordinary processes should not have access.
--.SS Extended user attributes
--Extended user attributes may be assigned to files and directories for
--storing arbitrary additional information such as the mime type,
--character set or encoding of a file. The access permissions for user
--attributes are defined by the file permission bits.
--.PP
--The file permission bits of regular files and directories are
--interpreted differently from the file permission bits of special files
--and symbolic links. For regular files and directories the file
--permission bits define access to the file's contents, while for device special
--files they define access to the device described by the special file.
--The file permissions of symbolic links are not used in access
--checks. These differences would allow users to consume filesystem resources in
--a way not controllable by disk quotas for group or world writable special files and directories.
--.PP
--For this reason, extended user attributes are only allowed for regular files and directories, and access to extended user attributes is restricted to the
--owner and to users with appropriate capabilities for directories with the
--sticky bit set (see the
--.BR chmod (1)
--manual page for an explanation of Sticky Directories).
--.SH FILESYSTEM DIFFERENCES
--The kernel and the filesystem may place limits on the maximum number
--and size of extended attributes that can be associated with a file.
--Some file systems, such as ext2/3 and reiserfs, require the filesystem
--to be mounted with the
--.B user_xattr
--mount option in order for extended user attributes to be used.
--.PP
--In the current ext2, ext3 and ext4 filesystem implementations, each
--extended attribute must fit on a single filesystem block (1024, 2048
--or 4096 bytes, depending on the block size specified when the
--filesystem was created).
--.PP
--In the XFS and reiserfs filesystem implementations, there is no
--practical limit on the number or size of extended attributes
--associated with a file, and the algorithms used to store extended
--attribute information on disk are scalable.
--.PP
--In the JFS filesystem implementation, names can be up to 255 bytes and
--values up to 65,535 bytes.
--.SH ADDITIONAL NOTES
--Since the filesystems on which extended attributes are stored might also
--be used on architectures with a different byte order and machine word
--size, care should be taken to store attribute values in an architecture
--independent format.
--.SH AUTHORS
--Andreas Gruenbacher,
--.RI < a.gruenbacher@bestbits.at >
--and the SGI XFS development team,
--.RI < linux-xfs@oss.sgi.com >.
--.SH SEE ALSO
--getfattr(1),
--setfattr(1).
--- 
-2.7.4
-
diff --git a/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch b/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
deleted file mode 100644
index 044c5a037c..0000000000
--- a/meta/recipes-support/attr/files/Remove-the-section-2-man-pages.patch
+++ /dev/null
@@ -1,666 +0,0 @@
-From b972600a26f3a930e53e2fce2625266a5d29813e Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
-Date: Tue, 14 Apr 2015 23:53:11 +0200
-Subject: [PATCH 1/2] Remove the section 2 man pages
-
-Commit 8d1263bca95722d66a6f8e83450f49d0956ea534 from upstream
-https://git.savannah.nongnu.org/git/attr.git/
-
-The section 2 man pages have long since been added to the man-pages package
-which documents all system calls; they were disabled in attr by default since
-January 2014.  Get rid of them here.
-
-Upstream-Status: Backport
-
-[MA: modified to apply directly to v2.4.47]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- man/Makefile           |   2 +-
- man/man2/Makefile      |  35 -----------
- man/man2/getxattr.2    | 143 --------------------------------------------
- man/man2/listxattr.2   | 158 -------------------------------------------------
- man/man2/removexattr.2 | 111 ----------------------------------
- man/man2/setxattr.2    | 143 --------------------------------------------
- 6 files changed, 1 insertion(+), 591 deletions(-)
- delete mode 100644 man/man2/Makefile
- delete mode 100644 man/man2/getxattr.2
- delete mode 100644 man/man2/listxattr.2
- delete mode 100644 man/man2/removexattr.2
- delete mode 100644 man/man2/setxattr.2
-
-diff --git a/man/Makefile b/man/Makefile
-index 9535426..755daed 100644
---- a/man/Makefile
-+++ b/man/Makefile
-@@ -19,7 +19,7 @@
- TOPDIR = ..
- include $(TOPDIR)/include/builddefs
- 
--SUBDIRS = man1 man2 man3 man5
-+SUBDIRS = man1 man3 man5
- 
- default : $(SUBDIRS)
- 
-diff --git a/man/man2/Makefile b/man/man2/Makefile
-deleted file mode 100644
-index d77309d..0000000
---- a/man/man2/Makefile
-+++ /dev/null
-@@ -1,35 +0,0 @@
--#
--# Copyright (c) 2000-2002 Silicon Graphics, Inc.  All Rights Reserved.
--# Copyright (C) 2009  Andreas Gruenbacher <agruen@suse.de>
--#
--# This program is free software: you can redistribute it and/or modify it
--# under the terms of the GNU General Public License as published by
--# the Free Software Foundation, either version 2 of the License, or
--# (at your option) any later version.
--#
--# This program is distributed in the hope that it will be useful,
--# but WITHOUT ANY WARRANTY; without even the implied warranty of
--# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--# GNU General Public License for more details.
--#
--# You should have received a copy of the GNU General Public License
--# along with this program.  If not, see <http://www.gnu.org/licenses/>.
--#
--
--TOPDIR = ../..
--include $(TOPDIR)/include/builddefs
--
--MAN_SECTION	= 2
--
--MAN_PAGES	= $(shell echo *.$(MAN_SECTION))
--MAN_DEST	= $(PKG_MAN_DIR)/man$(MAN_SECTION)
--LSRCFILES	= $(MAN_PAGES)
--
--default install : $(MAN_PAGES)
--
--include $(BUILDRULES)
--
--install-dev : default
--	$(INSTALL) -m 755 -d $(MAN_DEST)
--	$(INSTALL_MAN)
--install-lib:
-diff --git a/man/man2/getxattr.2 b/man/man2/getxattr.2
-deleted file mode 100644
-index 405ad89..0000000
---- a/man/man2/getxattr.2
-+++ /dev/null
-@@ -1,143 +0,0 @@
--.\"
--.\" Extended attributes system calls manual pages
--.\"
--.\" (C) Andreas Gruenbacher, February 2001
--.\" (C) Silicon Graphics Inc, September 2001
--.\"
--.\" This is free documentation; you can redistribute it and/or
--.\" modify it under the terms of the GNU General Public License as
--.\" published by the Free Software Foundation; either version 2 of
--.\" the License, or (at your option) any later version.
--.\"
--.\" The GNU General Public License's references to "object code"
--.\" and "executables" are to be interpreted as the output of any
--.\" document formatting or typesetting system, including
--.\" intermediate and printed output.
--.\"
--.\" This manual is distributed in the hope that it will be useful,
--.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
--.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--.\" GNU General Public License for more details.
--.\"
--.\" You should have received a copy of the GNU General Public
--.\" License along with this manual.  If not, see
--.\" <http://www.gnu.org/licenses/>.
--.\"
--.TH GETXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
--.SH NAME
--getxattr, lgetxattr, fgetxattr \- retrieve an extended attribute value
--.SH SYNOPSIS
--.fam C
--.nf
--.B #include <sys/types.h>
--.B #include <attr/xattr.h>
--.sp
--.BI "ssize_t getxattr (const char\ *" path ", const char\ *" name ",
--.BI "\t\t\t\t void\ *" value ", size_t " size );
--.BI "ssize_t lgetxattr (const char\ *" path ", const char\ *" name ",
--.BI "\t\t\t\t void\ *" value ", size_t " size );
--.BI "ssize_t fgetxattr (int " filedes ", const char\ *" name ",
--.BI "\t\t\t\t void\ *" value ", size_t " size );
--.fi
--.fam T
--.SH DESCRIPTION
--Extended attributes are
--.IR name :\c
--.I value
--pairs associated with inodes (files, directories, symlinks, etc).
--They are extensions to the normal attributes which are associated
--with all inodes in the system (i.e. the
--.BR stat (2)
--data).
--A complete overview of extended attributes concepts can be found in
--.BR attr (5).
--.PP
--.B getxattr
--retrieves the
--.I value
--of the extended attribute identified by
--.I name
--and associated with the given
--.I path
--in the filesystem.
--The length of the attribute
--.I value
--is returned.
--.PP
--.B lgetxattr
--is identical to 
--.BR getxattr ,
--except in the case of a symbolic link, where the link itself is
--interrogated, not the file that it refers to.
--.PP
--.B fgetxattr
--is identical to
--.BR getxattr ,
--only the open file pointed to by
--.I filedes
--(as returned by
--.BR open (2))
--is interrogated in place of
--.IR path .
--.PP
--An extended attribute
--.I name
--is a simple NULL-terminated string.
--The name includes a namespace prefix \- there may be several, disjoint
--namespaces associated with an individual inode.
--The value of an extended attribute is a chunk of arbitrary textual or
--binary data of specified length.
--.PP
--An empty buffer of
--.I size
--zero can be passed into these calls to return the current size of the
--named extended attribute, which can be used to estimate the size of a
--buffer which is sufficiently large to hold the value associated with
--the extended attribute.
--.PP
--The interface is designed to allow guessing of initial buffer
--sizes, and to enlarge buffers when the return value indicates
--that the buffer provided was too small.
--.SH RETURN VALUE
--On success, a positive number is returned indicating the size of the
--extended attribute value.
--On failure, \-1 is returned and
--.I errno
--is set appropriately.
--.PP
--If the named attribute does not exist, or the process has no access to
--this attribute,
--.I errno
--is set to ENOATTR.
--.PP
--If the
--.I size
--of the
--.I value
--buffer is too small to hold the result,
--.I errno
--is set to ERANGE.
--.PP
--If extended attributes are not supported by the filesystem, or are disabled,
--.I errno
--is set to ENOTSUP.
--.PP
--The errors documented for the
--.BR stat (2)
--system call are also applicable here.
--.SH AUTHORS
--Andreas Gruenbacher,
--.RI < a.gruenbacher@bestbits.at >
--and the SGI XFS development team,
--.RI < linux-xfs@oss.sgi.com >.
--Please send any bug reports or comments to these addresses.
--.SH SEE ALSO
--.BR getfattr (1),
--.BR setfattr (1),
--.BR open (2),
--.BR stat (2),
--.BR setxattr (2),
--.BR listxattr (2),
--.BR removexattr (2),
--and
--.BR attr (5).
-diff --git a/man/man2/listxattr.2 b/man/man2/listxattr.2
-deleted file mode 100644
-index 8b4371c..0000000
---- a/man/man2/listxattr.2
-+++ /dev/null
-@@ -1,158 +0,0 @@
--.\"
--.\" Extended attributes system calls manual pages
--.\"
--.\" (C) Andreas Gruenbacher, February 2001
--.\" (C) Silicon Graphics Inc, September 2001
--.\"
--.\" This is free documentation; you can redistribute it and/or
--.\" modify it under the terms of the GNU General Public License as
--.\" published by the Free Software Foundation; either version 2 of
--.\" the License, or (at your option) any later version.
--.\"
--.\" The GNU General Public License's references to "object code"
--.\" and "executables" are to be interpreted as the output of any
--.\" document formatting or typesetting system, including
--.\" intermediate and printed output.
--.\"
--.\" This manual is distributed in the hope that it will be useful,
--.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
--.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--.\" GNU General Public License for more details.
--.\"
--.\" You should have received a copy of the GNU General Public
--.\" License along with this manual.  If not, see
--.\" <http://www.gnu.org/licenses/>.
--.\"
--.TH LISTXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
--.SH NAME
--listxattr, llistxattr, flistxattr \- list extended attribute names
--.SH SYNOPSIS
--.fam C
--.nf
--.B #include <sys/types.h>
--.B #include <attr/xattr.h>
--.sp
--.BI "ssize_t listxattr (const char\ *" path ",
--.BI "\t\t\t\t char\ *" list ", size_t " size );
--.BI "ssize_t llistxattr (const char\ *" path ",
--.BI "\t\t\t\t char\ *" list ", size_t " size );
--.BI "ssize_t flistxattr (int " filedes ",
--.BI "\t\t\t\t char\ *" list ", size_t " size );
--.fi
--.fam T
--.SH DESCRIPTION
--Extended attributes are name:value
--pairs associated with inodes (files, directories, symlinks, etc).
--They are extensions to the normal attributes which are associated
--with all inodes in the system (i.e. the
--.BR stat (2)
--data).
--A complete overview of extended attributes concepts can be found in
--.BR attr (5).
--.PP
--.B listxattr
--retrieves the
--.I list
--of extended attribute names associated with the given
--.I path
--in the filesystem.
--The list is the set of (NULL-terminated) names, one after the other.
--Names of extended attributes to which the calling process does not
--have access may be omitted from the list.
--The length of the attribute name
--.I list
--is returned.
--.PP
--.B llistxattr
--is identical to
--.BR listxattr ,
--except in the case of a symbolic link, where the list of names of
--extended attributes associated with the link itself is retrieved,
--not the file that it refers to.
--.I list
--is a caller-allocated buffer of size
--.IR size .
--.PP
--.B flistxattr
--is identical to
--.BR listxattr ,
--only the open file pointed to by
--.I filedes
--(as returned by
--.BR open (2))
--is interrogated in place of
--.IR path .
--.PP
--A single extended attribute
--.I name
--is a simple NULL-terminated string.
--The name includes a namespace prefix \- there may be several, disjoint
--namespaces associated with an individual inode.
--.PP
--An empty buffer of
--.I size
--zero can be passed into these calls to return the current size of the
--list of extended attribute names, which can be used to estimate the
--size of a buffer which is sufficiently large to hold the list of names.
--.SH EXAMPLES
--The
--.I list
--of names is returned as an unordered array of NULL-terminated character
--strings (attribute names are separated by NULL characters), like this:
--.fam C
--.RS
--.nf
--user.name1\\0system.name1\\0user.name2\\0
--.fi
--.RE
--.fam T
--.P
--Filesystems like ext2, ext3 and XFS which implement POSIX ACLs using
--extended attributes, might return a
--.I list
--like this:
--.fam C
--.RS
--.nf
--system.posix_acl_access\\0system.posix_acl_default\\0
--.fi
--.RE
--.fam T
--.SH RETURN VALUE
--On success, a positive number is returned indicating the size of the
--extended attribute name list.
--On failure, \-1 is returned and
--.I errno
--is set appropriately.
--.PP
--If the
--.I size
--of the
--.I list
--buffer is too small to hold the result,
--.I errno
--is set to ERANGE.
--.PP
--If extended attributes are not supported by the filesystem, or are disabled,
--.I errno
--is set to ENOTSUP.
--.PP
--The errors documented for the
--.BR stat (2)
--system call are also applicable here.
--.SH AUTHORS
--Andreas Gruenbacher,
--.RI < a.gruenbacher@bestbits.at >
--and the SGI XFS development team,
--.RI < linux-xfs@oss.sgi.com >.
--Please send any bug reports or comments to these addresses.
--.SH SEE ALSO
--.BR getfattr (1),
--.BR setfattr (1),
--.BR open (2),
--.BR stat (2),
--.BR getxattr (2),
--.BR setxattr (2),
--.BR removexattr (2),
--and
--.BR attr (5).
-diff --git a/man/man2/removexattr.2 b/man/man2/removexattr.2
-deleted file mode 100644
-index 2c7d934..0000000
---- a/man/man2/removexattr.2
-+++ /dev/null
-@@ -1,111 +0,0 @@
--.\"
--.\" Extended attributes system calls manual pages
--.\"
--.\" (C) Andreas Gruenbacher, February 2001
--.\" (C) Silicon Graphics Inc, September 2001
--.\"
--.\" This is free documentation; you can redistribute it and/or
--.\" modify it under the terms of the GNU General Public License as
--.\" published by the Free Software Foundation; either version 2 of
--.\" the License, or (at your option) any later version.
--.\"
--.\" The GNU General Public License's references to "object code"
--.\" and "executables" are to be interpreted as the output of any
--.\" document formatting or typesetting system, including
--.\" intermediate and printed output.
--.\"
--.\" This manual is distributed in the hope that it will be useful,
--.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
--.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--.\" GNU General Public License for more details.
--.\"
--.\" You should have received a copy of the GNU General Public
--.\" License along with this manual.  If not, see
--.\" <http://www.gnu.org/licenses/>.
--.\"
--.TH REMOVEXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
--.SH NAME
--removexattr, lremovexattr, fremovexattr \- remove an extended attribute
--.SH SYNOPSIS
--.fam C
--.nf
--.B #include <sys/types.h>
--.B #include <attr/xattr.h>
--.sp
--.BI "int removexattr (const char\ *" path ", const char\ *" name );
--.BI "int lremovexattr (const char\ *" path ", const char\ *" name );
--.BI "int fremovexattr (int " filedes ", const char\ *" name );
--.fi
--.fam T
--.SH DESCRIPTION
--Extended attributes are
--.IR name :\c
--value pairs associated with inodes (files, directories, symlinks, etc).
--They are extensions to the normal attributes which are associated
--with all inodes in the system (i.e. the
--.BR stat (2)
--data).
--A complete overview of extended attributes concepts can be found in
--.BR attr (5).
--.PP
--.B removexattr
--removes the extended attribute identified by
--.I name
--and associated with the given
--.I path
--in the filesystem.
--.PP
--.B lremovexattr
--is identical to 
--.BR removexattr ,
--except in the case of a symbolic link, where the extended attribute is
--removed from the link itself, not the file that it refers to.
--.PP
--.B fremovexattr
--is identical to
--.BR removexattr ,
--only the extended attribute is removed from the open file pointed to by
--.I filedes
--(as returned by
--.BR open (2))
--in place of
--.IR path .
--.PP
--An extended attribute name is a simple NULL-terminated string.
--The
--.I name
--includes a namespace prefix \- there may be several, disjoint
--namespaces associated with an individual inode.
--.SH RETURN VALUE
--On success, zero is returned.
--On failure, \-1 is returned and
--.I errno
--is set appropriately.
--.PP
--If the named attribute does not exist,
--.I errno
--is set to ENOATTR.
--.PP
--If extended attributes are not supported by the filesystem, or are disabled,
--.I errno
--is set to ENOTSUP.
--.PP
--The errors documented for the
--.BR stat (2)
--system call are also applicable here.
--.SH AUTHORS
--Andreas Gruenbacher,
--.RI < a.gruenbacher@bestbits.at >
--and the SGI XFS development team,
--.RI < linux-xfs@oss.sgi.com >.
--Please send any bug reports or comments to these addresses.
--.SH SEE ALSO
--.BR getfattr (1),
--.BR setfattr (1),
--.BR open (2),
--.BR stat (2),
--.BR setxattr (2),
--.BR getxattr (2),
--.BR listxattr (2),
--and
--.BR attr (5).
-diff --git a/man/man2/setxattr.2 b/man/man2/setxattr.2
-deleted file mode 100644
-index b20dc9f..0000000
---- a/man/man2/setxattr.2
-+++ /dev/null
-@@ -1,143 +0,0 @@
--.\"
--.\" Extended attributes system calls manual pages
--.\"
--.\" (C) Andreas Gruenbacher, February 2001
--.\" (C) Silicon Graphics Inc, September 2001
--.\"
--.\" This is free documentation; you can redistribute it and/or
--.\" modify it under the terms of the GNU General Public License as
--.\" published by the Free Software Foundation; either version 2 of
--.\" the License, or (at your option) any later version.
--.\"
--.\" The GNU General Public License's references to "object code"
--.\" and "executables" are to be interpreted as the output of any
--.\" document formatting or typesetting system, including
--.\" intermediate and printed output.
--.\"
--.\" This manual is distributed in the hope that it will be useful,
--.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
--.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--.\" GNU General Public License for more details.
--.\"
--.\" You should have received a copy of the GNU General Public
--.\" License along with this manual.  If not, see
--.\" <http://www.gnu.org/licenses/>.
--.\"
--.TH SETXATTR 2 "Extended Attributes" "Dec 2001" "System calls"
--.SH NAME
--setxattr, lsetxattr, fsetxattr \- set an extended attribute value
--.SH SYNOPSIS
--.fam C
--.nf
--.B #include <sys/types.h>
--.B #include <attr/xattr.h>
--.sp
--.BI "int setxattr (const char\ *" path ", const char\ *" name ",
--.BI "\t\t\t const void\ *" value ", size_t " size ", int " flags );
--.BI "int lsetxattr (const char\ *" path ", const char\ *" name ",
--.BI "\t\t\t const void\ *" value ", size_t " size ", int " flags );
--.BI "int fsetxattr (int " filedes ", const char\ *" name ",
--.BI "\t\t\t const void\ *" value ", size_t " size ", int " flags );
--.fi
--.fam T
--.SH DESCRIPTION
--Extended attributes are
--.IR name :\c
--.I value
--pairs associated with inodes (files, directories, symlinks, etc).
--They are extensions to the normal attributes which are associated
--with all inodes in the system (i.e. the
--.BR stat (2)
--data).
--A complete overview of extended attributes concepts can be found in
--.BR attr (5).
--.PP
--.B setxattr
--sets the
--.I value
--of the extended attribute identified by
--.I name
--and associated with the given
--.I path
--in the filesystem.
--The
--.I size
--of the
--.I value
--must be specified.
--.PP
--.B lsetxattr
--is identical to 
--.BR setxattr ,
--except in the case of a symbolic link, where the extended attribute is
--set on the link itself, not the file that it refers to.
--.PP
--.B fsetxattr
--is identical to
--.BR setxattr ,
--only the extended attribute is set on the open file pointed to by
--.I filedes
--(as returned by
--.BR open (2))
--in place of
--.IR path .
--.PP
--An extended attribute name is a simple NULL-terminated string.
--The
--.I name
--includes a namespace prefix \- there may be several, disjoint
--namespaces associated with an individual inode.
--The
--.I value
--of an extended attribute is a chunk of arbitrary textual or
--binary data of specified length.
--.PP
--The
--.I flags
--parameter can be used to refine the semantics of the operation.
--XATTR_CREATE specifies a pure create, which fails if the named
--attribute exists already.
--XATTR_REPLACE specifies a pure replace operation, which fails if the
--named attribute does not already exist.
--By default (no flags), the extended attribute will be created if
--need be, or will simply replace the value if the attribute exists.
--.SH RETURN VALUE
--On success, zero is returned.
--On failure, \-1 is returned and
--.I errno
--is set appropriately.
--.PP
--If XATTR_CREATE is specified, and the attribute exists already,
--.I errno
--is set to EEXIST.
--If XATTR_REPLACE is specified, and the attribute does not exist,
--.I errno
--is set to ENOATTR.
--.PP
--If there is insufficient space remaining to store the extended attribute,
--.I errno
--is set to either ENOSPC, or EDQUOT if quota enforcement was the cause.
--.PP
--If extended attributes are not supported by the filesystem, or are disabled,
--.I errno
--is set to ENOTSUP.
--.PP
--The errors documented for the
--.BR stat (2)
--system call are also applicable here.
--.SH AUTHORS
--Andreas Gruenbacher,
--.RI < a.gruenbacher@bestbits.at >
--and the SGI XFS development team,
--.RI < linux-xfs@oss.sgi.com >.
--Please send any bug reports or comments to these addresses.
--.SH SEE ALSO
--.BR getfattr (1),
--.BR setfattr (1),
--.BR open (2),
--.BR stat (2),
--.BR getxattr (2),
--.BR listxattr (2),
--.BR removexattr (2),
--and
--.BR attr (5).
--- 
-2.7.4
-
diff --git a/meta/recipes-support/attr/files/relative-libdir.patch b/meta/recipes-support/attr/files/relative-libdir.patch
deleted file mode 100644
index b72bf184d6..0000000000
--- a/meta/recipes-support/attr/files/relative-libdir.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-use relative path in symbolic links, or it fails in staging
-sed expression from udev
-
-7/29/2010 - created by Qing He <qing.he@intel.com>
-
-diff -u include.orig/buildmacros include/buildmacros
---- include.orig/buildmacros	2010-07-29 17:39:48.000000000 +0800
-+++ include/buildmacros	2010-07-29 18:20:34.000000000 +0800
-@@ -88,9 +88,11 @@
- 	../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
- 	../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_LIB_DIR); \
- 	if test "x$(PKG_DEVLIB_DIR)" != "x$(PKG_LIB_DIR)" ; then \
--	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \
--	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \
--	../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).so $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \
-+	rel_lib_prefix=$$(echo $(PKG_LIB_DIR) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
-+	../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \
-+	../$(INSTALL) -S $$rel_lib_prefix$(PKG_DEVLIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \
-+	rel_devlib_prefix=$$(echo $(PKG_DEVLIB_DIR) | sed 's,\(^/\|\)[^/][^/]*,..,g'); \
-+	../$(INSTALL) -S $$rel_devlib_prefix$(PKG_LIB_DIR)/$(LIBNAME).so $(PKG_DEVLIB_DIR)/$(LIBNAME).so; \
- 	fi
- else
- INSTALL_LTLIB_DEV = $(INSTALL_LTLIB_STATIC)
diff --git a/meta/recipes-support/attr/files/run-ptest b/meta/recipes-support/attr/files/run-ptest
deleted file mode 100644
index a6c6867f2d..0000000000
--- a/meta/recipes-support/attr/files/run-ptest
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-make -C test -k tests root-tests |sed \
- -e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
- -e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
-- 
2.19.2


