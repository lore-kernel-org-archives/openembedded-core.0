Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id B2EC4770AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 00:46:47 +0000 (UTC)
Received: by iodv82 with SMTP id v82so73945708iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 17:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VtC9+JNzKpFwUTHv5rh8MNLMI5TzgD4HSZeYFZpn6mc=;
	b=xKMCQVehcgqYafqLazWIh3lnAjVVdHfIRdYrVvQNYE51Kb0CcButvjKfbuN3qW02pC
	fXCMagrEllBlDDR5WlmALx6ZC0kkTg1PyHJnTECUY5TPxyqCt+TtJXdV1S6R1DGD8kmH
	SgnfQ0e/+H7oI9sIsX+7CPtDzB6G7lYkPXFL73QijylLNbqfFau14qC+H75SFrfHdHS+
	m5rRg3O5o8EXXaFzqoXWtiAlpZ1mNIN+5vB60sNfrJP46+KM1UjZXVWJwelucgeehUGd
	trxtq0Nh8leblQUUlZ5ycN6xj28LyEB6llqy3EHD0P0swvv6E6eT8qdDoWSL5CWCpErQ
	cgUA==
X-Received: by 10.107.34.149 with SMTP id i143mr8194349ioi.195.1444870007853; 
	Wed, 14 Oct 2015 17:46:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Wed, 14 Oct 2015 17:46:18 -0700 (PDT)
In-Reply-To: <1444869896-19673-1-git-send-email-raj.khem@gmail.com>
References: <1444869896-19673-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Oct 2015 17:46:18 -0700
Message-ID: <CAMKF1so2nvL+-WTA=0KazYOjBbFtdoc1cSuNv3GGTqnRaGbgjg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: Fix build with gcc5
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
X-List-Received-Date: Thu, 15 Oct 2015 00:46:50 -0000
Content-Type: text/plain; charset=UTF-8

please backport this to jethro as well. with out this uclibc images won't build.

On Wed, Oct 14, 2015 at 5:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> An agressive optimization in gcc5 meant that we get linking errors
> with uclibc build, this patch fixes the issue by letting gcc know
> that these funcitons are used.
>
> Change-Id: I8ecf3999a0855b3bbf4bc2df576be5351f9be5b0
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
>  ...zes-away-the-write-only-static-functions-.patch | 51 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
>
> diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
> index 14a577f..9e3d644 100644
> --- a/meta/recipes-core/uclibc/uclibc-git.inc
> +++ b/meta/recipes-core/uclibc/uclibc-git.inc
> @@ -16,5 +16,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
>          file://0005-Always-use-O2-for-compiling-fork.c.patch \
>          file://0006-ldso-limited-support-for-ORIGIN-in-rpath.patch \
>          file://0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
> +        file://0001-gcc5-optimizes-away-the-write-only-static-functions-.patch \
>  "
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch b/meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
> new file mode 100644
> index 0000000..e622f87
> --- /dev/null
> +++ b/meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
> @@ -0,0 +1,51 @@
> +From 2659fb25d32f4b29c1c96aa5730fe40e19d53ab0 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 14 Oct 2015 17:38:37 -0700
> +Subject: [PATCH] gcc5 optimizes away the write only static functions and we
> + end up with
> +
> +  librt/librt_so.a(rt-unwind-resume.oS): In function `_Unwind_Resume':
> +  rt-unwind-resume.c:(.text+0x3c): undefined reference to `libgcc_s_resume'
> +  collect2: error: ld returned 1 exit status
> +  make[2]: *** [lib/librt.so] Error 1
> +
> +marking these functions explicitly used with __attribute_used__ avoids
> +that optimization.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c | 2 +-
> + libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c       | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
> +index f4d6f41..0c2edd7 100644
> +--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
> ++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-forcedunwind.c
> +@@ -27,7 +27,7 @@
> + #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
> +
> + static void *libgcc_s_handle;
> +-static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
> ++static void (*libgcc_s_resume) (struct _Unwind_Exception *exc) __attribute_used__;
> + static _Unwind_Reason_Code (*libgcc_s_personality)
> +   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
> + static _Unwind_Reason_Code (*libgcc_s_forcedunwind)
> +diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
> +index f9a4ffb..f0c3047 100644
> +--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
> ++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/unwind-resume.c
> +@@ -25,7 +25,7 @@
> + #define __libc_dlclose          dlclose
> + #define __libc_fatal(x)         {/*write(STDERR_FILENO, x, strlen(x));*/ abort();}
> +
> +-static void (*libgcc_s_resume) (struct _Unwind_Exception *exc);
> ++static void (*libgcc_s_resume) (struct _Unwind_Exception *exc) __attribute_used__;
> + static _Unwind_Reason_Code (*libgcc_s_personality)
> +   (_Unwind_State, struct _Unwind_Exception *, struct _Unwind_Context *);
> +
> +--
> +2.6.1
> +
> --
> 2.6.1
>

