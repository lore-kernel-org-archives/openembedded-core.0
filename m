Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C93FA3743
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 11:32:09 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.5095.1667302327480695261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 04:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FnTju0ZU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id v1so19688623wrt.11
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 04:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YhV+11B6mIz+ju2GNexGWguvmZ2/pev4Sy7oO+4fSzM=;
        b=FnTju0ZUgSpy7pvvPTkB1to/9oicQ7zO6x9efLcGHpXUSwuomEJc3qXpG0ABqbET2e
         JWa+nZ6oBOJkW6S9kQ9YFZ0f8vQS9mMP3Log9BZLWPcjR0KtGpi4zG2wNSgUEmhDHZ82
         uAc5OevSJAJJ27xA9miDB5zUMU3HQffETdftI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YhV+11B6mIz+ju2GNexGWguvmZ2/pev4Sy7oO+4fSzM=;
        b=Uc0g5EttbTJjsQFh9TCgkcOQ5o9HrvpJ58KsXixynOnlJngKH+yhwenVdGNNlA9zsE
         BfIeRO2LYndeNTB3XywDS9JSD+LfJ7ozQQAz0VBrXfOWci+1zjj2++rDWVOdoO/waISf
         4xIO/OTzcojAnH6mnD+t/6dPn5Cok0TdB162+fIXAcwXu7TIPT3xPohlT9LM61cR5vcy
         /PvV0bmHiakuUamkvQcOYmjVUSXqKEn550AzgqFINbVWErodq8cwMeyP/tdCMcbeZXrX
         1SRh5ez98ygtxNo0jlRmI7f36BXszkA7CotYLRC3btWd6NkYSX9j2zSMjidzfm0L2tgf
         PQAA==
X-Gm-Message-State: ACrzQf2Wodbo4EgOPDwumtpXgomDKXdvZMj/14rgR2GLPk6xs1/ZCCy9
	Dk4PyAyZQrRvB5wVlgmh6Uz1HQ==
X-Google-Smtp-Source: AMsMyM6EipoA0Gt7PWtEO79CUBw6qJgriNfJ2FP818WwH9LrsK1WonLfTrmnVv7JF09x9BiPCZr9ow==
X-Received: by 2002:adf:e3cc:0:b0:235:95b1:2124 with SMTP id k12-20020adfe3cc000000b0023595b12124mr11455130wrm.693.1667302325809;
        Tue, 01 Nov 2022 04:32:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f2d:d8cb:afb2:98f4? ([2001:8b0:aba:5f3c:7f2d:d8cb:afb2:98f4])
        by smtp.gmail.com with ESMTPSA id co26-20020a0560000a1a00b0022dc6e76bbdsm9984929wrb.46.2022.11.01.04.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 04:32:05 -0700 (PDT)
Message-ID: <35d2def13540f539de71fb547e001a3b1a3d3467.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 1/3] kernel: classes: Extract savedefconfig
 to a class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, "alex.kiernan@gmail.com"
	 <alex.kiernan@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2022 11:32:04 +0000
In-Reply-To: <C228B32E-EFA8-4A69-A915-4E53FFE719D3@arm.com>
References: <20221012071813.778-1-alex.kiernan@gmail.com>
	 <7C7AB85E-C822-4DCC-B462-AD314119EAE4@arm.com>
	 <CAO5Uq5Tqqt=oaGQt7kyZUg4gkJ6Uo_ahNR6itZSEwYyDX8rKrQ@mail.gmail.com>
	 <C228B32E-EFA8-4A69-A915-4E53FFE719D3@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 11:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172357

On Mon, 2022-10-31 at 22:12 +0000, Ross Burton wrote:
> On 12 Oct 2022, at 20:43, Alex Kiernan via lists.openembedded.org <alex.k=
iernan=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> > On Wed, Oct 12, 2022 at 5:36 PM Ross Burton <Ross.Burton@arm.com> wrote=
:
> > >=20
> > > On 12 Oct 2022, at 08:18, Alex Kiernan via lists.openembedded.org <al=
ex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
> > > >=20
> > > > Move savedefconfig task to a class so we can reuse it in other reci=
pes
> > > > which support it.
> > >=20
> > > There are three users of cml1 in oe-core: kernel, uboot, and busybox.=
  Does busybox support savedefconfig?
> > >=20
> >=20
> > It doesn't and fairly obviously goes boom=E2=80=A6
>=20
> If you really keen you could see if savedefconfig is a valid target someh=
ow (search make -p for savedefconfig?), but to be honest given Ulrich=E2=80=
=99s reply I=E2=80=99m fine with the cml1 class supporting a function that =
most implementations, if not all, support.
>=20
> It seems preferable to a class which is just "oe_runmake savedefconfig=E2=
=80=9D, at least.

The other "trick" that could work here is to put most of the definition
in the class but put the addtask in the recipe/inc file. That way most
is command and shared but only the valid users enable it with what is a
single line.

Cheers,

Richard


