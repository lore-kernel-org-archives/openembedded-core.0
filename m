Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 265C777A0F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491394261; x=1522930261;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=H+kXIDsfCUnezSK6mjiGtxv6QLXbA50TmpGb0bcx0Zs=;
	b=fU84DqTjoXRPB/s5vj+GkSxy39vHZ80iY/lxwGEaP1sqU3PFLbzAHfFz
	f31DOMblliKTPY8A3GoHluj4m82YnQ==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 05:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,278,1486454400"; d="scan'208";a="1115788478"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.13.153])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2017 05:10:59 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 13:10:54 +0100
Message-Id: <20170405121055.27230-2-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170405121055.27230-1-joshua.g.lock@intel.com>
References: <20170405121055.27230-1-joshua.g.lock@intel.com>
Subject: [PATCH 2/3] oeqa/utils/targetbuild: tmp dir improvements
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
X-List-Received-Date: Wed, 05 Apr 2017 12:10:59 -0000

Don't hard-code /tmp as the tmpdir, instead use WORKDIR as the tmpdir if the
instantiater doesn't specify a value.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/utils/targetbuild.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 6f237b5..9249fa2 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -8,14 +8,19 @@ import os
 import re
 import bb.utils
 import subprocess
+import tempfile
 from abc import ABCMeta, abstractmethod
 
 class BuildProject(metaclass=ABCMeta):
 
-    def __init__(self, d, uri, foldername=None, tmpdir="/tmp/"):
+    def __init__(self, d, uri, foldername=None, tmpdir=None):
         self.d = d
         self.uri = uri
         self.archive = os.path.basename(uri)
+        if not tmpdir:
+            tmpdir = self.d.getVar('WORKDIR')
+            if not tmpdir:
+                tmpdir = tempfile.mkdtemp(prefix='buildproject')
         self.localarchive = os.path.join(tmpdir,self.archive)
         if foldername:
             self.fname = foldername
@@ -24,7 +29,6 @@ class BuildProject(metaclass=ABCMeta):
 
     # Download self.archive to self.localarchive
     def _download_archive(self):
-
         dl_dir = self.d.getVar("DL_DIR")
         if dl_dir and os.path.exists(os.path.join(dl_dir, self.archive)):
             bb.utils.copyfile(os.path.join(dl_dir, self.archive), self.localarchive)
@@ -73,7 +77,7 @@ class TargetBuildProject(BuildProject):
     def __init__(self, target, d, uri, foldername=None):
         self.target = target
         self.targetdir = "~/"
-        BuildProject.__init__(self, d, uri, foldername, tmpdir="/tmp")
+        BuildProject.__init__(self, d, uri, foldername)
 
     def download_archive(self):
 
-- 
2.9.3


