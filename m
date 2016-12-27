Return-Path: <jonathan.yong@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DEB4071D06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 06:47:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 26 Dec 2016 22:47:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,415,1477983600"; d="scan'208";a="1076585853"
Received: from vanguard-01.png.intel.com ([10.221.118.162])
	by orsmga001.jf.intel.com with ESMTP; 26 Dec 2016 22:47:41 -0800
From: "Yong, Jonathan" <jonathan.yong@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Dec 2016 06:47:35 +0000
Message-Id: <20161227064735.6552-1-jonathan.yong@intel.com>
X-Mailer: git-send-email 2.10.2
Cc: kim.tatt.chuah@intel.com
Subject: [PATCH] sysvinit-inittab: Make sure new shell from start_getty gets a controlling tty
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
X-List-Received-Date: Tue, 27 Dec 2016 06:47:42 -0000

Without exec, the processes from the new shell do not get a ctty:

	root@intel-corei7-64:~# ps -x | grep getty
	  755 tty1     Ss+    0:00 /sbin/getty 38400 tty1
	  791 ?        Ss     0:00 /bin/sh /bin/start_getty 115200 ttyS0
	  804 ?        S      0:00 grep getty

In particular, the openssh client fails:

	root@intel-corei7-64:~# ssh -v <target>
	<truncated>
	debug1: read_passphrase: can't open /dev/tty: No such device or address
	Host key verification failed.

This patch fixes those errors.

Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index e3d052a..ab238f6 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -1,5 +1,5 @@
 #!/bin/sh
 if [ -c /dev/$2 ]
 then 
-	/sbin/getty -L $1 $2 $3
+	exec /sbin/getty -L $1 $2 $3
 fi
-- 
2.10.2


