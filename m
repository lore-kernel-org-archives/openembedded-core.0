Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22C8EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 13:19:35 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.12743.1689859170552735474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 06:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nZaGeuq2;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-783546553ddso33783739f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689859170; x=1690463970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIjLIAg+lRKYivvCcJDhJ6fhlfUjXue8fly+eOkylck=;
        b=nZaGeuq2Ew6wSaoNFa55yyjyD2Aqr9pDfAH5d3qGTE1Cz7xkBt9K9L/vounblJ7epx
         i6kYcpO+Oj4x8CnNBZyA4OR/FqpZPHLaTkNIiAn7HpD5OBoHB1t4XZcWvNZs8C4FIy4F
         5JRoVWnD530rwr7j9v8IhPwW6V5DBcAmwbErmKE2QXjXzwiqNhLGd2CN1sh3c2mHVq1s
         gpsrzMpRxFvr6qm01MI9N1U1Ca6I+7mPis5lTztNVVoU9adTSkRqCnEjfRHnrqVDS9wA
         cwTkmWh97PJFxDXjVpJAC05RDOHke3ztxvMTjKsqfIt2THMMunhlt/HqHjhgdjh+K9sy
         ZNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859170; x=1690463970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIjLIAg+lRKYivvCcJDhJ6fhlfUjXue8fly+eOkylck=;
        b=bsDzR0SkOp3ZKjz2ET7PCuPhWKKWnepmiMMBpy2cy77505r/Nz2or9jcmTEoQ6yCVG
         Vryx5T7mYe8H2AYHVLye0RdOcgAipd3fSfLCxdHdZY33EbQKZmvgf5uNxxgn9VqNK8x7
         +3Ol6zbrqyYnv5XDtmfU0Xl+Qw9zfP8GqtNaZQeevWexaal3X52ZMEPlQyhShw/mU7B7
         dfFU9YtSZDV56heupYRbHQrQ1Kwt4D66Urft+Dn5DGtcJWP54ADU8y8NuH4w/mcgamz+
         fclmFzv6hA4rxYQXBseWSvEMXEatxV7WbdTe22qrSTXIxp9lRaLcniLdsbHZ+sEx78G9
         dU9g==
X-Gm-Message-State: ABy/qLb/CazeaS/DAmrWeMyqrFGWTTqZBVjGhCQ++H3wAY+UAN2UebD7
	/PuHWE13GbH+UvM+j10U9tpeMpnQxRcRClvaig8A9ibwYzY=
X-Google-Smtp-Source: APBJJlFeVhAgm5OjR24fiBKMlloauqLxCVv3BTykIpdsWCcOCiTnOh/3hyu2SYTEuJez3KGIjc97NjjdvCDURF5ENoo=
X-Received: by 2002:a6b:5b04:0:b0:783:6ff9:a6c7 with SMTP id
 v4-20020a6b5b04000000b007836ff9a6c7mr8763246ioh.6.1689859169767; Thu, 20 Jul
 2023 06:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
 <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4OBjLFxO8x3X1tBvzwU9P=nFU4iVx-qgAphbrboqxu1nw@mail.gmail.com>
 <TY2PR02MB367838917BD294BF286FE226813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4P6NXH-7am1emePfWaZN43e58FsWe9_Rdj2_PdXD6b9RA@mail.gmail.com> <TY2PR02MB3678FC5D7379332D46E8A7EB813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: <TY2PR02MB3678FC5D7379332D46E8A7EB813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Jul 2023 09:19:21 -0400
Message-ID: <CADkTA4Nc2d0buGL28_uiRJWnCxqfE6S83dmcBPo410J0voRbpQ@mail.gmail.com>
Subject: Re: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
To: Petr Gotthard <petr.gotthard@advantech.cz>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 13:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184638

On Thu, Jul 20, 2023 at 9:16=E2=80=AFAM Petr Gotthard
<petr.gotthard@advantech.cz> wrote:
>
> > My question was about CONFIG_LOCALVERSION_AUTO being something that you
> > changed after the first issue popped up (I understood what it was chang=
ing from
> > your first description) I can't clearly see if you turned it on in resp=
onse to the
> > breakage, but I'm assuming that the answer is yes.
>
> Oh, sorry for the consuion. Yes, I changed the CONFIG_LOCALVERSION_AUTO o=
nly to reduce the number of suffixes.

Ack'd. Thanks for confirming.

I'm coming up with something that will keep 6.3+ working, and not
break older/existing recipes.

Cheers,

Bruce

>
>
> Cheers,
> Petr



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

