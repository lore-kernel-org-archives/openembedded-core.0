Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9e0E-0002Rs-Qg for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 16:23:50 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UEOjam025196 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 15:24:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Pn7xCGO7oYBG
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 15:24:45 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UEOhKC025192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 15:24:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 15:18:16 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317392303.12332.209.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] package_rpm: Ensure multilib code is only called in the multilib case
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
X-List-Received-Date: Fri, 30 Sep 2011 14:23:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This fixes some error messages in the do_rootfs logs of non-multilib
builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index fa0d8c3..7f42583 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -354,6 +354,8 @@ package_install_internal_rpm () {
 		-D "__dbi_txn create nofsync private" \
 		| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_solution.manifest
 
+	touch ${target_rootfs}/install/install_multilib_solution.manifest
+
 	if [ ! -z "${multilib_to_install}" ]; then
 		for pkg in ${multilib_to_install} ; do
 			echo "Processing $pkg..."
@@ -376,24 +378,25 @@ package_install_internal_rpm () {
 			fi
 			echo $pkg_name >> ${target_rootfs}/install/install_multilib.manifest
 		done
-	fi
 
-	# multilib package installation
+		# multilib package installation
 
-	# Generate an install solution by doing a --justdb install, then recreate it with
-	# an actual package install!
-	${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-		-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-ml_archs.macro`" \
-		-D "__dbi_txn create nofsync" \
-		-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-		${target_rootfs}/install/install_multilib.manifest
+		# Generate an install solution by doing a --justdb install, then recreate it with
+		# an actual package install!
+		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
+			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-ml_archs.macro`" \
+			-D "__dbi_txn create nofsync" \
+			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+			${target_rootfs}/install/install_multilib.manifest
+
+		# Now that we have a solution, pull out a list of what to install...
+		echo "Manifest: ${target_rootfs}/install/install_multilib.manifest"
+		${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
+			-D "__dbi_txn create nofsync private" \
+			| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_multilib_solution.manifest
 
-	# Now that we have a solution, pull out a list of what to install...
-	echo "Manifest: ${target_rootfs}/install/install_multilib.manifest"
-	${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
-		-D "__dbi_txn create nofsync private" \
-		| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_multilib_solution.manifest
+	fi
 
 	cat ${target_rootfs}/install/install_solution.manifest > ${target_rootfs}/install/total_solution.manifest
 	cat ${target_rootfs}/install/install_multilib_solution.manifest >> ${target_rootfs}/install/total_solution.manifest




