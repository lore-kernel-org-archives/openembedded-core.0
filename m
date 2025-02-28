Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B338C282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 10:37:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.12911.1740739058283982158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 02:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IBce3Bmf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2f391864so1090141f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740739056; x=1741343856; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wB3WwAKw1dQNiXhPY49/UKD9NacRWmGeofc0rmUcUn8=;
        b=IBce3BmfKQ4t4L91ChLi3JmFhkqICmSi2MfhrNUEaCdTdzHl6oHGVtXG7DGszVmXs1
         XiErEfz+mR2fei4uRM3wi4TKtsmzey8TuWTKzkVaaSaxzCIoL7E76BN9o0te38KYHhBJ
         RUVcpoErxLcFqgfam1aSWtDibYjtEH4lPxWhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739056; x=1741343856;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wB3WwAKw1dQNiXhPY49/UKD9NacRWmGeofc0rmUcUn8=;
        b=VowqmKLjcMDh5mVCBprhLnoIvO8jmCq59wbHH1I3D6+X6XreMpiZhcBrncxdZO8vdv
         oWR/fkFzEBjzb2ftUL0b3xxFlERGQCY9NJPcSerVaeK9s2xVC8Dy9P+GNEeTRbQkTWds
         PWVFbQxzPAGUVXt4U9KG+Qn51/bG0LndNZ1pBSufyCzTcOM8oZrxCwzy7FFO2ZFN8S/B
         MfarCF500xOVphiBFkHJB8EFu3V+qVccFxVKE3iKdQrC4GCEVNyAYw8VcyudlXERlW6k
         wDapux0lU3B6KSdMinrTp9Gg1zuW7FGODfQJfBAUEpPkltXdslVuqxvId3LWqbf9ci1X
         pq0Q==
X-Gm-Message-State: AOJu0Yz67dAyocwh7vaYRVx6bOG34zxVjVpZajJE2csgpxpphpCS4smM
	5hG2jXbOuGuKNh5LMl0YkseEH/NpeEh3tz2u+2OrtPjvcQKj1N1tsSdLaz3/2dw=
X-Gm-Gg: ASbGncs3peVsbUxdNyHuvGWH68PDzNMQyZJv5cVjV0Ah4HHGiQdwwTtIZooH+cpVjli
	mRcfAZVdBKCzgptM81JK1ITB1ttunvmTCvMiyh08sw/d+MWLsuwnneR/GclTubNT1sVvQqfBUxb
	sks8fiUQeDV6uW1UlefXjjiP75KVmhwI7Uo1UsMG7pBd8u1/1zYIaOWu1DJj03Y2lMLAC0s/HZj
	RsOR17Ji0m3QJxTn0yhK19fG5og61dFYHv9EBHj3gpo8ZPJ8gOXO2Znc5hYjaPs3praSt4w0xAQ
	/ZeMajIqMZ8HuKzOHfGhzpLbXbspVKqCwlcIbhBY3PRLI6UeC412TNaJb/9lKQpLGXMQdc2taYg
	fnkYW9InszykxWiM=
X-Google-Smtp-Source: AGHT+IHyyjmO8Mxu0E9+vEe5r6+sbosXOzfTRiN6+gVedrK3n8KtaOEHkel9XorX1DxtdvCJHlJT3g==
X-Received: by 2002:a05:6000:1882:b0:38f:3b41:c944 with SMTP id ffacd0b85a97d-390ec7c978emr2450009f8f.11.1740739056568;
        Fri, 28 Feb 2025 02:37:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6ddc:363e:e14c:9394? ([2001:8b0:aba:5f3c:6ddc:363e:e14c:9394])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7cf2sm4900745f8f.59.2025.02.28.02.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:37:35 -0800 (PST)
Message-ID: <0b50a9ac2a5678fd35e2ecd0be842847223a0096.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section
 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Othacehe <othacehe@gnu.org>
Cc: openembedded-core@lists.openembedded.org, Quentin Schulz
	 <quentin.schulz@cherry.de>
Date: Fri, 28 Feb 2025 10:37:35 +0000
In-Reply-To: <87frjysae1.fsf@gnu.org>
References: <20250204103744.27883-1-othacehe@gnu.org>
		<11f5d7bcfd74d901e8001e7316244a037ae1860c.camel@linuxfoundation.org>
	 <87frjysae1.fsf@gnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 10:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212057

On Fri, 2025-02-28 at 10:09 +0100, Mathieu Othacehe wrote:
>=20
> Hello Richard,
>=20
> > One of the reasons this has stayed as pending was this messy argument
> > passing, which I appreciate is pre-existing code. I've sent a patch
> > which cleans it up a bit and this patch will need rebasing on top of
> > it. That should at least make things cleaner.
>=20
> OK, noted.=20
>=20
> > I'm still a bit unsure what to do with the stripping changes this patch
> > makes. One concern I worry about is having "magic" options users need
> > to know to set. The other is whether there is really a binutils type
> > bug underlying this and that there really should be a fix made
> > somewhere else. I don't know enough about the issue to be sure whether
> > there is an underlying issue though...
>=20
> I think that this can be seen in a more generic way. To get a backtrace,
> libunwind supports multiple methods on ARM:
>=20
> --8<---------------cut here---------------start------------->8---
> /* unwinding method selection support */
> #define UNW_ARM_METHOD_ALL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0xFF
> #define UNW_ARM_METHOD_DWARF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
01
> #define UNW_ARM_METHOD_FRAME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
02
> #define UNW_ARM_METHOD_EXIDX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
04
> #define UNW_ARM_METHOD_LR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x08
> --8<---------------cut here---------------end--------------->8---
>=20
> The default one UNW_ARM_METHOD_EXIDX only supports partial backtraces,
> as explained in the GCC thread[1]. Then, the UNW_ARM_METHOD_DWARF method
> that provides complete backtraces operates on the ELF .debug_frame. By
> always stripping that section, and offering no way of keeping this
> section, we are preventing the user to use that unwinding method
> altogether.
>=20
> That is true for ARM but for other architectures as well. It can very be
> that one might want to keep the .debug_frame around on x86_64 so that
> the same unwinding method is used across all the architectures supported
> for a given image.
>=20
> Maybe going for the v2 approach allowing to keep any ELF section, would
> feel less magical than the v1 approach that was targeting specifically
> the .debug_frame section.
>=20
> Finally, the .debug_frame based unwinding was a bit broken on libunwind,
> it this now fixed[2], so it would be great to be able to use it in
> Yocto.

Thanks for the info, this helps but I guess I still have a question.

You're using this with minidebuginfo so does it not make sense to add
this as one of the debug sections injected there with the rest of the
minidebug info?

The option users would would then see would be whether to include frame
information in the minidebuginfo section and we'd benefit from
compression.

Whether the tools support accessing it from such a section, I don't
know.

We may also need to make the sections preserved architecture dependent
as I think good unwinding varies by architecture based on what you said
previously.

My main concern here is how to expose this in a way which users can
understand and use.

Cheers,

Richard


