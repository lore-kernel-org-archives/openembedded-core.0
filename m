Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B611A6FF6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:48:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Jan 2016 10:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="32427918"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 10:48:09 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id E972B2C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:36:04 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:51:04 +0200
Message-Id: <fba7fd0b86cd522526577c63fa975a7283cf4bd3.1453222163.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 2/9] wic: use unique partition number
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
X-List-Received-Date: Tue, 19 Jan 2016 18:48:37 -0000

This is a preparation for 'include' support.

Used unique counter instead of line number for partitions
in .ks file. Line numbers can be equal for different .ks files,
which can cause problems if one .ks file is included into
another.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index e366f61..0191a84 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -84,6 +84,7 @@ class KickStart(object):
         self.partitions = []
         self.bootloader = None
         self.lineno = 0
+        self.partnum = 0
 
         parser = KickStartParser()
         subparsers = parser.add_subparsers()
@@ -130,7 +131,8 @@ class KickStart(object):
                         raise KickStartError('%s:%d: %s' % \
                                              (confpath, lineno, err))
                     if line.startswith('part'):
-                        self.partitions.append(Partition(parsed, lineno))
+                        self.partnum += 1
+                        self.partitions.append(Partition(parsed, self.partnum))
                     else:
                         if not self.bootloader:
                              self.bootloader = parsed
-- 
2.1.4


