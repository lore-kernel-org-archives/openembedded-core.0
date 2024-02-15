Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FA2C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 21:09:24 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.3351.1708031355515869016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 13:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bIZ1B4wu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5118d65cf9cso1727274e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 13:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708031354; x=1708636154; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BPDYGJlUtcFVKgtuBGbWqZi1WhbVcDxu4Zg0w/KAaC4=;
        b=bIZ1B4wubL7+/0cU6PTQdGNQsunzR22McOenE+sCkHQd7RIMMCvq/kDXW0g++Fu6Ad
         GedkucZ+sWCOIPA+uRVn7A0X7X93anHG+/xFPgmH5BLw/76/IZX0bv5cB4WgQnfFEtSW
         Bu1I5kLnA8/FoDeCDaNL2Vaol2cmmGmTZZSMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708031354; x=1708636154;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPDYGJlUtcFVKgtuBGbWqZi1WhbVcDxu4Zg0w/KAaC4=;
        b=ZHm7CqjzrEdmD57Us295bhRmjSCdhbj3i3gq2z9cN2j/9HQN11KTPuGAzHrosC3hoW
         UrPctzzvvV2CoMhWWLn53zNrMF5XVo3IjiWjoTpI5t+M8z5BIUQnmktXUHkfjrykp9TY
         RDjoWGckQUD8d1QVXN2H80b6AfJDYsskGPzQ7iU6O93OcV3u5BYB51ipIvmG2uGJVBnN
         pmCyGkEfwykm9N6V7vUB/PtNix8cwa8J7D2dI2YmO/l28Ys4bqZRzgYDbM1yxplRCEbb
         aiLx48/YtP8vhDYmDt2ZGFgF8ZnTR5CrUE1fZctU45EuGwYjyuPzfeYIwe+JED6o/5XC
         5VPA==
X-Forwarded-Encrypted: i=1; AJvYcCWKk2GGGdfnYPgbibr+nkOooZqtERuI9m5GE9ZS0LLoj8Mvia85AcScvKjzFKzQAJhRsog2TIqPz+/SNrp2D0JiSfFftnJIrbtomh+ijAcS0cZguaFHZa8b
X-Gm-Message-State: AOJu0YwlfA16S9g4wnWLsBtMZRYVZfX2O6l91jhgr85m+eH8BgacxYgx
	7qnZCbzys7kgC5eaRqMfbl3pMHHtHSc1e1KM/pXNti3hZ8ux57zbNG6bYvNj+cY=
X-Google-Smtp-Source: AGHT+IH7K+D6c4WgmV9eP5lT3R92C2kn7M/5acDq7wPcM2/1rzETxWVDctx0X13IH95XLjFQxdtWEw==
X-Received: by 2002:ac2:5dcb:0:b0:511:a536:2e59 with SMTP id x11-20020ac25dcb000000b00511a5362e59mr2028649lfq.44.1708031353514;
        Thu, 15 Feb 2024 13:09:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fd13:6695:6348:c567? ([2001:8b0:aba:5f3c:fd13:6695:6348:c567])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512071000b005128f5cb842sm79280lfs.192.2024.02.15.13.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 13:08:57 -0800 (PST)
Message-ID: <b138df836e1fa7cf249fbca422cfbc2f8ed3734b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] usrmerge: add the distro feature to nativesdk
 builds when added to target and enable symlink creation for both
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>, 
 Maanya Goenka <maanyagoenka@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
Cc: Maanya Goenka <maanyagoenka@microsoft.com>
Date: Thu, 15 Feb 2024 21:08:56 +0000
In-Reply-To: <43abff26-0b40-4393-924b-60fabcbc377c@linux.microsoft.com>
References: <20240201025621.1632547-1-maanyagoenka@linux.microsoft.com>
	 <20240201025621.1632547-2-maanyagoenka@linux.microsoft.com>
	 <fac899458e20aa7cac770ce215fc7cb4bfbce513.camel@linuxfoundation.org>
	 <43abff26-0b40-4393-924b-60fabcbc377c@linux.microsoft.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 21:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195701

Hi Alejandro,

