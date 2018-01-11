Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 748E77872A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8CFE820B31;
	Thu, 11 Jan 2018 15:02:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YzbanGNYODMV; Thu, 11 Jan 2018 15:02:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C9B92087C;
	Thu, 11 Jan 2018 15:02:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DFF5D16325F; Thu, 11 Jan 2018 10:02:07 -0500 (EST)
Date: Thu, 11 Jan 2018 10:02:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180111150207.GJ9657@denix.org>
References: <1515640552-54778-1-git-send-email-denis@denix.org>
	<1515681675.29722.118.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1515681675.29722.118.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: add flex-native explicit dependency
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
X-List-Received-Date: Thu, 11 Jan 2018 15:02:09 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jan 11, 2018 at 02:41:15PM +0000, Richard Purdie wrote:
> On Wed, 2018-01-10 at 22:15 -0500, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > It seems flex is required to build gcc:
> > 
> > > 
> > > .../work-shared/gcc-7.2.0-r0/gcc-7.2.0/missing: line 81: flex:
> > > command not found
> > > WARNING: 'flex' is missing on your system.
> > >          You should only need it if you modified a '.l' file.
> > >          You may want to install the Fast Lexical Analyzer package:
> > >          <http://flex.sourceforge.net/>
> > > Makefile:2799: recipe for target 'gengtype-lex.c' failed
> > > make[1]: [gengtype-lex.c] Error 127 (ignored)
> > Normally this is handled indirectly throught binutils-cross
> > dependency
> > pulling in flex-native implicitly. For deterministic builds, this
> > should
> > be specified explicitly.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-7.2.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-
> > devtools/gcc/gcc-7.2.inc
> > index 1d40cba..d1fb6de 100644
> > --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
> > @@ -10,7 +10,7 @@ BINV = "7.2.0"
> >  
> >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-
> > 7.2/backport:"
> >  
> > -DEPENDS =+ "mpfr gmp libmpc zlib"
> > +DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> >  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
> >  
> >  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> 
> Agreed, however I think we have bigger problems. I'm testing with this:
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 65f51430ee2..a5c4a73963e 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -921,6 +921,13 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
>      if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
>          return True
>  
> +
> +    if taskdependees[task][1] == 'do_populate_sysroot':
> +        if taskdependees[task][0] == "flex-native" or taskdependees[task][0] == "bison-native":
> +            #bb.warn("Skipping %s" % str(taskdependees[dep]))
> +            bb.warn("Skipping")
> +            return True
> +
>      # We only need to trigger packagedata through direct dependencies
>      # but need to preserve packagedata on packagedata links
>      if taskdependees[task][1] == "do_packagedata":
> 
> 
> and test results so far imply that we need:
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-devtools/gcc/gcc-7.2.inc
> index 1d40cba7317..90e4a990cb3 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
> @@ -11,7 +11,7 @@ BINV = "7.2.0"
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-7.2:${FILE_DIRNAME}/gcc-7.2/backport:"
>  
>  DEPENDS =+ "mpfr gmp libmpc zlib"
> -NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
> +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
>  
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>  
> 
> probably in addition to your patch. I'll continue to run some test
> builds and see how much breakage the above change shows up.

Thanks. I was building native gcc for the target, while using external 
prebuilt cross toolchain. I first tried adding flex-native to NATIVEDEPS 
list, but that didn't help - looks like this list is only used for cross and 
crosssdk builds.

-- 
Denys

