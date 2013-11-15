Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4366A6D9B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 01:52:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Nov 2013 17:52:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,703,1378882800"; d="scan'208";a="427974015"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.61])
	by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2013 17:52:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2013 17:52:13 -0800
Message-Id: <1384480333-7671-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] sysvinit: unmount the psplash lazyily
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
X-List-Received-Date: Fri, 15 Nov 2013 01:52:13 -0000

There is an race condition where psplash is not quite exited before the unmount occurs
causing a umount: /mnt/.psplash: target is busy message to appear, it's ok to lazyily
unmount and not get this message

[YOCTO #5244]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 655a0b0..1f400d9 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -174,6 +174,6 @@ startup() {
 if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; then
     if type psplash-write >/dev/null 2>&1; then
         TMPDIR=/mnt/.psplash psplash-write "QUIT" || true
-    	umount /mnt/.psplash
+    	umount -l /mnt/.psplash
     fi
 fi
-- 
1.8.3.1


