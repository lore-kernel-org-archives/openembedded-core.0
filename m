Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F5AC001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 15:41:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.16439.1690904505438782490
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 08:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JAeionff;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe24dd8898so16707235e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690904504; x=1691509304;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F778nNBC0mqWtP9gxstLz1SIg8WB2yYNwq6TMvvro4I=;
        b=JAeionffbMTvXnxA3pcKm7yc7ASnrfSRC8lt3Bx9nd9AvTYXYP/3mTkBjKgtaQ9ToM
         QHKjE+luOSCVGYu9WjZ+NZtdTM4c4qD9/78pYkUKk3q3wnBWjH3bkM9V50hP5bxVpY8O
         T0d5XPm+wzgarq7umxmI58xONi8mCowwiFCts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690904504; x=1691509304;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F778nNBC0mqWtP9gxstLz1SIg8WB2yYNwq6TMvvro4I=;
        b=XOVI6AEjucGCJdEJrJchzSO9/9Y0abhCSfEc94pd3nTu98be0yMq5JqN3MLkjDcb2I
         Uwuj/iiMg6CvwscjF0Tyi9ZwsAjcys2wWkxF5wfgNn0NB2+p9r2du31FD0paNpp7nVZJ
         ukN1to1qbf1xMdgaUfnP+k/bCMxGFCXcuzYXLmssuJQJ3qJbTNvdxJoa8FR0p32Luw6D
         3qq/7TaLFUTH9whK4l9kdtSDf0jrzHyNE09CZPMzgwF5lj8AHDZpmMVXWAsIil7O0FoO
         Z0+C8pYqLJtwLFPwXeKOmq4qmaRUl7LH6KGsRupOjWUhDX1BZoAwIp4PrkRWQVoK/NYR
         FqXA==
X-Gm-Message-State: ABy/qLbJx5UmEyD8konpWjBqvUW72vFeI+QMupG509Xt2FSpFqrqyXI5
	pI1ZZPxhmfpn9e8oaeOLMBbeTA==
X-Google-Smtp-Source: APBJJlHhglaDQVP4rMNnTYnQyk+VIRGX7ueCOOhawyBjfvAqm7Lm1MoKT6ZhUe0gekUvNhGd8Z/Ncg==
X-Received: by 2002:a7b:c40a:0:b0:3fe:2102:8085 with SMTP id k10-20020a7bc40a000000b003fe21028085mr2669872wmi.8.1690904503794;
        Tue, 01 Aug 2023 08:41:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3b7:1714:595d:8417? ([2001:8b0:aba:5f3c:e3b7:1714:595d:8417])
        by smtp.gmail.com with ESMTPSA id v25-20020a05600c215900b003fc02a410d0sm16826802wml.48.2023.08.01.08.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 08:41:43 -0700 (PDT)
Message-ID: <2fa1c6d32bae5fad13dba22c328d41063a519eeb.camel@linuxfoundation.org>
Subject: Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, Martin Jansa
	 <martin.jansa@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Alex Stewart
 <alex.stewart@ni.com>
Date: Tue, 01 Aug 2023 16:41:42 +0100
In-Reply-To: <VI1PR04MB5373E8E3C680850A6293BC9D910AA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
	 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <20230727141809d2150cbd@mail.local>
	 <17762A3A069807A3.31298@lists.openembedded.org>
	 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <VI1PR04MB5373AB9F0C887CF659E739439105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <CAJdd5GYifrOT_9-fct6TT95sw6tDe0L7etLxOcaEgTTGvWFPJg@mail.gmail.com>
	 <972083f47f3513fada3dc64c233f2c229f952aca.camel@linuxfoundation.org>
	 <177710C9CE043B33.12785@lists.openembedded.org>
	 <AM6PR04MB5368B2FF63E716221B740A029105A@AM6PR04MB5368.eurprd04.prod.outlook.com>
	 <CA+chaQfRM855mvJwnxvUKk_JpXq51AS7uXuqM0qv=Uayj4OQNg@mail.gmail.com>
	 <1777455C95C57250.15736@lists.openembedded.org>
	 <VI1PR04MB5373E8E3C680850A6293BC9D910AA@VI1PR04MB5373.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 15:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185251

On Tue, 2023-08-01 at 15:16 +0000, Piotr =C5=81obacz wrote:
> Hi Richard,
> you were right. I have made another test with wiping out whole sstate-cac=
he for acpid and rerunning the whole reproducible test.
> It occurs that the package /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c=
87c13/poky-contrib/build/sstate-cache/a7/41/sstate:acpid:core2-64-poky-linu=
x:2.0.34:r0:core2-64:11:a741afe7c0bfc218a844a546735ddc4dcaf578bff5d6a3762b1=
bdedf0819fc9b_package.tar.zst was already containing wrong timestamps.
>=20
> > I'd guess you need to make the sstate archives of do_package store the
> > acl and extended attribute data and when that is done, the millisecond
> > timestamp data will probably be saved too?
>=20
> So I'm guessing that commands which are producing this package_name_packa=
ge.tar.zst are producing it in gnu format. Question is where can I find it?
> Is it being produced in this sstate.bbclass or elsewhere?

https://git.yoctoproject.org/poky/tree/meta/classes-global/sstate.bbclass#n=
859

tar -I "$ZSTD" $OPT -f $TFILE *

or

tar -I "$ZSTD" $OPT --file=3D$TFILE --files-from=3D/dev/null

Cheers,

Richard


