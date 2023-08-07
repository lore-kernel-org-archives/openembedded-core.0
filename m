Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31133C001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 12:55:23 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.33548.1691412918582464244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 05:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aAk8ANw0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-313e742a787so2600153f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691412917; x=1692017717;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tl41ql0LqbOiNJvygCuC82pTpTSNHXKqFP42xzR2gtU=;
        b=aAk8ANw08nzC0fw+HLwTtW01Oq+fwGvGhL69gLKXL0u23vLYwQabjdEhUbYOlh73b4
         J5gNzPA4vHX66yWfy7XHYjctOYYh9Aog7pyPJR9EqQ1QS0ItK2Ruc90bqjFdMWpU+vHg
         DV7t7QeYlhIWoN9cDmMhi6M/3hsCkr0y/9WCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691412917; x=1692017717;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tl41ql0LqbOiNJvygCuC82pTpTSNHXKqFP42xzR2gtU=;
        b=MgwPA9Kxx+guXTQ+3zT6teDxciCBDcFYsvDDO75agmO0WV7xQ6bEXKo6h7LyV6uwET
         N/3MED3Oke/XJIj7HXTL2Qn7qomwmi4JemNBgsVb9hzmGEkAYP64aVqGdR2gsbcfe+yY
         BkcdF2hajenooJ3zAg4jSXEHHYQ5q85T/wRuP2ofYfrK8LzzC3IlLhPp6KY07/XW/stj
         cja3mOdwWCOkY90ZTdY27OUW5NPYCBZSC3ZFNCudOxJwlmE0gPGRB2ZvIRU/mv04iHVS
         0CbyGJWxWSNZKkF/J+Wy+syTDLt3CDzMNtYEnnH1kKor8cCQ9yN35ZhLxJzauog1rNis
         tUtA==
X-Gm-Message-State: AOJu0YwyTDJ3U3Aa/vM0TI1TcLQC8VujyCiIGEGHa42SrpXOuDsWTQbk
	Zflhroq/HFW3nTJvoHDOugGVDQ==
X-Google-Smtp-Source: AGHT+IHbWiklpg6CbVS/qu9tPYAK6+1rLRvOxTuOo95imeWPDdl/or6t/j3zEwH6BOpNdTLY+ik6XQ==
X-Received: by 2002:a5d:5229:0:b0:317:5f35:854a with SMTP id i9-20020a5d5229000000b003175f35854amr5692064wra.13.1691412916695;
        Mon, 07 Aug 2023 05:55:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5? ([2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5])
        by smtp.gmail.com with ESMTPSA id z10-20020a5d640a000000b003178dc2371bsm10047364wru.7.2023.08.07.05.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 05:55:16 -0700 (PDT)
Message-ID: <0577cb4c48dfa9610eb087ba4cf1694639dc59d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Suti <peter.suti@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 07 Aug 2023 13:55:15 +0100
In-Reply-To: <CACMGZgbW4aKKTQP1bw2YWyJBQX=KdxC2S1Z9yFaS_Q1n0CKL+A@mail.gmail.com>
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
	 <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
	 <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
	 <aecc7e66bc7cbc16c365c2432d4e850b938bc7e3.camel@linuxfoundation.org>
	 <CACMGZgbYY1HbmjLOq=FO2c-K+vJYb36Yay6sz48PrCtkFUWjmA@mail.gmail.com>
	 <fdc2b7c450443e11836df189b5a6c584c6024d54.camel@linuxfoundation.org>
	 <CACMGZgazaZR1z4opzxwNNug-97DanqC6qciEzS+noshjQcsTeg@mail.gmail.com>
	 <aeed5cf0689586cedccac7d9be2b36d5f5d6c8ad.camel@linuxfoundation.org>
	 <CACMGZgbW4aKKTQP1bw2YWyJBQX=KdxC2S1Z9yFaS_Q1n0CKL+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 12:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185596

On Mon, 2023-08-07 at 13:19 +0200, Peter Suti wrote:
> On Fri, Aug 4, 2023 at 4:47=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Do you have a way to reproduce this using recipes in OE-Core?
> >=20
> > For example, I tried adding this to the cairo recipe:
> >=20
> > EXTERNALSRC =3D "/xxx/cairo-1.16.0"
> > inherit externalsrc
> >=20
> > and then building cairo, cleaning cairo, building pango (which depends
> > on cairo). I couldn't see any failure.
> >=20
>=20
> To reproduce you need a transitive dependency on a recipe using
> externalsrc and run populate_sysroot.
>=20
>  I can trigger it with the following sequence:
> 1) make cairo inherit externalsrc just like you described above.
> 2) build a package that depends on pango, for example libfm: bitbake libf=
m
> 3) clean cairo sstate: bitbake -c cleansstate cairo
> 4) rerun prepare_recipe_sysroot for libfm: bitbake -c
> prepare_recipe_sysroot -f libfm
>=20
> This produces the following error for me:
> ERROR: libfm-1.3.2-r0 do_prepare_recipe_sysroot: The sstate manifest
> for task 'cairo:populate_sysroot' (multilib variant '') could not be
> found.
> The pkgarchs considered were: armv8a-crc, armv8a, aarch64, allarch,
> x86_64_x86_64-nativesdk.
> But none of these manifests exists:
> /home/yocto/.build-yocto/tmp/sstate-control/manifest-armv8a-crc-cairo.pop=
ulate_sysroot
> /home/yocto/.build-yocto/tmp/sstate-control/manifest-armv8a-cairo.populat=
e_sysroot
> /home/yocto/.build-yocto/tmp/sstate-control/manifest-aarch64-cairo.popula=
te_sysroot
> /home/yocto/.build-yocto/tmp/sstate-control/manifest-allarch-cairo.popula=
te_sysroot
> /home/yocto/.build-yocto/tmp/sstate-control/manifest-x86_64_x86_64-native=
sdk-cairo.populate_sysroot
> ERROR: Logfile of failure stored in:
> /home/yocto/.build-yocto/tmp/work/armv8a-poky-linux/libfm/1.3.2-r0/temp/l=
og.do_prepare_recipe_sysroot.3102616
> ERROR: Task (/home/yocto/poky/meta/recipes-support/libfm/libfm_1.3.2.bb:d=
o_prepare_recipe_sysroot)
> failed with exit code '1'
>=20
> > > I'd like to thank you for the time you have invested in this issue! I
> > > appreciate the help.
> > > I understand that my proposed solution might not be ideal, but fixing
> > > the underlying issue in runqueue would be a real challenge.
> > > If upstream is not interested in this patch, I can also understand th=
at.
> >=20
> > It isn't that we're not interested, we just need to make sure something
> > else doesn't break. A test case to reproduce the issue you're seeing
> > would help a lot. Ultimately we should perhaps add something to the
> > tests in meta/lib/oeqa/ to cover the issue.
>=20
> I agree that a test would be valuable for this. I'll try to look into
> how such a testcase could be constructed.

I tried:

bitbake libfm; bitbake -c cleansstate cairo; bitbake -c prepare_recipe_sysr=
oot -f libfm

with cairo marked as externalsrc and everything built just fine. Can
you confirm which release of the project you're using please? I tested
with master.

Cheers,

Richard



