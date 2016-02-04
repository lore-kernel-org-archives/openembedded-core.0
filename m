Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 79FC4772D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:31:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 04 Feb 2016 12:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="740710359"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2016 12:31:58 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 12:31:45 -0800
Message-Id: <fcef7183f0ac9ab38715bb0c0a80109696d79b2d.1454614198.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 5/5] populate_sdk_ext: Make populate_sdk_ext depend on sdk_extra_conf
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
X-List-Received-Date: Thu, 04 Feb 2016 20:31:58 -0000

If a user changes sdk_extra_conf, it should cause populate_sdk_ext to
run.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index caf8b6e..704c003 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -361,8 +361,9 @@ do_populate_sdk_ext[depends] = "${@d.getVarFlag('do_populate_sdk', 'depends', Fa
 
 do_populate_sdk_ext[rdepends] += "${@' '.join([x + ':do_build' for x in d.getVar('SDK_TARGETS', True).split()])}"
 
-# Make sure codes change in copy_buildsystem can result in rebuilt
-do_populate_sdk_ext[vardeps] += "copy_buildsystem"
+# Make sure code changes can result in rebuild
+do_populate_sdk_ext[vardeps] += "copy_buildsystem \
+                                 sdk_ext_postinst"
 
 do_populate_sdk_ext[file-checksums] += "${COREBASE}/meta/files/toolchain-shar-relocate.sh:True \
                                         ${COREBASE}/meta/files/toolchain-shar-extract.sh:True \
-- 
2.5.0


