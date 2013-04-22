Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UUBxz-0005e4-TS
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 10:19:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2013 00:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,525,1363158000"; d="scan'208";a="322150586"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2013 01:01:33 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2013 11:01:25 +0300
Message-Id: <a5a7ac68816a99d691bfef60a0738dca353e2efc.1366615922.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366615922.git.laurentiu.palcu@intel.com>
References: <cover.1366615922.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366615922.git.laurentiu.palcu@intel.com>
References: <cover.1366615922.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/4] image.bbclass: change the logic when intercepts fail
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
X-List-Received-Date: Mon, 22 Apr 2013 08:19:23 -0000

Due to some issues with postinstalls that register hooks, we changed the
logic a bit. Now, all postinstalls that register hooks will return
successfully and only after, if hooks fail, mark the package as unpacked.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass |   32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4e9c29c..ffb372a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -187,21 +187,32 @@ run_intercept_scriptlets () {
 			[ "$script" = "*" ] && break
 			[ "$script" = "postinst_intercept" ] || [ ! -x "$script" ] && continue
 			echo "> Executing $script"
-			./$script || { echo "WARNING: intercept script \"$script\" failed, falling back to running postinstalls at first boot" && continue; };
+			./$script && continue
+			echo "WARNING: intercept script \"$script\" failed, falling back to running postinstalls at first boot"
 			#
-			# If we got here, than the intercept was successful. Next, we must
-			# mark the postinstalls as "installed". For rpm is a little bit
-			# different, we just have to delete the saved postinstalls from
+			# If we got here, than the intercept has failed. Next, we must
+			# mark the postinstalls as "unpacked". For rpm is a little bit
+			# different, we just have to save the package postinstalls in
 			# /etc/rpm-postinsts
 			#
 			pkgs="$(cat ./$script|grep "^##PKGS"|cut -d':' -f2)" || continue
 			case ${IMAGE_PKGTYPE} in
 				"rpm")
-					for pi in ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts/*; do
-						pkg_name="$(cat $pi|sed -n -e "s/^.*postinst_intercept $script \([^ ]*\).*/\1/p")"
-						if [ -n "$pkg_name" -a -n "$(echo "$pkgs"|grep " $pkg_name ")" ]; then
-							rm $pi
-						fi
+					[ -d ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts/ ] || mkdir ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts/
+					v_expr=$(echo ${MULTILIB_GLOBAL_VARIANTS}|tr ' ' '|')
+					for p in $pkgs; do
+						# remove any multilib prefix from the package name (RPM 
+						# does not use it like this)
+						new_p=$(echo $p | sed -r "s/^($v_expr)-//")
+
+						# extract the postinstall scriptlet from rpm package and
+						# save it in /etc/rpm-postinsts
+						echo "  * postponing $new_p"
+						rpm -q --scripts --root=${IMAGE_ROOTFS} --dbpath=/var/lib/rpm $new_p |\
+						sed -n -e '/^postinstall scriptlet (using .*):$/,/^.* scriptlet (using .*):$/ {/.*/p}' |\
+						sed -e 's/postinstall scriptlet (using \(.*\)):$/#!\1/' -e '/^.* scriptlet (using .*):$/d'\
+							> ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts/$new_p
+						chmod +x ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts/$new_p
 					done
 					# move to the next intercept script
 					continue
@@ -216,7 +227,8 @@ run_intercept_scriptlets () {
 			# the next piece of code is run only for ipk/dpkg
 			sed_expr=""
 			for p in $pkgs; do
-				sed_expr="$sed_expr -e \"/^Package: ${p}$/,/^Status: install.* unpacked$/ {s/unpacked/installed/}\""
+				echo "  * postponing $p"
+				sed_expr="$sed_expr -e \"/^Package: ${p}$/,/^Status: install.* installed$/ {s/installed/unpacked/}\""
 			done
 			eval sed -i $sed_expr $status_file
 		done
-- 
1.7.9.5



