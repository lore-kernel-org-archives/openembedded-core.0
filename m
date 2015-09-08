Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4F37A76E2E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:58:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2015 03:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="764592820"
Received: from unknown (HELO marquiz.fi.intel.com) ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Sep 2015 03:58:19 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 13:58:14 +0300
Message-Id: <1441709895-1304-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1441709895-1304-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1441709895-1304-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/4] kernel.bbclass: do not mv/link sources when externalsrc enabled
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
X-List-Received-Date: Tue, 08 Sep 2015 10:58:21 -0000

If externalsrc is enabled the 'do_unpack' task is run if the recipe has
some local source files. In the case of kernel recipe this caused the
(externalsrc) source tree to be moved/symlinked. This patch prevents the
behaviour, making sure the source tree is not moved around when
externalsrc is enabled. Instead of moving the source tree,
STAGING_KERNEL_DIR will be a symlink to it.

[YOCTO #6658]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/kernel.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 919293e..dfbdfd2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -68,9 +68,13 @@ base_do_unpack_append () {
     if s != kernsrc:
         bb.utils.mkdirhier(kernsrc)
         bb.utils.remove(kernsrc, recurse=True)
-        import subprocess
-        subprocess.call(d.expand("mv ${S} ${STAGING_KERNEL_DIR}"), shell=True)
-        os.symlink(kernsrc, s)
+        if d.getVar("EXTERNALSRC", True):
+            # With EXTERNALSRC S will not be wiped so we can symlink to it
+            os.symlink(s, kernsrc)
+        else:
+            import shutil
+            shutil.move(s, kernsrc)
+            os.symlink(kernsrc, s)
 }
 
 inherit kernel-arch deploy
-- 
2.1.4


