Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma3-0004dc-Sj
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:55:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809726"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:50:04 -0700
Message-Id: <ffdbb7e649a68448bce78c2c3720e4d61573d53f.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/25] package_rpm: Fix attemptonly and suggest packages
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
X-List-Received-Date: Fri, 12 Aug 2011 07:55:01 -0000

From: Mark Hatle <mark.hatle@windriver.com>

[YOCTO #1325] [YOCTO #1366]

Packages that were in the PACKAGE_ATTEMPTONLY and SUGGESTS were not
being properly found, which was causing image creation failures.

In PACKAGE_ATTEMPTONLY, when an item was not found, it caused an
error.  This should have been a note, followed by skipping the
package.

The SUGGESTS processing was simply broken.  It was using a
non-existant function, due to an apparently typo.

In addition to the above, the MLPREFIX processing was not being
done properly, preventing multilib packages from working in this
with PACKAGE_ATTEMPTONLY.  (SUGGESTS doesn't need this as the names
are munged when creating the packages.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   25 ++++++++++++++++++++-----
 1 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 5c67f69..b15786d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -257,10 +257,16 @@ package_install_internal_rpm () {
 		echo "Adding attempt only packages..."
 		for pkg in ${package_attemptonly} ; do
 			echo "Processing $pkg..."
-			pkg_name=$(resolve_package_rpm $pkg ${confbase}.conf)
+			archvar=base_archs
+			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
+			if [ "${ml_pkg}" != "${pkg}" ]; then
+				archvar=ml_archs
+			fi
+
+			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 			if [ -z "$pkg_name" ]; then
-				echo "Unable to find package $pkg!"
-				exit 1
+				echo "Note: Unable to find package $pkg ($ml_pkg) -- PACKAGE_INSTALL_ATTEMPTONLY"
+				continue
 			fi
 			echo "Attempting $pkg_name..." >> "${WORKDIR}/temp/log.do_${task}_attemptonly.${PID}"
 			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
@@ -297,8 +303,17 @@ package_install_internal_rpm () {
 			# Ohh there was a new one, we'll need to loop again...
 			loop=1
 			echo "Processing $pkg..."
-			pkg_name=$(resolve_package $pkg ${confbase}.conf)
-			if [ -z "$pkg_name" ]; then
+			found=0
+			for archvar in base_archs ml_archs ; do
+				pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${pkg})
+				if [ -n "$pkg_name" ]; then
+					found=1
+					break
+				fi
+			done
+
+			if [ $found -eq 0 ]; then
+				echo "Note: Unable to find package $pkg -- suggests"
 				echo "Unable to find package $pkg." >> "${WORKDIR}/temp/log.do_${task}_recommend.${PID}"
 				continue
 			fi
-- 
1.7.3.4



