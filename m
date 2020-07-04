Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.12546.1593831105651007911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 19:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hBNNsjVY;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id p20so36155832ejd.13
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 19:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZS7zXTHq1rLTATROs8oLnB9K7BsCrEzUluHnmSkii78=;
        b=hBNNsjVYzGe/yxMIpTlxmKaBcpuRxy40bI+WnPcRL00hW7KQzV22QR7rxZdHhNlyPf
         bH7Pw4iRQkDNDmRsE0DFdG1GjaEE9wJJDrcu7dJwfnVOHi575NS/I2neMXaVeWgJ+By0
         QXNKPtndDgk++juqKpLtjuRTfObS/FAzHEpLHIaYcdNPc412vhL95l/EDPZlhyUUgK/4
         1OD986FpnSVyvzmHCRmcY5NZbXehfP7AkA9J8qg5wKDpFDAaTiGBQdBy8zqMlZly1Osn
         DpyRdUT5Ppg1HRD6//rYhbAOlgZNm7S8/1yPhC9fw6M1jXzN08F4sVPZ50y965JAnGqd
         PMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZS7zXTHq1rLTATROs8oLnB9K7BsCrEzUluHnmSkii78=;
        b=ZpR7lm/aZs08ii6CJhy7Z3wF29U22ZhK9S5oa3GIqYK91XUXke2nejgMbn2/fSI9pw
         iE+xFCAifNi9dG9RxIxblEsv4DBxtYZNnCtmM2W8XCXiPn5dvatCbgkdVrV3l3MV9hWW
         C/khEAxsYbHjVdbIr/8SxNOz7GZIqgpYbr91EpnlrOMG/wIsJFDc8fr1znRJQ6j4noMl
         tJHrttv9Tkvua+CDATdst7GIth9OEGr5AZLCeUp3QoOeTEWqJx3ibfCNb4LwqleDBL33
         8wyQwg+S/c8aCqXgVDdtzWQoRaiLYnETb0W4XXc7LwC7zyB+5xTLmzLyDt1VpWuK6aSM
         2a4g==
X-Gm-Message-State: AOAM533qZjFReyxzUa3Bi+1ixrPDKniSC2jFFOJJIao4JlRYTi6A0yI5
	6rZtD4GUjYOiiwW2rvIZklQIA/b29FPpMlOFA0g=
X-Google-Smtp-Source: ABdhPJzSJqwh6eMcpZpZaOIWsui4ticzy86SU/bN2W2DkBRGxi3jFiNgOU7+4IRqoym1QooYLQPlgiwvjBUaoPMdn0I=
X-Received: by 2002:a17:906:8542:: with SMTP id h2mr34076478ejy.517.1593831103986;
 Fri, 03 Jul 2020 19:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200701145825.3743-1-andrey.z@gmail.com> <161DAA31FCE43A8C.29179@lists.openembedded.org>
In-Reply-To: <161DAA31FCE43A8C.29179@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 3 Jul 2020 22:51:32 -0400
Message-ID: <CADkTA4Nkdw+4bUx1L35eabSMCF7OmmZt4S7HAqvsYOdfSc1oug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel/yocto: fix search for defconfig from src_uri
To: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 1, 2020 at 11:22 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Wed, Jul 1, 2020 at 10:58 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > Fetcher provides full paths to defconfig and scc files, which awk
> > comparison operator does not catch during construction of
> > src_uri_defconfig and sccs_from_src_uri lists. This causes the
> > src_uri_defconfig variable to come out empty, and fails further
> > validation if defconfig is only supplied via SRC_URI.
> >
> > Replace comparison operator with awk match function which searches for
> > sub-string during filtering, effectively placing defconfig from SRC_URI
> > into src_uri_defconfig and scc files in sccs_from_src_uri respectively.
> >
> > Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
>
>
> v2 passes my testing as well.  The autobuilder gets the final say, but
> I can't see this causing any issues.
>

Richard,

I didn't see this on master-next, and we got a different patch for
this on the list .. this is the preferred fix for readabilty.

I just wanted to make sure you weren't waiting for me to send it in my
next pull request. I can absolutely do that if you want.

Cheers,

Bruce

> Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index 41d8620e67..54a1a1627a 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -156,9 +156,10 @@ do_kernel_metadata() {
> >         # a quick check to make sure we don't have duplicate defconfigs If
> >         # there's a defconfig in the SRC_URI, did we also have one from the
> >         # KBUILD_DEFCONFIG processing above ?
> > -       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> > +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(match($0, "defconfig") != 0) { print $0 }' RS=' ')
> >         # drop and defconfig's from the src_uri variable, we captured it just above here if it existed
> > -       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> > +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '(match($0, "defconfig") == 0) { print $0 }' RS=' ')
> > +
> >         if [ -n "$in_tree_defconfig" ]; then
> >                 sccs_defconfig=$in_tree_defconfig
> >                 if [ -n "$src_uri_defconfig" ]; then
> > --
> > 2.17.1
> >
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
