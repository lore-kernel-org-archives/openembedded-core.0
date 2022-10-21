Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192F2C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 14:05:48 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.10213.1666361138605783843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 07:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e3JtZV2x;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id o64so3263916oib.12
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VrCHDyiwjyFdCZYiIFR3uAHIiQjJcTmXj7oBtOGdCBM=;
        b=e3JtZV2xoKQakKJ1yzYU1WavnfAjG01NdvmSJFkAhPFHU1FUC3rjkXyt5rZJfw1Mn4
         lbxkDGIosawxdO4bOAWHp9edytcmSIBigl4oZjCzDgmxTRz7oOp+uNoycLjSi7AhEbPA
         tuXUS99Q3+VnqRC0xKKhvTyc3zVuXyEZp9b6La4hzPYsPYphHRCVJ4KM/lvB6GqNdHQc
         kay21gDlOIygw2YYrALt4kXmtH/exCZjOBmsZR5Te/7F/pk0a4Dlnzn/L6pqMPr3bqqW
         s0rGF+qFOGhO8wBizSCDesvrJA9Joq1LzkXnEY0htdHE7jB9EgZUnIvdfstXnWayuhMm
         rQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrCHDyiwjyFdCZYiIFR3uAHIiQjJcTmXj7oBtOGdCBM=;
        b=hs3pxHt0RPzulqYv140xiVofhfDcag8kCD3ajJksYZTxWKOdxaSZ2XNDgmYNvPAsHh
         T0BNvS6Y3ezhTFp2es/P9ql0tq/mMWhNEfHtzb3/Qu6k9vRbdjqhyelMd7PrD6DHZa1+
         dTBuPssburYJcQU/QRrK+RJEMiEiylk5Ky4YzEfgzJdUAeOEiab4aZ7Qg7OiS89XLXL1
         EDupX7MtrvovGwUJiWXEmSEXhIpjpSP0N3W2sWjMJwwybhA6w6xiVPzGw9ya2eEE/Jf8
         y6Hs4u78nug4auX89x6l9W7RmrqbURujNhZmDeLJ9x0fK0mR65oHwmdSMQztYWwDK60D
         4f2A==
X-Gm-Message-State: ACrzQf1fljUUQn571DBtlVZGY0ShHtkxG2slkA2ouc7A3zUk3P9MqWRf
	y+PHB9ekTI0toWwtWzjarfchhTULP5VrILVI31Aa8qqE
X-Google-Smtp-Source: AMsMyM7j/qsmw0YlsOk2p6FnxqVjY05Q+/T7mO2UK+zUGOgmM/l7mBsl7mNKIL27KNJAPMSsb2YZulgzOom64kZvjN4=
X-Received: by 2002:a05:6808:1902:b0:355:3420:6585 with SMTP id
 bf2-20020a056808190200b0035534206585mr14375514oib.262.1666361137802; Fri, 21
 Oct 2022 07:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
In-Reply-To: <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2022 07:05:11 -0700
Message-ID: <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 14:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172020

On Thu, Oct 20, 2022 at 11:04 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> We carry this patch, so that manual per-target fixups like this are
> not needed, and crossbeam's internal lists are used properly:
>
> https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch?h=master-next&id=f4fe7cdaa7fc5785c55bd507c897f4d25d43cffa
>
> Is it not working somehow? Does the list itself need to be fixed?
>

This patch is doing something else where its mapping and broadening
the architecture to match crossbeam's understanding of it.
Here issue is new where it does not yet realize that some
architectures do not have 64bit atomics implemented.

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
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#172006): https://lists.openembedded.org/g/openembedded-core/message/172006
> > Mute This Topic: https://lists.openembedded.org/mt/94464934/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

