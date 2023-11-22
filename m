Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21FAC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 01:09:33 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.9264.1700615369239379800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 17:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tthw05Cb;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso8829997e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 17:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700615367; x=1701220167; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJqyw+kD015ZjIUUYsW4zKGVe778EoFZGz4v+afr6dk=;
        b=Tthw05Cb9YlKZ7eZ1NuaAN/FDXelvB/xVsrZeUe03D1hyTBurNlvThO4aJEH9EsE22
         E8k+I0Yg/vgg4JhBNaJ84+Pkp/oQLzCmG9wkRAWxEpYYvcrtz3YnbrN//Qd7hNa4z77V
         gz/6Om4abGeogP/Tq/MyK2OC8l7hN4XiiB2Z+2C0n+x622TXujaKbV7ve+3+X4F1yfr9
         WZlUBpRSXzIv5HDeoAVqBY952nylqkJkyW/ol6TCXGASzrI6iENVVAQgDbSrhgEwMdFk
         WEd8QA2f2rdlFTgcJ/EzreJeyYqbMdLw+StbUFyv1fGVS5olIpkSwb+LP3HOtCQM9Czi
         M6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615367; x=1701220167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJqyw+kD015ZjIUUYsW4zKGVe778EoFZGz4v+afr6dk=;
        b=qsl7Qbag87G/rFYo6UKLszZNS4FRtbl0PUPKrA4wutIT6LdH4C2qS1gEKcJN3IGXeJ
         JC+HjkiRYgD2MsszSH+lFIdOHH/DrWXN4RX2emV3J5MarSvyPhNr+liTtQtfvL2fTB3n
         lSG70Onu1j6mHFczoDYttxkscxYZ5ppdusX1ZFThiwS4rjb0337H1iemPzs/6lCzNIKH
         leSrzUYaLosSmk6YiBu/OG/LJCxpU9Uwtkj00Su6zPOly8nr+EDGdzDEdOcc5O4uXz6s
         dBcZvvVD6dL7km49iNhFvlDWL+pKD2sv6RGkBG/wTmdzoQHRQslxh203eKZheV0Atn4h
         fRAw==
X-Gm-Message-State: AOJu0YyLQyDC1co8cKzXYtZFLJhavI6KqrSugjGaVQqbGHPn/dsHiOjU
	9931kgPk7pbWlqGpBowgLwYHTINxxeUaVpyR+68=
X-Google-Smtp-Source: AGHT+IEJ6VryUNIR6Qqqdq0YEgC+cUgfkthaR4DrbqIv8+i/j9YhAVD2N3IiSPYk6KwJ2Y8+BWQvntvJ18s1HKl12Oc=
X-Received: by 2002:ac2:5544:0:b0:509:4d7a:ab05 with SMTP id
 l4-20020ac25544000000b005094d7aab05mr625459lfk.11.1700615366995; Tue, 21 Nov
 2023 17:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20230901233231.1109712-1-michelle.linto91@gmail.com>
 <141c44bea4477d552aa4fc0371094b8ad4dc65b5.camel@linuxfoundation.org> <CX4JZ6RNH5K3.25S4AEXNBYWSB@ablu-work>
In-Reply-To: <CX4JZ6RNH5K3.25S4AEXNBYWSB@ablu-work>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 22 Nov 2023 03:09:15 +0200
Message-ID: <CALT56yMYfkPNji4v6j05+WDgQ7W9gdMkzP_jGGzzxKS7X_VKsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uki: Add support for building Unified Kernel Images
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michelle Lin <michelle.linto91@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>, Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 01:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190997

On Tue, 21 Nov 2023 at 16:44, Erik Schilling <erik.schilling@linaro.org> wr=
ote:
>
> > > +BBCLASSEXTEND +=3D "native"
> >
> > We've long avoided a systemd-native recipe as the meaning can be easily
> > confused and I'm not thrilled to be adding one now.
> >
> > Perhaps this should be as a separate systemd-tools-native recipe to
> > make it clear this isn't full systemd?
>
> There is another catch: ukify depends on sbsign for some options. Here,
> this dependency is not expressed as RDEPENDS on the systemd
> components but only on the uki class. That of course gets around the
> meta-security-core dependency for systemd, but not sure how pretty that
> is.
>
> So we got:
> * python3-pefile in meta-python
> * sbsigntool in meta-signing-key [meta-security-core]
>
> It looks like we have these options:
>
> 1. Add the systemd-tools (or however we call it) recipe and the uki
>    class in meta-signing-key or friends.
>
>    This might become a bit icky with different systemd recipes scattered
>    over different repos...
>
> 2. Do not put a RDEPENDS +=3D "sbsigntool" into the systemd-tools recipe.
>    Move python3-pefile to oe-core.
>
>    This means that some ukify options will fail. Users will need to add
>    [R]DEPENDS on their recipes if they want signing. This would allow
>    adding the systemd-tools recipe in oe-core while adding the rest in
>    meta-security-core.
>
> 3. Also move the signing tools to oe-core.
>
>    Next to the python module, this also requires to move sbsigntool
>    to oe-core... In the end it allows to set the RDEPENDS in
>    systemd-tools.
>
> I got no particular strong feeling on any of those outcomes... Any
> opinions? =F0=9F=A4=94

My vote would be or #3 (the cleanest way), then #2. #1 is out of
question from my point of view: there are perfect usecases for
uki.bbclass, which do not involve signing. Adding dependency on
meta-security-core looks like an overkill in this case.

--=20
With best wishes
Dmitry

