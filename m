Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EF0C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 21:51:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.24656.1661205064421433927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 14:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JWw/TzvG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id bs25so14813153wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 14:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=1SxqkcWI78fTRT3Q+EQNqZvNX0pkkO4cwXeA2pDS2dk=;
        b=JWw/TzvGk6CdWYhmHmkFxdT57XFzZTitvmVSu+ecDhuNuxOMAUO4bJWPVaBYBJJQky
         LubrOsDxzWc//5S4+sCNWZ/LLlxq8E1cRTuzVjgdG233VzhuF2GKOPgvwd2kmQ4nav08
         ZVjGwbDoNMbvtRyNN8nJofcy0l3hgJbuIfqmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=1SxqkcWI78fTRT3Q+EQNqZvNX0pkkO4cwXeA2pDS2dk=;
        b=Xumyrn2JL1G00ftXwAuJMXHaiOeU2/fbI9XwV9xt09ty2OZtgNhgM9vZIEhApHJJRK
         BJNIsadIHc74mrgDClI9cjcv4HVFQnfRVFNp4gc3VrZlU4bLOmSh0/Z4pAdZhzZoaiY+
         v4bRmArSoMK9PZvxMcmozQAfOLVZyNO9fNEqpEsoqrzi8AvydNXLVzjj1UGds3cdP438
         rSRW0jwrN1OQpL2xE+JwGm7HGCzASL5tRSbY7ilTKH7B2G7Dnzv36dE1XvJGGjEwuu8c
         xRNHIZDEXSR83GnQGSWb1FYZRuMNJ54n60e/yAVggIMqAeVGilWXmSPSVAbYMKLDykLV
         +cVg==
X-Gm-Message-State: ACgBeo0yNR5pEvZe9GJBFkymnBeZdVxUWA8Cq/yCyWJZt554bx7IJt4Z
	VM0dDbZ4ql8V17G4QlHmAore8A==
X-Google-Smtp-Source: 
 AA6agR6kkyN+dP2PBTCDD/UXFTZOS8QW0DQ0tGkBXXJkh3CqlAE7nG7DKzFucwcsU34NZE9an7aNdg==
X-Received: by 2002:a05:6000:1acf:b0:222:cff7:3b6c with SMTP id
 i15-20020a0560001acf00b00222cff73b6cmr11842295wry.191.1661205062590;
        Mon, 22 Aug 2022 14:51:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6994:a175:4613:7bc4?
 ([2001:8b0:aba:5f3c:6994:a175:4613:7bc4])
        by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c511600b003a601707174sm17087796wms.33.2022.08.22.14.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 14:51:02 -0700 (PDT)
Message-ID: 
 <13f45c18d6265b1392f01279fec5f75e7ed80ce5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Use libc++ runtime when using clang
 with llvm runtime
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2022 22:51:00 +0100
In-Reply-To: <20220822211023.424801-1-raj.khem@gmail.com>
References: <20220822211023.424801-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 21:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169686

On Mon, 2022-08-22 at 14:10 -0700, Khem Raj wrote:
> meta-clang has options when it comes to C++ runtime, default is to use
> gnu runtime, other options are llvm runtime and android runtime. This
> patch helps when a distro is using llvm runtime for C/C++ runtime. It
> informs the rust build system about right C++ runtime to configure for
> when such a setting is used.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/=
rust/rust.inc
> index 284347dedc..c288903c9b 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -73,6 +73,7 @@ python do_configure() {
> =20
>      # [target.ARCH-poky-linux]
>      host_section =3D "target.{}".format(d.getVar('RUST_HOST_SYS', True))
> +    runtime =3D "target.{}".format(d.getVar('RUNTIME', True))
>      config.add_section(host_section)
> =20
>      llvm_config_target =3D d.expand("${RUST_ALTERNATE_EXE_PATH}")
> @@ -107,6 +108,8 @@ python do_configure() {
>      # [llvm]
>      config.add_section("llvm")
>      config.set("llvm", "static-libstdcpp", e(False))
> +    if "llvm" in runtime:
> +        config.set("llvm", "use-libcxx", e(True))
> =20

I think it is a little bit over complicated, couldn't it just be:

if "llvm" in (d.getVar('RUNTIME', True) or ""):
    config.set("llvm", "use-libcxx", e(True))

I'd much rather we did some kind of indirection via a variable too
since I'm not sure OE-Core knows anything about RUNTIME, or that
RUNTIME is a particularly good choice of name for the core.

Cheers,

Richard

