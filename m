Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C7FB371A00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 18:24:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2016 10:24:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="906838574"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga003.jf.intel.com with ESMTP; 29 Nov 2016 10:24:15 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 12:29:48 -0600
Message-Id: <1480444188-27310-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] sysvinit-inittab: fix getty device removal
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
X-List-Received-Date: Tue, 29 Nov 2016 18:24:14 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

getty devices were not being removed in some cases because device name
was not at the end of the line, for example a ttyS1 device:

S1:12345:respawn:/bin/start_getty 115200 ttyS1 vt102

Removing this limitation allows sed to remove any line containing
the device.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index c219cbf..dd30f43 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -62,7 +62,7 @@ if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
 		k=`echo ${i} | sed s/^.*\://g`
 		if [ -z "`grep ${j} /proc/consoles`" ]; then
 			if [ -z "${k}" ] || [ -z "`grep ${k} /proc/consoles`" ] || [ ! -e /dev/${j} ]; then
-				sed -i /^.*${j}$/d /etc/inittab
+				sed -i /^.*${j}/d /etc/inittab
 			fi
 		fi
 	done
-- 
2.1.4


