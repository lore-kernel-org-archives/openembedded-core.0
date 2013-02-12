Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5Iiy-0000zO-Rj
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:28:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742018"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:51 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:37 +0200
Message-Id: <d2fba1d9a0870b3400356042e1f61b2ebceadfda.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 02/11] image.bbclass: add fall-back functionality when running intercepts
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
X-List-Received-Date: Tue, 12 Feb 2013 16:29:35 -0000
X-List-Received-Date: Tue, 12 Feb 2013 16:29:35 -0000
X-List-Received-Date: Tue, 12 Feb 2013 16:29:35 -0000
X-List-Received-Date: Tue, 12 Feb 2013 16:29:35 -0000

If an intercept script fails, it would be helpful to fall-back to
running the postinstall on target's first boot. In order to achieve
that, the postinstalls that install a host intercept hook will have to
return 1, so that the postinstall is marked as unpacked only. If the
intercept hook fails, then we're ok, the postinstalls will be run on
target anyway. If it succeeds, then mark the packages as installed.

This logic was chosen mainly because of rpm backend which saves the
failed postinstalls in /etc/rpm-postinsts. Hence, in order to mark the
packages as installed, all we have to do is delete the scriptlets from
there.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass |   43 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 84ddc38..dd78acb 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -194,13 +194,41 @@ run_intercept_scriptlets () {
 		cd ${WORKDIR}/intercept_scripts
 		echo "Running intercept scripts:"
 		for script in *; do
-			if [ "$script" = "*" ]; then break; fi
+			[ "$script" = "*" ] && break
+			[ "$script" = "postinst_intercept" ] || [ ! -x "$script" ] && continue
 			echo "> Executing $script"
-			chmod +x $script
-			./$script
-			if [ $? -ne 0 ]; then
-				echo "ERROR: intercept script \"$script\" failed!"
-			fi
+			./$script || (echo "WARNING: intercept script \"$script\" failed, falling back to running postinstalls at first boot" && continue)
+			#
+			# If we got here, than the intercept was successful. Next, we must
+			# mark the postinstalls as "installed". For rpm is a little bit
+			# different, we just have to delete the saved postinstalls from
+			# /etc/rpm-postinsts
+			#
+			pkgs="$(cat ./$script|grep "^##PKGS"|cut -d':' -f2)" || continue
+			case ${IMAGE_PKGTYPE} in
+				"rpm")
+					for pi in ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts/*; do
+						pkg_name="$(cat $pi|sed -n -e "s/^.*postinst_intercept $script \([^ ]*\).*/\1/p")"
+						if [ -n "$pkg_name" -a -n "$(echo "$pkgs"|grep " $pkg_name ")" ]; then
+							rm $pi
+						fi
+					done
+					# move to the next intercept script
+					continue
+					;;
+				"ipk")
+					status_file="${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/status"
+					;;
+				"deb")
+					status_file="${IMAGE_ROOTFS}/var/lib/dpkg/status"
+					;;
+			esac
+			# the next piece of code is run only for ipk/dpkg
+			sed_expr=""
+			for p in $pkgs; do
+				sed_expr="$sed_expr -e \"/^Package: ${p}$/,/^Status: install.* unpacked$/ {s/unpacked/installed/}\""
+			done
+			eval sed -i $sed_expr $status_file
 		done
 	fi
 }
@@ -223,6 +251,9 @@ fakeroot do_rootfs () {
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt || true
 
+	# copy the intercept scripts
+	cp ${COREBASE}/scripts/postinst-intercepts/* ${WORKDIR}/intercept_scripts/
+
 	# If "${IMAGE_ROOTFS}/dev" exists, then the device had been made by
 	# the previous build
 	if [ "${USE_DEVFS}" != "1" -a ! -r "${IMAGE_ROOTFS}/dev" ]; then
-- 
1.7.9.5



