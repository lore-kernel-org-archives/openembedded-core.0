Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SXLgB-0001An-Ka
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 02:13:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 May 2012 17:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103547432"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 17:03:08 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 17:03:01 -0700
Message-Id: <3cdd2984697d7068273ebaa3545fa25caf806fb9.1337816265.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
References: <cover.1337816265.git.josh@linux.intel.com>
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
References: <cover.1337816265.git.josh@linux.intel.com>
Subject: [PATCH 5/7] sanity.bbclass: add extra information when SSTATE_CACHE unusable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 00:13:24 -0000

If the user does not have write permissions to SSTATE_CACHE, detected by
the check_create_long_filename() test failing with a "Permission denied"
value in strerror, then suggest they might want to use the location as
an entry in SSTATE_MIRRORS.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 39da14b..e86edf7 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -100,6 +100,9 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
     testmsg = ""
     if sstate_dir != "":
         testmsg = check_create_long_filename(sstate_dir, "SSTATE_DIR")
+        # If we don't have permissions to SSTATE_DIR, suggest the user set it as an SSTATE_MIRRORS
+        if testmsg.split(': ')[1].strip() == "Permission denied.":
+            testmsg = testmsg + "You could try using %s in SSTATE_MIRRORS rather than as an SSTATE_CACHE.\n" % (sstate_dir)
     return testmsg
 
 def check_sanity_tmpdir_change(tmpdir, data):
-- 
1.7.7.6



