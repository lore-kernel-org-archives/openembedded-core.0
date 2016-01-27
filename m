Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 276D677116
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 09:35:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R9ZWSe010250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 01:35:33 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 01:35:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jan 2016 01:35:26 -0800
Message-ID: <bc534f3a7ff03c8ff97e9d3af79854b57d6bf0e4.1453877220.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1453877220.git.liezhi.yang@windriver.com>
References: <cover.1453877220.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] rpmresolve.c: Fix unfreed pointers that keep DB opened
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
X-List-Received-Date: Wed, 27 Jan 2016 09:35:32 -0000
Content-Type: text/plain

From: Mariano Lopez <mariano.lopez@linux.intel.com>

There are some unfreed rpmmi pointers in printDepList()
function; this happens when the package have null as
the requirement.

This patch fixes these unfreed pointers and add small
changes to keep consistency with some variables.

[YOCTO #8028]

(From OE-Core master rev: da7aa183f94adc1d0fff5bb81e827c584f9938ec)

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |   10 ++++++----
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
1.7.9.5


