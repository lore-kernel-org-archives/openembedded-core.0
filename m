Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D4ABE71E30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 07:37:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1L7bBIb001188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Feb 2017 23:37:11 -0800 (PST)
Received: from pek-lpggp4.wrs.com (128.224.153.77) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Feb 2017 23:37:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 15:36:59 +0800
Message-ID: <d698b273f47b70ba0cd5280de185e96caa09ccf8.1487659929.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1487659929.git.hongxu.jia@windriver.com>
References: <cover.1487659929.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] ncurses: fix beaglebone do_configure failure
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
X-List-Received-Date: Tue, 21 Feb 2017 07:37:14 -0000
Content-Type: text/plain

In configure, the option ${HOST_CC_ARCH} was removed from ${CC}:
---------------
|configure:2188: WARNING: your environment misuses the CC variable
to hold CFLAGS/CPPFLAGS options
|configure:2284: testing resulting CC: 'arm-poky-linux-gnueabi-gcc
--sysroot=tmp/work/cortexa8hf-neon-poky-linux-gnueabi/ncurses/
6.0+20161126-r0/recipe-sysroot'
---------------

While arm compiling, option "-mfloat-abi=hard" in ${HOST_CC_ARCH}
lost that caused the failure:
---------------
|tmp/work/cortexa8hf-neon-poky-linux-gnueabi/ncurses/6.0+20161126-r0/
recipe-sysroot/usr/include/gnu/stubs.h:7:29: fatal error:
gnu/stubs-soft.h: No such file or directory
| # include <gnu/stubs-soft.h>
---------------

Remove the cf_flags checking, because OE have assigned CC/CFLAGS.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ncurses/files/removed-cflags-checking.patch    | 60 ++++++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.0+20161126.bb  |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/removed-cflags-checking.patch

diff --git a/meta/recipes-core/ncurses/files/removed-cflags-checking.patch b/meta/recipes-core/ncurses/files/removed-cflags-checking.patch
new file mode 100644
index 0000000..87be605
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/removed-cflags-checking.patch
@@ -0,0 +1,60 @@
+Remove cf_flags checking
+
+---------------
+|configure:2188: WARNING: your environment misuses the
+ CC variable to hold CFLAGS/CPPFLAGS options |configure:2284: testing
+ resulting CC: 'arm-poky-linux-gnueabi-gcc
+ --sysroot=tmp/work/cortexa8hf-neon-poky-linux-gnueabi/ncurses/
+ 6.0+20161126-r0/recipe-sysroot'
+---------------
+
+While arm compiling, option "-mfloat-abi=hard" in ${HOST_CC_ARCH}
+lost that caused the failure:
+---------------
+|tmp/work/cortexa8hf-neon-poky-linux-gnueabi/ncurses/6.0+20161126-r0/
+recipe-sysroot/usr/include/gnu/stubs.h:7:29: fatal error:
+gnu/stubs-soft.h: No such file or directory
+| # include <gnu/stubs-soft.h>
+---------------
+
+Do not do the cf_cflags check could avoid the failure.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ aclocal.m4 | 3 +--
+ configure  | 3 +--
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 4dc16ba..92f00fc 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -734,8 +734,7 @@ case "$CC" in
+ 	AC_MSG_RESULT(broken)
+ 	AC_MSG_WARN(your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options)
+ 	# humor him...
+-	cf_flags=`echo "$CC" | sed -e 's/^.*[[ 	]]\(-[[^ 	]]\)/\1/'`
+-	CC=`echo "$CC " | sed -e 's/[[ 	]]-[[^ 	]].*$//' -e 's/[[ 	]]*$//'`
++	cf_flags=""
+ 	for cf_arg in $cf_flags
+ 	do
+ 		case "x$cf_arg" in
+diff --git a/configure b/configure
+index b02eeb3..13adf90 100755
+--- a/configure
++++ b/configure
+@@ -2188,8 +2188,7 @@ echo "${ECHO_T}broken" >&6
+ 	{ echo "$as_me:2188: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&5
+ echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options" >&2;}
+ 	# humor him...
+-	cf_flags=`echo "$CC" | sed -e 's/^.*[ 	]\(-[^ 	]\)/\1/'`
+-	CC=`echo "$CC " | sed -e 's/[ 	]-[^ 	].*$//' -e 's/[ 	]*$//'`
++	cf_flags=""
+ 	for cf_arg in $cf_flags
+ 	do
+ 		case "x$cf_arg" in
+-- 
+2.8.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
index 7328e78..6c2a6eb 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
@@ -2,6 +2,7 @@ require ncurses.inc
 
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
+            file://removed-cflags-checking.patch \
 "
 # commit id corresponds to the revision in package version
 SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
-- 
2.9.3


