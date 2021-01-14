Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.2034.1610634363671385065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 06:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DvoDM7Jg;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: jeanmarie.lemetayer@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id g12so8405915ejf.8
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 06:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cxNGl6cjgUoYf2XOCNljzaqJjuff/4lMCHonEcDisUo=;
        b=DvoDM7Jgv7taPg8xP+g2x77W9CoKPQrNAhG2hiUCqqA6fjbyF1CjPYGFhDQhxz88C6
         JlmZ/qXwMt7ZgGMHKthVpvQ/SQbAcczuhTLQ0/mZkKLJTSohjWyPi8rXa/Lequ/qckwE
         07KUc4SEZzCp3YllPh3chZMa9J4rKH1OA2JLwOIuWToEHiTaT/rieK9cC/NKJ07opps7
         I/4MsdPcOCWys3/BOfnGgevaK+PTh3GtDLzIaKglKmE3Fp4tc4ra2IwANPyTMQHHsnlo
         ehJhCU6o4tzqn8RshqYsCRwvs8IAiM+v2kgQ+BO6zgw2wnJR9FDyjQtqWXUvAQ5eb6RS
         LHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cxNGl6cjgUoYf2XOCNljzaqJjuff/4lMCHonEcDisUo=;
        b=AgKO0Apjn+Z7rnHQPHj3DJKIXPwq1sw3G67yAOPn6EHuzTC0NnRIkP1nBif6U5FuSB
         eZGB622LJ3l7wc/ipLKegA9o29eLgJY3ZZsAhijXzvTJjhJjqg/SI0/Mt/SwWn6eY7YU
         3MQdNVEB8WzEP/vRtl3FWLGKPUKRkpQdpZThqpVrZuNMBRL2d7mrvlJoWpXkgJueQKq4
         u8gtInUbsOsMY9RQ9jWjDTRItvXez9kpsHs96EOH7Pjfvm4sBCYto/VbXqnCh8DstZkz
         bDbuk/vFbmFto7gBYpV+RpOJps/KuSPfumZ8lczcLTiS4VtpIX+QfGaea2mEtwF3+h8z
         MXQQ==
X-Gm-Message-State: AOAM530mzEszZocX7s9iJPcgrEMB1+1n1JZlA2jIrXIHhwEHvTacB3oL
	sIonNWHNDsjKXI1OTFA8pafenez+ynU1+iU4TeE=
X-Google-Smtp-Source: ABdhPJxtEp3gHIA7bDQjkuPn5wM/XtcYSUyOgKxoB6upTemoxWR1vxddtJaXx0KUPEXC8w1n7sV76iggJsz0LXWxGDM=
X-Received: by 2002:a17:906:7215:: with SMTP id m21mr5368209ejk.248.1610634362098;
 Thu, 14 Jan 2021 06:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20210114071235.2210763-1-kamel.bouhara@bootlin.com>
In-Reply-To: <20210114071235.2210763-1-kamel.bouhara@bootlin.com>
From: "Jean-Marie Lemetayer" <jeanmarie.lemetayer@gmail.com>
Date: Thu, 14 Jan 2021 15:25:50 +0100
Message-ID: <CAAdc0hwtbSPoTmBoG60e-5UL+BBTEkmoQi8r+BdzOu5Eek_Pmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] Fix issue with npm shrinkwrap fetcher
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, sandra.tobajas@savoirfairelinux.com
Content-Type: text/plain; charset="UTF-8"

Hi Kamel,

Thanks for your work. I should have fixed this a long time ago but I
didn't have the time :(

There is actually an open bug for this issue:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13901
I think you can add the reference to your commit messages. And close
it if merged.

Please add some tests to ensure that:
 1. devtool / recipetool do not create empty shrinkwrap file
 2. the npmsw fetcher allows empty shrinkwrap file
 3. the npm class allows empty shrinkwrap

See:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=22dd46cc34629d0750177fddff2e1c178c854340
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=44b2ab8d5eb4fd1fc9a157fce37aaa7b7a7065e5
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=f6728edb7e022b27223d28bd80ce40c2f2374a13

Also Sandra has already worked on it, but it didn't get merged. I
don't know why.

See:
https://lists.openembedded.org/g/bitbake-devel/topic/76459311#11643
https://lists.openembedded.org/g/bitbake-devel/message/11648

BR
Jean-Marie

On Thu, Jan 14, 2021 at 8:13 AM Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:
>
> Hello all,
>
> This small patch series aims to fix the following build issue faced
> with some npm packages:
>
> DEBUG: Executing python function do_fetch
> DEBUG: Executing python function base_do_fetch
> DEBUG: Python function base_do_fetch finished
> DEBUG: Python function do_fetch finished
> ERROR: Failure expanding variable TUNE_FEATURES_tune-armv7at-neon, expression was ${TUNE_FEATURES_tune-armv7at} neon which triggered exception RecursionError: maximum recursion depth exceeded while calling a Python object
>
> After struggling a lot, I figured out that this only happen for npm
> packages not having dependencies listed in their shrinkwrap file (e.g. bcryptjs).
>
> Yet I still didn't got how is the json parsing impacting
> the python context here ?
>
> Please feel free to comment.
>
> Thanks.
>
> Kamel Bouhara (2):
>   npm.bbclass: make shrinkwrap file optional
>   recipetool: create: only add npmsw url if required
>
>  meta/classes/npm.bbclass             | 31 +++++++++++++++++++++----------
>  scripts/lib/recipetool/create_npm.py |  6 +++++-
>  2 files changed, 26 insertions(+), 11 deletions(-)
>
> --
> 2.11.0
>
>
> 
>
