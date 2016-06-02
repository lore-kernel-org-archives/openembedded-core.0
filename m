Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C037877405
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:13:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 02 Jun 2016 03:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="967354356"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2016 03:13:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id A2E506A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:53 +0300
Message-Id: <1b3e1cb104fa202b15fcacb3d00dc43b698320c2.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 07/16] scripts: python3: use new metaclass syntax
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
X-List-Received-Date: Thu, 02 Jun 2016 10:13:55 -0000

Used metaclass=<metaclass> syntax instead old
__metaclass__ = <metaclass> as only new one is supported
in python 3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/bsp/engine.py | 6 ++----
 scripts/test-remote-image | 8 ++------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index f75454d..5b49486 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -40,12 +40,11 @@ import json
 import subprocess
 import shutil
 
-class Line():
+class Line(metaclass=ABCMeta):
     """
     Generic (abstract) container representing a line that will appear
     in the BSP-generating program.
     """
-    __metaclass__ = ABCMeta
 
     def __init__(self, line):
         self.line = line
@@ -319,11 +318,10 @@ class BooleanInputLine(InputLine):
         return line
 
 
-class ListInputLine(InputLine):
+class ListInputLine(InputLine, metaclass=ABCMeta):
     """
     Base class for List-based Input lines. e.g. Choicelist, Checklist.
     """
-    __metaclass__ = ABCMeta
 
     def __init__(self, props, tag, lineno):
         InputLine.__init__(self, props, tag, lineno)
diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index 7a00db9..698948b 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -92,13 +92,11 @@ def get_args_parser():
     parser.add_argument('--skip-download', required=False, action="store_true", dest="skip_download", default=False, help='Skip downloading the images completely. This needs the correct files to be present in the directory specified by the target profile.')
     return parser
 
-class BaseTargetProfile(object):
+class BaseTargetProfile(object, metaclass=ABCMeta):
     """
     This class defines the meta profile for a specific target (MACHINE type + image type).
     """
 
-    __metaclass__ = ABCMeta
-
     def __init__(self, image_type):
         self.image_type = image_type
 
@@ -191,13 +189,11 @@ class AutoTargetProfile(BaseTargetProfile):
         return controller.get_extra_files()
 
 
-class BaseRepoProfile(object):
+class BaseRepoProfile(object, metaclass=ABCMeta):
     """
     This class defines the meta profile for an images repository.
     """
 
-    __metaclass__ = ABCMeta
-
     def __init__(self, repolink, localdir):
         self.localdir = localdir
         self.repolink = repolink
-- 
2.1.4


