Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Skpw7-0004av-Qm
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 07:09:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5U4wc68008304
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 21:58:38 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 29 Jun 2012 21:58:37 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jun 2012 00:07:40 -0500
Message-ID: <f746ae94166bb1ac727fa3f1a94ed954751d627d.1341032578.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341032578.git.mark.hatle@windriver.com>
References: <cover.1341032578.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/6] Fix manual log file paths
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
X-List-Received-Date: Sat, 30 Jun 2012 05:09:50 -0000
Content-Type: text/plain

When a recent change, the path to log files may be contained within an
arbitrary directory.  To generate the manual log files in the correct path
we should be using the ${BB_LOGFILE}'s path instead of always assuming the
logs go into ${WORKDIR}/temp.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image.bbclass        |    2 +-
 meta/classes/package_deb.bbclass  |    4 ++--
 meta/classes/package_ipk.bbclass  |    2 +-
 meta/classes/package_rpm.bbclass  |   10 +++++-----
 meta/classes/populate_sdk.bbclass |    2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0772363..4f50376 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -218,7 +218,7 @@ insert_feed_uris () {
 log_check() {
 	for target in $*
 	do
-		lf_path="${WORKDIR}/temp/log.do_$target.${PID}"
+		lf_path="`dirname ${BB_LOGFILE}`/log.do_$target.${PID}"
 		
 		echo "log_check: Using $lf_path as logfile"
 		
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 0a3e976..cb4bef9 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -167,10 +167,10 @@ package_install_internal_deb () {
 		fi
 	done
 
-	rm -f ${WORKDIR}/temp/log.do_${task}-attemptonly.${PID}
+	rm -f `dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID}
 	if [ ! -z "${package_attemptonly}" ]; then
 		for i in ${package_attemptonly}; do
-			apt-get install $i --force-yes --allow-unauthenticated >> ${WORKDIR}/temp/log.do_${task}-attemptonly.${PID} 2>&1 || true
+			apt-get install $i --force-yes --allow-unauthenticated >> `dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID} 2>&1 || true
 		done
 	fi
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c86ea03..e682e6a 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -157,7 +157,7 @@ package_install_internal_ipk() {
 	fi
 
 	if [ ! -z "${package_attemptonly}" ]; then
-		opkg-cl ${ipkg_args} install ${package_attemptonly} > "${WORKDIR}/temp/log.do_${task}_attemptonly.${PID}" || true
+		opkg-cl ${ipkg_args} install ${package_attemptonly} > "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" || true
 	fi
 
 	package_tryout_install_multilib_ipk
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 5559a46..ee2285e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -342,14 +342,14 @@ package_install_internal_rpm () {
 				echo "Note: Unable to find package $pkg ($ml_pkg) -- PACKAGE_INSTALL_ATTEMPTONLY"
 				continue
 			fi
-			echo "Attempting $pkg_name..." >> "${WORKDIR}/temp/log.do_${task}_attemptonly.${PID}"
+			echo "Attempting $pkg_name..." >> "`dirname ${BB_LOGFILE}`log.do_${task}_attemptonly.${PID}"
 			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
 				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync private" \
 				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-			$pkg_name >> "${WORKDIR}/temp/log.do_${task}_attemptonly.${PID}" || true
+			$pkg_name >> "`dirname ${BB_LOGFILE}`log.do_${task}_attemptonly.${PID}" || true
 		done
 	fi
 
@@ -390,17 +390,17 @@ package_install_internal_rpm () {
 
 			if [ $found -eq 0 ]; then
 				echo "Note: Unable to find package $pkg -- suggests"
-				echo "Unable to find package $pkg." >> "${WORKDIR}/temp/log.do_${task}_recommend.${PID}"
+				echo "Unable to find package $pkg." >> "`dirname ${BB_LOGFILE}`log.do_${task}_recommend.${PID}"
 				continue
 			fi
-			echo "Attempting $pkg_name..." >> "${WORKDIR}/temp/log.do_{task}_recommend.${PID}"
+			echo "Attempting $pkg_name..." >> "`dirname ${BB_LOGFILE}`log.do_{task}_recommend.${PID}"
 			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
 				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync private" \
 				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-				$pkg_name >> "${WORKDIR}/temp/log.do_${task}_recommend.${PID}" 2>&1 || true
+				$pkg_name >> "`dirname ${BB_LOGFILE}`log.do_${task}_recommend.${PID}" 2>&1 || true
 		done
 		cat ${target_rootfs}/install/recommend.list ${target_rootfs}/install/recommend.new | sort -u > ${target_rootfs}/install/recommend.new.list
 		mv -f ${target_rootfs}/install/recommend.new.list ${target_rootfs}/install/recommend.list
diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index 5aa8e92..1131d68 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -70,7 +70,7 @@ fakeroot do_populate_sdk() {
 populate_sdk_log_check() {
 	for target in $*
 	do
-		lf_path="${WORKDIR}/temp/log.do_$target.${PID}"
+		lf_path="`dirname ${BB_LOGFILE}`/log.do_$target.${PID}"
 
 		echo "log_check: Using $lf_path as logfile"
 
-- 
1.7.3.4



