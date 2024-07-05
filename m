Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302E1C3271F
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 07:27:46 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.12192.1720164447663790610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 00:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dhd9yJNX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ee91d9cb71so9713411fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720164446; x=1720769246; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XV5ew1Ux5f5AQqdDGdPwr1RDFXrFRYeaE2Vsmujsxtk=;
        b=dhd9yJNXJyKop3EZWXs9EN4vjFhxRdbnKnme814u51AY2KWBEVqOtcRlR0Fj5IAOU0
         T4yfNFSCmifv+KA6axCfPSBVRKC9DvvJz2uOAM4vTmQ5YaTwZTNWFeAmLYPK66i7sjau
         NH+B8ATBFwL34kUufu5Qp92e1OwEYWW49BAOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720164446; x=1720769246;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XV5ew1Ux5f5AQqdDGdPwr1RDFXrFRYeaE2Vsmujsxtk=;
        b=rAIMHRwltt5FeVp/jVlobOf6gNY0Sn6fQ2xcpOd5r3SbNJbUzDsj/4Eku1Fv06eJgp
         ilDpW1h05Qp69Mt+wnF/MEK3yJvFkbFj2pwRSI0g0f0JZWrRUwqIKYU2KBLicybwH8tG
         qccfDkwzpfaZ9m7QGhae8aOEarPxGDU83erIQhug4scUYitbP42TCAQJsIBNU/wGgRS3
         UcEFY/6WCR2auO4cO5RBH5huiJYQ4+f41QIZ2RmdhRYicuZPqocrW0jCrGwUrwbvaD0a
         eeF3BZUOf07E13FwVbISaJHkLdzILbmakRG385bxg9wzbF1KFilPvruEtF3KaV9unM2D
         8unw==
X-Forwarded-Encrypted: i=1; AJvYcCWaVINUYeEgYCdh+tfbbbEGgINNxLsl0p+zPel9V/Uvbff2Gs68gi3sOzinSF8nSlfXw7ryNplurkc0a3ugcDNF0IxarETnasDb34Xl52nkosfbst53l+/E
X-Gm-Message-State: AOJu0Yy66mn1TSguIhz+jzrxHye6dCsF7/j5DNDhkhYPVo0+L11IuL3d
	DgcTr+sSgq1ul5n0zXCwfxL4dkXnOAIPG/wsinkXONqXWDdgAZmuHCklgrYi/6c=
X-Google-Smtp-Source: AGHT+IEontJ6iFExJDnZUJBF00E3JWU2oa3yZZD/vKo8wQk95PB7MWU/8JcPsOgFoenpZk3oNdZLhA==
X-Received: by 2002:a2e:9953:0:b0:2ee:8c72:36dd with SMTP id 38308e7fff4ca-2ee8ee1507emr26397221fa.46.1720164445723;
        Fri, 05 Jul 2024 00:27:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb88:bb2:1190:3f2c? ([2001:8b0:aba:5f3c:cb88:bb2:1190:3f2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d16b0sm49133845e9.7.2024.07.05.00.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:27:25 -0700 (PDT)
Message-ID: <c0d19c58ac3d414f03cc405a4f20c7d43ddc6156.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] testexport: fallback for empty IMAGE_LINK_NAME
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Fri, 05 Jul 2024 08:27:24 +0100
In-Reply-To: <GV1PR07MB9120FC5B240E083C496D9B9FA8DF2@GV1PR07MB9120.eurprd07.prod.outlook.com>
References: 
	<GV1PR07MB91207447D621EE3962C6802EA8DD2@GV1PR07MB9120.eurprd07.prod.outlook.com>
	 <6b8ba5a42a03dc0e04e89989584fb313411d0783.camel@linuxfoundation.org>
	 <GV1PR07MB9120FC5B240E083C496D9B9FA8DF2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 07:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201590

On Fri, 2024-07-05 at 07:18 +0200, Konrad Weihmann wrote:
>=20
>=20
> On 04.07.24 17:15, Richard Purdie wrote:
> > On Wed, 2024-07-03 at 04:47 +0000, Konrad Weihmann via
> > lists.openembedded.org wrote:
> > > if IMAGE_LINK_NAME is set empty to disable the symlinking
> > > for image artifacts in deploy, testexport fails, as the path
> > > assembly
> > > is incorrect.
> > > In that case fallback to IMAGE_NAME
> > >=20
> > > Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> > > ---
> > > =C2=A0=C2=A0meta/classes-recipe/testexport.bbclass | 2 +-
> > > =C2=A0=C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Are you using the test export code? There has been discussion about
> > removing that which is why I ask...
>=20
> Yes! An integral part of our testing at work.
> We are using a slighly patched version, which I still haven't found
> the=20
> time to contribute back.
>=20
> But we are running on LTS only, so it's fine if there's no one to=20
> maintain it, then we will need to adjust 2028 latest - worst case, I=20
> will move the class code to one of our layers, if the support in core
> vanishes.

I'd just caution that if it were removed, it would be to simplify the
test code itself so it would be more than just the class unfortunately.
I suspect it would be hard to maintain standalone.

Cheers,

Richard



