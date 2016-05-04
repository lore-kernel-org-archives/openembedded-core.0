Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0CCBD6E666
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2016 08:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="798781826"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 04 May 2016 08:27:35 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 2BA5C6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:22 +0300
Message-Id: <c9be36de41ae255e2341d0bf56f9eb785c80b2de.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 09/14] wic: don't use L suffix for integers
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
X-List-Received-Date: Wed, 04 May 2016 15:27:51 -0000

This suffix is not supported by Python 3. Wic code works
without it on Python 2 too, so it's safe to remove it.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 27bc1c7..6887a7d 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -51,7 +51,7 @@ def sizetype(arg):
     Converts size string in <num>[K|k|M|G] format into the integer value
     """
     if arg.isdigit():
-        return int(arg) * 1024L
+        return int(arg) * 1024
 
     if not arg[:-1].isdigit():
         raise ArgumentTypeError("Invalid size: %r" % arg)
@@ -60,9 +60,9 @@ def sizetype(arg):
     if arg.endswith("k") or arg.endswith("K"):
         return size
     if arg.endswith("M"):
-        return size * 1024L
+        return size * 1024
     if arg.endswith("G"):
-        return size * 1024L * 1024L
+        return size * 1024 * 1024
 
     raise ArgumentTypeError("Invalid size: %r" % arg)
 
@@ -127,7 +127,7 @@ class KickStart():
         part.add_argument('mountpoint')
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
-        part.add_argument("--extra-space", type=sizetype, default=10*1024L)
+        part.add_argument("--extra-space", type=sizetype, default=10*1024)
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype')
         part.add_argument('--label')
-- 
2.1.4