On Thu, 2024-02-15 at 12:10 -0700, Alejandro Enedino Hernandez
Samaniego wrote:
> On 2/6/24 03:27, Richard Purdie wrote:
> >=20
> > On Thu, 2024-02-01 at 02:56 +0000, Maanya Goenka wrote:
> > > From: Maanya Goenka <maanyagoenka@microsoft.com>
> > >=20
> > > Add usrmerge to DISTRO_FEATURES_FILTER_NATIVESDK (and DISTRO_FEATURES=
_FILTER_NATIVE for consistency),
> > > since we have come across cases where the distro feature would be req=
uired by both contexts.
> > > As a supplement to this change, when creating the merged usr symlinks=
 at the do_populate_sdk stage,
> > > these need to be created for both the target and native sysroots with=
in the SDK.
> > >=20
> > > Signed-off-by: Maanya Goenka <maanyagoenka@microsoft.com>
> > > Signed-off-by : Alejandro Hernandez Samaniego <alhe@linux.microsoft.c=
om>
> > > ---
> > > =C2=A0meta/classes-recipe/image.bbclass | 2 ++
> > > =C2=A0meta/conf/bitbake.conf            | 4 ++--
> > > =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > This doesn't quite follow. "target", "nativesdk" and "native" are all
> > different separate filesystems and not connected. Yes, you can use
> > usrmerge on some (or all?) of them but you don't have to have them
> > match.
> >=20
> > Forcing them to match is likely just working around an underlying issue
> > which needs to be fixed.
> >=20
> > What were the real failures?
>=20
>
> Apologies for the late response.
>=20
> I do agree that target, native and nativesdk are all separate and that yo=
u could use usrmerge on some
> or all. I understand your point and I'm to blame for the suggestion to ad=
d usrmerge to the NATIVE case
> for consistency.
>=20
> The proposed patch is trying to fix an issue for a use case related to sy=
stemd.
>=20
> Newer versions of systemd do not function properly without usrmerge becau=
se upstream systemd is dropping
> support for non-usrmerge cases, which is typically fine because usrmerge =
works well for the TARGET.
>=20
> https://lists.freedesktop.org/archives/systemd-devel/2022-September/04835=
2.html
>=20
> However, we are using some NATIVESDK systemd components that require usrm=
erge to work as well hence why
> we needed to add usrmerge to the NATIVESDK filter since systemd component=
s where expecting usr/foo locations
> in the nativesdk filesystem.
>=20
> While I understand that using nativesdk systemd components may not be wid=
ely common, I do believe its a
> valid usecase.
>=20
> I'd like to clarify that I'm not aware of any native systemd usecase and =
that my suggestion to add usrmerge
> to the NATIVE filter was only for consistency, but not required (apologie=
s for that again).
>=20
> I've reproduced the autobuilder failures locally and I see that taking ou=
t usrmerge from the NATIVE filter does
> get rid of the errors, if you agree with my statement that nativesdk syst=
emd components are a valid usecase,
> we can send a v2 that adds usrmerge to the NATIVESDK filter only to fix s=
uch cases.
>=20
> If you prefer, we could also go one step above that and create a conditio=
n to add usrmerge to the NATIVESDK filter
> only if systemd is being used or something similar.

I think there is a piece of this that is still missing. Changing
usrmerge in nativesdk fundamentally alters the layout of the SDK. The
layout of the SDK is meant to be independent of the target (think
multilibs and so on as well).

What that means is that the tools are meant to work with any target
system and not need to "match" their layout. This effectively means
that systemd's tools aren't working properly for environments which
have cross layouts.

The SDK layout is already drastically different from that of the target
system in that everything is installed into a deep prefix path. How
long will it be before systemd drops support for that too?

I don't really buy into this "systemd should dictate the layout of
everything" situation we're ending up in. It does mean any given SDK
can only support systemd or not systemd but not both so it breaks
multiconfig too.

What is systemd's position on supporting cross environments? That is
effectively the real question here and it sounds like they don't
support that? We already have big issues with this in the "native"
tooling side of things since that cross support doesn't exist and we
had to do our own emulation.

So whilst I understand your usecase, I do believe this is a sign of a
much deeper problem unfortunately, namely that systemd doesn't support
cross environments or usage. We could probably hack around it like this
for now but I'm far from sure it won't just break again in the future
in worse ways.

Cheers,

Richard


