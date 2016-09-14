Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A33BB77218
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 05:10:20 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 13 Sep 2016 22:10:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,332,1470726000"; 
   d="scan'208";a="8542969"
Received: from yagrawax-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.166.231])
	by orsmga004.jf.intel.com with ESMTP; 13 Sep 2016 22:10:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 17:09:52 +1200
Message-Id: <aaeb36e42d7366453f497a7ac68a7b1d76b5e182.1473829704.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473829704.git.paul.eggleton@linux.intel.com>
References: <cover.1473829704.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473829704.git.paul.eggleton@linux.intel.com>
References: <cover.1473829704.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] lib/oe/copy_buildsystem: fix building eSDK with indirect paths in BBLAYERS
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
X-List-Received-Date: Wed, 14 Sep 2016 05:10:20 -0000

Indirect paths (e.g. ${TOPDIR}/../meta-something) do generally work if
used in BBLAYERS in bblayers.conf. However, if you built an extensible
SDK with this configuration then the creation of the workspace within
the SDK using devtool in do_populate_sdk_ext failed. This is because
the copy_buildsystem code was no longer correctly recognising that the
core layer ("meta") was part of a repository (e.g. openembedded-core /
poky) that should be shipped together - because of the indirection - and
thus it was splitting out the meta directory, and a number of places in
the code assume that the meta directory is next to the scripts
directory. Use os.path.abspath() to flatten out any indirections.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 3d5a746..afaff68 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -17,7 +17,7 @@ class BuildSystem(object):
     def __init__(self, context, d):
         self.d = d
         self.context = context
-        self.layerdirs = d.getVar('BBLAYERS', True).split()
+        self.layerdirs = [os.path.abspath(pth) for pth in d.getVar('BBLAYERS', True).split()]
         self.layers_exclude = (d.getVar('SDK_LAYERS_EXCLUDE', True) or "").split()
 
     def copy_bitbake_and_layers(self, destdir, workspace_name=None):
@@ -26,7 +26,7 @@ class BuildSystem(object):
         bb.utils.mkdirhier(destdir)
         layers = list(self.layerdirs)
 
-        corebase = self.d.getVar('COREBASE', True)
+        corebase = os.path.abspath(self.d.getVar('COREBASE', True))
         layers.append(corebase)
 
         # Exclude layers
-- 
2.5.5


