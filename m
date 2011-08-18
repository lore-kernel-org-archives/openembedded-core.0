Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hp-0006dG-CZ
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980289"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:33 -0700
Message-Id: <5eecd3cf496880ef9ac98917881081144c7033ce.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/32] at: make at usable for common user
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:49 -0000

From: Kang Kai <kai.kang@windriver.com>

Fixes [Yocto #1297]

The pkg_postinst was added to fix Yocto #675. But it seems not needed
any more. Remove it then unprivilege user could use at.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/at/at_3.1.12.bb |   26 +++++---------------------
 1 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.12.bb b/meta/recipes-extended/at/at_3.1.12.bb
index c76b50e..baf15df 100644
--- a/meta/recipes-extended/at/at_3.1.12.bb
+++ b/meta/recipes-extended/at/at_3.1.12.bb
@@ -4,11 +4,14 @@ the system load levels drop to a particular level."
 SECTION = "base"
 LICENSE="GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
-DEPENDS = "flex libpam initscripts \
+DEPENDS = "flex initscripts \
 	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+RDEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
+PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
+
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
@@ -56,23 +59,4 @@ do_install () {
 	done
 }
 
-pkg_postinst_${PN} () {
-	if [ "x$D" != "x" ] ; then
-		exit 1
-	fi
-
-	# below is necessary to allow at usable to normal users
-	# now at is has its own /var/spool/at instead of under /var/spool/cron
-	# this way is better to allow setgid on both sides
-	grep "^daemon" /etc/group || groupadd daemon
-	chown root:daemon /usr/bin/at
-	chmod 2755 /usr/bin/at
-
-	chown root:daemon -R /var/spool/at
-	chmod 770 -R /var/spool/at
-
-	chown root:daemon /etc/at.deny
-	chmod 640 /etc/at.deny
-}
-
 PARALLEL_MAKE = ""
-- 
1.7.6



