Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D6C2D71AE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 15:42:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 17 Jan 2017 07:42:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,245,1477983600"; d="scan'208";a="49719742"
Received: from yocto-ab04.ostc.intel.com ([10.54.69.51])
	by orsmga004.jf.intel.com with ESMTP; 17 Jan 2017 07:42:28 -0800
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2017 07:42:09 -0800
Message-Id: <a3fe53ae33e80c917e2897d49a91c191bb230616.1484667160.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 1/3] distutils3.bbclass: add egg files/directories to python path
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
X-List-Received-Date: Tue, 17 Jan 2017 15:42:31 -0000

Packages that use .egg files or directories for installation may
not be found when imported at the python3 interpreter.
.egg files/directories path must be included in a .pth file to
be appropriately included in python path.

This change looks for .egg files/directories in sitepackages
and adds its path to a .pth file during package installation.
It ensures that any new package that uses .egg files/recipes
will be appropriately added to path by performing the check from
the distutils3 class.

[YOCTO #8673]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/classes/distutils3.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index a6720c5..f8e2e2e 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -68,6 +68,16 @@ distutils3_do_install() {
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
             rmdir ${D}${datadir}/share
         fi
+
+        # detect if .egg files/directories were created and add their
+        # path to a .pth file
+        SHORT_PN=$(echo "${PN}" | sed 's/${PYTHON_PN}-//g')
+        if test -e ${D}${PYTHON_SITEPACKAGES_DIR}/${SHORT_PN}*.egg; then
+            EGG_NAME=$(basename $(find ${D}${PYTHON_SITEPACKAGES_DIR}/ \
+-name ${SHORT_PN}\*.egg))
+            echo "./${EGG_NAME}" > ${D}${PYTHON_SITEPACKAGES_DIR}/\
+${SHORT_PN}.pth
+        fi
 }
 distutils3_do_install[vardepsexclude] = "MACHINE"
 
-- 
1.8.3.1


