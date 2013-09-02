Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7E46BA22
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 12:52:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Sep 2013 05:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1007,1367996400"; d="scan'208";a="397040825"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.155])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2013 05:52:26 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2013 15:50:51 +0300
Message-Id: <0a128d4a040bc934645cf69cdfaef15c4a518801.1378125322.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378125322.git.mihai.prica@intel.com>
References: <cover.1378125322.git.mihai.prica@intel.com>
In-Reply-To: <cover.1378125322.git.mihai.prica@intel.com>
References: <cover.1378125322.git.mihai.prica@intel.com>
Subject: [PATCH 1/1] scripts/runqemu: Fix MACHINE regex
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
X-List-Received-Date: Mon, 02 Sep 2013 12:52:26 -0000

When runqemu tries to determine the MACHINE variable from a
kernel or vmdk filename that doesn't contain any known machine
name, the variable gets set to the filename. It should remain
unset and cause an error.

[YOCTO #2890]

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 scripts/runqemu |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 04dc3b0..b496785 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -224,13 +224,13 @@ fi
 
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" = "xvmdk" ]; then
-        MACHINE=`basename $VM | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
+        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from vmdk filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/'`
+        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
-- 
1.7.9.5


