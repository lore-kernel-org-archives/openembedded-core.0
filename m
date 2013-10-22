Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 651226D304
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:09 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Oct 2013 07:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="311116367"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Oct 2013 07:24:06 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:23:56 -0500
Message-Id: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 01/10] wic: Remove dependency on rt_util module
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:09 -0000

rt_util contains bootstrap_mic(), which imports rpm and other things
we don't need because we don't do bootstrap i.e. runtime (set in
wic.conf) is always set to 'native', which means use what's on the
local host.

bootstrap mode is for downloading and installing rpms that wic needs,
which we may want to implement later; for now, we just want to use
what's local.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/creator.py                       | 2 +-
 scripts/lib/mic/plugins/imager/direct_plugin.py  | 2 +-
 scripts/lib/mic/plugins/imager/fs_plugin.py      | 2 +-
 scripts/lib/mic/plugins/imager/livecd_plugin.py  | 2 +-
 scripts/lib/mic/plugins/imager/liveusb_plugin.py | 2 +-
 scripts/lib/mic/plugins/imager/loop_plugin.py    | 2 +-
 scripts/lib/mic/plugins/imager/raw_plugin.py     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/mic/creator.py b/scripts/lib/mic/creator.py
index f3d0de1..b36bbf0 100644
--- a/scripts/lib/mic/creator.py
+++ b/scripts/lib/mic/creator.py
@@ -18,7 +18,7 @@
 import os, sys, re
 from optparse import SUPPRESS_HELP
 
-from mic import msger, rt_util
+from mic import msger
 from mic.utils import cmdln, errors, rpmmisc
 from mic.conf import configmgr
 from mic.plugin import pluginmgr
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/mic/plugins/imager/direct_plugin.py
index 53381e5..e015256 100644
--- a/scripts/lib/mic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/mic/plugins/imager/direct_plugin.py
@@ -30,7 +30,7 @@ import shutil
 import re
 import tempfile
 
-from mic import chroot, msger, rt_util
+from mic import chroot, msger
 from mic.utils import misc, fs_related, errors, runner, cmdln
 from mic.conf import configmgr
 from mic.plugin import pluginmgr
diff --git a/scripts/lib/mic/plugins/imager/fs_plugin.py b/scripts/lib/mic/plugins/imager/fs_plugin.py
index 8e758db..6bcaf00 100644
--- a/scripts/lib/mic/plugins/imager/fs_plugin.py
+++ b/scripts/lib/mic/plugins/imager/fs_plugin.py
@@ -18,7 +18,7 @@
 import os
 import sys
 
-from mic import chroot, msger, rt_util
+from mic import chroot, msger
 from mic.utils import cmdln, misc, errors, fs_related
 from mic.imager import fs
 from mic.conf import configmgr
diff --git a/scripts/lib/mic/plugins/imager/livecd_plugin.py b/scripts/lib/mic/plugins/imager/livecd_plugin.py
index d24ef59..82cb1af 100644
--- a/scripts/lib/mic/plugins/imager/livecd_plugin.py
+++ b/scripts/lib/mic/plugins/imager/livecd_plugin.py
@@ -19,7 +19,7 @@ import os
 import shutil
 import tempfile
 
-from mic import chroot, msger, rt_util
+from mic import chroot, msger
 from mic.utils import misc, fs_related, errors
 from mic.conf import configmgr
 import mic.imager.livecd as livecd
diff --git a/scripts/lib/mic/plugins/imager/liveusb_plugin.py b/scripts/lib/mic/plugins/imager/liveusb_plugin.py
index 7aa8927..3d53c84 100644
--- a/scripts/lib/mic/plugins/imager/liveusb_plugin.py
+++ b/scripts/lib/mic/plugins/imager/liveusb_plugin.py
@@ -19,7 +19,7 @@ import os
 import shutil
 import tempfile
 
-from mic import chroot, msger, rt_util
+from mic import chroot, msger
 from mic.utils import misc, fs_related, errors
 from mic.utils.partitionedfs import PartitionedMount
 from mic.conf import configmgr
diff --git a/scripts/lib/mic/plugins/imager/loop_plugin.py b/scripts/lib/mic/plugins/imager/loop_plugin.py
index 8f4b030..2a05b3c 100644
--- a/scripts/lib/mic/plugins/imager/loop_plugin.py
+++ b/scripts/lib/mic/plugins/imager/loop_plugin.py
@@ -19,7 +19,7 @@ import os
 import shutil
 import tempfile
 
-from mic import chroot, msger, rt_util
+from mic import chroot, msger
 from mic.utils import misc, fs_related, errors, cmdln
 from mic.conf import configmgr
 from mic.plugin import pluginmgr
diff --git a/scripts/lib/mic/plugins/imager/raw_plugin.py b/scripts/lib/mic/plugins/imager/raw_plugin.py
index 1b9631d..f9625b8 100644
--- a/scripts/lib/mic/plugins/imager/raw_plugin.py
+++ b/scripts/lib/mic/plugins/imager/raw_plugin.py
@@ -20,7 +20,7 @@ import shutil
 import re
 import tempfile
 
-from mic import chroot, msger, rt_util
+from mic import chroot, msger
 from mic.utils import misc, fs_related, errors, runner, cmdln
 from mic.conf import configmgr
 from mic.plugin import pluginmgr
-- 
1.8.3.1


