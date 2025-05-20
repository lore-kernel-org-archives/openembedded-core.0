Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB589C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 11:10:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.18479.1747739447092139375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 04:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZLzCrKHG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so58948445e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747739445; x=1748344245; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5vG4HSfF0ynTAaDbQRliDJ0lpjntDxTF2m6H+VuN0U=;
        b=ZLzCrKHGqmDO7yAm+UMRfO3ZH+FxtTys+JxoIWbRnSRxz5x77XBjPywV808cG6oTVD
         3EWP9BWrJ7Xs5eYbYF853D2rD2g6HC5uGCx7ImQEmbepzHXWDEjOgmDRx+47/zzDS0Os
         g4YKM4zLIgwuuvb+6fKqleTZwppQ6oIGPwofY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747739445; x=1748344245;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5vG4HSfF0ynTAaDbQRliDJ0lpjntDxTF2m6H+VuN0U=;
        b=XJhLyMB2KG66sJuYW5hcX7QY67uggtQlPy9nIyLx1qzFiXJeBP6mpuobmVUKd6Er5Y
         rC3F5UJpuIpMR7/i1lm5d/nmJrFnFKzBIw6Rc+3x9o8gw/errJ5B0EtsmYpqUQJkIiyO
         MP+uowIQHVDmvivjuKNtPntmBZakPBB8Sb6sx0nMEPHhgSyZv6uNYVPU/0q4kdfKBbZe
         pg+5UONv8PFAEv8jhBsLD9Z30znX/sa3+3llQ8H4RjOA1JLToBYm8zeJFtkKhc9ZtROP
         NyZL/4Vj8QDR4/mBg6kRV9ZkF/rBghQQmw/miQ6B7popHzgLHD8W7BxVk9tBpvLC/w1e
         TXFA==
X-Gm-Message-State: AOJu0YxL1CtOfDRjiUKMASDdblQBCTm4P7y2eSyFJntDGXQ7vNSX46Kl
	7WG3S1zAaXM5W8b2IgBgZX53GEm/DSok1GL5e89gDhURrF9hbgPOvJejATUF94sanIw=
X-Gm-Gg: ASbGncsi5hk7XD5CPDaqYrapN4ECum/9X6h/pO8tsBJfQeXl+wKnsG1EpAIhXjDBtHc
	yz3OLSzAzadFxT7d38TJ/cyGw7EPAgpeHcQ7wDpo5h5kENqfLC8DFX5SKDtatbDXwYVlZJi7j5Y
	y5eDYb266SQtjI8zXbC+bcd5k1coyuZtH1QqzQMfZ5Gad2MUWJ0flJco1EwuLx9HG80M1hPkh/A
	sQY8cJTJQPJ9c/ENQs3MbAIAqt6A5zHpyRd+iR1HncNaEb2krqXLOcCx3weoJFbusuvIrsEe8PR
	fXR/o0VkavxPQ72jGquEaeMEkvIREPTETQjF68kShq+LhqXmG/aTTR0DXVBhSh+NFulJHAYDZqD
	5+QkOj7I0mWcNrzNQbJR3af2n8jUd9HJVYCOFUg==
