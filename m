Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SkJeF-0003sm-GJ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 20:41:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2012 11:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="164125103"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.222])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2012 11:30:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 19:29:49 +0100
Message-Id: <1fb664d76463830cf80997e2e13891adfff7a6eb.1340908084.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340908084.git.paul.eggleton@linux.intel.com>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1340908084.git.paul.eggleton@linux.intel.com>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] apr: fix incorrect size of pid_t
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
X-List-Received-Date: Thu, 28 Jun 2012 18:41:00 -0000

If cross-compiling, apr's configure script assumes that pid_t is
64-bit which is wrong - it appears that 32-bit is a safe assumption
for Linux, so use that instead.

This fixes Apache writing garbage to its pid file when built using apr
produced from this recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index 54c47fe..8af5411 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 BBCLASSEXTEND = "native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
@@ -23,6 +23,8 @@ inherit autotools lib_package binconfig multilib_header
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
+EXTRA_OECONF_append_class-target = " ac_cv_sizeof_pid_t=4"
+
 do_configure_prepend() {
 	cd ${S}
 	./buildconf
-- 
1.7.9.5



