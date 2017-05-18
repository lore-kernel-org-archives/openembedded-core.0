Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3327978099
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 22:29:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 15:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,360,1491289200"; d="scan'208";a="1150009322"
Received: from jalamego-mobl2.zpn.intel.com ([10.219.128.138])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2017 15:29:12 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 17:28:47 -0500
Message-Id: <1495146527-32073-3-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH 2/2] bc: upgrade 1.06 to 1.07.1
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
X-List-Received-Date: Thu, 18 May 2017 22:29:14 -0000

bc recipe must be upgraded to latest version in upstream.

bc license changed from "GPLv2+ & LGPLv2.1" to "GPLv3+ & LGPLv3"
The new version exhibits a Parallel Make Race that required
unsetting PARALLEL_MAKE variable.
This change was tested with core-image-minimal in qemux86.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../bc/{bc_1.06.bb => bc_1.07.1.bb}                | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/bc/{bc_1.06.bb => bc_1.07.1.bb} (28%)

diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
similarity index 28%
rename from meta/recipes-extended/bc/bc_1.06.bb
rename to meta/recipes-extended/bc/bc_1.07.1.bb
index d8c8a86..55b4422 100644
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -1,25 +1,25 @@
 SUMMARY = "Arbitrary precision calculator language"
 HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
 
-LICENSE = "GPLv2+ & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://bc/bcdefs.h;endline=31;md5=46dffdaf10a99728dd8ce358e45d46d8 \
-                    file://dc/dc.h;endline=25;md5=2f9c558cdd80e31b4d904e48c2374328 \
-                    file://lib/number.c;endline=31;md5=99434a0898abca7784acfd36b8191199"
+LICENSE = "GPLv3+ & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                    file://bc/bcdefs.h;endline=27;md5=1bf4215734d4b9002ffda7b90b14e8e9 \
+                    file://dc/dc.h;endline=20;md5=be0fc95c3503cb8116eea6acb63a5922 \
+                    file://lib/number.c;endline=31;md5=5c437fc63f83a46d4d769d4dd1e74525"
 
 SECTION = "base"
 DEPENDS = "flex"
-PR = "r3"
 
-SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
-           file://fix-segment-fault.patch "
+SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
-SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
+SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
+SRC_URI[sha256sum] = "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
 
 inherit autotools texinfo update-alternatives
 
+PARALLEL_MAKE = ""
+
 ALTERNATIVE_${PN} = "dc"
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.7.4


