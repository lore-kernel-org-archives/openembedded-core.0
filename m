Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1U6YF7-0005AV-9z
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 04:15:31 +0100
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIA008Y1IU1BGB0@vms173015.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 19:59:04 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4E2E720011; Fri,
	15 Feb 2013 20:58:49 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2013 20:58:32 -0500
Message-id: <1360979912-470-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][for-danny] scripts/bitbake: Remove all instances of paths to a layer's scripts directory.
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
X-List-Received-Date: Sat, 16 Feb 2013 03:15:38 -0000

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Currently the assumption is made that only oe-core can include a scripts
  directory.

* However, when other layers create a scripts directory the bitbake script
  freaks out causing a infinite recursive loop until it crashes.

* Simply changing the regular expression to remove all instances of scripts path
  instead of just the first one fixes this problem.

 [Yocto Bug 3872]

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/bitbake | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 79a81ea..ca2bc82 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -126,7 +126,7 @@ if [ $needpseudo != "0" -a $buildpseudo -eq 0 ]; then
 fi
 
 OLDPATH=$PATH
-export PATH=`echo $PATH | sed s#[^:]*/scripts:##`
+export PATH=`echo $PATH | sed s#[^:]*/scripts:##g`
 if [ $buildpseudo -gt 0 ]; then
     [ $buildpseudo -eq 1 ] && echo "Pseudo is not present but is required, building this first before the main build"
     [ $buildpseudo -eq 2 ] && echo "Pseudo may be out of date, rebuilding pseudo before the main build"
-- 
1.8.1.2



