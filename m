Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11E6C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 14:33:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.19945.1721399581753627171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 07:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MBfdQWdV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36799fb93baso779396f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721399580; x=1722004380; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F69HimBqjWaQWwVVK7JI8+uwBiZLmTyYSFGTaprqeRo=;
        b=MBfdQWdVT3g/7RvtTN3t3lZeYoteLnsSZX+i5fKALUT7UofksZ1eBTAxcw8mCZNjz+
         zPT8rkDS1ZzF0CtxaGXFwL5J88Cdp1n/1aGQ0Ed6GymVmtBhp/DQUOHLzunmrVaQE4K2
         LQHPTDBWgBZ0SCEC3w4oL8jDMgPmNPWspYvck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721399580; x=1722004380;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F69HimBqjWaQWwVVK7JI8+uwBiZLmTyYSFGTaprqeRo=;
        b=gvSHvZByVepEcSWR6Nazkka3Izw0TqxwNXi+JYvX7saVsJcSaZ5b20g1/Zh0pTQeLs
         5Ufk7zllwmRONPmVoeRI0SaVpcXfOUdUzeJ9MMyG/yXP+M8YS23hJOeDsoSdWk/gxraf
         4skIgYtT66uiSkT/eIouaDG7Pk2hTP7EoT6WHmdKVJJYWkKHzdGJAhTvYX3UUZfn14Zd
         kwwbmGGIIJAo3C90PdCr4y1xnJkSPsH9E2nYDDAiHwiB1DKx+9JzNXn2a93tBpdsjqLa
         Cc/uQjkE2m2y2xpEsmGSWJQ2VFPj1amLn0MYMUfmSZ5+tkeqKyvirnOOR3iANsPz3tWn
         1A8g==
X-Forwarded-Encrypted: i=1; AJvYcCVGp+i2stRAoNR+/wGyY9URCY/nsn5Hlj9cz3aDfSWNN/2CyYvXrTi/7B9UrUyVrNbUADG3iWg+ClmNp3Fy23hWSV8fv1U9IG/tiqWSM/YKblqISE6N11e5
X-Gm-Message-State: AOJu0YwZVnN1mB4xBRoEKi1hO75csu7q2O5/FGLckiFpuiMasrw+QQFg
	Sc5XMliv8hytr/UhHmkIggxIf6sc09j8UNDXBC98InrABH/DGVLIOWMdu+wh6H8=
X-Google-Smtp-Source: AGHT+IEZouI6Y4gAsZkAx7akbBHGfF3mtlkYbGugdArUjC/PDJY94+oTjjcDNAq4gGwbO4anqlcc/w==
X-Received: by 2002:adf:a311:0:b0:367:8875:dd4c with SMTP id ffacd0b85a97d-368315fb700mr6210246f8f.23.1721399579957;
        Fri, 19 Jul 2024 07:32:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ae78:24f6:1d30:8e7c? ([2001:8b0:aba:5f3c:ae78:24f6:1d30:8e7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878694d08sm1781184f8f.63.2024.07.19.07.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 07:32:59 -0700 (PDT)
Message-ID: <a703abe53573ba10add3194a9bca5a368619e217.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/4] package.py: Fix static debuginfo split
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Date: Fri, 19 Jul 2024 15:32:58 +0100
In-Reply-To: <1721345282-10901-2-git-send-email-mark.hatle@kernel.crashing.org>
References: 
	<1721345282-10901-1-git-send-email-mark.hatle@kernel.crashing.org>
	 <1721345282-10901-2-git-send-email-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 14:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202265

On Thu, 2024-07-18 at 18:27 -0500, Mark Hatle via lists.openembedded.org wr=
ote:
> From: Mark Hatle <mark.hatle@amd.com>
>=20
> Fix:
> =C2=A0 NameError: name 'shutil' is not defined
>=20
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
> =C2=A0meta/lib/oe/package.py | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index e6b46a0..8a64e13 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -838,6 +838,8 @@ def splitdebuginfo(file, dvar, dv, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 return (file, sources)
> =C2=A0
> =C2=A0def splitstaticdebuginfo(file, dvar, dv, d):
> +=C2=A0=C2=A0=C2=A0 import shutil
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 # Unlike the function above, there is no way to =
split a static library
> =C2=A0=C2=A0=C2=A0=C2=A0 # two components.=C2=A0 So to get similar result=
s we will copy the unmodified
> =C2=A0=C2=A0=C2=A0=C2=A0 # static library (containing the debug symbols) =
into a new directory.
>=20

For a really minor performance tweak and general python styling, this
should probably go at the top of the file since there isn't any real
reason to have it in this function.

Cheers,

Richard


