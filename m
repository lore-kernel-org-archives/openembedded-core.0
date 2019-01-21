Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA376B7C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 07:27:57 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id z23so9400698plo.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2019 23:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9xP8Shq+y0ac/zkhi4gWO1OTsTDM3XGyCzWuoshpVDM=;
	b=NcR4lAIqkanKm0dXf8Aiy7p4pttXVRUl243+ja1rvuQpdtjmOHSklWGxFogljEli6p
	uKQAN62rkGagsRhbbJH/YNJonhaW4pljQ7mfgs9p/qAUxPvO6sCDkR0w5/mdPfZFWTPi
	cIxKEDqutsYjx7RBL3hBtz6tT7b15h7buAqumaPGlSYhKxqmrSqutuqtkp5fXnIBBWbv
	uDYWYGHU1t7KU40KRkYYZLprDX7r+KmnCi17h2y/z+9niUclfrPW549ex2JEdxnAh3qX
	If/9TBv4S6wpPonHbH65dPnSsIT0BJkDyqxnLc3eKJHfZXkNz5L3J7u6XL0BJB+wzLK2
	gDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9xP8Shq+y0ac/zkhi4gWO1OTsTDM3XGyCzWuoshpVDM=;
	b=NSZLafV0LZHOcIs3na6Dw5VQqRkzJb49Sh5O6s0sqA5a7vTKzpuxV5R0UjNYVjZDYy
	7rOaL3i0jRLFYMtlITf6b6N/QGrnc28yzYCZScnrtoVTQwSKKnZ6/IAHPz24RW3ZKkft
	TczDrM03HoLcLtQne6z+J089W/+tURIIdq4YeFThHBY9pD+5Pto91pmnpRhaWR9pPjdJ
	fM15VkQ/xJqR4X6UjVHbLtU5OAKGXUwmt4Dk3hpFmEZERRQK54zGk7J1bZoactiiqHmb
	uQMNaufAktZPtxXFA2LnEld5om+1UycxV++fCrnBI21Lg3tA7stCQ2eIxyqcgp3GQiu2
	m97g==
X-Gm-Message-State: AJcUukeADvsXc7nqwus+pqvZu44a9B4Yo6yN9PwA8oW8eWJKLxUJkkxj
	+eQTVieB7K9k43ZOJ6c+ZSxjIvNAyiw=
X-Google-Smtp-Source: ALg8bN5vMbKG9+g05eN3goB3lX3d0Kw4T5DWXGmEiDKVJy14eLbcoyRigg3YI4pfQr+H93t2SmPPLw==
X-Received: by 2002:a17:902:3064:: with SMTP id
	u91mr28555753plb.325.1548055677766; 
	Sun, 20 Jan 2019 23:27:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b601])
	by smtp.gmail.com with ESMTPSA id
	e16sm15239976pfn.46.2019.01.20.23.27.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jan 2019 23:27:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Jan 2019 23:27:48 -0800
Message-Id: <20190121072749.15424-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] db5: Fix build issues found with clang/libc++
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
X-List-Received-Date: Mon, 21 Jan 2019 07:27:57 -0000
Content-Transfer-Encoding: 8bit

This is a genuine error that is discovered when using libc++ runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tibility-by-renaming-atomic_init-API.patch | 147 ++++++++++++++++++
 meta/recipes-support/db/db_5.3.28.bb          |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch

