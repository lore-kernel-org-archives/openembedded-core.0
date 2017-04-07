Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2003077D25
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 04:57:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 06 Apr 2017 21:57:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,162,1488873600"; d="scan'208";a="1132406859"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2017 21:57:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:57:18 +1200
Message-Id: <17a069a55a17282fbbad85b8b2bf1f2027b126d4.1491540566.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491540566.git.paul.eggleton@linux.intel.com>
References: <cover.1491540566.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] buildhistory-diff: operate from buildhistory directory
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
X-List-Received-Date: Fri, 07 Apr 2017 04:57:31 -0000

If the cwd is named "buildhistory" and the user hasn't specified an
alternative path on the command line, then assume that the current
directory is the buildhistory directory. This makes it easier to run
buildhistory-diff and also interact with the buildhistory git repository
as you no longer have to jump into the buildhistory directory and up to
the parent again when doing so.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/buildhistory-diff | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index d8ca12d..e03ccc5 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -46,6 +46,11 @@ def main():
         sys.exit(1)
 
     if not os.path.exists(options.buildhistory_dir):
+        if options.buildhistory_dir == 'buildhistory/':
+            cwd = os.getcwd()
+            if os.path.basename(cwd) == 'buildhistory':
+                options.buildhistory_dir = cwd
+    if not os.path.exists(options.buildhistory_dir):
         sys.stderr.write('Buildhistory directory "%s" does not exist\n\n' % options.buildhistory_dir)
         parser.print_help()
         sys.exit(1)
-- 
2.9.3


