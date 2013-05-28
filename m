Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 578256A49F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 08:59:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 28 May 2013 01:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,756,1363158000"; d="scan'208";a="341212584"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.40])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2013 01:59:02 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2013 11:59:38 +0300
Message-Id: <1369731579-13048-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Replaced "stty sane" with saved stty settings
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
X-List-Received-Date: Tue, 28 May 2013 08:59:17 -0000

stty manual says :

"sane - Resets all modes to reasonable values for interactive terminal use."

But reasonable isn't the most viable solution, because we want to keep the
original stty settings before running runqemu. Saving the stty settings and
setting them at the end of the runqemu script solves the terminal
settings differences after the script ran.

[Yocto #4512]

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 scripts/runqemu-internal |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index d4825d1..4f3ba7b 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -104,6 +104,9 @@ fi
 
 NFSRUNNING="false"
 
+#capture original stty values
+ORIG_STTY=$(stty -g)
+
 if [ "$SLIRP_ENABLED" = "yes" ]; then
     KERNEL_NETWORK_CMD=""
     QEMU_TAP_CMD=""
@@ -221,7 +224,11 @@ else
             fi
             # If QEMU crashes or somehow tty properties are not restored
             # after qemu exits, we need to run stty sane
-            stty sane
+            #stty sane
+
+            #instead of using stty sane we set the original stty values
+            stty ${ORIG_STTY}
+
         }
 
 
@@ -589,6 +596,8 @@ if [ "$SLIRP_ENABLED" != "yes" ]; then
         cleanup
 fi
 
+#set the original stty values before exit
+stty ${ORIG_STTY}
 trap - INT TERM QUIT
 
 return $ret
-- 
1.7.9.5


