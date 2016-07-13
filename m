Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBA26067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 23:30:16 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r190so1496958wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 16:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=FuexTPcuSwwukA1vCU/+8A3rV9magAESprFyTPczTbA=;
	b=xkgj8ik7jJf7+LaAU7iOvi4726htLgwRAPetVBbfy0WACWyrOppTPfOB5MtTSqVyd/
	yHgP4LRO2UVJiLXP8O4LVAWsZvJkgYJFTOS3tIOcKT3KIXv1KpShNxIeTdgKN/Qo6Nj7
	ptnxiGiW3Dp3qwC5FyCicSUUmTeBK+Xr7XGPVPsga+sMabefeXKFF7WywImtcDGSeTe4
	Ua+O7UwHrU+3e9jjPAj26Xf/3KFPTswroAFsfG5ARvi879nUTuFHWx4PQDPy2ubzf/nq
	xaXccZnd5Zf0XgQ0sRXJrYHYNIp3Ru56yL1wwz7VIH+BL7ZhyNuL8AOr5s6hbeVlEjGQ
	5qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FuexTPcuSwwukA1vCU/+8A3rV9magAESprFyTPczTbA=;
	b=GIYJ9uRoH+2OJwdvLlIy+C287DSBngyTcuTnAlzD0MA3JF0wx4eGH8p0hyisY8zaML
	+WJ1CseKIgmELpYXXDwfqHmoWa6GEllnnHZGp+pdR4iWGkeCwuYA6CEPWM3bISsgGjJT
	z6annC1MnDult67ssRx+7rmw0RKNona7XAozKCSqcJE2rXoAwnjasuTOoF1iA0tYm+yS
	ktYZWptmrR8pVGotAOocFLJ8aa0/gcZG3k3duIlZi/sLxLbsK/edjnZgBD1k4yTaH/Ua
	QXAvqW/MfKkms7VM5FCRiHYt/ZZ9HYPmezC1V7txVoacqlT3fusbwv6S75REq39GaDL0
	RfSQ==
X-Gm-Message-State: ALyK8tJl2g4pNpvNR3KVHI13VBvn19Wv0KwlE94hWivhLYga4i02qOqG6zVkeIF9pqWX5fse
X-Received: by 10.194.247.39 with SMTP id yb7mr3381858wjc.114.1468452616774;
	Wed, 13 Jul 2016 16:30:16 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	d64sm3097921wmc.22.2016.07.13.16.30.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jul 2016 16:30:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 00:30:09 +0100
Message-Id: <1468452609-23296-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][dizzy] rpmresolve.c: Fix unfreed pointers that keep DB opened
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
X-List-Received-Date: Wed, 13 Jul 2016 23:30:19 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

There are some unfreed rpmmi pointers in printDepList()
function; this happens when the package have null as
the requirement.

This patch fixes these unfreed pointers and add small
changes to keep consistency with some variables.

[YOCTO #8028]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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
2.8.1


