Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BFF066BCE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 10:35:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2013 03:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1006,1367996400"; d="scan'208";a="372188056"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.85])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2013 03:35:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2013 11:35:14 +0100
Message-Id: <1378118114-22820-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] runqemu: set memory size to 256M for most qemu machines
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
X-List-Received-Date: Mon, 02 Sep 2013 10:35:22 -0000

Set memory size to 256M for qemuarm, qemux86, qemux86-64, qemumips,
qemumips64, and qemuppc.

This allows the smart automated tests to run on machines with a GUI
environment (such as Sato) running at the same time, for which 128M is
too limiting. Setting this in runqemu allows users manually using
runqemu to avoid the same out-of-memory issues under similar conditions
using smart, on-target compilation or other uses.

Fixes [YOCTO #5045].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/runqemu-internal | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index f9d8728..485119f 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -42,22 +42,22 @@ if [ ! -z "$mem_set" ] ; then
 else
     case "$MACHINE" in
         "qemux86")
-            mem_size=128
+            mem_size=256
             ;;
         "qemux86-64")
-            mem_size=128
+            mem_size=256
             ;;
         "qemuarm")
-            mem_size=128
+            mem_size=256
             ;;
         "qemumicroblaze")
             mem_size=64
             ;;
         "qemumips"|"qemumips64")
-            mem_size=128
+            mem_size=256
             ;;
         "qemuppc")
-            mem_size=128
+            mem_size=256
             ;;
         "qemush4")
             mem_size=1024
-- 
1.8.1.2


