Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U70JT-0007wD-4w for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 10:13:44 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H923g5003913 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:03:47 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rrwGDDmUisK5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:03:47 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H93g2X003931
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:03:45 GMT
Message-ID: <1361091437.31795.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 08:57:17 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: package_rpm/deb/ipk: Error if we don't find packages when creating the package index
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
X-List-Received-Date: Sun, 17 Feb 2013 09:13:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If for whatever reason the package directory is empty of packages, it
makes sense to error early rather than later in what become much
more obtuse errors. This adds in a sanity check to each of the packaging
backends. It also removes the duplicate createrepo call since the
core index creation function now uses this directly after the switch
to smart.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 5740948..f4b18c3 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -78,6 +78,7 @@ package_update_index_deb () {
 		fi
 	done
 
+	found=0
 	for arch in $debarchs; do
 		if [ ! -d ${DEPLOY_DIR_DEB}/$arch ]; then
 			continue;
@@ -85,7 +86,11 @@ package_update_index_deb () {
 		cd ${DEPLOY_DIR_DEB}/$arch
 		dpkg-scanpackages . | gzip > Packages.gz
 		echo "Label: $arch" > Release
+		found=1
 	done
+	if [ "$found" != "1" ]; then
+		bbfatal "There are no packages in ${DEPLOY_DIR_DEB}!"
+	fi
 }
 
 #
@@ -457,6 +462,6 @@ do_package_write_deb[umask] = "022"
 addtask package_write_deb before do_package_write after do_packagedata do_package
 
 
-PACKAGEINDEXES += "package_update_index_deb;"
+PACKAGEINDEXES += "[ ! -e ${DEPLOY_DIR_DEB} ] || package_update_index_deb;"
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e5e76ef..526c3ae 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -216,12 +216,17 @@ package_update_index_ipk () {
 		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch"
 	done
 
+	found=0
 	for pkgdir in $packagedirs; do
 		if [ -e $pkgdir/ ]; then
+			found=1
 			touch $pkgdir/Packages
 			flock $pkgdir/Packages.flock -c "opkg-make-index -r $pkgdir/Packages -p $pkgdir/Packages -m $pkgdir/"
 		fi
 	done
+	if [ "$found" != "1" ]; then
+		bbfatal "There are no packages in ${DEPLOY_DIR_IPK}!"
+	fi
 }
 
 #
@@ -483,6 +488,6 @@ do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[umask] = "022"
 addtask package_write_ipk before do_package_write after do_packagedata do_package
 
-PACKAGEINDEXES += "package_update_index_ipk;"
+PACKAGEINDEXES += "[ ! -e ${DEPLOY_DIR_IPK} ] || package_update_index_ipk;"
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 6acf68a..e85e027 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -20,7 +20,7 @@ python package_rpm_install () {
 # Update the packages indexes ${DEPLOY_DIR_RPM}
 #
 package_update_index_rpm () {
-	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" -o ! -e "${DEPLOY_DIR_RPM}" ]; then
+	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
 		return
 	fi
 
@@ -45,11 +45,16 @@ package_update_index_rpm () {
 		echo $arch
 	done | sort | uniq`
 
+	found=0
 	for arch in $archs; do
 		if [ -d ${DEPLOY_DIR_RPM}/$arch ] ; then
 			createrepo --update -q ${DEPLOY_DIR_RPM}/$arch
+			found=1
 		fi
 	done
+	if [ "$found" != "1" ]; then
+		bbfatal "There are no packages in ${DEPLOY_DIR_RPM}!"
+	fi
 }
 
 rpm_log_check() {
@@ -1087,6 +1092,6 @@ do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[umask] = "022"
 addtask package_write_rpm before do_package_write after do_packagedata do_package
 
-PACKAGEINDEXES += "package_update_index_rpm; [ ! -e ${DEPLOY_DIR_RPM} ] || createrepo ${DEPLOY_DIR_RPM};"
+PACKAGEINDEXES += "[ ! -e ${DEPLOY_DIR_RPM} ] || package_update_index_rpm;"
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"




