Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD23965CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 07:52:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t677qvVm014891
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 00:52:57 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 00:52:56 -0700
Message-ID: <559B8557.3040803@windriver.com>
Date: Tue, 7 Jul 2015 15:52:55 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1436255038-22106-1-git-send-email-zhixiong.chi@windriver.com>
In-Reply-To: <1436255038-22106-1-git-send-email-zhixiong.chi@windriver.com>
Subject: Re: [PATCH] db: add debug_lock option to show diagnostic info
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
X-List-Received-Date: Tue, 07 Jul 2015 07:52:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/07/2015 03:43 PM, Zhixiong Chi wrote:
> Add debug_lock option to show lock diagnostic information instead of
> outputing directly.
> We can enable it with using "./configure ... --enable-debug_lock".
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>   .../db/db/db-add-debug-lock-option.patch           | 144 +++++++++++++++++++++
>   meta/recipes-support/db/db_6.0.30.bb               |   1 +
>   2 files changed, 145 insertions(+)
>   create mode 100644 meta/recipes-support/db/db/db-add-debug-lock-option.patch
>
> diff --git a/meta/recipes-support/db/db/db-add-debug-lock-option.patch b/meta/recipes-support/db/db/db-add-debug-lock-option.patch
> new file mode 100644
> index 0000000..dff6642
> --- /dev/null
> +++ b/meta/recipes-support/db/db/db-add-debug-lock-option.patch
> @@ -0,0 +1,144 @@
> +Index: db-6.0.30/dist/config.hin
> +===================================================================
> +--- db-6.0.30.orig/dist/config.hin	2015-07-07 15:25:16.737736844 +0800
> ++++ db-6.0.30/dist/config.hin	2015-07-07 15:31:44.097735878 +0800

Missing Upstream-Status and SOB (Signed off by).

// Robert

