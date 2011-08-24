Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwFnZ-0008Kv-W6
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 17:55:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2011 08:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,275,1312182000"; d="scan'208";a="41953301"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.203])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2011 08:50:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2011 08:50:29 -0700
Message-Id: <0fa1989b03cf70c7f27629c8340963fcef862097.1314200868.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314200868.git.sgw@linux.intel.com>
References: <cover.1314200868.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314200868.git.sgw@linux.intel.com>
References: <cover.1314200868.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 4/6] cronie: Updates to cronie
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
X-List-Received-Date: Wed, 24 Aug 2011 15:55:26 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

1) Add required pam plugins to RDEPENDS list;
2) Correct configure option that used for enable pam support;
3) Create empty crond config file cron.deny;
4) Don't set readonly variable UID in crond init script.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/cronie/cronie/crond.init |    2 --
 meta/recipes-extended/cronie/cronie_1.4.8.bb   |    8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie/crond.init b/meta/recipes-extended/cronie/cronie/crond.init
index 050c37e..08f34be 100755
--- a/meta/recipes-extended/cronie/cronie/crond.init
+++ b/meta/recipes-extended/cronie/cronie/crond.init
@@ -21,8 +21,6 @@ CONFIG=/etc/sysconfig/crond
 # Source function library.
 . /etc/init.d/functions
 
-UID=`id -u`
-
 case "$1" in
   start)
     if [ $UID -ne 0 ] ; then
diff --git a/meta/recipes-extended/cronie/cronie_1.4.8.bb b/meta/recipes-extended/cronie/cronie_1.4.8.bb
index 4cfdfad..064347e 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.8.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.8.bb
@@ -15,7 +15,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
 SECTION = "utils"
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-PR = "r0"
+RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
+PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
+
+PR = "r1"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
@@ -31,7 +34,7 @@ SRC_URI[sha256sum] = "a3b910876f255712f1a5c364b74f34b0ceac9f6f3bbc45e854c5722785
 inherit autotools update-rc.d
 
 EXTRA_OECONF += "\
-                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)}"
+                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
 
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
@@ -50,6 +53,7 @@ do_install_append () {
 	mkdir -p ${D}${sysconfdir}/cron.daily
 	mkdir -p ${D}${sysconfdir}/cron.weekly
 	mkdir -p ${D}${sysconfdir}/cron.monthly
+	touch ${D}${sysconfdir}/cron.deny
 }
 
 FILES_${PN} += "${sysconfdir}/cron*"
-- 
1.7.6



