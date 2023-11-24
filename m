Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5617FC61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 17:42:49 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.145054.1700847765959564698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 09:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SnVFdTOC;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c887d1fb8fso27759101fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700847764; x=1701452564; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr4rzWpC4vWcSZ8k13qJwue96hnNMVWzfLgC1YfBE30=;
        b=SnVFdTOCyiR5uLwkJ/neAwnj3aTV1MOaYjNE8HWEuqXAthQTlsNdHZad4y0fpicUun
         ig7yOOjap9RJO4y8miHztvHB7d3jS4GJ+wsedpRTYYFQ9Wvb2CwQ/ENEwL+d+1XVibLZ
         PmgNlBjG5z24yjNSEtpLV1gSN14RojCX00sW4zNvt/70IYmKSeip7lmr7KASwGSsxhNs
         iaFuZMagEDHfJayDgJt4DLTPI2t/EwKWTmGIyn+APneSa1MeafVun9mKRgCxxOdEluXX
         b01J2wjfBmKRGYi/HJ9H23PmaDoMltoZ6W6o8ZmSjDpMfo54q7s6HBCdegwyC2kUESkL
         U+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700847764; x=1701452564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gr4rzWpC4vWcSZ8k13qJwue96hnNMVWzfLgC1YfBE30=;
        b=fKttTcNM3TqKizv6eHt0sB6HJ71NM7YdqsDBu5BAmTgksXQt+iTQkpc7A6ATqP8Q5+
         enlRx7iYAkRlc+VDa5YOf83XUy//7fEvXc4oFf3y6gVAqAQisAqX6cdwhjRUawJXBzsH
         YjM2SYCQc6gxPNb3+CjSu6kq6tHxjry9Tm4YC8OXM8xK1ISadQ+/Ef5oajdFO8g3Uy4v
         JMtE+7BJB3K9f1nfaQXgJRkZB72LqTxgqSDPcsHA9Nm3ottBggAuaN4/7XCERuKXr0K6
         sQuo2+oaYsDXRJiCe5zX14EX2nKNnOhG/G1xDqPBLfe2JVRfFNaxeyVapAExxMgzdIsg
         iqLg==
X-Gm-Message-State: AOJu0YxnfaTLsCk7mvLNqL4ESyCaPIa4ewsgRZYSwlXgU5L2GvIdecuu
	wm0mFMaTCuIUvsgW3h0I2Xife7Xzt/IQe7gqtRg=
X-Google-Smtp-Source: AGHT+IEo4ZBAIRnT+RK30buqbtOyFmo0ibcgWoQ+OB/q/t/JJ6KGOYxSmDKC/LAbvs1JpRI0Yf7xb0FwSRtSuP+RkZ4=
X-Received: by 2002:a2e:b523:0:b0:2c9:8f6b:3d9a with SMTP id
 z3-20020a2eb523000000b002c98f6b3d9amr1859041ljm.16.1700847763529; Fri, 24 Nov
 2023 09:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20231122063119.3620722-1-raj.khem@gmail.com> <462EA886-8F44-464F-88ED-609B42680F39@arm.com>
 <307F70DF-9B9F-4A38-9788-F47DB99193D1@arm.com> <CAMKF1srK4r=YYB35noP5f30JJMO-cMYUyMMixWFrAP3tdox1+g@mail.gmail.com>
 <2A0F1B32-90E9-4813-AB9C-833D1264B78C@arm.com> <CAMKF1sqRhmNGsuZP9vQDXHa93kja5eyMaEbd+U4C1EN-ed3kRA@mail.gmail.com>
In-Reply-To: <CAMKF1sqRhmNGsuZP9vQDXHa93kja5eyMaEbd+U4C1EN-ed3kRA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Nov 2023 18:42:32 +0100
Message-ID: <CANNYZj_rLxaTi4bA8ft8nw=hyAuEeh=MABDNZd1GxNtaJhzs_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v9 1/3] vte: upgrade 2.72.2 -> 2.74.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Markus Volk <f_l_k@t-online.de>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 17:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191214

On Fri, 24 Nov 2023 at 18:05, Khem Raj <raj.khem@gmail.com> wrote:
>> > > Split the packages so that the GTK3 binaries are in separate package=
s to the GTK4 binaries.
>> >
>> > Hmm interesting I wonder if it Will avoid adding the dependencies for =
dbg and dev packages
>>
>> It won=E2=80=99t, you=E2=80=99ll need to manually handle those dependenc=
ies.
>
>
> Right. So the real question still remains regardless how this is packaged=
 which is can multilib rootfs have different glib cache

That only becomes an issue once we have gtk4 in our multilib testing,
and as long as vte packaging splits the pieces properly (Ross's
buildhistory output shows it can be easily done), we don't have to
deal with it for now.

Markus, perhaps you can do it, as you have more experience in
gtk-related packaging?

Alex

