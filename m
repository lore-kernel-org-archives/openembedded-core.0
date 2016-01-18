Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A381E700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:20:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jan 2016 06:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="895743274"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2016 06:20:37 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 965632C8001
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:08:32 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:22:45 +0200
Message-Id: <63cbe7e1c830cb3536128ae33236fb9b0cdb6bb6.1453119482.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 5/6] wic: override ArgumentParser.error
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
X-List-Received-Date: Mon, 18 Jan 2016 14:20:36 -0000

Overriden error method to throw exception instead of
printing usage error message. Exception is caught by
KickStart code to add .ks file name and line number.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/kickstart.py b/scripts/lib/wic/kickstart.py
index 5d3a572..7dbe052 100644
--- a/scripts/lib/wic/kickstart.py
+++ b/scripts/lib/wic/kickstart.py
@@ -34,6 +34,14 @@ from wic.partition import Partition
 class KickStartError(Exception):
     pass
 
+class KickStartParser(ArgumentParser):
+    """
+    This class overwrites error method to throw exception
+    instead of producing usage message(default argparse behavior).
+    """
+    def error(self, message):
+        raise ArgumentError(None, message)
+
 def sizetype(arg):
     """
     Custom type for ArgumentParser
@@ -77,7 +85,7 @@ class KickStart(object):
         self.bootloader = None
         self.lineno = 0
 
-        parser = ArgumentParser()
+        parser = KickStartParser()
         subparsers = parser.add_subparsers()
 
         part = subparsers.add_parser('part')
-- 
2.1.4


