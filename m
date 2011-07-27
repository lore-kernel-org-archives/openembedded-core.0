Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuV-00028v-PI
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949349"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:12 -0700
Message-Id: <4349c047f5f9ccef68dbec584dcbb87f1c080756.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 22/35] polkit: Support pam
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:08 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Modify configuration "polkit-1" in /etc/pam.d/ for supporting pam.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 ++++++++++++++++++++
 meta/recipes-extended/polkit/polkit_0.101.bb       |    7 ++++-
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch

diff --git a/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
new file mode 100644
index 0000000..74647ef
--- /dev/null
+++ b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
@@ -0,0 +1,23 @@
+polkit: No system-auth in OE-Core, we can use common-* in place of it.
+
+Upstream-Status:Inappropriate [configuration]
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+--- a/configure.ac	2011-03-04 02:26:20.000000000 +0800
++++ b/configure.ac.new	2011-07-18 10:14:12.516818852 +0800
+@@ -350,10 +350,10 @@
+     PAM_FILE_INCLUDE_PASSWORD=system
+     PAM_FILE_INCLUDE_SESSION=system
+ else
+-   PAM_FILE_INCLUDE_AUTH=system-auth
+-   PAM_FILE_INCLUDE_ACCOUNT=system-auth
+-   PAM_FILE_INCLUDE_PASSWORD=system-auth
+-   PAM_FILE_INCLUDE_SESSION=system-auth
++   PAM_FILE_INCLUDE_AUTH=common-auth
++   PAM_FILE_INCLUDE_ACCOUNT=common-account
++   PAM_FILE_INCLUDE_PASSWORD=common-password
++   PAM_FILE_INCLUDE_SESSION=common-session
+ fi
+ 
+ AC_SUBST(PAM_FILE_INCLUDE_AUTH)
diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/recipes-extended/polkit/polkit_0.101.bb
index 6769914..56ceca4 100644
--- a/meta/recipes-extended/polkit/polkit_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit_0.101.bb
@@ -7,8 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://docs/polkit/html/license.html;md5=07ddbf5f29e44c80c99be19c1690ec1f"
 
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
-           file://introspection.patch"
-PR = "r0"
+           file://introspection.patch \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://polkit-1_pam.patch"
+PR = "r1"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
-- 
1.7.3.4