X-Google-Smtp-Source: AGHT+IFjLwj1T4kc4XB9sWyxYkniJspf6yZKSWVkf08t7UwKDtDq5lFcyryABUqftJLe0N52sUNayQ==
X-Received: by 2002:a05:600c:64ca:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-442fd664a1emr120411565e9.25.1747739445374;
        Tue, 20 May 2025 04:10:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:685:a6df:9777:90ca? ([2001:8b0:aba:5f3c:685:a6df:9777:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6210asm15899159f8f.41.2025.05.20.04.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 04:10:44 -0700 (PDT)
Message-ID: <2421d5a01486a5b15d056d480cb12026aa5024ac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] oeqa selftest: read qemu options from
 TEST_RUNQEMUPARAMS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 20 May 2025 12:10:43 +0100
In-Reply-To: <aCxgnSnv92n8b30e@nuoska>
References: <20250423083634.137495-1-mikko.rapeli@linaro.org>
	 <56ae50dcab799e2db27c7e423c5533546fd6ab2b.camel@linuxfoundation.org>
	 <aCxgnSnv92n8b30e@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 11:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216903

On Tue, 2025-05-20 at 11:59 +0100, Mikko Rapeli wrote:
> On Tue, May 20, 2025 at 10:30:04AM +0100, Richard Purdie wrote:
> >=20
> > This has sat in master-next for a long time, mostly because I've been
> > putting off trying to write down my thoughts on this.
> >=20
> > The challenge with this change is that it makes slirp work in some
> > cases but not others. We've been very clear up to now that tap/tun is
> > our preferred way to run the tests. If this merges, people will start
> > to expect slirp to become a first class citizen and file bugs against
> > the tests which don't use it, or submit patches with only the slirp
> > tests passing and them complain that we shouldn't have the other tests.
> >=20
> > I'm very wary of having "two ways" of doing things, particularly as one
> > half always ends up with subtle breakage. I'm also wary of adding
> > feature support by stealth, which this has potential to become.
> >=20
> > That said, I can totally understand why running the tests which can use
> > slirp can be useful, particularly as there are some environments where
> > tun/tap isn't possible. This means I am torn on the patch despite my
> > reservations.
> >=20
> > There also isn't any testing data included. Did you run all the tests
> > you are patching and are confirming they work with slirp or was this
> > just a way to pass the option (and potentially other options) to all
> > tests? Do we know how many tests work with slirp and how many don't?
>=20
> I would like to run selftests on genericarm64 target machine and aarch64 =
build
> host. They don't pass yet. This patch is one of the things I would need,
> currently, to work on the other problems. A full series is a lot of work
> and I don't think I'm up to it atm, but maybe over time...

The autobuilder does run oe-selftest on aarch64 build hosts but it uses
qemuarm64 for MACHINE. I'd hope there isn't that much difference
between qemuarm64 and genericarm64 but that should be the only
difference in your config besides slirp vs tun/tap.

> > From a practicality standpoint, I do have an issue with the
> > implementation since it duplicates the image name for the get_bb_var
> > and the runqemu call and I'm not sure I like that implementation
> > detail. That is a solvable problem but the decision above on whether we
> > want to do this at all remains.
>=20
> I can fix this if needed. Some tests used variable for image name
> while many did not.

It may be better to add something into the runqemu function itself to
query the variable but I didn't look into the code implications of
that.

>=20
> I'm relatively new to selftests and the environments and configs
> they run.
>=20
> slirp and support for it like in this patch is one thing, but there
> are others.
>=20
> Which build machine hosts and distributions are supported?
> I've heard that x86_64 and aarch64 hosts are used with the supported
> set of distros.

https://autobuilder.yoctoproject.org/valkyrie/#/workers gives an idea
of which host distros and architectures we have in the autobuilder.
"arm" in the name means it is an aarch64 system so those are all
ubuntus of three different versions.

> Then the config inside of distros is where tun/tap and slirp are the alte=
rnatives.
> Yocto CI runs with tun/tap, but this may be harder to setup for us develo=
pers
> contributing changes to classes and need to adapt the tests. Thus slirp s=
upport
> is nice to have. There was something more regards to graphics support and
> qemu, maybe even a HW dependency, at least on x86_64.

x86_64 tries to do GL passthrough on some distros. I don't think we
have that enabled for arm. The tests should get skipped if not
supported and include detection code.

> Then build target machines. I presume only machines from oe-core are
> supported and meta-yocto-bsp machines like genericarm64 not. What about
> fixing issues when oe-selftests are run with genericarm64 machine config?

Correct, we only test using MACHINEs from those layers and only under
qemu. There is no reason genericarm64 shouldn't work, it just hasn't
been tested/fixed/enabled.

> Usually there are just a few simple things to fix, like dependencies and
> configs to select. Often these can be the same as on qemuarm64 since
> qemu is the target to boot images in tests.

> Target distro then are AFAIK poky and poky-altcfg so custom distros
> will likely break a number of things which can not be fixed upstream.

The tests can check the config and skip if some config is not
supported.

Cheers,

Richard

