Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE7B77BC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:00:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2017 07:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="330573682"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2017 07:00:38 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Nov 2017 16:00:31 +0200
Message-Id: <8fd8caeb644d071278d11fefa96737a8be17568d.1509544185.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/6] initscripts: don't use update-alternatives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Nov 2017 14:00:37 -0000

Stop using update-alternatives for managing /etc/init.d/functions. Also,
make the initscripts-functions subpackage to (runtime) conflict with
lsbinitscripts.

[YOCTO #10944]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/update-rc.d.bbclass                 | 3 +--
 meta/conf/distro/include/default-providers.inc   | 1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb | 9 +++------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb   | 2 +-
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 9ba3daccaf..c3fefea5af 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -95,8 +95,7 @@ python populate_packages_updatercd () {
             return
         statement = "grep -q -w '/etc/init.d/functions' %s" % path
         if subprocess.call(statement, shell=True) == 0:
-            mlprefix = d.getVar('MLPREFIX') or ""
-            d.appendVar('RDEPENDS_' + pkg, ' %sinitscripts-functions' % (mlprefix))
+            d.appendVar('RDEPENDS_' + pkg, ' initd-functions')
 
     def update_rcd_package(pkg):
         bb.debug(1, 'adding update-rc.d calls to preinst/postinst/prerm/postrm for %s' % pkg)
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index f54fdcd776..2b76c3c31d 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -56,3 +56,4 @@ PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
 PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
 PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconfig"
 PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
+PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index fea4f22e95..1167735756 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -43,21 +43,18 @@ SRC_URI_append_arm = " file://alignment.sh"
 
 KERNEL_VERSION = ""
 
-inherit update-alternatives
 DEPENDS_append = " update-rc.d-native"
 PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 
 PACKAGES =+ "${PN}-functions ${PN}-sushell"
-RDEPENDS_${PN} = "${PN}-functions \
+RDEPENDS_${PN} = "initd-functions \
                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
 		 "
+RPROVIDES_${PN}-functions = "initd-functions"
+RCONFLICTS_${PN}-functions = "lsbinitscripts"
 FILES_${PN}-functions = "${sysconfdir}/init.d/functions*"
 FILES_${PN}-sushell = "${base_sbindir}/sushell"
 
-ALTERNATIVE_PRIORITY_${PN}-functions = "90"
-ALTERNATIVE_${PN}-functions = "functions"
-ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
-
 HALTARGS ?= "-d -f"
 
 do_configure() {
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 884857a96d..22a0ecf839 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -68,7 +68,7 @@ FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
 FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
 FILES_sysvinit-sulogin = "${base_sbindir}/sulogin.sysvinit"
 
-RDEPENDS_${PN} += "sysvinit-pidof initscripts-functions"
+RDEPENDS_${PN} += "sysvinit-pidof initd-functions"
 
 CFLAGS_prepend = "-D_GNU_SOURCE "
 export LCRYPT = "-lcrypt"
-- 
2.13.6


