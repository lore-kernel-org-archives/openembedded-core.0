Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TkZ7x-0006qe-Qf
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 12:44:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2012 03:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="265377381"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2012 03:29:05 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 877A55606CE; Mon, 17 Dec 2012 13:29:15 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	damien.lespiau@intel.com, dvhart@linux.intel.com, radu.moisan@intel.com,
	otavio@ossystems.com.br
Date: Mon, 17 Dec 2012 13:29:13 +0200
Message-Id: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] init-live: default to initrd shell if image isn't found
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 11:44:59 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

If the init live fails to find and mount a root-fs image,
we should dump to a shell so that the developer can figure
what's wrong.

Prior art in Ubuntu. Also, leaving a system stale isn't good form.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index c591f0d..2d6d6f6 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -75,6 +75,7 @@ early_setup
 read_args
 
 echo "Waiting for removable media..."
+C=0
 while true
 do
   for i in `ls /media 2>/dev/null`; do
@@ -90,6 +91,11 @@ do
   if [ "$found" = "yes" ]; then
       break;
   fi
+  # don't wait for more than 3 seconds
+  C=$(( C + 1 ))
+  if [ $C -gt 3 ]; then
+      fatal "Cannot find root image on media"
+  fi
   sleep 1
 done
 
-- 
1.7.10.4



