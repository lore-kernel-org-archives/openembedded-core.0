Return-Path: <california.l.sullivan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CFAA76067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 21:44:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2016 14:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,353,1464678000"; d="scan'208";a="993973989"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2016 14:44:48 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 17:41:58 -0700
Message-Id: <1468370518-31136-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Cc: saul.wold@intel.com
Subject: [PATCH] initrdscripts/init-install*: Select install target instead of looping through
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
X-List-Received-Date: Tue, 12 Jul 2016 21:44:48 -0000

Its not immediately apparent that more than one install target could be
available. With this change we list the available devices up front then
prompt the user for which one to use, reducing confusion.

Fixes [YOCTO #9919].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 .../initrdscripts/files/init-install-efi.sh        | 22 ++++++++++++++--------
 .../initrdscripts/files/init-install.sh            | 22 ++++++++++++++--------
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index d58826a..f564f4e 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -78,17 +78,23 @@ for hdname in $hdnamelist; do
         cat /sys/block/$hdname/device/uevent
     fi
     echo
-    # Get user choice
-    while true; do
-        echo -n "Do you want to install this image there? [y/n] "
-        read answer
-        if [ "$answer" = "y" -o "$answer" = "n" ]; then
+done
+
+# Get user choice
+while true; do
+    echo "Please select an install target or press n to exit ($hdnamelist ): "
+    read answer
+    if [ "$answer" = "n" ]; then
+        echo "Installation manually aborted."
+        exit 1
+    fi
+    for hdname in $hdnamelist; do
+        if [ "$answer" = "$hdname" ]; then
+            TARGET_DEVICE_NAME=$answer
             break
         fi
-        echo "Please answer y or n"
     done
-    if [ "$answer" = "y" ]; then
-        TARGET_DEVICE_NAME=$hdname
+    if [ -n "$TARGET_DEVICE_NAME" ]; then
         break
     fi
 done
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index c5623ee..72ce92b 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -72,17 +72,23 @@ for hdname in $hdnamelist; do
         cat /sys/block/$hdname/device/uevent
     fi
     echo
-    # Get user choice
-    while true; do
-        echo -n "Do you want to install this image there? [y/n] "
-        read answer
-        if [ "$answer" = "y" -o "$answer" = "n" ]; then
+done
+
+# Get user choice
+while true; do
+    echo "Please select an install target or press n to exit ($hdnamelist ): "
+    read answer
+    if [ "$answer" = "n" ]; then
+        echo "Installation manually aborted."
+        exit 1
+    fi
+    for hdname in $hdnamelist; do
+        if [ "$answer" = "$hdname" ]; then
+            TARGET_DEVICE_NAME=$answer
             break
         fi
-        echo "Please answer y or n"
     done
-    if [ "$answer" = "y" ]; then
-        TARGET_DEVICE_NAME=$hdname
+    if [ -n "$TARGET_DEVICE_NAME" ]; then
         break
     fi
 done
-- 
2.5.5


