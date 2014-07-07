Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 20A276AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 00:43:02 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1X3x1L-0004yZ-4j from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jul 2014 17:43:03 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 6 Jul 2014 17:43:02 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.2.247.3; Sun, 6 Jul 2014 17:42:50 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Jul 2014 20:42:59 -0400
Message-ID: <1404693780-11126-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 07 Jul 2014 00:43:02.0790 (UTC)
	FILETIME=[68A87A60:01CF997C]
Subject: [PATCH 1/2] init-install-efi.sh: Verify /sys based files exist before displaying them
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
X-List-Received-Date: Mon, 07 Jul 2014 00:43:07 -0000
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


