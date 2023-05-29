Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B26C77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 12:38:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.48649.1685363899147724702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 05:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=dv2TMHZ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3078cc99232so3021044f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685363897; x=1687955897;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z9mHd2EOT8+YPg4gL04p6LDbt+x78sKXJ2rTSj3V1Eo=;
        b=dv2TMHZ8YAWsK8QjUuL3fnYVWm02lEgWkFCy2hvtC1QAIzxSRXrQO2eUWhRLcvYcUK
         oroidfpxGVH0R4N9zXxP4C8oJkC+zlIy6pdbAvKc2uBxrkcftBnrR3QGmRvt7VU0Mldn
         sd3r5gsfFY+ja1C21xe83fNZoQ8+tmUy4h1No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685363897; x=1687955897;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9mHd2EOT8+YPg4gL04p6LDbt+x78sKXJ2rTSj3V1Eo=;
        b=bGPo4mbM7RyGw4SgZr8I0rlPCcW30qxWSFVhWaJWk6HQ7HThBlM/Pj3MIIpbenP2JA
         9blpkMVYnxRsQU7eTTXW5vnHr9lpFCvry/nIVT0CNZHL5cLqxuISQuio+i0yAsbpJKCy
         Dmy8sty6vBu/uJ5oGBZUvj4RyrScJ/LzZxiV3HoGtCnqv8faON5tv0+vrVlFYafNYHqd
         b/M07cW36opa1lq5lnfr9FbbyMtagsXBsEnDuCPPuSwlj1Nl85JniUXNNRJO8bCaXA7L
         8U6jbBChGcWo4vTlT8TqkU2mED0dwYBLZmYmu/KgwJdIo78IgvRi2e9Nc/DqETGiJOPf
         wIBw==
X-Gm-Message-State: AC+VfDxgeTsc7c1l9KNG96yBVsVgEL41muUmTtSQ0Pzd/UHIjV6IjUHI
	A9OkirRk9z6kCq8uozWsHsoNJA==
X-Google-Smtp-Source: ACHHUZ5cmN84ZiECAX8M1Tj6//vS93ZKON3SMh800kgw3M+cqG065LhL4oFEljvy4+nAlTrP1eCxGg==
X-Received: by 2002:a5d:6b86:0:b0:30a:d867:da29 with SMTP id n6-20020a5d6b86000000b0030ad867da29mr7867542wrx.33.1685363897451;
        Mon, 29 May 2023 05:38:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5? ([2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d488c000000b003090cb7a9e6sm13632050wrq.31.2023.05.29.05.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 05:38:17 -0700 (PDT)
Message-ID: <435dba03674dadc42184c498673863f7b0e4cf4c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Cargo: build failure on 32-bit machine when
 DEBUG enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com, 
	shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com, 
	deepthi.hemraj@windriver.com, umesh.kalappa0@gmail.com
Date: Mon, 29 May 2023 13:38:16 +0100
In-Reply-To: <20230529094211.756085-1-sundeep.kokkonda@gmail.com>
References: <20230529094211.756085-1-sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 12:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181871

On Mon, 2023-05-29 at 15:12 +0530, Sundeep KOKKONDA wrote:
> Cargo build is failing on 32-bit machines with a 'signal: 11, SIGSEGV: in=
valid memory reference error'.
> This is a workaround to disable the Debug builds for 32-bit machines.
>=20
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/classes-recipe/cargo.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
> index 7a8cc1e751..bc5ca4fdc6 100644
> --- a/meta/classes-recipe/cargo.bbclass
> +++ b/meta/classes-recipe/cargo.bbclass
> @@ -38,6 +38,11 @@ CARGO_SRC_DIR ??=3D ""
>  MANIFEST_PATH ??=3D "${S}/${CARGO_SRC_DIR}/Cargo.toml"
> =20
>  RUSTFLAGS ??=3D ""
> +DEBUG_BUILD:qemuarm =3D '0'
> +DEBUG_BUILD:qemuppc =3D '0'
> +DEBUG_BUILD:qemumips =3D '0'
> +DEBUG_BUILD:qemux86 =3D '0'
> +DEBUG_BUILD:virtclass-multilib-lib32 =3D '0'
>  BUILD_MODE =3D "${@['--release', ''][d.getVar('DEBUG_BUILD') =3D=3D '1']=
}"
>  CARGO_BUILD_FLAGS =3D "-v --offline --target ${RUST_HOST_SYS} ${BUILD_MO=
DE} --manifest-path=3D${MANIFEST_PATH}"
>=20

Whilst I understand the intent here, I'm not sure this is a good idea,
The reasons coming to mind are:

a) We don't set DEBUG_BUILD in OE-Core or do testing of that afaik
b) We should really be fixing cargo, not hacking around it
c) This "fixes" those machines but not any other 32 bit machine. Should
it be target-arch specific if we do want to do it?

Do we know why this is breaking?

Cheers,

Richard

