Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ab842b2db53d29b11298382f7c94b8ef903ea1f1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: upgrade 11.2 -> current 12 snapshot
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 07 Apr 2022 13:32:09 +0100
In-Reply-To: <20220407122638.2091583-1-bernhard.rosenkraenzer.ext@huawei.com>
References: <20220407122638.2091583-1-bernhard.rosenkraenzer.ext@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: bernhard.rosenkraenzer.ext@huawei.com, openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com

On Thu, 2022-04-07 at 14:26 +0200, Bernhard Rosenkränzer via
lists.openembedded.org wrote:
> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.0.bb
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index 3ffa1f0c46..0e8119384b 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -47,6 +47,15 @@ ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
>  do_configure:prepend () {
>  	install -d ${RECIPE_SYSROOT}${target_includedir}
>  	touch ${RECIPE_SYSROOT}${target_includedir}/limits.h
> +
> +	if ! echo ${@d.getVar("TARGET_OS")} | grep -qi linux; then
> +		# Building Zephyr with DWARF-5 is problematic because
> +		# its kernel tests use pyelftools, which has incomplete
> +		# DWARF-5 support (even after applying preliminary
> +		# support patches). Use DWARF-4 on Zephyr and FreeRTOS
> +		# for the time being.
> +		sed -i -e 's,Var(dwarf_version) Init(5),Var(dwarf_version) Init(4),' ${S}/gcc/common.opt
> +	fi
>  }
>  
>  do_compile () {

Unfortunately you can't do that. The gcc-cross is shared amongst all targets on
a given architecture. This will "kind of work" in that other sstate code will
clean it up and rebuild gcc but it isn't as designed and can't merge like that
I'm afraid.

Cheers,

Richard


