Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id A0A3E6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:39:41 +0000 (UTC)
Received: by obbop1 with SMTP id op1so188057088obb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 02:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gB8VuKwlZ0xwOuFrUEIZssJMom4NSdRFaSgp5e3tBjQ=;
	b=XEoDJbZGNPK93NxFxYfGlrfHC0r8h+skAJQaQT4VTE24Fk9lSIc0xR3dK7kHn40c2Y
	wgpZGuij+TxebnOz7k1ciRmDt6hG21rTDUfg9Ow+jGpEN4Hy0UxDhoBYdoZvR97lnI2d
	G3gsBohQMjdm/zP985HhNP+HAvZhFBc4OVCGjwuRlSUFGAu3ZttkqxgniR6KJ3DLjyoQ
	/HPIh7cafA8nbDWzCVgjN5Fljg+/bVeGxoWCRIeTkEwOGb/MY3zFkGSTE9cqyIsUv7Ye
	1QBw4nAERrQtoLLlF/f4HqBrBhJvFa6svuoi/dUC3ow+a2sjdJCU/Wlai1kV/FciTYiK
	8NWA==
X-Gm-Message-State: ALoCoQmfnIYr6pzPCzP7TJJr8H2YYPLX0mhXkx2MfWH7DQpjHBtfXzezD7tMvwt2caaRWdFQfB4M
X-Received: by 10.202.77.208 with SMTP id a199mr17799234oib.32.1436521181994; 
	Fri, 10 Jul 2015 02:39:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Fri, 10 Jul 2015 02:39:12 -0700 (PDT)
In-Reply-To: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
References: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 10 Jul 2015 12:39:12 +0300
Message-ID: <CAHiDW_FxgLz638LwPen_AfOByHeCpvL6A093PjrmGD4X=P-xNQ@mail.gmail.com>
To: rongqing.li@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][resend] perl: fix build failure if building dir has the "blib" string
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
X-List-Received-Date: Fri, 10 Jul 2015 09:39:42 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2015 at 11:54,  <rongqing.li@windriver.com> wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> If build dir includes the string "blib", filter it out from @INC may empty
> the @INC and cause build errors like:
>
>   Can't locate ExtUtils/MakeMaker.pm in @INC \
>   (you may need to install the ExtUtils::MakeMaker module) \
>   (@INC contains: .) at Makefile.PL

The grep certainly looks overly zealous, but surely upstream has a
reason for having this code... If you're going to remove the code
altogether, you should mention why those original reasons do not apply
here.

Jussi

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl-native_5.22.0.bb   |  1 +
>  ...-PathTools-don-t-filter-out-blib-from-INC.patch | 33 ++++++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.22.0.bb          |  1 +
>  3 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
>
> diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
> index dbcf2a6..a9a1cab 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
> @@ -8,6 +8,7 @@ SRC_URI += "\
>             file://MM_Unix.pm.patch \
>             file://debian/errno_ver.diff \
>             file://dynaloaderhack.patch \
> +           file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
>            "
>
>  SRC_URI[md5sum] = "ff0f09b17de426eff323426cb140ee79"
> diff --git a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
> new file mode 100644
> index 0000000..7dd9041
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
> @@ -0,0 +1,33 @@
> +From 90c252cecc38aed5d5faedb30485dd6eee2e54eb Mon Sep 17 00:00:00 2001
> +From: Wenzong Fan <wenzong.fan@windriver.com>
> +Date: Wed, 11 Feb 2015 15:14:40 +0800
> +Subject: [PATCH] perl / PathTools: don't filter out blib from @INC
> +
> +If $TOPDIR includes the string "blib", filter it out from @INC may empty
> +the @INC and cause build errors like:
> +
> +  Can't locate ExtUtils/MakeMaker.pm in @INC \
> +  (you may need to install the ExtUtils::MakeMaker module) \
> +  (@INC contains: .) at Makefile.PL
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +---
> + dist/PathTools/Makefile.PL | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/dist/PathTools/Makefile.PL b/dist/PathTools/Makefile.PL
> +index 1b21de4..f562cb2 100644
> +--- a/dist/PathTools/Makefile.PL
> ++++ b/dist/PathTools/Makefile.PL
> +@@ -1,6 +1,3 @@
> +-
> +-BEGIN { @INC = grep {!/blib/} @INC }
> +-
> + require 5.005;
> + use ExtUtils::MakeMaker;
> + WriteMakefile
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
> index 050a98c..7f78998 100644
> --- a/meta/recipes-devtools/perl/perl_5.22.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
> @@ -61,6 +61,7 @@ SRC_URI += " \
>          file://t-run-switches.t-perl5-perl.patch \
>          file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
>          file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
> +        file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
>  "
>
>  # Fix test case issues
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

