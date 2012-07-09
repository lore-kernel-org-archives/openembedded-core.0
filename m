Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMo-00065B-Uk
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292933"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:45 -0700
Message-Id: <cb276df635be717ae5f2c96d584f477c658762b6.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 31/41] package_rpm: Avoid duplicate package generation failures
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:20 -0000

From: Mark Hatle <mark.hatle@windriver.com>

When constructing a multilib based image, it's possible to end up with
the same package listed in multiple steps of the install.  During resolution
we use the --replacepkgs option to avoid errors, as the resulting install
solution will be as expected.  (We do not enable the replacepkgs option
for the final install step, only the generation of the install solution.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 78279f5..2a29917 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -318,7 +318,7 @@ package_install_internal_rpm () {
 			--root "${target_rootfs}/install" \
 			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-base_archs.macro`" \
 			-D "__dbi_txn create nofsync" \
-			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+			-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 			${target_rootfs}/install/install.manifest
 	fi
 
@@ -348,7 +348,7 @@ package_install_internal_rpm () {
 				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync private" \
-				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 			$pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" || true
 		done
 	fi
@@ -399,7 +399,7 @@ package_install_internal_rpm () {
 				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync private" \
-				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 				$pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_recommend.${PID}" 2>&1 || true
 		done
 		cat ${target_rootfs}/install/recommend.list ${target_rootfs}/install/recommend.new | sort -u > ${target_rootfs}/install/recommend.new.list
@@ -428,7 +428,7 @@ package_install_internal_rpm () {
 			--root "${target_rootfs}/install" \
 			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-ml_archs.macro`" \
 			-D "__dbi_txn create nofsync" \
-			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+			-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 			${target_rootfs}/install/install_multilib.manifest
 
 		# Now that we have a solution, pull out a list of what to install...
@@ -524,7 +524,7 @@ EOF
 				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/initial" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync" \
-				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 				${target_rootfs}/install/initial_install.manifest
 
 			${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf "%{packageorigin}\n" \
-- 
1.7.7.6



