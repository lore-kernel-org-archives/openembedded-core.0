Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A9F3A731EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272748"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:54 +1300
Message-Id: <7457c72365ec0034aaa3c6e2928cb1f04861e26a.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/14] classes/populate_sdk*: add dependencies on script files
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:22 -0000

If the script files we use to construct the SDK installer change then
that really ought to trigger re-execution of the do_populate_sdk(_ext)
task, so add file-checksums varflags to ensure that happens.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 3 +++
 meta/classes/populate_sdk_ext.bbclass  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 99b64f7..966161f 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -243,6 +243,9 @@ populate_sdk_log_check() {
 	done
 }
 
+do_populate_sdk[file-checksums] += "${COREBASE}/meta/files/toolchain-shar-relocate.sh:True \
+                                    ${COREBASE}/meta/files/toolchain-shar-extract.sh:True"
+
 do_populate_sdk[dirs] = "${PKGDATA_DIR} ${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 2944576..a115127 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -259,6 +259,7 @@ install_tools() {
 
 	install -m 0644 ${COREBASE}/meta/files/ext-sdk-prepare.py ${SDK_OUTPUT}/${SDKPATH}
 }
+do_populate_sdk_ext[file-checksums] += "${COREBASE}/meta/files/ext-sdk-prepare.py:True"
 
 # Since bitbake won't run as root it doesn't make sense to try and install
 # the extensible sdk as root.
@@ -358,4 +359,8 @@ do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar
 # Make sure codes change in copy_buildsystem can result in rebuilt
 do_populate_sdk_ext[vardeps] += "copy_buildsystem"
 
+do_populate_sdk_ext[file-checksums] += "${COREBASE}/meta/files/toolchain-shar-relocate.sh:True \
+                                        ${COREBASE}/meta/files/toolchain-shar-extract.sh:True \
+                                        ${COREBASE}/scripts/gen-lockedsig-cache:True"
+
 addtask populate_sdk_ext after do_sdk_depends
-- 
2.5.0


