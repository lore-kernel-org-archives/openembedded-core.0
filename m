Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B9CEA6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 19:29:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2015 12:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,482,1432623600"; d="scan'208";a="524905749"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2015 12:29:29 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2015 11:21:51 +0000
Message-Id: <1436959311-45777-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] sanity.bbclass: Remove check if /tmp is writable
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
X-List-Received-Date: Wed, 15 Jul 2015 19:29:36 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The check would be managed using BB_DISKMON_DIRS so this
removes the check from the sanity class.

[YOCTO #8000]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/sanity.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7a580da..2855941 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -704,19 +704,6 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
-    # Check if /tmp is writable
-    from string import ascii_letters
-    from random import choice
-    filename = "bb_writetest.%s" % os.getpid()
-    testfile = os.path.join("/tmp", filename)
-    try:
-        f = open(testfile, "w")
-        f.write("".join(choice(ascii_letters) for x in range(1024)))
-        f.close()
-        os.remove(testfile)
-    except:
-        status.addresult("Failed to write into /tmp. Please verify your filesystem.")
-
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
     distro = d.getVar('DISTRO', True)
-- 
1.8.4.5


