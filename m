Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC3B60797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 19:51:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 May 2016 12:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="983907688"
Received: from bitbang.jf.intel.com ([10.7.199.60])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2016 12:51:45 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:51:40 -0700
Message-Id: <1464119500-30055-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <38494711adeba8a1d6adfcb0f9132d14d7e9962b.1464040555.git.randy.e.witt@linux.intel.com>
References: <38494711adeba8a1d6adfcb0f9132d14d7e9962b.1464040555.git.randy.e.witt@linux.intel.com>
Subject: [PATCH v2] sstate.bbclass: Don't create symlinks, download to the correct location
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
X-List-Received-Date: Tue, 24 May 2016 19:51:47 -0000

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
index 22ce1ee..6bf94b0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -623,10 +623,10 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
 
     # Try a fetch from the sstate mirror, if it fails just return and
     # we will build the package
-    uris = ['file://{0}'.format(sstatefetch),
-            'file://{0}.siginfo'.format(sstatefetch)]
+    uris = ['file://{0};downloadfilename={0}'.format(sstatefetch),
+            'file://{0}.siginfo;downloadfilename={0}.siginfo'.format(sstatefetch)]
     if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG", True), False):
-        uris += ['file://{0}.sig'.format(sstatefetch)]
+        uris += ['file://{0}.sig;downloadfilename={0}.sig'.format(sstatefetch)]
 
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


