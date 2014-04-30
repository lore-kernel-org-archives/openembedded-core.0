Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 15DDD65D24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:41:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2014 05:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="531267806"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2014 05:32:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:32:02 +0100
Message-Id: <9dbd5d93498c7004a36d34c3ddf5480d7f263610.1398861075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/8] scripts/contrib/serdevtry: add script to handle transient serial terminals
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
X-List-Received-Date: Wed, 30 Apr 2014 12:41:43 -0000

When running automated tests (or just generally interacting with)
boards whose serial console devices are on the board itself and thus
disappear when powered down or practically disconnected, such as the
BeagleBone white, some terminal programs (e.g. picocom) will exit when
the device disappears and need to be restarted after the serial device
returns. This script handles this automatically for such terminal
programs.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/serdevtry | 60 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100755 scripts/contrib/serdevtry

diff --git a/scripts/contrib/serdevtry b/scripts/contrib/serdevtry
new file mode 100755
index 0000000..74bd7b7
--- /dev/null
+++ b/scripts/contrib/serdevtry
@@ -0,0 +1,60 @@
+#!/bin/sh
+
+# Copyright (C) 2014 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+if [ "$1" = "" -o "$1" = "--help" ] ; then
+    echo "Usage: $0 <serial terminal command>"
+    echo
+    echo "Simple script to handle maintaining a terminal for serial devices that"
+    echo "disappear when a device is powered down or reset, such as the USB"
+    echo "serial console on the original BeagleBone (white version)."
+    echo
+    echo "e.g. $0 picocom -b 115200 /dev/ttyUSB0"
+    echo
+    exit
+fi
+
+args="$@"
+DEVICE=""
+while [ "$1" != "" ]; do
+    case "$1" in
+        /dev/*)
+            DEVICE=$1
+            break;;
+    esac
+    shift
+done
+
+if [ "$DEVICE" != "" ] ; then
+    while true; do
+        if [ ! -e $DEVICE ] ; then
+            echo "serdevtry: waiting for $DEVICE to exist..."
+            while [ ! -e $DEVICE ]; do
+                sleep 0.1
+            done
+        fi
+        if [ ! -w $DEVICE ] ; then
+            # Sometimes (presumably because of a race with udev) we get to
+            # the device before its permissions have been set up
+            RETRYNUM=0
+            while [ ! -w $DEVICE ]; do
+                if [ "$RETRYNUM" = "2" ] ; then
+                    echo "Device $DEVICE exists but is not writable!"
+                    exit 1
+                fi
+                RETRYNUM=$((RETRYNUM+1))
+                sleep 0.1
+            done
+        fi
+        $args
+        if [ -e $DEVICE ] ; then
+            break
+        fi
+    done
+else
+    echo "Unable to determine device node from command: $args"
+    exit 1
+fi
+
-- 
1.9.0


