Return-Path: <rwmacleod@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id EC5346DD4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 16:32:32 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id t61so5533707wes.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tmurhvLJLWa8ICc93vprg4YKYoR3g9Ow/g0+FRKpwi8=;
	b=izSDNuUgfgS8fLOdlK9kWcpW19Z0cvP0wcXH3ZUt1Y0xx84bWQBzaXV36CwfGsVbqm
	qsX1X7FEK8UijEp7kMQweq2YfaVMqpWZa8omaeyUwnWbR5IzRoGGpW1wAKut3k8bivcz
	wLXSGIeL3BOP7/go7fZ0uMyAeOqcZEqXwOBPlFkVEVSf2j3BP92Rqh6TdjlFjrtwmMbs
	zF8kbaEv4+jo/PEkn0VdRaPWdV2pdQMbC1suAUOUWd3X0ri2p2/D8zUsmj0S5ZyXJe+v
	i4P2MaQEFk/dSfffm+GJRjJie7Dv/rfsqRBi7LDrHGEK8Z52gnR/TDwuvuZluuZYEt/k
	JJeg==
MIME-Version: 1.0
X-Received: by 10.180.187.175 with SMTP id ft15mr19049485wic.20.1385483551917; 
	Tue, 26 Nov 2013 08:32:31 -0800 (PST)
Received: by 10.194.28.195 with HTTP; Tue, 26 Nov 2013 08:32:31 -0800 (PST)
In-Reply-To: <1385455353-24032-1-git-send-email-jackie.huang@windriver.com>
References: <1385455353-24032-1-git-send-email-jackie.huang@windriver.com>
Date: Tue, 26 Nov 2013 11:32:31 -0500
Message-ID: <CAK6=ix6L7ihxhCn47OaB7Y0PdhNsfQROyvxw6bOgk-Ryb8KW2Q@mail.gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
To: jackie.huang@windriver.com, 
	"Gortmaker, Paul" <Paul.Gortmaker@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lsof: add contingency for when EGLIBCVERSION is not set
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
X-List-Received-Date: Tue, 26 Nov 2013 16:32:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

This change is not useful for oe-core.
I suppose it's being sent to be Yocto compliant and no merge is expected.

../Randy


On Tue, Nov 26, 2013 at 3:42 AM,  <jackie.huang@windriver.com> wrote:
> From: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> commit 8c38bc022de209187f31952ae02313dd3104f4c6 ("lsof: define
> linux C library type when using eglibc") tries to avoid the
> built in tests that determine EGLIBC version (since they
> are not reliable in cross builds) and handed in the EGLIBCVERSION
> directly.  However this is only happening if EGLIBCVERSION is
> set.  And that is only true if we are sourcing the include file
> meta/conf/distro/include/tcmode-default.inc  -- which we won't
> be with custom toolchain.  So we've been implicitly relying on
> the broken lsof tests.
>
> So, to ensure we don't end up using the broken lsof tests,
> add a contingency for the case where EGLIBCVERSION is not
> set.  This will be suitable for a single release, since
> the version will be unchanging.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  meta/recipes-extended/lsof/lsof_4.87.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-extended/lsof/lsof_4.87.bb b/meta/recipes-extended/lsof/lsof_4.87.bb
> index 5676cd9..582697b 100644
> --- a/meta/recipes-extended/lsof/lsof_4.87.bb
> +++ b/meta/recipes-extended/lsof/lsof_4.87.bb
> @@ -34,6 +34,9 @@ do_configure () {
>                  LINUX_CLIB=`echo ${EGLIBCVERSION} |sed -e 's,\.,,g'`
>                  LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
>                  export LINUX_CLIB
> +        else
> +                LINUX_CLIB="-DGLIBCV=215"
> +                export LINUX_CLIB
>          fi
>         yes | ./Configure ${LSOF_OS}
>  }
> --
> 1.8.3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
../Randy/..

