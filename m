Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1URT6H-00046k-RD
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 22:00:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2013 12:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,471,1363158000"; d="scan'208";a="322199015"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.160])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2013 12:43:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2013 20:43:02 +0100
Message-Id: <1365968582-10662-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] rpm-postinsts: remove erroneous call to /etc/default/rcS
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
X-List-Received-Date: Sun, 14 Apr 2013 20:00:45 -0000

This doesn't work when the initscripts package is not installed (e.g.
when using systemd only) and is not even needed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm-postinsts.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
index a5310b5..3d2d05d 100644
--- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
+++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
@@ -36,7 +36,6 @@ if [ "x$D" != "x" ] && [ -f $D/var/lib/rpm/Packages ]; then
 	install -d $D/${sysconfdir}/rcS.d
 	cat > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << "EOF"
 #!/bin/sh
-. /etc/default/rcS
 
 [ -d /etc/rpm-postinsts ] && for i in `ls /etc/rpm-postinsts/`; do
 	i=/etc/rpm-postinsts/$i
-- 
1.7.10.4



