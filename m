Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1D66B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:27:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Jan 2014 03:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,662,1384329600"; d="scan'208";a="439169822"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by orsmga001.jf.intel.com with ESMTP; 15 Jan 2014 03:27:10 -0800
Received: from irsectmgbld0302.ir.intel.com (irsectmgbld0302.ir.intel.com
	[163.33.26.92])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	s0FBR84v009304; Wed, 15 Jan 2014 11:27:08 GMT
Received: from irsectmgbld0302.ir.intel.com (localhost [127.0.0.1])
	by irsectmgbld0302.ir.intel.com with ESMTP id s0FBR8Af056853;
	Wed, 15 Jan 2014 11:27:08 GMT
Received: (from kmsywula@localhost)
	by irsectmgbld0302.ir.intel.com with œ id s0FBR8V2056808;
	Wed, 15 Jan 2014 11:27:08 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 11:27:04 +0000
Message-Id: <1389785224-56756-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.12.2
Subject: [PATCH] initrdscripts: add $CMDLINE to init-live switch_root
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
X-List-Received-Date: Wed, 15 Jan 2014 11:27:34 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

init-live.sh: $CMDLINE variable should be provided to switch_root
to let user specify runlevel on grub command line.
Feeding with -c /dev/console as well as busybox switch_root enables that option.

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index bd259b9..7e27f91 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -89,7 +89,10 @@ boot_live_root() {
     mount -n --move /dev ${ROOT_MOUNT}/dev
 
     cd $ROOT_MOUNT
-    exec switch_root $ROOT_MOUNT /sbin/init
+
+    # busybox switch_root supports -c option
+    exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init $CMDLINE ||
+        fatal "Couldn't switch_root, dropping to shell"
 }
 
 fatal() {
-- 
1.7.12.2


