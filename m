Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E26CCCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 15:33:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1424.1762529599522506666
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 07:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hxG3eDbS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47114a40161so9273155e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 07:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762529598; x=1763134398; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arLUsLXmnW707KNUa2q/CadYe4cAuit26EFgsioapFU=;
        b=hxG3eDbSCv11f1VD8MiRZBCbpmUsPM31ewalVvOgNopUjM/5eMd76VDE+3bfUuG6WO
         fjnG95eplO5SQGStZfx8aTPz7KtgAOvurDE+9vlt+SoHnCIvUofn6tV4gKt2Lb3tgckP
         R2tH2yNobFeCiBnDg3wetomvr5zdzx47uCAlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762529598; x=1763134398;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=arLUsLXmnW707KNUa2q/CadYe4cAuit26EFgsioapFU=;
        b=NtjZmdPM34xHX4/YD3WJsYL1ISh2yFlxuv7iJiPpGv1xY5d7G1Z1lJcxG6rOQdT/Ev
         U7Pm2hi3cg0s3JSR0/NNEV3kyRnMrIl5bDHdwl9nJQRP4H3ZsyIP4ybp3AW7dQPW95Os
         ml4rqPIYAVMiui96kI+ynFmu1c/wbG31RbdGlXydqVi/+reA9USmOVcN3Avp6a1XG79P
         ckvFY8+fK1H2kV8qm5A75+b9poN8RhKHJ/ZtLOXh8pH6Eg6t13RhPaE+5gk/ibmVjv+h
         gk9aeecihnq90xR68SlHCjh8O5HhxavFnBKixOdS32+vo+scWdemjGKYw1gMfrk+Myjo
         6wBg==
X-Forwarded-Encrypted: i=1; AJvYcCWH+KLR7cSb2KbVrZVUi3iMeJgIRQLkm/pQO4JHPwp7J7NeGmVwMkpug9y+5ANUe+TmzK6sbe2jqektSOE7mNMhSg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxocmVe3wjOzDYHBciWWu/WPd4hFDZToQexRFGql/ctXTMtqAxj
	MpiHcZIdhfhfvDO/7toy76uKVoZrU3k4C6xisXWZlM7u/WDcWfTom/Q+6dAPpKlo6jc=
X-Gm-Gg: ASbGncsnqgHxrilSh/IpKoEMTHrtd5nkx1rP46EC8vHAdHU4wpMDugZAe15Z0AnrDss
	KxNRwKJH/AIl271Ez6aZUOZd08kjFNI7IExzToix3PX0oTFhfvhKBwRCOsUHz35XzJPDD4Fh/aJ
	dsioXagvGT61ex83iJS4sYQN1iEWK1C72TOxQ2y07ARwmMOK4X1fis5mu9AWYX7QMN1LJYJXp87
	TIjOJwJzEwGjDhhBl+RMfpgT4+YOByNEYQFxSSwA5QA68chhrT833sRLNvmZ/fG90P5KLat5ZFb
	YnhSDMEdH6ij3Ywe1qRMcKgxpbfdXkHPnm6IEXaN6ZS2Oa1L+Jwj7ZYupjfjzE/agNLmBL6a+c7
	oH7ZD1KzUnIcnU0oO0oDc5cGUU8+cNZc+5eAlvHm5MVdG/edTQ2FxzVR/+86mddmK024CSbmc/f
	i+0WJWSkoVr0uuIPiTyJVaYaT584n8Yx2yBzxzSDGBt+z/9JakljCKH5iUFyxr1L3E
X-Google-Smtp-Source: AGHT+IGCX5QWNvgAFlCexAhr/xsayIMs+cuDxs9Hx4I3SwLEPK5t4A1rlSi9OujPRuSc7WbMls4B4A==
X-Received: by 2002:a05:600c:b90:b0:475:d7b7:580c with SMTP id 5b1f17b1804b1-4776bc92cecmr29551115e9.12.1762529597698;
        Fri, 07 Nov 2025 07:33:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb7:f903:75cb:8c09? ([2001:8b0:aba:5f3c:aeb7:f903:75cb:8c09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdcc552sm185041605e9.6.2025.11.07.07.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 07:33:17 -0800 (PST)
Message-ID: <14c073ea8bdd05a46ae4f2dc987b3694eeb9e322.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] package_manager/oe-pkgdata-util: fix
 complementary package installation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: randy.macleod@windriver.com, Qi.Chen@windriver.com, Mathieu
 Dubois-Briand	 <mathieu.dubois-briand@bootlin.com>, 
 "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Nov 2025 15:33:16 +0000
In-Reply-To: <ac2bc7c1-4e23-40a4-bfd9-c800873159d3@windriver.com>
References: <20250924084233.3429501-1-Qi.Chen@windriver.com>
	 <CO6PR11MB560294040AD5A59501524E32EDE9A@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <DDJUY91C0269.2QMM9NMD7SA2G@bootlin.com>
	 <4f933821-481c-4cfe-adc0-b734792fc006@windriver.com>
	 <ac2bc7c1-4e23-40a4-bfd9-c800873159d3@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226060

On Fri, 2025-11-07 at 09:35 -0500, Randy MacLeod via lists.openembedded.org=
 wrote:
> =C2=A0=C2=A0On 2025-10-16 10:44 p.m., Chen Qi via lists.openembedded.org =
wrote:
> =C2=A0On 10/16/25 23:39, Mathieu Dubois-Briand wrote:=20
> > > On Thu Oct 16, 2025 at 10:35 AM CEST, Chen Qi via lists.openembedded.=
org wrote:=20
> > > =C2=A0=C2=A0I confirm this patch is still in the master-next branch. =
It is still=20
> > > =C2=A0considered to be merged, but this is a non-trivial change and n=
obody had=20
> > > =C2=A0the bandwidth to review it so far.=20
> > > =C2=A0
> > =C2=A0Got it. Thanks.=20
> > =C2=A0
> =C2=A0
>=20
>=20
>=20
> FYI: This patch is still in the same state.
> =C2=A0
>=20
>=20
>=20
> The patch doesnt' seem to be critical/urgent for 5.3 and it's a big enoug=
h=C2=A0 change to take some time to review.
> =C2=A0
>=20
>=20
>=20
> =C2=A0Stay tuned and/or resubmit once master branches and people recharge=
...=C2=A0

I do feel bad that there are patches in this state, it isn't the only
one.=C2=A0We've reached the point where I'm not functioning well at all and
things are 'breaking'.

The trouble is the people doing the reviewing only have finite
bandwidth and we have to prioritise. This one adds a lot of code for a
seemingly lower usage use case which isn't as critical to the release
as other issues. We also don't have a clear maintainer for this area.

Cheers,

Richard

