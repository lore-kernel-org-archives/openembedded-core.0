Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrMD-0002iO-GB
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:17 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587129"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:42 -0800
Message-Id: <f768ef66c107410d4e81a69543d41910bbc6a26e.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/17] libcap: fix sstate for native package
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:17 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

The 'lib' option needs to be given on target and native builds
otherwise it installs the binaries at ${libdir}64 when host is 64bit.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-support/libcap/libcap.inc     |   15 ++++++++++++---
 meta/recipes-support/libcap/libcap_2.22.bb |    2 +-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 3506530..184b58a 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -21,9 +21,18 @@ do_configure() {
 	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
 }
 
-EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no"
-EXTRA_OEMAKE_virtclass-native = "LIBATTR=no PAM_CAP=no INDENT= "
-EXTRA_OEMAKE += " lib=${@os.path.basename('${libdir}')}"
+EXTRA_OEMAKE = " \
+  LIBATTR=yes \
+  PAM_CAP=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} \
+  INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no \
+  lib=${@os.path.basename('${libdir}')} \
+"
+EXTRA_OEMAKE_virtclass-native = " \
+  LIBATTR=no \
+  PAM_CAP=no \
+  INDENT= \
+  lib=${@os.path.basename('${libdir}')} \
+"
 
 do_compile() {
 	oe_runmake
diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-support/libcap/libcap_2.22.bb
index a31ba3f..dd63d9e 100644
--- a/meta/recipes-support/libcap/libcap_2.22.bb
+++ b/meta/recipes-support/libcap/libcap_2.22.bb
@@ -1,6 +1,6 @@
 require libcap.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "ce64058bdb3f086ddbfca8ce6c919845"
 SRC_URI[sha256sum] = "73ebbd4877b5f69dd28b72098e510c5b318bc480f8201c4061ac98b78c04050f"
-- 
1.7.6.4



