Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C645C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 07:57:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.25973.1657526268973209832
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 00:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cRi1/Pmu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6D286FF810;
	Mon, 11 Jul 2022 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657526267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VFbwl31MNlFIEOMywEOCBKzkPqhWn+eu1bijJs+Jgko=;
	b=cRi1/PmujXcHmZ1PTGK9smc+TYWjRgefcsTH6pJcHMZgUERMQbMr0ynH9phgZYCk5n9g15
	/N0Xx6z2s/9jmeproqaabrN49qldNZYveH+7HiPA0aSKI8v5Vb0Yp49btWAdRgT9jUoCFL
	7gGoGZMCMoLhDCjYYr54zcoJtTmBVZEXwGY5cJepcnMEtqLJKJl7lFQZToueeIcKlOBwd4
	2UQ+ps+NVkfv9WNjpxluaW8nwliqP9f0LShiFsot3MXViQTEoZmcaJAs0m4U1XfhBPiU/c
	xfreXXvYSPQ5ZFxu/hm6oQ5avQsNn1r9LHSgnwFJ57BNiHxaVgMLD4GuJHI24Q==
Date: Mon, 11 Jul 2022 09:57:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Morikazu Fumita <mfumita@electromag.com.au>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, preid@electromag.com.au
Subject: Re: [OE-core] [PATCH 1/1] gcc: Fixed libstdc++ configure failure
Message-ID: <YsvX+cK7gKUvKf1G@mail.local>
References: <20220708070350.23456-1-mfumita@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708070350.23456-1-mfumita@electromag.com.au>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 07:57:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167859

Hello,

On 08/07/2022 15:03:50+0800, Morikazu Fumita wrote:
> Since commit 34b0edb0d312 ("gcc: Drop stdlib++ option patch"), configure for libstdc++ failed due to ld error of "dummylib/libstdc++.so: file is empty".
> This failure caused _GLIBCXX_HAVE_S_ISREG not to get defined then make_file_type function in libstdc++-v3\src\filesystem\ops-common.h returns file_type::unknown unconditionally.
> Fixed by reverting commit 34b0edb0d312 ("gcc: Drop stdlib++ option patch").
> 
> Fixes: 34b0edb0d312 ("gcc: Drop stdlib++ option patch")

This doesn't apply since we updated master to gcc 12.1 back in april.
Can you rebase if this is still relevant?

Thanks!

