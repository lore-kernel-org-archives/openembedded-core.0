Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE22728A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 11:55:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 28 Jan 2015 03:50:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,480,1418112000"; d="scan'208";a="518910020"
Received: from nnodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by orsmga003.jf.intel.com with ESMTP; 28 Jan 2015 03:48:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 11:54:44 +0000
Message-Id: <f45204c5878083a6bc79b9002bfbcf1bf4b281d8.1422445957.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] lib/oe/image.py: add error checking for missing IMAGE_CMD
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
X-List-Received-Date: Wed, 28 Jan 2015 11:55:10 -0000

An invalid value in IMAGE_FSTYPES was triggering a traceback. Add a
check and a reasonable error message instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/image.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index f9c8f84..0ce303d 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -296,7 +296,11 @@ class Image(ImageDepGraph):
                 bb.data.update_data(localdata)
                 localdata.setVar('type', type)
 
-                cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
+                image_cmd = localdata.getVar("IMAGE_CMD", True)
+                if image_cmd:
+                    cmds.append("\t" + image_cmd)
+                else:
+                    bb.fatal("No IMAGE_CMD defined for IMAGE_FSTYPES entry '%s' - possibly invalid type name or missing support class" % type)
                 cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
 
                 if type in cimages:
-- 
1.9.3


