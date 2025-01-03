Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20CCE77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 11:12:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.28243.1735902721837858473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 03:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DeIVOGSF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso73566845e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 03:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735902720; x=1736507520; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lt7yGqrkq8U1e6ZCI654A+gPhjZnX7w5b+GIoawN19w=;
        b=DeIVOGSF9j1VqC3sXCEfDGhhzrkU8nzmJE0dxXtKhM8bwUQLVdlyUV1GazaBolKf8w
         8NQXm/qydKlr2CBKI7hcMrP/kTkj3GrTxTweXhlFxsCiEyguK7+VqNOkgPj9puvn/w4n
         JSa2rRffyQKmRrnzs+SWYHzgaGaObEDsLxzD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902720; x=1736507520;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lt7yGqrkq8U1e6ZCI654A+gPhjZnX7w5b+GIoawN19w=;
        b=ibOymB/mfVmvd/rjZpMm8UnB4qnKBfyRmv9CS+QKMGFNDEqy5OLB+Pqwyru3RoMkhX
         A6o4MfGz/3Q2JNxVWuDnIWukAaaDzP+GllLPotABpE2i3b7W/hX7W2Wc7okBn1XyU+dP
         veVCB6EyUKUdn0e37X+kHkH6eV48tdc2NgyYphK+ab+qimGO5tPW++nlrkHbtdUBtF23
         Ml63In9nsJNGWgtaKtXkjFuXujICnCymmeVhb3NJkJxImXozm87e37HiZ7KTUFuW0pU9
         30pKOAi0uOZoGwPxxv/Sbgf/sesqHZyu2KRqT2TBEYuhoww3/BHhVaaAYge2lnI3XC0/
         uVrQ==
X-Gm-Message-State: AOJu0Yzx1g+3ewWb+wUcEvbI5TLI1MPtUQms+XEfUuL0VdQ0s6YphQi6
	Xt9ngwIVaDo2DIczU77GxEMEzOW8qDMCe2r+W/v6MwpZKyzw8VFA2MI8VTtFceA=
X-Gm-Gg: ASbGnctZnt+u36LQJbytgumseu6yWS1UyarCmhQD7P7p04XGYrscqEpAFHzriOlPXKS
	BYQnITdu9EE13br7/lHNzxHDA2/VNLMI4C6lRSZEnYDILX2bfUurKq5ImWxGZ/20o34EH3ZPx6X
	pt9HLIItqN/pFTZnNCnshiwLgVr3M5jVz8ddE1bWJRR49Yutdd1q6Mk8L9qfr6PBvCvLn1ynnGF
	IIayS6kxgROSSgrWFA0IIZzq25RXLpTwV2bGQL+t/IEvGYaP39+hypwPohOYxINFBvkUDB7gz2m
	DrVqoq58mm2quHCiCWN06hhbQDWc5bZxe+uP6ZScnvfqyQ==
X-Google-Smtp-Source: AGHT+IFdQmOH0no9I85ppdzV40AYyJGUWID3NnAL4mOYqZ3z4DgbzDDv9mFnYFwMNVSi8/hpD9nq8g==
X-Received: by 2002:a05:600c:3512:b0:434:f3d8:62db with SMTP id 5b1f17b1804b1-436696feb7fmr373940085e9.2.1735902720222;
        Fri, 03 Jan 2025 03:12:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4279:1195:6db6:fe19? ([2001:8b0:aba:5f3c:4279:1195:6db6:fe19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6e19sm40238984f8f.100.2025.01.03.03.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:11:59 -0800 (PST)
Message-ID: <c47f231db5bf48abc1cec8a2d26b355a4ef31132.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] python3-jinja2: upgrading to 3.1.5 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: auh@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 03 Jan 2025 11:11:58 +0000
In-Reply-To: <0101019421358da3-d32cbedf-2fb1-45f1-8694-f43e34bb8596-000000@us-west-2.amazonses.com>
References: 
	<0101019421358da3-d32cbedf-2fb1-45f1-8694-f43e34bb8596-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 11:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209347

On Wed, 2025-01-01 at 09:32 +0000, Auto Upgrade Helper via lists.openembedd=
ed.org wrote:
> From c46bb9d47eff5793ce4d4ff9fa244c497e735c8e Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Wed, 1 Jan 2025 07:02:12 +0000
> Subject: [PATCH] python3-jinja2: upgrade 3.1.4 -> 3.1.5
>=20
> ---
> =C2=A0.../python/python3-jinja2/fix-3.13.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 87 -------------------
> =C2=A0...inja2_3.1.4.bb =3D> python3-jinja2_3.1.5.bb} |=C2=A0 7 +-
> =C2=A02 files changed, 2 insertions(+), 92 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-devtools/python/python3-jinja2/fix-=
3.13.patch
> =C2=A0rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb =3D> p=
ython3-jinja2_3.1.5.bb} (85%)
>=20

This fails in ptest due to a missing dependency on python3-trio:

https://valkyrie.yocto.io/pub/non-release/20250101-59/testresults/qemux86-6=
4-ptest/python3-jinja2.log

Cheers,

Richard

