Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web10.18486.1593598977087311954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 03:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aqca5kK0;
 spf=pass (domain: konsulko.com, ip: 209.85.210.67, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f67.google.com with SMTP id w17so13139502otl.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 03:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mNBrJWe+/OshSMvUC4GTXrnFFux9I39MvvDaaLF5hpg=;
        b=aqca5kK056qd99OP0ep1etVjQvKOuls/izvHx3R1O0eN5uOWIPhCO/Ew/SeQnWnrNO
         a7459Bj52Otow0iOIfgU8EHjIee89EWr6pBFIsCmB7XSYpbOJEt/uO33ddQ8/JOdXvys
         vEMCMZcc16RvtMvkbKM90ogZbnMbldGn+mHy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mNBrJWe+/OshSMvUC4GTXrnFFux9I39MvvDaaLF5hpg=;
        b=ecV8Oix1p5NKqlhLsYIhPqfkZC95qGbvdySaN8LCbQaCZW9iobGo44gb7C7nMifvb2
         kneWpo0nb8VJqRBwZSCn6SfQpzsInTFeslsrrBgnnOg9Qi/v3AMRIGxAD6xeB0RMM0Zr
         FC+pH8jg+x46PkVwyDq5q63kcMUlNFi0qew6kDZ8+2Awyom8QS7fFqqlSj/+P4TI6ElO
         YsII+pXn1rRz1hz97slKZ/GAknlf1vwTqp5kJiUGkzq2YAwGatGphWliU+70DeNdyp/1
         JEF/VQH+7PoE/HB/pc2wmckUvtqn7mCbLBvdSc9eOAhQgRpSUnmXe6J6BuvlOp5KsyWV
         Ylaw==
X-Gm-Message-State: AOAM5311457wtZVVnIoG1jTXaKzdxLrleNNkriL3mInMXILLveUTiAmL
	7MDm1Pf2RKN+dPKEhmlTn2knyZnUIepgip5PY7UztA==
X-Google-Smtp-Source: ABdhPJzvy0BXhxA+c6bq1cBcq5f4pbeqvFadiH3f+MFXza+BknT0jbPiIIIMF+Fxa65Mu+Gp3Cpm/xZmSqU27dq2ZQU=
X-Received: by 2002:a9d:674a:: with SMTP id w10mr19302336otm.305.1593598976384;
 Wed, 01 Jul 2020 03:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200701084634.11428-1-fredrigu@axis.com> <20200701084634.11428-2-fredrigu@axis.com>
 <CAM9ZRVvdaVSghGzoFwy6vhHLhzHE-HatJpRwC6LxpuepO_pTxw@mail.gmail.com>
 <161D98456D41D2FE.27211@lists.openembedded.org> <161D992D91B5C0EE.29179@lists.openembedded.org>
 <9fb318a8e5cada4d7671af73bd5dd08e63b244a3.camel@linuxfoundation.org>
In-Reply-To: <9fb318a8e5cada4d7671af73bd5dd08e63b244a3.camel@linuxfoundation.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 1 Jul 2020 11:22:46 +0100
Message-ID: <CAM9ZRVvkcyYMxXEjZqjVBd=X-s7v_2YrY+GeJHgh3XhML0_Wng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] nopackages.bbclass: Get tasks from variable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Jul 2020 at 11:12, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-07-01 at 11:11 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2020-07-01 at 10:54 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Wed, 2020-07-01 at 10:48 +0100, Paul Barker wrote:
> > > > On Wed, 1 Jul 2020 at 09:46, Fredrik Gustafsson
> > > > <fredrik.gustafsson@axis.com> wrote:
> > > > > Get tasks from a variable instead of having them hardcoded.
> > > > > This
> > > > > will
> > > > > enable other layers to add tasks that should be deleted when
> > > > > nopackages
> > > > > is used.
> > > > >
> > > > > Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> > > > > ---
> > > > >  meta/classes/nopackages.bbclass | 19 +++++++------------
> > > > >  1 file changed, 7 insertions(+), 12 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes/nopackages.bbclass
> > > > > b/meta/classes/nopackages.bbclass
> > > > > index 559f5078bd..4c9fe510c5 100644
> > > > > --- a/meta/classes/nopackages.bbclass
> > > > > +++ b/meta/classes/nopackages.bbclass
> > > > > @@ -1,12 +1,7 @@
> > > > > -deltask do_package
> > > > > -deltask do_package_write_rpm
> > > > > -deltask do_package_write_ipk
> > > > > -deltask do_package_write_deb
> > > > > -deltask do_package_qa
> > > > > -deltask do_packagedata
> > > > > -deltask do_package_setscene
> > > > > -deltask do_package_write_rpm_setscene
> > > > > -deltask do_package_write_ipk_setscene
> > > > > -deltask do_package_write_deb_setscene
> > > > > -deltask do_package_qa_setscene
> > > > > -deltask do_packagedata_setscene
> > > > > +NO_PACKAGES_DELTASKS += "do_package do_package_write_rpm
> > > > > do_package_write_ipk do_package_write_deb do_package_qa
> > > > > do_packagedata do_package_setscene
> > > > > do_package_write_rpm_setscene
> > > > > do_package_write_ipk_setscene do_package_write_deb_setscene
> > > > > do_package_qa_setscene do_packagedata_setscene"
> > > >
> > > > Not sure if `+=` was present in the previous versions, I only
> > > > just
> > > > noticed it now. I think `?=` is a better choice so it can be
> > > > overridden easily. Other than that, this looks good.
> > > >
> > > > > +
> > > > > +python () {
> > > > > +    list = d.getVar("NO_PACKAGES_DELTASKS").split()
> > > > > +    for task in list:
> > > > > +        bb.build.deltask(task, d)
> > > > > +}
> > >
> > > I'm just sad this is having to use anonymous python. Its slow and
> > > I'd
> > > like to see less of it, not more, given people's complaints about
> > > parsing speed.
> > >
> > > I did make a suggestion about how this could be done but that isn't
> > > an option. I might sort out such a patch.
> >
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=46a01aef15b19431bd9f2924537723481e0151e5
> >
> > is a patch which lets deltask become a bit more flexible. I've not
> > tested it much but see it if works/helps.
>
> Sorry:
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=fd24e59fc886e6642bc3c8fb2941a37a1cc4042a
>
> Cheers,
>
> Richard (in need of caffeine)

I like this approach.

Fredrik, what's the reason for using a variable here again? Is it just
to be able to add tasks to the list or do you also need the ability to
remove tasks from the list?

Thanks,

-- 
Paul Barker
Konsulko Group
