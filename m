Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3377C61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:11:07 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.91447.1700748664225919523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JDwVGBnA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso1296461e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700748662; x=1701353462; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0cMEW1/gN2LQpFH8uMc5qd8vjrXcqgoVR9R0g291Co=;
        b=JDwVGBnA07M6NwGAnB47yofaONJdZ5e/p4YVclKb/bnQK/uL/1Pyobt9PAb3nM5l2S
         S7wLBxWS67PNBowvPetfHYUpF91QnGlcmlmLWOJ0OEY5XatF86YCaM1x17KpieXmAGXW
         5MkxCra9HGZNsJSe22e095fSAakndD6Cdn8is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700748662; x=1701353462;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0cMEW1/gN2LQpFH8uMc5qd8vjrXcqgoVR9R0g291Co=;
        b=nkasAyznPhHkYN2oYzOLJqL05ayDTBWguMkjkX2agOF3TFYqxdNt34iDDy1gCc8G7d
         2amXZW51KQWSmi47zTzxu+Ch7fMpIP6cdi9Jzk8EhPSKXVpeHOWcpzBFf1vtcwOcoxf0
         Q9CU5lHCyPzr6tJSUb3EOjM5EWT8pXqxUskuVN+f9tXgrhzz5j4yM0PwuaHI3im+yQsk
         JsKChVNH+DxOocS4SCAOjTNPBN4k07iLEMiNq/AbGWIjfJjDNwHhPchd7NqArTlBkfvZ
         8YcHLdWl2pdk09X8h1lB0iR1hygtaU9fLvhxFpY+Xc84VpID46b+976EKEm30sv+9ghj
         qqBA==
X-Gm-Message-State: AOJu0YzrtbEmGjWmdMmW95+C7LtPlWYq44J4wFrR5IteexwbJG2iaUu5
	Pdg+A6U5O2yRIkp1gFPSSU6uRA==
X-Google-Smtp-Source: AGHT+IE5LvukrXQTzajgwzwCU6N05AZWSMZH72GcA8fUIIhAtcxMy5/mHh6NwAxpzmZC9o49kjalPw==
X-Received: by 2002:a05:6512:ac3:b0:507:9640:f256 with SMTP id n3-20020a0565120ac300b005079640f256mr2934860lfu.36.1700748662400;
        Thu, 23 Nov 2023 06:11:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c511:4d31:367c:ab3c? ([2001:8b0:aba:5f3c:c511:4d31:367c:ab3c])
        by smtp.gmail.com with ESMTPSA id j7-20020adff007000000b0032ddc3b88e9sm1792439wro.0.2023.11.23.06.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:11:01 -0800 (PST)
Message-ID: <12a072dc57477bc7a07847718a34bd75dab9abeb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC 2/2] useradd.bbclass: ensure sysroot_setscene
 for DEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2023 14:11:01 +0000
In-Reply-To: <c6d2ae3913582947c046d577a9dbf6dc8629909a.1700746611.git.pidge@baylibre.com>
References: <cover.1700746611.git.pidge@baylibre.com>
	 <c6d2ae3913582947c046d577a9dbf6dc8629909a.1700746611.git.pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191158

On Thu, 2023-11-23 at 13:49 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> [YOCTO #13419]
>=20
> If recipeB creates a user and assigns it to a group created in recipeA,
> we need to ensure two things:
>=20
> That recipeA is in recipeB's DEPENDS (documentation issue) and that the
> sysroot setscene, in the case of a TMPDIR wipeout, is in
> USERADDSETSCENEDEPS.
>=20
> RP and I discussed adding a USERADD_DEPENDS variable to deal with this,
> but there is some magic around DEPENDS that a new variable wouldn't have
> so I'm sending this as is for people to poke at.

Can you be more specific about this "magic"?

I'm still worrying that DEPENDS is too broad, there are many more
things in there which we don't want listed as setscene dependencies and
I think this needs to be more precise.

Cheers,

Richard

