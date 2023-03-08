Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C884EC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 19:11:28 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.2036.1678302680982128388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 11:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VQ/+MdYe;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id h3so17618755lja.12
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678302679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAhXa68M/9D7yrl7O/gtlKT5KOzP+S6ywfnL7T6Te8M=;
        b=VQ/+MdYeeLRgMrEbQzlGHFmnXloy57UEorE53ekQgPXBIrziBSWyxOxb63EWClMY9i
         IBgwiMIeMx8ONLlrhB7Q2ZitgVY5wkVVzsS4KAm1VGRq3fsjciCStDofCBV99tFCEcBR
         rLUESyztOUmpvOYXlYWiAT9mWmPRn376g7hbQOzfWnGrLCnPMh0ekrXM3q1G7cbdVhOs
         BdfpbQJvhs3tNGo0fDoU1xe6j8S84+IhqzH0Nyre/27ksCnxhYbG9A05Kvo6nnFhTf85
         DtlS1unx1ccSrBCvXvW3048Dv2OBaO+JzkWfg5K2qe2BhUHL4BJkB1qLvEYvMWJL/QDu
         zCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAhXa68M/9D7yrl7O/gtlKT5KOzP+S6ywfnL7T6Te8M=;
        b=sfa6uFXuGjoB5tnq2K+mmWnVUhmBe6evo9BqtbH7FGcCENQSmGkRhw48bon3k3FP7k
         UkkbfJPGBl08E0C6D8ZkfnH6+TLYgwqImjbf/JkXDkChjO7YWQ4E1EXh379gqxSQJbw/
         TyZ0BOQY2MNyRRqPJFt3q6uHRHcILPf9go4Op26sWTGcDeTKCqBdDEBEX3G5bmGtmAtk
         mDHpmdfjekSAZutdAH792qcu8CX79CRamIzsLIcXzmBo4c6hRi06nmI+eeJPDX3SjsTS
         6SWm5ue9oAqPMqKY8kpZ6V0qn6g4WkDoegyF2ureCLPuLNu0axRW43whRXOkiBNMwYuc
         VYJQ==
X-Gm-Message-State: AO0yUKXmlh7GTAfng+vr0qpmoHN5WDlvHXs8cBCoQRduTLGDXKXsJ3qB
	QnaZICkljsU42EQU4zyFo9/5mBV30T/gJ53IwxA=
X-Google-Smtp-Source: AK7set9rL7IT+zvrQde375l0iBUOMa3rhMg4QpIkBBzZ9EiPIGmDiAj7OH5DBw13MNnkzURDh8f66ZWfLzYJD0CUra0=
X-Received: by 2002:a05:651c:2322:b0:295:945d:b381 with SMTP id
 bi34-20020a05651c232200b00295945db381mr5947812ljb.7.1678302679130; Wed, 08
 Mar 2023 11:11:19 -0800 (PST)
MIME-Version: 1.0
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com> <20230306091108.3347363-2-zboszor@gmail.com>
 <CAP9ODKqgw7+wv9VWTHF6KrNmcVZzgdujKNTthWiM2zCxJZXKgw@mail.gmail.com>
 <CANNYZj9qaL310h66gXiP2ZR2f7ywhWHDzrgvFnyMQH7cFwArqA@mail.gmail.com>
 <6524a686-7e21-7c69-4fee-e17d4d757108@gmail.com> <CANNYZj_B1kxRB4bPWwCyU-90fR=ez0y=WGzdTjo16W05k5=Gww@mail.gmail.com>
 <c986ecfa-458d-b7a2-a69b-9f5cc4a3af0a@gmail.com> <CANNYZj9p+zBOA=Ng_zWafM8aaw=dEMNMcD450XmbVcQJq9R++A@mail.gmail.com>
 <1575601e-27f5-59ea-12cf-df9986f8401b@gmail.com>
In-Reply-To: <1575601e-27f5-59ea-12cf-df9986f8401b@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Mar 2023 20:11:07 +0100
Message-ID: <CANNYZj_jQwKcB_7xikpx58CRXWPcJfZMV5D1Tf_o_bpLS=SuEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] mesa, mesa-gl: 23.0.0
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 19:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178195

On Wed, 8 Mar 2023 at 06:28, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
> I think that was already brewing with 22.3.x, since that version
> cut off the "classic" drivers, keeping only the gallium ones.
> Like the kernel, Mesa's drivers were implicitly expected to work
> with everything built from the same main version because
> they were using internal structures that may be reworked
> from one major version to another.

I just posted a RFC patchset that switches runqemu to use mesa-native
fully. Some form of that patchset has to go in before mesa can be
updated to 23.3 - we're in the middle of feature freeze now, so it'll
likely have to wait.

Alex

