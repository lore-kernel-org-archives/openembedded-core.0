Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0674B7728C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:49:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Feb 2016 03:49:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="897369240"
Received: from gtan23-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.53])
	by orsmga001.jf.intel.com with ESMTP; 29 Feb 2016 03:49:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 00:48:23 +1300
Message-Id: <f74e78c51a4a22a68e7740c2a1d4a37889e603c7.1456746435.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456746435.git.paul.eggleton@linux.intel.com>
References: <cover.1456746435.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456746435.git.paul.eggleton@linux.intel.com>
References: <cover.1456746435.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/module: allow substitution of the modules_install target name
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
X-List-Received-Date: Mon, 29 Feb 2016 11:49:07 -0000

Quite a few external kernel modules I've found floating around don't
have a modules_install target, but they do have an install target that
basically differs only in name. To make it easier to build these just
make this a MODULES_INSTALL_TARGET variable that you can set from the
recipe - the alternative would be copy-and-paste the do_install
definition from this class which is potentially fragile.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/module.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 0952c0c..01c9309 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -6,6 +6,8 @@ do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
+MODULES_INSTALL_TARGET ?= "modules_install"
+
 module_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
@@ -21,7 +23,7 @@ module_do_install() {
 	oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
 	           CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
 	           O=${STAGING_KERNEL_BUILDDIR} \
-	           modules_install
+	           ${MODULES_INSTALL_TARGET}
 }
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
2.5.0


