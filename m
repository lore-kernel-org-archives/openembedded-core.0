Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4694960557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 18:09:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 21 Aug 2015 11:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,723,1432623600"; d="scan'208";a="753028722"
Received: from yctb04.ostc.intel.com (HELO yctb04.otcr.jf.intel.com)
	([10.23.219.53])
	by orsmga001.jf.intel.com with ESMTP; 21 Aug 2015 11:09:16 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Aug 2015 10:05:46 +0000
Message-Id: <1440151546-22283-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1440079198-31036-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1440079198-31036-1-git-send-email-benjamin.esquivel@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2] bb.utils.movefile: specify dest file name
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
X-List-Received-Date: Fri, 21 Aug 2015 18:09:20 -0000

 When moving a file via the python os.rename function it is required
 to specify the path including the file name at the end.
 Failure to provide this file name at the destination argument of the
 os.rename function raises an OSError exception.

 [YOCTO#8180]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 bitbake/lib/bb/utils.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index 5b94432..5ed8e01 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -741,7 +741,11 @@ def movefile(src, dest, newmtime = None, sstat = None):
     renamefailed = 1
     if sstat[stat.ST_DEV] == dstat[stat.ST_DEV]:
         try:
-            os.rename(src, dest)
+            # os.rename needs to know the destination path with file name
+            srcfname = os.path.basename(src)
+            destfname = os.path.join(dest, srcfname) if os.path.isdir(dest) \
+                        else dest
+            os.rename(src, destfname)
             renamefailed = 0
         except Exception as e:
             if e[0] != errno.EXDEV:
-- 
2.3.0


