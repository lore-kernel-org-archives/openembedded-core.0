Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DEF8873124
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491394260; x=1522930260; h=from:to:subject:date:message-id;
	bh=nEdFQnCooH2MfkecU8N1rYA9cfWiLNG0YpPYAwSE2vw=;
	b=JWFckuGN8eN+NG6jfTuQYpKx0vr+vHSWUd1sSkKRINirt/XsbcrO8LGm
	Tk8hs5CsINXA/z5tB7aesdoWPCDpcw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 05:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,278,1486454400"; d="scan'208";a="1115788476"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.13.153])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2017 05:10:57 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 13:10:53 +0100
Message-Id: <20170405121055.27230-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 1/3] oeqa/utils/buildproject: create a more unique tmp dir
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

Rather than hardcoding /tmp as the default tmpdir make a more unique tmpdir
with tempfile.mkdtemp() when the caller doesn't specify a tmpdir value.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/utils/buildproject.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index fc8879c..487f08b 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -8,14 +8,17 @@ import os
 import re
 import subprocess
 import shutil
+import tempfile
 
 from abc import ABCMeta, abstractmethod
 
 class BuildProject(metaclass=ABCMeta):
-    def __init__(self, uri, foldername=None, tmpdir="/tmp/", dl_dir=None):
+    def __init__(self, uri, foldername=None, tmpdir=None, dl_dir=None):
         self.uri = uri
         self.archive = os.path.basename(uri)
-        self.localarchive = os.path.join(tmpdir,self.archive)
+        if not tmpdir:
+            tmpdir = tempfile.mkdtemp(prefix='buildproject')
+        self.localarchive = os.path.join(tmpdir, self.archive)
         self.dl_dir = dl_dir
         if foldername:
             self.fname = foldername
-- 
2.9.3


