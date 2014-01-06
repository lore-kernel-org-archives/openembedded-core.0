Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB1260D86
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 10:21:07 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so7652180eek.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2014 02:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=JdA22ZqlS4fCPwwpQAuDDTp+eyHKcS/xVtyYm68FUmk=;
	b=sa2DuUgYCd3ljqnnGwghTprRqmi/lM/q7ezRz735W1fHTJDnD7qFNg+YTLDf4bRXLZ
	NpesrbW+2ZM5V+La2DoEH8jh7z9DV0RuHcJh4+Ok1cFFLPazyGITsi3QTJFOKrLnJkD9
	h1GlXMMysiPr3Ti4lEOQ7mVvUDH1XdfU/rnt/3Uow+PElxX8U6nTcFkP5lS4htN6uPES
	d+D9WEbsDafSV9yJQi+4MQ327kN4IGabLBUPBpuSYdnYMvB/NcV5Sl7fhvw0kM8+OD5y
	mRyGnoAhrbJs4MdDKyeBZgsZpgukK78lUeL7LKIa9xG9E8W2QIvcoYvTl4l/gqYxC4ER
	ynPw==
X-Received: by 10.14.5.194 with SMTP id 42mr2097747eel.100.1389003668141;
	Mon, 06 Jan 2014 02:21:08 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm169611841eek.5.2014.01.06.02.21.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jan 2014 02:21:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2014 11:21:12 +0100
Message-Id: <156c36261fd80dabae247760e9b4c22bec173851.1389003637.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389003637.git.Martin.Jansa@gmail.com>
References: <cover.1389003637.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389003637.git.Martin.Jansa@gmail.com>
References: <cover.1389003637.git.Martin.Jansa@gmail.com>
Subject: [dora][PATCH 1/2] ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
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
X-List-Received-Date: Mon, 06 Jan 2014 10:21:09 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* ltp installs 2 different runtests_noltp.sh files from different
  directories into /opt/ltp/testcases/bin/runtests_noltp.sh
  last one installed wins and causes unexpected changes in
  buildhistory's files-in-image.txt report, rename them to have
  unique name as other ltp scripts have.

* also define PREFERRED_PROVIDER to resolve note shown when
  building with meta-oe layer:
  NOTE: multiple providers are available for ltp (ltp, ltp-ddt)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match ltp

* use patch generated without -M
  in my builds both versions worked, but Saul reported that it fails to
  apply with:
  Applying patch
  0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
  patch: **** Only garbage was found in the patch input.

  Now I've see the same issue on different builder (with Ubuntu 12.04).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-providers.inc     |   2 +
 ...tests_noltp.sh-script-so-have-unique-name.patch | 202 +++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20130503.bb          |   4 +-
 3 files changed, 207 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d4b9db0..e2b0892 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -43,3 +43,5 @@ PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','system
 # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
 # on this rather strange entry.
 PREFERRED_PROVIDER_bluez4 ?= "bluez4"
+# Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
+PREFERRED_PROVIDER_ltp ?= "ltp"
diff --git a/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
new file mode 100644
index 0000000..1b4d232
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
@@ -0,0 +1,202 @@
+From 9751a6526cffcdf4e3dc2cb33641259a7be00e19 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 7 Dec 2013 18:24:32 +0100
+Subject: [PATCH] Rename runtests_noltp.sh script so have unique name
+
+* they are installed in the same target path
+  /opt/ltp/testcases/bin/runtests_noltp.sh
+  and overwrite each other in non-deterministic way
+  when multiple processes are used in "make install"
+
+  ./temp/log.do_install:install -m 00775
+    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/sysvipc/runtests_noltp.sh"
+    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
+  ./temp/log.do_install:install -m 00775
+    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/utsname/runtests_noltp.sh"
+    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ .../kernel/containers/sysvipc/runipctests_noltp.sh | 31 ++++++++++++++++
+ .../kernel/containers/sysvipc/runtests_noltp.sh    | 31 ----------------
+ .../kernel/containers/utsname/runtests_noltp.sh    | 41 ----------------------
+ .../kernel/containers/utsname/runutstests_noltp.sh | 41 ++++++++++++++++++++++
+ 4 files changed, 72 insertions(+), 72 deletions(-)
+ create mode 100644 testcases/kernel/containers/sysvipc/runipctests_noltp.sh
+ delete mode 100644 testcases/kernel/containers/sysvipc/runtests_noltp.sh
+ delete mode 100755 testcases/kernel/containers/utsname/runtests_noltp.sh
+ create mode 100755 testcases/kernel/containers/utsname/runutstests_noltp.sh
+
+diff --git a/testcases/kernel/containers/sysvipc/runipctests_noltp.sh b/testcases/kernel/containers/sysvipc/runipctests_noltp.sh
+new file mode 100644
+index 0000000..84f398f
+--- /dev/null
++++ b/testcases/kernel/containers/sysvipc/runipctests_noltp.sh
+@@ -0,0 +1,31 @@
++#!/bin/sh
++################################################################################
++##                                                                            ##
++## Copyright (c) International Business Machines  Corp., 2007                 ##
++##                                                                            ##
++## This program is free software;  you can redistribute it and#or modify      ##
++## it under the terms of the GNU General Public License as published by       ##
++## the Free Software Foundation; either version 2 of the License, or          ##
++## (at your option) any later version.                                        ##
++##                                                                            ##
++## This program is distributed in the hope that it will be useful, but        ##
++## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
++## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
++## for more details.                                                          ##
++##                                                                            ##
++## You should have received a copy of the GNU General Public License          ##
++## along with this program;  if not, write to the Free Software               ##
++## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
++##                                                                            ##
++################################################################################
++
++exit_code=0
++echo "sysvipc tests"
++for type in none clone unshare; do
++      echo "**sysvipc $type"
++      ./shmnstest_noltp $type
++      if [ $? -ne 0 ]; then
++              exit_code=$?
++      fi
++done
++exit $exit_code
+diff --git a/testcases/kernel/containers/sysvipc/runtests_noltp.sh b/testcases/kernel/containers/sysvipc/runtests_noltp.sh
+deleted file mode 100644
+index 84f398f..0000000
+--- a/testcases/kernel/containers/sysvipc/runtests_noltp.sh
++++ /dev/null
+@@ -1,31 +0,0 @@
+-#!/bin/sh
+-################################################################################
+-##                                                                            ##
+-## Copyright (c) International Business Machines  Corp., 2007                 ##
+-##                                                                            ##
+-## This program is free software;  you can redistribute it and#or modify      ##
+-## it under the terms of the GNU General Public License as published by       ##
+-## the Free Software Foundation; either version 2 of the License, or          ##
+-## (at your option) any later version.                                        ##
+-##                                                                            ##
+-## This program is distributed in the hope that it will be useful, but        ##
+-## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
+-## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
+-## for more details.                                                          ##
+-##                                                                            ##
+-## You should have received a copy of the GNU General Public License          ##
+-## along with this program;  if not, write to the Free Software               ##
+-## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
+-##                                                                            ##
+-################################################################################
+-
+-exit_code=0
+-echo "sysvipc tests"
+-for type in none clone unshare; do
+-      echo "**sysvipc $type"
+-      ./shmnstest_noltp $type
+-      if [ $? -ne 0 ]; then
+-              exit_code=$?
+-      fi
+-done
+-exit $exit_code
+diff --git a/testcases/kernel/containers/utsname/runtests_noltp.sh b/testcases/kernel/containers/utsname/runtests_noltp.sh
+deleted file mode 100755
+index 43cb7e2..0000000
+--- a/testcases/kernel/containers/utsname/runtests_noltp.sh
++++ /dev/null
+@@ -1,41 +0,0 @@
+-#!/bin/sh
+-################################################################################
+-##                                                                            ##
+-## Copyright (c) International Business Machines  Corp., 2007                 ##
+-##                                                                            ##
+-## This program is free software;  you can redistribute it and#or modify      ##
+-## it under the terms of the GNU General Public License as published by       ##
+-## the Free Software Foundation; either version 2 of the License, or          ##
+-## (at your option) any later version.                                        ##
+-##                                                                            ##
+-## This program is distributed in the hope that it will be useful, but        ##
+-## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
+-## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
+-## for more details.                                                          ##
+-##                                                                            ##
+-## You should have received a copy of the GNU General Public License          ##
+-## along with this program;  if not, write to the Free Software               ##
+-## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
+-##                                                                            ##
+-################################################################################
+-
+-oldhostname=`hostname`
+-exit_code=0
+-echo "unshare tests"
+-for i in `seq 1 5`; do
+-	echo "test $i (unshare)"
+-	./utstest_noltp unshare $i
+-	if [ $? -ne 0 ]; then
+-		exit_code=$?
+-	fi
+-done
+-echo "clone tests"
+-for i in `seq 1 5`; do
+-	echo "test $i (clone)"
+-	./utstest_noltp clone $i
+-	if [ $? -ne 0 ]; then
+-		exit_code=$?
+-	fi
+-done
+-hostname "$oldhostname"
+-exit $exit_code
+diff --git a/testcases/kernel/containers/utsname/runutstests_noltp.sh b/testcases/kernel/containers/utsname/runutstests_noltp.sh
+new file mode 100755
+index 0000000..43cb7e2
+--- /dev/null
++++ b/testcases/kernel/containers/utsname/runutstests_noltp.sh
+@@ -0,0 +1,41 @@
++#!/bin/sh
++################################################################################
++##                                                                            ##
++## Copyright (c) International Business Machines  Corp., 2007                 ##
++##                                                                            ##
++## This program is free software;  you can redistribute it and#or modify      ##
++## it under the terms of the GNU General Public License as published by       ##
++## the Free Software Foundation; either version 2 of the License, or          ##
++## (at your option) any later version.                                        ##
++##                                                                            ##
++## This program is distributed in the hope that it will be useful, but        ##
++## WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY ##
++## or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   ##
++## for more details.                                                          ##
++##                                                                            ##
++## You should have received a copy of the GNU General Public License          ##
++## along with this program;  if not, write to the Free Software               ##
++## Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    ##
++##                                                                            ##
++################################################################################
++
++oldhostname=`hostname`
++exit_code=0
++echo "unshare tests"
++for i in `seq 1 5`; do
++	echo "test $i (unshare)"
++	./utstest_noltp unshare $i
++	if [ $? -ne 0 ]; then
++		exit_code=$?
++	fi
++done
++echo "clone tests"
++for i in `seq 1 5`; do
++	echo "test $i (clone)"
++	./utstest_noltp clone $i
++	if [ $? -ne 0 ]; then
++		exit_code=$?
++	fi
++done
++hostname "$oldhostname"
++exit $exit_code
+-- 
+1.8.4.3
+
diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130503.bb
index 387826d..9e1183c 100644
--- a/meta/recipes-extended/ltp/ltp_20130503.bb
+++ b/meta/recipes-extended/ltp/ltp_20130503.bb
@@ -21,7 +21,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr libaio libcap acl openssl"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
+           file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
+"
 
 SRC_URI[md5sum] = "d448d9e9731d7ef45352fc74633cc97f"
 SRC_URI[sha256sum] = "afdb1479e73d4da7f0d4d5d3fe1570bc5fc96e3317d4a5c10c59c046d3dfa4a0"
-- 
1.8.5.2


