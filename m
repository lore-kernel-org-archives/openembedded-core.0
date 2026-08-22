Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20089C5B572
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 14:52:55 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7865.1787410373791227067
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 07:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZZjI41jz;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-936dfd009d1so226477485a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787410373; x=1788015173; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dxUgz7d62f/DZi9lob6MHHPvXj6j8LGGAA0Kkibl6BE=;
        b=ZZjI41jz+4LR5DiH7wwdfLh0rFJy9crXXzMwx3BaVq0KN2x6480pBm6Au666dvVUYw
         XMyXLhpcS87pPCMy8byADTYShveABq0Awx560mdg2GnwO8JQGsoUdF1oVK2da8SFm8QS
         dk+t424FrcGGIMN4C5f7lVN1h2RXOyn+bqBumVGW23/HO4EbWArlOL7F7iZU2tvs2dhS
         PQwaLvuCjQrqUdSNDALAjBo1T51lk8+Cju6W42Hl3RNg4dbxaFtCWUULDdl9CSgJzZgT
         7nWzznhzhEVBjI/Lr1OMMWgYb8Ds5Y3Vpaj5TEQxgzUeSHosSycEmal13yctgeETQO5h
         ftKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787410373; x=1788015173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxUgz7d62f/DZi9lob6MHHPvXj6j8LGGAA0Kkibl6BE=;
        b=XfcKgo/K0YLIBiotVlJCxDcxZcbZY+mA1Jn6WkjHzoqNrA2nFdLMYxeoEvCCtAdpD2
         OTETg4Km8U3iZO0/+N1uI2M+kWqVowTDkkcdVWiLZrIqLYdyOrfo9Okci1ZCuOdhmdG9
         uquFM14MHMqGdAdy0W3SnlcYksaiS/8yrZaXkJL0PRr4nDZXYjGQuYsb+8E7mZuAUaQ7
         93Trh3v2QYbJxpfG9lL1VCWwkcx/3sr9C2xAQrCjmo6AJ8jx639ouQmpKfCcd7qa0OOa
         XnklSfeyCOXhJ7N/TX9sl/0jovlXcbMF+BZ3AW5PO61aH/TeyjxLU9GJNiTJRO/RIVkQ
         RJVQ==
X-Gm-Message-State: AFuF++lgLLF6I+tSPUxNg28NtsujRxYq2e/TlXeGYUfhqIaj5u2A+uzh
	u63Gp9croHeqNkJeBJ9OkMZUx+RVWNq3JcN/98tRdVU5jROFE1clAreC
X-Gm-Gg: AR+sD13OjUlwLOiVWuv7E6FB41POR474rImSFVPGXTaPT4FNefN2kmjqxxrmmmeOJ0W
	6sp+ELEHIWqbYXDjGLVvvP86PhajIiNaUAJBvqVgW9NWZYntpq8Kkl1xlG5IFR62o/8JgsN7Tay
	mTPJZcA5QHdo4VUP0VDoyM87vzcHwoBPuzE4swICuWpXR0695cnxrh8rfESyiUq5q1aKmT2AFIB
	6wVh4zPYoYvQnRI0q08nNYgi0v3pjwhhtVTWNxlt9lxzsL51VWjaI1zx+2v8f2M3NDS3CkehGrP
	oFcxYWk7jfEMqFih1IyTH62pabA2DJvd0O4VJ0hOllEly2FNVO4O2ZKZ05iXHB6NOC1TPfnXlno
	ahtWZlUnr9uL/dhUUrFEqRvOt6aoYWGkHeC3mxhs5wJ72bSA5DO+nAsll8bKXdbhb66urpzk4qg
	Oi607hUR8XDFbibE3YoK9olI6EYKqclJh9+u4alYgOFIXTbbzBW/MBMU/c4wbgLk/7sUtwMv9u9
	YIMKgygLVFsmIGuqis7Z6MQy/d9/SB00RgoMv7FhA==
X-Received: by 2002:a05:620a:7116:b0:936:d00a:4947 with SMTP id af79cd13be357-93739702343mr952315085a.2.1787410372588;
        Sat, 22 Aug 2026 07:52:52 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749e9f94bsm132948885a.37.2026.08.22.07.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 07:52:51 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:52:49 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] oeqa/sdk: update cryptodev to a revision that
 builds on kernel 6.18
Message-ID: <aom3waDKgP4b5_g1@localhost.localdomain>
References: <20260813030515.1028627-1-twoerner@gmail.com>
 <20260813030515.1028627-2-twoerner@gmail.com>
 <7fc0bf78c8046ad9c23e49f80d8ed93103db3317.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7fc0bf78c8046ad9c23e49f80d8ed93103db3317.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 14:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243987

