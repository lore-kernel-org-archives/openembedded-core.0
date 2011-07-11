Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QgAwk-0001Zw-Nz
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 09:30:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2011 00:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,513,1304319600"; d="scan'208";a="28803504"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2011 00:26:29 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 15:23:20 +0800
Message-Id: <445641a13d3894a158d2458cd1b31c2eb8f19731.1310368636.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310368636.git.ke.yu@intel.com>
References: <cover.1310368636.git.ke.yu@intel.com>
In-Reply-To: <cover.1310368636.git.ke.yu@intel.com>
References: <cover.1310368636.git.ke.yu@intel.com>
Subject: [PATCH 07/10] libcap: fix for non /usr/lib libdir case
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
X-List-Received-Date: Mon, 11 Jul 2011 07:30:27 -0000

the recipe has hardcoded "lib=lib", which does not work in
libdir=/usr/lib64 case where should be "lib=lib64",

So this patch fix it by replacing lib with libdir

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-support/libcap/libcap.inc     |    5 +++--
 meta/recipes-support/libcap/libcap_2.20.bb |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 93bdf95..3bff3b9 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -20,8 +20,9 @@ do_configure() {
 	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
 }
 
-EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=yes INDENT= lib=lib SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no"
-EXTRA_OEMAKE_virtclass-native = "LIBATTR=no PAM_CAP=no INDENT= lib=lib"
+EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=yes INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no"
+EXTRA_OEMAKE_virtclass-native = "LIBATTR=no PAM_CAP=no INDENT= "
+EXTRA_OEMAKE += " lib=${@os.path.basename('${libdir}')}"
 
 do_compile() {
 	oe_runmake
diff --git a/meta/recipes-support/libcap/libcap_2.20.bb b/meta/recipes-support/libcap/libcap_2.20.bb
index ab3638a..c9741c2 100644
--- a/meta/recipes-support/libcap/libcap_2.20.bb
+++ b/meta/recipes-support/libcap/libcap_2.20.bb
@@ -1,6 +1,6 @@
 require libcap.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "10e47ed32ca2214eb0e58780282d27b4"
 SRC_URI[sha256sum] = "20e7c1ea4d3d5c410efb3a6ff138dc417912fae316d883460dcd58d9803a9220"
-- 
1.7.0.4



