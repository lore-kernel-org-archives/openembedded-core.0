Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.31014.1620031554625932237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 01:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z3yjnyGX;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id u13so2677131edd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 01:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RVW25lNPURax4Xo4IwC6utOXP06LQv9R+mE33tY9jyA=;
        b=Z3yjnyGX+eqX9grbqyKvJUDskrOOX8udCgPJDeMOj8454vFBLgjuMmdymnFzlGSYiC
         HmOsPPMGU3WT3gn30FUxQF1HxFrtoU6GOzE35tu67u2ItIUfn1T/Gw5lbTUZ6mC52h2P
         DHbEWSZmZ1sJlKhLnH85sNc5cFyqBZDOnp7WCyzbULzRhUTiOpSX5glT41vzfityyp3i
         Wic+qwMAgsdeziJTe8TIRjdWVVQAH8lVql5OdtHQz2Hh3qnJ7lGIbyTVlpU08BIPCVLO
         eAbs3U7kCD6OOfAomh4YllKcuUFca6CtuuXVW7CXFkF/Wu2nj0yTQ/+LUxO0M1sFiy9Z
         3mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RVW25lNPURax4Xo4IwC6utOXP06LQv9R+mE33tY9jyA=;
        b=cB2aBXch6bu3aGvI4MK01nv6oY/y5LS1mlcHk8R4oGuuP0XnrJdHWSc3gd2D9lGjK+
         Y+9exrIB62YFK/P06yJFQKM+7EAlJcUDaBn/6D4Q00oF2sFPHhQ0asE1S35H7VzC8qpT
         0hhFK+Z2DtOMmdCtr/zu454g6AfEc/UHXdzibcnj0aKiAu5ohreEY4grufai/e9DRm+L
         X9ZyAFES+PLSWrqffjGfZEnPCqy6NZePYlf27onewURm8lJfcckRahA2u4sEBJpi2H6G
         lPDJqjPDSc1OeczXrkU5Bfy/Hgc6e2c/QXSRjJNR9RC47OOg+jAx0DIYbhO5Dh3ueo7w
         5nDg==
X-Gm-Message-State: AOAM532W2lrQ6bHN21VVE2UHObZQOgKWDwzhcB4y0T9jYRztawvZluQb
	MlGpbu7j8KUbX3zqH9RDyv60C5XS+M0tAP5HOJy/XRrbPqXFsw==
X-Google-Smtp-Source: ABdhPJxx5DKQ45/bDcuKBP6UzzkGkRfFI904VhPb6pDPmJqoW8R7ahlxqhZD86KXtsOTmqx9uCzP+ECncccJ5HosZIg=
X-Received: by 2002:aa7:dbcd:: with SMTP id v13mr18648486edt.59.1620031553224;
 Mon, 03 May 2021 01:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210502175441.368688-1-quaresma.jose@gmail.com> <a7cd5d19859941f77793559f61cf64fbbc603d53.camel@linuxfoundation.org>
In-Reply-To: <a7cd5d19859941f77793559f61cf64fbbc603d53.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 3 May 2021 09:47:10 +0100
Message-ID: <CANPvuRkbQSr+J8LcAzzBnzvXD4TQbj8AXgqH9A0=V-D8_HvA4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] ptest-runner: libgcc must be installed for pthread_cancel to work
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Gstreamer is on top of the glib and uses it for everything so I have
doubts that it can call pthread_cancel but I'm not sure.
On the other side, I can see that ptest-runner calls the pthread_cancel
http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/tree/utils.c?id=3Dc=
ce0edb4282ee081d043030bfdf29f3e4052f86c#n542

So I think this is a missing symbol in ptest-runner.

Jose

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
domingo, 2/05/2021 =C3=A0(s) 23:29:
>
> On Sun, 2021-05-02 at 18:54 +0100, Jose Quaresma wrote:
> > found on runqemu core-image-minimal with gstreamer ptest-runner
> >
> > STOP: ptest-runner
> > libgcc_s.so.1 must be installed for pthread_cancel to work
> > Aborted
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb b/=
meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> > index 57a3ae005b..fe6ef2a43f 100644
> > --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> > +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
> > @@ -26,3 +26,5 @@ do_compile () {
> >  do_install () {
> >       install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
> >  }
> > +
> > +RDEPENDS_${PN} +=3D "libgcc"
>
> Just to check, this was a missing symbol in ptest-runner and not in gstre=
amer?
>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma
