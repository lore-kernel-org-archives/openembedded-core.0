Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C010B78279
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:55:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v58Gtljo004049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Jun 2017 09:55:47 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 8 Jun 2017 09:55:46 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1496932793.git.alexander.kanavin@linux.intel.com>
	<ea2b0fd4184df2bf7cc703bc0e195aa2dda1049b.1496932793.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5cac68b8-6bf7-4453-d75a-45d8b9887d99@windriver.com>
Date: Thu, 8 Jun 2017 11:55:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <ea2b0fd4184df2bf7cc703bc0e195aa2dda1049b.1496932793.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCHv2 2/2] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Thu, 08 Jun 2017 16:55:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/8/17 9:42 AM, Alexander Kanavin wrote:
> This greatly reduces build times when there is a large amount of small
> rpm packages to produce. The patches are rather invasive,
> and so will be submitted upstream.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...y-package-building-into-a-separate-functi.patch |  83 ++++++++
>  ...-binary-package-creation-via-thread-pools.patch | 125 ++++++++++++
>  ...c-make-operations-over-string-pools-threa.patch | 207 ++++++++++++++++++++
>  ...c-remove-static-local-variables-from-buil.patch | 216 +++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_git.bb               |   4 +
>  5 files changed, 635 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> 
> diff --git a/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch b/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> new file mode 100644
> index 00000000000..3d8b12144e7
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-Split-binary-package-building-into-a-separate-functi.patch
> @@ -0,0 +1,83 @@
> +From b841b699e519438a66b661247c94efff63d0700e Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 25 May 2017 18:15:27 +0300
> +Subject: [PATCH 01/14] Split binary package building into a separate function
> +
> +So that it can be run as a thread pool task.
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + build/pack.c | 33 +++++++++++++++++++++------------
> + 1 file changed, 21 insertions(+), 12 deletions(-)
> +
> +diff --git a/build/pack.c b/build/pack.c
> +index 497300b96..891e6bdc3 100644
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
> ++        const char *errorString;
> ++        rpmRC rc = RPMRC_OK;

The above change appears to be changing the spacing of the code.  RPM is
somewhat unique in how it does spacing.

Generally it's:

four spaces
   tab
       tab + four spaces
           tab + tab
repeat....

(Note there are a lot of inconsistencies here, so I'd say follow what the
function itself is using, as much as you can.)

> + 
> + 	if (pkg->fileList == NULL)
> +-	    continue;
> ++	    return rc;
> + 
> + 	if ((rc = processScriptFiles(spec, pkg)))
> + 	    return rc;
> +@@ -591,7 +586,7 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
> + 		     headerGetString(pkg->header, RPMTAG_NAME), errorString);
> + 		return RPMRC_FAIL;
> + 	    }
> +-	    fn = rpmGetPath("%{_rpmdir}/", binRpm, NULL);
> ++	    *filename = rpmGetPath("%{_rpmdir}/", binRpm, NULL);

I'm not sure if it would be a cleaner change if you did (top of function):

char *fn = *filename;

and then kept this code as it is.  Might be up to the RPM community for that
type of comment.

