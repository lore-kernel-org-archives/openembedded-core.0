Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E52D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 12:11:12 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6270.1765282266155002779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 04:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZXstsOrY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so72370845e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 04:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765282264; x=1765887064; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X7oySnJewEqtmwbZNUDvu+aw7zRBMe26ftsStMjqVD0=;
        b=ZXstsOrYhloB9KdlBkmMRYiOTfWaJ+L5+HNWIwn8xQ3+PVFcDStbWEMMeD7mCq1sVV
         eDzJkbSwFw2r4qB/Q0ZAZrvSLDmTTuaNnbSYREujflamlFhyAR3G1gK+rHTyEFGDieLF
         0VGhEP3WmQOeAFFXZG1gaRQOB0/0EkRU/ATTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765282264; x=1765887064;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7oySnJewEqtmwbZNUDvu+aw7zRBMe26ftsStMjqVD0=;
        b=xNbkTjWlezhusHjXAx0mqbKjYp34Q7aPpkn9Rd3+8DBx6agkkG4Zs461klwkxVu7PU
         uAMSO+psm32zJlaHDgIxcHDXO+h68Ae8vO3bPFYChJR0H1tb79BFBzCoz0xb3h5F7HEH
         3vuZig/K1TLa2iLpBv32JEoxWn3EKfxzrpXbqdSfIJLDz421ZrNTu5iQVr9vwGERu1T9
         xSp2KdoAJ/0Y+hyaWL2D73EODew/pI9RUDFzH4kHL7Ai+edc/NyVwdXpY688kcHw4F8u
         pVjLJGkLJ2R4OCkn5MsFLvNjaPjpQmuI1pLKW+mhhlQb6ct6M1F/LfklKjUtGVQvBMTM
         5lpw==
X-Forwarded-Encrypted: i=1; AJvYcCXx2M3f5CbSDm426HSjGxOtSc00mnlvAO0T7uvo7EcT5v0Pb16B2LzlOllSptfnG4QKq5/spEvurfbMtKA3Lhly2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLVU2jyE+ko0PJk8+i6ir44ZaoM1tAXnzmNRXFltADVosgWCrZ
	XZkWLrvgsEPb4WMP+U1vJ2lf7jSVJUIUbq0S80pen11/mNN/kFXmIOR7M7QT03811nQD7CKp9P2
	8nAlnXZZlbQ==
X-Gm-Gg: ASbGncuSVKd7kuEV35xUm9yLJyK/OtKSzrgxjjA5rVd5c8izy8+mCWl8VrQo01OJfpE
	bFEkVAQQI3nOFSTTkkLVWQ+MPu2n1oiFgYZtWu9HbDfoNsNGG2GPOXgfJvk3XN6d/I5YtNOJb/M
	GID98ijHhsAtiEUqESm9WkhNsqcGnkUzs7w7ysBmptJSWPJ5wMyS5ej2PeaIsXijc39lRDzGr22
	Lt1y+7+Xmb7xktN3IKmuCczhwJFFVJoUoqCDK32w/DenItaLBKGLOPGlqxqEacdOVZcjs1rbt9E
	jKb6ml0EF6hlchFTWoV7ddfBBBib+y+JsNBIJEgZExhCu/ImKMeJNBShnXgNxxbHcn8RJZV+QxH
	pO7kSAZGjYLfv9FpzepP5Xb0cuazIU7TryTbSoi2WFzu0nxbgd2Kdik7D9LL+NlRyAMOUS9ckNL
	DvbIGeop61JL3q6cJadcttCiLRog0ohuhzQS7dzWCxTrVGBCZqwi/ZG+9c2Ajz3ICjo6CdcPHhd
	gLvCTVGu7VgOg==
X-Google-Smtp-Source: AGHT+IEjnbOyST1jIjUXoaTFPqcRvVx6DvJLuvXM9q3eZkEmjz1uSv7sRyrQ4ol513pi/Y+1DLw19w==
X-Received: by 2002:a05:600c:c4ac:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-47939e48f56mr99991725e9.32.1765282264430;
        Tue, 09 Dec 2025 04:11:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:31fe:6f5a:7771:4340? ([2001:8b0:aba:5f3c:31fe:6f5a:7771:4340])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d3749bbsm17344965e9.3.2025.12.09.04.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:11:02 -0800 (PST)
Message-ID: <96bf25fde10bb6d163ab8c268d5994fd862def21.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc.bbclass: set -fcanon-prefix-map for
 class-target only
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>
Date: Tue, 09 Dec 2025 12:11:02 +0000
In-Reply-To: <20251202075844.3270075-1-skandigraun@gmail.com>
References: <20251202075844.3270075-1-skandigraun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 12:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227432

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

Why are DEBUG_PREFIX_MAP being passed to the host gcc?

We only use it in target flags or nativesdk flags, both of which would
use our cross compiler, not the host gcc. If it is being passed to the
host gcc, that is a bug and should be fixed.

I appreciate there are some rust bugs in this area but those need to
get fixed, we don't want a global workaround we could then never get
rid of.

Cheers,

Richard

