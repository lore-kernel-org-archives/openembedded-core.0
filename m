Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F570E674B0
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 13:14:02 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79772.1766409237928658676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 05:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SwKop3an;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so3070755f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 05:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1766409236; x=1767014036; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ryPI/6ndz27Pcxlzl8eDoGB9Ezn2WsgLGoZ7I2yYiLo=;
        b=SwKop3annLzbamoL8wEaRxLytEDHXZPiIf2Tnnn+i3kdavLxPFYBg3Lv+z6qoKyssy
         M9c6pKpwxBTgCF31rwtklRtGm2S5iD71HGEmbCwLJ/yjUYDePJdYQNpZqrEboJdI2eZ7
         0XNJTwtdJQBIaY52jVX9lrFIGzkljis5Z40y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766409236; x=1767014036;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ryPI/6ndz27Pcxlzl8eDoGB9Ezn2WsgLGoZ7I2yYiLo=;
        b=DvnqzJgRjCiK0gEx0kAdW0Yky06W+V+MQeqG4m0RQpYrHxk15W7mtjYKPxNZ/8DKdo
         cPNwpprhuresHiUfMqygYgJEs7d95HD+B5wQ60xxOrzScIFvW0YI2KsMpt7towPfdDNg
         RJ4us/D/13YF4Vw9EUPVlnm8lrY2x7yRx3cnQXCSLaG3miXotGbTmpkXVrBAqYkJBnVr
         iVjuqyJ8/ouarU7GupmHa2tAlNgnJMlDiUhoYXQBAMwu4CkiznNi9IWfgBJ2/5oOL06w
         tI/J0BwMba98hMGGm7y/NXpq6OEWIry31iZDpbOPDRG8rwfiA1TL5om0hzLt5yNryUUZ
         IE4A==
X-Gm-Message-State: AOJu0YypOJSlG+RnuKWB/MURrjplAZNqts62BpSMKD4CPyFth8MWsnDy
	9y5KjVVX94F296Bm3GSLfxPqcsv5uKoPMS7kHGDnW69oAYdZQ9RgAgOBtBfcwdCw2sk=
X-Gm-Gg: AY/fxX6U7d1KtW+gUXIEp3h40NTjineskr2fcE4uLAMQ6iTTPpiIc/u5sl/ZAK+x7wA
	LjEl/vXdJ/47rcCPkz6x3tZiXN5ZsmELC0WmWuI14Je5BlWB1W1WSaoBLcZxNsIgy3CfXSbPnod
	0hcOBpc5meMp4YtgsDiZIuxSAb5A/FArFUs/35z0D6r+aSNN6+FBjVlBlbD8DWMA0/GHAdxohD0
	DiXhrqWFmwmHcA64TvWeKVct6vpjqMgahzQYDBe9/aaSLuAQv/6FHxitKCUrY1YQVL6dh4nOJbO
	NfIHCuY51M/3Mlqy4uKqoANqywg1j3BkZoe5Gj9GA2coxHAhj+x8CaHcEyLeg4c3A5saNj1hxGH
	98Fwx9us8Pfc3ZAubNDNUpRA3/Xi+E+5zbMbT/iUxBYIWfzlVNab/O7+5xn4BkoADiCUrBz09WQ
	+nLJSdrNIqVO88DLVXITDnX4+exYOkrC9D2navzSllM7dk5EwOcqZP1UgrIPJ6+Z0D7SQ25Pcu1
	IA=
X-Google-Smtp-Source: AGHT+IG2/PuBcaLSoPFtPhXJQLPTAOohPKny2FlydndhtAyYL7gPeJUAr2Rat1FFXC2DtPy5ONPalw==
X-Received: by 2002:a05:6000:200f:b0:430:f879:a0ee with SMTP id ffacd0b85a97d-4324e4c1259mr13863530f8f.5.1766409235821;
        Mon, 22 Dec 2025 05:13:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:db55:b370:96d6:b56f? ([2001:8b0:aba:5f3c:db55:b370:96d6:b56f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm22167731f8f.1.2025.12.22.05.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:13:55 -0800 (PST)
Message-ID: <5044d0ec483159af764bfd2b51baf08e6410ec8e.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/21] linux-yocto: combined and consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 22 Dec 2025 13:13:54 +0000
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 13:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228302

Hi Bruce,

On Thu, 2025-12-18 at 15:22 -0500, bruce.ashfield@gmail.com wrote:
> As discussed in the weekly engineering call, I'm sending this as
> single series even though it crossed boundaries of the repositories.
>=20
> I don't have access to meta-yocto-contrib yet, so I haven't pushed
> the component parts to contrib branches yet, but will do that for
> future pull requests.
>=20
> I'm using this as a first run through some things I've cooked up
> to coordinate the patches across the repos. The formatting is my
> own, so apologies if it isn't clear .. and we'll see if it all=20
>=20
> Now to the series for OE-core:
>=20
> =C2=A0- We have stable updates to 6.12
> =C2=A0- A kern-tools fix
> =C2=A0- Updates to 6.17
> =C2=A0- Removal of 6.17
> =C2=A0- Introduction of 6.18
> =C2=A0- Bump to libc-headers to 6.18
>=20
> I've built and booted what I can locally, and I know that the
> major architectures work, and are functional with respect to
> core features.
>=20
> I have more libc-headers testing running against meta-oe and
> muslc, so there may be some breakage there and I'll help deal
> with that if it happens.
>=20
> The update and then removal of 6.17 is on purpose. In case any
> one was using it, they should get the latest tested before it
> starts to be removed.
>=20
> For meta-yocto:
>=20
> =C2=A0 - removal of any remaining 6.17 references
> =C2=A0 - introduction of 6.18
>=20
> The meta-yocto default changes are obviously REALLY RFC/RFT
> there will be issues, but I've provided them anyway to make it
> clear that we are going to 6.18 as the new default for all the
> variants.
>=20
> Once we get 6.18 fully green and the h/w references udpated,
> I'll remove 6.12 and 6.16 from master. That isn't in this series
> by design.

I ran this through some testing and it isn't straight forward.

We need a newer strace with the newer kernel so I queued that patch
from Robert. That caused ptest failures so I disabled the failing bpf
strace ptests.

ltp failed to compile so I backported a patch to fix that.

We still have a cryptodev-module failure:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2922
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2897
(all world builds I think)

and an initramfs module space problem:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2931

The rest of the build is still ongoing.

Cheers,

Richard


