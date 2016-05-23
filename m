Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 02CAE60667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 21:57:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 14:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,357,1459839600"; d="scan'208";a="960769646"
Received: from bitbang.jf.intel.com ([10.7.199.60])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2016 14:57:02 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 14:57:00 -0700
Message-Id: <38494711adeba8a1d6adfcb0f9132d14d7e9962b.1464040555.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464040555.git.randy.e.witt@linux.intel.com>
References: <cover.1464040555.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1464040555.git.randy.e.witt@linux.intel.com>
References: <cover.1464040555.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/1] sstate.bbclass: Don't create symlinks, download to the correct location
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
X-List-Received-Date: Mon, 23 May 2016 21:57:08 -0000

Previously the sstate was all downloaded to the same directory and then
symlinks were added in the directories that pointed to the siginfo and
sstate in the parent directory.

This change makes it so that now the files are just downloaded to the
correct location without the need for symlinks.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/sstate.bbclass | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 22ce1ee..6d5411f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -623,10 +623,10 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
 
     # Try a fetch from the sstate mirror, if it fails just return and
     # we will build the package
-    uris = ['file://{0}'.format(sstatefetch),
-            'file://{0}.siginfo'.format(sstatefetch)]
+    uris = ['file://{0};downloadfilename={1}'.format(sstatefetch, sstatefetch),
+            'file://{0}.siginfo;downloadfilename={1}.siginfo'.format(sstatefetch, sstatefetch)]
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
-        uris += ['file://{0}.sig'.format(sstatefetch)]
+        uris += ['file://{0}.sig;downloadfilename={1}.sig'.format(sstatefetch, sstatefetch)]
 
     for srcuri in uris:
         localdata.setVar('SRC_URI', srcuri)
@@ -634,12 +634,6 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
             fetcher.download()
 
-            # Need to optimise this, if using file:// urls, the fetcher just changes the local path
-            # For now work around by symlinking
-            localpath = bb.data.expand(fetcher.localpath(srcuri), localdata)
-            if localpath != sstatepkg and os.path.exists(localpath) and not os.path.exists(sstatepkg):
-                os.symlink(localpath, sstatepkg)
-
         except bb.fetch2.BBFetchException:
             break
 
-- 
2.5.5


