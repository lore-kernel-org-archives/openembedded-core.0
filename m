Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133F6CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 09:24:48 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.39122.1760347478386558397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 02:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dfyfyf8g;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-36295d53a10so31688731fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 02:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760347476; x=1760952276; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZw7lMwssnFdtMj95HK4Y1M5TO2zDU/z2A8qmNB1p9A=;
        b=dfyfyf8gjgBmjmz4vrxHcQqR0fUEQwh131d0UPSa9OFHOMLzRkax0vztAv+aSZLS+1
         D/L8uK5nkAqHt25IOohgl8iJFTlIYp96NsnBWbCHjc0InfYhmucfztNCnLVe789htmYy
         SfOrYLsk9UOETjexf5ZkxwLuNVxVJ/gPkQesw5cnN6VLQY+PIWon6voCmxVOEW2GsvmD
         mplrbtp15rE/z/UGpuAoqYG/09bQVTJEvUuR+ym2zsc3iMZFcYACTL8mZa4TZWkTuiNR
         76fiOvpUrK50gJ5nckoda8KQrM5kZwldUOSUsJ0ZwskWVmarbQqpj2As0aSGzPVg6FWC
         I+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347476; x=1760952276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZw7lMwssnFdtMj95HK4Y1M5TO2zDU/z2A8qmNB1p9A=;
        b=bzc81nqqBB6fsevTJAfZbYkXmJMwIwduk2v1us5SUHJthJs9lHPmXfhsHTrG2S/TpY
         9nm/7xt9+BZ3WDoGjFzNooHSda6NkQfv2NlOO5TZprFl/2hus3hOu1CEXgjdMY3EMhXz
         ShyEYj4GiSX8TDvyeoVoOyBIcEb1Mrn6ppNXoaizTJNe3CgV7IjLhpaA5LVg1pwqSqb6
         dQnrP7DcgPACa//aWqkoby41kZxW/SKr5F1wdH9O2QVKwNRYkEI4n4mUOZvaYWsPCfTb
         U2JjYmTTqhyh6R7IVfwgUZJMl6bIivaGmy7Y6BRRR7hPdptRYg2eQIs3UVQBp8tdXRel
         KAyQ==
X-Gm-Message-State: AOJu0YxOD1bo2rhBpd9wUap6t1xhD+hKdiLkLDwpzNbupfpWp2mk7sPH
	WDMyLTyQ1CnuWfMPFuDAshDde3Cze5R3qiRg9f2gRvo4kNhj2Y8xPDmoTBPshqW1WxkqDlr9CUp
	G8lyE0Ocee6i2/DH1y895B30tgC3j6tU=
X-Gm-Gg: ASbGnct7bZgNLXow+xFE6MR/FR4LwhBdvTPBP4Cumb2kcKlCvF53qZU9N+0xnV173Wg
	ez69WJ8wqLVeSFmJr9cAmH/eu8pr6FVlQRLKPTce54tX9djYzfLDDKt6Fv/JHa/2fG9oqJKYxMB
	zusjVESttgmpWcLJHy0CF+tqwSJmJjRXGLAOzUNQMSyuhNFnshowRhJSuZc0UisJhxWSgjA59hZ
	nrX9YaJv57YY6rr4NNV1nTZmmRqBqQIAV9Nv/k=
X-Google-Smtp-Source: AGHT+IHrwFs8BFPNIqO9W0MTV8RvFpD8Z2eSXVv/Ph20RhwuQp2cCih46hqGNxSa8DZAcGICjNIhn+ckn1gC/Mz0B4I=
X-Received: by 2002:a2e:bd0d:0:b0:336:5d33:c394 with SMTP id
 38308e7fff4ca-37609ea5185mr55248421fa.33.1760347476019; Mon, 13 Oct 2025
 02:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <7ce15619-5c6f-4f22-a0b8-aa7e84dc6bea@gmail.com>
In-Reply-To: <7ce15619-5c6f-4f22-a0b8-aa7e84dc6bea@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Oct 2025 11:24:24 +0200
X-Gm-Features: AS18NWAb7Eq7y-5-JZly9jck9gkqel51s4_QgVbSN0ifxbtYSm4gF1FhTBi_mrY
Message-ID: <CA+chaQdHpQTYWRPpxjHjqR754WbwSpSr7WEuY4u13kK7WdkDvg@mail.gmail.com>
Subject: Re: [OE-core] clang build regression
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 09:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224767

Don't you have something like:

PREFERRED_PROVIDER_llvm =3D "clang"
PREFERRED_PROVIDER_llvm-native =3D "clang-native"
PREFERRED_PROVIDER_nativesdk-llvm =3D "nativesdk-clang"
PROVIDES:pn-clang =3D "llvm"
PROVIDES:pn-clang-native =3D "llvm-native"
PROVIDES:pn-nativesdk-clang =3D "nativesdk-llvm"

somewhere in your build configuration? It was needed with older
meta-clang (to avoid building llvm twice), but it's not needed now and
causes the circular dependency like this.

Cheers,

On Mon, Oct 13, 2025 at 11:09=E2=80=AFAM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi,
>
> somewhere in commits 9dfd4f44d4..3fc1fa77da caused
> a build regression for clang-native:
>
> ERROR: Task
> virtual:native:/mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta=
/recipes-devtools/clang/clang_git.bb:do_collect_spdx_deps
> has circular dependency on
> virtual:native:/mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta=
/recipes-devtools/clang/clang_git.bb:do_create_spdx
> ERROR: Command execution failed: 1
>
> and for clang:
>
> ERROR: Task
> /mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtoo=
ls/clang/clang_git.bb:do_package
> has circular dependency on
> /mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtoo=
ls/clang/clang_git.bb:do_packagedata
> ERROR: Command execution failed: 1
>
> Using the preceding commit allows building these, i.e.:
>
> cd layers/openembedded-core
> git checkout -b work2 9dfd4f44d4f40e7926dc88cb564baa2345c2a24f
>
> git bisect lead to:
>
> commit 448f4a84cb22c380d97e069d0b98ddbe1cb8de18
> llvm: add recipe for just the LLVM libraries
> still allows starting to build clang-native, which eventually
> fails to link executables, due to libLLVM.so.21.1 being missing.
>
> commit d76dc362c8e18779cc4ddc6a778fb423c0e66a65
> clang: use llvm recipe
> already fails to start clang-native with the above
> circular dependency
>
> That leaves
> commit acc8c5c89c0f1bff3413d2301a65afd89bd0d9ff
> clang: globally disable build-time RPATHs for reproducibility
> as the last usable commit.
>
> I use meta-intel and MACHINE=3Dintel-corei7-64.
>
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224766): https://lists.openembedded.org/g/openembedde=
d-core/message/224766
> Mute This Topic: https://lists.openembedded.org/mt/115731404/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

