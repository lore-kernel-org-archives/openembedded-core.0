Return-Path: <jiajie.hu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CC0076E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 06:01:38 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP; 10 Nov 2016 22:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,620,1473145200"; d="scan'208";a="30066612"
Received: from jiajiehu.sh.intel.com ([10.239.14.6])
	by fmsmga005.fm.intel.com with ESMTP; 10 Nov 2016 22:01:39 -0800
From: Jiajie Hu <jiajie.hu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2016 14:02:18 +0800
Message-Id: <1478844138-13407-1-git-send-email-jiajie.hu@intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] devtool: fix handling of unicode characters from subprocess stdout
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
X-List-Received-Date: Fri, 11 Nov 2016 06:01:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In previous implementation, a UnicodeDecodeError exception will be
raised if multi-byte encoded characters are printed by the subprocess.
As an example, the following command will fail in an en_US.UTF-8
environment because wget quotes its saving destination with '‘'(0xE2
0x80 0x98), while just the first byte is provided for decoding:

    devtool add recipe http://example.com/source.tar.xz

The patch fixes the issue by avoiding such kind of incomplete decoding.

Signed-off-by: Jiajie Hu <jiajie.hu@intel.com>
---
 scripts/lib/devtool/__init__.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index e675133..31ecb65 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -23,6 +23,7 @@ import sys
 import subprocess
 import logging
 import re
+import codecs
 
 logger = logging.getLogger('devtool')
 
@@ -67,10 +68,10 @@ def exec_watch(cmd, **options):
         cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, **options
     )
 
+    reader = codecs.getreader('utf-8')(process.stdout)
     buf = ''
     while True:
-        out = process.stdout.read(1)
-        out = out.decode('utf-8')
+        out = reader.read(1, 1)
         if out:
             sys.stdout.write(out)
             sys.stdout.flush()
-- 
1.9.1


