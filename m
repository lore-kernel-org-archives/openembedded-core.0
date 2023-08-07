Return-Path: <peter.suti@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623FBC04A6A
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 14:16:13 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.35582.1691417763807040044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 07:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=b/kzhgzZ;
 spf=pass (domain: streamunlimited.com, ip: 209.85.208.45, mailfrom: peter.suti@streamunlimited.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so6599423a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1691417762; x=1692022562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLvlxT6MIFDlVA7MwVMjXCtpeQ8tlxgYcSr2aS45hwY=;
        b=b/kzhgzZsbYAt65IWge5rLBiFtEtGtp0pqJmkuVsMHOOs3V+6QJPUETsMIQAB05Xjc
         bf04pZhP5PX9jIBc1ug6wCM8rRR2GMyvibopF0PMMeV7p4GYNj44eCrpgdwxVBf7ctRL
         ePsheCsWq5LZ3Iu0Do9Z4u43I/0ef+rj6zYfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691417762; x=1692022562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLvlxT6MIFDlVA7MwVMjXCtpeQ8tlxgYcSr2aS45hwY=;
        b=ia6TPlh7W6kCeOiB7isvtTI3b2y9kGbPlr9hxNIYMajr1pryqKCVg23OJYtq3N3Ufz
         WeVALK0M6OFXHx14rRPvByAyIRF2xIQSvAkzZdkS/DRQ0Juu8GFZ+UmNGIB4UhUm1ZZk
         4ONNNTeLPC2P+7Qz/mQJfFF2UPK7hD+IOqGPwOAT0+xpG3BsnORUsKOEObDfH9m6RUj1
         0/OuUO+pX1q+91srsGu7SfKKqlu3HxzafEXRfw9S4/6L/SqG9zwgpKnqtdYryR4U1VlK
         dXGJ79qqvVHYyNeBAgcm8GXWIPGL9SpqsNCsK3jRkTaQUb/zO7EOG101FwK64FDx60yp
         qCyg==
X-Gm-Message-State: AOJu0Yy6M6VHEyN9qoEVvQBpZekeLTztRdr4BC7/T2VfJvNcQNKXnlwP
	1DnTXb1HjhLvdtWI7O+d+M+tEDTMwVArAroKNvMRfQ==
X-Google-Smtp-Source: AGHT+IFXVoT6KATZtHQZGAtWtptMXgeDiHsPMpea1zZtaf0h49d8kNuCcCMa2T5kl+0BDB8AKZdD150kV5pUcYHbUcI=
X-Received: by 2002:a05:6402:28a:b0:522:455d:6f6f with SMTP id
 l10-20020a056402028a00b00522455d6f6fmr8572513edv.34.1691417762135; Mon, 07
 Aug 2023 07:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
 <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
 <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
 <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
 <CACMGZgbYY1HbmjLOq=FO2c-K+vJYb36Yay6sz48PrCtkFUWjmA@mail.gmail.com>
 <fdc2b7c450443e11836df189b5a6c584c6024d54.camel@linuxfoundation.org>
 <CACMGZgazaZR1z4opzxwNNug-97DanqC6qciEzS+noshjQcsTeg@mail.gmail.com>
 <aeed5cf0689586cedccac7d9be2b36d5f5d6c8ad.camel@linuxfoundation.org>
 <CACMGZgbW4aKKTQP1bw2YWyJBQX=KdxC2S1Z9yFaS_Q1n0CKL+A@mail.gmail.com> <0577cb4c48dfa9610eb087ba4cf1694639dc59d7.camel@linuxfoundation.org>
In-Reply-To: <0577cb4c48dfa9610eb087ba4cf1694639dc59d7.camel@linuxfoundation.org>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Mon, 7 Aug 2023 16:15:51 +0200
Message-ID: <CACMGZgZxPNV9kTjCQ6fpcV6JW1mduCJKEY8i6oLQX07w7FX05A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 14:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185602

On Mon, Aug 7, 2023 at 2:55=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-08-07 at 13:19 +0200, Peter Suti wrote:
> > On Fri, Aug 4, 2023 at 4:47=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Do you have a way to reproduce this using recipes in OE-Core?
> > >
> > > For example, I tried adding this to the cairo recipe:
> > >
> > > EXTERNALSRC =3D "/xxx/cairo-1.16.0"
> > > inherit externalsrc
> > >
> > > and then building cairo, cleaning cairo, building pango (which depend=
s
> > > on cairo). I couldn't see any failure.
> > >
> >
> > To reproduce you need a transitive dependency on a recipe using
> > externalsrc and run populate_sysroot.
> >
> >  I can trigger it with the following sequence:
> > 1) make cairo inherit externalsrc just like you described above.
> > 2) build a package that depends on pango, for example libfm: bitbake li=
bfm
> > 3) clean cairo sstate: bitbake -c cleansstate cairo
> > 4) rerun prepare_recipe_sysroot for libfm: bitbake -c
> > prepare_recipe_sysroot -f libfm
> >
> > This produces the following error for me:
> > ERROR: libfm-1.3.2-r0 do_prepare_recipe_sysroot: The sstate manifest
> > for task 'cairo:populate_sysroot' (multilib variant '') could not be
> > found.
> > The pkgarchs considered were: armv8a-crc, armv8a, aarch64, allarch,
> > x86_64_x86_64-nativesdk.
> > But none of these manifests exists:
> > /home/yocto/.build-yocto/tmp/sstate-control/manifest-armv8a-crc-cairo.p=
opulate_sysroot
> > /home/yocto/.build-yocto/tmp/sstate-control/manifest-armv8a-cairo.popul=
ate_sysroot
> > /home/yocto/.build-yocto/tmp/sstate-control/manifest-aarch64-cairo.popu=
late_sysroot
> > /home/yocto/.build-yocto/tmp/sstate-control/manifest-allarch-cairo.popu=
late_sysroot
> > /home/yocto/.build-yocto/tmp/sstate-control/manifest-x86_64_x86_64-nati=
vesdk-cairo.populate_sysroot
> > ERROR: Logfile of failure stored in:
> > /home/yocto/.build-yocto/tmp/work/armv8a-poky-linux/libfm/1.3.2-r0/temp=
/log.do_prepare_recipe_sysroot.3102616
> > ERROR: Task (/home/yocto/poky/meta/recipes-support/libfm/libfm_1.3.2.bb=
:do_prepare_recipe_sysroot)
> > failed with exit code '1'
> >
> > > > I'd like to thank you for the time you have invested in this issue!=
 I
