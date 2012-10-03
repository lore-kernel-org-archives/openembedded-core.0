Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJOP6-0000ED-S1
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:50:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Oct 2012 05:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="219071516"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.52])
	by orsmga002.jf.intel.com with ESMTP; 03 Oct 2012 05:37:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 13:37:16 +0100
Message-Id: <fff585d226978ede378b506d85b296ea2b5abeb4.1349267792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349267792.git.paul.eggleton@linux.intel.com>
References: <cover.1349267792.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349267792.git.paul.eggleton@linux.intel.com>
References: <cover.1349267792.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] rpmresolve: fix reporting of multiple matches error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 12:50:21 -0000

We were mistakenly writing what was meant to go to stderr into the
output file, so when the "Multiple matches" error showed we weren't
actually seeing the matches printed.

Also change the wording of the "Unable to find package..." to "Unable
to resolve package..." instead so that it makes more sense if it is
printed after the "Multiple matches" error.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |    6 +++---
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb       |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
index 3613ee5..4e9d055 100644
--- a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
+++ b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
@@ -185,7 +185,7 @@ int processPackages(rpmts *ts, int tscount, const char *packagelistfn, int ignor
                                 char *value = NULL;
                                 rc = getPackageStr(ts[i], keys[keyindex], RPMTAG_PACKAGEORIGIN, &value);
                                 if(rc == 0)
-                                    fprintf(outf, "  %s\n", value);
+                                    fprintf(stderr, "  %s\n", value);
                                 else
                                     fprintf(stderr, "  (%s)\n", keys[keyindex]);
                             }
@@ -197,10 +197,10 @@ int processPackages(rpmts *ts, int tscount, const char *packagelistfn, int ignor
 
                 if( !found ) {
                     if( ignoremissing ) {
-                        fprintf(stderr, "unable to find package %s - ignoring\n", line);
+                        fprintf(stderr, "Unable to resolve package %s - ignoring\n", line);
                     }
                     else {
-                        fprintf(stderr, "unable to find package %s\n", line);
+                        fprintf(stderr, "Unable to resolve package %s\n", line);
                         missing = 1;
                     }
                 }
diff --git a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
index 3ce4369..ea542e1 100644
--- a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
+++ b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "OpenEmbedded RPM resolver - performs RPM database lookups in batc
 DEPENDS = "rpm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "file://rpmresolve.c"
 
-- 
1.7.9.5



