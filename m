Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57C8105F78A
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 10:03:41 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12513.1773396219142752069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 03:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1LbewX6A;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853aec185aso17147125e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 03:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773396217; x=1774001017; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyoxoC5af/348ucBkcRiASBAuuiNdWdN+djEDTnRj14=;
        b=1LbewX6AGjwb8XnpZlaZsdxKP2bPYuXyCFTRCpr0YsOgbK37JOiAr3UK2EPPykIupV
         A/SGEW7BnojCz48+HFwBoYQelEeO+oudo8FO50jVTQCHjHK7ZkHEv73jkecfkG3gi2W8
         zYnnPnGE5gYbdLROGwXxcJMBYflAfoKLraKBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396217; x=1774001017;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyoxoC5af/348ucBkcRiASBAuuiNdWdN+djEDTnRj14=;
        b=eTgQin3axa4j0rbiannleEyjZdfNdwB3vnlpr7MorqqLSj3+KChg/9x6VSik5WF8Fx
         NeadzB9+TlQNE2Y0aci7RptLK27fm5Aw09BB9U3wEQcqeFjrHFT6GZWIg570WRYRbUEF
         yX5lf5oM+o0/ih2DkA1qW6ZBem/O6RsLvvUKoRuxIDXeeAsBTwBmXBcuIphgwVm7r1YD
         6DDhlcjOoJyedTiO855MOUzHnNxBGCCM62n4sELaZXr+LJvwhDQcowTqN4FD6QDr1yMZ
         x033l6b6tf/7/4/pl7zK34/fTq0SFdKP0TwaI5w5Xb+FNtI/8KSHDAaI+a8bQzBEB5PL
         69zw==
X-Forwarded-Encrypted: i=1; AJvYcCVOuFfhEYvpOCofF96yYWjowk36xL76S40MT9pGjvYVzFnIsg08PIgqn3YpAydKk5rwpS7wH9TAN36cTD2d98wM2w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxosLCFsCCIancHnBwwxX6FQyNT9FUHGZpYalPsiCb4U1DSJxAT
	6323496ByVzjP7NZFAP9xYqcUYQU5trG9iAZzo9wpwalmNLW/Rxp1Uu/wwEWYfwCKgM=
X-Gm-Gg: ATEYQzzeClqwmArcsgBeUJF37FPILaM/xp06/PaFDMgE6O5oV5Vou9nAMw+fXSuf4/8
	AdczTqPJzMpoFhQyH/yQfjRu8XY5A90vr3/BeBzjE1N7bts+dpBr9bW3e4oDSQe83ZV9Ya2JFkT
	UN9c55Fcv+1zBNFxmS47zRFhGLMsb7eIjyY5N/CZEUD+pR/rye8vClTQgFhvq+9Q9UGlJmDRxlW
	NVypUCBGFn6VGvuDFtyFTOLzxb+57DNOOupATXAVvImod5N/gIyLAW+Ak/6l3BleiDxbpM/bmco
	F/KbJQ4Pwr/87YvJc43+6/UGSJCbwk83kWTUBjUAXEjYJKjdQ9385JTYKdgdjhnFi6uIGO5m+BO
	vahlD0eERkO0PjQTylUurra3Ol3FWCsRSeeeybbwx+goK7jJhL2i5IyTiYx/zcR7I3vlzT52P1D
	83bnXEsojXzHdd1BuEq2ItgZchX1nfFU/ii+VLTncbyfqmmvK+KQ42C3MLWM+R9O6wkfKqxFDs/
	aCeU9GnZMTbvDXd
X-Received: by 2002:a05:600c:4514:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-48556709e21mr36053755e9.29.1773396217305;
        Fri, 13 Mar 2026 03:03:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa001ac8ae6baecd7e1d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1ac8:ae6b:aecd:7e1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f406sm288593685e9.13.2026.03.13.03.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:03:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:03:36 +0100
Message-Id: <DH1KHQYZM84X.3EEOISJ6ZCA7E@smile.fr>
Subject: Re: [OE-core][scarthgap] Backport request: python3-setuptools and
 python3-pip remove Windows launcher binaries
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Viral Chavda (vchavda)" <vchavda@cisco.com>, "xe-linux-external(mailer
 list)" <xe-linux-external@cisco.com>
To: <krkapate@cisco.com>, "steve@sakoman.com" <steve@sakoman.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <BL1PR11MB5399F0A3D5E0ABEC59926791D345A@BL1PR11MB5399.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5399F0A3D5E0ABEC59926791D345A@BL1PR11MB5399.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233034

On Fri Mar 13, 2026 at 10:53 AM CET, Krupal Ka Patel -X (krkapate - E-INFO =
CHIPS INC at Cisco) via lists.openembedded.org wrote:
> Hello Steve,

Hello,

I'm the one to reach about stable branch maintenance. Did you see Steve
still listed as stable maintainer somewhere? Maybe I missed an update?

>
> The following commits were recently merged into master and would be usefu=
l to backport to the scarthgap LTS branch.
>
>
> These changes remove Windows launcher executables that are installed by p=
ython3-setuptools and python3-pip. The binaries are only relevant for Windo=
ws platforms but currently get installed and packaged for target, native, a=
nd nativesdk builds even on non-Windows hosts.
>
> Removing these files when not building for a mingw host (mingw32/mingw64)=
 avoids shipping unused Windows binaries and reduces package noise.
>
>
> Commits in master:
>
>   1.  Cf7c79f3962f2be99cfda47e8cc730091e6a18cb: python3-setuptools: drop =
Windows launcher executables on non-mingw builds
>
> https://github.com/openembedded/openembedded-core/commit/cf7c79f3962f2be9=
9cfda47e8cc730091e6a18cb
>   2.  90d208fbb06b6e6b5aaddb0048fd6e2e1d46c8bd: python3-pip: drop unused =
Windows distlib launcher templates
>
> https://github.com/openembedded/openembedded-core/commit/90d208fbb06b6e6b=
5aaddb0048fd6e2e1d46c8bd
>
>
> These commits apply cleanly to the scarthgap branch.

Can you please also do some testing? Building the recipes under default
configuration should be enough for those patches.

> Could these please be considered for backporting to scarthgap?

Yes, I will add those to my review branch. And report back if there is a
problem.

> Thanks,
> Krupal Ka Patel


--=20
Yoann Congal
Smile ECS


