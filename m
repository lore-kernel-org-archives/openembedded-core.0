Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CAFEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 13:04:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.6693.1689167039778243887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 06:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SVACw9Zw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fbfcc6daa9so59799585e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689167033; x=1691759033;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lBiLHPS5OTLvBH2CMuHJih/56ZrrHSY9foFPpCMvffY=;
        b=SVACw9ZwRXAIkMJA6nzNq7zMV9rU/qhoMrHGx3EaEmpx2nLp9HbZNBdOeIQ+1jPlEO
         NBxnC1Ez6Br3cBbbxEN32QdF+sSuKREoauMd5dpPF7zr9ulz/q23jS/i8dudFl+uW7b1
         rfM1LrH54+pK0I5UMW867XcABA8UTv3+ktAkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689167033; x=1691759033;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBiLHPS5OTLvBH2CMuHJih/56ZrrHSY9foFPpCMvffY=;
        b=SNqWeN1aBq4w1UsK42dSqqQvV4jjpeje9Q8vNtmDd+6L9gLN/MLSADw98NDtFsyeLs
         QcLzox2sMypWUgDzzMUyb+amVjVhfUdv8C0V9X8nzbHR+4eSp29GXq4mrwcP4klRCvm2
         A5GCpTSxKyHJwLZkNoXy42xylZHatsHlS4GzoME0F/rTwuSmqgJvJxsBfhOTHxQUzvFA
         SwunMbpePpxsGotw/Glk55skJiDSvEvIK6KIiVc5dgxv/vIcxjxoqxV2TaTb3R7rB3x4
         JxZy8fOQLTV/KR1VdrM5wslfzwg7nFiZmhxCTdRsFCZNVhts1VJrxeuZfYZ+TvrQXX2d
         AVug==
X-Gm-Message-State: ABy/qLbHHgNRdi1oizN5PjyQEFz4u7FLspTy3WZJ9JDJwBPI5X0XQAoG
	NFjyyLdHuzhsM4y5EFx/lWxGGQ==
X-Google-Smtp-Source: APBJJlEGn7VzeZV5Bnn+UXuX2sonohmhlxHhg94xRJ+/c0My2sZj7Aa9WF0kAJZiMt0951hcv2NzQA==
X-Received: by 2002:a7b:ce11:0:b0:3f4:a09f:1877 with SMTP id m17-20020a7bce11000000b003f4a09f1877mr15048393wmc.23.1689167032764;
        Wed, 12 Jul 2023 06:03:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:339c:939c:6851:d3b0? ([2001:8b0:aba:5f3c:339c:939c:6851:d3b0])
        by smtp.gmail.com with ESMTPSA id i17-20020adff311000000b003143853590csm5056408wro.104.2023.07.12.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:03:52 -0700 (PDT)
Message-ID: <9403c0c588465045e0a06be0f9e3f4d4ddf5bc80.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>, "p.lobacz@welotec.com"
	 <p.lobacz@welotec.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2023 14:03:51 +0100
In-Reply-To: <E786EFAE-239B-424A-A0A7-67385E4A076F@arm.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
	 <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
	 <VI1PR04MB53739BCEE43D11E08D0202E79136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <25f435cb5536206f10a339ed0a20cd9c990a1a9e.camel@linuxfoundation.org>
	 <VI1PR04MB5373801F47C0AB61E6DC0EFB9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <57f1d335c7b34bfae272ce2bdd0d141c7e7d72b6.camel@linuxfoundation.org>
	 <VI1PR04MB5373A55313F357CB40C72B0A9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <E786EFAE-239B-424A-A0A7-67385E4A076F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 13:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184200

On Wed, 2023-07-12 at 12:50 +0000, Ross Burton wrote:
> On 12 Jul 2023, at 13:38, Piotr =C5=81obacz via lists.openembedded.org
> <p.lobacz=3Dwelotec.com@lists.openembedded.org> wrote:
> >=20
> > Guys, the decision is up to you. My first decision was to use it
> > directly in DISTRO_FEATURES_FILTER with this, but also
> > conditionally.
> >=20
> > Probably this is why Alex has written to move it to
> > DISTRO_FEATURES_FILTER_NATIVE instead of using it with this
> > bb.utils.contains
>=20
> FWIW, I=E2=80=99m with RP: just enable for native.  The build dependencie=
s
> are trivial and it=E2=80=99s one less way things can change and cause
> problems.

It also may allow better native sstate reuse so lets do that.

Cheers,

Richard

