Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 99EC473D7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:19:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 09:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,632,1422950400"; d="scan'208";a="484753724"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 09:18:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:18:31 +0100
Message-Id: <3938ad3d2acd2fb881b330d076e0815dc6df1f34.1429805738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/8] devtool: reset: avoid errors in case file no longer exists
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
X-List-Received-Date: Thu, 23 Apr 2015 16:19:12 -0000

If you manually delete files in the workspace layer (which you really
shouldn't) it was possible to get yourself into the situation where you
couldn't reset because we were attempting to check if the file had been
modified and erroring out if it couldn't be opened. If the file's not
there anymore there's not much point checking if it needs to be
preserved, just skip it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8fa9e6f..9d13db5 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -328,7 +328,14 @@ def _check_preserve(config, recipename):
                 splitline = line.rstrip().split('|')
                 if splitline[0] == recipename:
                     removefile = os.path.join(config.workspace_path, splitline[1])
-                    md5 = bb.utils.md5_file(removefile)
+                    try:
+                        md5 = bb.utils.md5_file(removefile)
+                    except IOError as err:
+                        if err.errno == 2:
+                            # File no longer exists, skip it
+                            continue
+                        else:
+                            raise
                     if splitline[2] != md5:
                         bb.utils.mkdirhier(preservepath)
                         preservefile = os.path.basename(removefile)
-- 
2.1.0


