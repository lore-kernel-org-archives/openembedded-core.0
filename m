Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5CE731A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:48:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 19 Jan 2016 10:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="896709154"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2016 10:48:51 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 03A172C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:36:45 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:51:06 +0200
Message-Id: <d97546d3b2b63fca3b6aff8958559441a0c6cb11.1453222163.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 4/9] wic: ksparser: add support for include
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
X-List-Received-Date: Tue, 19 Jan 2016 18:48:49 -0000

Extended parser to support inclusion of .ks files:
    recursively called self._parse to parse included .ks

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 0191a84..c73a456 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -116,6 +116,9 @@ class KickStart(object):
         bootloader.add_argument('--timeout', type=int)
         bootloader.add_argument('--source')
 
+        include = subparsers.add_parser('include')
+        include.add_argument('path')
+
         self._parse(parser, confpath)
 
     def _parse(self, parser, confpath):
@@ -133,7 +136,9 @@ class KickStart(object):
                     if line.startswith('part'):
                         self.partnum += 1
                         self.partitions.append(Partition(parsed, self.partnum))
-                    else:
+                    elif line.startswith('include'):
+                        self._parse(parser, parsed.path)
+                    elif line.startswith('bootloader'):
                         if not self.bootloader:
                              self.bootloader = parsed
                         else:
-- 
2.1.4


