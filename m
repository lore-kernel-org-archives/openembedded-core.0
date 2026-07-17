Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED736C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:11:07 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7845.1784268663644446455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KCgYXQQf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47d6c634f45so4169983f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 23:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784268662; x=1784873462; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X/zEO3enQgexBTQHwuxBazdsvqbsphGtLtm6Rajycfg=;
        b=KCgYXQQfDcVQmzkrHbT3nnpRw2R4Q8Jqa/FgGrQ+asVqqyk51EZ8TaLzsRzCsSxTsI
         m8oG7kaumSDj1VMZXxaqods71JH7I++OhIqvDLBwBQCgrAI79cbeyrCUuQmglW3T5yc7
         z68OxMdCjIcLooGAW+Qm3mBp1WvYdF4/hM6Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784268662; x=1784873462;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/zEO3enQgexBTQHwuxBazdsvqbsphGtLtm6Rajycfg=;
        b=q4xT68gyazgJWBGgN9JB4EatBaF/CUYx3q2VsTWWh8eTULBx0ieVmZjNoEpplIb+SO
         uH9mmWO6OHzWgtg+xkyG/vPo8BBBd53cAHu3I6fsd037DAccdUfuFYsLjROBXPa12KuS
         Ei668J1Y9903psvOQSpWWuc2T9NaEFeERL8uGKo5Wb4m+88F6t0RlSrDo9E099v81Z+S
         O325/n/AjIZX/5FIP6EqONi1g8Vhlk5lk65U17k1dsfNSFE1BESKOAmRo4IWOcVce1V1
         jguDhCw6K9pXMxMKpMP9//iNgcjdvC619e91UB7/9fjIpujLz63E5xw748x6D6MLVrJn
         z5eg==
X-Forwarded-Encrypted: i=1; AHgh+RovwpjGoCit4C1i/7CgnHydWHbLZE9H7/NerOmQK6zvXmsO5OY6n+KaGy6tJ0NUPRpePf3liL504Jjzvl64t2Si0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfYicXbiILA9veiO3UHSgE8Ys/KVcFz55s+QL4uz+KOeNb0v7i
	wQA+2dlwWe9uMBN2MHbqJui8qup4/zhiIUfkuII5xFjr/MGNq1SSCAMsOtCwYx5bz5Y=
X-Gm-Gg: AfdE7cm2IWQDjNvi8lnPQrgb/Z/mGDDRZTagX1zt7EjOmcnpUEnCOE4vAt7xWdUDnUu
	hNXSqzl67zS6fqfbCzrOEVegY5/r+bZgsbLsIcQ8l/TUmkrdUF5mgNC1jcPr9IaQMgptKWmij+R
	rna3lmu2qq6Fu2eZE1vQG7XxmEnOGwtj6JbH8r4Jza3D7mQLdZhuZTuw+6b0Qg297ysY4pCnqKg
	LWDf6vmTuEjVeJ5lksujmLPCI0sH2BDpuOUatrFQZxrdjTaLHEAx3vuC4fwbY7t7lGcujgOedxr
	mELwyyRw8TLnXPZZUyAKuZwSOfVJkBweZm+Uc+JOpjjAIkm+JOYfWrlfCvjbmzQUx+4LxJRnl72
	V9sc6187XFl3DSwMeXVesCthUyP9XLoeCVBLNpUwyCdBLK1xsEbRQZv4hvbd3V6cuZJfHxlKQds
	jKZ8sjTvV7UvGez/4ysW4LRbgEkjaZju9ABlQ/9hrd+E3mAZmnYFsjCeuRA9+B1eFO
