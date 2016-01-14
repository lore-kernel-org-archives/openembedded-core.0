Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5285F731B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 14:13:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jan 2016 06:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="29293562"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jan 2016 06:13:31 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 9455C6A4002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:01:26 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:12:52 +0200
Message-Id: <324f3f4d48f32282e0e75ed58fc7b20a8e99fb7f.1452766193.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 2/9] wic: add kickstart parser module
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
X-List-Received-Date: Thu, 14 Jan 2016 14:13:32 -0000

This module will replace existing pykickstart machinery
it contains only option used by wic, it's simple and
clear. And It will allow to remove a lot of old complex
code from 3rdparty/pykickstart/ and kickstart/custom_commands.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart.py | 120 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 scripts/lib/wic/kickstart.py

diff --git a/scripts/lib/wic/kickstart.py b/scripts/lib/wic/kickstart.py
new file mode 100644
index 0000000..2208395
--- /dev/null
+++ b/scripts/lib/wic/kickstart.py
@@ -0,0 +1,120 @@
+#!/usr/bin/env python -tt
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2016 Intel, Inc.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License as published by the Free
+# Software Foundation; version 2 of the License
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc., 59
+# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# DESCRIPTION
+# This module provides parser for kickstart format
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+# Ed Bartosh <ed.bartosh> (at] linux.intel.com>
+
+
+
+import shlex
+from argparse import ArgumentParser, ArgumentTypeError
+
+from wic.partition import Partition
+
+def sizetype(arg):
+    """
+    Custom type for ArgumentParser
+    Converts size string in <num>[K|k|M|G] format into the integer value
+    """
+    if arg.isdigit():
+        return int(arg) * 1024L
+
+    if not arg[:-1].isdigit():
+        raise ArgumentTypeError("Invalid size: %r" % arg)
+
+    size = int(arg[:-1])
+    if arg.endswith("k") or arg.endswith("K"):
+        return size
+    if arg.endswith("M"):
+        return size * 1024L
+    if arg.endswith("G"):
+        return size * 1024L * 1024L
+
+    raise ArgumentTypeError("Invalid size: %r" % arg)
+
+def overheadtype(arg):
+    """
+    Custom type for ArgumentParser
+    Converts overhead string to float and checks if it's bigger than 1.0
+    """
+    try:
+        result = float(arg)
+    except ValueError:
+        raise ArgumentTypeError("Invalid value: %r" % arg)
+
+    if result < 1.0:
+        raise ArgumentTypeError("Overhead factor should be > 1.0" % arg)
+
+    return result
+
+class KickStart(object):
+    def __init__(self, confpath):
+
+        self.partitions = []
+        self.bootloader = None
+        self.lineno = 0
+
+        parser = ArgumentParser()
+        subparsers = parser.add_subparsers()
+
+        part = subparsers.add_parser('part')
+        part.add_argument('mountpoint')
+        part.add_argument('--active', action='store_true')
+        part.add_argument('--align', type=int)
+        part.add_argument("--extra-space", type=sizetype, default=10*1024L)
+        part.add_argument('--fsoptions', dest='fsopts')
+        part.add_argument('--fstype')
+        part.add_argument('--label')
+        part.add_argument('--no-table')
+        part.add_argument('--ondisk', '--ondrive', dest='disk')
+        part.add_argument("--overhead-factor", type=overheadtype, default=1.3)
+        part.add_argument('--part-type')
+        part.add_argument('--rootfs-dir')
+        part.add_argument('--size', type=sizetype, default=0)
+        part.add_argument('--source')
+        part.add_argument('--sourceparams')
+        part.add_argument('--use-uuid', action='store_true')
+        part.add_argument('--uuid')
+
+        bootloader = subparsers.add_parser('bootloader')
+        bootloader.add_argument('--append')
+        bootloader.add_argument('--configfile')
+        bootloader.add_argument('--ptable', choices=('msdos', 'gpt'),
+                                default='msdos')
+        bootloader.add_argument('--timeout', type=int)
+        bootloader.add_argument('--source')
+
+        with open(confpath) as conf:
+            lineno = 0
+            for line in conf:
+                line = line.strip()
+                lineno += 1
+                if line and line[0] != '#':
+                    parsed = parser.parse_args(shlex.split(line))
+                    if line.startswith('part'):
+                        self.partitions.append(Partition(parsed, lineno))
+                    else:
+                        if not self.bootloader:
+                             self.bootloader = parsed
+                        else:
+                             raise KickStartError("Error: more than one bootloader specified")
-- 
2.1.4


