Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDCEB769A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:04:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G24FNV028049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:04:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:04:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2015 19:04:09 -0700
Message-ID: <0075836f863da6c65d6016a131e25fc2fbe759ac.1442311946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442311946.git.liezhi.yang@windriver.com>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] toolchain-shar-extract.sh: remove checkbashism
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
X-List-Received-Date: Wed, 16 Sep 2015 02:04:17 -0000
Content-Type: text/plain

Fixed when sh is bash:
$ sh ./tmp/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-1.8+snapshot.sh
Poky (Yocto Project Reference Distro) SDK installer version 1.8+snapshot
===========================================================
./tmp/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-1.8+snapshot.sh: 77: read: Illegal option -e
You are about to install the SDK to "/opt/poky/1.8+snapshot". Proceed[Y/n]? ../SDK2
Installation aborted!

There is ony one bashism "read -e" in toolchain-shar-extract.sh, but
'-e' is useless here, so remove it and use /bin/sh.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/files/toolchain-shar-extract.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index cd0a547..b56bab0 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
@@ -86,7 +86,7 @@ if [ "$target_sdk_dir" = "" ]; then
 	if [ "$answer" = "Y" ]; then
 		target_sdk_dir="$DEFAULT_INSTALL_DIR"
 	else
-		read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
+		read -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
 		[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
 	fi
 fi
-- 
1.7.9.5


