Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C407160111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 08:05:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 01 Jul 2016 01:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,555,1459839600"; d="scan'208";a="131784671"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2016 01:05:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 955EA2C8001;
	Fri,  1 Jul 2016 01:05:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 11:05:39 +0300
Message-Id: <1467360339-10236-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [krogoth][wic][PATCH] wic: rawcopy: make source filenames unique
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
X-List-Received-Date: Fri, 01 Jul 2016 08:05:54 -0000

Rawcopy plugin copies source files to build folder before using them
to assemble result image. After assembling the image wic renames
source files to <image>.p<partition number>. If the same source file
is used in multiple partitions wic breaks trying to rename file that
doesn't exist.

Added <line number> suffix to the files when copying them to the
build dir. This should make filename unique even if the same source
file is used for multiple partitions.

[YOCTO #9826]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 0472f53..7ce0cc4 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -67,7 +67,7 @@ class RawCopyPlugin(SourcePlugin):
             return
 
         src = os.path.join(bootimg_dir, source_params['file'])
-        dst = os.path.join(cr_workdir, source_params['file'])
+        dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
 
         if 'skip' in source_params:
             dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
-- 
2.1.4


