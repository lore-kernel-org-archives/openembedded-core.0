Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QKTUg-0008DB-1s
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 12:51:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 03:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="746173853"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 03:48:56 -0700
Message-Id: <2dc5ca45f0335b704e853e222d8faf7d62f07e42.1305196874.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1305196874.git.dexuan.cui@intel.com>
References: <cover.1305196874.git.dexuan.cui@intel.com>
Old-Date: Thu, 12 May 2011 13:48:02 +0800
Date: Thu, 12 May 2011 18:49:29 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 1/1] [RFC]package-index-{ipk, rpm, deb}.bb: add the package-index for rpm and deb
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
X-List-Received-Date: Thu, 12 May 2011 10:51:46 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

[YOCTO #1024]

The commit renamed package-index.bb to package-index.inc and added
3 bb files for ipk, rpm and deb.

-------------------------------

How to generate and use repo:

RPM:
    1) run "bitbake package-index-rpm" after building some target;
    2) export the ${DEPLOY_DIR_RPM} by a webserver on the host (let's assume
the IP is 192.168.7.1) at http://192.168.7.1/rpm;
    3) inside the target, run "zypper addrepo http://192.168.7.1/rpm main; zypper refresh"
to retrieve info about the repo; next, we can use zypper install/remove to
manage packages.

IPK:
    1) run "bitbake package-index-ipk" after building some target;
    2) export the ${DEPLOY_DIR_IPK} by a webserver on the host (let's assume
the IP is 192.168.7.1) at http://192.168.7.1/ipk;
    3) inside the target, add the repo info into opkg config file, i.e.,
in /etc/opkg/arch.conf, we can add something like
src i586 http://192.168.7.1/ipk/i586, and next we run "opkg update" to make
opkg update the list of available packages, and next, we can use
opkg install/remove to manage packages.

DEB: To be added.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/meta/package-index-deb.bb        |   10 ++++++++++
 meta/recipes-core/meta/package-index-ipk.bb        |   11 +++++++++++
 meta/recipes-core/meta/package-index-rpm.bb        |   10 ++++++++++
 .../meta/{package-index.bb => package-index.inc}   |    8 --------
 4 files changed, 31 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/meta/package-index-deb.bb
 create mode 100644 meta/recipes-core/meta/package-index-ipk.bb
 create mode 100644 meta/recipes-core/meta/package-index-rpm.bb
 rename meta/recipes-core/meta/{package-index.bb => package-index.inc} (69%)

diff --git a/meta/recipes-core/meta/package-index-deb.bb b/meta/recipes-core/meta/package-index-deb.bb
new file mode 100644
index 0000000..db52e2a
--- /dev/null
+++ b/meta/recipes-core/meta/package-index-deb.bb
@@ -0,0 +1,10 @@
+require package-index.inc
+
+do_package_index[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
+
+do_package_index() {
+    set -ex
+    package_update_index_deb
+    set +ex
+}
+
diff --git a/meta/recipes-core/meta/package-index-ipk.bb b/meta/recipes-core/meta/package-index-ipk.bb
new file mode 100644
index 0000000..5eddea1
--- /dev/null
+++ b/meta/recipes-core/meta/package-index-ipk.bb
@@ -0,0 +1,11 @@
+require package-index.inc
+
+do_package_index[depends] += "opkg-utils-native:do_populate_sysroot"
+do_package_index[depends] += "opkg-native:do_populate_sysroot"
+
+do_package_index() {
+    set -ex
+    package_update_index_ipk
+    set +ex
+}
+
diff --git a/meta/recipes-core/meta/package-index-rpm.bb b/meta/recipes-core/meta/package-index-rpm.bb
new file mode 100644
index 0000000..605a638
--- /dev/null
+++ b/meta/recipes-core/meta/package-index-rpm.bb
@@ -0,0 +1,10 @@
+require package-index.inc
+
+do_package_index[depends] += "createrepo-native:do_populate_sysroot"
+
+do_package_index() {
+    set -ex
+    createrepo "${DEPLOY_DIR_RPM}"
+    set +ex
+}
+
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.inc
similarity index 69%
rename from meta/recipes-core/meta/package-index.bb
rename to meta/recipes-core/meta/package-index.inc
index 3c642cb..3f1caea 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.inc
@@ -19,14 +19,6 @@ do_package_write_deb[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
 
 do_package_index[nostamp] = "1"
-do_package_index[dirs] = "${DEPLOY_DIR_IPK}"
-do_package_index[depends] += "opkg-utils-native:do_populate_sysroot"
-do_package_index[depends] += "opkg-native:do_populate_sysroot"
 
-do_package_index() {
-	set -ex
-	package_update_index_ipk
-	set +ex
-}
 addtask do_package_index before do_build
 EXCLUDE_FROM_WORLD = "1"
-- 
1.7.2



