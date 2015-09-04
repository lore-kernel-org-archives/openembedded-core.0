Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9874A7705A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 20:37:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2015 13:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,470,1437462000"; d="scan'208";a="555477383"
Received: from afshjern.zpn.intel.com ([10.219.26.82])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2015 13:37:58 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 15:38:29 -0500
Message-Id: <1441399109-18306-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH] Move BUILDDIR chmod fix after checks
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
X-List-Received-Date: Fri, 04 Sep 2015 20:37:59 -0000

Makes more sense to have this fix after checking BUILDDIR exists, is
a directory and is writable.

[YOCTO #7669]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 scripts/oe-setup-builddir | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 25d9f13..2598ba8 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -25,10 +25,6 @@ fi
 
 mkdir -p "$BUILDDIR/conf"
 
-# Attempting to remove sticky and setuid bits from BUILDDIR and
-# BUILDDIR/conf directories. #TODO appropriate checks for this
-chmod -st "$BUILDDIR" "$BUILDDIR/conf"
-
 if [ ! -d "$BUILDDIR" ]; then
     echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
     exit 1
@@ -39,6 +35,10 @@ if [ ! -w "$BUILDDIR" ]; then
     exit 1
 fi
 
+# Attempting removal of sticky,setuid bits from BUILDDIR, BUILDDIR/conf
+chmod -st "$BUILDDIR" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR"
+chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR/conf"
+
 cd "$BUILDDIR"
 
 if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-- 
2.5.1


