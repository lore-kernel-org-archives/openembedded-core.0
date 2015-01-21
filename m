Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2E171633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 20:49:04 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id fb1so20750511pad.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 12:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Gt8OQCxabWhaJCB7uvtffm8luVe+Zm9rNuSur0ClK0o=;
	b=S82zdM+g1f2paGrH4Wj7p4FdvIQ1N5MSYxrs0z9WY+caHq4/usDhHlw9btBEHJHg6X
	3GAMfK39G4+92RdVd3JegvQ3q7L+sw1KZcgzU5c36rDvJubMKmnwhNzO8BfK13zG65bq
	/YUARWJcGJq2iGffXwH/8PVlvn+5neih2ciiZ72L6BglROvuenVTLOtyRPqOMdmCtHOa
	NNKIbWOpMr65qI4O6IVszvpoV3AsYllPJQfQQdf8pX/XwrtrvZTzU/o9mjly9MWPfbbl
	BnydFnysIQ1QQXwqgnq/1zUO7otL+LCKXubfsvwUxgIi6pC2i3uKUsAR50lQoXQ9x6lX
	IiRQ==
X-Received: by 10.68.135.168 with SMTP id pt8mr65925767pbb.150.1421873344719; 
	Wed, 21 Jan 2015 12:49:04 -0800 (PST)
Received: from [10.22.9.58] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id fs1sm3957402pdb.16.2015.01.21.12.49.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Jan 2015 12:49:03 -0800 (PST)
Message-ID: <54C010BD.30904@gmail.com>
Date: Wed, 21 Jan 2015 12:49:01 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1421860276.git.paul.eggleton@linux.intel.com>
	<c452114d4c6cb205336bc729d3fc2f57fd821bab.1421860276.git.paul.eggleton@linux.intel.com>
In-Reply-To: <c452114d4c6cb205336bc729d3fc2f57fd821bab.1421860276.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] gcc: ensure target gcc headers can be included
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
X-List-Received-Date: Wed, 21 Jan 2015 20:49:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Is this needed for dizzy ?

- Armin

On 01/21/2015 09:14 AM, Paul Eggleton wrote:
> There are a few headers installed as part of gcc-runtime (omp.h,
> ssp/*.h). Being installed from a recipe built for the target
> architecture, these are within the target sysroot and not
> cross/nativesdk; thus they weren't able to be found by gcc with the
> existing search paths. Add support for picking up these headers
> under the sysroot supplied on the gcc command line in order to
> resolve this.
>
> Thanks to Richard Purdie for giving me a number of pointers during
> fixing this issue.
>
> Fixes [YOCTO #7141].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
>   .../gcc/gcc-4.9/target-gcc-includedir.patch        | 81 ++++++++++++++++++++++
>   2 files changed, 82 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 2568e99..0f407b7 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -74,6 +74,7 @@ SRC_URI = "\
>       file://0057-aarch64-config.patch \
>       file://0058-gcc-r212171.patch \
>       file://0059-gcc-PR-rtl-optimization-63348.patch \
> +    file://target-gcc-includedir.patch \
>   "
>   SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
>   SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch b/meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch
> new file mode 100644
> index 0000000..f48c66d
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch
> @@ -0,0 +1,81 @@
> +Ensure target gcc headers can be included
> +
> +There are a few headers installed as part of the OpenEmbedded
> +gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> +built for the target architecture, these are within the target
> +sysroot and not cross/nativesdk; thus they weren't able to be
> +found by gcc with the existing search paths. Add support for
> +picking up these headers under the sysroot supplied on the gcc
> +command line in order to resolve this.
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +
> +Upstream-Status: Pending
> +
> +--- a/gcc/Makefile.in	2014-12-23 11:57:33.327873331 +0000
> ++++ b/gcc/Makefile.in	2015-01-21 11:32:35.447305394 +0000
> +@@ -587,6 +587,7 @@
> +
> + # Directory in which the compiler finds libraries etc.
> + libsubdir = $(libdir)/gcc/$(target_noncanonical)/$(version)
> ++libsubdir_target = gcc/$(target_noncanonical)/$(version)
> + # Directory in which the compiler finds executables
> + libexecsubdir = $(libexecdir)/gcc/$(target_noncanonical)/$(version)
> + # Directory in which all plugin resources are installed
> +@@ -2534,6 +2535,7 @@
> +
> + PREPROCESSOR_DEFINES = \
> +   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
> ++  -DGCC_INCLUDE_SUBDIR_TARGET=\"$(libsubdir_target)/include\" \
> +   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
> +   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
> +   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
> +--- a/gcc/cppdefault.c	2015-01-13 17:40:26.131012725 +0000
> ++++ b/gcc/cppdefault.c	2015-01-21 11:30:08.928426492 +0000
> +@@ -59,6 +59,10 @@
> +     /* This is the dir for gcc's private headers.  */
> +     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> + #endif
> ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
> ++    /* This is the dir for gcc's private headers under the specified sysroot.  */
> ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
> ++#endif
> + #ifdef LOCAL_INCLUDE_DIR
> +     /* /usr/local/include comes before the fixincluded header files.  */
> +     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> +diff --git a/gcc/defaults.h b/gcc/defaults.h
> +index f94ae17..d98b40b 100644
> +--- a/gcc/defaults.h
> ++++ b/gcc/defaults.h
> +@@ -1390,4 +1390,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
> +
> + #endif /* GCC_INSN_FLAGS_H  */
> +
> ++/* Default prefixes to attach to command names.  */
> ++
> ++#ifndef STANDARD_STARTFILE_PREFIX_1
> ++#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> ++#endif
> ++#ifndef STANDARD_STARTFILE_PREFIX_2
> ++#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> ++#endif
> ++
> + #endif  /* ! GCC_DEFAULTS_H */
> +diff --git a/gcc/gcc.c b/gcc/gcc.c
> +index 9f0b781..174fca8 100644
> +--- a/gcc/gcc.c
> ++++ b/gcc/gcc.c
> +@@ -1189,13 +1189,6 @@ static const char *gcc_libexec_prefix;
> +
> + /* Default prefixes to attach to command names.  */
> +
> +-#ifndef STANDARD_STARTFILE_PREFIX_1
> +-#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> +-#endif
> +-#ifndef STANDARD_STARTFILE_PREFIX_2
> +-#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> +-#endif
> +-
> + #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cross compiler.  */
> + #undef MD_EXEC_PREFIX
> + #undef MD_STARTFILE_PREFIX
>

