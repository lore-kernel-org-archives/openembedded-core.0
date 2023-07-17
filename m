Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A74EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 14:26:27 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.9589.1689603980971707103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 07:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xfVwX0+3;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9924ac01f98so641527466b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 07:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689603979; x=1692195979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkP0iNP0E5r4OmK24G1Z+Y0ut7wcm4FvPAql/qGMzi8=;
        b=xfVwX0+3lBQt2gSi3YRWl/1jxp4m/iVhoWbclog/1rzFb0RDOmRwcTjDZC8lLNB9+Z
         hx1Y5PyHcVjWrpB+TtaJ61yr684wK/YsvfLX87eWlIHgqrpighPImLpoPGH7v0DUADy9
         G5D5ojRwTmCxnioqXnxwrnXNXc14cI7wVyWYK2A8idSNBuMZD6AVxkR+v8Y/G8mmFz3f
         J00kkrjJwPLgJV1IT2s9jGqk36WJYXN7CG1a+Jvi6e6I3wINo8onMMO7olukb8MEnWYs
         8XgNGfPA1hcPD/zsO3mTcGHL5TFGAg/j6ExZe+C5s6NTRNFJViHr3/DFPgby36Zsb5oB
         rgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689603979; x=1692195979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkP0iNP0E5r4OmK24G1Z+Y0ut7wcm4FvPAql/qGMzi8=;
        b=MBrm/dQLvTQmDSXnDQMtHDRegRa9U7BCTgL/EHUYPNReqVZmJ8mhPZJOb6bvr5R2gQ
         Mf7pmu+RR7/H3SR79dj1PiJVIygbIu0Tcino+ggq/kRBwKlNXPbYdFjcXbNrl5VbFE4d
         CDC3uohHCveg3mRCs6aiV9uD0qY9HWnJZ9LEdX9X7M6NqaOVs0Gy1OPXEs29WUINjOs8
         nkkra2N3qi9MQTgsbOKEkRulS1ZplnvKkFU2dc3g5XpaN7l8KVTybzNLNsfdg4YvMLce
         pCws8KdkJFIWTeRXeZwaLBbMQwdTNsopktrc5VeqcSeMYK6zdxk2bJePW6xWs2KN/f+K
         qDrg==
X-Gm-Message-State: ABy/qLbKkggxT85XXakbbDDDVbPT5p8r281wkQoOhxBv0rH12za7OHcI
	V8QaLZ/2XhjPw/u5s2DAfzQdpEvcnbIKoJqKA6/OIbrGKgSz43ii
X-Google-Smtp-Source: APBJJlGgU7Bt2FuAIPWc4fyBW5COaQOqQhLGlvDuNKZp5HDGBJOQI1ZwMon8FkelGs7zPih4tQKmWiAYyFf0eHNLZPs=
X-Received: by 2002:a17:906:3f57:b0:994:4be9:d865 with SMTP id
 f23-20020a1709063f5700b009944be9d865mr7368940ejj.52.1689603978949; Mon, 17
 Jul 2023 07:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689373875.git.steve@sakoman.com> <7272fe3663fd9eb6144138f6b090075af6eecaed.1689373876.git.steve@sakoman.com>
 <CA+chaQdH1xn8WMmgip89Gae=m6nM1ONEDWzXoB8-GzskfpGv6Q@mail.gmail.com> <c838ca7a8fdaca76fdc30158b5acd3f8f75cf67d.camel@linuxfoundation.org>
In-Reply-To: <c838ca7a8fdaca76fdc30158b5acd3f8f75cf67d.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 17 Jul 2023 04:26:07 -1000
Message-ID: <CAOSpxdaTAiENEKBYMGAXTDqscda17RfNRiW9uRWDf3vW6vhPQw@mail.gmail.com>
Subject: Re: [OE-core][mickledore 26/26] image-artifact-names: include
 ${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and ${IMAGE_LINK_NAME}
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 14:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184472

On Sun, Jul 16, 2023 at 11:23=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-07-17 at 10:38 +0200, Martin Jansa wrote:
> > This isn't backwards compatible and various BSP might need small
> > adjustment to work correctly with this.
> >
> > Please don't backport this one.
>
> Agreed and 25/26 probably isn't needed either.

Thanks for the review!  I've dropped both patches.

Steve

