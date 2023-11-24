Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1605FC61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 16:50:19 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.143955.1700844617671245091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 08:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iHF31pec;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35b144ba935so6406235ab.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 08:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700844617; x=1701449417; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqlBIjgcW+TxFuHX/y3FVaVmqtJwYj2oWZPdT/97VHk=;
        b=iHF31pecr4XEJZP/KRZ5EstDZu3FIs5VTV+9RhSpBw9lKUtoDdE8cYaV4nZ9dbbMRC
         IgqTqfnHzBXHksVBT3U75ZRXcfMBXX7mv2s8MM/QuQ3Rjw6II20JGhbN1uVYBifIVUzQ
         r5qMTWjkSe4sPreaEL3feDQ4cl34zY5Lc9rttLfxlI60X3jYGJhChbM3pu5O1pIkgZzV
         MXeqNtHeUiWqjrc3Da7sYwAwCTxGhFhvZi9dJLPdxNGJyb/o0aHsgcKgy2zztvyJviFu
         Ig80yBbG0wUyvd9rzG8dXen437dim3dwEB885gUQMn6ziGaVU7/kfK6wPioevbsKMFAm
         ha8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700844617; x=1701449417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqlBIjgcW+TxFuHX/y3FVaVmqtJwYj2oWZPdT/97VHk=;
        b=SlbNYKf8mgv/VHWP+SI/uuYLZVE1GE8685CbrikT54jMwDq/wpPlw7T+RLJXsGILA0
         6C/h/fpBTbjeFPQFW6xdCuxXJz4ZNEFAngtgynYsyjkmPz4KGPtuOUnum5ECk/HhtapX
         k7E1zJsJ0DhC1qbprk1nylDV5avyIjFGIGXRtKCBNTcHAtR8ASSovlrFYVBQ7NPfVh3w
         8r4DGcgaAMDq18+RX8mYp46rA+PaptmseSq2L7bGwYKZN44iW8JWsHMLyO9buZZnudvT
         2TwGdcCApW1nEJvgayHMzBfELGVxNVUFzGM+B7TIIVOBG+/trbBKuslpVxYuHwxp/urc
         dkWw==
X-Gm-Message-State: AOJu0YzpU/+1nokUzaf6iRPEdcHVeSs5npiFSX5PUJRIRRb/h3cP5bpg
	s4l2N2pmp/RDJT74R5XojPgvlsqSMFdAUchzdjw=
X-Google-Smtp-Source: AGHT+IF/5fbsMa2WJUsXV/sF32LTI3jUfAEF8vjXoOFf+9BLllQ5VWoooGUcPziVLGrrG+1prPkX3T1i6WPvqGkInE4=
X-Received: by 2002:a05:6e02:388f:b0:35c:695e:5423 with SMTP id
 cn15-20020a056e02388f00b0035c695e5423mr2306967ilb.1.1700844616857; Fri, 24
 Nov 2023 08:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20231124062142.4189235-1-lizhi.xu@windriver.com> <179A9492C983FDD1.9514@lists.openembedded.org>
In-Reply-To: <179A9492C983FDD1.9514@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 24 Nov 2023 16:50:04 +0000
Message-ID: <CAO5Uq5R5JP8FJWVnidjMCxRqiBME6_4rP9V6kqSPwciWkCmUZw@mail.gmail.com>
Subject: Re: [PATCH V2] [OE-core] tzdata: Reduced time zone configuration
To: alex.kiernan@gmail.com
Cc: Lizhi.Xu@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 16:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191209

On Fri, Nov 24, 2023 at 2:12=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Fri, Nov 24, 2023 at 6:21=E2=80=AFAM Xu, Lizhi via lists.openembedded.=
org
> <Lizhi.Xu=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > tzdata.bb by default pulls in all possible timezone data packages which
> > increases size of the final root filesystem considerably.
> > The customer would like to have extra timezones configurable so that on=
ly
> > tzdata-core is chosen by default and rest of the zones are optional.
> > This change would make the fs size a lot smaller.
> >
> > Comparison of customized package volume before and after:
> > When TZ_PACKAGES contains all tzdata packets, the image size of tzdata =
is 7.4MB.
> > The difference in mirror size between the two is 7MB.
> >
> > When TZ_PACKAGES only retains one tzdata-core, the image size generated=
 by
> > tzdata is 320KB.
> >
> > Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
>
> I get what you're trying to do, but this looks horrid. How about
> splitting into multiple packages based on top level directory (plus
> the few which sit in the top level directory) using a new
> PACKAGESPLITFUNCS so you don't have to hardcode the list of packages?
>

Foolishly, I didn't actually look at what was in the tzdata recipe
first and it already splits things... I'm lost, can't you just remove
things from TZ_PACKAGES to get what you're after?

--=20
Alex Kiernan

