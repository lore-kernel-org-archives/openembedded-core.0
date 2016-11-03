Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E93D971AC8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 02:54:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 02 Nov 2016 19:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,436,1473145200"; d="scan'208";a="781747460"
Received: from mdonthir-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.161])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Nov 2016 19:54:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 15:53:54 +1300
Message-Id: <2315c955872ffa33543036d655a19bc046b0754f.1478141595.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478141595.git.paul.eggleton@linux.intel.com>
References: <cover.1478141595.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478141595.git.paul.eggleton@linux.intel.com>
References: <cover.1478141595.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] lib/oe/recipeutils: print just filename in bbappend_recipe() if in temp dir
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
X-List-Received-Date: Thu, 03 Nov 2016 02:54:22 -0000

If you use devtool update-recipe with the --append option, and a "local"
(in oe-local-files) has been modified we copy it into the specified
destination layer. With the way the devtool update-recipe code works now
the source is always a temp directory, and printing paths from within
that is just confusing, so if the path starts with the temp directory
then just print the file name alone.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 58e4028..6caae5f 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -786,7 +786,11 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         for newfile, srcfile in copyfiles.items():
             filedest = os.path.join(appenddir, destsubdir, os.path.basename(srcfile))
             if os.path.abspath(newfile) != os.path.abspath(filedest):
-                bb.note('Copying %s to %s' % (newfile, filedest))
+                if newfile.startswith(tempfile.gettempdir()):
+                    newfiledisp = os.path.basename(newfile)
+                else:
+                    newfiledisp = newfile
+                bb.note('Copying %s to %s' % (newfiledisp, filedest))
                 bb.utils.mkdirhier(os.path.dirname(filedest))
                 shutil.copyfile(newfile, filedest)
 
-- 
2.5.5


