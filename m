Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 956A36C73E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:47:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rATClrYe027900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:47:53 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 04:47:53 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 20:48:09 +0800
Message-ID: <d19d1002b079e65e04e1efc97e90d49c55f8233b.1385728901.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385728901.git.Qi.Chen@windriver.com>
References: <cover.1385728901.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/18] linux-firmware: de-bash scripts to remove bash dependency
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
X-List-Received-Date: Fri, 29 Nov 2013 12:47:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

De-bash some script in linux-firmware to make it not dependent on
bash.

[YOCTO #5555]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/0001-linux-firmware-de-bash.patch        |   47 ++++++++++++++++++++
 .../linux-firmware/linux-firmware_git.bb           |    3 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/files/0001-linux-firmware-de-bash.patch

diff --git a/meta/recipes-kernel/linux-firmware/files/0001-linux-firmware-de-bash.patch b/meta/recipes-kernel/linux-firmware/files/0001-linux-firmware-de-bash.patch
new file mode 100644
index 0000000..223a45f
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/files/0001-linux-firmware-de-bash.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Pending
+
+Subject: linux-firmware: de-bash
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+---
+ carl9170fw/autogen.sh |    7 ++++---
+ configure             |    2 +-
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/carl9170fw/autogen.sh b/carl9170fw/autogen.sh
+index 6843f19..a340427 100755
+--- a/carl9170fw/autogen.sh
++++ b/carl9170fw/autogen.sh
+@@ -1,14 +1,15 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ set -e
+ 
+ case "$1" in
+ 	config)
+ 		echo "Configuring..."
+-		pushd config
++		cwd=`pwd`
++		cd config
+ 		cmake .
+ 		make
+-		popd
++		cd $cwd
+ 		config/conf Kconfig
+ 		cmake .
+ 	;;
+diff --git a/configure b/configure
+index 3260f9a..5e930f1 100644
+--- a/configure
++++ b/configure
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # -*- mode: sh -*-
+ # Our Makefile doesn't do srcdir != builddir
+ #buildapi-variable-no-builddir
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index fe6730a..ec463bf 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -28,7 +28,8 @@ SRCREV = "600caefd83a406540b2a789be6415e44c9b87add"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git \
+           file://0001-linux-firmware-de-bash.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


