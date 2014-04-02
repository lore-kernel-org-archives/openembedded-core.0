Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 66D8E6F242
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 16:04:32 +0000 (UTC)
Received: from [86.30.57.232] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.0.8)
	with ESMTPS id 375352167; Wed, 02 Apr 2014 12:04:32 -0400
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WVNeL-0008Ab-Qh; Wed, 02 Apr 2014 17:04:25 +0100
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WVNeL-0003uq-Pc; Wed, 02 Apr 2014 17:04:25 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 17:04:11 +0100
Message-Id: <1396454652-15016-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <CAMKF1spGE3gUM3gtkJOOeWJfc_6ekOa4XP7d=1tJEaMdQr+yvQ@mail.gmail.com>
References: <CAMKF1spGE3gUM3gtkJOOeWJfc_6ekOa4XP7d=1tJEaMdQr+yvQ@mail.gmail.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] cmake-native: Stop building ccmake
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
X-List-Received-Date: Wed, 02 Apr 2014 16:04:35 -0000

The bootstrapped cmake is called in such a way that it will automatically
enable building ccmake if curses is found. This tool isn't particularly
useful to us and it will cause build problems if ncurses-native is built in
parallel with cmake-native so let's just pass -DBUILD_CursesDialog=0 to
disable the feature altogether as the non-native cmake does.

Unfortunately this requires patching the bootstrap script since there
appears to be no way to get this option through.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb    |  5 ++++-
 .../cmake/cmake/disable-bootstrap-cursesdialog.patch    | 17 +++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/disable-bootstrap-cursesdialog.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
index 08b2c02..d032cb9 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
@@ -4,7 +4,10 @@ inherit native
 # Using cmake's internal libarchive, so some dependencies are needed
 DEPENDS += "bzip2-native zlib-native"
 
-SRC_URI += "file://cmlibarchive-disable-ext2fs.patch"
+SRC_URI += "\
+    file://cmlibarchive-disable-ext2fs.patch \
+    file://disable-bootstrap-cursesdialog.patch \
+"
 
 SRC_URI[md5sum] = "17c6513483d23590cbce6957ec6d1e66"
 SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a120e5e"
diff --git a/meta/recipes-devtools/cmake/cmake/disable-bootstrap-cursesdialog.patch b/meta/recipes-devtools/cmake/cmake/disable-bootstrap-cursesdialog.patch
new file mode 100644
index 0000000..9d378fb
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/disable-bootstrap-cursesdialog.patch
@@ -0,0 +1,17 @@
+Disable building CursesDialog so that cmake-native doesn't have to
+depend on ncurses-native.
+
+Upstream-status: Inappropriate [disable feature]
+
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+
+--- cmake-2.8.12.2/bootstrap~	2014-01-16 17:15:09.000000000 +0000
++++ cmake-2.8.12.2/bootstrap	2014-04-01 21:27:23.841996822 +0100
+@@ -1578,6 +1578,7 @@ export MAKE
+ 
+ # Run bootstrap CMake to configure real CMake
+ cmake_options="-DCMAKE_BOOTSTRAP=1"
++cmake_options="${cmake_options} -DBUILD_CursesDialog=0"
+ if [ -n "${cmake_verbose}" ]; then
+   cmake_options="${cmake_options} -DCMAKE_VERBOSE_MAKEFILE=1"
+ fi
-- 
1.8.5.3