> > > > appreciate the help.
> > > > I understand that my proposed solution might not be ideal, but fixi=
ng
> > > > the underlying issue in runqueue would be a real challenge.
> > > > If upstream is not interested in this patch, I can also understand =
that.
> > >
> > > It isn't that we're not interested, we just need to make sure somethi=
ng
> > > else doesn't break. A test case to reproduce the issue you're seeing
> > > would help a lot. Ultimately we should perhaps add something to the
> > > tests in meta/lib/oeqa/ to cover the issue.
> >
> > I agree that a test would be valuable for this. I'll try to look into
> > how such a testcase could be constructed.
>
> I tried:
>
> bitbake libfm; bitbake -c cleansstate cairo; bitbake -c prepare_recipe_sy=
sroot -f libfm
>
> with cairo marked as externalsrc and everything built just fine. Can
> you confirm which release of the project you're using please? I tested
> with master.
>

I have just tried with 058a44165ce375f405063e73a9fcd1b2757ef8da and I
could reproduce it.
I did not notice before but on the first try the issue is not
triggered, but running the following two commands it eventually
breaks:
1) bitbake -c cleansstate cairo
2) bitbake -c prepare_recipe_sysroot -f libfm

It did not happen on the first 2 runs for me, but it did happen on the 3rd =
one.

Could you check if running this a few times reproduces the issue?
`bitbake -c cleansstate cairo; bitbake -c prepare_recipe_sysroot -f libfm`

Because eventually cairo is not built, just skipped entirely.

