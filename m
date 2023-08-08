Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F427C001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 07:21:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.56460.1691479275963071346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 00:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hWu4mlwG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3178dd771ceso4595826f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691479274; x=1692084074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W2c+ndcsOjj8jICc+vdRPEPVtb0AmxSuFaDrDWQTDnI=;
        b=hWu4mlwGaX9cC9lR9gp5p06vyqUTf6tUID4qaBYAfcBV0oFgQ0AGaodKd8jTU1DWFF
         Dbl1Ajl1AZar/vHihd/nbdfXqADHNvE1kR0OY1FJxnsY1u8jZ+CalDYvI82uNkErkbC4
         sgyzebVAY5rnDix3zWfDUgCEKnXmCf/RspOFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691479274; x=1692084074;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2c+ndcsOjj8jICc+vdRPEPVtb0AmxSuFaDrDWQTDnI=;
        b=dluOA2YveZpeNXbeYtX4gRguuIOnk+1h3xGh7/ja8KQcFJq6b3Dtlftv0w7K2KI1yC
         Ihhbz/EPi/JyA+3uVsFyNgoz8KTIQpxLWJZe1nIndLwhjqj+XV1gYmyJrpL+HECjVPX2
         XbyYOvXM2v9l0Ug2hMuJUwBRaMYd4PArrWWj5NH49eRxagfu352psgb+H7sxSjeShm9+
         S3xb8hRkx/MgXwfQWXDpA6LRNNjgvLcNL61Oak7GcaoYKf1DO3UuclUTgKM56ydFCiei
         fBIFmNF+Ce529CBfKEIV29IipPuYMT69m6hbZEqjgO6Gto+erRKco2t1lhzE4yW7u21/
         Gs9A==
X-Gm-Message-State: AOJu0YwSJuSeGShC7q3Bb/TjXwocT/HU9LgV3+zHE+QTdtEzAJDOMFXz
	96/vhgQrG78+81+8hqpz2q540Q==
X-Google-Smtp-Source: AGHT+IERLDwLtIsTZeUlT//zv5FDNExqFlDxfd+w42dBvFBbuSmgcKW5KWDSdD6hXt8WnOIfJYlCGA==
X-Received: by 2002:a5d:66c9:0:b0:317:7b74:b9fb with SMTP id k9-20020a5d66c9000000b003177b74b9fbmr7844887wrw.46.1691479274182;
        Tue, 08 Aug 2023 00:21:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c9a:4256:d8e9:42e2? ([2001:8b0:aba:5f3c:8c9a:4256:d8e9:42e2])
        by smtp.gmail.com with ESMTPSA id a18-20020adfeed2000000b00313f61889ecsm12687634wrp.66.2023.08.08.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 00:21:13 -0700 (PDT)
Message-ID: <34c08d4d87316640f8f7a670192bbc06c51447bd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Suti <peter.suti@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 08 Aug 2023 08:21:12 +0100
In-Reply-To: <CACMGZgZxPNV9kTjCQ6fpcV6JW1mduCJKEY8i6oLQX07w7FX05A@mail.gmail.com>
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
	 <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
	 <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
	 <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
	 <CACMGZgbYY1HbmjLOq=FO2c-K+vJYb36Yay6sz48PrCtkFUWjmA@mail.gmail.com>
	 <fdc2b7c450443e11836df189b5a6c584c6024d54.camel@linuxfoundation.org>
	 <CACMGZgazaZR1z4opzxwNNug-97DanqC6qciEzS+noshjQcsTeg@mail.gmail.com>
	 <aeed5cf0689586cedccac7d9be2b36d5f5d6c8ad.camel@linuxfoundation.org>
	 <CACMGZgbW4aKKTQP1bw2YWyJBQX=KdxC2S1Z9yFaS_Q1n0CKL+A@mail.gmail.com>
	 <0577cb4c48dfa9610eb087ba4cf1694639dc59d7.camel@linuxfoundation.org>
	 <CACMGZgZxPNV9kTjCQ6fpcV6JW1mduCJKEY8i6oLQX07w7FX05A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 07:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185650

