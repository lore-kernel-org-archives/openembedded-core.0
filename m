Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE1EC02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 18:35:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.14879.1739039695607690431
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 10:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VBw3zh/I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436a03197b2so20591385e9.2
        for <Openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 10:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739039694; x=1739644494; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSLOcV+/3g0tXhtK2SQaTykB1lEDLe/te93/ybig7Ws=;
        b=VBw3zh/I9AXjLm4C295PHo9chp12/aDR3ROlGGvjkJp49wE+Th40KRD5RdcvctD1y+
         iOIV7EECAuoYZV4GZG3yDLjsX0OAcqmDMvnHuhKcJvdJSJYxBo97si4wg4AxakBkDKUd
         KlpCD4kjr1dsI5MScs7fnTRfbjaHTkLTR+l/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739039694; x=1739644494;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VSLOcV+/3g0tXhtK2SQaTykB1lEDLe/te93/ybig7Ws=;
        b=P6KvZGZUZBb0ftNVIEpSyiDV5QrmVkkbdOg8owUPwk2jfiOBTRtPsKMlHCToRgxlz8
         0TxW3Dd7TU+ZFyU0s+AYhTNlYP8hBPt6gQII16v2fz6xgYFPj7JH5NzY5+tgjj9+TSbh
         ECxnFPq4k7uwMwDHFg05VPX04IxWhTEqJPXEGJzbNTNsgtS/Ep74yvUZkpv7r2kKm1d9
         G+uj5ddD0JdeRomQ7iOb4BG4fm3h9TRONevBjinQBLGj9fp2FcNTyojOeT+SoXvxOaEu
         +YsmPn9/znx7TzdPlgYJpnMQcJuRu/98r+Nku2P2B4oBvlMquUdfjqxC5df/+GHdFODR
         NbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8BPFlD0ht3wkS1/m5JoFxyFzYCQIUdm9h1hCkBedfnURN52PEqYXKLAfamWldFwDxP6Tp7mp/JOECw78z+YfmPQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw/76ifBXUXDpi/ZkKcGTn8Ax1xzxfFQqICdz0zX2WciEK73N8/
	iMSgZJCt2WcE8AhglnEDGAXnU8AXHURaUM6b91GGwd9RfG3BBxb1LbMP7UwVgqY=
X-Gm-Gg: ASbGncsdc4xR6fM6ajL2bNK1SInLlxaT4FddqsgBxflXZ9LPhXScaZzlc70q1hVSGmC
	5n57nDgqklmN1TIxduJ4rvTk7vj31bQwtAwRS2sm/WwJvb53XQ4wtEYjp7EVcYFh6Au8BlWJU/8
	pr2JDL0CmEbvUozW7qt8J7LhuGamWu5iqz0V9W+XQrKlMzCqWTOn8sXKwOSx1UZ/Qjda0/H956T
	PEpPJdTVOrSVSTDt0zNgyhqgaYexIchTkgu0vH2ZkVGFWZ9SaR3V7pslRy3qKUQPVfqY9vZQcFO
	jXpq8gTVAZd5sind4w9DT0Q7mf++kVNLcQczmDmZ22Wf93evG7xiAdDJjkBCuFzCABo2kHCOSBw
	ISCJN
X-Google-Smtp-Source: AGHT+IHwSfLMMXxBCee1gBypFAjgaJXySF4arfrr47VhcMTiwfLBUhm2lBDdkIhqIC9bnqGoJwV4dg==
X-Received: by 2002:a05:600c:a45:b0:438:da66:fdf9 with SMTP id 5b1f17b1804b1-4392499203bmr66527755e9.18.1739039693703;
        Sat, 08 Feb 2025 10:34:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1b4e:9b51:38ac:64cf? ([2001:8b0:aba:5f3c:1b4e:9b51:38ac:64cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfdc1acsm93020685e9.40.2025.02.08.10.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 10:34:52 -0800 (PST)
Message-ID: <26132cfd426a1494d8c42c1f8d1b6fbd347ee353.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] systemd: Build the systemctl executable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: uvv.mail@gmail.com, Openembedded-core@lists.openembedded.org
Date: Sat, 08 Feb 2025 18:34:52 +0000
In-Reply-To: <20250207071043.96282-1-uvv.mail@gmail.com>
References: <20250207071043.96282-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 18:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211042

On Fri, 2025-02-07 at 08:10 +0100, Vyacheslav Yurkov via lists.openembedded=
.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>=20
> Instead of the python re-implementation build the actual systemctl from
> the systemd source tree. The python script was used when systemd didn't
> provide an option to build individual executables. It is possible in the
> meantime, so instead of always adapting the script when there's a new
> functionality, we simply use upstream implementation.
>=20
> License-Update: Base recipe is used
>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
> =C2=A0.../systemd/systemd-systemctl-native.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 23 +-
> =C2=A0...-meson-add-install-tag-for-systemctl.patch |=C2=A0 25 ++
> =C2=A0...2-meson-Bypass-certain-config-checks.patch |=C2=A0 64 +++
> =C2=A0.../systemd/systemd-systemctl/systemctl=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 366 ------------------
> =C2=A04 files changed, 100 insertions(+), 378 deletions(-)
> =C2=A0create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0001=
-meson-add-install-tag-for-systemctl.patch
> =C2=A0create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0002=
-meson-Bypass-certain-config-checks.patch
> =C2=A0delete mode 100755 meta/recipes-core/systemd/systemd-systemctl/syst=
emctl

Unfortunately this showed circular dependency errors in testing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/76/builds/933

Cheers,

Richard

