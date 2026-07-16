Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B195C44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 20:28:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4315.1784233711063401798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 13:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FQ0xkJXl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so6253478f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784233709; x=1784838509; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q76GO3Mntjf6BPfcdqzp+jq/+aQIikTTgwWm+D15d9A=;
        b=FQ0xkJXlKXKqbFDYgv1Z1SMHPASoCXXzTyzao0E6NLMzHwgmFnFE8w2dtgJ/3EnYHi
         jkLweoQXuh9P197rMG2n9E1zNt/+hPtDDrYtIQ9ZZC2YWm+/+RbFtmTsYH4OaghmvHgt
         G9SWYHW8I0J4IcUSRG3GMlOiITvXVKqH+pg7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784233709; x=1784838509;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q76GO3Mntjf6BPfcdqzp+jq/+aQIikTTgwWm+D15d9A=;
        b=Cowmq1ycsooOiBMLkqKgC+wEYdGsF6hSvxFVRIlY0XOd/rxin8GYJJ4SK+lJcoLZjG
         OharGf4z5TEHGsSq8sf/Hv8FPe1ljM804ilx5/mD54zxYSLof3yLR9adKwgi6lOUJxag
         5JRsBTY/sZgMlvWvRygMNNrAeOQ9SWlsrVUGN6o2Onwblb+BWTRJs9L8jxHynRMX1x56
         AEaOvFTZ+VRoyYJFlacwS1S1gGhvjRm2p/WdnL4yLUSBanimHY3YINPy9dQzOqBRfFhw
         LtRFUWsyIjea6aBFz6go9Mnaa0Hn6HduWaP2jjVh+jlbyPHDsk3dZrrpCslfogKG2lep
         RaGg==
X-Forwarded-Encrypted: i=1; AHgh+Rpx67EsyMSbo21WfgSiUGyKfZ/ODx+C1N63Ihfl22H9QfOywUXjZeVQ5yYYsFydNZn8LUhEu7IWgK2Qc3iWklU6Fg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzFRAivlmoJMRj5+ZQtmBWXpnTYF3Ed4m9sfMTex4yovnElHnbT
	375H7wRUy3OWffszKZ35sjt4cR2CnwZj2Sv3gd5uj6uRnc0jwAhIk+mqC7TrRB05rds=
X-Gm-Gg: AfdE7clfZmvTKXkan7w/NsrGwLRYNAWqjjSWLEV00qL/ZGv4cQ2Eh6g035GDvYvDS0B
	9plbb/3xEZ6V7LJ0PqxGERX6OlOjpaZZi7D0GHLs6+Sg2MhA5anaJitTS6nK16o4OqbtErjyhMC
	EjqzGE0x4/B0xMtFIA88y3gzerAf/7kCgBbuaJYVDqExAM14TveAtG2el/4T13PPSkg0kd/94ql
	N/J7U32yxo8uMy+6Y9nQmAiBa2RXZ+xkj5xeIVGvK3nrOb4w/MmukCkOI+xJNu3j3MLGRf4/mBB
	99qrrmdDMgSJpvTUakjmFZpnrzTjk4mqxxOVv4pvhyYDd34tWEOLDBRx6V/ABg5G+ruTo4OYCL3
	fGBVDDQGoIRHcbcHogKmD//b2P/lC3TQq7p7PSC7WRN6vI5fM+GUsf1DCbRRVZxr1//FJE1zxga
	0BxfVNjUL33DxpW8VzFUzGJP42nuIDl05e3Z8SD6IFvgoP2/gfKTZQXlBt4XyI23uedW7hexAuR
	m3WDQ==
X-Received: by 2002:adf:e184:0:b0:472:79bc:3919 with SMTP id ffacd0b85a97d-47f4fd113bemr11224064f8f.39.1784233709191;
        Thu, 16 Jul 2026 13:28:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e015:73b8:9d1c:3a0a? ([2001:8b0:aba:5f3c:e015:73b8:9d1c:3a0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c25b2sm26681967f8f.30.2026.07.16.13.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:28:28 -0700 (PDT)
Message-ID: <ea3daf0012f4f0d582081fef8f4b6f0a7e2a9556.camel@linuxfoundation.org>
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using
 systemd
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>
Cc: leon.anavi@konsulko.com, openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2026 21:28:26 +0100
In-Reply-To: <20260716182737.GP749385@bill-the-cat>
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
	 <7e6827804a7b8da37204e54171d8fb9f7b490b35.camel@linuxfoundation.org>
	 <20260716182737.GP749385@bill-the-cat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 20:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241108

On Thu, 2026-07-16 at 12:27 -0600, Tom Rini wrote:
> On Thu, Jul 16, 2026 at 12:25:00PM +0100, Richard Purdie wrote:
> > On Wed, 2026-07-08 at 17:37 +0300, Leon Anavi via
> > lists.openembedded.org wrote:
> > > This fixes issues with test_machine_world when running the
> > > yocto-check-layer script for BSP layers that include weston in
> > > the
> > > dependency chain, for example meta-tegra:
> > >=20
> > > ERROR: Required build target 'meta-world-pkgdata' has no
> > > buildable
> > > providers.
> > > Missing or unbuildable dependency chain was: ['meta-world-
> > > pkgdata',
> > > 'l4t-graphics-demos', 'weston']
> >=20
> > Why wouldn't l4t-graphics-demos just list pam as a required distro
> > feature for that recipe?
>=20
> Because it doesn't come from l4t-graphics-demos it comes from weston?
> And l4t-graphics-demos supports wayland or x11. Doing something here
> would be the not satisfying approach Paul mentioned on v1 or so of
> this thread. It shuts yocto-check-layer up while doing nothing of
> value.

I should explain a little about the unfortunate way that
REQUIRED_DISTRO_FEATURES works.

Anything that needs a specific distro feature uses that but it has a
unfortunate ripple side effect where anything with that recipe as a
dependency, must also then have the same REQUIRED_DISTRO_FEATURES line
(or more restrictive).

This was discussed extensively in the past and you will see this in the
way x11 is rippled through recipes.

I appreciate you will then argue this should be automatic as obviously
anything depending on X will require Y as a DISTRO_FEATURE. I have
refused to implement any such magic as it turns out it can misfire
spectacularly badly and end up just masking every recipe out as a
ripple effect for a poorly thought out change as the worst case
scenario. There are plenty of scenarios where unexpected bad things can
happen which would be hard to spot. This was discussed in the past too.

So, my point is that if you have weston-init as a dependency, even
indirectly, you have the required distro features requirement passed to
that recipe and need to mark the recipe as such.

No, it isn't great, but the alternatives can go spectacularly wrong too
and you can't work out how to do this correctly automatically in a safe
way.

You are doing something of value, you're clearly marking the
requirement of the recipe (which it has via it's dependencies).

I think the question is marking the recipe in question to say it
requires "pam+systemd+weston" or "x11", which might mean anonymous
python but is definitely doable.

Cheers,

Richard






