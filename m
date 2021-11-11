Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F59C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 21:28:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6289.1636666136109022337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 13:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c9OFbtsC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so8382955wme.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rB8SxCBX+dszBTivjL6I4YB8WC5N0nkeLgWpA8TSe6c=;
        b=c9OFbtsCKjBFjTZNMrWiKZJPr+kUGtAzHw/+3DwRrBWKzpbNyBWKCiVnSksz01ltYZ
         sljBBi76FbRAyYAdAl2rsnFV1GvLUTOKMKOxqFqP5HgzHz0YvUrwJZUFRuH/ezzBBwcW
         6soQVKkJOGFMviYT6zh/CGYOyL5Cttm4olba0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rB8SxCBX+dszBTivjL6I4YB8WC5N0nkeLgWpA8TSe6c=;
        b=2h3tleUH3YJa3QfBrtBO0UIhVMTgauW9PeVUxD1rF825wBHz+DcXEc9BSD4f6l/xZL
         ysb6GvN7XAbSWIu8gSNvdcazZT1T7SNMeddEOuqI+BOMnfMD8LGACNA1ADH1doWSHujy
         GHmFb4eUkJdgHtDqeGOKiITC1Bo8rVyaFbRFGMIbm4Ce3l2j7dYjjyQwmHl7EAoItesU
         cdOLymhS3jtMvDJaYGSvJ6DBJF2Huh7fD9KJJM14AgA5LDMjvR8joyNpAumoD67Nh+5F
         O9VpEAeC8sbwRLvO9rxKB8h7sfXt6heSnAoSQMiTEq71b0gPBKRe1BNjPBx23heZO63h
         erbw==
X-Gm-Message-State: AOAM530I8qKSiM8YwpmAbkw0FCM985tO6rg1WkyQQwT52QRw6uw3FcOB
	csOBr9Th480vcNkLkP+p5JljlQ==
X-Google-Smtp-Source: 
 ABdhPJwktzYd4OnPwnj28tYLJLKeh2p+uiQhV5SJ8FrNcKvvF7a5ZrPUzls0XzwsRlG6iV7HNepudw==
X-Received: by 2002:a05:600c:2147:: with SMTP id
 v7mr874789wml.36.1636666134445;
        Thu, 11 Nov 2021 13:28:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0bd:72b4:105a:2914?
 ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id
 o4sm5068145wry.80.2021.11.11.13.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 13:28:53 -0800 (PST)
Message-ID: 
 <023667d47dfa5b3e08858b06596d15986cdc26c2.camel@linuxfoundation.org>
Subject: Re: [PATCH v4] glibc: ptest: Add running glibc time related test
 suite (Y2038) with ptest
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Lukasz Majewski <lukma@denx.de>
Cc: Nathan Rossi <nathan@nathanrossi.com>, Adhemerval Zanella
	 <adhemerval.zanella@linaro.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Lee Chee Yang <chee.yang.lee@intel.com>,
	Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Nov 2021 21:28:50 +0000
In-Reply-To: 
 <CAMKF1srQjFZ4DfGGVsV47SS0ma1LewE24Luwgtw-FwcCsOU_DQ@mail.gmail.com>
References: <20211109152851.8137-1-lukma@denx.de>
	 <CAMKF1srQjFZ4DfGGVsV47SS0ma1LewE24Luwgtw-FwcCsOU_DQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 21:28:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158201

On Thu, 2021-11-11 at 05:51 -0800, Khem Raj wrote:
> On Tue, Nov 9, 2021 at 7:29 AM Lukasz Majewski <lukma@denx.de> wrote:
> > 
> > This patch introduces new recipe - namely 'glibc-tests', which
> > builds and installs time related (to check if Y2038 support works) glibc
> > test suite to OE/Yocto built image.
> > 
> > It reuses code from already available 'glibc-testsuite' recipe,
> > which is run with 'bitbake glibc-testsuite -c check' and uses qemu
> > to execute remotely (via SSH) tests on some emulated machine.
> > 
> > This recipe installs time related glibc tests on some rootfs image.
> > Afterwards, those tests can be executed on the real hardware, to
> > facilitate validation of it with Y2038 problem compliance.
> > 
> > To test time related subset - one needs to call:
> > ptest-runner glibc-tests
> > then change the date after Y2038 threshold for 32 bit systems:
> > date -s "20 JAN 2038 18:00:00"
> > and then run ptest-runner again.
> > 
> > To facilitate debugging, source files are provided by default with
> > the unstripped debugging symbols. Such approach would reduce the
> > already complex recipe (as it inherits base glibc one), so there
> > is no need to also install *-dbg and *-src packages.
> > 
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > 
> > ---
> > Changes for v4:
> > - Add entry for 'glibc-tests' in the maintainers.inc file
> > - Remove nativesdk from BBCLASSEXTEND as this resipe is not supposed
> >   to be the part of SDK
> > 
> > Changes for v3:
> > - Provide missing ${PN}-ptest for PACKAGES, PROVIDES and
> >   RPROVIDES variables
> > 
> > Changes for v2:
> > - Just focus on time related set of tests as those can be run as
> >   standalone
> > - Reuse of already built tests (from glibc-tests.inc) and depoloy
> >   them on the HW target.
> > - Provide single 'run-ptest' script.
> > - Update the recipe to run with newest poky's -master
> > ---
> >  meta/conf/distro/include/maintainers.inc      |   1 +
> >  .../distro/include/ptest-packagelists.inc     |   1 +
> >  meta/recipes-core/glibc/glibc-tests_2.34.bb   | 113 ++++++++++++++++++
> >  meta/recipes-core/glibc/glibc/run-ptest       |  37 ++++++
> >  4 files changed, 152 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc-tests_2.34.bb
> >  create mode 100755 meta/recipes-core/glibc/glibc/run-ptest
> > 
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index baec2bef4d..7104e091fc 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -209,6 +209,7 @@ RECIPE_MAINTAINER:pn-glibc = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
> > +RECIPE_MAINTAINER:pn-glibc-tests = "Lukasz Majewski <lukma@denx.de>"
> >  RECIPE_MAINTAINER:pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
> >  RECIPE_MAINTAINER:pn-gmp = "Khem Raj <raj.khem@gmail.com>"
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> > index 2e324f8da4..fd52fa72a4 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -61,6 +61,7 @@ PTESTS_FAST = "\
> >      slang-ptest \
> >      wayland-ptest \
> >      zlib-ptest \
> > +    glibc-tests-ptest \
> 
> this will break musl. So lets change this to
> 
> PTESTS_FAST:append:libc-glibc = " glibc-tests-ptest"

FWIW I tested a tweak in master-next for that...

Cheers,

Richard


