Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuP-00028l-7K
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949328"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:06 -0700
Message-Id: <c1244df86aaab7b94d7a19850dd3ffa81bb3b71b.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 16/35] sudo: add pam support
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:01 -0000

From: Kang Kai <kai.kang@windriver.com>

According to DISTRO_FEATURES to add pam support for sudo, and import
configure file from Fedora.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/sudo/files/sudo.pam  |    6 ++++++
 meta/recipes-extended/sudo/sudo_1.8.1p2.bb |   18 +++++++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/files/sudo.pam

diff --git a/meta/recipes-extended/sudo/files/sudo.pam b/meta/recipes-extended/sudo/files/sudo.pam
new file mode 100644
index 0000000..5bc26e7
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/sudo.pam
@@ -0,0 +1,6 @@
+#%PAM-1.0
+auth       include      common-auth
+account    include      common-account
+password   include      common-password
+session    required     pam_keyinit.so revoke
+session    required     pam_limits.so
diff --git a/meta/recipes-extended/sudo/sudo_1.8.1p2.bb b/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
index 7eba307..9cf9ecc 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.1p2.bb
@@ -1,11 +1,23 @@
 require sudo.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
-           file://libtool.patch"
+           file://libtool.patch \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://sudo.pam"
 
 SRC_URI[md5sum] = "e8330f0e63b0ecb2e12b5c76922818cc"
 SRC_URI[sha256sum] = "281f90c80547cf22132e351e7f61c25ba4ba9cf393438468f318f9a7884026fb"
 
-EXTRA_OECONF += " --with-pam=no"
+EXTRA_OECONF += " ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
+
+do_install_append () {
+	for feature in ${DISTRO_FEATURES}; do
+		if [ "$feature" = "pam" ]; then
+			install -D -m 664 ${WORKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
+			break
+		fi
+	done
+}
-- 
1.7.3.4



