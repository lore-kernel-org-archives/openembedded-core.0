Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E6518782D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 19:20:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 12 Jun 2017 12:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,334,1493708400"; d="scan'208";a="1140512228"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2017 12:20:29 -0700
Message-ID: <1497295764.26945.217.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Mon, 12 Jun 2017 14:29:24 -0500
In-Reply-To: <20170612145805.11599-1-alexander.kanavin@linux.intel.com>
References: <20170612145805.11599-1-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Mon, 12 Jun 2017 19:20:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-06-12 at 17:58 +0300, Alexander Kanavin wrote:
> This greatly reduces build times when there is a large amount of small
> rpm packages to produce. The patches are rather invasive,
> and so will be submitted upstream.
> 

What is the buildstat value (those from /proc/[PID]) you think this
patch would make a considerable performance burst?

These are the top most consuming recipes just for the task of interested
(do_package_write_rpm)

without this patch:

do_package_write_rpm glibc-locale-2.25-r0 268.87 seconds
do_package_write_rpm perl-5.24.1-r0 85.87 seconds
do_package_write_rpm python3-3.5.3-r1.0 38.01 seconds
do_package_write_rpm gtk+3-3.22.8-r0 30.10 seconds
do_package_write_rpm libxml2-2.9.4-r0 25.97 seconds
do_package_write_rpm glibc-2.25-r0 25.67 seconds
do_package_write_rpm db-1_5.3.28-r1 23.80 seconds
do_package_write_rpm binutils-2.28-r0 22.92 seconds
do_package_write_rpm util-linux-2.29.1-r0 20.86 seconds
do_package_write_rpm mesa-2_17.0.6-r0 20.32 seconds

with this patch:


do_package_write_rpm perl-5.24.1-r0 68.77 seconds
do_package_write_rpm glibc-locale-2.25-r0 53.59 seconds
do_package_write_rpm python3-3.5.3-r1.0 30.88 seconds
do_package_write_rpm libxml2-2.9.4-r0 30.51 seconds
do_package_write_rpm glibc-2.25-r0 29.99 seconds
do_package_write_rpm glib-2.0-1_2.52.2-r0 29.24 seconds
do_package_write_rpm db-1_5.3.28-r1 24.47 seconds
do_package_write_rpm coreutils-8.27-r0 23.93 seconds
do_package_write_rpm gettext-0.19.8.1-r0 23.88 seconds
do_package_write_rpm gtk+3-3.22.15-r0 23.48 seconds

times are not wall-times, these are times coming from the bitbake
scheduler but I believe this provide us some insight.

Times where taken with the following cmd line

> scripts/contrib/bb-perf/buildstats.sh -t package_write_rpm -b <build
folder> -s 'Elapsed time' | sort -k3 -n -r | head

Leo


> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...y-package-building-into-a-separate-functi.patch |  84 +++++
>  ...-binary-package-creation-via-thread-pools.patch | 127 ++++++++
>  ...c-make-operations-over-string-pools-threa.patch | 207 +++++++++++++
>  ...c-remove-static-local-variables-from-buil.patch | 337 +++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_git.bb               |   4 +
>  5 files changed, 759 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> 
> diff --git a/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch b/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> new file mode 100644
> index 00000000000..6e44f0b7fc9
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> @@ -0,0 +1,84 @@
> +From 721a660a507d6d062e7aecafad886c643970a5d5 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 25 May 2017 18:15:27 +0300
> +Subject: [PATCH 1/4] Split binary package building into a separate function
> +
> +So that it can be run as a thread pool task.
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + build/pack.c | 33 +++++++++++++++++++++------------
> + 1 file changed, 21 insertions(+), 12 deletions(-)
> +
> +diff --git a/build/pack.c b/build/pack.c
> +index 518f4e92a..ccfd614cc 100644
> +--- a/build/pack.c
> ++++ b/build/pack.c
> +@@ -546,18 +546,13 @@ static rpmRC checkPackages(char *pkgcheck)
> +     return RPMRC_OK;
> + }
> + 
> +-rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> ++static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename)
> + {
> +-    rpmRC rc;
> +-    const char *errorString;
> +-    Package pkg;
> +-    char *pkglist = NULL;
> +-
> +-    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> +-	char *fn;
> ++	const char *errorString;
> ++	rpmRC rc = RPMRC_OK;
> + 
> + 	if (pkg->fileList == NULL)
> +-	    continue;
> ++	    return rc;
> + 
> + 	if ((rc = processScriptFiles(spec, pkg)))
> + 	    return rc;
> +@@ -587,7 +582,7 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> + 		     headerGetString(pkg->header, RPMTAG_NAME), errorString);
> + 		return RPMRC_FAIL;
> + 	    }
> +-	    fn = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
> ++	    *filename = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
> + 	    if ((binDir = strchr(binRpm, '/')) != NULL) {
> + 		struct stat st;
> + 		char *dn;
> +@@ -609,14 +604,28 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> + 	    free(binRpm);
> + 	}
> + 
> +-	rc = writeRPM(pkg, NULL, fn, NULL);
> ++	rc = writeRPM(pkg, NULL, *filename, NULL);
> + 	if (rc == RPMRC_OK) {
> + 	    /* Do check each written package if enabled */
> +-	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", fn, NULL);
> ++	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
> + 	    if (pkgcheck[0] != ' ') {
> + 		rc = checkPackages(pkgcheck);
> + 	    }
> + 	    free(pkgcheck);
> ++	}
> ++	return rc;
> ++}
> ++
> ++rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> ++{
> ++    rpmRC rc;
> ++    Package pkg;
> ++    char *pkglist = NULL;
> ++
> ++    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> ++	char *fn = NULL;
> ++	rc = packageBinary(spec, pkg, cookie, cheating, &fn);
> ++	if (rc == RPMRC_OK) {
> + 	    rstrcat(&pkglist, fn);
> + 	    rstrcat(&pkglist, " ");
> + 	}
> +-- 
> +2.11.0
> +
> diff --git a/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch b/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> new file mode 100644
> index 00000000000..d10041c2e14
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> @@ -0,0 +1,127 @@
> +From 513200cf76758de4668312c628d6362bdabfaf4b Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 25 May 2017 19:30:20 +0300
> +Subject: [PATCH 1/3] Run binary package creation via thread pools.
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + build/pack.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++-----------
> + configure.ac |  3 +++
> + 2 files changed, 70 insertions(+), 14 deletions(-)
> +
> +diff --git a/build/pack.c b/build/pack.c
> +index ccfd614cc..ed5b9ab4e 100644
> +--- a/build/pack.c
> ++++ b/build/pack.c
> +@@ -616,25 +616,78 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> + 	return rc;
> + }
> + 
> +-rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> ++struct binaryPackageTaskData
> + {
> +-    rpmRC rc;
> +     Package pkg;
> ++    char *filename;
> ++    rpmRC result;
> ++    struct binaryPackageTaskData *next;
> ++};
> ++
> ++static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating)
> ++{
> ++    struct binaryPackageTaskData *tasks = NULL;
> ++    struct binaryPackageTaskData *task = NULL;
> ++    struct binaryPackageTaskData *prev = NULL;
> ++
> ++    for (Package pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> ++        task = rcalloc(1, sizeof(*task));
> ++        task->pkg = pkg;
> ++        if (pkg == spec->packages) {
> ++            // the first package needs to be processed ahead of others, as they copy
> ++            // changelog data from it, and so otherwise data races would happen
> ++            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename));
> ++            rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> ++            tasks = task;
> ++        }
> ++        if (prev != NULL) {
> ++            prev->next = task;
> ++        }
> ++        prev = task;
> ++    }
> ++
> ++    #pragma omp parallel
> ++    #pragma omp single
> ++    // re-declaring task variable is necessary, or older gcc versions will produce code that segfaults
> ++    for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
> ++        if (task != tasks)
> ++        #pragma omp task
> ++        {
> ++            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename));
> ++            rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> ++        }
> ++    }
> ++
> ++    return tasks;
> ++}
> ++
> ++static void freeBinaryPackageTasks(struct binaryPackageTaskData* tasks)
> ++{
> ++    while (tasks != NULL) {
> ++        struct binaryPackageTaskData* next = tasks->next;
> ++        rfree(tasks->filename);
> ++        rfree(tasks);
> ++        tasks = next;
> ++    }
> ++}
> ++
> ++rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> ++{
> +     char *pkglist = NULL;
> + 
> +-    for (pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> +-	char *fn = NULL;
> +-	rc = packageBinary(spec, pkg, cookie, cheating, &fn);
> +-	if (rc == RPMRC_OK) {
> +-	    rstrcat(&pkglist, fn);
> +-	    rstrcat(&pkglist, " ");
> +-	}
> +-	free(fn);
> +-	if (rc != RPMRC_OK) {
> +-	    pkglist = _free(pkglist);
> +-	    return rc;
> +-	}
> ++    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating);
> ++
> ++    for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
> ++        if (task->result == RPMRC_OK) {
> ++            rstrcat(&pkglist, task->filename);
> ++            rstrcat(&pkglist, " ");
> ++        } else {
> ++            _free(pkglist);
> ++            freeBinaryPackageTasks(tasks);
> ++            return RPMRC_FAIL;
> ++        }
> +     }
> ++    freeBinaryPackageTasks(tasks);
> + 
> +     /* Now check the package set if enabled */
> +     if (pkglist != NULL) {
> +diff --git a/configure.ac b/configure.ac
> +index a506ec819..59fa0acaf 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -17,6 +17,9 @@ AC_DISABLE_STATIC
> + 
> + PKG_PROG_PKG_CONFIG
> + 
> ++AC_OPENMP
> ++RPMCFLAGS="$OPENMP_CFLAGS $RPMCFLAGS"
> ++
> + dnl Checks for programs.
> + AC_PROG_CXX
> + AC_PROG_AWK
> +-- 
> +2.11.0
> +
> diff --git a/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch b/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
> new file mode 100644
> index 00000000000..c348ae5330e
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
> @@ -0,0 +1,207 @@
> +From c80892f17e44331206c8318d53b63bb6a99554d0 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 30 May 2017 13:58:30 +0300
> +Subject: [PATCH 3/4] rpmstrpool.c: make operations over string pools
> + thread-safe
> +
> +Otherwise multithreaded rpm building explodes in various ways due
> +to data races.
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + rpmio/rpmstrpool.c | 56 +++++++++++++++++++++++++++++++++++++++++++++---------
> + 1 file changed, 47 insertions(+), 9 deletions(-)
> +
> +diff --git a/rpmio/rpmstrpool.c b/rpmio/rpmstrpool.c
> +index 30a57eb10..58ba95a02 100644
> +--- a/rpmio/rpmstrpool.c
> ++++ b/rpmio/rpmstrpool.c
> +@@ -113,6 +113,8 @@ static poolHash poolHashCreate(int numBuckets)
> +     return ht;
> + }
> + 
> ++static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid sid);
> ++
> + static void poolHashResize(rpmstrPool pool, int numBuckets)
> + {
> +     poolHash ht = pool->hash;
> +@@ -120,7 +122,7 @@ static void poolHashResize(rpmstrPool pool, int numBuckets)
> + 
> +     for (int i=0; i<ht->numBuckets; i++) {
> +         if (!ht->buckets[i].keyid) continue;
> +-        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool, ht->buckets[i].keyid));
> ++        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool, ht->buckets[i].keyid));
> +         for (unsigned int j=0;;j++) {
> +             unsigned int hash = hashbucket(keyHash, j) % numBuckets;
> +             if (!buckets[hash].keyid) {
> +@@ -149,7 +151,7 @@ static void poolHashAddHEntry(rpmstrPool pool, const char * key, unsigned int ke
> +             ht->buckets[hash].keyid = keyid;
> +             ht->keyCount++;
> +             break;
> +-        } else if (!strcmp(rpmstrPoolStr(pool, ht->buckets[hash].keyid), key)) {
> ++        } else if (!strcmp(rpmstrPoolStrNoLock(pool, ht->buckets[hash].keyid), key)) {
> +             return;
> +         }
> +     }
> +@@ -191,7 +193,7 @@ static void poolHashPrintStats(rpmstrPool pool)
> +     int maxcollisions = 0;
> + 
> +     for (i=0; i<ht->numBuckets; i++) {
> +-        unsigned int keyHash = rstrhash(rpmstrPoolStr(pool, ht->buckets[i].keyid));
> ++        unsigned int keyHash = rstrhash(rpmstrPoolStrNoLock(pool, ht->buckets[i].keyid));
> +         for (unsigned int j=0;;j++) {
> +             unsigned int hash = hashbucket(keyHash, i) % ht->numBuckets;
> +             if (hash==i) {
> +@@ -221,7 +223,7 @@ static void rpmstrPoolRehash(rpmstrPool pool)
> + 
> +     pool->hash = poolHashCreate(sizehint);
> +     for (int i = 1; i <= pool->offs_size; i++)
> +-	poolHashAddEntry(pool, rpmstrPoolStr(pool, i), i);
> ++	poolHashAddEntry(pool, rpmstrPoolStrNoLock(pool, i), i);
> + }
> + 
> + rpmstrPool rpmstrPoolCreate(void)
> +@@ -245,6 +247,8 @@ rpmstrPool rpmstrPoolCreate(void)
> + 
> + rpmstrPool rpmstrPoolFree(rpmstrPool pool)
> + {
> ++    #pragma omp critical(rpmstrpool)
> ++    {
> +     if (pool) {
> + 	if (pool->nrefs > 1) {
> + 	    pool->nrefs--;
> +@@ -260,18 +264,24 @@ rpmstrPool rpmstrPoolFree(rpmstrPool pool)
> + 	    free(pool);
> + 	}
> +     }
> ++    }
> +     return NULL;
> + }
> + 
> + rpmstrPool rpmstrPoolLink(rpmstrPool pool)
> + {
> ++    #pragma omp critical(rpmstrpool)
> ++    {
> +     if (pool)
> + 	pool->nrefs++;
> ++    }
> +     return pool;
> + }
> + 
> + void rpmstrPoolFreeze(rpmstrPool pool, int keephash)
> + {
> ++    #pragma omp critical(rpmstrpool)
> ++    {
> +     if (pool && !pool->frozen) {
> + 	if (!keephash) {
> + 	    pool->hash = poolHashFree(pool->hash);
> +@@ -281,16 +291,20 @@ void rpmstrPoolFreeze(rpmstrPool pool, int keephash)
> + 			      pool->offs_alloced * sizeof(*pool->offs));
> + 	pool->frozen = 1;
> +     }
> ++    }
> + }
> + 
> + void rpmstrPoolUnfreeze(rpmstrPool pool)
> + {
> ++    #pragma omp critical(rpmstrpool)
> ++    {
> +     if (pool) {
> + 	if (pool->hash == NULL) {
> + 	    rpmstrPoolRehash(pool);
> + 	}
> + 	pool->frozen = 0;
> +     }
> ++    }
> + }
> + 
> + static rpmsid rpmstrPoolPut(rpmstrPool pool, const char *s, size_t slen, unsigned int hash)
> +@@ -350,7 +364,7 @@ static rpmsid rpmstrPoolGet(rpmstrPool pool, const char * key, size_t keylen,
> +             return 0;
> +         }
> + 
> +-	s = rpmstrPoolStr(pool, ht->buckets[hash].keyid);
> ++	s = rpmstrPoolStrNoLock(pool, ht->buckets[hash].keyid);
> + 	/* pool string could be longer than keylen, require exact matche */
> + 	if (strncmp(s, key, keylen) == 0 && s[keylen] == '\0')
> + 	    return ht->buckets[hash].keyid;
> +@@ -373,27 +387,31 @@ static inline rpmsid strn2id(rpmstrPool pool, const char *s, size_t slen,
> + rpmsid rpmstrPoolIdn(rpmstrPool pool, const char *s, size_t slen, int create)
> + {
> +     rpmsid sid = 0;
> +-
> ++    #pragma omp critical(rpmstrpool)
> ++    {
> +     if (s != NULL) {
> + 	unsigned int hash = rstrnhash(s, slen);
> + 	sid = strn2id(pool, s, slen, hash, create);
> +     }
> ++    }
> +     return sid;
> + }
> + 
> + rpmsid rpmstrPoolId(rpmstrPool pool, const char *s, int create)
> + {
> +     rpmsid sid = 0;
> +-
> ++    #pragma omp critical(rpmstrpool)
> ++    {
> +     if (s != NULL) {
> + 	size_t slen;
> + 	unsigned int hash = rstrlenhash(s, &slen);
> + 	sid = strn2id(pool, s, slen, hash, create);
> +     }
> ++    }
> +     return sid;
> + }
> + 
> +-const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
> ++static const char * rpmstrPoolStrNoLock(rpmstrPool pool, rpmsid sid)
> + {
> +     const char *s = NULL;
> +     if (pool && sid > 0 && sid <= pool->offs_size)
> +@@ -401,12 +419,25 @@ const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
> +     return s;
> + }
> + 
> ++const char * rpmstrPoolStr(rpmstrPool pool, rpmsid sid)
> ++{
> ++    const char *s = NULL;
> ++    #pragma omp critical(rpmstrpool)
> ++    {
> ++    s = rpmstrPoolStrNoLock(pool, sid);
> ++    }
> ++    return s;
> ++}
> ++
> + size_t rpmstrPoolStrlen(rpmstrPool pool, rpmsid sid)
> + {
> +     size_t slen = 0;
> ++    #pragma omp critical(rpmstrpool)
> ++    {
> +     if (pool && sid > 0 && sid <= pool->offs_size) {
> + 	slen = strlen(pool->offs[sid]);
> +     }
> ++    }
> +     return slen;
> + }
> + 
> +@@ -421,5 +452,12 @@ int rpmstrPoolStreq(rpmstrPool poolA, rpmsid sidA,
> + 
> + rpmsid rpmstrPoolNumStr(rpmstrPool pool)
> + {
> +-    return (pool != NULL) ? pool->offs_size : 0;
> ++    rpmsid id = 0;
> ++    #pragma omp critical(rpmstrpool)
> ++    {
> ++    if (pool) {
> ++	id = pool->offs_size;
> ++    }
> ++    }
> ++    return id;
> + }
> +-- 
> +2.11.0
> +
> diff --git a/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> new file mode 100644
> index 00000000000..64a5651f7e1
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> @@ -0,0 +1,337 @@
> +From ec305795a302d226343e69031ff2024dfcde69c0 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 8 Jun 2017 17:08:09 +0300
> +Subject: [PATCH 3/3] build/pack.c: remove static local variables from
> + buildHost() and getBuildTime()
> +
> +Their use is causing difficult to diagnoze data races when building multiple
> +packages in parallel, and is a bad idea in general, as it also makes it more
> +difficult to reason about code.
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + build/build.c             | 54 ++++++++++++++++++++++++++++--
> + build/pack.c              | 84 +++++++++--------------------------------------
> + build/rpmbuild_internal.h |  8 +++--
> + 3 files changed, 74 insertions(+), 72 deletions(-)
> +
> +diff --git a/build/build.c b/build/build.c
> +index 5f99c8db7..09a1311c5 100644
> +--- a/build/build.c
> ++++ b/build/build.c
> +@@ -6,6 +6,8 @@
> + #include "system.h"
> + 
> + #include <errno.h>
> ++#include <netdb.h>
> ++#include <time.h>
> + #include <sys/wait.h>
> + 
> + #include <rpm/rpmlog.h>
> +@@ -16,6 +18,50 @@
> + 
> + #include "debug.h"
> + 
> ++static rpm_time_t getBuildTime(void)
> ++{
> ++    rpm_time_t buildTime = 0;
> ++    char *srcdate;
> ++    time_t epoch;
> ++    char *endptr;
> ++
> ++    srcdate = getenv("SOURCE_DATE_EPOCH");
> ++    if (srcdate) {
> ++        errno = 0;
> ++        epoch = strtol(srcdate, &endptr, 10);
> ++        if (srcdate == endptr || *endptr || errno != 0)
> ++            rpmlog(RPMLOG_ERR, _("unable to parse SOURCE_DATE_EPOCH\n"));
> ++        else
> ++            buildTime = (int32_t) epoch;
> ++    } else
> ++        buildTime = (int32_t) time(NULL);
> ++
> ++    return buildTime;
> ++}
> ++
> ++static char * buildHost(void)
> ++{
> ++    char* hostname;
> ++    struct hostent *hbn;
> ++    char *bhMacro;
> ++
> ++    bhMacro = rpmExpand("%{?_buildhost}", NULL);
> ++    if (strcmp(bhMacro, "") != 0) {
> ++        rasprintf(&hostname, "%s", bhMacro);
> ++    } else {
> ++        hostname = rcalloc(1024, sizeof(*hostname));
> ++        (void) gethostname(hostname, 1024);
> ++        hbn = gethostbyname(hostname);
> ++        if (hbn)
> ++            strcpy(hostname, hbn->h_name);
> ++        else
> ++            rpmlog(RPMLOG_WARNING,
> ++                    _("Could not canonicalize hostname: %s\n"), hostname);
> ++    }
> ++    free(bhMacro);
> ++    return(hostname);
> ++}
> ++
> + /**
> +  */
> + static rpmRC doRmSource(rpmSpec spec)
> +@@ -203,6 +249,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
> +     rpmRC rc = RPMRC_OK;
> +     int test = (what & RPMBUILD_NOBUILD);
> +     char *cookie = buildArgs->cookie ? xstrdup(buildArgs->cookie) : NULL;
> ++    const char* host = buildHost();
> ++    rpm_time_t buildTime = getBuildTime();
> ++
> + 
> +     if (rpmExpandNumeric("%{?source_date_epoch_from_changelog}") &&
> + 	getenv("SOURCE_DATE_EPOCH") == NULL) {
> +@@ -271,11 +320,11 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
> + 		goto exit;
> + 
> + 	if (((what & RPMBUILD_PACKAGESOURCE) && !test) &&
> +-	    (rc = packageSources(spec, &cookie)))
> ++	    (rc = packageSources(spec, &cookie, buildTime, host)))
> + 		return rc;
> + 
> + 	if (((what & RPMBUILD_PACKAGEBINARY) && !test) &&
> +-	    (rc = packageBinaries(spec, cookie, (didBuild == 0))))
> ++	    (rc = packageBinaries(spec, cookie, (didBuild == 0), buildTime, host)))
> + 		goto exit;
> + 	
> + 	if ((what & RPMBUILD_CLEAN) &&
> +@@ -295,6 +344,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, int what)
> + 	(void) unlink(spec->specFile);
> + 
> + exit:
> ++    free(host);
> +     free(cookie);
> +     spec->rootDir = NULL;
> +     if (rc != RPMRC_OK && rpmlogGetNrecs() > 0) {
> +diff --git a/build/pack.c b/build/pack.c
> +index ed5b9ab4e..62427065a 100644
> +--- a/build/pack.c
> ++++ b/build/pack.c
> +@@ -6,8 +6,6 @@
> + #include "system.h"
> + 
> + #include <errno.h>
> +-#include <netdb.h>
> +-#include <time.h>
> + #include <sys/wait.h>
> + 
> + #include <rpm/rpmlib.h>			/* RPMSIGTAG*, rpmReadPackageFile */
> +@@ -151,57 +149,6 @@ exit:
> +     return rc;
> + }
> + 
> +-static rpm_time_t * getBuildTime(void)
> +-{
> +-    static rpm_time_t buildTime[1];
> +-    char *srcdate;
> +-    time_t epoch;
> +-    char *endptr;
> +-
> +-    if (buildTime[0] == 0) {
> +-        srcdate = getenv("SOURCE_DATE_EPOCH");
> +-        if (srcdate) {
> +-            errno = 0;
> +-            epoch = strtol(srcdate, &endptr, 10);
> +-            if (srcdate == endptr || *endptr || errno != 0)
> +-                rpmlog(RPMLOG_ERR, _("unable to parse SOURCE_DATE_EPOCH\n"));
> +-            else
> +-                buildTime[0] = (int32_t) epoch;
> +-        } else
> +-            buildTime[0] = (int32_t) time(NULL);
> +-    }
> +-
> +-    return buildTime;
> +-}
> +-
> +-static const char * buildHost(void)
> +-{
> +-    static char hostname[1024];
> +-    static int oneshot = 0;
> +-    struct hostent *hbn;
> +-    char *bhMacro;
> +-
> +-    if (! oneshot) {
> +-        bhMacro = rpmExpand("%{?_buildhost}", NULL);
> +-        if (strcmp(bhMacro, "") != 0 && strlen(bhMacro) < 1024) {
> +-            strcpy(hostname, bhMacro);
> +-        } else {
> +-            if (strcmp(bhMacro, "") != 0)
> +-                rpmlog(RPMLOG_WARNING, _("The _buildhost macro is too long\n"));
> +-            (void) gethostname(hostname, sizeof(hostname));
> +-            hbn = gethostbyname(hostname);
> +-            if (hbn)
> +-                strcpy(hostname, hbn->h_name);
> +-            else
> +-                rpmlog(RPMLOG_WARNING,
> +-                        _("Could not canonicalize hostname: %s\n"), hostname);
> +-        }
> +-        free(bhMacro);
> +-        oneshot = 1;
> +-    }
> +-    return(hostname);
> +-}
> +-
> + static rpmRC processScriptFiles(rpmSpec spec, Package pkg)
> + {
> +     struct TriggerFileEntry *p;
> +@@ -308,7 +255,8 @@ static int haveRichDep(Package pkg)
> + }
> + 
> + static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
> +-		      const char *fileName, char **cookie)
> ++		      const char *fileName, char **cookie,
> ++		      rpm_time_t buildTime, const char* buildHost)
> + {
> +     FD_t fd = NULL;
> +     char * rpmio_flags = NULL;
> +@@ -397,7 +345,7 @@ static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
> + 
> +     /* Create and add the cookie */
> +     if (cookie) {
> +-	rasprintf(cookie, "%s %d", buildHost(), (int) (*getBuildTime()));
> ++	rasprintf(cookie, "%s %d", buildHost, buildTime);
> + 	headerPutString(pkg->header, RPMTAG_COOKIE, *cookie);
> +     }
> +     
> +@@ -546,7 +494,7 @@ static rpmRC checkPackages(char *pkgcheck)
> +     return RPMRC_OK;
> + }
> + 
> +-static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename)
> ++static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename, rpm_time_t buildTime, const char* buildHost)
> + {
> + 	const char *errorString;
> + 	rpmRC rc = RPMRC_OK;
> +@@ -565,8 +513,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> + 	headerCopyTags(spec->packages->header, pkg->header, copyTags);
> + 	
> + 	headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
> +-	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost());
> +-	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
> ++	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost);
> ++	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
> + 
> + 	if (spec->sourcePkgId != NULL) {
> + 	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
> +@@ -604,7 +552,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> + 	    free(binRpm);
> + 	}
> + 
> +-	rc = writeRPM(pkg, NULL, *filename, NULL);
> ++	rc = writeRPM(pkg, NULL, *filename, NULL, buildTime, buildHost);
> + 	if (rc == RPMRC_OK) {
> + 	    /* Do check each written package if enabled */
> + 	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
> +@@ -624,7 +572,7 @@ struct binaryPackageTaskData
> +     struct binaryPackageTaskData *next;
> + };
> + 
> +-static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating)
> ++static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char* buildHost)
> + {
> +     struct binaryPackageTaskData *tasks = NULL;
> +     struct binaryPackageTaskData *task = NULL;
> +@@ -636,7 +584,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
> +         if (pkg == spec->packages) {
> +             // the first package needs to be processed ahead of others, as they copy
> +             // changelog data from it, and so otherwise data races would happen
> +-            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename));
> ++            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename), buildTime, buildHost);
> +             rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> +             tasks = task;
> +         }
> +@@ -653,7 +601,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
> +         if (task != tasks)
> +         #pragma omp task
> +         {
> +-            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename));
> ++            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename), buildTime, buildHost);
> +             rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> +         }
> +     }
> +@@ -671,11 +619,11 @@ static void freeBinaryPackageTasks(struct binaryPackageTaskData* tasks)
> +     }
> + }
> + 
> +-rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> ++rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char* buildHost)
> + {
> +     char *pkglist = NULL;
> + 
> +-    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating);
> ++    struct binaryPackageTaskData *tasks = runBinaryPackageTasks(spec, cookie, cheating, buildTime, buildHost);
> + 
> +     for (struct binaryPackageTaskData *task = tasks; task != NULL; task = task->next) {
> +         if (task->result == RPMRC_OK) {
> +@@ -702,22 +650,22 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> +     return RPMRC_OK;
> + }
> + 
> +-rpmRC packageSources(rpmSpec spec, char **cookie)
> ++rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_t buildTime, char* buildHost)
> + {
> +     Package sourcePkg = spec->sourcePackage;
> +     rpmRC rc;
> + 
> +     /* Add some cruft */
> +     headerPutString(sourcePkg->header, RPMTAG_RPMVERSION, VERSION);
> +-    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost());
> +-    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
> ++    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost);
> ++    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
> + 
> +     /* XXX this should be %_srpmdir */
> +     {	char *fn = rpmGetPath("%{_srcrpmdir}/", spec->sourceRpmName,NULL);
> + 	char *pkgcheck = rpmExpand("%{?_build_pkgcheck_srpm} ", fn, NULL);
> + 
> + 	spec->sourcePkgId = NULL;
> +-	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie);
> ++	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie, buildTime, buildHost);
> + 
> + 	/* Do check SRPM package if enabled */
> + 	if (rc == RPMRC_OK && pkgcheck[0] != ' ') {
> +diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_internal.h
> +index 8351a6a34..797337ca7 100644
> +--- a/build/rpmbuild_internal.h
> ++++ b/build/rpmbuild_internal.h
> +@@ -408,19 +408,23 @@ rpmRC processSourceFiles(rpmSpec spec, rpmBuildPkgFlags pkgFlags);
> +  * @param spec		spec file control structure
> +  * @param cookie	build identifier "cookie" or NULL
> +  * @param cheating	was build shortcircuited?
> ++ * @param buildTime	the build timestamp that goes into packages
> ++ * @param buildHost	the hostname where the build is happening
> +  * @return		RPMRC_OK on success
> +  */
> + RPM_GNUC_INTERNAL
> +-rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating);
> ++rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating, rpm_time_t buildTime, char* buildHost);
> + 
> + /** \ingroup rpmbuild
> +  * Generate source package.
> +  * @param spec		spec file control structure
> +  * @retval cookie	build identifier "cookie" or NULL
> ++ * @param buildTime	the build timestamp that goes into packages
> ++ * @param buildHost	the hostname where the build is happening
> +  * @return		RPMRC_OK on success
> +  */
> + RPM_GNUC_INTERNAL
> +-rpmRC packageSources(rpmSpec spec, char **cookie);
> ++rpmRC packageSources(rpmSpec spec, char **cookie, rpm_time_t buildTime, char* buildHost);
> + 
> + RPM_GNUC_INTERNAL
> + int addLangTag(rpmSpec spec, Header h, rpmTagVal tag,
> +-- 
> +2.11.0
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
> index 2310ee6b09e..b95b4719c19 100644
> --- a/meta/recipes-devtools/rpm/rpm_git.bb
> +++ b/meta/recipes-devtools/rpm/rpm_git.bb
> @@ -35,6 +35,10 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
>             file://0001-Fix-build-with-musl-C-library.patch \
>             file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
>             file://0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch \
> +           file://0001-Split-binary-package-building-into-a-separate-functi.patch \
> +           file://0002-Run-binary-package-creation-via-thread-pools.patch \
> +           file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
> +           file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
>             "
>  
>  PV = "4.13.90+git${SRCPV}"
> -- 
> 2.11.0
> 