> + 	    if ((binDir = strchr(binRpm, '/')) != NULL) {
> + 		struct stat st;
> + 		char *dn;
> +@@ -613,14 +608,28 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie, int cheating)
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
> ++        return rc;
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
> ++        rc = packageBinary(spec, pkg, cookie, cheating, &fn);
> ++	if (rc == RPMRC_OK) {

tab/spacing above is inconsistent.

> + 	    rstrcat(&pkglist, fn);
> + 	    rstrcat(&pkglist, " ");
> + 	}
> +-- 
> +2.11.0
> +
> diff --git a/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch b/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> new file mode 100644
> index 00000000000..549148930fa
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0002-Run-binary-package-creation-via-thread-pools.patch
> @@ -0,0 +1,125 @@
> +From f8a05339a1e7b307e8de8c858e6e963782fc5925 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 25 May 2017 19:30:20 +0300
> +Subject: [PATCH 1/3] Run binary package creation via thread pools.
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/226]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + build/pack.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++-----------
> + configure.ac |  3 +++
> + 2 files changed, 69 insertions(+), 14 deletions(-)
> +
> +diff --git a/build/pack.c b/build/pack.c
> +index 5898a491b..f85d8dc90 100644
> +--- a/build/pack.c
> ++++ b/build/pack.c
> +@@ -616,25 +616,77 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> +         return rc;
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
> ++    for (task = tasks; task != NULL; task = task->next) {
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
> +-        rc = packageBinary(spec, pkg, cookie, cheating, &fn);
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
> index 00000000000..cbfa44e268f
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch
> @@ -0,0 +1,207 @@
> +From 92a130c944ce79d082b94e42ea5a5edb2ac2237b Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 30 May 2017 13:58:30 +0300
> +Subject: [PATCH 2/3] rpmstrpool.c: make operations over string pools
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
> index 00000000000..9d43c3767b1
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> @@ -0,0 +1,216 @@
> +From 869d60f6cf68c2c83cc799f051c064e762ae9814 Mon Sep 17 00:00:00 2001
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
> +---
> + build/pack.c | 92 ++++++++++++++++++++++++++++++------------------------------
> + 1 file changed, 46 insertions(+), 46 deletions(-)
> +
> +diff --git a/build/pack.c b/build/pack.c
> +index f85d8dc90..12b1ceb76 100644
> +--- a/build/pack.c
> ++++ b/build/pack.c
> +@@ -151,54 +151,47 @@ exit:
> +     return rc;
> + }
> + 
> +-static rpm_time_t * getBuildTime(void)
> ++static rpm_time_t getBuildTime(void)
> + {
> +-    static rpm_time_t buildTime[1];
> ++    rpm_time_t buildTime = 0;
> +     char *srcdate;
> +     time_t epoch;
> +     char *endptr;
> + 
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

I think there is a concern here that the getBuildTime() function should capture
the time once and then re-use it for the life of that specific RPM session.  If
the getBuildTime is being called by a thread, I can see why this may not work.
Moving the initial call (and thus setting of the static value earlier would be
desirable.)

> + 
> +     return buildTime;
> + }
> + 
> +-static const char * buildHost(void)
> ++static char * buildHost(void)
> + {
> +-    static char hostname[1024];
> +-    static int oneshot = 0;
> ++    char* hostname;

The same for the buildHost.  Canonicalizing it each time and other things have
caused problems in the past.  So doing it once and caching the result is likely
the right answer.  Doing it earlier enough to cache the result BEFORE threading
is advisable.

> +     struct hostent *hbn;
> +     char *bhMacro;
> + 
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
> +     return(hostname);
> + }
> + 
> +@@ -308,7 +301,8 @@ static int haveRichDep(Package pkg)
> + }
> + 
> + static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
> +-		      const char *fileName, char **cookie)
> ++		      const char *fileName, char **cookie,
> ++		      rpm_time_t buildTime, const char* buildHost)
> + {
> +     FD_t fd = NULL;
> +     char * rpmio_flags = NULL;
> +@@ -397,7 +391,7 @@ static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
> + 
> +     /* Create and add the cookie */
> +     if (cookie) {
> +-	rasprintf(cookie, "%s %d", buildHost(), (int) (*getBuildTime()));
> ++	rasprintf(cookie, "%s %d", buildHost, buildTime);
> + 	headerPutString(pkg->header, RPMTAG_COOKIE, *cookie);
> +     }
> +     
> +@@ -546,7 +540,7 @@ static rpmRC checkPackages(char *pkgcheck)
> +     return RPMRC_OK;
> + }
> + 
> +-static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename)
> ++static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int cheating, char** filename, rpm_time_t buildTime, const char* buildHost)
> + {
> +         const char *errorString;
> +         rpmRC rc = RPMRC_OK;
> +@@ -565,8 +559,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> + 	headerCopyTags(spec->packages->header, pkg->header, copyTags);
> + 	
> + 	headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
> +-	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost());
> +-	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
> ++	headerPutString(pkg->header, RPMTAG_BUILDHOST, buildHost);
> ++	headerPutUint32(pkg->header, RPMTAG_BUILDTIME, &buildTime, 1);

