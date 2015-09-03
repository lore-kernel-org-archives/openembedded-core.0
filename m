Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A1BC677009
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:56:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 03 Sep 2015 14:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,464,1437462000"; d="scan'208";a="797797774"
Received: from afshjern.zpn.intel.com ([10.219.128.48])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 14:56:26 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 16:56:44 -0500
Message-Id: <1441317404-6663-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Cc: clarson@kergoth.com
Subject: [PATCHv4] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Thu, 03 Sep 2015 21:56:28 -0000

Removing recursive option from chmod -st on BUILDDIR as it would
take very long on existing build directories

[YOCTO #7669]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/sanity.bbclass | 9 ++++++---
 scripts/oe-setup-builddir   | 5 ++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2864318..29bb619 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -841,9 +841,12 @@ def check_sanity_everybuild(status, d):
     else:
         bb.utils.mkdirhier(tmpdir)
         # Remove setuid, setgid and sticky bits from TMPDIR
-        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
-        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
-        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
+        try:
+            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
+            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
+            os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
+        except OSError:
+            bb.warn("Unable to chmod TMPDIR: %s" % tmpdir)
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index f5b7e4e..91bd86b 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -24,7 +24,10 @@ if [ -z "$BUILDDIR" ]; then
 fi
 
 mkdir -p "$BUILDDIR/conf"
-chmod -R -st "$BUILDDIR" 
+
+# Attempting removal of sticky,setuid bits from BUILDDIR, BUILDDIR/conf
+chmod -st "$BUILDDIR" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR"
+chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR/conf"
 
 if [ ! -d "$BUILDDIR" ]; then
     echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
-- 
2.5.1


