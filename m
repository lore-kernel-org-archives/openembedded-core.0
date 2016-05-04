Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EA484731D7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2016 08:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="958806731"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2016 08:27:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id BC9A16A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:14 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:27 +0300
Message-Id: <1a650d6550f4683ed2a7ae446ff56855e7a4625e.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 14/14] wic: use next builtin instead of .next method
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
X-List-Received-Date: Wed, 04 May 2016 15:27:40 -0000

Generators in Python 3 don't have .next method. It's recommended
to use 'next' builtin instead. As it also present in Python >= 2.6
it should make wic code compatible with both Python 2 and Python 3.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 2 +-
 scripts/lib/wic/msger.py   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 2778be5..f3240ba 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -482,7 +482,7 @@ class FilemapFiemap(_FilemapBase):
         self._log.debug("FilemapFiemap: get_mapped_ranges(%d,  %d(%d))"
                         % (start, count, start + count - 1))
         iterator = self._do_get_mapped_ranges(start, count)
-        first_prev, last_prev = iterator.next()
+        first_prev, last_prev = next(iterator)
 
         for first, last in iterator:
             if last_prev == first - 1:
diff --git a/scripts/lib/wic/msger.py b/scripts/lib/wic/msger.py
index 4d8e704..fb8336d 100644
--- a/scripts/lib/wic/msger.py
+++ b/scripts/lib/wic/msger.py
@@ -148,7 +148,7 @@ def _split_msg(head, msg):
     return head, msg
 
 def get_loglevel():
-    return (k for k, v in LOG_LEVELS.items() if v == LOG_LEVEL).next()
+    return next((k for k, v in LOG_LEVELS.items() if v == LOG_LEVEL))
 
 def set_loglevel(level):
     global LOG_LEVEL
-- 
2.1.4


