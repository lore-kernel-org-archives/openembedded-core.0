Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE158C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 00:46:29 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web12.1920.1666745184013332746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 17:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S1KEg4ZP;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id c10-20020a4a4f0a000000b004912ced26e8so359138oob.13
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 17:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eCPgc6DXIxfYKVOjwLSnvOnJjLX2NGMdmIzbMyLVmcg=;
        b=S1KEg4ZPIvoxcgkKW1WlxX5bU/ivKsyWx/XV0h1m2K8jcHpA/2bTSPOQhDquMzxhCD
         MFL/IeTBzJTyIxWz5lnAzFyjzuOufPAcAhAIHpYz4odEgEQsZOlZtIh3R/GioTXNncZE
         2TsP/ol2EQIzipJPgpllbYS3wXwJzKOjdBTxJ3wKGO+TxSY9aik/4wZwKnnvDyX+He96
         qgW8MMdfqVY2PUqFOORzHfqIzQ95I3xlZqL1TJIRpuGH/ybHJdBhVgZ5/olFNZx7yKeo
         NO6FeftWbvViMG0eDRsTXILGkOYdV/AC3nm8QFNxsOFYnHFJfU/3eNkiK9Mc4+awSBhn
         3u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCPgc6DXIxfYKVOjwLSnvOnJjLX2NGMdmIzbMyLVmcg=;
        b=7C5FQq9KawsTD2zx5vPChv5iRc/ZIgxidxpG9Y+s4sUjwLagBYwc8YctsjF3DnSHjV
         HfTv+wxfFNB2lDXFNkf7+pF2WI1TS/S6IDMlWoT5Pk59lPLCUx4mV2kjzvcddV3PxhyK
         la9SFWPbkpvofPBFh5GEU6JW1LZYx8shXBKzUhDXs3r0BUmJ8cK6Fkr1XAuWySIpbgVI
         Op5mKHGbDdGpbqA/uMz3onenU3CwlRInYZOlHxiU+ubCnbYVkJYmRYP6zbWOfRsTsFeS
         uwt88o3qlL/4B7h8v7m/bS8u0ZK68t4EasHJROvYHw/lIrkdYZ5Hd7vAS6WFRP1mwUlP
         2MtA==
X-Gm-Message-State: ACrzQf0TRa5A7QlQZQ0ozSj03YzfA4F1EE3Dj/SdJ9Sgsf1RAxuesY03
	ipng7AsQEwwUpPOLcil4FafgDPp3rUR8+BBB6w4=
X-Google-Smtp-Source: AMsMyM5cEN/kn8ScUQxGJtzlmvEF8kdQNieMzc3IU1779Jh9uOIfYobO29l2peW6Lnmp4irpGkkUQUE1Hc9WxPk6wBQ=
X-Received: by 2002:a4a:8dd7:0:b0:47f:6250:4d82 with SMTP id
 a23-20020a4a8dd7000000b0047f62504d82mr17936988ool.73.1666745183245; Tue, 25
 Oct 2022 17:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <17207C5BC457528C.2993@lists.openembedded.org>
 <CANNYZj8d9b-se+mjFJwcm_TuyNY74np-=hi+QjGjt8zgh874Dw@mail.gmail.com>
In-Reply-To: <CANNYZj8d9b-se+mjFJwcm_TuyNY74np-=hi+QjGjt8zgh874Dw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Oct 2022 17:45:57 -0700
Message-ID: <CAMKF1sqthWA=ZyfVVfcrdYYemLT3VkFnSFP-aUJ8bbBr_0Pqcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 00:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172144

On Tue, Oct 25, 2022 at 9:15 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Ok, I have looked into this properly now. So:
>
> - the fail started to occur in 1.64 because crossbeam-utils is now a
> dependency of rust core (hard fail) and not just rustfmt (soft fail)
> - the correct way to address it is indeed to map oe arch (riscv32) to
> rust arch (riscv32gc) via meta/lib/oe/rust.py, which works globally
> across all recipes where this may occur.
> - however doing that exposed confusion about how we map arches, as
> there is actually a *third* arch involved (the internal llvm one
> listed in custom target definition), which too needs to be correctly
> mapped from oe arch so I fixed that as well.
>
> None of the three arch sets match each other exactly, unfortunately.

Right.

>
> Patches are coming shortly.
>

Thanks, I think we can also unbolt the workaround in librsvg as well.

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
index fc52ae61c5..daf60217d4 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
@@ -35,7 +35,6 @@ export RUST_TARGET = "${RUST_HOST_SYS}"
 RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
-RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"

 CARGO_DISABLE_BITBAKE_VENDORING = "1"
 do_configure[postfuncs] += "cargo_common_do_configure"

> Alex
>
> On Sat, 22 Oct 2022 at 21:56, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >
> > Ok, I'd like to understand where the failure is exactly. I just ran
> > 'bitbake rust' with poky master (rust 1.63) for qemuriscv32 machine,
> > and it succeeded. How can I see the fail? Did this become broken with
> > a 1.64.0 upgrade in your branch? (which I believe hasn't yet been
> > through the autobuilder, and so might show similar fails for other
> > targets without atomic_64 support)
> >
> > Alex
> >
> > On Fri, 21 Oct 2022 at 00:30, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > riscv32 builds fail since AtomicI64 is not available in sync::atomic for
> > > this architecture. Therefore it needs to be opted out and the way out is
> > > to pass it by RUSTFLAGS, however rust target recipe overrides RUSTFLAGS
> > > before exporting it so its better to piggy back on the variable its
> > > using which is RUST_DEBUG_REMAP
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/rust/rust_1.64.0.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-devtools/rust/rust_1.64.0.bb b/meta/recipes-devtools/rust/rust_1.64.0.bb
> > > index 1f9dbd3cce..b05f188d9c 100644
> > > --- a/meta/recipes-devtools/rust/rust_1.64.0.bb
> > > +++ b/meta/recipes-devtools/rust/rust_1.64.0.bb
> > > @@ -9,6 +9,7 @@ FILES:${PN}-dev = ""
> > >
> > >  # Used by crossbeam_atomic.patch
> > >  export TARGET_VENDOR
> > > +RUST_DEBUG_REMAP:append:riscv32 = " --cfg crossbeam_no_atomic_64"
> > >
> > >  do_compile () {
> > >      rust_runx build --stage 2
> > > --
> > > 2.38.1
> > >
> > >
> > >
> > >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#172064): https://lists.openembedded.org/g/openembedded-core/message/172064
> > Mute This Topic: https://lists.openembedded.org/mt/94464934/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

