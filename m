Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2788C6057B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 03:01:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2016 20:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,549,1455004800"; d="scan'208";a="965094837"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2016 20:01:03 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 20:01:56 -0700
Message-Id: <1461898916-20805-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH] sysvinit-inittab: restrict labels to 4 chars
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
X-List-Received-Date: Fri, 29 Apr 2016 03:01:05 -0000

The current recipe creates inittab labels based off the device node name
of TTYs used as consoles. If those names exceed the 4 character label
limit of inittab, it will break. This change takes the last 4 chars of
the device names in order to avoid any errors.

[ YOCTO #9529 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index c5b8cdc..bdc3416 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -26,7 +26,8 @@ do_install() {
     for i in $tmp
     do
 	j=`echo ${i} | sed s/\;/\ /g`
-	label=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
+	l=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
+	label=`echo $l | sed 's/.*\(....\)/\1/'`
 	echo "$label:12345:respawn:${base_bindir}/start_getty ${j}" >> ${D}${sysconfdir}/inittab
     done
 
-- 
2.8.0


