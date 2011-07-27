Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuU-00028v-6h
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949331"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:07 -0700
Message-Id: <55f78fd2efed5c0a4aa699ce61f2c61389b5700d.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 17/35] cronie: enable PAM support for cronie
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:07 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Enable PAM support for cronie and update its pam config file 'crond'.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../cronie/cronie/crond_pam_config.patch           |   19 +++++++++++++++++++
 meta/recipes-extended/cronie/cronie_1.4.7.bb       |   12 ++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/cronie/cronie/crond_pam_config.patch

diff --git a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
new file mode 100644
index 0000000..675872c
--- /dev/null
+++ b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
@@ -0,0 +1,19 @@
+password-auth is the Fedora's common pam configure file, use oe common pam
+configure files instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+--- cronie-1.4.7/pam/crond.orig	2010-12-16 16:59:02.000000000 +0800
++++ cronie-1.4.7/pam/crond	2011-07-20 09:47:16.080819203 +0800
+@@ -4,7 +4,7 @@
+ #
+ # No PAM authentication called, auth modules not needed
+ account    required   pam_access.so
+-account    include    password-auth
++account    include    common-account
+ session    required   pam_loginuid.so
+-session    include    password-auth
+-auth       include    password-auth
++session    include    common-session-noninteractive
++auth       include    common-auth
diff --git a/meta/recipes-extended/cronie/cronie_1.4.7.bb b/meta/recipes-extended/cronie/cronie_1.4.7.bb
index 992b610..bb715f2 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.7.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.7.bb
@@ -14,17 +14,25 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
 
 SECTION = "utils"
 
-PR = "r2"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+PR = "r3"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
-           file://crontab"
+           file://crontab \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://crond_pam_config.patch"
+
 
 SRC_URI[md5sum] = "dfc26c47756d0c40ee27ae3c7ee98e0d"
 SRC_URI[sha256sum] = "83bae15ae5504454ba74f4142f5db3aa22be594327fea19d2534f65803137fbd"
 
 inherit autotools update-rc.d
 
+EXTRA_OECONF += "\
+                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)}"
+
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
-- 
1.7.3.4



