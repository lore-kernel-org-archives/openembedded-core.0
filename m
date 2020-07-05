Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.38773.1593961899107242842
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 08:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BD4cTPsX;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id f12so13549910eja.9
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2020 08:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5QGUzV0sSIVWkk0czxGzJbpOzFIuBeUqjLcPuOIGqe0=;
        b=BD4cTPsXq1+Ai3b2nZbizjLzs4IgOAVxQ3aazYQr8uHWe81CLRlKIzDdu6YYa8G5wk
         AkFgPAGMSwvQ45vTaAt+d/x6WkR86DZHQ+CUadxkG3gKe4z+Ow3v9/1X5HUZ2T1q0qCH
         nMaSHMaRu5CX8A1yXqYwCJhYAVWG1llkj3TJm2h3eQyB0LuHRhSxLKTu4SuCjBHW1UqE
         pQZLo+ORdkWl4aUnNiUHeuy8gv42fs/4a24vePvxIma8IB+qanrdw3wG4OmBmiEXi0zo
         Kal2NW31118k5EVPGPNxVJ6iR5Gxvhvqy61FoNPGvlt6c0dMDBNaHUITov5ZbuRc6ZOe
         WIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5QGUzV0sSIVWkk0czxGzJbpOzFIuBeUqjLcPuOIGqe0=;
        b=ukrEzMCfHPvxyiyzbaVxpsZiUROia2o/5bpelQzj0HopowX41Um/sAipzC0d92bHEJ
         9W1m3PG6K87FKRCQeVLJthJgHxN1AJrY7CQLH31N4Zib5tMeRnQ8rNS3BAElUx/SeA4g
         akJV5chD/i7KbfcCETepaD1eipoC+xpHG6XIryf57DB9A31BaTSHeo2zAzXvKo6Woa/E
         Trg2S90aYjBHvLZrTMvTzxgy4+ktu/5u0k+GRADEjUWI95w0dl/tuWDvLO17AEUIcelO
         UX8/qvsJADn6K0oS+7iXHK1GETLf3U+llhZjjS/a6oArpgkduAlehH1gjKxShpfmLNxg
         0b4g==
X-Gm-Message-State: AOAM532ktActFtyNUJoU0EAmxA1NoXeCQF5P9qEyw09JM4kJYmnIKOHx
	nnm9oWb0cZd108RoILlE8J3KLE54EfBSHFW8gTQ=
X-Google-Smtp-Source: ABdhPJwD4CXGMtEWSAi+0Ejhx5qqMW7Ku7HkQFE7Q7yy8+0ATjoCtOazpW75zqauLZe5ZNczCuifPoEpMyywghkqXeE=
X-Received: by 2002:a17:906:5283:: with SMTP id c3mr37820931ejm.22.1593961897528;
 Sun, 05 Jul 2020 08:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200701145825.3743-1-andrey.z@gmail.com> <161DAA31FCE43A8C.29179@lists.openembedded.org>
 <CADkTA4Nkdw+4bUx1L35eabSMCF7OmmZt4S7HAqvsYOdfSc1oug@mail.gmail.com> <d4a663fb040f6461ff6c75d09f5aa26e888b0c94.camel@linuxfoundation.org>
In-Reply-To: <d4a663fb040f6461ff6c75d09f5aa26e888b0c94.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 5 Jul 2020 11:11:26 -0400
Message-ID: <CADkTA4Na1Ywvve9ABMBaPzaZiehySQ1ew9KUJXB4OSJ9Z3iLxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel/yocto: fix search for defconfig from src_uri
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 5, 2020 at 10:08 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-07-03 at 22:51 -0400, Bruce Ashfield wrote:
> > On Wed, Jul 1, 2020 at 11:22 AM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > > On Wed, Jul 1, 2020 at 10:58 AM Andrey Zhizhikin <
> > > andrey.z@gmail.com> wrote:
> > > > Fetcher provides full paths to defconfig and scc files, which awk
> > > > comparison operator does not catch during construction of
> > > > src_uri_defconfig and sccs_from_src_uri lists. This causes the
> > > > src_uri_defconfig variable to come out empty, and fails further
> > > > validation if defconfig is only supplied via SRC_URI.
> > > >
> > > > Replace comparison operator with awk match function which
> > > > searches for
> > > > sub-string during filtering, effectively placing defconfig from
> > > > SRC_URI
> > > > into src_uri_defconfig and scc files in sccs_from_src_uri
> > > > respectively.
> > > >
> > > > Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are
> > > > processed first)
> > >
> > > v2 passes my testing as well.  The autobuilder gets the final say,
> > > but
> > > I can't see this causing any issues.
> > >
> >
> > Richard,
> >
> > I didn't see this on master-next, and we got a different patch for
> > this on the list .. this is the preferred fix for readabilty.
> >
> > I just wanted to make sure you weren't waiting for me to send it in
> > my
> > next pull request. I can absolutely do that if you want.
>
> I was waiting for some indication on your thoughts, I'll queue it :)

cool. I do appreciate that .. I realized you probably were waiting
when I wasn't super clear on my last reply.

It isn't that it was urgent, I just wanted to make sure I hadn't
dropped the ball on it.

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
