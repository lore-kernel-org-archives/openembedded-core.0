Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4035C71D9A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 13:55:55 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 02 Feb 2017 05:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="60055353"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 02 Feb 2017 05:55:56 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 56E816A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 05:54:56 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 15:32:58 +0200
Message-Id: <4e1ac296e883d3d4b250b9baeeb6dc7e792a015d.1486041986.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486041986.git.ed.bartosh@linux.intel.com>
References: <cover.1486041986.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/3] wic: direct: fix creation of work directory
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
X-List-Received-Date: Thu, 02 Feb 2017 13:55:56 -0000

It was a typo in current code: mktemp was used instead of
mkdtemp to create work directory. This is fixed by using
mkdtemp.

Create work directory as a subdirectory of output directory
to make sure both are on the same partition to make moving
of result image faster.

This also fixes possible disk space issues as mkdtemp uses
TMPDIR, TEMP or TMP environment variables to get default value
of its 'dir' parameter. Those variables are usually pointing
to /tmp, which is not the best location to create huge images.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 4637fbf3..b38e876 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -122,7 +122,7 @@ class DirectImageCreator:
         """
         self.name = name
         self.outdir = outdir
-        self.workdir = tempfile.mktemp(prefix='wic')
+        self.workdir = tempfile.mkdtemp(dir=outdir, prefix='tmp.wic.')
         self.ks = ksobj
 
         self._image = None
-- 
2.1.4


