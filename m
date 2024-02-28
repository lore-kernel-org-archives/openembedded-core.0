Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E34C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 16:15:26 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.728.1709136921519271242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 08:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YttixyS0;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-21e9589d4ffso3436891fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 08:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709136921; x=1709741721; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bIZs1lHCOAGaZrOK8OKl0trQTVs2HiMQe4bvkxXsg6E=;
        b=YttixyS00juS44K+0nf3vQSbI+uYug/dt8DnevFyw8BKWm1zlXMOLuULmt0513smQu
         VLtWot9ov/WAgLohRyFc0HJebnzXsPfMCzm38XL3nXOr4tvCC+YLE9B9e7ik6BVsztCP
         eE2jGUVP9JTZkketgB0DQvyFl0mwPs6QgmKEFkZyzGS4XWIjMuawarPFRJzV9fwJk7pF
         6eG8D9wr3eQ+TzKq38aCnFRdjsyT0SQZbTcwt6+tNoz8WhzgEc9LGQ9iiUn2Yb7dhGlT
         iKc1X0pQSIlcbirVbxEIcfV6x/IRUr2Wq9Nl27+2X0pWWxuDiU6j63rSQKWUG6faTGsP
         TxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136921; x=1709741721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIZs1lHCOAGaZrOK8OKl0trQTVs2HiMQe4bvkxXsg6E=;
        b=XPEr2HMwoLIrEzvNpQUUtDRM4OuOX1ZfaQZpuOf24hum4o6XSp3C0EkqBbZv1skSHG
         +2Nv7fv1N6Xudu3WjhrVcBV7AnswfSlJxUAoU6dG6vqOV2Yh3avBKhUTVnilCESV1tNr
         18hY/bAhxh27LuH1cnThxW9KjCWPpJ3LgUE4ZMQfsPFgZEhp7A+emJry49DR4ltLO7Mh
         D9JAF0VP/yiNDpz/foHa37YFExHMSLbo29DUQuKuOjTLc2nXAePv1P1Yp/Cj5/F0JFnv
         iQPbx4DT+XUsuqchWv8m/GVnWXR+DDmc4UxzieChFF+/7w5rZ8bnTLClDR7uSRWoq2Ov
         Cxkw==
X-Gm-Message-State: AOJu0YyNZ35WLD0N0AqtRK9EhdzH9WJm0vd5L8POxEtu3/Fw4AQMGw+h
	we6/4NEOb5VTtaB6Ex+UAdlgG0k1m0Ur6yg+4OYZrXwUe3RJC0Mln9BDo0roBl9irrR6xQ7DybH
	sab7VYSRWnzNc3vbnS7UH4Icdz8y9BkKuHmg=
X-Google-Smtp-Source: AGHT+IE5D999qUvxK97UyZbjcKN6F2D+jq8eBGppwoHuAFAXi3NJ2CHgoZtR+F17igFa/DVLYq3jxel4HPiSuTSMuuE=
X-Received: by 2002:a05:6870:cd8b:b0:21f:9f09:b0de with SMTP id
 xb11-20020a056870cd8b00b0021f9f09b0demr115384oab.41.1709136919168; Wed, 28
 Feb 2024 08:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20240227175138.2843184-1-raj.khem@gmail.com> <20240227175138.2843184-2-raj.khem@gmail.com>
 <CANx9H-CNxv1N+ETTxdNS9CvbHeYour_YHqfZ0bdpXEWt_yOveA@mail.gmail.com>
 <CAMKF1spwLU_weso0C5xRrgiKp_bEqGZ8ER1rQk_rVGaRtdSAJQ@mail.gmail.com> <CANx9H-AyVF1p1EQCimnrn3Y8BpcDc5yZGq_b95n2BDxPSemaGA@mail.gmail.com>
In-Reply-To: <CANx9H-AyVF1p1EQCimnrn3Y8BpcDc5yZGq_b95n2BDxPSemaGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Feb 2024 08:15:08 -0800
Message-ID: <CAMKF1spZMMwKUB6pHcha7vSH5Bc0vOmsaae_c1a-JKO0j4C69A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] python3-cryptography: Update pyo3 crate
 to 0.20.3
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f08c9b0612737251"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196394

--000000000000f08c9b0612737251
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No

