Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.2795.1585704769251710657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 18:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E3rZsOjZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id a20so27778843edj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 18:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U6w5xNHtfPIMSs3N2NnPblLS1FHpxf3vRSvbQrIvUOI=;
        b=E3rZsOjZr+b29OeCk0GnBzGrb2y0EQsMlnj9V9iVpCAPhs1Qj1FG7I8cGdRmO3IDDq
         du1gDyjkpzDzF6Wr1SXhBCDz0oCwx4L+95s6l4GIODhUEgOtnqfamvkMZZ7QZmKAIsxr
         Dk3AOt5iUE0oxWXTFt5lEDuCduKEdrqqTLZfguwB12M1mcNc56JQWtZhV7fSTswwWB2D
         5qQo+HXYeKXEZqYTCHsKox80RPIDLfRkqiJznU7QK2VdIf/Wk3+Iy5Md0z6J9g2+QfNd
         mG3MCB3BIwCZOPz4YdUcEMy/qmE4VZTrbmohP7ZPlGlDZxXT86xrIchKGe0HOlVwxhy9
         8z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U6w5xNHtfPIMSs3N2NnPblLS1FHpxf3vRSvbQrIvUOI=;
        b=bFHWuOz7mgxk7p8VZUlZTxxwF8z1WxOUQJQkxUV1WU5RQXluoAQiYDdBZadQ+GVRdE
         U97sA12QRb5nFBtRY7gUwvYqdkm5wdm5ojiZxPHZfhlX6wbvJAIILrZ5RAA47K+z42p/
         7dAc8aALvF5gwHCEmWHeqYHo3UmEsKdvFQpsTNv0/jgiio50Y3MNS8F81QWiv8me7srG
         yPevPmjUlHvwoMUwP3zBh8A1pq9rE0D0piAw4E7F4fss2uzrT6j2g9X5heCl/7O08wW3
         kxIZKFi3EdAVerWoI2dzqMeDnBymCaohEUTz1mEL4aEuBiV280JhK7NWa2qr44SAks6/
         oliw==
X-Gm-Message-State: ANhLgQ1OZEgzlzsKydJxt1Hmvey3JQAitk3wHyT2QUnU23p9PuRVEBOQ
	w+u4Y21NhOh8O9vp4fLwDGwAOVwhvSvFWLxnBeI=
X-Google-Smtp-Source: ADFU+vvDUtiOmVifOXq0sUdCaHO1IAk595pL4AZdJp1b/Lc0w7FeZKwBc1zcYPvrOMvvcHiLURZTP0eJYJAIHo3RuvE=
X-Received: by 2002:a17:906:2962:: with SMTP id x2mr14298893ejd.233.1585704767734;
 Tue, 31 Mar 2020 18:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200331235607.93023-1-paulburton@google.com> <CADkTA4NEN1PPVrm7N2HF+tVa4j2Tgv1_=YYFmQhbFscV5RSjWA@mail.gmail.com>
In-Reply-To: <CADkTA4NEN1PPVrm7N2HF+tVa4j2Tgv1_=YYFmQhbFscV5RSjWA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 31 Mar 2020 21:32:36 -0400
Message-ID: <CADkTA4NQ4g1qOrbi1fdzmUq6Xk_8fm=QtNPpm7C+0U-oVpmU=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: Stop creating empty .scmversion files
To: paulburton@google.com, Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 31, 2020 at 9:29 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Mar 31, 2020 at 7:56 PM Paul Burton via Lists.Openembedded.Org
> <paulburton=google.com@lists.openembedded.org> wrote:
> >
> > The kernel_do_configure() function creates empty .scmversion files
> > within both the source & build directories. The presence of these files
> > causes the scm_version function within the kernel's
> > scripts/setlocalversion to always output the empty string, breaking the
> > kernel's CONFIG_LOCALVERSION_AUTO=y functionality which appends that
> > string to the kernel version. Rather than appending the git commit hash
> > or another SCM revision to the kernel version, the empty string is
> > appended causing CONFIG_LOCALVERSION_AUTO to do nothing.
> >
> > This behavior was introduced for the build directory by commit
> > c73e50a91e02 ("kernel.bbclass: fix extra + in kernelrelease") and
> > extended to the source directory by commit cafb94f57123
> > ("kernel.bbclass: touch .scmversion also in ${S}"). The motive isn't
> > entirely clear since these commits contain no meaningful descriptions
> > and the former links to a mailing list archive that is no longer online,
> > but the '+' character referenced would be appended if the kernel were
> > built from a dirty working tree. This in itself is useful information;
> > hiding that fact can only serve to muddy a user's understanding of what
> > kernel they're actually running. I have verified that building a kernel
> > from a clean working tree does not result in a spurious '+' character.
>
> I have all the original email from 2011 on the topic, Martin probably does
> as well.

Also note that in 2017 Trevor Woerner tried exactly the same fix that
you are doing, but ended up retracting it when he found a test case
that was still adding a + to the version.

see: [OE-core] [PATCH] meta/classes/kernel.bbclass: revert 56fe5300ab5

It might be worth checking with Trevor to see if he recalls what case
it was where the + snuck back in.

Cheers,

Bruce

Bruce

>
> A snippet from the conversation is this, and it is about moving some kernel
> build steps into oe-core from meta-oe:
>
> ------
> "If you're working on shared linux.inc in meta-oe, could you please
> integrate this:
>
> do_configure_prepend() {
> #otherwise it gets extra '+' "2.6.37+"
> #because:
> #$ scripts/setlocalversion . => +
> #$ make kernelversion => 2.6.37
> #$ make kernelrelease => 2.6.37+
>   rm -rf ${S}/.git
> }
>
> I have to do this in every git recipe as I don't like dirs like
> /lib/modules/2.6.37+
>
> Maybe it should be fixed on kernel.bbclass level, because linux-yocto
> suffers the same ie /lib/modules/3.0.12-yocto-standard+
>
> Ccing oe-core for that.."
> ------
>
> I didn't make any of the changes, but looking at the thread, if you aren't
> getting a + added to the localversion or directories, then I can't see how
> it would break anything.
>
> Cheers,
>
> Bruce
>
> >
> > Remove the creation of the empty .scmversion files in order to restore
> > the kernel's CONFIG_LOCALVERSION_AUTO functionality. This allows users
> > of kernels built from non-tagged source & configured with
> > CONFIG_LOCALVERSION_AUTO=y to better determine what kernel they're
> > actually running.
> >
> > Signed-off-by: Paul Burton <paulburton@google.com>
> > ---
> >  meta/classes/kernel.bbclass | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index a724645466..46e24a19e2 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -521,12 +521,6 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
> >  do_configure[prefuncs] += "check_oldest_kernel"
> >
> >  kernel_do_configure() {
> > -       # fixes extra + in /lib/modules/2.6.37+
> > -       # $ scripts/setlocalversion . => +
> > -       # $ make kernelversion => 2.6.37
> > -       # $ make kernelrelease => 2.6.37+
> > -       touch ${B}/.scmversion ${S}/.scmversion
> > -
> >         if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
> >                 mv "${S}/.config" "${B}/.config"
> >         fi
> > --
> > 2.26.0.rc2.310.g2932bb562d-goog
> >
> > 
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
