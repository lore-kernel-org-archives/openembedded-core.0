Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229AECDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:37:20 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.5596.1697092633477182889
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 23:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ai1YOw+4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-405524e6768so6698425e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 23:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697092632; x=1697697432; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qx6TWW8JpLYuzVZtTGm6Ydu88lRbCU2yg0cQUM0Np70=;
        b=ai1YOw+43fc3oBnN2cMWU/4m6uCsbm+ShNt3DqAXmp60LsDRvkyk61+IKSGGE9U/j4
         D/eVmcpZnM9HRNyAzBH040cRjnBR/9eRZrokxfXL0zYp7fgo6ELdQJm9WajMYRpyN+5N
         y31KvnBzNbQynNuUKVPK6Zr/qtM9Nvt30IAUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697092632; x=1697697432;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qx6TWW8JpLYuzVZtTGm6Ydu88lRbCU2yg0cQUM0Np70=;
        b=pA2BsgaJL3cH1NiCDVn4des8l0sxRIe3xM44YZrBj7hBDTvG1S50KqJO1t3OgeBVzR
         6wP7iuwKaSty+rMvGObdJPXOY1WlZ2HM4zkqXsbr9bjwxKaFzXpWpgS/s40mqizd6pZQ
         58RCByZZ2D1imKLZaDlbcfcrnnJ18GX0uOdOrcpsy0uMBYqsMGwDrVAf3HXae1zLmRrG
         mMKRSg+CY9AykJDVNySBCF+GMMgzRMG/pJItgiMkK65IA5vnHWNRovONDYDXyLpPAXPP
         CLy3dwjvYR5j+h1g07gXs8IaMK7wTgTAoz1cy9xPnWGX3xjuz2lZiq+gsX/hwXbINdAg
         3FLQ==
X-Gm-Message-State: AOJu0YwzmFZyxpq3EdzSoYZrU7EvJvhmB6+nBrjnkW//Qzbz6/QbFewW
	bwCuKbc1zlpp8k1QPQwhHDKb880D0fpTBncCKKQ=
X-Google-Smtp-Source: AGHT+IE3ek1OXehom/+fxqyEdCMHuxN+eHfqlec8bKX10Vh4mTEe0WN/vz6ZfIfyqJhDBNPCQlEoaw==
X-Received: by 2002:a05:600c:1d22:b0:407:4993:984c with SMTP id l34-20020a05600c1d2200b004074993984cmr10082065wms.30.1697092631504;
        Wed, 11 Oct 2023 23:37:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:37b5:155b:a41f:f969? ([2001:8b0:aba:5f3c:37b5:155b:a41f:f969])
        by smtp.gmail.com with ESMTPSA id k10-20020a7bc40a000000b003fc06169ab3sm20888030wmi.20.2023.10.11.23.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:37:11 -0700 (PDT)
Message-ID: <e2333d489d4c3ae944331ab813a1b2514c776bc3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: reproducibility issue fix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com, 
	shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com, 
	deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com
Date: Thu, 12 Oct 2023 07:37:10 +0100
In-Reply-To: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
References: <20231011040550.1392831-1-sundeep.kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188988

On Tue, 2023-10-10 at 21:05 -0700, Sundeep KOKKONDA via
lists.openembedded.org wrote:
> [Yocto#14875]
> The '--remap-path-prefix' option removes all references to build director=
y structure in the debug information within the compiled output for Cargo d=
ependencies and the project's binary.
> However, some references to build directories remains in the final binary=
 in .rustc section in the form of compressed metadata and this makes the bu=
ild output dependent on the folder structure of the computer it's compiled =
on.
> So, for reproducible builds, use the configuration option 'remap-debuginf=
o =3D true' along with the '--remap-path-prefix'.
>=20
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
>  meta/recipes-devtools/rust/rust_1.70.0.bb    | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa=
/selftest/cases/reproducible.py
> index 84c6c3a05f..9b4a0887dd 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -16,8 +16,6 @@ import os
>  import datetime
> =20
>  exclude_packages =3D [
> -	'rust',
> -	'rust-dbg'
>  	]
> =20
>  def is_excluded(package):
> diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-dev=
tools/rust/rust_1.70.0.bb
> index 3b9c05a19f..16d433910f 100644
> --- a/meta/recipes-devtools/rust/rust_1.70.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
> @@ -130,6 +130,7 @@ python do_configure() {
>      # [rust]
>      config.add_section("rust")
>      config.set("rust", "rpath", e(True))
> +    config.set("rust", "remap-debuginfo", e(True))
>      config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
> =20
>      # Whether or not to optimize the compiler and standard library

Unfortunately I have some less good news, the rust reproducibility
tests do still have some kind of failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3736/ste=
ps/12/logs/stdio

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231011-7wbq1sy=
l/packages/diff-html/

This is a bit different to the previous issue since the rlib files are
not changing and this is rustdoc. At a quick glance, it looks like the
symbols are changing order in the file, which can sometimes be caused
by the link command not being in the same order on all builds. This
could be for example something doing:

$LD *.so

and hence the order of the linked objects depends on the order of the
files on disk and which order glob found them in. It could also be
something else.

So we've made great progress and this will help our SPDX issues as the
filenames are now consistent but we're not quite there yet I'm afraid.
Unless we can find it quickly we'll have to put rust back on the
exclusion list for the release.

Cheers,

Richard


