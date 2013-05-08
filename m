Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UaAzz-0006Ol-KH
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 22:30:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r48KBwjZ020380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 13:11:58 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 8 May 2013 13:11:58 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2013 13:11:57 -0700
Message-ID: <1368043917-25050-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] sysvinit-inittab: start runlevel 5 after terminals
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
X-List-Received-Date: Wed, 08 May 2013 20:30:43 -0000
Content-Type: text/plain

If xserver is started before getty is attached to
virtual terminals, the server might lose the ability
to accept keyboard input, so we go to runlevel 5 at the
very end of inittab.
---
 .../recipes-core/sysvinit/sysvinit-inittab/inittab |    4 +++-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/inittab b/meta/recipes-core/sysvinit/sysvinit-inittab/inittab
index 6abbdf4..519ae17 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/inittab
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/inittab
@@ -24,7 +24,9 @@ l1:1:wait:/etc/init.d/rc 1
 l2:2:wait:/etc/init.d/rc 2
 l3:3:wait:/etc/init.d/rc 3
 l4:4:wait:/etc/init.d/rc 4
-l5:5:wait:/etc/init.d/rc 5
+#
+# go into runlevel 5 ONLY after starting getty's
+#
 l6:6:wait:/etc/init.d/rc 6
 # Normally not reached, but fallthrough in case of emergency.
 z6:6:respawn:/sbin/sulogin
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 23c284d..d4cb6b9 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "file://inittab"
 
@@ -45,6 +45,10 @@ EOF
         done
         echo "" >> ${D}${sysconfdir}/inittab
     fi
+
+    # Going to runlevel 5 should be the last thing in inittab.
+    #
+    echo "l5:5:wait:/etc/init.d/rc 5" >> ${D}${sysconfdir}/inittab
 }
 
 pkg_postinst_${PN} () {
-- 
1.7.3.4



