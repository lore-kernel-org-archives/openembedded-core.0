Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B474BC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 14:12:36 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.81239.1705327955899431323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 06:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AtAa+k35;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e835800adso9571261e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 06:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705327954; x=1705932754; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u684Y8EqT0Uqeb1YWFRBZgjHriN8EcDVDkAmyX4McSQ=;
        b=AtAa+k35BqNuNtahLtKUSwKFjzdeBYLbAk9QaOf2vgOJpw0CQv5xLyUH0qvMWxTTdn
         bAoCEzlByF4+aJUP8xLaULCz8MP/+u9yD/lbKIdYVHkY3w/MO4vv5TVmJFku3dFDonnC
         hbouJ5hsAUgd5xE6qujOXewzaBn8FIFAkrnFlSybj5lIT7kqyuyOgk0Qw+GUz7O91aOD
         wpTOcikThZ2W8RItKQ6+3Fqp/Fuacm5iGQJy9MofIhzhNBWjK8kFUGxTMSDf1NbXLG6W
         csf+TBAPrFcR/ogy2ndPQTSEsYJV8SeTMqrSdO92jnCBeDSDrkLAjjC/Arg5XlWGyb93
         TOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705327954; x=1705932754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u684Y8EqT0Uqeb1YWFRBZgjHriN8EcDVDkAmyX4McSQ=;
        b=oVIXQfjlDGox4w3+En5ahbXt5iznCejYYiAI2VC5up5lDvt88Y//ML+KTxzrRX4dxu
         w0/+y4euT9n3lpF5sR+lklJ7zIak5bW+QD7b+ZSblTMFscSCG011eix3RWnui5aQnoKG
         qC7LYtS2T3Wco0Mvunlnr8qAyuZC2DGLR7jvasMFi/iY7SNZk0PzaFUY1hTa4YmTo8dA
         +fk+tNZuXTYcUMfocdXdTS2gtGsGVTaXy+ScNbARCbASnQp16u1SKMj+a2qWq2m/42/S
         TwO5ASyOtwI0+m7JxzIXc+/SgX0JPJDdu1EZrb2dAl0sgjseSjTsbXbAr17PjSJAEEdh
         q15A==
X-Gm-Message-State: AOJu0Yz13GTQtdAMeeS3AzJJmNGB6ZBdoEFVSobPkHE0kiNWb2Aut0Ug
	uwcojkVHxtaoofs7dV9UzphsgF0eabDXHjWFMmHRN5Lq
X-Google-Smtp-Source: AGHT+IF2QcAn9pkjf3iAXE/hrnO9rujKKskESdI9tA0ZhdhL2d6F6wl+rrhZb5KliQcJ5BKAJ9qECTa40ZOPyOZAYTI=
X-Received: by 2002:a05:6512:b1e:b0:50e:4437:142b with SMTP id
 w30-20020a0565120b1e00b0050e4437142bmr2047434lfu.38.1705327953870; Mon, 15
 Jan 2024 06:12:33 -0800 (PST)
MIME-Version: 1.0
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
 <17AA7149AA53F0BC.13033@lists.openembedded.org> <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
 <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com>
 <8a632115c057bcecff50ef9404802670f072c4a6.camel@iris-sensing.com>
 <CANNYZj8jPYgXuu8FzGOLD99Rxv7wxWdy3KCMtAN5YERhibrawA@mail.gmail.com>
 <36bdc27c8ff2eb0fa91e5bd8b44556dfc270fb49.camel@iris-sensing.com> <17AA8A5B1D8D95A7.13033@lists.openembedded.org>
In-Reply-To: <17AA8A5B1D8D95A7.13033@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 15:12:22 +0100
Message-ID: <CANNYZj-LNrV6kJiyGLej+jy=7W-eoxUX9DX5wqf_jV2oJ2R7Jw@mail.gmail.com>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
To: Jasper Orschulko <jasper.orschulko@iris-sensing.com>
Cc: "ecordonnier@snap.com" <ecordonnier@snap.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alberto Pianon <alberto@pianon.eu>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 14:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193682

On Mon, 15 Jan 2024 at 15:05, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Mon, 15 Jan 2024 at 15:03, Jasper Orschulko
> <Jasper.Orschulko@iris-sensing.com> wrote:
> >
> > > Sadly it wouldn't. Auto-generated github archives are known to be
> > > non-deterministic, and we even have a qa check to ensure no recipe is
> > > using them. I didn't raise this point because my objections are on
> > > the
> > > principle of using release tarballs, not this technicality.
> >
> > Ah ok, that is interesting. Could you please elaborate on the non-
> > deterministic nature of the github archives? This information could be
> > vital for the Osselot project as well, as they currently use said
> > archives as the data basis.
>
> https://lwn.net/Articles/921787/ covers the subject well, I think.

Oh, and before I forget: Alberto (in cc) has recently done some work
in bitbake to enable file-level source tracing, presumably for exact
same purpose as you are, so I'd suggest you discuss what kind of
approach he envisions (or maybe has implemented).

Alex

