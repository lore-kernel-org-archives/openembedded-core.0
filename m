Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F3EF16FFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:20:15 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 18 Jan 2016 06:20:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="31561707"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2016 06:20:08 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 5D8232C8001
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:08:03 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:22:43 +0200
Message-Id: <7b3a2a7d8d402db81166e5a79386bdcbb0d0bcf4.1453119482.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 3/6] wic: improve processing of parseing errors
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
X-List-Received-Date: Mon, 18 Jan 2016 14:20:16 -0000

Caught argparse.ArgumentError
Included .ks file name and line number into the error messages.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/kickstart.py b/scripts/lib/wic/kickstart.py
index 7f0105d..5d3a572 100644
--- a/scripts/lib/wic/kickstart.py
+++ b/scripts/lib/wic/kickstart.py
@@ -27,7 +27,7 @@
 
 
 import shlex
-from argparse import ArgumentParser, ArgumentTypeError
+from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
 
 from wic.partition import Partition
 
@@ -113,11 +113,16 @@ class KickStart(object):
                 line = line.strip()
                 lineno += 1
                 if line and line[0] != '#':
-                    parsed = parser.parse_args(shlex.split(line))
+                    try:
+                        parsed = parser.parse_args(shlex.split(line))
+                    except ArgumentError as err:
+                        raise KickStartError('%s:%d: %s' % \
+                                             (confpath, lineno, err))
                     if line.startswith('part'):
                         self.partitions.append(Partition(parsed, lineno))
                     else:
                         if not self.bootloader:
                              self.bootloader = parsed
                         else:
-                             raise KickStartError("Error: more than one bootloader specified")
+                             raise KickStartError("%s:%d: more than one bootloader "\
+                                                  "specified" % (confpath, lineno))
-- 
2.1.4