On Wed, Feb 28, 2024 at 7:36=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wro=
te:

>
>
> On Tue, Feb 27, 2024 at 10:12=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>
>> On Tue, Feb 27, 2024 at 10:59=E2=80=AFAM Tim Orling <ticotimo@gmail.com>=
 wrote:
>> >
>> >
>> >
>> > On Tue, Feb 27, 2024 at 9:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
>> >>
>> >> This gets it building on architectures without 64bit atomics.
>> >>
>> >
>> > We could also upgrade to python3-cryptography 42.0.5
>> > https://cryptography.io/en/latest/changelog/#v42-0-5
>> > Do we want to do that at this stage?
>>
>> upgrade to 42.0.5 will still need this patch regardless
>> since it will only be in next release, so update or not is orthogonal
>> to this issue.
>>
>> The pyo3 upgrade was backported to 42.0.5
> https://github.com/pyca/cryptography/compare/42.0.2...42.0.5
>
> https://github.com/pyca/cryptography/commit/8e9de309f850a17409da5de39cfcd=
9296c25ea36
>
>

Nice I was looking at the trunk alone

>
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >>  .../python/python3-cryptography-crates.inc    |  22 ++--
>> >>  ...m-0.20.2-to-0.20.3-in-src-rust-10462.patch | 105 ++++++++++++++++=
++
>> >>  .../python/python3-cryptography_42.0.2.bb     |   1 +
>> >>  3 files changed, 118 insertions(+), 10 deletions(-)
>> >>  create mode 100644
>> meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-0.=
20.2-to-0.20.3-in-src-rust-10462.patch
>> >>
>> >> diff --git
>> a/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> b/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> >> index 4714c76bd2b..b26e22b70c3 100644
>> >> --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> >> +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> >> @@ -25,12 +25,13 @@ SRC_URI +=3D " \
>> >>      crate://crates.io/parking_lot_core/0.9.9 \
>> >>      crate://crates.io/pem/3.0.3 \
>> >>      crate://crates.io/pkg-config/0.3.29 \
>> >> +    crate://crates.io/portable-atomic/1.6.0 \
>> >>      crate://crates.io/proc-macro2/1.0.78 \
>> >> -    crate://crates.io/pyo3/0.20.2 \
>> >> -    crate://crates.io/pyo3-build-config/0.20.2 \
>> >> -    crate://crates.io/pyo3-ffi/0.20.2 \
>> >> -    crate://crates.io/pyo3-macros/0.20.2 \
>> >> -    crate://crates.io/pyo3-macros-backend/0.20.2 \
>> >> +    crate://crates.io/pyo3/0.20.3 \
>> >> +    crate://crates.io/pyo3-build-config/0.20.3 \
>> >> +    crate://crates.io/pyo3-ffi/0.20.3 \
>> >> +    crate://crates.io/pyo3-macros/0.20.3 \
>> >> +    crate://crates.io/pyo3-macros-backend/0.20.3 \
>> >>      crate://crates.io/quote/1.0.35 \
>> >>      crate://crates.io/redox_syscall/0.4.1 \
>> >>      crate://crates.io/scopeguard/1.2.0 \
>> >> @@ -74,12 +75,13 @@ SRC_URI[parking_lot-0.12.1.sha256sum] =3D
>> "3742b2c103b9f06bc9fff0a37ff4912935851be
>> >>  SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D
>> "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
>> >>  SRC_URI[pem-3.0.3.sha256sum] =3D
>> "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
>> >>  SRC_URI[pkg-config-0.3.29.sha256sum] =3D
>> "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
>> >> +SRC_URI[portable-atomic-1.6.0.sha256sum] =3D
>> "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
>> >>  SRC_URI[proc-macro2-1.0.78.sha256sum] =3D
>> "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
>> >> -SRC_URI[pyo3-0.20.2.sha256sum] =3D
>> "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
>> >> -SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D
>> "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
>> >> -SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D
>> "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
>> >> -SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D
>> "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
>> >> -SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D
>> "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
>> >> +SRC_URI[pyo3-0.20.3.sha256sum] =3D
>> "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
>> >> +SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D
>> "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
>> >> +SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D
>> "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
>> >> +SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D
>> "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
>> >> +SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D
>> "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
>> >>  SRC_URI[quote-1.0.35.sha256sum] =3D
>> "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
>> >>  SRC_URI[redox_syscall-0.4.1.sha256sum] =3D
>> "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
>> >>  SRC_URI[scopeguard-1.2.0.sha256sum] =3D
>> "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
>> >> diff --git
>> a/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-=
0.20.2-to-0.20.3-in-src-rust-10462.patch
>> b/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-=
0.20.2-to-0.20.3-in-src-rust-10462.patch
>> >> new file mode 100644
>> >> index 00000000000..33dd7ae5d5a
>> >> --- /dev/null
>> >> +++
>> b/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-=
0.20.2-to-0.20.3-in-src-rust-10462.patch
>> >> @@ -0,0 +1,105 @@
>> >> +From f6ec5ab18b5beacb08b0157c5193ea626b44b4e1 Mon Sep 17 00:00:00 20=
01
>> >> +From: Khem Raj <raj.khem@gmail.com>
>> >> +Date: Tue, 27 Feb 2024 09:30:15 -0800
>> >> +Subject: [PATCH] Bump pyo3 from 0.20.2 to 0.20.3 in /src/rust (#1046=
2)
>> >> +
>> >> +It fixes build on hosts without 64bit atomics
>> >> +
>> >> +Upstream-Status: Backport [
>> https://github.com/pyca/cryptography/commit/3598d2ee4b5060dbbe6938b89341=
0ed35074567c
>> ]
>> >> +
>> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> +---
>> >> + src/rust/Cargo.lock | 28 ++++++++++++++++++----------
>> >> + 1 file changed, 18 insertions(+), 10 deletions(-)
>> >> +
>> >> +diff --git a/src/rust/Cargo.lock b/src/rust/Cargo.lock
>> >> +index b2e0ac4..030e38d 100644
>> >> +--- a/src/rust/Cargo.lock
>> >> ++++ b/src/rust/Cargo.lock
>> >> +@@ -263,6 +263,12 @@ version =3D "0.3.29"
>> >> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> >> + checksum =3D
>> "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
>> >> +
>> >> ++[[package]]
>> >> ++name =3D "portable-atomic"
>> >> ++version =3D "1.6.0"
>> >> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> >> ++checksum =3D
>> "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
>> >> ++
>> >> + [[package]]
>> >> + name =3D "proc-macro2"
>> >> + version =3D "1.0.78"
>> >> +@@ -274,15 +280,16 @@ dependencies =3D [
>> >> +
>> >> + [[package]]
>> >> + name =3D "pyo3"
>> >> +-version =3D "0.20.2"
>> >> ++version =3D "0.20.3"
>> >> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> >> +-checksum =3D
>> "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
>> >> ++checksum =3D
>> "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
>> >> + dependencies =3D [
>> >> +  "cfg-if",
>> >> +  "indoc",
>> >> +  "libc",
>> >> +  "memoffset",
>> >> +  "parking_lot",
>> >> ++ "portable-atomic",
>> >> +  "pyo3-build-config",
>> >> +  "pyo3-ffi",
>> >> +  "pyo3-macros",
>> >> +@@ -291,9 +298,9 @@ dependencies =3D [
>> >> +
>> >> + [[package]]
>> >> + name =3D "pyo3-build-config"
>> >> +-version =3D "0.20.2"
>> >> ++version =3D "0.20.3"
>> >> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> >> +-checksum =3D
>> "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
>> >> ++checksum =3D
>> "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
>> >> + dependencies =3D [
>> >> +  "once_cell",
>> >> +  "target-lexicon",
>> >> +@@ -301,9 +308,9 @@ dependencies =3D [
>> >> +
>> >> + [[package]]
>> >> + name =3D "pyo3-ffi"
>> >> +-version =3D "0.20.2"
>> >> ++version =3D "0.20.3"
>> >> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> >> +-checksum =3D
>> "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
>> >> ++checksum =3D
>> "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
>> >> + dependencies =3D [
>> >> +  "libc",
>> >> +  "pyo3-build-config",
>> >> +@@ -311,9 +318,9 @@ dependencies =3D [
>> >> +
>> >> + [[package]]
>> >> + name =3D "pyo3-macros"
>> >> +-version =3D "0.20.2"
>> >> ++version =3D "0.20.3"
>> >> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> >> +-checksum =3D
>> "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
>> >> ++checksum =3D
>> "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
>> >> + dependencies =3D [
>> >> +  "proc-macro2",
>> >> +  "pyo3-macros-backend",
>> >> +@@ -323,12 +330,13 @@ dependencies =3D [
>> >> +
>> >> + [[package]]
>> >> + name =3D "pyo3-macros-backend"
>> >> +-version =3D "0.20.2"
>> >> ++version =3D "0.20.3"
>> >> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> >> +-checksum =3D
>> "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
>> >> ++checksum =3D
>> "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
>> >> + dependencies =3D [
>> >> +  "heck",
>> >> +  "proc-macro2",
>> >> ++ "pyo3-build-config",
>> >> +  "quote",
>> >> +  "syn",
>> >> + ]
>> >> +--
>> >> +2.44.0
>> >> +
>> >> diff --git a/meta/recipes-devtools/python/
>> python3-cryptography_42.0.2.bb b/meta/recipes-devtools/python/
>> python3-cryptography_42.0.2.bb
>> >> index c21c4d1a03b..da10e2e60c1 100644
>> >> --- a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
>> >> +++ b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
>> >> @@ -11,6 +11,7 @@ LDSHARED +=3D "-pthread"
>> >>  SRC_URI[sha256sum] =3D
>> "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c93827c57eab6cf888"
>> >>
>> >>  SRC_URI +=3D
>> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
>> >> +
>> file://0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch \
>> >>              file://check-memfree.py \
>> >>              file://run-ptest \
>> >>             "
>> >> --
>> >> 2.44.0
>> >>
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#196287):
>> https://lists.openembedded.org/g/openembedded-core/message/196287
>> >> Mute This Topic: https://lists.openembedded.org/mt/104607684/924729
>> >> Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> [ticotimo@gmail.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>
>>
>

--000000000000f08c9b0612737251
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>No</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Feb 28, 2024 at 7:36=E2=80=AFAM Tim Orling &lt;<a href=
=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Feb 27, 2024 at 10:12=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Feb 27, 2024 at 10:59=
=E2=80=AFAM Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"=
_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Feb 27, 2024 at 9:51=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; This gets it building on architectures without 64bit atomics.<br>
&gt;&gt;<br>
&gt;<br>
&gt; We could also upgrade to python3-cryptography 42.0.5<br>
&gt; <a href=3D"https://cryptography.io/en/latest/changelog/#v42-0-5" rel=
=3D"noreferrer" target=3D"_blank">https://cryptography.io/en/latest/changel=
og/#v42-0-5</a><br>
&gt; Do we want to do that at this stage?<br>
<br>
upgrade to 42.0.5 will still need this patch regardless<br>
since it will only be in next release, so update or not is orthogonal<br>
to this issue.<br>
<br></blockquote><div>The pyo3 upgrade was backported to 42.0.5</div><div><=
a href=3D"https://github.com/pyca/cryptography/compare/42.0.2...42.0.5" tar=
get=3D"_blank">https://github.com/pyca/cryptography/compare/42.0.2...42.0.5=
</a></div><div><a href=3D"https://github.com/pyca/cryptography/commit/8e9de=
309f850a17409da5de39cfcd9296c25ea36" target=3D"_blank">https://github.com/p=
yca/cryptography/commit/8e9de309f850a17409da5de39cfcd9296c25ea36</a></div><=
/div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div></d=
iv></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Nice I =
was looking at the trunk alone=C2=A0</div><div dir=3D"auto"><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div =
dir=3D"auto"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../python/python3-cryptography-crates.inc=C2=A0 =C2=A0 |=C2=
=A0 22 ++--<br>
&gt;&gt;=C2=A0 ...m-0.20.2-to-0.20.3-in-src-rust-10462.patch | 105 ++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-cryptography_42.0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.2.bb</a>=C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 3 files changed, 118 insertions(+), 10 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-cryp=
tography/0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography-cra=
tes.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt;&gt; index 4714c76bd2b..b26e22b70c3 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc=
<br>
&gt;&gt; +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc=
<br>
&gt;&gt; @@ -25,12 +25,13 @@ SRC_URI +=3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lo=
t_core/0.9.9" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_co=
re/0.9.9</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.3"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pem/3.0.3</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config=
/0.3.29" rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.29</=
a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic=
/1.6.0" rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.6.=
0</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro=
2/1.0.78" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.78=
</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.2" re=
l=3D"noreferrer" target=3D"_blank">crates.io/pyo3/0.20.2</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-conf=
ig/0.20.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config=
/0.20.2</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.2</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.2=
0.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.2</a> =
\<br>
&gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-bac=
kend/0.20.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-bac=
kend/0.20.2</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/pyo3/0.20.3</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-conf=
ig/0.20.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config=
/0.20.3</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.3</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.2=
0.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.3</a> =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-bac=
kend/0.20.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-bac=
kend/0.20.3</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.=
35" rel=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.35</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_sysc=
all/0.4.1" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.4=
.1</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard=
/1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.2.0</a>=
 \<br>
&gt;&gt; @@ -74,12 +75,13 @@ SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quo=
t;3742b2c103b9f06bc9fff0a37ff4912935851be<br>
&gt;&gt;=C2=A0 SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D &quot;4c42a922=
6546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[pem-3.0.3.sha256sum] =3D &quot;1b8fcc794035347fb64be=
da2d3b462595dd2753e3f268d89c5aae77e8cf2c310&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[pkg-config-0.3.29.sha256sum] =3D &quot;2900ede94e305=
130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb&quot;<br>
&gt;&gt; +SRC_URI[portable-atomic-1.6.0.sha256sum] =3D &quot;7170ef9988bc16=
9ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[proc-macro2-1.0.78.sha256sum] =3D &quot;e2422ad645d8=
9c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae&quot;<br>
&gt;&gt; -SRC_URI[pyo3-0.20.2.sha256sum] =3D &quot;9a89dc7a5850d0e983be1ec2=
a463a171d20990487c3cfcd68b5363f1ee3d6fe0&quot;<br>
&gt;&gt; -SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D &quot;07426f0d8fe=
5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be&quot;<br>
&gt;&gt; -SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D &quot;dbb7dec17e17766b46bc=
a4f1a4215a85006b4c2ecde122076c562dd058da6cf1&quot;<br>
&gt;&gt; -SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D &quot;05f738b4e40d50b57=
11957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3&quot;<br>
&gt;&gt; -SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D &quot;0fc910d48=
51847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f&quot;<br>
&gt;&gt; +SRC_URI[pyo3-0.20.3.sha256sum] =3D &quot;53bdbb96d49157e65d45cc28=
7af5f32ffadd5f4761438b527b055fb0d4bb8233&quot;<br>
&gt;&gt; +SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D &quot;deaa5745de3=
f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7&quot;<br>
&gt;&gt; +SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D &quot;62b42531d03e08d4ef1f=
6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa&quot;<br>
&gt;&gt; +SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D &quot;7305c720fa01b8055=
ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158&quot;<br>
&gt;&gt; +SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D &quot;7c7e9b68b=
b9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[quote-1.0.35.sha256sum] =3D &quot;291ec9ab5efd934aaf=
503a6466c5d5251535d108ee747472c3977cc5acc868ef&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[redox_syscall-0.4.1.sha256sum] =3D &quot;4722d768eff=
46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[scopeguard-1.2.0.sha256sum] =3D &quot;94143f37725109=
f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49&quot;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography/000=
1-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch b/meta/recipes-de=
vtools/python/python3-cryptography/0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-=
src-rust-10462.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000000..33dd7ae5d5a<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-devtools/python/python3-cryptography/0001-Bump-=
pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch<br>
&gt;&gt; @@ -0,0 +1,105 @@<br>
&gt;&gt; +From f6ec5ab18b5beacb08b0157c5193ea626b44b4e1 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +Date: Tue, 27 Feb 2024 09:30:15 -0800<br>
&gt;&gt; +Subject: [PATCH] Bump pyo3 from 0.20.2 to 0.20.3 in /src/rust (#1=
0462)<br>
&gt;&gt; +<br>
&gt;&gt; +It fixes build on hosts without 64bit atomics<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/pyca/cry=
ptography/commit/3598d2ee4b5060dbbe6938b893410ed35074567c" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/pyca/cryptography/commit/3598d2ee4b=
5060dbbe6938b893410ed35074567c</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/rust/Cargo.lock | 28 ++++++++++++++++++----------<br>
&gt;&gt; + 1 file changed, 18 insertions(+), 10 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/rust/Cargo.lock b/src/rust/Cargo.lock<br>
&gt;&gt; +index b2e0ac4..030e38d 100644<br>
&gt;&gt; +--- a/src/rust/Cargo.lock<br>
&gt;&gt; ++++ b/src/rust/Cargo.lock<br>
&gt;&gt; +@@ -263,6 +263,12 @@ version =3D &quot;0.3.29&quot;<br>
&gt;&gt; + source =3D &quot;registry+<a href=3D"https://github.com/rust-lan=
g/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; + checksum =3D &quot;2900ede94e305130c13ddd391e0ab7cbaeb783945ae07=
a279c268cb05109c6cb&quot;<br>
&gt;&gt; +<br>
&gt;&gt; ++[[package]]<br>
&gt;&gt; ++name =3D &quot;portable-atomic&quot;<br>
&gt;&gt; ++version =3D &quot;1.6.0&quot;<br>
&gt;&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lan=
g/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; ++checksum =3D &quot;7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76=
d4c03daded371eae7c0&quot;<br>
&gt;&gt; ++<br>
&gt;&gt; + [[package]]<br>
&gt;&gt; + name =3D &quot;proc-macro2&quot;<br>
&gt;&gt; + version =3D &quot;1.0.78&quot;<br>
&gt;&gt; +@@ -274,15 +280,16 @@ dependencies =3D [<br>
&gt;&gt; +<br>
&gt;&gt; + [[package]]<br>
&gt;&gt; + name =3D &quot;pyo3&quot;<br>
&gt;&gt; +-version =3D &quot;0.20.2&quot;<br>
&gt;&gt; ++version =3D &quot;0.20.3&quot;<br>
&gt;&gt; + source =3D &quot;registry+<a href=3D"https://github.com/rust-lan=
g/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; +-checksum =3D &quot;9a89dc7a5850d0e983be1ec2a463a171d20990487c3cf=
cd68b5363f1ee3d6fe0&quot;<br>
&gt;&gt; ++checksum =3D &quot;53bdbb96d49157e65d45cc287af5f32ffadd5f4761438=
b527b055fb0d4bb8233&quot;<br>
&gt;&gt; + dependencies =3D [<br>
&gt;&gt; +=C2=A0 &quot;cfg-if&quot;,<br>
&gt;&gt; +=C2=A0 &quot;indoc&quot;,<br>
&gt;&gt; +=C2=A0 &quot;libc&quot;,<br>
&gt;&gt; +=C2=A0 &quot;memoffset&quot;,<br>
&gt;&gt; +=C2=A0 &quot;parking_lot&quot;,<br>
&gt;&gt; ++ &quot;portable-atomic&quot;,<br>
&gt;&gt; +=C2=A0 &quot;pyo3-build-config&quot;,<br>
&gt;&gt; +=C2=A0 &quot;pyo3-ffi&quot;,<br>
&gt;&gt; +=C2=A0 &quot;pyo3-macros&quot;,<br>
&gt;&gt; +@@ -291,9 +298,9 @@ dependencies =3D [<br>
&gt;&gt; +<br>
&gt;&gt; + [[package]]<br>
&gt;&gt; + name =3D &quot;pyo3-build-config&quot;<br>
&gt;&gt; +-version =3D &quot;0.20.2&quot;<br>
&gt;&gt; ++version =3D &quot;0.20.3&quot;<br>
&gt;&gt; + source =3D &quot;registry+<a href=3D"https://github.com/rust-lan=
g/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; +-checksum =3D &quot;07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a70=
5870c5f30893c5163be&quot;<br>
&gt;&gt; ++checksum =3D &quot;deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6=
b5842292085831d48d7&quot;<br>
&gt;&gt; + dependencies =3D [<br>
&gt;&gt; +=C2=A0 &quot;once_cell&quot;,<br>
&gt;&gt; +=C2=A0 &quot;target-lexicon&quot;,<br>
&gt;&gt; +@@ -301,9 +308,9 @@ dependencies =3D [<br>
&gt;&gt; +<br>
&gt;&gt; + [[package]]<br>
&gt;&gt; + name =3D &quot;pyo3-ffi&quot;<br>
&gt;&gt; +-version =3D &quot;0.20.2&quot;<br>
&gt;&gt; ++version =3D &quot;0.20.3&quot;<br>
&gt;&gt; + source =3D &quot;registry+<a href=3D"https://github.com/rust-lan=
g/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; +-checksum =3D &quot;dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde12=
2076c562dd058da6cf1&quot;<br>
&gt;&gt; ++checksum =3D &quot;62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b76=
2e53891c05faf0d4afa&quot;<br>
&gt;&gt; + dependencies =3D [<br>
&gt;&gt; +=C2=A0 &quot;libc&quot;,<br>
&gt;&gt; +=C2=A0 &quot;pyo3-build-config&quot;,<br>
&gt;&gt; +@@ -311,9 +318,9 @@ dependencies =3D [<br>
&gt;&gt; +<br>
&gt;&gt; + [[package]]<br>
&gt;&gt; + name =3D &quot;pyo3-macros&quot;<br>
&gt;&gt; +-version =3D &quot;0.20.2&quot;<br>
&gt;&gt; ++version =3D &quot;0.20.3&quot;<br>
&gt;&gt; + source =3D &quot;registry+<a href=3D"https://github.com/rust-lan=
g/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; +-checksum =3D &quot;05f738b4e40d50b5711957f142878cfa0f28e054aa0eb=
dfc3fd137a843f74ed3&quot;<br>
&gt;&gt; ++checksum =3D &quot;7305c720fa01b8055ec95e484a6eca7a83c841267f0dd=
5280f0c8b8551d2c158&quot;<br>
&gt;&gt; + dependencies =3D [<br>
&gt;&gt; +=C2=A0 &quot;proc-macro2&quot;,<br>
&gt;&gt; +=C2=A0 &quot;pyo3-macros-backend&quot;,<br>
&gt;&gt; +@@ -323,12 +330,13 @@ dependencies =3D [<br>
&gt;&gt; +<br>
&gt;&gt; + [[package]]<br>
&gt;&gt; + name =3D &quot;pyo3-macros-backend&quot;<br>
&gt;&gt; +-version =3D &quot;0.20.2&quot;<br>
&gt;&gt; ++version =3D &quot;0.20.3&quot;<br>
&gt;&gt; + source =3D &quot;registry+<a href=3D"https://github.com/rust-lan=
g/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rust-lang/crates.io-index</a>&quot;<br>
&gt;&gt; +-checksum =3D &quot;0fc910d4851847827daf9d6cdd4a823fbdaab5b881832=
5c5e97a86da79e8881f&quot;<br>
&gt;&gt; ++checksum =3D &quot;7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb43377=
23c4ccdb665f1f96185&quot;<br>
&gt;&gt; + dependencies =3D [<br>
&gt;&gt; +=C2=A0 &quot;heck&quot;,<br>
&gt;&gt; +=C2=A0 &quot;proc-macro2&quot;,<br>
&gt;&gt; ++ &quot;pyo3-build-config&quot;,<br>
&gt;&gt; +=C2=A0 &quot;quote&quot;,<br>
&gt;&gt; +=C2=A0 &quot;syn&quot;,<br>
&gt;&gt; + ]<br>
&gt;&gt; +--<br>
&gt;&gt; +2.44.0<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python=
3-cryptography_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryp=
tography_42.0.2.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-cryptography_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-c=
ryptography_42.0.2.bb</a><br>
&gt;&gt; index c21c4d1a03b..da10e2e60c1 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-crypt=
ography_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograph=
y_42.0.2.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-crypt=
ography_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograph=
y_42.0.2.bb</a><br>
&gt;&gt; @@ -11,6 +11,7 @@ LDSHARED +=3D &quot;-pthread&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;e0ec52ba3c7f1b7d813cd52649a5b3e=
f1fc0d433219dc8c93827c57eab6cf888&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchma=
rk-disable-option.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Bump-pyo3-f=
rom-0.20.2-to-0.20.3-in-src-rust-10462.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://check-memfr=
ee.py \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.44.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#196287): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/196287" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/196287</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1046=
07684/924729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/104607684/924729</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.co=
m" target=3D"_blank">ticotimo@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000f08c9b0612737251--

