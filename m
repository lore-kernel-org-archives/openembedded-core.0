Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 29A1D71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 22:34:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 28 Aug 2015 15:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,427,1437462000"; d="scan'208";a="757562709"
Received: from afshjern.zpn.intel.com ([10.219.17.7])
	by orsmga001.jf.intel.com with ESMTP; 28 Aug 2015 15:33:44 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 17:34:04 -0500
Message-Id: <1440801244-24561-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] Fix mode +st on TMPDIR when creating it
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
X-List-Received-Date: Fri, 28 Aug 2015 22:34:30 -0000

A sanity check fails when TMPDIR has setuid, setgid set. It was
proposed to fix this on TMPDIR creation instead of failing with
a sanity test only. This patch handles removal of those special
bits (and additonally, the sticky bit) from BUILDDIR and TMPDIR
when these directories are created.

[YOCTO #7669]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 scripts/oe-setup-builddir   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ef90fc8..2864318 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -686,6 +686,7 @@ def check_sanity_version_change(status, d):
     status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
 
 def check_sanity_everybuild(status, d):
+    import os, stat
     # Sanity tests which test the users environment so need to run at each build (or are so cheap
     # it makes sense to always run them.
 
@@ -839,6 +840,10 @@ def check_sanity_everybuild(status, d):
                 status.addresult("Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % saved_tmpdir)
     else:
         bb.utils.mkdirhier(tmpdir)
+        # Remove setuid, setgid and sticky bits from TMPDIR
+        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
+        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
+        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index add0b50..f5b7e4e 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -24,6 +24,7 @@ if [ -z "$BUILDDIR" ]; then
 fi
 
 mkdir -p "$BUILDDIR/conf"
+chmod -R -st "$BUILDDIR" 
 
 if [ ! -d "$BUILDDIR" ]; then
     echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
-- 
2.5.0


