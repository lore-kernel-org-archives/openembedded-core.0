Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DA9C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 09:30:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.16647.1747733407694330642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 02:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MlCG9ROD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442ea341570so36259005e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 02:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747733406; x=1748338206; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVTDIqM79/JwF33lxm1JJQ5Ib9yukuA9Fm7ES4izURE=;
        b=MlCG9RODid8E/yuyExlv4L+i/pqXrjQEDnofJkxGRsYEbKrm1VimnTWqlzfjWmXarz
         DBv+sSQHKcz8N2z84VRsMeFH7icMF7D5ACPc2NIDYoQhyVbBRKScIH6Yq1y9T6JXJRUQ
         n7WRNgI+UlwidJF+Y2LBXosGQOOH3Eol9Drto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747733406; x=1748338206;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OVTDIqM79/JwF33lxm1JJQ5Ib9yukuA9Fm7ES4izURE=;
        b=pv7RcXiZjutsar9ErEkY4Cb8wp1ZPntJJ7y+djakaK/Kas8BeR5TfHcqukrJNi7FLr
         LKKCdFfkyUxuKkUaX9AwLqqIgW64q40R+wDp465uag55Jyc+FvbukyoU75TqWUKR7AaT
         gNJMgF1R0XAsHJVAw1BJkph2Z/j8L6FDS/LSKR2gp8VQqgU8kUBHiXA1E7Fv6ds08liK
         dB0GGVNBYbQPCDXE9FRwRg4M2KIBNnn/GunsXze6s6jaL9nPVzojwZ5wkAx0fzfpDvYT
         Oa5onO/t/9jBqzmKJtoL6G+mFF20D2wu535hjYISFYE3sM+S7iFq76rByS/2l6GLWDo9
         cw3w==
X-Forwarded-Encrypted: i=1; AJvYcCUQUCFr/p/E1HOfuoEC03Ahc0RjXmR/yvLWJPdOouIUN0x21vRhO4CFGIVcb01hI1r7s2FkBm9EOS6Or9pQYaWK2w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywd2Ncs6pyGjLr5Gns3g2+iTLAMtmK6Xq4rSW0Jtcq5T5y01SU2
	r6xD10jPHUcP492ztgTo5AfuEMgqG9mGuKwoYnJeZFN7EUfoHJgMnPQWWXCKlHzrBvA=
X-Gm-Gg: ASbGncuJtANn/Qk5rtIKi5Rx3U5fXVGw78eKTHv2KrhLpcKgDrESQgDrzvfrN9acMZG
	ZkolLUKLc3UeMFCvJIZtLdftsPNSXT0E10RrN6lGEzobjnb8s/FkwgKFGSCf121rxE6fK1JuiUm
	5WxunqpXioe5yXMcq2c5PECdHl8mKDH7xYq2clAUBIaioEGeKO8kh2g4ZeLFIk0ca1uJquLxJEk
	IAapU1Wm9Yjm4AQwYBzdM2HEgN1UIAaqjSM5zjbjUnQ/l/LHO2cIcbMr+FnF51vAaJrwdGn9EKW
	3Fo2UD4Ua8jzrQwqy0EHo+gYpheavn1rFvFj5qLNRQslGf95MPoEfr7zqtKNyMjihwztPQ/uVYH
	FUUaDO+0dBRoaVAwi4OCjZHncPtA+Osz6DYc2FA==