diff --git a/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch b/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch
new file mode 100644
index 0000000000..a4ff2ecb0c
--- /dev/null
+++ b/meta/recipes-support/db/db/0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch
@@ -0,0 +1,147 @@
+From a3569f118fd95b7ad41e1a1128e17c0b8928556d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Jan 2019 18:30:23 -0800
+Subject: [PATCH] Fix libc++ compatibility by renaming atomic_init API
+
+db5 does not build because it is redefining a C++11 standard
+library identifier, atomic_init().  Therefore prefix all
+its internal defines with '__db_', to avoid collisions.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dbinc/atomic.h     | 4 ++--
+ src/mp/mp_fget.c       | 4 ++--
+ src/mp/mp_mvcc.c       | 4 ++--
+ src/mp/mp_region.c     | 4 ++--
+ src/mutex/mut_method.c | 2 +-
+ src/mutex/mut_tas.c    | 4 ++--
+ 6 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/src/dbinc/atomic.h b/src/dbinc/atomic.h
+index 1b49de5..7bf353c 100644
+--- a/src/dbinc/atomic.h
++++ b/src/dbinc/atomic.h
+@@ -70,7 +70,7 @@ typedef struct {
+  * These have no memory barriers; the caller must include them when necessary.
+  */
+ #define	atomic_read(p)		((p)->value)
+-#define	atomic_init(p, val)	((p)->value = (val))
++#define	__db_atomic_init(p, val)	((p)->value = (val))
+ 
+ #ifdef HAVE_ATOMIC_SUPPORT
+ 
+@@ -206,7 +206,7 @@ static inline int __db_atomic_compare_exchange(
+ #define	atomic_dec(env, p)	(--(p)->value)
+ #define	atomic_compare_exchange(env, p, oldval, newval)		\
+ 	(DB_ASSERT(env, atomic_read(p) == (oldval)),		\
+-	atomic_init(p, (newval)), 1)
++	__db_atomic_init(p, (newval)), 1)
+ #else
+ #define atomic_inc(env, p)	__atomic_inc(env, p)
+ #define atomic_dec(env, p)	__atomic_dec(env, p)
+diff --git a/src/mp/mp_fget.c b/src/mp/mp_fget.c
+index 16de695..5159520 100644
+--- a/src/mp/mp_fget.c
++++ b/src/mp/mp_fget.c
+@@ -649,7 +649,7 @@ alloc:		/* Allocate a new buffer header and data space. */
+ 
+ 		/* Initialize enough so we can call __memp_bhfree. */
+ 		alloc_bhp->flags = 0;
+-		atomic_init(&alloc_bhp->ref, 1);
++		__db_atomic_init(&alloc_bhp->ref, 1);
+ #ifdef DIAGNOSTIC
+ 		if ((uintptr_t)alloc_bhp->buf & (sizeof(size_t) - 1)) {
+ 			__db_errx(env, DB_STR("3025",
+@@ -955,7 +955,7 @@ alloc:		/* Allocate a new buffer header and data space. */
+ 			MVCC_MPROTECT(bhp->buf, mfp->pagesize,
+ 			    PROT_READ);
+ 
+-		atomic_init(&alloc_bhp->ref, 1);
++		__db_atomic_init(&alloc_bhp->ref, 1);
+ 		MUTEX_LOCK(env, alloc_bhp->mtx_buf);
+ 		alloc_bhp->priority = bhp->priority;
+ 		alloc_bhp->pgno = bhp->pgno;
+diff --git a/src/mp/mp_mvcc.c b/src/mp/mp_mvcc.c
+index 770bad8..dbce4f3 100644
+--- a/src/mp/mp_mvcc.c
++++ b/src/mp/mp_mvcc.c
+@@ -276,7 +276,7 @@ __memp_bh_freeze(dbmp, infop, hp, bhp, need_frozenp)
+ #else
+ 	memcpy(frozen_bhp, bhp, SSZA(BH, buf));
+ #endif
+-	atomic_init(&frozen_bhp->ref, 0);
++	__db_atomic_init(&frozen_bhp->ref, 0);
+ 	if (mutex != MUTEX_INVALID)
+ 		frozen_bhp->mtx_buf = mutex;
+ 	else if ((ret = __mutex_alloc(env, MTX_MPOOL_BH,
+@@ -428,7 +428,7 @@ __memp_bh_thaw(dbmp, infop, hp, frozen_bhp, alloc_bhp)
+ #endif
+ 		alloc_bhp->mtx_buf = mutex;
+ 		MUTEX_LOCK(env, alloc_bhp->mtx_buf);
+-		atomic_init(&alloc_bhp->ref, 1);
++		__db_atomic_init(&alloc_bhp->ref, 1);
+ 		F_CLR(alloc_bhp, BH_FROZEN);
+ 	}
+ 
+diff --git a/src/mp/mp_region.c b/src/mp/mp_region.c
+index 4952030..084f499 100644
+--- a/src/mp/mp_region.c
++++ b/src/mp/mp_region.c
+@@ -245,7 +245,7 @@ __memp_init(env, dbmp, reginfo_off, htab_buckets, max_nreg)
+ 			     MTX_MPOOL_FILE_BUCKET, 0, &htab[i].mtx_hash)) != 0)
+ 				return (ret);
+ 			SH_TAILQ_INIT(&htab[i].hash_bucket);
+-			atomic_init(&htab[i].hash_page_dirty, 0);
++			__db_atomic_init(&htab[i].hash_page_dirty, 0);
+ 		}
+ 
+ 		/*
+@@ -302,7 +302,7 @@ no_prealloc:
+ 		} else
+ 			hp->mtx_hash = mtx_base + (i % dbenv->mp_mtxcount);
+ 		SH_TAILQ_INIT(&hp->hash_bucket);
+-		atomic_init(&hp->hash_page_dirty, 0);
++		__db_atomic_init(&hp->hash_page_dirty, 0);
+ #ifdef HAVE_STATISTICS
+ 		hp->hash_io_wait = 0;
+ 		hp->hash_frozen = hp->hash_thawed = hp->hash_frozen_freed = 0;
+diff --git a/src/mutex/mut_method.c b/src/mutex/mut_method.c
+index 09353b0..3c954b9 100644
+--- a/src/mutex/mut_method.c
++++ b/src/mutex/mut_method.c
+@@ -474,7 +474,7 @@ atomic_compare_exchange(env, v, oldval, newval)
+ 	MUTEX_LOCK(env, mtx);
+ 	ret = atomic_read(v) == oldval;
+ 	if (ret)
+-		atomic_init(v, newval);
++		__db_atomic_init(v, newval);
+ 	MUTEX_UNLOCK(env, mtx);
+ 
+ 	return (ret);
+diff --git a/src/mutex/mut_tas.c b/src/mutex/mut_tas.c
+index 106b161..5a3b033 100644
+--- a/src/mutex/mut_tas.c
++++ b/src/mutex/mut_tas.c
+@@ -47,7 +47,7 @@ __db_tas_mutex_init(env, mutex, flags)
+ 
+ #ifdef HAVE_SHARED_LATCHES
+ 	if (F_ISSET(mutexp, DB_MUTEX_SHARED))
+-		atomic_init(&mutexp->sharecount, 0);
++		__db_atomic_init(&mutexp->sharecount, 0);
+ 	else
+ #endif
+ 	if (MUTEX_INIT(&mutexp->tas)) {
+@@ -536,7 +536,7 @@ __db_tas_mutex_unlock(env, mutex)
+ 			F_CLR(mutexp, DB_MUTEX_LOCKED);
+ 			/* Flush flag update before zeroing count */
+ 			MEMBAR_EXIT();
+-			atomic_init(&mutexp->sharecount, 0);
++			__db_atomic_init(&mutexp->sharecount, 0);
+ 		} else {
+ 			DB_ASSERT(env, sharecount > 0);
+ 			MEMBAR_EXIT();
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index b7ed2c798c..46536efe86 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://fix-parallel-build.patch \
             file://0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch \
             file://0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch \
             file://sequence-type.patch \
+            file://0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch \
            "
 # We are not interested in official latest 6.x versions;
 # let's track what debian is using.
-- 
2.20.1


