Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6A07097F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 00:49:33 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XCeYo-0001M5-0p from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jul 2014 17:49:34 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 30 Jul 2014 17:49:33 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 30 Jul 2014 17:49:33 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 20:49:30 -0400
Message-ID: <1406767772-7963-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 31 Jul 2014 00:49:33.0913 (UTC)
	FILETIME=[4BB31C90:01CFAC59]
Subject: [PATCH 1/3] init-install-efi.sh: Verify /sys based files exist before displaying them
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
X-List-Received-Date: Thu, 31 Jul 2014 00:49:35 -0000
Content-Type: text/plain

Some mmc cards do not have all the data files in /sys/block
populated.  Check for existence before displaying the files
to avoid erroring out of the install process.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index fcf21cd..b142ed4 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -47,9 +47,14 @@ for hdname in $hdnamelist; do
 	echo -n "VENDOR="
 	cat /sys/block/$hdname/device/vendor
     fi
-    echo -n "MODEL="
-    cat /sys/block/$hdname/device/model
-    cat /sys/block/$hdname/device/uevent
+    if [ -r /sys/block/$hdname/device/model ]; then
+        echo -n "MODEL="
+        cat /sys/block/$hdname/device/model
+    fi
+    if [ -r /sys/block/$hdname/device/uevent ]; then
+        echo -n "UEVENT="
+        cat /sys/block/$hdname/device/uevent
+    fi
     echo
     # Get user choice
     while true; do
-- 
1.9.1