On Mon, 2023-08-07 at 16:15 +0200, Peter Suti wrote:
> On Mon, Aug 7, 2023 at 2:55=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2023-08-07 at 13:19 +0200, Peter Suti wrote:
> > > On Fri, Aug 4, 2023 at 4:47=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > Do you have a way to reproduce this using recipes in OE-Core?
> > > >=20
> > > > For example, I tried adding this to the cairo recipe:
> > > >=20
> > > > EXTERNALSRC =3D "/xxx/cairo-1.16.0"
> > > > inherit externalsrc
> > > >=20
> > > > and then building cairo, cleaning cairo, building pango (which depe=
nds
> > > > on cairo). I couldn't see any failure.
> > > >=20
> > >=20
> > > To reproduce you need a transitive dependency on a recipe using
> > > externalsrc and run populate_sysroot.
> > >=20
> > >  I can trigger it with the following sequence:
> > > 1) make cairo inherit externalsrc just like you described above.
> > > 2) build a package that depends on pango, for example libfm: bitbake =
libfm
> > > 3) clean cairo sstate: bitbake -c cleansstate cairo
> > > 4) rerun prepare_recipe_sysroot for libfm: bitbake -c
> > > prepare_recipe_sysroot -f libfm
> > >=20
> > > This produces the following error for me:
> > > ERROR: libfm-1.3.2-r0 do_prepare_recipe_sysroot: The sstate manifest
> > > for task 'cairo:populate_sysroot' (multilib variant '') could not be
> > > found.
> > > The pkgarchs considered were: armv8a-crc, armv8a, aarch64, allarch,
> > > x86_64_x86_64-nativesdk.
> > > But none of these manifests exists:
> > > /home/yocto/.build-yocto/tmp/sstate-control/manifest-armv8a-crc-cairo=
.populate_sysroot
> > > /home/yocto/.build-yocto/tmp/sstate-control/manifest-armv8a-cairo.pop=
ulate_sysroot
> > > /home/yocto/.build-yocto/tmp/sstate-control/manifest-aarch64-cairo.po=
pulate_sysroot
> > > /home/yocto/.build-yocto/tmp/sstate-control/manifest-allarch-cairo.po=
pulate_sysroot
> > > /home/yocto/.build-yocto/tmp/sstate-control/manifest-x86_64_x86_64-na=
tivesdk-cairo.populate_sysroot
> > > ERROR: Logfile of failure stored in:
> > > /home/yocto/.build-yocto/tmp/work/armv8a-poky-linux/libfm/1.3.2-r0/te=
mp/log.do_prepare_recipe_sysroot.3102616
> > > ERROR: Task (/home/yocto/poky/meta/recipes-support/libfm/libfm_1.3.2.=
bb:do_prepare_recipe_sysroot)
> > > failed with exit code '1'
> > >=20
> > > > > I'd like to thank you for the time you have invested in this issu=
e! I
> > > > > appreciate the help.
> > > > > I understand that my proposed solution might not be ideal, but fi=
xing
> > > > > the underlying issue in runqueue would be a real challenge.
> > > > > If upstream is not interested in this patch, I can also understan=
d that.
> > > >=20
> > > > It isn't that we're not interested, we just need to make sure somet=
hing
> > > > else doesn't break. A test case to reproduce the issue you're seein=
g
> > > > would help a lot. Ultimately we should perhaps add something to the
> > > > tests in meta/lib/oeqa/ to cover the issue.
> > >=20
> > > I agree that a test would be valuable for this. I'll try to look into
> > > how such a testcase could be constructed.
> >=20
> > I tried:
> >=20
> > bitbake libfm; bitbake -c cleansstate cairo; bitbake -c prepare_recipe_=
sysroot -f libfm
> >=20
> > with cairo marked as externalsrc and everything built just fine. Can
> > you confirm which release of the project you're using please? I tested
> > with master.
> >=20
>=20
> I have just tried with 058a44165ce375f405063e73a9fcd1b2757ef8da and I
> could reproduce it.
> I did not notice before but on the first try the issue is not
> triggered, but running the following two commands it eventually
> breaks:
> 1) bitbake -c cleansstate cairo
> 2) bitbake -c prepare_recipe_sysroot -f libfm
>=20
> It did not happen on the first 2 runs for me, but it did happen on the 3r=
d one.
>=20
> Could you check if running this a few times reproduces the issue?
> `bitbake -c cleansstate cairo; bitbake -c prepare_recipe_sysroot -f libfm=
`
>=20
> Because eventually cairo is not built, just skipped entirely.

Thanks, with this tip I was able to reproduce the issue locally.

I've spent some time looking at what was happening and why. I also dug
into the history to find out who added the deltask and when (me back in
2012 it seems when externalsrc was created).

After all of that I'm starting to think your patch or something similar
might be the right thing to do to resolve the issues here.

The main issue is that runqueue has stopped seeing populate_sysroot as
an sstate task as the setscene task is missing. The options come down
to either teaching bitbake a new way of recognising sstate tasks even
when setscene isn't there, or putting the setscene tasks back and
disabling them some other way which your patch does.

Meanwhile we probably should put it through wider testing and see how
that looks.

Cheers,

Richard