I don't see what the advantage of this change over the current approach is --
unless the first call is in a thread so the variable can clash.  If that is the
case, it may make more sense to ensure that these two are run very early in the
build process before it threads.

> + 
> + 	if (spec->sourcePkgId != NULL) {
> + 	    headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,16);
> +@@ -604,7 +598,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, const char *cookie, int ch
> + 	    free(binRpm);
> + 	}
> + 
> +-	rc = writeRPM(pkg, NULL, *filename, NULL);
> ++	rc = writeRPM(pkg, NULL, *filename, NULL, buildTime, buildHost);
> + 	if (rc == RPMRC_OK) {
> + 	    /* Do check each written package if enabled */
> + 	    char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename, NULL);
> +@@ -629,6 +623,8 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
> +     struct binaryPackageTaskData *tasks = NULL;
> +     struct binaryPackageTaskData *task = NULL;
> +     struct binaryPackageTaskData *prev = NULL;
> ++    rpm_time_t buildTime = getBuildTime();
> ++    char *host = buildHost();
> + 
> +     for (Package pkg = spec->packages; pkg != NULL; pkg = pkg->next) {
> +         task = rcalloc(1, sizeof(*task));
> +@@ -636,7 +632,7 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
> +         if (pkg == spec->packages) {
> +             // the first package needs to be processed ahead of others, as they copy
> +             // changelog data from it, and so otherwise data races would happen
> +-            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename));
> ++            task->result = packageBinary(spec, pkg, cookie, cheating, &(task->filename), buildTime, buildHost);
> +             rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> +             tasks = task;
> +         }
> +@@ -652,11 +648,12 @@ static struct binaryPackageTaskData* runBinaryPackageTasks(rpmSpec spec, const c
> +         if (task != tasks)
> +         #pragma omp task
> +         {
> +-            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename));
> ++            task->result = packageBinary(spec, task->pkg, cookie, cheating, &(task->filename), buildTime, buildHost);
> +             rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result %d, filename %s\n"), task->result, task->filename);
> +         }
> +     }
> + 
> ++    free(host);
> +     return tasks;
> + }
> + 
> +@@ -707,16 +704,18 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
> +     rpmRC rc;
> + 
> +     /* Add some cruft */
> ++    rpm_time_t buildTime = getBuildTime();
> ++    char* host = buildHost();
> +     headerPutString(sourcePkg->header, RPMTAG_RPMVERSION, VERSION);
> +-    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost());
> +-    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, getBuildTime(), 1);
> ++    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, (const char*)buildHost);
> ++    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
> + 
> +     /* XXX this should be %_srpmdir */
> +     {	char *fn = rpmGetPath("%{_srcrpmdir}/", spec->sourceRpmName,NULL);
> + 	char *pkgcheck = rpmExpand("%{?_build_pkgcheck_srpm} ", fn, NULL);
> + 
> + 	spec->sourcePkgId = NULL;
> +-	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie);
> ++	rc = writeRPM(sourcePkg, &spec->sourcePkgId, fn, cookie, buildTime, host);
> + 
> + 	/* Do check SRPM package if enabled */
> + 	if (rc == RPMRC_OK && pkgcheck[0] != ' ') {
> +@@ -726,5 +725,6 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
> + 	free(pkgcheck);
> + 	free(fn);
> +     }
> ++    free(host);
> +     return rc;
> + }
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
> 


