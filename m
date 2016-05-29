Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9FE731D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2016 22:21:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 May 2016 15:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,386,1459839600"; d="scan'208";a="976886748"
Received: from jialelim-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.83])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2016 15:21:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 10:21:01 +1200
Message-Id: <bc34623687dfbf932402c899e044d867113b7138.1464560316.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] recipetool: create: use ${BP} for subdir for binary packages
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
X-List-Received-Date: Sun, 29 May 2016 22:21:42 -0000

If we use ${BP} for the subdirectory, the default value of S will work
rather than having to have an ugly value derived from the package
file name in both places. This does mean that we have to assume the
default though (we can't just let the normal logic work because the
value of BP is the default until later on, so the replacement doesn't
work).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ad26189..1899a0d 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -359,7 +359,7 @@ def create_recipe(args):
         if args.binary:
             # Assume the archive contains the directory structure verbatim
             # so we need to extract to a subdirectory
-            fetchuri += ';subdir=%s' % os.path.splitext(os.path.basename(urlparse.urlsplit(fetchuri).path))[0]
+            fetchuri += ';subdir=${BP}'
         srcuri = fetchuri
         rev_re = re.compile(';rev=([^;]+)')
         res = rev_re.search(srcuri)
@@ -566,7 +566,9 @@ def create_recipe(args):
         lines_before.append('SRCREV = "%s"' % srcrev)
     lines_before.append('')
 
-    if srcsubdir:
+    if srcsubdir and not args.binary:
+        # (for binary packages we explicitly specify subdir= when fetching to
+        # match the default value of S, so we don't need to set it in that case)
         lines_before.append('S = "${WORKDIR}/%s"' % srcsubdir)
         lines_before.append('')
 
-- 
2.5.5


