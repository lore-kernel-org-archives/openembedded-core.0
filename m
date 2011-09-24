Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R7XUL-0008R9-Vt
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Sep 2011 21:02:14 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2011 11:56:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,435,1312182000"; d="scan'208";a="20265177"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.14])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2011 11:56:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Sep 2011 11:56:47 -0700
Message-Id: <62e9da86a45eef3dd374bd8c7e110f619f620f80.1316890497.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316890497.git.sgw@linux.intel.com>
References: <cover.1316890497.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316890497.git.sgw@linux.intel.com>
References: <cover.1316890497.git.sgw@linux.intel.com>
Subject: [PATCH 1/2] attr/acl: add SSTATEPOSTINSTFUNC
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
X-List-Received-Date: Sat, 24 Sep 2011 19:02:14 -0000

Added a native sstate post install function to fix the links
created between /lib and /usr/lib for the library files. These
links could point to an invalid build area when using shared state.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/attr/acl_2.2.51.bb  |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb |    2 +-
 meta/recipes-support/attr/ea-acl.inc     |   17 +++++++++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-support/attr/acl_2.2.51.bb
index 18aac7c..40ba5f1 100644
--- a/meta/recipes-support/attr/acl_2.2.51.bb
+++ b/meta/recipes-support/attr/acl_2.2.51.bb
@@ -1,6 +1,6 @@
 require acl.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "3fc0ce99dc5253bdcce4c9cd437bc267"
 SRC_URI[sha256sum] = "06854521cf5d396801af7e54b9636680edf8064355e51c07657ec7442a185225"
diff --git a/meta/recipes-support/attr/attr_2.4.46.bb b/meta/recipes-support/attr/attr_2.4.46.bb
index fe8ab79..85c35d0 100644
--- a/meta/recipes-support/attr/attr_2.4.46.bb
+++ b/meta/recipes-support/attr/attr_2.4.46.bb
@@ -1,6 +1,6 @@
 require attr.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "db557c17fdfa4f785333ecda08654010"
 SRC_URI[sha256sum] = "dcd69bdca7ff166bc45141eddbcf21967999a6b66b0544be12a1cc2fd6340e1f"
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 2ef1389..22d7848 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -35,3 +35,20 @@ BBCLASSEXTEND = "native"
 # Only append ldflags for target recipe and if USE_NLS is enabled
 LDFLAGS_append_libc-uclibc = "${@['', ' -lintl '][(bb.data.getVar('PN', d, True) == bb.data.getVar('BPN', d , True)) and (bb.data.getVar('USE_NLS', d, True) == 'yes')]}"
 EXTRA_OECONF_append_libc-uclibc = "${@['', ' --disable-gettext '][(bb.data.getVar('PN', d, True) == bb.data.getVar('BPN', d , True)) and (bb.data.getVar('USE_NLS', d, True) == 'no')]}"
+
+fix_symlink () {
+	# Remove bad symlinks & create the correct symlinks
+	if test -L ${libdir}/lib${BPN}.so ; then
+		rm -rf ${libdir}/lib${BPN}.so
+		ln -sf ${base_libdir}/lib${BPN}.so ${libdir}/lib${BPN}.so
+	fi
+	if test -L ${base_libdir}/lib${BPN}.a ; then
+		rm -rf ${base_libdir}/lib${BPN}.a
+		ln -sf ${libdir}/lib${BPN}.a ${base_libdir}/lib${BPN}.a
+	fi
+	if test -L  ${base_libdir}/lib${BPN}.la ; then
+		rm -rf ${base_libdir}/lib${BPN}.la
+		ln -sf ${libdir}/lib${BPN}.la ${base_libdir}/lib${BPN}.la
+	fi
+}
+SSTATEPOSTINSTFUNCS_virtclass-native += "fix_symlink"
-- 
1.7.6



