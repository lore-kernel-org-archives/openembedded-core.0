Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1596AC37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 14:22:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2015 06:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,469,1444719600"; d="scan'208";a="713511242"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 23 Dec 2015 06:22:13 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id DEF5C6A4087;
	Wed, 23 Dec 2015 07:10:12 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2015 15:50:35 +0200
Message-Id: <1450878635-25307-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Joshua Lock <joshua.lock@collabora.co.uk>
Subject: [wic][PATCH] wic: rawcopy: Copy source file to build folder
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
X-List-Received-Date: Wed, 23 Dec 2015 14:22:14 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

When a file is given using --sourceparams then wic directly use that file
instead of copying them to build folder. At time of assembling it os.rename
is called which renames all the files to name. In that process the original
file is renamed. When image recipe is rebuilt then wic complains about
missing file which was renamed in previous build.

[YOCTO #8854]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index f0691ba..0472f53 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -67,13 +67,14 @@ class RawCopyPlugin(SourcePlugin):
             return
 
         src = os.path.join(bootimg_dir, source_params['file'])
-        dst = src
+        dst = os.path.join(cr_workdir, source_params['file'])
 
         if 'skip' in source_params:
-            dst = os.path.join(cr_workdir, source_params['file'])
             dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
                     (src, dst, source_params['skip'])
-            exec_cmd(dd_cmd)
+        else:
+            dd_cmd = "cp %s %s" % (src, dst)
+        exec_cmd(dd_cmd)
 
         # get the size in the right units for kickstart (kB)
         du_cmd = "du -Lbks %s" % dst
-- 
2.1.4


