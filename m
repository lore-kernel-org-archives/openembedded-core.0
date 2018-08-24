Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9A63C79493
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 08:06:26 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 93-v6so5350559qks.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 01:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4AABpotKdh2rgVewspq6TMlcrFhll3uwH2q0qAyX5Nk=;
	b=OdVsGA2K8+9TIYModP8VSusEiQSej83grgNalXNfXn2nM//RK2GOwxU9s6dO7+rcjX
	fc9T6OUAYvsUyiGYIDQlu8ksKt9Fo1hN32JNFvACSAlhkMlwdTsiBlOWdj3xLYCaBHZk
	trFxdI6mJj/Ikw/x24zfdQWU+VJpHwVCLz+bz1WWwigGXi7TaRzhZzedpe7lGGPNjPoE
	ZsRTOYCnl8I9wn4fMy7L9zbSUE7Ia4IdHjdUK2sbM0k9seB0Va+EoiLAuLxQXL9Lm4p2
	y/70Y9Y5ik4E+QdCdoAyE9EaJBnvrmsQOR+NsJxU4JazYKgbjk7mKDf9rcgeBtDcUqyN
	YPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4AABpotKdh2rgVewspq6TMlcrFhll3uwH2q0qAyX5Nk=;
	b=U4+cWeM4JPCP+bWntZtRjo+FHqzxmf1+BYqpOUMmV0zcc6cAueGKccEZFR/BO8lbF1
	joUffH/KzLQhK4+qfyi8Sy5q3sMvQ0WcrKNW3CpvGE/OX31xd41loA6XIgsRlgqhO2NH
	8iJ+NTxiSP14owCZ491MW8q540YFxgJh5cRdZyt2cTBP8QpR8kA5JCf6nZk+GIC342No
	lQXzCkd5YsCDXR1cAwkY54pH2SXXORcMCEMw9fVvygJ4uayCEoCUFrVXsynAW7I89YKd
	RaK8Z/YAYOzLB1j5UEV8pO8dlw/NEH3IwrU81YHSOjFZ7OuS3mAI7mSQKSetAlkt2SmA
	fPqw==
X-Gm-Message-State: APzg51AIcFs/NqGq+r9/ch0Sangrmb7pE4h4UX5WeEI5J/pH5E7U6gmQ
	bKkXMEHzjCMDV1JjHhk1lw2YySluvctXuYjdSc4=
X-Google-Smtp-Source: ANB0VdaDG/gZrb5t5FEkDlfelSZgjTLw0sk/7Qh4i7pBUfZ7LHJPzxu4y93TY0QESji6eR24sbD18N1jj+R6NPrgrfU=
X-Received: by 2002:a37:9904:: with SMTP id b4-v6mr586306qke.102.1535097987305;
	Fri, 24 Aug 2018 01:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180822090424.14573-1-sno@netbsd.org>
In-Reply-To: <20180822090424.14573-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 01:06:01 -0700
Message-ID: <CAMKF1sqva9eo1fB63z0bALmicnTCZhuv1zRW4De59nSsskZVbg@mail.gmail.com>
To: sno@netbsd.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cpan.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Fri, 24 Aug 2018 08:06:26 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Jens

This patch has been pushed but its causing several
recipes to break, I can confirm that with reverting this fix

Here is list

http://errors.yoctoproject.org/Errors/Build/66538/

IMO, this fix should be reverted and delayed until
these regressions are fixed.

On Wed, Aug 22, 2018 at 2:04 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> The modern the time, the improvements in ExtUtils::MakeMaker.
>
> Nowadays, .packlist and perllocal.pod aren't touched anymore when appropriate
> flags set during configure stage. Controlling the flags globally avoids
> dual-life recipes need share patching.
>
> Further: remove prepending ${PERL_ARCHLIB} in PERL5LIB - it's wrong (search
> order is site_lib, vendor_lib, core) - and ${PERL_ARCHLIB} contains core
> libpath only ...
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/cpan.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
> index 8e079e0d55..926c6358a6 100644
> --- a/meta/classes/cpan.bbclass
> +++ b/meta/classes/cpan.bbclass
> @@ -16,8 +16,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
>  export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
>
>  cpan_do_configure () {
> -       export PERL5LIB="${PERL_ARCHLIB}"
> -       yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor ${EXTRA_CPANFLAGS}
> +       yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 ${EXTRA_CPANFLAGS}
>
>         # Makefile.PLs can exit with success without generating a
>         # Makefile, e.g. in cases of missing configure time
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

