Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D037DC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 17:18:38 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.45109.1669051115962672200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 09:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qqmtRBpZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id k19so15257637lji.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 09:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFnZR4CL9Y/3b4XZk/VxuMmJlSDFOeGH42K28xmkq3k=;
        b=qqmtRBpZWX40wn2eJapDPydZ0mxLFi0xg2VqjfvV3R0NeLWSbsJd1Q636KuM30RY+Y
         yOt/aD5L4i68oatmbfx6gYlGDTBbmOXlmUUXKQYBDoN2NoW7Rnj65w/DMcGJbmq+U83v
         4scGY1nLq/0USlJhOz4/jcyzJf4l2TgEq6S9bE0/bBSsvH7nQ+kjhcX9Dq5xdAXUyQOe
         AqwLACd4M3x2pdeTtv6Q+9uILB1DfWRU5ERGS0sGOkulOAzwNWTpKnabywvakpwz6KKt
         /AzB+TwaW26Xk7i8aqb8n1Uy3pY69zbXJp5O825DhF+LlZbMb8F+4LvMquiVG1DoIRrV
         LUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFnZR4CL9Y/3b4XZk/VxuMmJlSDFOeGH42K28xmkq3k=;
        b=QiQx6YkXApn01mLh60lDGaAoMDSOMCWlgjHtD6Kq9xa9z58h2D0+HEHnZWmA39ePvu
         hysfVGSrLgY79mP/4JsQZfcftP9r/H40wsdtY14B+yS/6lqEE5OnsrORkihJUVI+LXdX
         th+x160gR/MaJmsV4Jl6M/zavHPbAUZSoTv3p6teX0kOyKBaFAmFZ1xuKfrOsZHGPkma
         pYUrz++V/Rhd6jb9GHvcP75vLc/DMSz/d9qqJVvwQzixJ/CI+othYtDSiVuMa78Ai3FO
         BfEFXOqKKf8BW+7b8suQkxwtHEA+DRC89hAft6fHnFqrallvOWiLmonO3Y9P+7gqOi+f
         Gdnw==
X-Gm-Message-State: ANoB5pmv0o1L6NE4GQeEVAjLQ4SIAtbFXppeQhu6MS9wHBRDGJfq+lL6
	Lcd+X0P4bV0gyQwkEFpZ20wRZrslaGvOLo2vzXw=
X-Google-Smtp-Source: AA0mqf7Az4sBWdb/zA3Qv3GRLw1hEs9LYjwWT/X5NgWY7igAKws2b+iAYAzR3SVYFPdfQPuW2l1ImqeB50LNm2Adeog=
X-Received: by 2002:a2e:b812:0:b0:277:eba:852 with SMTP id u18-20020a2eb812000000b002770eba0852mr6453001ljo.31.1669051113846;
 Mon, 21 Nov 2022 09:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20221120175237.194899-1-f_l_k@t-online.de> <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com> <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
In-Reply-To: <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Nov 2022 18:18:21 +0100
Message-ID: <CANNYZj8UmhtH-rZKBaVHh0dmkB7fnR3wMemZy_XmF3DA70Rv2Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 17:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173658

On Mon, 21 Nov 2022 at 16:17, Khem Raj <raj.khem@gmail.com> wrote:
>> Python community has no plans for python4 whatsoever. Anything but gentl=
e and steady evolution won=E2=80=99t be well received.
>>
>> https://www.techrepublic.com/article/programming-languages-why-python-4-=
0-will-probably-never-arrive-according-to-its-creator/
>
>
> Good news article although it does not say that python3 and python are an=
alogous and python package does not explicitly install python binary or sym=
link either so it=E2=80=99s left up to how distros want to presume it. If w=
e want to do that then it would be prudent to see what other distributions =
are doing in this regard. So we are not alone in case trouble arises

Fedora has done it 3 years ago:
https://pagure.io/fedora-docs/release-notes/pull-request/410#request_diff

Alex

