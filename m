Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D296273182
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2016 08:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="946152169"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2016 08:27:29 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 6A8696A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:17 +0300
Message-Id: <02696717cc30072561fa3f3b13b58e8cd4f598b4.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 04/14] wic: don't inherit classes from object
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
X-List-Received-Date: Wed, 04 May 2016 15:27:29 -0000

All classes in Python3 are new style classes and don't need
to be inherited from object. Wic code works fine without
this inheritance even with Python2, so it's harmless to
remove it.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/creator.py             | 2 +-
 scripts/lib/wic/imager/baseimager.py   | 2 +-
 scripts/lib/wic/ksparser.py            | 2 +-
 scripts/lib/wic/partition.py           | 2 +-
 scripts/lib/wic/plugin.py              | 2 +-
 scripts/lib/wic/utils/partitionedfs.py | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/creator.py b/scripts/lib/wic/creator.py
index d0158fb..d4972e8 100644
--- a/scripts/lib/wic/creator.py
+++ b/scripts/lib/wic/creator.py
@@ -24,7 +24,7 @@ from wic.conf import configmgr
 from wic.plugin import pluginmgr
 
 
-class Creator(object):
+class Creator():
     """${name}: create an image
 
     Usage:
diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index 557f536..463ae93 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -25,7 +25,7 @@ from wic import msger
 from wic.utils.errors import CreatorError
 from wic.utils import runner
 
-class BaseImageCreator(object):
+class BaseImageCreator():
     """Base class for image creation.
 
     BaseImageCreator is the simplest creator class available; it will
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 10d0d7c..27bc1c7 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -110,7 +110,7 @@ def systemidtype(arg):
 
     return arg
 
-class KickStart(object):
+class KickStart():
     """"Kickstart parser implementation."""
 
     def __init__(self, confpath):
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 6d21193..34fd7d6 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -38,7 +38,7 @@ partition_methods = {
     "do_configure_partition":None,
 }
 
-class Partition(object):
+class Partition():
 
     def __init__(self, args, lineno):
         self.args = args
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 933647d..83af9b0 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -29,7 +29,7 @@ PLUGIN_TYPES = ["imager", "source"]
 PLUGIN_DIR = "/lib/wic/plugins" # relative to scripts
 SCRIPTS_PLUGIN_DIR = "scripts" + PLUGIN_DIR
 
-class PluginMgr(object):
+class PluginMgr():
     plugin_dirs = {}
 
     # make the manager class as singleton
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 89a7c13..8f4db4e 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -33,7 +33,7 @@ GPT_OVERHEAD = 34
 # Size of a sector in bytes
 SECTOR_SIZE = 512
 
-class Image(object):
+class Image():
     """
     Generic base object for an image.
 
-- 
2.1.4


