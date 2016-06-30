Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 13F076E64A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 16:29:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 30 Jun 2016 09:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,552,1459839600"; d="scan'208";a="131350947"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2016 09:29:41 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 426912C8001;
	Thu, 30 Jun 2016 09:29:36 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2016 19:29:18 +0300
Message-Id: <1467304158-1798-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: rawcopy: make source filenames unique
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
X-List-Received-Date: Thu, 30 Jun 2016 16:29:41 -0000

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
index ba014b0..e0b11f9 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -68,7 +68,7 @@ class RawCopyPlugin(SourcePlugin):
             return
 
         src = os.path.join(bootimg_dir, source_params['file'])
-        dst = os.path.join(cr_workdir, source_params['file'])
+        dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
 
         if 'skip' in source_params:
             sparse_copy(src, dst, skip=source_params['skip'])
-- 
2.1.4