> 
> Signed-off-by: Morikazu Fumita <mfumita@electromag.com.au>
> ---
>  meta/recipes-devtools/gcc/gcc-11.3.inc        |   2 +
>  meta/recipes-devtools/gcc/gcc-runtime.inc     |   8 +-
>  .../gcc/gcc/0005-optional-libstdc.patch       | 118 ++++++++++++++++++
>  3 files changed, 122 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
> index acbb43a25fb1..e6464d2f5489 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
> @@ -65,6 +65,8 @@ SRC_URI = "\
>             file://0003-CVE-2021-42574.patch \
>             file://0004-CVE-2021-42574.patch \
>             file://0001-CVE-2021-46195.patch \
> +           \
> +           file://0005-optional-libstdc.patch \
>  "
>  SRC_URI[sha256sum] = "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39"
>  
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index e9f2cf16e840..d2bdfa99db42 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -64,11 +64,7 @@ DEBUG_PREFIX_MAP:class-target = " \
>     "
>  
>  do_configure () {
> -	export CXX="${CXX} -nostdinc++ -L${WORKDIR}/dummylib"
> -	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
> -	# tests. Create a dummy empty lib for the purposes of configure.
> -	mkdir -p ${WORKDIR}/dummylib
> -	touch ${WORKDIR}/dummylib/libstdc++.so
> +	export CXX="${CXX} -nostdinc++ -nostdlib++"
>  	for d in libgcc ${RUNTIMETARGET}; do
>  		echo "Configuring $d"
>  		rm -rf ${B}/${TARGET_SYS}/$d/
> @@ -306,7 +302,7 @@ do_check() {
>      export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
>  
>      # HACK: this works around the configure setting CXX with -nostd* args
> -    sed -i 's#-nostdinc++ -L${WORKDIR}/dummylib##g' $(find ${B} -name testsuite_flags | head -1)
> +    sed -i 's/-nostdinc++ -nostdlib++//g' $(find ${B} -name testsuite_flags | head -1)
>  
>      if [ "${TOOLCHAIN_TEST_TARGET}" = "user" ]; then
>          # qemu user has issues allocating large amounts of memory
> diff --git a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
> new file mode 100644
> index 000000000000..b856c5dea367
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
> @@ -0,0 +1,118 @@
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Subject: [PATCH 3/5] gcc: Add --nostdlib++ option
> +
> +[gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
> +will not run correctly since by default the linker will try to link against libstdc++
> +which shouldn't exist yet. We need an option to disable -lstdc++
> +option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc
> +driver. This patch adds such an option which only disables the -lstdc++.]
> +
> +[A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to
> +do this officially, the likely answer is don't build libstdc++ separately.]
> +
> +OpenEmbedded/Yocto Project builds libgcc and the other gcc runtime libraries
> +separately from the compiler and slightly differently to the standard gcc build.
> +
> +In general this works well but in trying to build them separately we run into
> +an issue since we're using our gcc, not xgcc and there is no way to tell configure
> +to use libgcc but not look for libstdc++.
> +
> +This adds such an option allowing such configurations to work.
> +
> +2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +gcc/c-family/ChangeLog:
> +
> +    * c.opt: Add --nostdlib++ option
> +
> +gcc/cp/ChangeLog:
> +
> +    * g++spec.c (lang_specific_driver): Add --nostdlib++ option
> +
> +gcc/ChangeLog:
> +
> +    * doc/invoke.texi: Document --nostdlib++ option
> +    * gcc.c: Add --nostdlib++ option
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582724.html]
> +---
> + gcc/c-family/c.opt  | 4 ++++
> + gcc/cp/g++spec.c    | 1 +
> + gcc/doc/invoke.texi | 8 +++++++-
> + gcc/gcc.c           | 1 +
> + 4 files changed, 13 insertions(+), 1 deletion(-)
> +
> +Index: gcc-11.2.0/gcc/c-family/c.opt
> +===================================================================
> +--- gcc-11.2.0.orig/gcc/c-family/c.opt
> ++++ gcc-11.2.0/gcc/c-family/c.opt
> +@@ -2153,6 +2153,10 @@ nostdinc++
> + C++ ObjC++
> + Do not search standard system include directories for C++.
> + 
> ++nostdlib++
> ++Driver
> ++Do not link standard C++ runtime library
> ++
> + o
> + C ObjC C++ ObjC++ Joined Separate
> + ; Documented in common.opt
> +Index: gcc-11.2.0/gcc/cp/g++spec.c
> +===================================================================
> +--- gcc-11.2.0.orig/gcc/cp/g++spec.c
> ++++ gcc-11.2.0/gcc/cp/g++spec.c
> +@@ -159,6 +159,7 @@ lang_specific_driver (struct cl_decoded_
> +       switch (decoded_options[i].opt_index)
> + 	{
> + 	case OPT_nostdlib:
> ++	case OPT_nostdlib__:
> + 	case OPT_nodefaultlibs:
> + 	  library = -1;
> + 	  break;
> +Index: gcc-11.2.0/gcc/doc/invoke.texi
> +===================================================================
> +--- gcc-11.2.0.orig/gcc/doc/invoke.texi
> ++++ gcc-11.2.0/gcc/doc/invoke.texi
> +@@ -239,6 +239,7 @@ in the following sections.
> + -fno-weak  -nostdinc++ @gol
> + -fvisibility-inlines-hidden @gol
> + -fvisibility-ms-compat @gol
> ++-nostdlib++ @gol
> + -fext-numeric-literals @gol
> + -flang-info-include-translate@r{[}=@var{header}@r{]} @gol
> + -flang-info-include-translate-not @gol
> +@@ -632,7 +633,7 @@ Objective-C and Objective-C++ Dialects}.
> + -pie  -pthread  -r  -rdynamic @gol
> + -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
> + -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
> +--shared  -shared-libgcc  -symbolic @gol
> ++-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
> + -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> + -u @var{symbol}  -z @var{keyword}}
> + 
> +@@ -15721,6 +15722,11 @@ Specify that the program entry point is
> + interpreted by the linker; the GNU linker accepts either a symbol name
> + or an address.
> + 
> ++@item -nostdlib++
> ++@opindex nostdlib++
> ++Do not use the standard system C++ runtime libraries when linking.
> ++Only the libraries you specify will be passed to the linker.
> ++
> + @item -pie
> + @opindex pie
> + Produce a dynamically linked position independent executable on targets
> +Index: gcc-11.2.0/gcc/gcc.c
> +===================================================================
> +--- gcc-11.2.0.orig/gcc/gcc.c
> ++++ gcc-11.2.0/gcc/gcc.c
> +@@ -1162,6 +1162,7 @@ proper position among the other output f
> +     %(mflib) " STACK_SPLIT_SPEC "\
> +     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
> +     %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}}\
> ++    %{!nostdlib++:}\
> +     %{!nostdlib:%{!r:%{!nostartfiles:%E}}} %{T*}  \n%(post_link) }}}}}}"
> + #endif
> + 
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167815): https://lists.openembedded.org/g/openembedded-core/message/167815
> Mute This Topic: https://lists.openembedded.org/mt/92246725/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

