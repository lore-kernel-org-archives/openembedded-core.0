Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNJqu-00083M-F3
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:10:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 00:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439578198"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 00:07:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 00:06:59 -0700
Message-Id: <c8a189f315eeafee196f213bdb45a6eea8ab258b.1305874831.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
Subject: [PATCH 09/12] package-index.bb: add support for deb and rpm.
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
X-List-Received-Date: Fri, 20 May 2011 07:10:29 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

[YOCTO #1024]
Currently package-index.bb only supports ipk. This commit adds the support
for rpm and deb, too.

------------------------------
How to generate and use repos:

1) run "bitbake package-index" after building some target,
e.g., core-image-sato-sdk;

2) export ${DEPLOY_DIR_RPM}, ${DEPLOY_DIR_IPK} and ${DEPLOY_DIR_DEB} by a
webserver on the host, assuming the host IP is 192.168.7.1, at
http://192.168.7.1/rpm
http://192.168.7.1/ipk
http://192.168.7.1/deb

3) inside the target, according to the packaging system (rpm, ipk or deb) used
when we generate the target image, we can use different ways to manage
packages:

3.1) RPM
    run "zypper addrepo http://192.168.7.1/rpm main; zypper refresh"
    to retrieve info about the repo; next, we can use "zypper install/remove"
    to manage packages.

3.2) IPK
    add the repo info into opkg config file, i.e., in
    /etc/opkg/arch.conf, we can add something like
    "src i586 http://192.168.7.1/ipk/i586", and next, we run "opkg update" to
    make opkg update the list of available packages. And later, we can use
    "opkg install/remove" to manage packages.

3.3) DEB
    Currently in target, some important config files, like
/var/lib/dpkg/status and /etc/apt/sources.list, for deb/apt are missing. So
we can't install/remove package in target at present.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/package_deb.bbclass        |    4 ++++
 meta/classes/package_ipk.bbclass        |    4 ++++
 meta/classes/package_rpm.bbclass        |    3 +++
 meta/recipes-core/meta/package-index.bb |    6 ++----
 4 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 4faeb4a..000d9ee 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -431,3 +431,7 @@ python do_package_write_deb () {
 do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 addtask package_write_deb before do_package_write after do_package
 
+
+PACKAGEINDEXES += "package_update_index_deb;"
+PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
+PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 3c2472b..a3dfc73 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -386,3 +386,7 @@ python do_package_write_ipk () {
 }
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 addtask package_write_ipk before do_package_write after do_package
+
+PACKAGEINDEXES += "package_update_index_ipk;"
+PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
+PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1cf9f79..b86356d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -815,3 +815,6 @@ python do_package_write_rpm () {
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 addtask package_write_rpm before do_package_write after do_package
 
+PACKAGEINDEXES += "package_update_index_rpm; createrepo ${DEPLOY_DIR_RPM};"
+PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
+PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index 3c642cb..bf3922f 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -19,13 +19,11 @@ do_package_write_deb[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
 
 do_package_index[nostamp] = "1"
-do_package_index[dirs] = "${DEPLOY_DIR_IPK}"
-do_package_index[depends] += "opkg-utils-native:do_populate_sysroot"
-do_package_index[depends] += "opkg-native:do_populate_sysroot"
+do_package_index[depends] += "${PACKAGEINDEXDEPS}"
 
 do_package_index() {
 	set -ex
-	package_update_index_ipk
+	${PACKAGEINDEXES}
 	set +ex
 }
 addtask do_package_index before do_build
-- 
1.7.3.4



