Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 101056C745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 16:43:45 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id a15so2393315eae.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P0jqHb9ua0AoNfrIB7ItxQEFNyEpW3nZlCjKmPwK1zI=;
	b=LkgzGQd8RXVTUWb1oUpVMcauWCrV0h1gAd3T22QNYESLWOJ7e75hxatbuXF5gpxYyc
	e0V0/MVM5dB9u6kny2VBudKCUGiILrP3f7USbL/5FiysU1CjEFtLxXF8gHk30Jj4xaS2
	aCm4ezZJAYzb8A8+H2ZSmSLp15j14miEDiLf4d2FsgZY7G3PlnISC0vLGR8hHiSahy4S
	iuuZKdobwBtzLQ5bLnIlcqnsgAm8ynlFCNUY3KffEtlA2Fmgbvf8azVFoMZIWrhM3fSb
	heRx3GFwSgr2wScrfvM6m1jSpUkOrAndeTXw6Gv+P/yoxvxfWnXBAIWKy4rJUa5BN9cW
	aVcg==
X-Received: by 10.14.105.7 with SMTP id j7mr9434658eeg.95.1386693824660;
	Tue, 10 Dec 2013 08:43:44 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm43197035eew.18.2013.12.10.08.43.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Dec 2013 08:43:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2013 17:44:02 +0100
Message-Id: <1386693842-6974-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <52A73622.4030608@linux.intel.com>
References: <52A73622.4030608@linux.intel.com>
Subject: [PATCHv2] ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
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
X-List-Received-Date: Tue, 10 Dec 2013 16:43:46 -0000

* ltp installs 2 different runtests_noltp.sh files from different
  directories into /opt/ltp/testcases/bin/runtests_noltp.sh
  last one installed wins and causes unexpected changes in
  buildhistory's files-in-image.txt report, rename them to have
  unique name as other ltp scripts have.

* also define PREFERRED_PROVIDER to resolve note shown when
  building with meta-oe layer:
  NOTE: multiple providers are available for ltp (ltp, ltp-ddt)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match ltp

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-providers.inc     |   2 +
 ...tests_noltp.sh-script-so-have-unique-name.patch | 202 +++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20130904.bb          |   4 +-
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
diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
index 5e10448..4722a38 100644
--- a/meta/recipes-extended/ltp/ltp_20130904.bb
+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
@@ -21,7 +21,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr libaio libcap acl openssl"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git"
+SRC_URI = "git://github.com/linux-test-project/ltp.git \
+           file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
+"
 
 SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
 S = "${WORKDIR}/git"
-- 
1.8.4.3