On Sun 2026-08-16 @ 12:12:49 PM, Paul Barker wrote:
> On Wed, 2026-08-12 at 23:05 -0400, Trevor Woerner wrote:
> > The out-of-tree kernel module test pins a cryptodev-linux revision from
> > before the 1.14 release, which predates the removal of
> > crypto_ahash_alignmask() from the kernel and so no longer compiles:
> > 
> >   cryptlib.c:384:28: error: implicit declaration of function
> >   'crypto_ahash_alignmask' [-Wimplicit-function-declaration]
> > 
> > Move to upstream's "Fix build for Linux 6.18-rc1", which is the revision
> > that restores compatibility.
> > 
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v2:
> > - none
> > ---
> >  meta/lib/oeqa/sdk/cases/kmod.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/kmod.py
> > index 0c4d8ddb543f..1be23e994fd2 100644
> > --- a/meta/lib/oeqa/sdk/cases/kmod.py
> > +++ b/meta/lib/oeqa/sdk/cases/kmod.py
> > @@ -31,8 +31,8 @@ class KernelModuleTest(OESDKTestCase):
> >  
> >          with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
> >              git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
> > -            # This is a knnown-good commit post-1.13 that builds with kernel 6.7+
> > -            git_sha = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
> > +            # This is a known-good commit post-1.14 that builds with kernel 6.18+
> > +            git_sha = "08644db02d43478f802755903212f5ee506af73b"
> >  
> >              sourcedir = os.path.join(testdir, "cryptodev-linux")
> >              subprocess.check_output(["git", "clone", git_url, sourcedir], stderr=subprocess.STDOUT)
> 
> Hi Trevor,
> 
> I'm wondering why we haven't spotted this issue previously, we've been
> using Linux 6.18 for months now. Are we missing a test case?

No, the test case is there. It has been skipping, and a skip and a pass
look the same from the summary line.

kmod.KernelModuleTest guards on

    self.ensure_target_package("kernel-devsrc")

and a standard SDK does not contain kernel-devsrc, so that test has 
never run on the SDK the autobuilder actually builds. It only ran here
because I was building an SDK that carries the kernel source, which is
also why the cryptodev breakage surfaced now rather than in March.

It is not an isolated case. Here is a second one, entirely in current
master:

    meta/lib/oeqa/sdk/cases/meson.py:28
        self.ensure_host_package("pkgconfig")

ensure_host_package() prefixes the name and looks the result up in the 
SDK's host manifest by exact package name. The manifest has 
nativesdk-pkgconf. It has had nativesdk-pkgconf since e32bf38fab8b
"pkgconfig: remove" on 2026-03-23, so meson.MesonTest.test_iputils has 
been skipping on every SDK for five months. RPROVIDES does not help,
because the manifest records the names of the packages that were
installed rather than what they provide.

The two have different causes and the same symptom, and neither is
visible: one test is gated on content a standard SDK does not have, and 
the other on a package name that was renamed underneath it. 

The shape of the exposure is that 7 of the 13 oeqa/sdk modules on master
carry an ensure_host_package() or ensure_target_package() guard: cmake,
gtk3, kmod, maturin, meson, perl and python. Each of those can stop
running without anything turning red.

There is a second failure mode that is worse than a skip, and I only
found it by looking for the first. An eSDK's host manifest is written by
write_host_sdk_ext_manifest(), which walks the sstate cache the eSDK
ships and prints every object built for BUILD_SYS. So it lists what the
eSDK could install, not what it has. A guard checking that manifest
therefore passes, the test runs the command anyway, and it gets the
build machine's copy: perl.PerlTest reports on the build host's
interpreter rather than the SDK's. That is a green result for something
the SDK never provided, and no amount of counting skips will catch it.

I have been down a deep rabbit hole finding and fixing many of these
things while working on my SDK_FEATURES patchset:

- a fix for the pkgconf name above, so the meson case runs again
- an oeqa/sdk change letting a case name the command it needs and
  resolve it inside the SDK's own install directory, so "the SDK does
  not have this" and "I silently used the host's copy" stop being the
  same outcome. That is what turns the eSDK false pass into either a
  real pass or an honest skip.

That mistake is an easy one to make, and here is one measurement. In a
branch here that adds more SDK feature tests, applying that command
check turned twelve cases from skipping to running, and every one of the
packages involved was already installed in the SDK. They were skipping
because the check asserted a command named after the package, and
bindgen-cli provides bindgen, shaderc provides glslc, spirv-tools-bin
provides spirv-val, python3-spdx-tools provides pyspdxtools, and
mesa-libclc provides no command at all. That is twelve tests, no missing
packages, and nothing red. I am not claiming those twelve are yours,
because they are not upstream yet. I am claiming that the failure mode
is easy to write and impossible to see, which is the part that
generalises.


> Best regards,
> 
> -- 
> Paul Barker
> 

