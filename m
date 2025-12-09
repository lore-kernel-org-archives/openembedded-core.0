Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253B9D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 12:15:52 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6348.1765282549426009990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 04:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DqrocboB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-477a1c28778so70669535e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 04:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765282548; x=1765887348; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hr31ebGWEu2XkrBX3US9I+qFyF9HDohsiw9BZQo56BI=;
        b=DqrocboB8XWrJqD+Rv+/sEDdW8UXad2E7+ulQ1EgR+w4iggqI2+zEMpjXkZEvVPe1X
         g4zVxFFLa1bugVq6LDONcWiQn0HsAzg48hFCl6fPsR4lxsi27vi1WsPDrOiSM3a7SLsX
         GqzllNcMjZT+ANEBzUhekqTMaL0HC/KpEEDUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765282548; x=1765887348;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr31ebGWEu2XkrBX3US9I+qFyF9HDohsiw9BZQo56BI=;
        b=fuImr4R0bB5lKX0KlxJJNoEYgBjmMFG480Do6TW6qFSvRbLq0J14KRsw9Ua61KezbV
         4d2SrL+Hf/0p56BReYxRL8jApLUXb7vmzP0Msk+pDXBujqHkTR3xNDnvQUkbi8dLSfs9
         CoIICw2uJRIjbY9lKOP4GTCyiCjxFmr93q/v2tSg71DN7vk3ZVsxLnDudHsdI2BHNYO8
         jxasQBLJv9TNE62OkqVClvKV9ofsxptw47qzgdt/DjwLMCZLekcRhh3VWwrA7oq/Q2JE
         GoKC4TBbEa3evBUZ3SNMK9T+5BTCGGCBacmsgNOLtOGQDLMXBvk2gH+8tG1G1QUPbXCi
         tEAA==
X-Forwarded-Encrypted: i=1; AJvYcCW6CSvSGuVBfBWPlszT+M3U8vAAdsYCJG9AvGan01tOo6dleLBbM0LJN/s0FxXfKm7kzXfG69ETfpc6Bwmcaq/EZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzulzOtC+EYE3ZDKhcgCcjwQaNhSQszT6K28g2SDoG6JAdu+rov
	WJliraDfdKpr8pvh5O9eZb0LFv5t7Tde0Y7KuEDR0+UdJymjNgR+sNg0lzS4lW/kOz3a1mZPLC0
	V762YWAD20g==
X-Gm-Gg: ASbGncsuHaHWeohov1JmzmTIubeSBMtRKbixB43qZVHTzhxZpFZS+1oVp3SwSzdaQeN
	VNI7ZEXwSIm3b2jP+yn6cIv88sIkJeyDKyClMuZSUCnEE+AJgGiodugfqK/OtrbqqC0u1oUi6K0
	Feg4v+FfzJ9fQGVvyzr8yoERP0FuRH5r5Y/ETskJEFe2HFCIrPfVReIeAtm8O7hVFmfQ4eTrVdi
	Rk3vyIHpOEwoN84oL1/xZv63WU2WRyXmHP0VUVOCPAvowvutJzsNXbWnjHV1fa/IZxig17SB5Kp
	A6xGiJ8D95M0gyl3cOyXQTIRiYtMn19zSa/17XSQSmoPLOOWsKof9hwJQCD8UflYMvnbG098rPm
	6HoqZDgulQVgLDCr3Fnko7PgyeDMiWEvZDtGz2V4H8RgzzGICajpxQwdydZDhjTlrfLEbj7Su6E
	Rh/TIEYHkcXrgQhqvwnur8Z5dNFgdZ6SJWsQdUSZCYvKgI30yZHp/CaVrjNoa2KPieBNS6XvYIL
	ILEhsHRS2+OgA==
X-Google-Smtp-Source: AGHT+IEfA+5KnQ5Qg3alvHNLzc1h0BVtvpsj1TfgvDSJDCnvenpjIZP/n39MwUrsFqZqc0JjDSXa+g==
X-Received: by 2002:a05:600c:b93:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-47a6f9e7da9mr89419095e9.2.1765282547663;
        Tue, 09 Dec 2025 04:15:47 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:31fe:6f5a:7771:4340? ([2001:8b0:aba:5f3c:31fe:6f5a:7771:4340])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d2e7110sm19766095e9.0.2025.12.09.04.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:15:47 -0800 (PST)
Message-ID: <21ecfe93e87cc6126ceee4d520125e2819b2f1e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc.bbclass: set -fcanon-prefix-map for
 class-target only
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>
Date: Tue, 09 Dec 2025 12:15:46 +0000
In-Reply-To: <20251202075844.3270075-1-skandigraun@gmail.com>
References: <20251202075844.3270075-1-skandigraun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 12:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227433

On Tue, 2025-12-02 at 08:58 +0100, Gyorgy Sarvari via lists.openembedded.or=
g wrote:
> -fcanon-prefix-map is not supported by all host gcc version that is suppo=
rted
> by the Yocto project, which causes build failures when building recipes
> for the host machine.
>=20
> This flag was supposed to be set for class-target anyway when gcc is the =
toolchain,
> but even when a native target is compiled with gcc, both gcc and gcc-nati=
ve classes
> are loaded, and gcc.bbclass overwrites the DEBUG_PREFIX_MAP_EXTRA value.
>=20
> To avoid this, set this variable for only for class-target, explicitly.
>=20
> Reported-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
> =C2=A0meta/classes/toolchain/gcc.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/=
gcc.bbclass
> index 0ed49ba892..5ec98bf7c5 100644
> --- a/meta/classes/toolchain/gcc.bbclass
> +++ b/meta/classes/toolchain/gcc.bbclass
> @@ -30,6 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cro=
ss-canadian =3D "gcc-crosss
> =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian=
 =3D "gcc-crosssdk-${SDK_SYS}"
> =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canad=
ian =3D "nativesdk-gcc-runtime"
> =C2=A0
> -DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"
> +DEBUG_PREFIX_MAP_EXTRA:class-target =3D "-fcanon-prefix-map"
> =C2=A0
> =C2=A0TCOVERRIDE =3D "toolchain-gcc"

Just to be clear, this patch does have other concerns, for example, we
should be passing that value to nativesdk too which the above patch
also breaks.

In some ways the opposite would be better:

DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"
DEBUG_PREFIX_MAP_EXTRA:class-native =3D ""

however my original concerns stand, we shouldn't be passing this to the
host gcc at all in the first place :/. These complexities are really
why we need to fix the underlying issue.

I did take some hacks into the release since it fixing this properly
will take more time than we had available but for master, we do really
need to get to the bottom of it.

Cheers,

Richard

