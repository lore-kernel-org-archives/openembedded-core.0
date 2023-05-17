Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E964C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 18:26:51 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.58300.1684348009708531411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 11:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Xy2JxTwP;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-965a68abfd4so196012966b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 11:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684348008; x=1686940008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4vyEEYFCApW6oZhgzjeIH2qcKhlFCC7o6EQ/nogXAY=;
        b=Xy2JxTwP+zsyOrOtr/7hqVeoh26NVvHJhW+HLBuOlVdG7vZxQSz2rdSSMrO7evOIFo
         hxso7Deu02J9Xk2KU1Qg912yKQfbp69xgFADSoyQooh1nSNixbD1dADMjXfJGY+O/r9j
         AKy1tezAozS14jdIjENSMjP1tXUd5LmLaUQ0wP4ING2QABVICvmkylhPBC+5XUtjY5FT
         2WF4+oRQiBKwdtVAuIQleAjy9fxOo3RXLU7dSaUXd7fOXCGSBvYKbhBz41Qf8w59w8Gp
         w59cxYf+tORqTMel7KP0FF3GErk9GU9ccXsIVAxavOvTOvxPRscsbbUn1qEPVsRgkOSu
         KbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684348008; x=1686940008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4vyEEYFCApW6oZhgzjeIH2qcKhlFCC7o6EQ/nogXAY=;
        b=GlR2TXqyYxgjUdAj9mKP4LWVVCL9EspZwhPsuICBXzVlxlNxQr0+8tj/gw/Li8IYXy
         tr8Rsm3TSnywd8tMyRGqxmBpZuE4Q7WTUWpFkvVoruKk0z5pk4zkMkYjCBEpC9CFEAsc
         YrUD8Z/LdGflM0jw1WlnSPPTFHvw0Tvp3dtedHRGYbZe42XGp7E1Uiv/R5rl7OP1sCu/
         m19cGcfIrCA7/8EGtwt9T05UKLkHj0IM4WAcGYkv8zIys2lpLBR0S3I9nbfBGooqIqzq
         Vf2RnSr/TwB8QVTMXBDyrS4TFKvPNMrX+bl2ZAT7KBTTgT6ls069AQM4AeNEIJ+3aEU7
         HZ4Q==
X-Gm-Message-State: AC+VfDxV1DAAv4f+6ogPDVpD8U4t6I48Khn1u9GRTWK2sQNttuD1Q924
	OEuM9a1yZj5P7W8OrV7qZIqsQamaiGh3Wn42wvdg+w==
X-Google-Smtp-Source: ACHHUZ4U2KTuh/9PsExJmsCoJv8y0EUzlWk0p+GPdjnPbB0Bp0Z4IG6Gk/8KwcS1HiNXDvvM3fp3U+Qba1wrdX6Lf6A=
X-Received: by 2002:a17:907:d86:b0:94a:9c4e:d2e9 with SMTP id
 go6-20020a1709070d8600b0094a9c4ed2e9mr37871653ejc.0.1684348007995; Wed, 17
 May 2023 11:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230517100548.1431325-1-niko.mauno@vaisala.com>
 <CAOSpxdYYTopMKiqESto5VsrS6yfYxU1dxRz9XvH3zXEAt-+mwA@mail.gmail.com> <35aedcf0-4dfb-f085-f1ff-2ccc16cc0ff0@vaisala.com>
In-Reply-To: <35aedcf0-4dfb-f085-f1ff-2ccc16cc0ff0@vaisala.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 May 2023 08:26:37 -1000
Message-ID: <CAOSpxdZz6LWh=ovpT-VgoD6Kh3yjFL1M8P_w7eTgZX=DepwAtQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gcc-runtime: Use static dummy libstdc++
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 18:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181500

On Wed, May 17, 2023 at 8:06=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.com>=
 wrote:
>
> Hi Steve, I must admit this is surprising to me as I am unable to
> reproduce the failure You describe by issuing
>
>    $ git checkout poky/kirkstone
>    Note: switching to 'poky/kirkstone'.

Sigh, your patch is fine!  I'm the one who messed up :-)

Sometimes it takes more than one cup of coffee to get going in the morning!

Steve

