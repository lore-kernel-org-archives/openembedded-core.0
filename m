Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CF87277065
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 23:34:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 07 Apr 2016 16:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="780431306"
Received: from bitbang.jf.intel.com ([10.7.199.152])
	by orsmga003.jf.intel.com with ESMTP; 07 Apr 2016 16:34:58 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 16:34:51 -0700
Message-Id: <eaf0d42bebce61968c9b46dd8842a26c4ad5ca1e.1460071932.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 3/5] populate_sdk_ext.bbclass: Enable locked sigs errors
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
X-List-Received-Date: Thu, 07 Apr 2016 23:34:59 -0000

With the extensible sdk we want there to be an error if a task tries to
run without signatures that match locked-sigs.inc. This patch enables
that error.

[YOCTO #9195]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 4ad190b..d1977a7 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -209,8 +209,15 @@ python copy_buildsystem () {
             # Bypass the default connectivity check if any
             f.write('CONNECTIVITY_CHECK_URIS = ""\n\n')
 
-            # Ensure locked sstate cache objects are re-used without error
-            f.write('SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "none"\n\n')
+            # This warning will come out if reverse dependencies for a task
+            # don't have sstate as well as the task itself. We already know
+            # this will be the case for the extensible sdk, so turn off the
+            # warning.
+            f.write('SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK = "none"\n\n')
+
+            # Error if the sigs in the locked-signature file don't match
+            # the sig computed from the metadata.
+            f.write('SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "error"\n\n')
 
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n')
-- 
2.5.5


