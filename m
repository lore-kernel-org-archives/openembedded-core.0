Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuR-00028m-6f
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949325"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:05 -0700
Message-Id: <e7cdbe579b538891ca59d12d6b7cfd0b702a2c99.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 15/35] screen: add pam support
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:04 -0000

From: Kang Kai <kai.kang@windriver.com>

According to DISTRO_FEATURES then add screen pam support or not.
Press "Ctrl+a x" will lock the screen terminal, then unlock it will
use pam.
Add pam related configure file sceen.pam from Fedora.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../screen/screen-4.0.3/screen.pam                 |    2 +
 meta/recipes-extended/screen/screen_4.0.3.bb       |   23 +++++++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen.pam

diff --git a/meta/recipes-extended/screen/screen-4.0.3/screen.pam b/meta/recipes-extended/screen/screen-4.0.3/screen.pam
new file mode 100644
index 0000000..ff657fa
--- /dev/null
+++ b/meta/recipes-extended/screen/screen-4.0.3/screen.pam
@@ -0,0 +1,2 @@
+#%PAM-1.0
+auth       include      common-auth
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index dac2893..27f39dd 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -10,12 +10,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0774d66808b0f602e94448108f59448b \
                     file://screen.h;endline=23;md5=9a7ae69a2aafed891bf7c38ddf9f6b7d"
 
 SECTION = "console/utils"
-DEPENDS = "ncurses"
-PR = "r0"
+DEPENDS = "ncurses \
+          ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-11+lenny1.diff.gz;name=patch \
-           file://configure.patch"
+           file://configure.patch \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://screen.pam"
 
 SRC_URI[tarball.md5sum] = "8506fd205028a96c741e4037de6e3c42"
 SRC_URI[tarball.sha256sum] = "78f0d5b1496084a5902586304d4a73954b2bfe33ea13edceecf21615c39e6c77"
@@ -25,5 +29,14 @@ SRC_URI[patch.sha256sum] = "19130d097e9ed897c84a2c640634dd36ee3233c17b0bf5d18549
 
 inherit autotools
 
-EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5"
-
+EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
+               ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
+
+do_install_append () {
+	for feature in ${DISTRO_FEATURES}; do
+		if [ "$feature" = "pam" ]; then
+			install -D -m 644 ${WORKDIR}/screen.pam ${D}/${sysconfdir}/pam.d/screen
+			break
+		fi
+	done
+}
-- 
1.7.3.4



