Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.13133.1589466162827373717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 07:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QWDWmsjv;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id r7so2506723edo.11
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sH3NpTaH6S75E2jeMaGs/cQcHoAAXf/QvYWoss5OUiI=;
        b=QWDWmsjvBSlrotdc08qFrNkB+RLgK2Ox2ZPYtN950fNnMNqzA4BAbjH7dQ4r3Z38Sa
         BJkmZZQLBhVw96iX1Q8GWNY+eo7FTWOU3978WLBwWBo6FzTrfcQ6lLeGYVmHRl8lHTS5
         nfmC86nHk3X1EEPEA0cHe/c6Byo8gDyKHws/FbDpJ+IqL9FZC+6yXYibIYXfuK1ylhha
         vA7MKPgZWNJlBbEU+V96fqAM7jK4J+UQFkszlOVk9xZa9K39S0OrcQQ8MNIoVTBZnKR6
         DczZgt5B0/wfac1yoQANBjExZT9pRWhTeEmUzxqTRPpJTnfyq2QQh6FQaV4Jyv+42Jkb
         mCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sH3NpTaH6S75E2jeMaGs/cQcHoAAXf/QvYWoss5OUiI=;
        b=LVmbKX+q8UxD7eafHySSUJJl1xV+/I2fnR6qhAsRuUkAJQxpkgFGNsYqZZ0KRiRS9a
         I1bqs4nXVuqA+aIqWBZc34fSq4h2TwtxdMqP6DrTEPfuBQDX3xOKTCd1I3EAh8A51fOr
         P0VBDVNcD/hiPUgscZvyjHP35KfARZkjAP3e/OOM541ma2KtJ9eLlcEeCDeBPPVY5snV
         QC7k5wBPyyEzVXc5nCN4Pgm7amcZuZ0UekXE6dETkQrwuNWC60k7aQQKRyw0JbugKxD2
         aXKcP+dlPOXvHtzoNwkiSmiUSSeEAPI+uLc9lq+FvKQBfFLenOvTodOlqrdD0MKBGOV3
         rtUQ==
X-Gm-Message-State: AOAM531YQVSI+MVBzFq/bAS9v5whmWDp6ONDZme38wbCRdAnUkmTqFKY
	fcmeZ94BvPGzK8WGd/EyQwl/tI9d8XiRFIz3hBI=
X-Google-Smtp-Source: ABdhPJy1VMFrNIb0j45GDT7u+rnluGrNJMCnug++cLWoqEUOrFT1brEH2G/lbmUoL0dOKfPPjwTtklHEkAQe6AGHXUo=
X-Received: by 2002:a50:8749:: with SMTP id 9mr4093911edv.164.1589466161359;
 Thu, 14 May 2020 07:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589378829.git.bruce.ashfield@gmail.com> <4586b07ae3f2c70500b6627645de2f71760b45e4.camel@linuxfoundation.org>
In-Reply-To: <4586b07ae3f2c70500b6627645de2f71760b45e4.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 14 May 2020 10:22:30 -0400
Message-ID: <CADkTA4PcdRyWJLGjkQuOVDX4TwRA6UN4Qvq6UwSmr8w-zTrU0A@mail.gmail.com>
Subject: Re: [PATCH 0/4] kernel/kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"

On Thu, May 14, 2020 at 10:09 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-05-13 at 10:24 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Hi all,
> >
> > This is a resend of the v5.4 stable bump to v5.4.38, plus a new
> > -stable
> > bump to v5.4.40.
> >
> > The extra changes to make these pass the AB tests are the kernel
> > reproducibility commits.
> >
> > The issue we had on the last submission was that IKHEADERS was
> > switched
> > to a module, and hence was failing reproducibility tests as we didn't
> > have the timestamp variables exported for the module build. It has
> > always been a problem, just one we hadn't hit.
> >
> > I've left the fix as two commits on purpose, since the copy of the
> > reproducibility export fixes the problem, and is definitely safe for
> > dunfell,
> > and the second commit is my effort to remove the duplication of logic
> > and
> > create a common python routine they can call. I've used the
> > techniques for
> > subprocess running that I've done in other kernel build elements, but
> > if they
> > aren't the right ones to use, point me in the right direction.
> >
> > All said, these are green on the AB and should be ok for master and
> > dunfell.
>
> I think this triggers something here:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1914
>

In that case, just drop my effort at factoring out the source date
epoch into a python function.

It looks like the git check went nuts, and since we don't need it, and
I won't have time to work on it again for a while, if you toss it in
the bin, all should be well.

Bruce


> which is nodistro rather than poky.
>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
