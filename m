Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE02C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 16:35:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.469.1668789342521565767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 08:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hy4ZaMOn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id i186-20020a1c3bc3000000b003cfe29a5733so7922658wma.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 08:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3/M2DNvFOOypnjkA6FY2Qhz3k+F6+srPlZNb73sNaQ=;
        b=Hy4ZaMOnp4p26A9CnGCttOEJQg57T7Wi76eHMEpDPlkjvKotv0HgaOH3LSCLYDWioT
         QAiPZWGstuIOfS0dSKf1GoFql826HswiQ+4DPfUucje2fi3cxudPOVZ3gE3HxvBn8TTW
         3y2cqeCmK2i0iCRNQwzJREcugkUKOambARk/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3/M2DNvFOOypnjkA6FY2Qhz3k+F6+srPlZNb73sNaQ=;
        b=aRc/JP+MyMJvbPJ5uDSPtEGMv6hwOl/pDxKjdx1B1r3DnpPMdk7VtbJodD2+6OrYbd
         WUojZ/RvMNYH+n/z6j7EyrrRQyPzyyJ5yfnCX/6gO12KCz5Rl9ElRUysgm1cLp0cEqWk
         GmTeD04MY2MxPf5mIn+izYD5MYja4HTAB5DvMnVx8F+ZkvXf7UgegezJkWoxO+VcM6T8
         ihNNL5n+Y+4eI8GuZReCqMgbfGjD/5JgLoIrWTnlEAD71j7KMuasx8sNlvRLMlT1wNK7
         +tVfvxnHw4Hj/zYf2VqlO9Hwo5nYup0i4BMS0eqcXdesUKpKKqL2KDjmITbKWM3q8UlN
         qa8g==
X-Gm-Message-State: ANoB5pnOoZzoixpz86LRdo8VvA5IWStvP4mzbDOvmK5AdVXwVhMz03rZ
	jVPt2iRiNEPreRYW/PScACq4ow==
X-Google-Smtp-Source: AA0mqf7viBSv3u+p8a74UqKWiZIycNgkO0LblUZ6x90vA8BW86NicJTxNiBDtKB6Ekc6OS2uesRnFQ==
X-Received: by 2002:a1c:f401:0:b0:3cf:8731:8110 with SMTP id z1-20020a1cf401000000b003cf87318110mr9261870wma.32.1668789340736;
        Fri, 18 Nov 2022 08:35:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a603:eef1:6736:def4? ([2001:8b0:aba:5f3c:a603:eef1:6736:def4])
        by smtp.gmail.com with ESMTPSA id c18-20020adffb12000000b002365730eae8sm3905169wrr.55.2022.11.18.08.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 08:35:40 -0800 (PST)
Message-ID: <8b2ecf15502e08644ffbc1c7cbea6d3862da68a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anton Antonov <Anton.Antonov@arm.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2022 16:35:39 +0000
In-Reply-To: <AM7PR08MB53201A46A1080F4AAFA7E318FC099@AM7PR08MB5320.eurprd08.prod.outlook.com>
References: <20221118144253.1156045-1-Anton.Antonov@arm.com>
	 <7dc90b995d7a9688188b8756871181e46b2e296a.camel@linuxfoundation.org>
	 <AM7PR08MB53201A46A1080F4AAFA7E318FC099@AM7PR08MB5320.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 16:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173478

On Fri, 2022-11-18 at 16:21 +0000, Anton Antonov wrote:
> =C2=A0 I=E2=80=99ve tested your approach. It doesn=E2=80=99t work for wha=
tever reason.
> CRATE_CC_NO_DEFAULTS is empty exported for native recipes:
>=20
> $ MACHINE=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS
> # $CRATE_CC_NO_DEFAULTS [3 operations]
> #=C2=A0=C2=A0=C2=A0=C2=A0 [export] "${'1' if d.getVar('CRATE_CC_NO_DEFAUL=
TS') =3D=3D 'true'
> else '0'}"
> export CRATE_CC_NO_DEFAULTS=3D""
> # $CRATE_CC_NO_DEFAULTS:class-native
> CRATE_CC_NO_DEFAULTS:class-native=3D""
>=20
>=20
> =C2=A0 I also tried:
> CRATE_CC_NO_DEFAULTS[export] =3D
> "${@oe.utils.conditional('CRATE_CC_NO_DEFAULTS', '', '0', '1', d)}"
> with the same result =E2=80=93 empty export.

I think it might need to be 0 or "" instead of '0'. It would be nice if
we could make False work too but I worry that might not.

Cheers,

Richard

