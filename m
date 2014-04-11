Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E392765DDE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 16:40:38 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Apr 2014 09:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,842,1389772800"; d="scan'208";a="417873051"
Received: from pmeel-ivm.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.171])
	by azsmga001.ch.intel.com with ESMTP; 11 Apr 2014 09:40:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2014 17:40:32 +0100
Message-Id: <b0b7b081006b8cbac0aebff5af7bb88d7a4088c9.1397234393.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1397234393.git.paul.eggleton@linux.intel.com>
References: <cover.1397234393.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1397234393.git.paul.eggleton@linux.intel.com>
References: <cover.1397234393.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] toaster.bbclass: do not fail on non-existent files
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
X-List-Received-Date: Fri, 11 Apr 2014 16:40:39 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Toaster may look up inexistent file paths in the build history
for packages that have been referenced but not built.

This triggers a failure, and this patch recovers by deleting
the reference to the non-built packages.

[YOCTO #6063]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/toaster.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index cab5966..15cfbd8 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -273,7 +273,15 @@ python toaster_buildhistory_dump() {
 
             for pname in images[target]:
                 if not pname in allpkgs:
-                    allpkgs[pname] = _toaster_load_pkgdatafile("%s/runtime-reverse/" % pkgdata_dir, pname)
+                    try:
+                        pkgdata = _toaster_load_pkgdatafile("%s/runtime-reverse/" % pkgdata_dir, pname)
+                    except IOError as err:
+                        if err.errno == 2:
+                            # We expect this e.g. for RRECOMMENDS that are unsatisfied at runtime
+                            continue
+                        else:
+                            raise
+                    allpkgs[pname] = pkgdata
 
 
     data = { 'pkgdata' : allpkgs, 'imgdata' : images }
-- 
1.9.0


