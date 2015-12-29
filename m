Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD8565CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 18:29:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 29 Dec 2015 10:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,496,1444719600"; d="scan'208";a="880558960"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 29 Dec 2015 10:29:21 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Dec 2015 10:25:02 +0000
Message-Id: <70c55706eb41c5a49f72eed99e2a54b4e90f78f2.1451384414.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1451384414.git.mariano.lopez@linux.intel.com>
References: <cover.1451384414.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1451384414.git.mariano.lopez@linux.intel.com>
References: <cover.1451384414.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] rpmresolve.c: Fix unfreed pointers that keep DB opened
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
X-List-Received-Date: Tue, 29 Dec 2015 18:29:43 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

There are some unfreed rpmmi pointers in printDepList()
function; this happens when the package have null as
the requirement.

This patch fixes these unfreed pointers and add small
changes to keep consistency with some variables.

[YOCTO #8028]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
index 7f4caf9..c0b4d56 100644
--- a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
+++ b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
@@ -42,7 +42,7 @@ FILE *outf;
 int getPackageStr(rpmts ts, const char *NVRA, rpmTag tag, char **value)
 {
     int rc = -1;
-    rpmmi mi = rpmtsInitIterator(ts, RPMTAG_NVRA, NVRA, 0);
+    rpmmi mi = rpmmiInit(rpmtsGetRdb(ts), RPMTAG_NVRA, NVRA, 0);
     Header h;
     if ((h = rpmmiNext(mi)) != NULL) {
         HE_t he = (HE_t) memset(alloca(sizeof(*he)), 0, sizeof(*he));
@@ -225,7 +225,7 @@ int processPackages(rpmts *ts, int tscount, const char *packagelistfn, int ignor
 int lookupProvider(rpmts ts, const char *req, char **provider)
 {
     int rc = 0;
-    rpmmi provmi = rpmtsInitIterator(ts, RPMTAG_PROVIDENAME, req, 0);
+    rpmmi provmi = rpmmiInit(rpmtsGetRdb(ts), RPMTAG_PROVIDENAME, req, 0);
     if(provmi) {
         Header h;
         if ((h = rpmmiNext(provmi)) != NULL) {
@@ -266,7 +266,7 @@ int printDepList(rpmts *ts, int tscount)
         HE_t he = (HE_t) memset(alloca(sizeof(*he)), 0, sizeof(*he));
         int nkeys = argvCount(keys);
         for(i=0; i<nkeys; i++) {
-            rpmmi mi = rpmtsInitIterator(ts[0], RPMTAG_NVRA, keys[i], 0);
+            rpmmi mi = rpmmiInit(db, RPMTAG_NVRA, keys[i], 0);
             Header h;
             if ((h = rpmmiNext(mi)) != NULL) {
                 /* Get name of package */
@@ -280,6 +280,8 @@ int printDepList(rpmts *ts, int tscount)
                         printf("DEBUG: %s requires null\n", name);
                     }
                     rc = 0;
+                    free(name);
+                    (void)rpmmiFree(mi);
                     continue;
                 }
                 ARGV_t reqs = (ARGV_t)he->p.ptr;
@@ -412,7 +414,7 @@ int main(int argc, char **argv)
     }
 
     for(i=0; i<tscount; i++)
-        (void) rpmtsCloseDB(ts[i]);
+        (void)rpmtsFree(ts[i]);
     free(ts);
 
     if( outfile ) {
-- 
1.8.4.5


