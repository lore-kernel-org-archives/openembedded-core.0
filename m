Return-Path: <peter.suti@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47B8EB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 11:19:42 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.32003.1691407176785141502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 04:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=XyUairI+;
 spf=pass (domain: streamunlimited.com, ip: 209.85.208.53, mailfrom: peter.suti@streamunlimited.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so11476752a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 04:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1691407175; x=1692011975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hP554XAcglWCzGVFF5ZQyQbp2RiiyB/WhWeLM0v0Jo=;
        b=XyUairI+QgkPnoplZUQErzzA12rN2ngO18XJgDay1aT1yNTXpuIl4LL0N8vJqYcjR5
         PoHfSSWvp27zlRQ9j0W1kotWZ5QKum42/lTGSe1amMpGG0lBg9kR382n0s3/czt4PwXE
         Mx8+SPAu8DdXduDjcxk33DPvCkj0ogT/oRhB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691407175; x=1692011975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hP554XAcglWCzGVFF5ZQyQbp2RiiyB/WhWeLM0v0Jo=;
        b=RRo4lj50lNTWGMmvXXSqKO3ZqvdKnM7AYtoDrgRJqEy9q3CcGjfUdUT7r3HFWRfYyi
         MHE70NDf3r/xJWxQ5mk5l9Nsbez9Sb3wkBlcEDsTx3ybgOoVV1x+4oAokHUVM1juBFyd
         jMmuR3XzYbql1J5iHOjph05wPg15FudDsbhCW+vUeLBhFNL864XWJ6ScXSBT65dU851I
         N4SGLap2f7w0HF9RW1GxsfE4bT67Rf2wkvZee7estm8HZEgGz8ajQ4q7K3eqifsXfnYS
         pkeBAKR1yoAgfpVkp8KiLNm0smyumtABN3znWS/69M6WTFnx6DTHKatM8wj4eWvXryFz
         PuaQ==
X-Gm-Message-State: AOJu0Yx4Q0QRziztsGJlzEtV8f+AjQZyK+5YAwYcTLg8/+8qZ66AKPTh
	Da1WrkpHrcDTNUJUOFy3rAXDGWDTL7WTyTVs+TOH3g==
X-Google-Smtp-Source: AGHT+IHyMK7zKbJTpkVGW4U9R2OozbjIivix0LiFgW6fN63gBkuLiIx6ptCDnDpxk5u2Gto6fNJDwJFw47itnIdpd1o=
X-Received: by 2002:aa7:d959:0:b0:523:3f4f:dcd4 with SMTP id
 l25-20020aa7d959000000b005233f4fdcd4mr704512eds.16.1691407175008; Mon, 07 Aug
 2023 04:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
 <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
 <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
 <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
 <CACMGZgbYY1HbmjLOq=FO2c-K+vJYb36Yay6sz48PrCtkFUWjmA@mail.gmail.com>
 <fdc2b7c450443e11836df189b5a6c584c6024d54.camel@linuxfoundation.org>
 <CACMGZgazaZR1z4opzxwNNug-97DanqC6qciEzS+noshjQcsTeg@mail.gmail.com> <aeed5cf0689586cedccac7d9be2b36d5f5d6c8ad.camel@linuxfoundation.org>
In-Reply-To: <aeed5cf0689586cedccac7d9be2b36d5f5d6c8ad.camel@linuxfoundation.org>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Mon, 7 Aug 2023 13:19:23 +0200
Message-ID: <CACMGZgbW4aKKTQP1bw2YWyJBQX=KdxC2S1Z9yFaS_Q1n0CKL+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 11:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185593

On Fri, Aug 4, 2023 at 4:47=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Do you have a way to reproduce this using recipes in OE-Core?
>
> For example, I tried adding this to the cairo recipe:
>
> EXTERNALSRC =3D "/xxx/cairo-1.16.0"
> inherit externalsrc
>
> and then building cairo, cleaning cairo, building pango (which depends
> on cairo). I couldn't see any failure.
>

To reproduce you need a transitive dependency on a recipe using
externalsrc and run populate_sysroot.

 I can trigger it with the following sequence:
1) make cairo inherit externalsrc just like you described above.
2) build a package that depends on pango, for example libfm: bitbake libfm
3) clean cairo sstate: bitbake -c cleansstate cairo
4) rerun prepare_recipe_sysroot for libfm: bitbake -c
prepare_recipe_sysroot -f libfm

This produces the following error for me:
ERROR: libfm-1.3.2-r0 do_prepare_recipe_sysroot: The sstate manifest
for task 'cairo:populate_sysroot' (multilib variant '') could not be
found.
The pkgarchs considered were: armv8a-crc, armv8a, aarch64, allarch,
x86_64_x86_64-nativesdk.
But none of these manifests exists:
/home/yocto/.build-yocto/tmp/sstate-control/manifest-armv8a-crc-cairo.popul=
ate_sysroot
/home/yocto/.build-yocto/tmp/sstate-control/manifest-armv8a-cairo.populate_=
sysroot
/home/yocto/.build-yocto/tmp/sstate-control/manifest-aarch64-cairo.populate=
_sysroot
/home/yocto/.build-yocto/tmp/sstate-control/manifest-allarch-cairo.populate=
_sysroot
/home/yocto/.build-yocto/tmp/sstate-control/manifest-x86_64_x86_64-nativesd=
k-cairo.populate_sysroot
ERROR: Logfile of failure stored in:
/home/yocto/.build-yocto/tmp/work/armv8a-poky-linux/libfm/1.3.2-r0/temp/log=
.do_prepare_recipe_sysroot.3102616
ERROR: Task (/home/yocto/poky/meta/recipes-support/libfm/libfm_1.3.2.bb:do_=
prepare_recipe_sysroot)
failed with exit code '1'

> > I'd like to thank you for the time you have invested in this issue! I
> > appreciate the help.
> > I understand that my proposed solution might not be ideal, but fixing
> > the underlying issue in runqueue would be a real challenge.
> > If upstream is not interested in this patch, I can also understand that=
.
>
> It isn't that we're not interested, we just need to make sure something
> else doesn't break. A test case to reproduce the issue you're seeing
> would help a lot. Ultimately we should perhaps add something to the
> tests in meta/lib/oeqa/ to cover the issue.

I agree that a test would be valuable for this. I'll try to look into
how such a testcase could be constructed.

