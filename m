Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4131DC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 17:09:38 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.537.1664212172616976941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 10:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ihQNnvEQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id i26so11863225lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=HHwpKN0clzwwnN6znj2X2VixlNPBu5E8cnQokHB6zA4=;
        b=ihQNnvEQjjYv+nEN7oy5yIGjO9iOyaHzFX27rQjYqRLPxeFnL+B92sj/SzbVUoHVoL
         NerOPXYBqvd2WBTUsnWzPZ9M7LDAulDEkk3YEeNzEYkOJERdwomQ/E9tp0pBBES8WndV
         SEZ13dD0OQHJe4X1TtnKjyAjMC2zkMHpnibtC9I3GMsbceMujCrFcY1TyiXDp0ke+xFL
         ZB7RI9tfS0oRllowg50tpxShN3FOwpOF7UvofXDXCHSTB6OJ9YqH9OmtJBqmk8difVkU
         6P8jxvHPSjsJBDFsUFRoEXqrWOdrLbULknS6kMAdFt1inplmL70BQlAfs19aGJfc3VcH
         B3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=HHwpKN0clzwwnN6znj2X2VixlNPBu5E8cnQokHB6zA4=;
        b=6JF88XSZp1MHoC/ClG2GYuQzKsrWqoii9YfoU+cPmImAo5Ec1QSyNmonU2k9aQrsvh
         bVxjnihiuKWXAePZ4DwY59TGB9DBcZo3yuoj4ZsN6vl5BcKS2shXt9gfFFbUCOQT7GdG
         uBfmeElL5Ziw8riMszNQ93JLGywN0g5ardBkSkqHlA3vVxXdWpJR+CVgthDv8lKjp6tJ
         khJzsERHXROz6UKEp3Xq62Lc8gEjOzgULcbfOjSk/vbBnnDIaqTDebzXHU9HKAyiutso
         4/04UoQ/Wa77jI5Uln8LygOSz0l0Ik7RNr+Ed6vQapCjPyTLSEZqhbhpfnwRgl03wB65
         ZnXg==
X-Gm-Message-State: ACrzQf0KwOamr7aKgj91OofBssdbMMM2xJGmzBL08ryN2l71kvS+o1ib
	DzooI9pnK/TeTywVVCFoAbYUwiyLxlQ6sWqolqk=
X-Google-Smtp-Source: 
 AMsMyM7hPAFlZs/mmjog5Ud4DMDXgvY6nHOK72TENfek1AdGJNGVsIhUs3XnN9golehaNM8mXRFn350PnDCptzJ1LKM=
X-Received: by 2002:a05:6512:1283:b0:499:d0a3:3ca8 with SMTP id
 u3-20020a056512128300b00499d0a33ca8mr8988819lfs.665.1664212170576; Mon, 26
 Sep 2022 10:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <17174D5BCC8D1164.8129@lists.openembedded.org>
In-Reply-To: <17174D5BCC8D1164.8129@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Sep 2022 19:09:19 +0200
Message-ID: 
 <CANNYZj9fzU6VOEGGQjjvM8xCHPCRUXYuiA+uXyoL_p3XqTje+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 17:09:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171071

I've just written and sent a sort of 'introduction' to the official
layer setup tooling:

https://lists.openembedded.org/g/openembedded-core/message/171070

Build configuration management is a separate concern, I have an
introduction to that too, but not sending it yet, as particularly
oe-setup-build needs to be reviewed and discussed and (hopefully)
merged.

Alex

On Thu, 22 Sept 2022 at 23:54, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> First of all, I would like to understand why writing to .templateconf
> cannot be replaced with specifying TEMPLATECONF= in your setup.
>
> Then we can maybe proceed to the similar question asked earlier about
> replacing writing to bblayer.conf with using bitbake-layers to adjust
> the layer list.
> There was also a question about removing the step of creating a custom
> template altogether, and just writing a build configuration directly.
>
> Where are the answers to those, Peter?
>
> Alex
>
> On Thu, 22 Sept 2022 at 22:32, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2022-09-22 at 17:52 +0200, Alexander Kanavin wrote:
> > > .templateconf is not the way to specify the location of custom
> > > templates, and never was.
> >
> > That much isn't true. It was a way this has been done, it was suggested
> > as a way people do it and it was even documented as such. The original
> > commit does make the intent clear:
> >
> > https://git.yoctoproject.org/poky/commit/.templateconf?id=614faa66a442069b8cd81ee74a01ecc5d73870d9
> >
> > I think the key point is that it has been of limited use as it requires
> > a custom repo due to the use of OEROOT. Where you had a custom repo, it
> > was fine to use. Poky was one example.
> >
> > I haven't read back through the discussions but I suspect Peter must
> > have some kind of custom repo setup like that to be able to alter files
> > in OEROOT.
> >
> > > It got added to documentation by misunderstanding,
> >
> > Again, I'm not sure about that. I think at the time, when layers were
> > much newer things and technology was more in flux, we did think this
> > was a valid customisation. At the time we were suggesting people might
> > want to use tools like combo-layer to mess with repos.
> >
> > What the documentation doesn't make clear is that this trick only works
> > for repo alterations as far as I can see.
> >
> > Since we don't recommend such repo alterations now and combo-layer is
> > pretty dead, the code is of limited use and I do think it probably
> > should be removed. I therefore don't like adding complexity to
> > something which really shouldn't be there at all. I appreciate this
> > does looks like it creates a challenge for Peter's situation though.
> >
> > I have put off touching this particular area of code since I know there
> > will be a ton of problems exactly like this. The success or failure of
> > such changes does depend on how the migration is handled. A large part
> > of this is communication and to some extend negotiation too. The fact
> > I'm having to start trying to understand all the details is the
> > situation I didn't really want to be in.
> >
> > I suspect to get anywhere I now need to go and read all the previous
> > threads to then try and unravel this :/.
> >
> > Peter: is there a pointer you can give to the setup you're using?
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170995): https://lists.openembedded.org/g/openembedded-core/message/170995
> Mute This Topic: https://lists.openembedded.org/mt/93847437/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

