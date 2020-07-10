Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web12.10644.1594387322953350406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 06:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ak9C+H2i;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: andrey.z@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id o25so1817451uar.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lbDZ4VkPfhHIOW17NqqyBlD0fsK8278Hc7qJPFYnWlA=;
        b=ak9C+H2iPxAHkb4ivHkMh7VqBPdOoWv8UPydzcZ/ywCgEv5fAy79frPSVl7bwwtqqz
         CZz+SvzGUTwjqvyqhDFGdLX06S426Ari91RAB6l6ObxHPXCoqssEiVSjllJsNy6knqzj
         VFKe31W9EqeX8iMfv2Y1IL5rNXEqqbSXzaFp0tOmlXIyUHkhDC1MMNBYC6qjnGVVk0SH
         3dBt8dFrAI8Pud84xkjrJWtFVYOHv8Es6FH+9NpaVUfaOb9jnXfm5ubaKZVK1lRXBk7c
         Z+Y+OtK+5IxgXPrwfjzewiE383p7wnPAWFZGZ1B1vcj3Ont+Ck+z7yE4/LbwIrMyMeku
         jEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lbDZ4VkPfhHIOW17NqqyBlD0fsK8278Hc7qJPFYnWlA=;
        b=ORuPWv/1v8pNUsXAxVlB5todD1cNamjpZ7mD7265jiSgsnaUoxnxKA0ZREaE7h7bUp
         6Ooio13FfiRrt3N4i2zbIT2EkXOp5pZWaP0Q/veCy6pugjnHoIw+Ur5L1Cc0tCXLJp/c
         NI7Pj07BjwXkqqci7ev548wnDt1+Btu0OtnLZeL/dQryICqhwEIFi0zcbr+uIKxsMvyn
         2Qz4IY8wAdtA1H/gCX7yut1uGOVFZqAApOcnaF60/gvRdNOAyn34ZDY43Y3DFbUZnlj6
         yClQN24FlKs+fijzqk1I5lHytBmRCRaylXn0szWR77ZaDNEXJRkc4RFNi44vuWbuEGlw
         8zaA==
X-Gm-Message-State: AOAM5317O+BmtQp/epX2N5EmyFbkM19ghj4XpScg/p+YzLlX3hY6HTR+
	N7s2cFUpzle/LA5W4OkEws/my4NitnAAzkD4wd4=
X-Google-Smtp-Source: ABdhPJwQkkW6PllSUMLx4ecTf4/H4V2mXNM/wuRTjeCz3eKYlto2311TtRw/N/4b87jfHQe+lILX7BsS6M4YJej2+6o=
X-Received: by 2002:ab0:280b:: with SMTP id w11mr16877532uap.81.1594387321782;
 Fri, 10 Jul 2020 06:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200710090514.440-1-max.krummenacher@toradex.com>
 <20200710090514.440-2-max.krummenacher@toradex.com> <CADkTA4PA0N8W7+jUbV+ao__tY8Q_623=yLZ47YC=z4dD4fiGmA@mail.gmail.com>
In-Reply-To: <CADkTA4PA0N8W7+jUbV+ao__tY8Q_623=yLZ47YC=z4dD4fiGmA@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Fri, 10 Jul 2020 15:21:51 +0200
Message-ID: <CAHtQpK5GsbVg3pdNWoYtynvHjzCMMJVr7yRAx5mPQ674DS6N2g@mail.gmail.com>
Subject: Re: [OE-core][Patch 2/2] kernel-yocto.bbclass: force creation of config.queue
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 10, 2020 at 2:47 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Jul 10, 2020 at 5:06 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> >
> > In the case of no patches or no configure fragments, during
> > do_kernel_metadata() scc is not called, and thus
> > kernel-sources/${meta_dir}/config.queue is not created.
> > Later do_kernel_configme fails because the file is missing.
>
> This is a really strange case, since in tree and defconfigs go through
> the queue.
>
> How are you ending up in this situation in the first place?

Can this be the same issue that was solved when defconfig is not in-tree?

I guess this could happen only when the list of elements defined as:
elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
would contain nothing at all, which means that even a defconfig is not found...

Max,
Can you reproduce this issue from the latest master? Fix for searching
for OOT defconfig is already merged there (see [1]).

>
> I'd rather not force create this, but detect the misconfiguration and
> output a useful error message.
>
> Bruce
>
> >
> > | ERROR: Execution of 'run.do_kernel_configme.24874' failed with exit code 1:
> > | exit 1 from 'configs="$(scc --configs -o ${meta_dir})"'
> >
> > Forcing at least an empty config.queue file fixes this.
> >
> > Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index 7cedb05e93..7ea3cb5e51 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -220,6 +220,8 @@ do_kernel_metadata() {
> >                 if [ $? -ne 0 ]; then
> >                         bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> >                 fi
> > +       else
> > +               touch ${S}/${meta_dir}/config.queue
> >         fi
> >
> >         # if KMETA_EXTERNAL_BSPS has been set, or it has been detected from
> > --
> > 2.20.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 

[1]: http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7dbc62a672909adce316bb4a8772be0ee9b480fe

-- 
Regards,
Andrey.