X-Google-Smtp-Source: AGHT+IG9nhXQ/MBELaWwmm48K1uyPB0/bpTAFfxekFb80Uh1v6FB2ZiYrGl7qorneQWfbwbClzV3Mw==
X-Received: by 2002:a05:6000:2211:b0:3a3:6f26:5813 with SMTP id ffacd0b85a97d-3a36f2658fbmr6209330f8f.25.1747733405946;
        Tue, 20 May 2025 02:30:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:685:a6df:9777:90ca? ([2001:8b0:aba:5f3c:685:a6df:9777:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d224sm16190494f8f.12.2025.05.20.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 02:30:05 -0700 (PDT)
Message-ID: <56ae50dcab799e2db27c7e423c5533546fd6ab2b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] oeqa selftest: read qemu options from
 TEST_RUNQEMUPARAMS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Tue, 20 May 2025 10:30:04 +0100
In-Reply-To: <20250423083634.137495-1-mikko.rapeli@linaro.org>
References: <20250423083634.137495-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 09:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216895

On Wed, 2025-04-23 at 11:36 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> To support "slirp" userspace networking which works more easily
> on various build machines, also without root and sudo rights
> to setup loop interfaces.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/barebox.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +++--
> =C2=A0meta/lib/oeqa/selftest/cases/debuginfod.py=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 +++-
> =C2=A0meta/lib/oeqa/selftest/cases/devtool.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 ++++--
> =C2=A0.../oeqa/selftest/cases/efibootpartition.py=C2=A0=C2=A0 |=C2=A0 3 +=
+-
> =C2=A0meta/lib/oeqa/selftest/cases/gcc.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0meta/lib/oeqa/selftest/cases/gdbserver.py=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 ++-
> =C2=A0meta/lib/oeqa/selftest/cases/glibc.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0meta/lib/oeqa/selftest/cases/imagefeatures.py |=C2=A0 3 ++-
> =C2=A0meta/lib/oeqa/selftest/cases/locales.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +++--
> =C2=A0meta/lib/oeqa/selftest/cases/overlayfs.py=C2=A0=C2=A0=C2=A0=C2=A0 |=
 19 ++++++++++++-------
> =C2=A0meta/lib/oeqa/selftest/cases/package.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 ++++--
> =C2=A0meta/lib/oeqa/selftest/cases/runtime_test.py=C2=A0 |=C2=A0 6 ++++--
> =C2=A0meta/lib/oeqa/selftest/cases/rust.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0meta/lib/oeqa/selftest/cases/uboot.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++--
> =C2=A014 files changed, 48 insertions(+), 26 deletions(-)
>=20
> v2: added missing get_bb_var import to u-boot.py
>=20
> v1: https://lists.openembedded.org/g/openembedded-core/message/215225
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/barebox.py b/meta/lib/oeqa/self=
test/cases/barebox.py
> index 3f8f232432..b4d8310666 100644
> --- a/meta/lib/oeqa/selftest/cases/barebox.py
> +++ b/meta/lib/oeqa/selftest/cases/barebox.py
> @@ -6,7 +6,7 @@
> =C2=A0#
> =C2=A0
> =C2=A0from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu
> +from oeqa.utils.commands import bitbake, runqemu, get_bb_var
> =C2=A0from oeqa.core.decorator.data import skipIfNotArch
> =C2=A0from oeqa.core.decorator import OETestTag
> =C2=A0
> @@ -34,7 +34,8 @@ QEMU_USE_KVM =3D "False"
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake("virtual/bootloa=
der core-image-minimal")
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with runqemu('core-image-mini=
mal', ssh=3DFalse, runqemuparams=3D'nographic',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runqemu_params =3D get_bb_var=
('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with runqemu('core-image-mini=
mal', ssh=3DFalse, runqemuparams=3D'nographic %s' % (runqemu_params),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boot_patterns=3Dbare=
box_boot_patterns) as qemu:
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# test if barebox console works

This has sat in master-next for a long time, mostly because I've been
putting off trying to write down my thoughts on this.

The challenge with this change is that it makes slirp work in some
cases but not others. We've been very clear up to now that tap/tun is
our preferred way to run the tests. If this merges, people will start
to expect slirp to become a first class citizen and file bugs against
the tests which don't use it, or submit patches with only the slirp
tests passing and them complain that we shouldn't have the other tests.

I'm very wary of having "two ways" of doing things, particularly as one
half always ends up with subtle breakage. I'm also wary of adding
feature support by stealth, which this has potential to become.

That said, I can totally understand why running the tests which can use
slirp can be useful, particularly as there are some environments where
tun/tap isn't possible. This means I am torn on the patch despite my
reservations.

There also isn't any testing data included. Did you run all the tests
you are patching and are confirming they work with slirp or was this
just a way to pass the option (and potentially other options) to all
tests? Do we know how many tests work with slirp and how many don't?

From a practicality standpoint, I do have an issue with the
implementation since it duplicates the image name for the get_bb_var
and the runqemu call and I'm not sure I like that implementation
detail. That is a solvable problem but the decision above on whether we
want to do this at all remains.

I am also worried that users will set things in this variable which are
incompatible with tests and it can potentially make it harder to debug
user reported issues as we will have another setting we need them to
confirm whether they're setting or not.

There were ideas about decorators for tests in the patch review call
and there is potential in that idea but again, it adds two ways to do
things and is effectively making it a first class feature which I'm a
little wary of.

We do want users to be able to run the tests and help with with issues
too though, so we come back to be being torn on it.

So, I've written my thoughts down. I'm not sure that helps us much on
deciding whether to merge it or not.

Cheers,

Richard




