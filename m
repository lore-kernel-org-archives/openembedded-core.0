Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8F9CCD184
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 08:09:38 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web10.10684.1760688573122840350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 01:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mJQ6ZxKe;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63cf0df1abbso1837336d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 01:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760688572; x=1761293372; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXnRHaaCEQHBlaF+H5WIXc/8TThPWT/21Xroz3MbIkE=;
        b=mJQ6ZxKeLTfrhBUMDFfWcOuPAFrh2nRykifUeYj/2PNwYMcP6YczhDhhOAOfkAFRDd
         MMEQE5B4mXD+egd6C+D7mQ5RfD8mra6H9MndpAWWy2pVgJbqBSO858VlHN8c1TDecbO+
         PZtk2rovL3RfMbEMO1ozaoKoQdT8QMUDhxqlUQwoFXdrZNLVZIRoBTWMEihh+Hr7JHml
         Of+1Mu2fdZggTIBTLAB/Gv0vl2qVsze3kLprTaAYpoQ9HBA2sM5Wvzv1zgboP2tgxusI
         9NJ7OLxE7pBFdGnKOl1Ws4UdzGabswAK/TPM6YnAyYG3zxNBPi+UPgoKQ3juvbBLuuMg
         E7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760688572; x=1761293372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXnRHaaCEQHBlaF+H5WIXc/8TThPWT/21Xroz3MbIkE=;
        b=Hf0LCREbhU/AG62UjsXhbf6Aq/+zM6LfklBtjMYpWtisSllq9lslWAYHLkoN3FwL45
         TP1cqWvXZ0SGPYoo8pHc4Ra7XE3kUcgqRiYgn9y15vuStzxTCierqXqIgxntHX091Acy
         83OCBS6fw0oA2QziXI+XdkxaSg+B58eBjpmaY8p4AZnslU4NfPA0/EP8MiZioDyzAr2P
         0smlGUenL1BCgpuwekW/DnosLBIf6boh80xuUIxDjBBbSJqJziYZAy7rklulK7+tv9Sd
         7DHPHUw5MqX2nE172aMRYvoTENNDmIzd2zRHsd53sLgGWk7u+0IdgqFFa2Wl8OLq7ZGP
         +yMg==
X-Gm-Message-State: AOJu0YygfRIoIbCXFAtZMzRmjgTyA+CyMkdM5r+rEzojnOnojNZSiDla
	9gVPQkq63PMP5UEfiI033FOxlb8GkFtBdC7ggLN/UJ9k2nY7Czf9albhueM85XZyeYfSXnEJA/r
	BXgzjaibhOg2tVSk8hImr3t8DO+SQRBXsdpfL
X-Gm-Gg: ASbGncum2oG7yp061F8z3+iKz+o6TqNSW7dJCJ8bN+fVcvzGws3vYuGp+k0SyQLxONl
	kc3pOVtmR2esskTgubC+KLDB6xS8Sr3+JbDLmsyb/fLRqDViqoOyIAPITCEsMqC7LN0kQGndm+E
	RGsl+eYV21PhBOLotPX8HJe3x/9XLj9LluUzdt46c5Dg/EvdUjUxMMPVjJ+FqGueS5u5VInpdrw
	Jr8/E3DTAR9Xj9dJlCB8Ov2AEUOPTnPUE/oX5qEF7eFAVoMVxLfOypG0ojYqmEJ7zdGxu20teeh
	3pkS7mq9n+qO1GcBWS6xQmcUYHybrILxnVkVWr4rs18kj6WV/m1H4j92pnFjEBbmk/IjTmQmgKK
	bW1kUGqr83rinKg==
X-Google-Smtp-Source: AGHT+IHLI0jU4tQepnSsXCwB3Z+WKijtaTEHZiB8M2LG4F3Gxopqd0QfFjvtcIRysHhMS4i31N9utky8aEGT/M5oaN0=
X-Received: by 2002:a05:690e:1a43:b0:63c:f5a6:f2e6 with SMTP id
 956f58d0204a3-63e16263d46mr2190884d50.56.1760688571843; Fri, 17 Oct 2025
 01:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251017064415.3029758-1-raj.khem@gmail.com>
In-Reply-To: <20251017064415.3029758-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Oct 2025 01:09:05 -0700
X-Gm-Features: AS18NWAGovTTegJ2mT26FlQRRdFy2gMmQ6cBJi2CN9fo6AP2u7iSf8TN2-bztLQ
Message-ID: <CAMKF1srZtJiU=8=6YKhtnseTU2HidvhSUMQK1VW=EU0KWUCVWA@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not use use-libcxx
To: openembedded-core@lists.openembedded.org
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 08:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225000

it needs another tweak for non-native builds, I will send a v2 later today

On Thu, Oct 16, 2025 at 11:44=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> use-libcxx is effective to use libcxx as standard
> C++ runtime with the llvm which is built internally
> with rust compiler, however, we have changed rust
> toolchain to use external llvm built with llvm-native
> so this option is not effective, moreover, it passes
> wrong expectation to rust compiler of C++ runtime
> and it ends up with mising symbol errors because it
> emits symbols to one c++ library (libc++) but it is
> linked with libstdc++ and vice versa
>
> Fixes
> x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-06cb1cc41094667b.so: =
undefined symbol: _ZTINSt13__future_base12_Result_baseE
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-devtools/rust/rust_1.90.0.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-dev=
tools/rust/rust_1.90.0.bb
> index 0319d73b930..b4fd690aab2 100644
> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
> @@ -126,8 +126,6 @@ python do_configure() {
>      config.add_section("llvm")
>      config.set("llvm", "static-libstdcpp", e(False))
>      config.set("llvm", "download-ci-llvm", e(False))
> -    if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
> -        config.set("llvm", "use-libcxx", e(True))
>
>      # [rust]
>      config.add_section("rust")

