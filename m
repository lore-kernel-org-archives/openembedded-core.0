Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4F9C3ABCC
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 14:08:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.102873.1747231683975858925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 07:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JB1JTsBi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso68427985e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747231682; x=1747836482; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcafiKmaBNpTRYJi8jHNn9lBhosFKtxtw5uGkpUl6o4=;
        b=JB1JTsBisVR3GDHGJkU9XvjLnls/GTHvu6Uy8MC7xv1iaLGW3FXOOoCZ8w2xLXUwAT
         jPRx8csP+oZfjNf67zVCQDtJmrqjp1ema9Vcaq+0hi3B30e5OoieA40Z5VJ/JkATf0dx
         RqJjIy03sC0VE7HcWMeOcQlG4kf5e9vIe/3hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231682; x=1747836482;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OcafiKmaBNpTRYJi8jHNn9lBhosFKtxtw5uGkpUl6o4=;
        b=IK5OZHTxtRnerU1uQXSAu45WuGxCS0WYEA6cUpl/25I6t/GvLUqp/wwnLo2Ftffe2A
         708iOhuIltjBbsHiBTfwB8wzG72/OV08mETIA3AWerUhSNw3syQqaQzkyzlt5m1fpwur
         uWs1WXqkSny3O+kMEJvb1RXsz0sEsOh5iunvv93LYEdc0u/9sCeBhUIRZW+JORaS+fBm
         lrn8ZGXr3pZvzBzjO/TV8pFV0vp9psGtEGU0bmbqb3Nu/AT+S7HLRkP+vUMi4m0T3/By
         dKFAd1nSjCH/PzPQld4SQCwTSd0r1DwP3zKkqZ+NZ50viDg99RzulLZ3MwjK5Utn3ENF
         Xs7A==
X-Forwarded-Encrypted: i=1; AJvYcCUc0+s9YE1RdP+dZfxLnSNjsr129jqNwuXGVVxJHcO5QHyHVFxlbusEi0rSUL/ePot81+oGCEqMc8DYAS7yc8xOag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywm4SupFyfsE7vs122WxCH++b02qF9XSnSZF/0rKMHqLPBdbZNJ
	M3GKvIFdn8lxrK/VK0leQjhKZv4RvfdpnVXS4bgbE5rxKjtnuFppceCOk4Asdr62U0QO4Bg/Jwu
	6
X-Gm-Gg: ASbGncsDzadLHEcgORPa56l+z2CuO1TayCRZQnyJzApJNCJbiQcF/kSvZeGs0s8WjvC
	CR3XhQ9Jbp/OfqT+meerwnWMzaWYw0XmHGZPtqKAUi4JvtlC/dAmL6wivmWgb3DRGLLP4gyDr4b
	YwNZB83SNcHDQVbcHucbtkdMjYmmjLnMg0d+cHxJ4WSOhLc0f05YOOIiPuy9TEA1/ibJKR17H2t
	tbzIZnOHOqnarnT0nzXtv1DFzStYFBQznerzRXiC0UmMWxlMbh1l40nfaxtzI+3QkKqUHXSsmMG
	VQmT++DDVUVCE2f5l8zKIPWR8SIM29efKwM6eZVUt+GbC22JXaq9m1aTMi1iW93D89EwUR0u6X4
	6hzMAvluK1IwLrsoHalHAwdLGt2mKunOjDjTZoj//
X-Google-Smtp-Source: AGHT+IEwzXzZeN2grUbe5l8fvkVRfnbx9TsT2RXzwsmqSsxI/v9RVr8ZP9qO1isfCssza5u676Js0g==
X-Received: by 2002:a05:600c:b8c:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-442f4c8fe7cmr24330635e9.16.1747231682254;
        Wed, 14 May 2025 07:08:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34? ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cee4sm20024168f8f.67.2025.05.14.07.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:08:00 -0700 (PDT)
Message-ID: <8cc3ce571584b8d1cc2eb3bf0245ee619b6b8d79.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 33/56] openssh: upgrade 9.9p2 -> 10.0p1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "wangmy@fujitsu.com"
	 <wangmy@fujitsu.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 14 May 2025 15:07:59 +0100
In-Reply-To: <DB5PR02MB10213D3636FDB5A5DACC9B42AEF96A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
		 <1747040619-7566-33-git-send-email-wangmy@fujitsu.com>
	 <185f54b0fe32289f81b23cc978da6dcd04ba7666.camel@linuxfoundation.org>
	 <DB5PR02MB10213D3636FDB5A5DACC9B42AEF96A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 14:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216496

On Tue, 2025-05-13 at 14:29 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From:
> > openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@lists.=
openembedded.org
> > > On Behalf Of Richard Purdie via lists.openembedded.org
> > Sent: den 12 maj 2025 15:23
> > To: wangmy@fujitsu.com; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 33/56] openssh: upgrade 9.9p2 ->
> > 10.0p1
> >=20
> > On Mon, 2025-05-12 at 17:03 +0800, wangmy via
> > lists.openembedded.org wrote:
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >=20
> > > 0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
> > > refreshed for 10.0p1
> > >=20
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > > =C2=A0...gress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 6
> > > +++---
> > > =C2=A0.../openssh/{openssh_9.9p2.bb =3D> openssh_10.0p1.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2
> > > +-
> > > =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
> > > =C2=A0rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb =3D>
> > > openssh_10.0p1.bb} (99%)
> >=20
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1579
> >=20
> > (and many more)
> >=20
> > The ssh server doesn't work after this change as per the other
> > similar
> > patches sent.
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> Not sure if it is related, but we have this in our bbappend that
> lifts the version of openssh from 9.9p2 to 10.0p1:
>=20
> FILES:${PN}-sshd +=3D "${libexecdir}/sshd-auth"

Thanks, that does indeed fix it. I wish you'd sent the upgrade if you
had it working!

Cheers,

Richard

