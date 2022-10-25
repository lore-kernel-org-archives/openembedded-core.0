Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4303FC38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 16:15:50 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.9207.1666714541168700779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 09:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jL8Z7Xsg;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id s24so7141015ljs.11
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 09:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oP83BtmrRxBebD7loXQLItQII62RmWv38o7y9eY9WLk=;
        b=jL8Z7XsgZHXwKZh6Hgx+ZhMy+v985szSR8dHaNmEriUsEieRdC7yDm+IXovnmJWAYx
         StvKd8ZKoUlwr3cg+6wEOcQkK+5AEKi3px4FtA430GQk3t7+KOFYUcSxuvR1uxXAEzG6
         mcJYbD2k4hAH2ZsR6ri02o/RHeGM83qAHcJ3cL9LSWzkOxEjKVVrtEkd7JjAIjc8BMjs
         ueIj84SGQOd+uwkJxsvclstuq8fMIKwtvbzvefjwi+W4tl0o2ma0cHumivfAIIhZj+l8
         nzJNAxbYD2j3Bqfmmet/L09/Vgh3pEDdjFalfVkg3YtfwWj3jqt/VJbT8dtkXnMCamae
         1stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oP83BtmrRxBebD7loXQLItQII62RmWv38o7y9eY9WLk=;
        b=T/Gb4Fu86445khdeh0AlK+pFz7Z2Rl3iZ2TNU/0hos6r497zgrCrNVzaQhvPV7u1t6
         Y0jMNgbDN/idGuCbHGT/NmCx09livgdeUpHayUQjjCP0dIzoI89LG4hEBQHFcsC+LGLE
         bisYTbx8t9yLQmIayYj0VHBVfo4OSdcA/Q8m96GfECI7ieQIHxjWlDddC6A8Zwo6I3Wh
         qqhDTCtgHuv+SM2zNj76O9Ev7tWg+WKSJp9i2n9CmqEweRffKs0FlVrOK/bsmkfDB4i7
         8kMt3EEm9dATatovyC2CnYozbyelUaxqx2mxrlQvtMqXKjSnNKfM1kYvZe7W4skTBUcG
         HwHw==
X-Gm-Message-State: ACrzQf1QbxTjWh74pmGrzvt2xJi5smOJnlC0caKSduKD5rZ4CEFI6U2S
	7k985Z98yT7YMgeyWeK+jPXDstPokzKtWk3hWNY=
X-Google-Smtp-Source: AMsMyM5BwYNf1cJp0ZEbMLah3oJnsnOQRdarOgbgLJz+3+KPVaQR+eypzaw1FeiktQO4NJGqqoKnWoCiHlcNQCvhqeQ=
X-Received: by 2002:a2e:bc07:0:b0:26f:b031:17ee with SMTP id
 b7-20020a2ebc07000000b0026fb03117eemr14948119ljf.217.1666714539124; Tue, 25
 Oct 2022 09:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <17207C5BC457528C.2993@lists.openembedded.org>
In-Reply-To: <17207C5BC457528C.2993@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Oct 2022 18:15:27 +0200
Message-ID: <CANNYZj8d9b-se+mjFJwcm_TuyNY74np-=hi+QjGjt8zgh874Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 16:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172138

Ok, I have looked into this properly now. So:

- the fail started to occur in 1.64 because crossbeam-utils is now a
dependency of rust core (hard fail) and not just rustfmt (soft fail)
- the correct way to address it is indeed to map oe arch (riscv32) to
rust arch (riscv32gc) via meta/lib/oe/rust.py, which works globally
across all recipes where this may occur.
- however doing that exposed confusion about how we map arches, as
there is actually a *third* arch involved (the internal llvm one
listed in custom target definition), which too needs to be correctly
mapped from oe arch so I fixed that as well.

None of the three arch sets match each other exactly, unfortunately.

Patches are coming shortly.

Alex

On Sat, 22 Oct 2022 at 21:56, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Ok, I'd like to understand where the failure is exactly. I just ran
> 'bitbake rust' with poky master (rust 1.63) for qemuriscv32 machine,
> and it succeeded. How can I see the fail? Did this become broken with
> a 1.64.0 upgrade in your branch? (which I believe hasn't yet been
> through the autobuilder, and so might show similar fails for other
> targets without atomic_64 support)
>
> Alex
>
> On Fri, 21 Oct 2022 at 00:30, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > riscv32 builds fail since AtomicI64 is not available in sync::atomic for
> > this architecture. Therefore it needs to be opted out and the way out is
> > to pass it by RUSTFLAGS, however rust target recipe overrides RUSTFLAGS
> > before exporting it so its better to piggy back on the variable its
> > using which is RUST_DEBUG_REMAP
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/rust/rust_1.64.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/rust/rust_1.64.0.bb b/meta/recipes-devtools/rust/rust_1.64.0.bb
> > index 1f9dbd3cce..b05f188d9c 100644
> > --- a/meta/recipes-devtools/rust/rust_1.64.0.bb
> > +++ b/meta/recipes-devtools/rust/rust_1.64.0.bb
> > @@ -9,6 +9,7 @@ FILES:${PN}-dev = ""
> >
> >  # Used by crossbeam_atomic.patch
> >  export TARGET_VENDOR
> > +RUST_DEBUG_REMAP:append:riscv32 = " --cfg crossbeam_no_atomic_64"
> >
> >  do_compile () {
> >      rust_runx build --stage 2
> > --
> > 2.38.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172064): https://lists.openembedded.org/g/openembedded-core/message/172064
> Mute This Topic: https://lists.openembedded.org/mt/94464934/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