X-Received: by 2002:a5d:5f86:0:b0:46d:9871:1a44 with SMTP id ffacd0b85a97d-47f6232c0bbmr1645540f8f.32.1784268661382;
        Thu, 16 Jul 2026 23:11:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4f8:d22a:f372:6bf7? ([2001:8b0:aba:5f3c:4f8:d22a:f372:6bf7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eeb360sm920278f8f.34.2026.07.16.23.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:11:00 -0700 (PDT)
Message-ID: <51b4348470f9f620160358d2ac8f14159248a5c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using
 systemd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>
Cc: leon.anavi@konsulko.com, openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2026 07:10:58 +0100
In-Reply-To: <20260716232011.GR749385@bill-the-cat>
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
	 <7e6827804a7b8da37204e54171d8fb9f7b490b35.camel@linuxfoundation.org>
	 <20260716182737.GP749385@bill-the-cat>
	 <ea3daf0012f4f0d582081fef8f4b6f0a7e2a9556.camel@linuxfoundation.org>
	 <20260716232011.GR749385@bill-the-cat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241150

On Thu, 2026-07-16 at 17:20 -0600, Tom Rini wrote:
> On Thu, Jul 16, 2026 at 09:28:26PM +0100, Richard Purdie wrote:
> > On Thu, 2026-07-16 at 12:27 -0600, Tom Rini wrote:
> > > On Thu, Jul 16, 2026 at 12:25:00PM +0100, Richard Purdie wrote:
> > > > On Wed, 2026-07-08 at 17:37 +0300, Leon Anavi via
> > > > lists.openembedded.org wrote:
> > > > > This fixes issues with test_machine_world when running the
> > > > > yocto-check-layer script for BSP layers that include weston in
> > > > > the
> > > > > dependency chain, for example meta-tegra:
> > > > >=20
> > > > > ERROR: Required build target 'meta-world-pkgdata' has no
> > > > > buildable
> > > > > providers.
> > > > > Missing or unbuildable dependency chain was: ['meta-world-
> > > > > pkgdata',
> > > > > 'l4t-graphics-demos', 'weston']
> > > >=20
> > > > Why wouldn't l4t-graphics-demos just list pam as a required distro
> > > > feature for that recipe?
> > >=20
> > > Because it doesn't come from l4t-graphics-demos it comes from weston?
> > > And l4t-graphics-demos supports wayland or x11. Doing something here
> > > would be the not satisfying approach Paul mentioned on v1 or so of
> > > this thread. It shuts yocto-check-layer up while doing nothing of
> > > value.
> >=20
> > I should explain a little about the unfortunate way that
> > REQUIRED_DISTRO_FEATURES works.
> >=20
> > Anything that needs a specific distro feature uses that but it has a
> > unfortunate ripple side effect where anything with that recipe as a
> > dependency, must also then have the same REQUIRED_DISTRO_FEATURES line
> > (or more restrictive).
> >=20
> > This was discussed extensively in the past and you will see this in the
> > way x11 is rippled through recipes.
> >=20
> > I appreciate you will then argue this should be automatic as obviously
> > anything depending on X will require Y as a DISTRO_FEATURE. I have
> > refused to implement any such magic as it turns out it can misfire
> > spectacularly badly and end up just masking every recipe out as a
> > ripple effect for a poorly thought out change as the worst case
> > scenario. There are plenty of scenarios where unexpected bad things can
> > happen which would be hard to spot. This was discussed in the past too.
> >=20
> > So, my point is that if you have weston-init as a dependency, even
> > indirectly, you have the required distro features requirement passed to
> > that recipe and need to mark the recipe as such.
> >=20
> > No, it isn't great, but the alternatives can go spectacularly wrong too
> > and you can't work out how to do this correctly automatically in a safe
> > way.
> >=20
> > You are doing something of value, you're clearly marking the
> > requirement of the recipe (which it has via it's dependencies).
> >=20
> > I think the question is marking the recipe in question to say it
> > requires "pam+systemd+weston" or "x11", which might mean anonymous
> > python but is definitely doable.
>=20
> This specific problem has (will be) fixed in meta-tegra since weston can
> just be dropped. But if I follow what you're saying right, since
> meta/recipes-graphics/wayland/weston_15.0.0.bb ends up with:
> REQUIRED_DISTRO_FEATURES =3D "wayland opengl ${@oe.utils.conditional('VIR=
TUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
> essentially every recipe that has DEPENDS on a PACKAGECONFIG that
> brings in weston *also* needs that same logic, to not run in to a
> problem later on.

Correct.

> Is there tooling to find and check that? And is the answer yes, we just
> ran in to it?

I'm not aware of any such tooling, it has all just been done manually so fa=
r.

Cheers,

Richard

