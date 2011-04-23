Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWNi-00059M-8A
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:31:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Apr 2011 23:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="682838286"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2011 23:29:25 -0700
Message-Id: <06d75b1e554791daf7e7cfeebc78d7f240969c97.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Fri, 22 Apr 2011 14:03:53 +0800
Date: Fri, 22 Apr 2011 23:29:25 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 31/37] lsbsetup: add some workaround for LSB tests
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
X-List-Received-Date: Sat, 23 Apr 2011 06:31:51 -0000

From: Kang Kai <kai.kang@windriver.com>

Add some workaround for LSB libstdcpp and tcl tests.
Recreate locales for libstdcpp test, and resolve localhost is for
tcl test [Yocto 898]
Bump PR, update LICENSE information and installed file mode

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh |   15 ++++++++++++++-
 meta/recipes-extended/lsb/lsbsetup_0.9.bb       |    8 ++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
index 7ce823e..a8189e5 100644
--- a/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
+++ b/meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh
@@ -1,6 +1,6 @@
 #!/bin/bash
 
-# Copyright (c) 2005-2010 Wind River Systems, Inc.
+# Copyright (C) 2010-2011 Wind River Systems, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -201,6 +201,19 @@ fi
 addr=`ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}'|sed s/[[:space:]][[:space:]]Bcast//g`
 echo -e "you should input ${addr}:8888 on your browser"
 
+#workaround to add part of locales for LSB test
+localedef -i ja_JP -f EUC-JP ja_JP.eucjp
+localedef -i en_US -f ISO-8859-15  en_US.ISO-8859-15
+localedef -i en_US -f UTF-8 en_US.UTF-8
+localedef -i se_NO -f UTF-8 se_NO.UTF-8
+localedef -i de_DE -f ISO-8859-1 de_DE
+
+#resolve localhost 
+LOCALHOST=`hostname`
+if ! `grep -F -q "$LOCALHOST" /etc/hosts`; then
+    echo "127.0.0.1 $LOCALHOST" >> /etc/hosts
+fi
+
 #Step 10
 echo "Done!!"
 
diff --git a/meta/recipes-extended/lsb/lsbsetup_0.9.bb b/meta/recipes-extended/lsb/lsbsetup_0.9.bb
index 8cbaf1e..5fd0584 100644
--- a/meta/recipes-extended/lsb/lsbsetup_0.9.bb
+++ b/meta/recipes-extended/lsb/lsbsetup_0.9.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "auto-setup environment for lsb test"
 SECTION = "console/utils"
 PRIORITY = "required"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LSB_Setup.sh;md5=7391be3e70a02d44e1b183fa103b0585"
+LIC_FILES_CHKSUM = "file://LSB_Setup.sh;beginline=3;endline=16;md5=97451c7c0786ce5bbe9ac58042945583"
 
 SRC_URI = "file://LSB_Setup.sh"
 
@@ -12,6 +12,6 @@ S=${WORKDIR}
 
 do_install() {
         # Only install file if it has a contents
-	install -d ${D}/usr/bin
-        install -m 0644 ${S}/LSB_Setup.sh ${D}/usr/bin
+        install -d ${D}/usr/bin
+        install -m 0755 ${S}/LSB_Setup.sh ${D}/usr/bin
 }
-- 
1.7.1.1



