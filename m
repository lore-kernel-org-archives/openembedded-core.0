Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TvXfd-0001s8-SR
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 19:25:20 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jan 2013 10:09:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,480,1355126400"; d="scan'208";a="274584309"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.117])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jan 2013 10:09:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 18:09:27 +0000
Message-Id: <1358359767-18302-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] classes/rootfs_*: error out if postinstalls exist with read-only rootfs
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
X-List-Received-Date: Wed, 16 Jan 2013 18:25:22 -0000

If there are postinstall scripts to be run on first boot and
IMAGE_FEATURES contains "read-only-rootfs", we know this will fail on
the target device so just error out during do_rootfs. This check was
already implemented for ipk, so add it to the deb and rpm backends. Also
make all backends use bberror rather than just echo to display the
error.

Fixes [YOCTO #3407].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/rootfs_deb.bbclass |    7 +++++++
 meta/classes/rootfs_ipk.bbclass |    2 +-
 meta/classes/rootfs_rpm.bbclass |    9 +++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 293953d..9997996 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -70,6 +70,13 @@ fakeroot rootfs_deb_do_rootfs () {
 
 	set -e
 
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
+		if grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}/var/lib/dpkg/status; then
+			bberror "Some packages could not be configured offline and rootfs is read-only."
+			exit 1
+		fi
+	fi
+
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 5c962de..0e2fa12 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -83,7 +83,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
 		if grep Status:.install.ok.unpacked ${STATUS}; then
-			echo "Some packages could not be configured offline and rootfs is read-only."
+			bberror "Some packages could not be configured offline and rootfs is read-only."
 			exit 1
 		fi
 	fi
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 2bfd1b7..7d789cc 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -87,6 +87,15 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	${ROOTFS_POSTINSTALL_COMMAND}
 
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
+		if [ -d ${IMAGE_ROOTFS}/etc/rpm-postinsts ] ; then
+			if [ "`ls -A ${IMAGE_ROOTFS}/etc/rpm-postinsts`" != "" ] ; then
+				bberror "Some packages could not be configured offline and rootfs is read-only."
+				exit 1
+			fi
+		fi
+	fi
+
 	# Report delayed package scriptlets
 	for i in ${IMAGE_ROOTFS}/etc/rpm-postinsts/*; do
 		if [ -f $i ]; then
-- 
1.7.10.4



