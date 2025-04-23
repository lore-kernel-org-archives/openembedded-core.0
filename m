Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1F8C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 10:55:26 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.5650.1745405717252820870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 03:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QIYV12cI;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30effbfaf61so9403801fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405715; x=1746010515; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BXCKQVn9MTP0d9lkp51VoV6kGRuut8106h8Rk3ZOS/k=;
        b=QIYV12cIOt9A0jOh2TdQoImpzm+/ICODOK1w/o9+1oIJbRYbaCF9YXKxnoMOYONUqg
         z2WWVc7nSa1hwtKivVtPXK1lteips+/WQ13+XJYUfARbgjTP2s7RS8UjK//zyPHojXB+
         sB5GDr5hcZjyQJQcLT1zEeUr3Yb/HAXL5Sb8rGl5s32AK/vcJxzMFQMFhem/x31pRGk0
         iM6dIcoCjjudkQ3wnUBbHBmyDb+emOfKZQ6YKSz3JqzDxscBwr1hLYbPqNPSw8PdIaYU
         iUzSk3jblw1rSmavAfptKsKwKyU5fQCAD6r9Jz0mZSvbATlSttK8hkjDmkaU2OFAM10H
         4Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405715; x=1746010515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXCKQVn9MTP0d9lkp51VoV6kGRuut8106h8Rk3ZOS/k=;
        b=pnfV1w6BUPMBoTLmbiUO54a0gU3PRLDDn6So5PoSwQe/iTnrfWD8iAPIDqdcb5bOBN
         NNhbg5+e2kA3N0tweklla87abiIT0eN6MqXjpTjnuDCOWci2KJ7KixUflMYpi6QpKiDJ
         VLfxF2gxywRviANwbTXv7kgitFxvNB/fHrD3t4SFadVV5O6Tyqc/O/pe1o/Xmn1cPaxS
         IxKZw8YrW8Ieopx7sEGyB+fMgaWAMoyHmd+aKxAQmq3F1S1BvGU0ww9wHzh8rGc+L7ic
         qdoKVbwUCpY/V1lKE0syMd4jYjmHbsVmBGNK5LXjBUlpookciorVWAT3+cX0R0xHcUnb
         y5mQ==
X-Gm-Message-State: AOJu0YzfgnrgaBgmE+NnUPo6s8peo8WQTZWEOP2Z+afDeiyONosfbMh9
	j0Pk4p0e9uRBxYT1z2pfvZ9AHIbfSWt9esVeptTzmMGe3299+XDhpxQSBLBdCi/xiWclE/+iheC
	TGl8=
X-Gm-Gg: ASbGnctnOB9DVH7eAacxsgtG4v3/HwRCdQS9m4MjTUsX08dvR2zCtoBdS8jJdiu7t8p
	0losPyR34cutL4qaQMyTZpSQlTE6pQr6163F6c+NJwHNeYQ33Syhj+lowx02N3AlFhjGoKUPPBG
	1BgyAdRth9lTTsnU4ApfYHVb6G5RgznSi+Af0fYeuRTn6ybDl4BtOU0jIbI+tkkDnC+c2uUvW8m
	vNnXoi14Pax2WLXY726hK8HKp+oeVzQfDdjaypvQhpcz6vRIlsEux/NkQrhiVxRzC85n6oLgMpd
	pCe0nM2eUFyDonihj9qGGJNDMK2G+dD7cfvCkyddfD+4EwjomlA6fytTDQa/m4mkQGhp/8sXVA=
	=
X-Google-Smtp-Source: AGHT+IHiayhXSQA8zVNGar4BSbE7gAcXvvfhn4UKsL+lETbwg83Aw5+u9q02EbbRdlmPITvGGe+Qbg==
X-Received: by 2002:a2e:be93:0:b0:30b:f599:d78f with SMTP id 38308e7fff4ca-3166e52bf01mr8769591fa.7.1745405715118;
        Wed, 23 Apr 2025 03:55:15 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907827b2sm18524901fa.28.2025.04.23.03.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:55:14 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:55:13 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>
Subject: Re: [PATCH RFC walnascar 1/3] systemd: enable getty generator by
 default
Message-ID: <aAjHEf2F9LVY0zBf@nuoska>
References: <20250422190053.3244331-1-ross.burton@arm.com>
 <aAi-kEIeR6mMYBBF@nuoska>
 <2D1A1380-E911-4885-9889-AB6506606A5D@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2D1A1380-E911-4885-9889-AB6506606A5D@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215279

Hi,

On Wed, Apr 23, 2025 at 10:40:27AM +0000, Ross Burton wrote:
> On 23 Apr 2025, at 11:18, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >> Restore the existing behaviour by explicitly enabling the serial getty
> >> generator: this means that systemd will automatically bring up a getty
> >> on the first serial console it finds.
> > 
> > Is there a need to be backwards compatible this much? Many things may break
> > or get refactored on master branch between releases and this is just one of them.
> 
> Yes, because this is the behaviour that both fixes the KV260 issue and also doesn’t break all of the selftests due to how testimage+qemu interact.
> 
> > Then with these patches there still is the bug/issue seen in previous state too
> > where systemd tries to start agetty on all SERIAL_CONSOLES defined
> > at build time which slows down boot to "running" or "degraded" state
> > by more than one minute. This happens also on qemu where core-image-base
> > (I've added systemd-analyze with dependencies there to measure these):
> 
> Yes.  As I said, the proper solution here is to actually probe the setup.  Once we’ve got walnascar out of the way I’ll finish my branch that does the same system inspection for sysvinit so we don’t need to hardcode SERIAL_CONSOLES, instead it will bring up a console on the first tty it can find.  That is likely to cause problems with testimage (as it hooks up a second tty for failures) but will be isolated to genericarm64 and not every qemu machine.

Is there some bugzilla ticket or other location for details about the qemu and
testimage issue with serial consoles?

I've been running some selftests on genericarm64 with my proposed patches applied
and have not run into any serial console related problems. I've only seen a lot of
pseudo aborts on aarch64 build machine, e.g. wic touching images created by bitbake.

> > Thus I think this breaking change is fine for master branch and upcoming
> > release and that anyone expecting different, more robust behavior should just use
> > the systemd agetty generator.
> > 
> Absolutely.
> 
> > For genericarm64 I think https://lists.yoctoproject.org/g/poky/message/13592
> > is the way to go to fix both completely missing agetty
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=15830
> > and the slow boot time. Both this series and
> > https://lists.yoctoproject.org/g/poky/message/13592 applied does not
> > seem to work since SERIAL_CONSOLES is now used all the time, so delayed
> > boot issue remains unfixed.
> 
> Making systemd machine-specific would be disastrous for rebuilds as it is the provider of libudev and libsystemd, so would mean that _every_ recipe that uses those is also now machine-specific.
> 
> As was discussed in the Tuesday tech call last week, I suspect a better solution would be to have a machine-specific configuration recipe that can drop in configuration files, mask or enable units, etc.  This way specific machines can configure systemd in specific ways, without actually touching the core recipe.
> 
> Alternatively, splitting systemd into ‘userspace’ and ’system’ recipes where the former is tune-specific and contains the userspace-facing libraries and the latter is machine specific and everything else could make sense.

Ok so machine/BSP config should not change systemd setup then, got it.

Since "poky-altcfg" distro uses systemd by default, could it not also use
systemd to manage agetty startup and ignore SERIAL_CONSOLES from build time?

This sounds like the "efi" support issue I have with systemd. Patches out,
decision pending...

Cheers,

-Mikko

