Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0AA737F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 22:03:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2015 15:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,717,1432623600"; d="scan'208";a="545661185"
Received: from yctb04.ostc.intel.com (HELO yctb04.otcr.jf.intel.com)
	([10.23.219.53])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Aug 2015 15:03:23 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 13:59:58 +0000
Message-Id: <1440079198-31036-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.3.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] utils.movefile: specify dest file name
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
X-List-Received-Date: Thu, 20 Aug 2015 22:03:36 -0000

 When moving a file via the os.rename function, it was missing the
 destination file name which caused an OSError

 [YOCTO#8180]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 bitbake/lib/bb/utils.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index 5b94432..5eec787 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -741,7 +741,9 @@ def movefile(src, dest, newmtime = None, sstat = None):
     renamefailed = 1
     if sstat[stat.ST_DEV] == dstat[stat.ST_DEV]:
         try:
-            os.rename(src, dest)
+            # os.rename needs to know the destination path with file name
+            destfile = os.path.join(dest, os.path.basename(src))
+            os.rename(src, destfile) 
             renamefailed = 0
         except Exception as e:
             if e[0] != errno.EXDEV:
-- 
2.3.0


