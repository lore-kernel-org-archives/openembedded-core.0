Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.21523.1593610017080277452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 06:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bfIJ1MJ5;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id by13so9835438edb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZHq4lZU3IOAH4+MrtMXu4JuZvzJrUIuNcsvqriivrY4=;
        b=bfIJ1MJ5EmPXm61RIhT7uvcm3TRBCDZfmbkQIMrhcBYSYeCeWm6Z2DiF5s2+V/J694
         8Ecigp450t3/SUD+8DXSyFoqFjnbX9kCAvdQc9VWMBZNgrBVuiW7fbgi0Gx4RtCZNT40
         Wr70Kw1eTz2DTONLiZgvbgIElQNuHyvhdggZ0w/5gUhSdRY7bWHDTDrtD+Xbr/zrxUVQ
         B3kQnOieKNQl62TAyt2DCb+AavWmNWlO+Rlbb9izlj4Wk8jv6rNCF0FJZ4+43gboOVjC
         G7qPR8wI+Y5Io7HsMC35OmmmZ5BMmF/UxgVwFXulZMvkLD/jkLhnuhcaAMq4zB8fSqOr
         PKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZHq4lZU3IOAH4+MrtMXu4JuZvzJrUIuNcsvqriivrY4=;
        b=bUN6eLYklNXl9b+uFaclIWVFYGN1uluOjQ5Xe8S2B3Ey7xXlGw+duZppG4dknDpNE2
         rNrDUndnB+5YiVZalIhuqu3UzHHlnicz8tFFNBN0bawauT7DZk42yrK3pkvdS5PT5TWe
         Z/osMT+IB7uSigKRwcI7dSQVCPWYUh5HZqwsMCEOaQOpPqKsJuWy8WV9yJvxDBNJXZ23
         Fb62V+mKVkTsl7gsTQ/4oYPx9eap4/+4lWNm7O7mkwTfXbnBJX0OBo1U3zQNY7pS4ANq
         uXIe8OfrIClrD0VETk1I2OBJQ2q/f//6453duHksQmh9IbUoLPaiOOWQH8Rb5y6qjlCW
         ftiQ==
X-Gm-Message-State: AOAM533RnQGJFjUjbgsKuuttvcR7mRZhvJ618knKtM/8xkMHu1bah71L
	+MIIPDO0sgz/SRlEI7DtdgZ3DqBJ+KgY6UY1oqQ=
X-Google-Smtp-Source: ABdhPJxP+nkhHSdCrtWI7W8BXbPpDHDPdZuXXZ9kGyZIPAoBJk7E9cZIP1Q4Ovo88ZijJdZ7UpjO6y+iik5ueOcAr5E=
X-Received: by 2002:aa7:c2cf:: with SMTP id m15mr4760172edp.27.1593610015573;
 Wed, 01 Jul 2020 06:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200701104628.32696-1-andrey.z@gmail.com> <CADkTA4N68p6gK-nO3mPJ0z+MtBDFJDjsvn0RpF=ou1+Wj-5UFQ@mail.gmail.com>
 <161DA278CF8B94DF.27211@lists.openembedded.org>
In-Reply-To: <161DA278CF8B94DF.27211@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 1 Jul 2020 09:26:44 -0400
Message-ID: <CADkTA4NuQZ+iVnwOwZeTwBipLWaSb19=PQoSweDE7SN+O2Am4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel/yocto: fix search for defconfig from src_uri
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 1, 2020 at 9:01 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Wed, Jul 1, 2020 at 8:58 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, Jul 1, 2020 at 6:46 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > >
> > > Fetcher provides full paths to defconfig and scc files, which awk
> > > comparison operator does not catch during construction of
> > > src_uri_defconfig and sccs_from_src_uri lists. This causes the
> > > src_uri_defconfig variable to come out empty, and fails further
> > > validation if defconfig is only supplied via SRC_URI.
> > >
> > > Replace comparison operator with awk index function which searches for
> > > sub-string during filtering, effectively placing defconfig from SRC_URI
> > > into src_uri_defconfig and scc files in sccs_from_src_uri respectively.
> > >
> >
> > Hmm. This passed all of my testing (defconfigs were picked up
> > properly), can you share your test configuration ? I'd like to test
> > this across my kernels, since I have even more corner cases than most.
> >
> > What issues did it cause in your build ? Was the defconfig skipped completely ?
>
> Ooops. I see you did mention this in the log.
>
> I do have an additional question though .. we only want to match
> on"defconfig", not a substring of something else that contains
> defconfig. Won't the replacement awk expression match more than just a
> single 'deconfig' word ?
>
> Which is again why I'd like to see your test config, because I was
> testing against cases like that, and they all worked here.

I re-ran my tests, and I can see why my defconfig was being chopped
off, it was supplied through some KMETA variables and wasn't actually
an absolute path.

I also mocked up a subtring test, and I can see that it is yanking out
something like "i_am_not_defconfig.scc" as well.

This doesn't have to use awk, I'll poke around and see if I can come
up with something that handles both cases

.. and then run some boot tests with the patch in my queue to ensure
what I ran before, continues to boot.

Cheers,

Bruce

>
> Bruce
>
> >
> > Bruce
> >
> > > Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
> > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > ---
> > >  meta/classes/kernel-yocto.bbclass | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > > index 41d8620e67..059d78b7dc 100644
> > > --- a/meta/classes/kernel-yocto.bbclass
> > > +++ b/meta/classes/kernel-yocto.bbclass
> > > @@ -156,9 +156,10 @@ do_kernel_metadata() {
> > >         # a quick check to make sure we don't have duplicate defconfigs If
> > >         # there's a defconfig in the SRC_URI, did we also have one from the
> > >         # KBUILD_DEFCONFIG processing above ?
> > > -       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> > > +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") != 0) { print $0 }' RS=' ')
> > >         # drop and defconfig's from the src_uri variable, we captured it just above here if it existed
> > > -       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> > > +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") == 0) { print $0 }' RS=' ')
> > > +
> > >         if [ -n "$in_tree_defconfig" ]; then
> > >                 sccs_defconfig=$in_tree_defconfig
> > >                 if [ -n "$src_uri_defconfig" ]; then
> > > --
> > > 2.17.1
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