> +@@ -21,6 +21,9 @@
> + /* Define to 1 if you want a version that logs write operations. */
> + #undef DEBUG_WOP
> +
> ++/* Define to 1 if you want a version that logs write/read lock operations. */
> ++#undef DEBUG_LOCK
> ++
> + /* Define to 1 if you want a version with run-time diagnostic checking. */
> + #undef DIAGNOSTIC
> +
> +Index: db-6.0.30/dist/configure
> +===================================================================
> +--- db-6.0.30.orig/dist/configure	2015-07-07 15:25:16.737736844 +0800
> ++++ db-6.0.30/dist/configure	2015-07-07 15:34:45.841735425 +0800
> +@@ -862,6 +862,7 @@
> + enable_debug
> + enable_debug_rop
> + enable_debug_wop
> ++enable_debug_lock
> + enable_diagnostic
> + enable_dump185
> + enable_java
> +@@ -1556,6 +1557,7 @@
> +   --enable-debug          Build a debugging version.
> +   --enable-debug_rop      Build a version that logs read operations.
> +   --enable-debug_wop      Build a version that logs write operations.
> ++  --enable-debug_lock     Build a version that logs write/read lock operations.
> +   --enable-diagnostic     Build a version with run-time diagnostics.
> +   --enable-dump185        Build db_dump185(1) to dump 1.85 databases.
> +   --enable-java           Build Java API.
> +@@ -3323,6 +3325,18 @@
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $db_cv_debug_wop" >&5
> + $as_echo "$db_cv_debug_wop" >&6; }
> +
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if --enable-debug_lock option specified" >&5
> ++$as_echo_n "checking if --enable-debug_lock option specified... " >&6; }
> ++# Check whether --enable-debug_lock was given.
> ++if test "${enable_debug_lock+set}" = set; then :
> ++  enableval=$enable_debug_lock; db_cv_debug_lock="$enable_debug_lock"
> ++else
> ++  db_cv_debug_lock="no"
> ++fi
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $db_cv_debug_lock" >&5
> ++$as_echo "$db_cv_debug_lock" >&6; }
> ++
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking if --enable-diagnostic option specified" >&5
> + $as_echo_n "checking if --enable-diagnostic option specified... " >&6; }
> + # Check whether --enable-diagnostic was given.
> +@@ -3835,6 +3849,11 @@
> +
> +
> + fi
> ++if test "$db_cv_debug_lock" = "yes"; then
> ++       $as_echo "#define DEBUG_LOCK 1" >>confdefs.h
> ++
> ++
> ++fi
> + if test "$db_cv_umrw" = "yes"; then
> + 	$as_echo "#define UMRW 1" >>confdefs.h
> +
> +Index: db-6.0.30/dist/configure.ac
> +===================================================================
> +--- db-6.0.30.orig/dist/configure.ac	2015-07-07 15:25:16.737736844 +0800
> ++++ db-6.0.30/dist/configure.ac	2015-07-07 15:35:12.465735359 +0800
> +@@ -134,6 +134,11 @@
> + 	AH_TEMPLATE(DEBUG_WOP,
> +     [Define to 1 if you want a version that logs write operations.])
> + fi
> ++if test "$db_cv_debug_lock" = "yes"; then
> ++       AC_DEFINE(DEBUG_LOCK)
> ++       AH_TEMPLATE(DEBUG_LOCK,
> ++    [Define to 1 if you want a version that logs write/read lock operations.])
> ++fi
> + if test "$db_cv_umrw" = "yes"; then
> + 	AC_DEFINE(UMRW)
> + 	AH_TEMPLATE(UMRW,
> +Index: db-6.0.30/src/common/db_err.c
> +===================================================================
> +--- db-6.0.30.orig/src/common/db_err.c	2015-07-07 15:25:16.737736844 +0800
> ++++ db-6.0.30/src/common/db_err.c	2015-07-07 15:36:45.329735127 +0800
> +@@ -648,6 +648,32 @@
> + }
> +
> + /*
> ++ * __db_lock_msg --
> ++ *     Standard DB lock stat message routine.
> ++ *
> ++ * PUBLIC: void __db_lock_msg __P((const ENV *, const char *, ...))
> ++ * PUBLIC:    __attribute__ ((__format__ (__printf__, 2, 3)));
> ++ */
> ++void
> ++#ifdef STDC_HEADERS
> ++__db_lock_msg(const ENV *env, const char *fmt, ...)
> ++#else
> ++__db_lock_msg(env, fmt, va_alist)
> ++       const ENV *env;
> ++       const char *fmt;
> ++       va_dcl
> ++#endif
> ++{
> ++       DB_ENV *dbenv;
> ++
> ++       dbenv = env == NULL ? NULL : env->dbenv;
> ++#if defined(DEBUG_LOCK)
> ++       DB_REAL_MSG(dbenv, fmt);
> ++#endif
> ++}
> ++
> ++
> ++/*
> +  * __db_repmsg --
> +  *	Replication system message routine.
> +  *
> +Index: db-6.0.30/src/lock/lock_failchk.c
> +===================================================================
> +--- db-6.0.30.orig/src/lock/lock_failchk.c	2015-07-07 15:25:16.737736844 +0800
> ++++ db-6.0.30/src/lock/lock_failchk.c	2015-07-07 15:37:03.169735082 +0800
> +@@ -80,7 +80,7 @@
> + 			 * Discard the locker and its read locks.
> + 			 */
> + 			if (!SH_LIST_EMPTY(&lip->heldby)) {
> +-				__db_msg(env, DB_STR_A("2053",
> ++				__db_lock_msg(env, DB_STR_A("2053",
> + 				    "Freeing read locks for locker %#lx: %s",
> + 				    "%#lx %s"), (u_long)lip->id,
> + 				    dbenv->thread_id_string(
> +Index: db-6.0.30/src/mutex/mut_failchk.c
> +===================================================================
> +--- db-6.0.30.orig/src/mutex/mut_failchk.c	2015-07-07 15:25:16.737736844 +0800
> ++++ db-6.0.30/src/mutex/mut_failchk.c	2015-07-07 15:37:30.897735013 +0800
> +@@ -60,7 +60,7 @@
> + 		    dbenv, mutexp->pid, unused, DB_MUTEX_PROCESS_ONLY))
> + 			continue;
> +
> +-		__db_msg(env, DB_STR_A("2017",
> ++		__db_lock_msg(env, DB_STR_A("2017",
> + 		    "Freeing mutex %lu for process: %s", "%lu %s"), (u_long)i,
> + 		    dbenv->thread_id_string(dbenv, mutexp->pid, unused, buf));
> +
> diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
> index 9eae5c7..c1f315c 100644
> --- a/meta/recipes-support/db/db_6.0.30.bb
> +++ b/meta/recipes-support/db/db_6.0.30.bb
> @@ -19,6 +19,7 @@ SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
>   SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
>               file://fix-parallel-build.patch \
>               file://Makefile-let-libso_target-depend-on-bt_rec.patch \
> +            file://db-add-debug-lock-option.patch \
>              "
>
>   SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
>

