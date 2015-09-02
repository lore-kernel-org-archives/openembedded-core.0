Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9668277026
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 22:45:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2015 15:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,457,1437462000"; d="scan'208";a="554141325"
Received: from afshjern.zpn.intel.com ([10.219.128.48])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2015 15:45:30 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:45:57 -0500
Message-Id: <1441233957-13108-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Cc: clarson@kergoth.com
Subject: [PATCHv3] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Wed, 02 Sep 2015 22:45:31 -0000

Removing recursive option from chmod -st on BUILDDIR as it would
take very long on existing build directories

[YOCTO 7669]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 scripts/oe-setup-builddir | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index f5b7e4e..25d9f13 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -24,7 +24,10 @@ if [ -z "$BUILDDIR" ]; then
 fi
 
 mkdir -p "$BUILDDIR/conf"
-chmod -R -st "$BUILDDIR" 
+
+# Attempting to remove sticky and setuid bits from BUILDDIR and
+# BUILDDIR/conf directories. #TODO appropriate checks for this
+chmod -st "$BUILDDIR" "$BUILDDIR/conf"
 
 if [ ! -d "$BUILDDIR" ]; then
     echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
-- 
2.5.1


