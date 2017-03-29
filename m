Return-Path: <spopovyc@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6065B77BB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 10:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=9383; q=dns/txt; s=iport;
	t=1490782080; x=1491991680;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=vCztiazzQA682Ed2Vx7CwH3/YPEvzcOV7Y0eNP/kYSA=;
	b=Yzx5wNM3fnPEHTv8ewqF1PFs8iFPJ3DMNtFFyTDXCFtMfR2PY/AxOPX6
	uhEgawC3PZKxoRQAm2YMimxcU3V4xk4AYuRbHrUChyxEKCbiw1FT47wyL
	rC3Q9pBMSVXjm5sObOsDT99NibnOfc+5VNfNAmM8+DxR8prcMo7eg3MfH w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D/AACHhNtY/xbLJq1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBhDaBC41zc5BdjQ6GMYIPgg4ihgACg3MYAQIBAQEBAQEBayiFFQE?=
	=?us-ascii?q?BAQECAX4LCxEBAgECAS49DAYIBgEMBgIBAYl5BQiveIpKAQEBAQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBHYZOggWBQIEqijkBBIkehkN8hTOGUIZ9i1OCUI5jSJMiHziBBDo?=
	=?us-ascii?q?fFYUZHRmBTT01iTYBAQE?=
X-IronPort-AV: E=Sophos;i="5.36,240,1486425600"; d="scan'208";a="653598193"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2017 09:57:53 +0000
Received: from tuxracer.local ([10.61.216.184]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id v2T9vrVm009726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 29 Mar 2017 09:57:53 GMT
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <4713eca3e627fb1bececc59af252a0768c955d11.1490727266.git.spopovyc@cisco.com>
	<ec839388-19b4-5daa-d6fe-b9d5c5c9c054@gmail.com>
From: Serhii Popovych <spopovyc@cisco.com>
Message-ID: <858ef934-44d8-484c-319b-f94ab0733b79@cisco.com>
Date: Wed, 29 Mar 2017 12:57:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <ec839388-19b4-5daa-d6fe-b9d5c5c9c054@gmail.com>
X-Authenticated-User: spopovyc
Subject: Re: [PATCH] glibc: Support building with 2.6.32 kernels on x86 / x86_64
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
X-List-Received-Date: Wed, 29 Mar 2017 10:08:00 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


> 
> 
> On 3/28/17 11:57 AM, Serhii Popovych wrote:
>> While glibc states that 2.6.32 kernels still supported
>> for x86 / x86_64 builds are failing due to out of date
>> LIBC_LINUX_VERSION macro checks for such architectures.
>>
>> This macro statically defined to 3.2.0 with commit 5b4ecd3
>> (Require Linux 3.2 except on x86 / x86_64, 3.2 headers everywhere.)
>> and additionally checked before --enable-kernel.
>>
>> Since both --enable-kernel and LIBC_LINUX_VERSION checks
>> are the same and there is no users of last one we can
>> safely get rid of it enabling glibc builds with 2.6.32
>> kernel headers.
>>
>> Also add --enable-kernel to glibc-initial build so that we
>> build it correctly with old headers.
>>
>> Cc: XE-Linux <xe-linux-external@cisco.com>
>> Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
>> ---
>>  meta/recipes-core/glibc/glibc-initial.inc          |   1 +
>>  .../glibc/0028-Kill-LIBC_LINUX_VERSION-macro.patch | 113 +++++++++++++++++++++
>>  meta/recipes-core/glibc/glibc_2.25.bb              |   1 +
>>  3 files changed, 115 insertions(+)
>>  create mode 100644 meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_VERSION-macro.patch
>>
>> diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
>> index f94603c..60b25dd 100644
>> --- a/meta/recipes-core/glibc/glibc-initial.inc
>> +++ b/meta/recipes-core/glibc/glibc-initial.inc
>> @@ -12,6 +12,7 @@ do_configure () {
>>  	find ${S} -name "configure" | xargs touch
>>  	cfgscript=`python3 -c "import os; print(os.path.relpath('${S}', '.'))"`/configure
>>  	$cfgscript --host=${TARGET_SYS} --build=${BUILD_SYS} \
>> +		--enable-kernel=${OLDEST_KERNEL} \
>>  		--prefix=/usr \
>>  		--without-cvs --disable-sanity-checks \
>>  		--with-headers=${STAGING_DIR_TARGET}${includedir} \
>> diff --git a/meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_VERSION-macro.patch b/meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_VERSION-macro.patch
>> new file mode 100644
>> index 0000000..f5eaf1c
>> --- /dev/null
>> +++ b/meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_VERSION-macro.patch
>> @@ -0,0 +1,113 @@
>> +From 88f83e4b5a8929dac9095ed264700fcb62d5e4dd Mon Sep 17 00:00:00 2001
>> +From: Serhii Popovych <spopovyc@cisco.com>
>> +Date: Fri, 17 Mar 2017 15:48:34 +0000
>> +Subject: Kill LIBC_LINUX_VERSION macro
>> +
>> +After commit 5b4ecd3 (Require Linux 3.2 except on x86 / x86_64,
>> +3.2 headers everywhere.) minimal kernel version raised from
>> +2.6.32 to 3.2.0 for all architectures except x86 and x86_64
>> +unless newer already used for architecture.
>> +
>> +However LIBC_LINUX_VERSION macro still is in effect and fails
>> +configure even with --enable-kernel=2.6.32.
>> +
>> +While it is present in configure.ac it does not affect anything
>> +except LINUX_VERSION_CODE check which already performed by
>> +--enable-kernel.
>> +
> 
> --enable-kernel is forces the minimum kernel for glibc to configure for
> kernel interfaces if not set it defaults to arch specific value but it
> wont check for version of linux headers during compile time. Whereas
> this check is checking and errors out during build time if minimum
> kernel version is not met.

But why in configure.ac
define([LIBC_LINUX_VERSION],[3.2.0])
sets to version 3.2.0?

and then AC_TRY_COMPILE() sets libc_cv_linuxVER='missing or too old!'
causing configure to fail due to missing kheaders >= 3.2.0, not 2.6.32.

Later in configure.ac I see minimum_kernel being checked with
AC_TRY_COMPILE() and same code as for LIBC_LINUX_VERSION.

So we check for 3.2.0 and then check for minimum_kernel (--enable-
kernel) 2.6.32 after this?


> If you were to make the LIBC_LINUX_VERSION
> have a value that matches the arch_minimum_kernel version that would be
> an improvement.

configure.ac (and thus configure) is only place where
LIBC_LINUX_VERSION is used, so I decided to remove it as remnant from
pre --enable-kernel option ages.

> 
> As such if you want to do quick fix then lower the value of
> LIBC_LINUX_VERSION to 2.6.32 when building for x86/x86_64, we can accept
> such a patch with a bit less happiness.

I do not want to get quick fix. I want to find way to fix it right.

Thanks.

> 
> 
>> +Upstream-Status: Pending
>> +Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
>> +---
>> + sysdeps/unix/sysv/linux/configure    | 39 ------------------------------------
>> + sysdeps/unix/sysv/linux/configure.ac | 21 -------------------
>> + 2 files changed, 60 deletions(-)
>> +
>> +diff --git a/sysdeps/unix/sysv/linux/configure b/sysdeps/unix/sysv/linux/configure
>> +index cace758..ab5fabe 100644
>> +--- a/sysdeps/unix/sysv/linux/configure
>> ++++ b/sysdeps/unix/sysv/linux/configure
>> +@@ -6,45 +6,6 @@ if test -n "$sysheaders"; then
>> +   CPPFLAGS="$CPPFLAGS $SYSINCLUDES"
>> + fi
>> + 
>> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking installed Linux kernel header files" >&5
>> +-$as_echo_n "checking installed Linux kernel header files... " >&6; }
>> +-if ${libc_cv_linux320+:} false; then :
>> +-  $as_echo_n "(cached) " >&6
>> +-else
>> +-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>> +-/* end confdefs.h.  */
>> +-#include <linux/version.h>
>> +-#if !defined LINUX_VERSION_CODE || LINUX_VERSION_CODE <  (3 *65536+ 2 *256+ 0) /* 3.2.0 */
>> +-# error kernel headers missing or too old
>> +-#endif
>> +-int
>> +-main ()
>> +-{
>> +-
>> +-  ;
>> +-  return 0;
>> +-}
>> +-_ACEOF
>> +-if ac_fn_c_try_compile "$LINENO"; then :
>> +-  libc_cv_linux320='3.2.0 or later'
>> +-else
>> +-  libc_cv_linux320='missing or too old!'
>> +-fi
>> +-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
>> +-fi
>> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_linux320" >&5
>> +-$as_echo "$libc_cv_linux320" >&6; }
>> +-if test "$libc_cv_linux320" != '3.2.0 or later'; then
>> +-  as_fn_error $? "GNU libc requires kernel header files from
>> +-Linux 3.2.0 or later to be installed before configuring.
>> +-The kernel header files are found usually in /usr/include/asm and
>> +-/usr/include/linux; make sure these directories use files from
>> +-Linux 3.2.0 or later.  This check uses <linux/version.h>, so
>> +-make sure that file was built correctly when installing the kernel header
>> +-files.  To use kernel headers not from /usr/include/linux, use the
>> +-configure option --with-headers." "$LINENO" 5
>> +-fi
>> +-
>> + # If the user gave a minimal version number test whether the available
>> + # kernel headers are young enough.  Additionally we have minimal
>> + # kernel versions for some architectures.  If a previous configure fragment
>> +diff --git a/sysdeps/unix/sysv/linux/configure.ac b/sysdeps/unix/sysv/linux/configure.ac
>> +index 13abda0..5b47db5 100644
>> +--- a/sysdeps/unix/sysv/linux/configure.ac
>> ++++ b/sysdeps/unix/sysv/linux/configure.ac
>> +@@ -1,31 +1,10 @@
>> + GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
>> + # Local configure fragment for sysdeps/unix/sysv/linux.
>> + 
>> +-define([LIBC_LINUX_VERSION],[3.2.0])dnl
>> + if test -n "$sysheaders"; then
>> +   OLD_CPPFLAGS=$CPPFLAGS
>> +   CPPFLAGS="$CPPFLAGS $SYSINCLUDES"
>> + fi
>> +-define([libc_cv_linuxVER], [libc_cv_linux]patsubst(LIBC_LINUX_VERSION,[\.]))dnl
>> +-AC_CACHE_CHECK(installed Linux kernel header files, libc_cv_linuxVER, [dnl
>> +-AC_TRY_COMPILE([#include <linux/version.h>
>> +-#if !defined LINUX_VERSION_CODE || LINUX_VERSION_CODE < ]dnl
>> +-patsubst(LIBC_LINUX_VERSION,[^\([^.]*\)\.\([^.]*\)\.\([^.]*\)$],dnl
>> +-[ (\1 *65536+ \2 *256+ \3) /* \1.\2.\3 */])[
>> +-# error kernel headers missing or too old
>> +-#endif], [],
>> +-	       [libc_cv_linuxVER='LIBC_LINUX_VERSION or later'],
>> +-	       [libc_cv_linuxVER='missing or too old!'])])
>> +-if test "$libc_cv_linuxVER" != 'LIBC_LINUX_VERSION or later'; then
>> +-  AC_MSG_ERROR([GNU libc requires kernel header files from
>> +-Linux LIBC_LINUX_VERSION or later to be installed before configuring.
>> +-The kernel header files are found usually in /usr/include/asm and
>> +-/usr/include/linux; make sure these directories use files from
>> +-Linux LIBC_LINUX_VERSION or later.  This check uses <linux/version.h>, so
>> +-make sure that file was built correctly when installing the kernel header
>> +-files.  To use kernel headers not from /usr/include/linux, use the
>> +-configure option --with-headers.])
>> +-fi
>> + 
>> + # If the user gave a minimal version number test whether the available
>> + # kernel headers are young enough.  Additionally we have minimal
>> +-- 
>> +2.7.4
>> +
>> diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
>> index cf9c4f7..869d023 100644
>> --- a/meta/recipes-core/glibc/glibc_2.25.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.25.bb
>> @@ -42,6 +42,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>>             file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
>>             file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
>> +           file://0028-Kill-LIBC_LINUX_VERSION-macro.patch \
>>  "
>>  
>>  NATIVESDKFIXES ?= ""
>>
> 

