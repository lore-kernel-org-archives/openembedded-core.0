Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7D38977DB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:17:49 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 08:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,280,1493708400"; d="scan'208";a="109702195"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2017 08:17:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 18:15:59 +0300
Message-Id: <626ecb5d88f08650f626d7d798cb9c3e71a2a5ee.1496329361.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Thu, 01 Jun 2017 15:17:51 -0000

This greatly reduces build times when there is a large amount of small
rpm packages to produce. The patches are rather invasive,
and so will be submitted upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...y-package-building-into-a-separate-functi.patch |  83 ++++++++
 ...-binary-package-creation-via-thread-pools.patch | 137 +++++++++++++
 ...c-make-operations-over-string-pools-threa.patch | 209 +++++++++++++++++++
 ...c-remove-static-local-variables-from-buil.patch | 227 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |   4 +
 5 files changed, 660 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch b/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
new file mode 100644
index 00000000000..b21c5119041
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
@@ -0,0 +1,83 @@
+From b841b699e519438a66b661247c94efff63d0700e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 25 May 2017 18:15:27 +0300
+Subject: [PATCH 01/14] Split binary package building into a separate function
+
+So that it can be run as a thread pool task.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ build/pack.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/build/pack.c b/build/pack.c
+index 497300b96..891e6bdc3 100644
+--- a/build/pack.c
++++ b/build/pack.c
+@@ -546,18 +546,13 @@ static rpmRC checkPackages(char *pkgcheck)
+     return RPMRC_OK;
+ }
+ 
+-rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
++static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename)
+ {
+-    rpmRC rc;
+-    const char *errorString;
+-    Package pkg;
+-    char *pkglist = NULL;
+-
+-    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
+-	char *fn;
++        const char *errorString;
++        rpmRC rc = RPMRC_OK;
+ 
+ 	if (pkg->fileList == NULL)
+-	    continue;
++	    return rc;
+ 
+ 	if ((rc = processScriptFiles(spec, pkg)))
+ 	    return rc;
+@@ -591,7 +586,7 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
+ 		     headerGetString(pkg->header, RPMTAG_NAME), errorString);
+ 		return RPMRC_FAIL;
+ 	    }
+-	    fn = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
++	    *filename = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
+ 	    if ((binDir = strchr(binRpm, '/')) != NULL) {
+ 		struct stat st;
+ 		char *dn;
+@@ -613,14 +608,28 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
+ 	    free(binRpm);
+ 	}
+ 
+-	rc = writeRPM(pkg, NULL, fn, NULL);
++	rc = writeRPM(pkg, NULL, *filename, NULL);
+ 	if (rc == RPMRC_OK) {
+ 	    /* Do check each written package if enabled */
+-	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", fn, NULL);
++	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
+ 	    if (pkgcheck[0] != ' ') {
+ 		rc = checkPackages(pkgcheck);
+ 	    }
+ 	    free(pkgcheck);
++	}
++        return rc;
++}
++
++rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
++{
++    rpmRC rc;
++    Package pkg;
++    char *pkglist = NULL;
++
++    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
++	char *fn = NULL;
++        rc = packageBinary(spec, pkg, cookie, cheating, &fn);
++	if (rc == RPMRC_OK) {
+ 	    rstrcat(&pkglist, fn);
+ 	    rstrcat(&pkglist, " ");
+ 	}
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch b/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
new file mode 100644
index 00000000000..2987a979698
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
@@ -0,0 +1,137 @@
+From 45d92254cea0bceff38c42cbad89b301a0c07cea Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 25 May 2017 19:30:20 +0300
+Subject: [PATCH 02/14] Run binary package creation via thread pools.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ build/pack.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 86 insertions(+), 14 deletions(-)
+
+diff --git a/build/pack.c b/build/pack.c
+index 891e6bdc3..de2566d47 100644
+--- a/build/pack.c
++++ b/build/pack.c
+@@ -14,6 +14,8 @@
+ #include <rpm/rpmfileutil.h>
+ #include <rpm/rpmlog.h>
+ 
++#include <prtpool.h>			/* NSPR thread pools */
++
+ #include "rpmio/rpmio_internal.h"	/* fdInitDigest, fdFiniDigest */
+ #include "lib/fsm.h"
+ #include "lib/signature.h"
+@@ -620,25 +622,95 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
+         return rc;
+ }
+ 
+-rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
++struct binaryPackageTaskData
+ {
+-    rpmRC rc;
++    rpmSpec spec;
+     Package pkg;
++    const char *cookie;
++    int cheating;
++    char *filename;
++    PRJob *job;
++    rpmRC result;
++    PRStatus status;
++    struct binaryPackageTaskData *next;
++};
++
++static void runBinaryPackageTask(void* taskdata)
++{
++    struct binaryPackageTaskData *task = taskdata;
++    task->result = packageBinary(task->spec, task->pkg, task->cookie, task->cheating, &(task->filename));
++}
++
++static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating)
++{
++    struct binaryPackageTaskData *tasks = NULL;
++    struct binaryPackageTaskData *task = NULL;
++    struct binaryPackageTaskData *prev = NULL;
++    PRThreadPool *pool = PR_CreateThreadPool(4, sysconf(_SC_NPROCESSORS_ONLN), 0);
++
++    for (Package pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
++        task = rcalloc(1, sizeof(*task));
++        task->spec = spec;
++        task->pkg = pkg;
++        task->cookie = cookie;
++        task->cheating = cheating;
++        if (pkg == spec->packages) {
++            // the first package needs to be processed ahead of others, as they copy
++            // changelog data from it, and so otherwise data races would happen
++            task->job = PR_QueueJob(pool, runBinaryPackageTask, task, PR_TRUE);
++            task->status = PR_JoinJob(task->job);
++            rpmlog(RPMLOG_NOTICE, _("Joined binary package job, status %d, result %d, filename %s\n"), task->status, task->result, task->filename);
++            tasks = task;
++        }
++        if (prev != NULL) {
++            prev->next = task;
++        }
++        prev = task;
++    }
++
++    for (task = tasks; task != NULL; task = task->next) {
++        if (task != tasks) {
++            task->job = PR_QueueJob(pool, runBinaryPackageTask, task, PR_TRUE);
++        }
++    }
++
++    for (task = tasks; task != NULL; task = task->next) {
++        if (task != tasks) {
++            task->status = PR_JoinJob(task->job);
++            rpmlog(RPMLOG_NOTICE, _("Joined binary package job, status %d, result %d, filename %s\n"), task->status, task->result, task->filename);
++        }
++    }
++    PR_ShutdownThreadPool(pool);
++    return tasks;
++}
++
++static void freeBinaryPackageTasks(struct binaryPackageTaskData* tasks)
++{
++    while (tasks != NULL) {
++        struct binaryPackageTaskData* next = tasks->next;
++        rfree(tasks->filename);
++        rfree(tasks);
++        tasks = next;
++    }
++}
++
++rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
++{
+     char *pkglist = NULL;
+ 
+-    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
+-	char *fn = NULL;
+-        rc = packageBinary(spec, pkg, cookie, cheating, &fn);
+-	if (rc == RPMRC_OK) {
+-	    rstrcat(&pkglist, fn);
+-	    rstrcat(&pkglist, " ");
+-	}
+-	free(fn);
+-	if (rc != RPMRC_OK) {
+-	    pkglist = _free(pkglist);
+-	    return rc;
+-	}
++    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating);
++
++    for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
++        if (task->status == PR_SUCCESS && task->result == RPMRC_OK) {
++            rstrcat(&pkglist, task->filename);
++            rstrcat(&pkglist, " ");
++        } else {
++            _free(pkglist);
++            freeBinaryPackageTasks(tasks);
++            return RPMRC_FAIL;
++        }
+     }
++    freeBinaryPackageTasks(tasks);
+ 
+     /* Now check the package set if enabled */
+     if (pkglist != NULL) {
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch b/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
new file mode 100644
index 00000000000..acda55d4ea7
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
@@ -0,0 +1,209 @@
+From ed152aefce31aceb09bb606ca398bc396461fb49 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 30 May 2017 13:58:30 +0300
+Subject: [PATCH 03/14] rpmstrpool.c: make operations over string pools
+ thread-safe
+
+Otherwise multithreaded rpm building explodes in various ways due
+to data races.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ rpmio/rpmstrpool.c | 51 +++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 41 insertions(+), 10 deletions(-)
+
+diff --git a/rpmio/rpmstrpool.c b/rpmio/rpmstrpool.c
+index 30a57eb10..d85f5c3a4 100644
+--- a/rpmio/rpmstrpool.c
++++ b/rpmio/rpmstrpool.c
+@@ -3,6 +3,7 @@
+ #include <stdlib.h>
+ #include <rpm/rpmstring.h>
+ #include <rpm/rpmstrpool.h>
++#include <prlock.h>
+ #include "debug.h"
+ 
+ #define STRDATA_CHUNKS 1024
+@@ -39,7 +40,8 @@ struct rpmstrPool_s {
+ 
+     poolHash hash;		/* string -> sid hash table */
+     int frozen;			/* are new id additions allowed? */
+-    int nrefs;			/* refcount */
++    _Atomic int nrefs;			/* refcount */
++    PRLock* lock;
+ };
+ 
+ /* calculate hash and string length on at once */
+@@ -113,6 +115,8 @@ static poolHash poolHashCreate(int numBuckets)
+     return ht;
+ }
+ 
++static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid sid);
++
+ static void poolHashResize(rpmstrPool pool, int numBuckets)
+ {
+     poolHash ht = pool->hash;
+@@ -120,7 +124,7 @@ static void poolHashResize(rpmstrPool pool, int numBuckets)
+ 
+     for (int i=0; i<ht->numBuckets; i++) {
+         if (!ht->buckets[i].keyid) continue;
+-        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool, ht->buckets[i].keyid));
++        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool, ht->buckets[i].keyid));
+         for (unsigned int j=0;;j++) {
+             unsigned int hash = hashbucket(keyHash, j) % numBuckets;
+             if (!buckets[hash].keyid) {
+@@ -149,7 +153,7 @@ static void poolHashAddHEntry(rpmstrPool pool, const char * key, unsigned int ke
+             ht->buckets[hash].keyid = keyid;
+             ht->keyCount++;
+             break;
+-        } else if (!strcmp(rpmstrPoolStr(pool, ht->buckets[hash].keyid), key)) {
++        } else if (!strcmp(rpmstrPoolStrNoLock(pool, ht->buckets[hash].keyid), key)) {
+             return;
+         }
+     }
+@@ -191,7 +195,7 @@ static void poolHashPrintStats(rpmstrPool pool)
+     int maxcollisions = 0;
+ 
+     for (i=0; i<ht->numBuckets; i++) {
+-        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool, ht->buckets[i].keyid));
++        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool, ht->buckets[i].keyid));
+         for (unsigned int j=0;;j++) {
+             unsigned int hash = hashbucket(keyHash, i) % ht->numBuckets;
+             if (hash==i) {
+@@ -221,7 +225,7 @@ static void rpmstrPoolRehash(rpmstrPool pool)
+ 
+     pool->hash = poolHashCreate(sizehint);
+     for (int i = 1; i <= pool->offs_size; i++)
+-	poolHashAddEntry(pool, rpmstrPoolStr(pool, i), i);
++	poolHashAddEntry(pool, rpmstrPoolStrNoLock(pool, i), i);
+ }
+ 
+ rpmstrPool rpmstrPoolCreate(void)
+@@ -240,6 +244,7 @@ rpmstrPool rpmstrPoolCreate(void)
+ 
+     rpmstrPoolRehash(pool);
+     pool->nrefs = 1;
++    pool->lock = PR_NewLock();
+     return pool;
+ }
+ 
+@@ -257,6 +262,7 @@ rpmstrPool rpmstrPoolFree(rpmstrPool pool)
+ 		pool->chunks[i] = _free(pool->chunks[i]);
+ 	    }
+ 	    free(pool->chunks);
++            PR_DestroyLock(pool->lock);
+ 	    free(pool);
+ 	}
+     }
+@@ -272,6 +278,8 @@ rpmstrPool rpmstrPoolLink(rpmstrPool pool)
+ 
+ void rpmstrPoolFreeze(rpmstrPool pool, int keephash)
+ {
++    if (pool)
++        PR_Lock(pool->lock);
+     if (pool && !pool->frozen) {
+ 	if (!keephash) {
+ 	    pool->hash = poolHashFree(pool->hash);
+@@ -281,15 +289,19 @@ void rpmstrPoolFreeze(rpmstrPool pool, int keephash)
+ 			      pool->offs_alloced * sizeof(*pool->offs));
+ 	pool->frozen = 1;
+     }
++    if (pool)
++        PR_Unlock(pool->lock);
+ }
+ 
+ void rpmstrPoolUnfreeze(rpmstrPool pool)
+ {
+     if (pool) {
++        PR_Lock(pool->lock);
+ 	if (pool->hash == NULL) {
+ 	    rpmstrPoolRehash(pool);
+ 	}
+ 	pool->frozen = 0;
++        PR_Unlock(pool->lock);
+     }
+ }
+ 
+@@ -350,7 +362,7 @@ static rpmsid rpmstrPoolGet(rpmstrPool pool, const char * key, size_t keylen,
+             return 0;
+         }
+ 
+-	s = rpmstrPoolStr(pool, ht->buckets[hash].keyid);
++	s = rpmstrPoolStrNoLock(pool, ht->buckets[hash].keyid);
+ 	/* pool string could be longer than keylen, require exact matche */
+ 	if (strncmp(s, key, keylen) == 0 && s[keylen] == '\0')
+ 	    return ht->buckets[hash].keyid;
+@@ -373,27 +385,29 @@ static inline rpmsid strn2id(rpmstrPool pool, const char *s, size_t slen,
+ rpmsid rpmstrPoolIdn(rpmstrPool pool, const char *s, size_t slen, int create)
+ {
+     rpmsid sid = 0;
+-
++    PR_Lock(pool->lock);
+     if (s != NULL) {
+ 	unsigned int hash = rstrnhash(s, slen);
+ 	sid = strn2id(pool, s, slen, hash, create);
+     }
++    PR_Unlock(pool->lock);
+     return sid;
+ }
+ 
+ rpmsid rpmstrPoolId(rpmstrPool pool, const char *s, int create)
+ {
+     rpmsid sid = 0;
+-
++    PR_Lock(pool->lock);
+     if (s != NULL) {
+ 	size_t slen;
+ 	unsigned int hash = rstrlenhash(s, &slen);
+ 	sid = strn2id(pool, s, slen, hash, create);
+     }
++    PR_Unlock(pool->lock);
+     return sid;
+ }
+ 
+-const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
++static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid sid)
+ {
+     const char *s = NULL;
+     if (pool && sid > 0 && sid <= pool->offs_size)
+@@ -401,12 +415,23 @@ const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
+     return s;
+ }
+ 
++const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
++{
++    const char *s = NULL;
++    PR_Lock(pool->lock);
++    s = rpmstrPoolStrNoLock(pool, sid);
++    PR_Unlock(pool->lock);
++    return s;
++}
++
+ size_t rpmstrPoolStrlen(rpmstrPool pool, rpmsid sid)
+ {
+     size_t slen = 0;
++    PR_Lock(pool->lock);
+     if (pool && sid > 0 && sid <= pool->offs_size) {
+ 	slen = strlen(pool->offs[sid]);
+     }
++    PR_Unlock(pool->lock);
+     return slen;
+ }
+ 
+@@ -421,5 +446,11 @@ int rpmstrPoolStreq(rpmstrPool poolA, rpmsid sidA,
+ 
+ rpmsid rpmstrPoolNumStr(rpmstrPool pool)
+ {
+-    return (pool != NULL) ? pool->offs_size : 0;
++    rpmsid id = 0;
++    if (pool) {
++        PR_Lock(pool->lock);
++	id = pool->offs_size;
++        PR_Unlock(pool->lock);
++    }
++    return id;
+ }
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
new file mode 100644
index 00000000000..35319b82195
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
@@ -0,0 +1,227 @@
+From 394ab23f7962946bba5351a202869cba71f412eb Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 1 Jun 2017 16:27:57 +0300
+Subject: [PATCH 04/14] build/pack.c: remove static local variables from
+ buildHost() and getBuildTime()
+
+Their use is causing difficult to diagnoze data races when building multiple
+packages in parallel, and is a bad idea in general, as it also makes it more
+difficult to reason about code.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ build/pack.c | 94 +++++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 49 insertions(+), 45 deletions(-)
+
+diff --git a/build/pack.c b/build/pack.c
+index de2566d47..b6a1f7c62 100644
+--- a/build/pack.c
++++ b/build/pack.c
+@@ -153,54 +153,47 @@ exit:
+     return rc;
+ }
+ 
+-static rpm_time_t * getBuildTime(void)
++static rpm_time_t getBuildTime(void)
+ {
+-    static rpm_time_t buildTime[1];
++    rpm_time_t buildTime = 0;
+     char *srcdate;
+     time_t epoch;
+     char *endptr;
+ 
+-    if (buildTime[0] == 0) {
+-        srcdate = getenv("SOURCE_DATE_EPOCH");
+-        if (srcdate) {
+-            errno = 0;
+-            epoch = strtol(srcdate, &endptr, 10);
+-            if (srcdate == endptr || *endptr || errno != 0)
+-                rpmlog(RPMLOG_ERR, _("unable to parse SOURCE_DATE_EPOCH\n"));
+-            else
+-                buildTime[0] = (int32_t) epoch;
+-        } else
+-            buildTime[0] = (int32_t) time(NULL);
+-    }
++    srcdate = getenv("SOURCE_DATE_EPOCH");
++    if (srcdate) {
++        errno = 0;
++        epoch = strtol(srcdate, &endptr, 10);
++        if (srcdate == endptr || *endptr || errno != 0)
++            rpmlog(RPMLOG_ERR, _("unable to parse SOURCE_DATE_EPOCH\n"));
++        else
++            buildTime = (int32_t) epoch;
++    } else
++        buildTime = (int32_t) time(NULL);
+ 
+     return buildTime;
+ }
+ 
+-static const char * buildHost(void)
++static char * buildHost(void)
+ {
+-    static char hostname[1024];
+-    static int oneshot = 0;
++    char* hostname;
+     struct hostent *hbn;
+     char *bhMacro;
+ 
+-    if (! oneshot) {
+-        bhMacro = rpmExpand("%{?_buildhost}", NULL);
+-        if (strcmp(bhMacro, "") != 0 && strlen(bhMacro) < 1024) {
+-            strcpy(hostname, bhMacro);
+-        } else {
+-            if (strcmp(bhMacro, "") != 0)
+-                rpmlog(RPMLOG_WARNING, _("The _buildhost macro is too long\n"));
+-            (void) gethostname(hostname, sizeof(hostname));
+-            hbn = gethostbyname(hostname);
+-            if (hbn)
+-                strcpy(hostname, hbn->h_name);
+-            else
+-                rpmlog(RPMLOG_WARNING,
+-                        _("Could not canonicalize hostname: %s\n"), hostname);
+-        }
+-        free(bhMacro);
+-        oneshot = 1;
+-    }
++    bhMacro = rpmExpand("%{?_buildhost}", NULL);
++    if (strcmp(bhMacro, "") != 0) {
++        rasprintf(&hostname, "%s", bhMacro);
++    } else {
++        hostname = rcalloc(1024, sizeof(*hostname));
++        (void) gethostname(hostname, 1024);
++        hbn = gethostbyname(hostname);
++        if (hbn)
++            strcpy(hostname, hbn->h_name);
++        else
++            rpmlog(RPMLOG_WARNING,
++                    _("Could not canonicalize hostname: %s\n"), hostname);
++    }
++    free(bhMacro);
+     return(hostname);
+ }
+ 
+@@ -310,7 +303,8 @@ static int haveRichDep(Package pkg)
+ }
+ 
+ static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
+-		      const char *fileName, char **cookie)
++		      const char *fileName, char **cookie,
++		      rpm_time_t buildTime, const char* buildHost)
+ {
+     FD_t fd = NULL;
+     char * rpmio_flags = NULL;
+@@ -399,7 +393,7 @@ static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
+ 
+     /* Create and add the cookie */
+     if (cookie) {
+-	rasprintf(cookie, "%s %d", buildHost(), (int) (*getBuildTime()));
++	rasprintf(cookie, "%s %d", buildHost, buildTime);
+ 	headerPutString(pkg->header, RPMTAG_COOKIE, *cookie);
+     }
+     
+@@ -548,7 +542,7 @@ static rpmRC checkPackages(char *pkgcheck)
+     return RPMRC_OK;
+ }
+ 
+-static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename)
++static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename, rpm_time_t buildTime, const char* buildHost)
+ {
+         const char *errorString;
+         rpmRC rc = RPMRC_OK;
+@@ -567,8 +561,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
+ 	headerCopyTags(spec->packages->header, pkg->header, copyTags);
+ 	
+ 	headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
+-	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost());
+-	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
++	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost);
++	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
+ 
+ 	if (spec->sourcePkgId != NULL) {
+ 	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
+@@ -610,7 +604,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
+ 	    free(binRpm);
+ 	}
+ 
+-	rc = writeRPM(pkg, NULL, *filename, NULL);
++	rc = writeRPM(pkg, NULL, *filename, NULL, buildTime, buildHost);
+ 	if (rc == RPMRC_OK) {
+ 	    /* Do check each written package if enabled */
+ 	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
+@@ -629,6 +623,8 @@ struct binaryPackageTaskData
+     const char *cookie;
+     int cheating;
+     char *filename;
++    rpm_time_t buildTime;
++    const char *buildHost;
+     PRJob *job;
+     rpmRC result;
+     PRStatus status;
+@@ -638,7 +634,7 @@ struct binaryPackageTaskData
+ static void runBinaryPackageTask(void* taskdata)
+ {
+     struct binaryPackageTaskData *task = taskdata;
+-    task->result = packageBinary(task->spec, task->pkg, task->cookie, task->cheating, &(task->filename));
++    task->result = packageBinary(task->spec, task->pkg, task->cookie, task->cheating, &(task->filename), task->buildTime, task->buildHost);
+ }
+ 
+ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating)
+@@ -647,6 +643,8 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
+     struct binaryPackageTaskData *task = NULL;
+     struct binaryPackageTaskData *prev = NULL;
+     PRThreadPool *pool = PR_CreateThreadPool(4, sysconf(_SC_NPROCESSORS_ONLN), 0);
++    rpm_time_t buildTime = getBuildTime();
++    char *host = buildHost();
+ 
+     for (Package pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
+         task = rcalloc(1, sizeof(*task));
+@@ -654,6 +652,8 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
+         task->pkg = pkg;
+         task->cookie = cookie;
+         task->cheating = cheating;
++        task->buildTime = buildTime;
++        task->buildHost = host;
+         if (pkg == spec->packages) {
+             // the first package needs to be processed ahead of others, as they copy
+             // changelog data from it, and so otherwise data races would happen
+@@ -681,6 +681,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
+         }
+     }
+     PR_ShutdownThreadPool(pool);
++    free(host);
+     return tasks;
+ }
+ 
+@@ -731,16 +732,18 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
+     rpmRC rc;
+ 
+     /* Add some cruft */
++    rpm_time_t buildTime = getBuildTime();
++    char* host = buildHost();
+     headerPutString(sourcePkg->header, RPMTAG_RPMVERSION, VERSION);
+-    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost());
+-    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
++    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, (const char*)buildHost);
++    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
+ 
+     /* XXX this should be %_srpmdir */
+     {	char *fn = rpmGetPath("%{_srcrpmdir}/", spec->sourceRpmName,NULL);
+ 	char *pkgcheck = rpmExpand("%{?_build_pkgcheck_srpm} ", fn, NULL);
+ 
+ 	spec->sourcePkgId = NULL;
+-	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie);
++	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie, buildTime, host);
+ 
+ 	/* Do check SRPM package if enabled */
+ 	if (rc == RPMRC_OK && pkgcheck[0] != ' ') {
+@@ -750,5 +753,6 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
+ 	free(pkgcheck);
+ 	free(fn);
+     }
++    free(host);
+     return rc;
+ }
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 2310ee6b09e..b95b4719c19 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -35,6 +35,10 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0001-Fix-build-with-musl-C-library.patch \
            file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
            file://0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch \
+           file://0001-Split-binary-package-building-into-a-separate-functi.patch \
+           file://0002-Run-binary-package-creation-via-thread-pools.patch \
+           file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
+           file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
            "
 
 PV = "4.13.90+git${SRCPV}"
-- 
2.11.0


