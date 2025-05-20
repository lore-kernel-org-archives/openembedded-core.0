Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F28C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 10:59:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.18311.1747738784933698708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 03:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VWpv/jOe;
 spf=pass (domain: linaro.org, ip: 209.85.221.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a064a3e143so2982779f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747738783; x=1748343583; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RqbSye1lDryuSAqaiiCCKOodvQ0tlhApCvrDQB3XIQs=;
        b=VWpv/jOeVxzNlSOGNzqR91eLoMVzLpUDSQ/6OGOyNEg7k+fTyc5QfCgbht129WXMvN
         KoNdk4UiezH68mhHe5W3chnU9rscX/kbJs9TXXCwUcPsBcKRcNQS3w2JMShHm1gSJpxc
         48Np61iej/RGNk/JxMzyypJG7D04igbsO8+jQavFTAmb55k5yMospCw9jWO7AgWqP/hq
         q1Tx2GQyIcU+co3Lq3HJwsJ7zNMl93hi/GdpjeXZGFYgLOfqTbp4wzenUjZ24HbBl3da
         HhIej6Zd9ll41kz1jt5iwQuGCpcc6AMpkDFJUFSWnVQLBh2vk+l2SO9PJt8Fj2aDq3D+
         0RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747738783; x=1748343583;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RqbSye1lDryuSAqaiiCCKOodvQ0tlhApCvrDQB3XIQs=;
        b=ukq8+e57LLeEk8ZlsYPL780II5Q2VW8SQ0XKiVv5J//hetS/LZrL/FLMkbJ2cKxh1I
         CcY3wYIgH8yeEJZPhPL8WNcuDQ0/jDxzRT+s9HKxsaUA5x1Bb7MeXSBtS+fhKdSyXlO0
         M5fmxQnUZvx2DHSdaw44++C0wJCAgmdm3GGoSndE9VolQb8VzmWp0Yn8FEBYSTeWbzHs
         RmkRaWgMVOdbRC+JkObuIm27HpBbdrvWbljc34l5dmsJBVQZbGe9iHhG0mN5HO/nJ1V6
         2Xt0Vbtee1rgTzHDpRZ7SOUrpkihZDkzTGlL9lyn/hBmp79imhPqcg72hxQgG9fs6q2F
         /VkQ==
X-Gm-Message-State: AOJu0YzNlxAdDtsHykYpTnnM5mqo4YvXOECNw/q009nPwS9bZ6VoY0xm
	1fqcirJHT651zT3bDDmG+b38HVdK3xaFjGatKT2YEbBzHr8i4k+3dIzXD8mT8oXy+hg=
X-Gm-Gg: ASbGnctEX0QcfRuFVdDnFJT05vKhRu4yhUBzUXu8C5H+UcLAinhkXaVHZiWOi0ZMDQY
	oVAhOwKbloOvMKPqz1K/A5cj9tnTq1u0S9jHbgahRgONOVvcowO5P+C2p1RHdajDbLYs7s5sYn+
	IxyKlzFHtf1azk6q00TU8rcnRwQUXnpbbAQdISZ66GLwP5QVgIVvXX0iKfr1MDpUS7XznJSs0j+
	EQuhUVZrUnrazhCdqU7u9SdZkydYqISOw1GCOXeXYLXt0F131lwxQJIIT1/7916NHeTg8xffO6N
	r4hu2z0Lo2Hquz1U+pJW4oHX2LH8INW3S+ie/XPifjxssmQ+NFkkvKv6T8o=
X-Google-Smtp-Source: AGHT+IGMRWsrqC4tJdKOFwx1bLCUFLrwxN1TTXGHKNFBBWBkLKzB5R23DBM2Cvd0TfBjNQ0CSQlr8w==
X-Received: by 2002:a05:6000:1ac9:b0:3a3:77d7:5a48 with SMTP id ffacd0b85a97d-3a377d75a8amr2775446f8f.3.1747738783184;
        Tue, 20 May 2025 03:59:43 -0700 (PDT)
Received: from nuoska ([62.48.241.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6265fsm15752349f8f.43.2025.05.20.03.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:59:42 -0700 (PDT)
Date: Tue, 20 May 2025 11:59:41 +0100
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] oeqa selftest: read qemu options from
 TEST_RUNQEMUPARAMS
Message-ID: <aCxgnSnv92n8b30e@nuoska>
References: <20250423083634.137495-1-mikko.rapeli@linaro.org>
 <56ae50dcab799e2db27c7e423c5533546fd6ab2b.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56ae50dcab799e2db27c7e423c5533546fd6ab2b.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216901

Hi,

On Tue, May 20, 2025 at 10:30:04AM +0100, Richard Purdie wrote:
> On Wed, 2025-04-23 at 11:36 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > To support "slirp" userspace networking which works more easily
> > on various build machines, also without root and sudo rights
> > to setup loop interfaces.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/lib/oeqa/selftest/cases/barebox.py������ |� 5 +++--
> > �meta/lib/oeqa/selftest/cases/debuginfod.py��� |� 4 +++-
> > �meta/lib/oeqa/selftest/cases/devtool.py������ |� 6 ++++--
> > �.../oeqa/selftest/cases/efibootpartition.py�� |� 3 ++-
> > �meta/lib/oeqa/selftest/cases/gcc.py���������� |� 3 ++-
> > �meta/lib/oeqa/selftest/cases/gdbserver.py���� |� 3 ++-
> > �meta/lib/oeqa/selftest/cases/glibc.py�������� |� 3 ++-
> > �meta/lib/oeqa/selftest/cases/imagefeatures.py |� 3 ++-
> > �meta/lib/oeqa/selftest/cases/locales.py������ |� 5 +++--
> > �meta/lib/oeqa/selftest/cases/overlayfs.py���� | 19 ++++++++++++-------
> > �meta/lib/oeqa/selftest/cases/package.py������ |� 6 ++++--
> > �meta/lib/oeqa/selftest/cases/runtime_test.py� |� 6 ++++--
> > �meta/lib/oeqa/selftest/cases/rust.py��������� |� 3 ++-
> > �meta/lib/oeqa/selftest/cases/uboot.py�������� |� 5 +++--
> > �14 files changed, 48 insertions(+), 26 deletions(-)
> > 
> > v2: added missing get_bb_var import to u-boot.py
> > 
> > v1: https://lists.openembedded.org/g/openembedded-core/message/215225
> > 
> > diff --git a/meta/lib/oeqa/selftest/cases/barebox.py b/meta/lib/oeqa/selftest/cases/barebox.py
> > index 3f8f232432..b4d8310666 100644
> > --- a/meta/lib/oeqa/selftest/cases/barebox.py
> > +++ b/meta/lib/oeqa/selftest/cases/barebox.py
> > @@ -6,7 +6,7 @@
> > �#
> > �
> > �from oeqa.selftest.case import OESelftestTestCase
> > -from oeqa.utils.commands import bitbake, runqemu
> > +from oeqa.utils.commands import bitbake, runqemu, get_bb_var
> > �from oeqa.core.decorator.data import skipIfNotArch
> > �from oeqa.core.decorator import OETestTag
> > �
> > @@ -34,7 +34,8 @@ QEMU_USE_KVM = "False"
> > �
> > �������� bitbake("virtual/bootloader core-image-minimal")
> > �
> > -������� with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic',
> > +������� runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
> > +������� with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic %s' % (runqemu_params),
> > ��������������������� boot_patterns=barebox_boot_patterns) as qemu:
> > �
> > ������������ # test if barebox console works
> 
> This has sat in master-next for a long time, mostly because I've been
> putting off trying to write down my thoughts on this.
> 
> The challenge with this change is that it makes slirp work in some
> cases but not others. We've been very clear up to now that tap/tun is
> our preferred way to run the tests. If this merges, people will start
> to expect slirp to become a first class citizen and file bugs against
> the tests which don't use it, or submit patches with only the slirp
> tests passing and them complain that we shouldn't have the other tests.
> 
> I'm very wary of having "two ways" of doing things, particularly as one
> half always ends up with subtle breakage. I'm also wary of adding
> feature support by stealth, which this has potential to become.
> 
> That said, I can totally understand why running the tests which can use
> slirp can be useful, particularly as there are some environments where
> tun/tap isn't possible. This means I am torn on the patch despite my
> reservations.
> 
> There also isn't any testing data included. Did you run all the tests
> you are patching and are confirming they work with slirp or was this
> just a way to pass the option (and potentially other options) to all
> tests? Do we know how many tests work with slirp and how many don't?

I would like to run selftests on genericarm64 target machine and aarch64 build
host. They don't pass yet. This patch is one of the things I would need,
currently, to work on the other problems. A full series is a lot of work
and I don't think I'm up to it atm, but maybe over time...

> From a practicality standpoint, I do have an issue with the
> implementation since it duplicates the image name for the get_bb_var
> and the runqemu call and I'm not sure I like that implementation
> detail. That is a solvable problem but the decision above on whether we
> want to do this at all remains.

I can fix this if needed. Some tests used variable for image name
while many did not.

> I am also worried that users will set things in this variable which are
> incompatible with tests and it can potentially make it harder to debug
> user reported issues as we will have another setting we need them to
> confirm whether they're setting or not.
> 
> There were ideas about decorators for tests in the patch review call
> and there is potential in that idea but again, it adds two ways to do
> things and is effectively making it a first class feature which I'm a
> little wary of.
> 
> We do want users to be able to run the tests and help with with issues
> too though, so we come back to be being torn on it.
> 
> So, I've written my thoughts down. I'm not sure that helps us much on
> deciding whether to merge it or not.

I'm relatively new to selftests and the environments and configs
they run.

slirp and support for it like in this patch is one thing, but there
are others.

Which build machine hosts and distributions are supported?
I've heard that x86_64 and aarch64 hosts are used with the supported
set of distros.

Then the config inside of distros is where tun/tap and slirp are the alternatives.
Yocto CI runs with tun/tap, but this may be harder to setup for us developers
contributing changes to classes and need to adapt the tests. Thus slirp support
is nice to have. There was something more regards to graphics support and
qemu, maybe even a HW dependency, at least on x86_64.

Then build target machines. I presume only machines from oe-core are
supported and meta-yocto-bsp machines like genericarm64 not. What about
fixing issues when oe-selftests are run with genericarm64 machine config?
Usually there are just a few simple things to fix, like dependencies and
configs to select. Often these can be the same as on qemuarm64 since
qemu is the target to boot images in tests.

Target distro then are AFAIK poky and poky-altcfg so custom distros
will likely break a number of things which can not be fixed upstream.

So when a user builds upstream supported machines and distro,
they can expect the tests to pass. This allows contributing changes
and fixing the tests on their machines before submitting things
to review and yocto project CI runs where things may break.
Though testing all configurations has proven very hard. slirp support
makes testing a bit simpler, for me at least, but I understand your
pain in upstream.

For my changes into UKI support, the slirp support was already fixed
in wic and uki selftests. Thus I'd like to support in other tests. But
if it's too much work for you to maintain, I get it and can apply fixes
locally in my tree to test.

Cheers,

-Mikko

