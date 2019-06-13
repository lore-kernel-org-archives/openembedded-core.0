Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7C7617E79A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 00:01:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2019 17:01:15 -0700
X-ExtLoop1: 1
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.152.144])
	by orsmga008.jf.intel.com with ESMTP; 12 Jun 2019 17:01:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 08:01:11 +0800
Message-Id: <20190613000111.11925-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] serf: cleanup recipe
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
X-List-Received-Date: Thu, 13 Jun 2019 00:01:14 -0000
Content-Transfer-Encoding: 8bit

* Inherit scons bbclass and use the task definitions from there.
* Remove the DEPENDS on python3-scons-native that is already present in
scons class.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/serf/serf_1.3.9.bb | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index 706c86be47..92cd5ca061 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -14,18 +14,19 @@ SRC_URI[sha256sum] = "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-DEPENDS = "python3-scons-native openssl apr apr-util util-linux expat"
+inherit scons
 
-do_compile() {
-	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} \
-		CC="${CC}" \
-		APR=`which apr-1-config` APU=`which apu-1-config` \
-		CFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" \
-		OPENSSL="${STAGING_EXECPREFIXDIR}"
-}
+DEPENDS += " openssl apr apr-util util-linux expat"
 
-do_install() {
-	${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix} LIBDIR=${D}${libdir} install
-}
+EXTRA_OESCONS = " \
+                  LIBDIR=${libdir} \
+                  --install-sandbox=${D} \
+                  CC="${CC}" \
+                  CFLAGS="${CFLAGS}" \
+                  LINKFLAGS="${LDFLAGS}" \
+                  APR=`which apr-1-config` \
+                  APU=`which apu-1-config` \
+                  OPENSSL="${STAGING_EXECPREFIXDIR}" \
+                  "
 
 BBCLASSEXTEND = "native"
-- 
2.20.1


