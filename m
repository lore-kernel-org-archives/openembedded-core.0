Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rH-0005ws-FL
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250226"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:26:46 -0700
Message-Id: <cdfa5a93d862f5b0fa4b8b723e825411906ad8c6.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/27] base-passwd: move initial criation of group and passwd to preinst
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Oct 2011 18:33:19 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

To allow use and manipulation of users and groups at rootfs building
time, the '/etc/passwd' and '/etc/group' needs to be available as soon
as possible.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index 137512d..aa90a6d 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r3"
+PR = "r4"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
@@ -37,6 +37,23 @@ do_install () {
 	install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
 }
 
+pkg_preinst_${PN} () {
+	set -e
+
+	# Used for rootfs generation. On in-target install this will be run
+        # before the unpack so the files won't be available
+
+	if [ ! -e $D${sysconfdir}/passwd ] && [ -e $D${datadir}/base-passwd/passwd.master ]; then
+		cp $D${datadir}/base-passwd/passwd.master $D${sysconfdir}/passwd
+	fi
+
+	if [ ! -e $D${sysconfdir}/group ] && [ -e $D${datadir}/base-passwd/group.master ]; then
+		cp $D${datadir}/base-passwd/group.master $D${sysconfdir}/group
+	fi
+
+	exit 0
+}
+
 pkg_postinst_${PN} () {
 	set -e
 
-- 
1.7.6.4



