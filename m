Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF1777629
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 03:28:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0U3S6WI013760
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Jan 2018 19:28:06 -0800 (PST)
Received: from [128.224.163.220] (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 29 Jan 2018 19:28:05 -0800
To: Anders Roxell <anders.roxell@linaro.org>,
	<openembedded-core@lists.openembedded.org>
References: <1517235557-11980-1-git-send-email-anders.roxell@linaro.org>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <4ce0566d-24c8-f271-7154-f5d01c3b29c8@windriver.com>
Date: Tue, 30 Jan 2018 11:26:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1517235557-11980-1-git-send-email-anders.roxell@linaro.org>
X-Originating-IP: [128.224.163.220]
Subject: Re: [PATCH] ltp: bump to release 20180118
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
X-List-Received-Date: Tue, 30 Jan 2018 03:28:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2018年01月29日 22:19, Anders Roxell 写道:
> Removed 3 patches that have been upstreamed:
> - 0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> - 0037-ltp-fix-format-security-error.patch
> - 0038-generate-reproducible-gzip.patch

I'm also working on this these days.

The following patches can also be removed since the issues have been 
fixed upstream:
0001-add-_GNU_SOURCE-to-pec_listener.c.patch
0011-Rename-sigset-variable-to-sigset1.patch
0025-mc_gethost-include-sys-types.h.patch
0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch

>
> Reworked path 0002-Add-knob-to-control-whether-numa-support-should-be-c.patch.

I tested this patch but seems like it doesn't work.
Although --with-numa is passed to configure via PACKAGECONFIG="numa", it 
doesn't check numa headers and library, and doesn't link numa library 
when building.


//Yi

>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>   ...-control-whether-numa-support-should-be-c.patch | 39 +++++++++++-----------
>   ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch | 35 -------------------
>   .../ltp/0037-ltp-fix-format-security-error.patch   | 36 --------------------
>   .../ltp/ltp/0038-generate-reproducible-gzip.patch  | 20 -----------
>   .../ltp/{ltp_20170929.bb => ltp_20180118.bb}       |  5 +--
>   5 files changed, 21 insertions(+), 114 deletions(-)
>   delete mode 100644 meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
>   delete mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch
>   delete mode 100644 meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patch
>   rename meta/recipes-extended/ltp/{ltp_20170929.bb => ltp_20180118.bb} (95%)
>
> diff --git a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
> index 9865020..31460b9 100644
> --- a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
> +++ b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
> @@ -9,34 +9,35 @@ during build depending upong numa being staged or not
>   
>   Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>   Upstream-Status: Pending
>   ---
>    m4/ltp-numa.m4 | 10 +++++++++-
>    1 file changed, 9 insertions(+), 1 deletion(-)
>   
>   diff --git a/m4/ltp-numa.m4 b/m4/ltp-numa.m4
> -index 60ae07b..ed7078d 100644
> +index fc3383e..44cb559 100644
>   --- a/m4/ltp-numa.m4
>   +++ b/m4/ltp-numa.m4
> -@@ -24,7 +24,13 @@ dnl ----------------------------
> +@@ -24,7 +24,13 @@ dnl LTP_CHECK_SYSCALL_NUMA
> + dnl ----------------------------
>    dnl
> - AC_DEFUN([LTP_CHECK_SYSCALL_NUMA],
> - [dnl
> --AC_CHECK_HEADERS([linux/mempolicy.h numa.h numaif.h],[
> -+AC_MSG_CHECKING([for numa])
> -+AC_ARG_WITH(
> -+	[numa],
> -+	AC_HELP_STRING([--without-numa],
> -+	[without numa support]),
> -+	[],
> -+	[AC_CHECK_HEADERS([linux/mempolicy.h numa.h numaif.h],[
> - 	LTP_SYSCALL_NUMA_HEADERS=yes
> - 	AC_CHECK_LIB(numa,numa_alloc_onnode,[have_numa_alloc_onnode="yes"])
> - 	if  test "x$have_numa_alloc_onnode" = "xyes"; then
> -@@ -48,3 +54,5 @@ if test "x$have_mpol_constants" = "xyes"; then
> - 	AC_DEFINE(HAVE_MPOL_CONSTANTS,1,[define to 1 if you have all constants required to use mbind tests])
> - fi
> - )])
> + AC_DEFUN([LTP_CHECK_SYSCALL_NUMA], [
> +-	AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
> ++	AC_MSG_CHECKING([for numa])
> ++	AC_ARG_WITH(
> ++		[numa],
> ++		AC_HELP_STRING([--without-numa],
> ++		[without numa support]),
> ++		[],
> ++	[AC_CHECK_LIB(numa, numa_available, [have_libnuma=yes])
> + 	AC_CHECK_HEADERS([numa.h numaif.h], [], [have_numa_headers=no])
> +
> + 	if test "x$have_numa_headers" != "xno"; then
> +@@ -42,3 +48,5 @@ exit(1);
> + 		AC_DEFINE(HAVE_NUMA_V2, 1, [Define to 1 if you have libnuma and it's headers version >= 2 installed.])
> + 	fi
> + ])
>   +AC_MSG_RESULT([$with_numa])
>   +])
>   --
> diff --git a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> deleted file mode 100644
> index efa6d06..0000000
> --- a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 00ba7cdd0608b1507027428f9f87b1cb9747372b Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Thu, 9 Feb 2017 15:54:53 +0800
> -Subject: [PATCH] lib: Use PTHREAD_MUTEX_RECURSIVE in place of
> - PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP for non-glibc
> -
> -e.g. musl does not implement the _NP mutex types
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> -
> -Upstream-Status: Pending
> ----
> - lib/tst_res.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/lib/tst_res.c b/lib/tst_res.c
> -index 61daaeb..435224f 100644
> ---- a/lib/tst_res.c
> -+++ b/lib/tst_res.c
> -@@ -79,7 +79,11 @@ int TEST_ERRNO;
> - 	assert(strlen(buf) > 0);		\
> - } while (0)
> -
> -+#ifdef __GLIBC__
> - static pthread_mutex_t tmutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;
> -+#else
> -+static pthread_mutex_t tmutex = {  PTHREAD_MUTEX_RECURSIVE };
> -+#endif
> -
> - static void check_env(void);
> - static void tst_condense(int tnum, int ttype, const char *tmesg);
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch b/meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch
> deleted file mode 100644
> index 44d6990..0000000
> --- a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 8eb3e111ae1b89e5afb249cf984d657f94da2385 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Tue, 17 Oct 2017 05:42:47 -0400
> -Subject: [PATCH] ltp: fix format security error
> -
> -When enable option: -Werror=format-security, the error like:
> -
> -    | fcntl36.c: In function 'test_fn':
> -    | fcntl36.c:303:2: error: format not a string literal and no format arguments [-Werror=format-security]
> -    |   tst_res(TINFO, msg);
> -    |   ^~~~~~~
> -    | cc1: some warnings being treated as errors
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - testcases/kernel/syscalls/fcntl/fcntl36.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/kernel/syscalls/fcntl/fcntl36.c b/testcases/kernel/syscalls/fcntl/fcntl36.c
> -index 6f2eb6b..3246d13 100644
> ---- a/testcases/kernel/syscalls/fcntl/fcntl36.c
> -+++ b/testcases/kernel/syscalls/fcntl/fcntl36.c
> -@@ -300,7 +300,7 @@ static void test_fn(void *f0(void *), void *f1(void *),
> - 	struct param p2[thread_cnt];
> - 	unsigned char buf[write_size];
> -
> --	tst_res(TINFO, msg);
> -+	tst_res(TINFO, "%s", msg);
> -
> - 	if (tst_fill_file(fname, 1, write_size, thread_cnt + 1))
> - 		tst_brk(TBROK, "Failed to create tst file");
> ---
> -2.8.1
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patch b/meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patch
> deleted file mode 100644
> index 0153ace..0000000
> --- a/meta/recipes-extended/ltp/ltp/0038-generate-reproducible-gzip.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Do not generate timestamps in gzipped file headers.
> -The timestamps prevent reproducible build.
> -
> -Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/233]
> -
> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> -
> -diff --git a/testcases/network/generate.sh b/testcases/network/generate.sh
> -index 00216a6..939f792 100755
> ---- a/testcases/network/generate.sh
> -+++ b/testcases/network/generate.sh
> -@@ -55,7 +55,7 @@ fi
> - if [ ! -e "bin.sm" ] ; then
> - 	cnt=0
> - 	while [ $cnt -lt 5 ] ; do
> --		gzip -1 -c ascii.sm >> "bin.sm"
> -+		gzip -1 -c -n ascii.sm >> "bin.sm"
> - 		cnt=$(($cnt + 1))
> - 	done
> - fi
> diff --git a/meta/recipes-extended/ltp/ltp_20170929.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
> similarity index 95%
> rename from meta/recipes-extended/ltp/ltp_20170929.bb
> rename to meta/recipes-extended/ltp/ltp_20180118.bb
> index bc0ecdf..a4a2724 100644
> --- a/meta/recipes-extended/ltp/ltp_20170929.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180118.bb
> @@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "
>   EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>   CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>   CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "bac930f71b1e6786ebb8a894463503d07681ef6a"
> +SRCREV = "731cd34e682d297b207668be8b1d15320a9ac1b1"
>   
>   SRC_URI = "git://github.com/linux-test-project/ltp.git \
>              file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
> @@ -43,13 +43,10 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>              file://0026-crash01-Define-_GNU_SOURCE.patch \
>              file://0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch \
>              file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch \
> -           file://0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch \
>              file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
>              file://0034-periodic_output.patch \
>              file://0035-fix-test_proc_kill-hang.patch \
>              file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
> -           file://0037-ltp-fix-format-security-error.patch \
> -           file://0038-generate-reproducible-gzip.patch \
>              file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
>              "
>   


