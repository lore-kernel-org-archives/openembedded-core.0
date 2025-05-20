Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B9FC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 13:39:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.21196.1747748362328909307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 06:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GBSNX+7+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a36e0d22c1so1727252f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 06:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747748360; x=1748353160; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r82AgfGqluszY695DFBNr83fzWN6Iov0xWi78zeJY2g=;
        b=GBSNX+7+dRZNPNFl21F63Jx9QcZNlgTv6bm/97Z6jNxB0f2a5a1pzGA4IEcYztTiC4
         9Hd9sANy4iUSPodMGuSfyDgeETiOacOAiITRO1+TsFK9CLqvXb6c9lJ+cJcGlnxwZ1Ct
         KtpvRe+rvRrRYHOaePck3U0/cFstS7eLPmyVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748360; x=1748353160;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r82AgfGqluszY695DFBNr83fzWN6Iov0xWi78zeJY2g=;
        b=kurH1Qb/Cav3R4YzuO3H7zRPR5qxGwx743NZFVvMY8JLI0O8xIbnWw61VMannJ4D58
         s8qX7HCgXM2s/baMvzj3AWoloo4VnhzvnRhvUG9UB2x3zr6OuUblT9isGC8/VvjrXBve
         n42t2dgFt3Y/GrdM3O1QGuk7oV+rjVKU4tzTJns9PSmQvD8K/b6/fg6/WuceJZGE4OgR
         kZeJm5gWq3+5jRU0jKPw/UwZ5EmdmIX2CaM6gDEKXfOsneESdVGWCC8PFqDdPMEU+zJl
         PlODaqdAzXMzBQi8MQNPReBSCTDWZTkUSdbx3UJtrZEc7qd8jxxR90mKjOP/Lc4NseqZ
         7PSg==
X-Forwarded-Encrypted: i=1; AJvYcCUfzkzAVAQSzqIdRxk2dAQk4GFf9k7buyHzxSK2dV1oQKAQi9+USwkrjoBaEQbmMYp75hleC/n4UsXXNGUqCJlzcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEutw1VoEPRriR4PcZk17kTtloXSwl8gpNfjC8jQO/XxdfQkqq
	ZjI98o2q5sFXeWn1/RxKeQnIISuv5mG/cXo2ntAvoWNhgIQZ7MNbRp0IPJdjnto4A/8=
X-Gm-Gg: ASbGncvWIsGNn6sx0imVivkpkBlHasxYqQQ5SUavYT8Xr0AlHETQVkiHoHpQ52wONBZ
	BprROWSIlDcOhGGv+5Zjvbpgxv9SIt4663ISopD+sXmihodF3c3mre30wl9lFL+NUPgS7sboKpl
	xSaOG+o+qU2XNL9utkZA+fKE9yNbF01WRMtX7cw4wSKKBI1hRpQIXnImw9qBAjWEvoOHlf/3lQm
	adLYnLMvXR2jmn+FxA+TMjzvDXilTIggm6R2dGx4tFZbtKPH//UslDjDNvCz6WNorLdP1h9lrDC
	ed3StF3KAH0r+BpyaWLHxg/L7j1Y0s9YZZVufS3qGKpBV672fYi5HHo8N/2PivB4Fg+NS3wQeGT
	rEAl0XiquvJKMswELsXCnVCxnQVqbwOxyJRcfPA==
X-Google-Smtp-Source: AGHT+IG+sXty0aMdb+qs1iC68vy/E/16qo4gFP1sXpZtQoK6FvEQdIprMuw+4KxCv7xm6uczBNv1Tw==
X-Received: by 2002:a05:6000:2407:b0:3a0:a0e5:d28b with SMTP id ffacd0b85a97d-3a35fe5bb31mr13102667f8f.3.1747748360517;
        Tue, 20 May 2025 06:39:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:685:a6df:9777:90ca? ([2001:8b0:aba:5f3c:685:a6df:9777:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a84csm16507937f8f.31.2025.05.20.06.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:39:19 -0700 (PDT)
Message-ID: <54484445b491b8be597cf35b47e7059c97c037d9.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set
 zeroconf provider
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>, Joshua Watt <JPEWhacker@gmail.com>
Date: Tue, 20 May 2025 14:39:18 +0100
In-Reply-To: <20250215165545.1929-1-alex.kiernan@gmail.com>
References: <20250215165545.1929-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 13:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216915

On Sat, 2025-02-15 at 16:55 +0000, Alex Kiernan via lists.openembedded.org =
wrote:
> avahi, systemd-resolved and mDNSResponder (in meta-networking) can all
> provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> which of these will provide service via packagegroup-base-zeroconf.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> =C2=A0meta/recipes-core/packagegroups/packagegroup-base.bb | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index cb9d1f07af51..ac450fbdc9a7 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -312,11 +312,14 @@ RDEPENDS:packagegroup-base-nfs =3D "\
> =C2=A0RRECOMMENDS:packagegroup-base-nfs =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 kernel-module-nfs "
> =C2=A0
> +# Choose 'avahi-daemon', 'mdns' or 'systemd-resolved' as zeroconf-daemon
> +ZEROCONF_DAEMON ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd-=
resolved', 'systemd-resolved', 'avahi-daemon', d)}"
> =C2=A0SUMMARY:packagegroup-base-zeroconf =3D "Zeroconf support"
> =C2=A0RDEPENDS:packagegroup-base-zeroconf =3D "\
> -=C2=A0=C2=A0=C2=A0 avahi-daemon"
> +=C2=A0=C2=A0=C2=A0 ${@ '' if d.getVar('ZEROCONF_DAEMON') =3D=3D 'systemd=
-resolved' else d.getVar('ZEROCONF_DAEMON')} \
> +=C2=A0=C2=A0=C2=A0 "
> =C2=A0RDEPENDS:packagegroup-base-zeroconf:append:libc-glibc =3D "\
> -=C2=A0=C2=A0=C2=A0 libnss-mdns \
> +=C2=A0=C2=A0=C2=A0 ${@ {'mdns':'mdns-libnss-mdns','avahi-daemon':'avahi-=
libnss-mdns','systemd-resolved':''}[d.getVar('ZEROCONF_DAEMON')]} \
> =C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> =C2=A0SUMMARY:packagegroup-base-ipv6 =3D "IPv6 support"

This has been sitting in master-next for too long. Various people on
the patch review calls have promised to reply to it but we've all been
struggling for the right reasoning and time to write that reply.

Basically, several of us are not convinced this is correct. The
challenge is that "zeroconf" means different things and the things
being switched between here aren't equivalent. They don't have the same
APIs and don't function in the same way, the similarities are very
loose. That contradicts the way we usually make selections like this.

That said, having stared at this just now, I can nearly convince myself
this is the right thing to do :/.

Can anyone suggest how this should be handled?

Cheers,

Richard



