Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D56D977167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 22:50:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 16 Oct 2015 15:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,691,1437462000"; d="scan'208";a="582466643"
Received: from afshjern.zpn.intel.com ([10.219.17.16])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Oct 2015 15:50:31 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 17:51:12 -0500
Message-Id: <1445035872-735-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.6.1
Cc: clarson@kergoth.com
Subject: [PATCH 1/1] sanity.bbclass: expand warning when chmod fails
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
X-List-Received-Date: Fri, 16 Oct 2015 22:50:35 -0000

As suggested, add exception message to warning in
sanity.bbclass when chmod fails on TMPDIR.

[YOCTO #7669]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 34f8618..d0b5cd0 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -843,8 +843,8 @@ def check_sanity_everybuild(status, d):
             os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
             os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
             os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
-        except OSError:
-            bb.warn("Unable to chmod TMPDIR: %s" % tmpdir)
+        except OSError as exc:
+            bb.warn("Unable to chmod TMPDIR: %s" % exc)
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
-- 
2.5.3


