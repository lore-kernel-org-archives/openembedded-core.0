Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBBEC47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 06:13:00 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.7435.1709100772662110323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 22:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NAXfLnUr;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-21e63b586fcso3326208fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 22:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709100772; x=1709705572; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSEDtXZbPnljSPgBggJTYLKL5QghlG8tJh/H25bjY14=;
        b=NAXfLnUrllXRZoHbRnXKn7YfcZ2YIFiTLADzeu0bYsB239iXxzrMwnq4vmnVVoRtLQ
         GKZz8lyc3vwSjxMEUsbA/OFLGm4vLTupgHh11jrDqErLoZVPiTwtBEH5SulOg0t6RiwU
         c70CfrQxKsgupzQIsu/rbOku25HT4s7QdtCrEE+MrSzSU8QrXky5juHXPrMsAguWPzpd
         1Kp0eGeY+4SbK61lzFyCfm7+pBohePOKzBSDe/ahVAHYGgzqu6H+E+Nuz8ac8GMTuHT1
         D6wwFqWcw+lJIzkyFLFGqeGaEzVVN4IlMCd3S4yoNXzsnv2+M9BSJKOu2t1jJxTAaf+r
         saNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709100772; x=1709705572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSEDtXZbPnljSPgBggJTYLKL5QghlG8tJh/H25bjY14=;
        b=XYQyhLtp9d8c7FEvndRHzfy6c7G9O7frh/e6zjtOdoaXPBO4/ExhxI6JkxXfJ1zpT0
         2B9uT3vs6c60Aqfq/3cK+OjkX9qXvmMHOjfKYoDEuPa6Gz4Cc/feEjs3b6FCciNVVQ8T
         nwPhU/0yNQjvkeHfjpeBmxcYo99wN7E0AAbqctMoHYvYwGTXxczhnI/YJkPcYX7Xcv67
         qIvHUfXsB8wkSW7DsI8KgfLFoo6RPit7zKwbJjPRjoAcrl5PBgX7zMwqemVn7jb5k41v
         u2qJVQDyirR5BvmHI8GXe8cougP8BF/Drn2bzdxQ+DlIo4HQGdVwbODvbSGmn+d0LBGZ
         0VUg==
X-Gm-Message-State: AOJu0YyvDH0iLn02LPuPQ0uGxwB6yoRaxdhvH8J0kCM0ecCfGypWfgUP
	HgsaGHP/4TknBYJ5NBAfvqr5yFdvESaJA3ZiVU5Ne//5dw/o1xSx1WuIOL0cj07M77NeinrfYtW
	1xhjRLVlFL9CVzaPMk62lret6i1s=
X-Google-Smtp-Source: AGHT+IGFDSAc52ETbZWa8WhG5tj0DXTKuyeW/Yk73w25XmAWl4TvpCzTmjJxuaQTE2urRU4Dvp+UnRDi+tYmhtReQUs=
X-Received: by 2002:a05:6870:9589:b0:21f:d09e:b185 with SMTP id
 k9-20020a056870958900b0021fd09eb185mr12649194oao.42.1709100771731; Tue, 27
 Feb 2024 22:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20240227175138.2843184-1-raj.khem@gmail.com> <20240227175138.2843184-2-raj.khem@gmail.com>
 <CANx9H-CNxv1N+ETTxdNS9CvbHeYour_YHqfZ0bdpXEWt_yOveA@mail.gmail.com>
In-Reply-To: <CANx9H-CNxv1N+ETTxdNS9CvbHeYour_YHqfZ0bdpXEWt_yOveA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Feb 2024 22:12:25 -0800
Message-ID: <CAMKF1spwLU_weso0C5xRrgiKp_bEqGZ8ER1rQk_rVGaRtdSAJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] python3-cryptography: Update pyo3 crate
 to 0.20.3
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 06:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196322

On Tue, Feb 27, 2024 at 10:59=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wr=
ote:
>
>
>
> On Tue, Feb 27, 2024 at 9:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> This gets it building on architectures without 64bit atomics.
>>
>
> We could also upgrade to python3-cryptography 42.0.5
> https://cryptography.io/en/latest/changelog/#v42-0-5
> Do we want to do that at this stage?

upgrade to 42.0.5 will still need this patch regardless
since it will only be in next release, so update or not is orthogonal
to this issue.

>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../python/python3-cryptography-crates.inc    |  22 ++--
>>  ...m-0.20.2-to-0.20.3-in-src-rust-10462.patch | 105 ++++++++++++++++++
>>  .../python/python3-cryptography_42.0.2.bb     |   1 +
>>  3 files changed, 118 insertions(+), 10 deletions(-)
>>  create mode 100644 meta/recipes-devtools/python/python3-cryptography/00=
01-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch
>>
>> diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.in=
c b/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> index 4714c76bd2b..b26e22b70c3 100644
>> --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> @@ -25,12 +25,13 @@ SRC_URI +=3D " \
>>      crate://crates.io/parking_lot_core/0.9.9 \
>>      crate://crates.io/pem/3.0.3 \
>>      crate://crates.io/pkg-config/0.3.29 \
>> +    crate://crates.io/portable-atomic/1.6.0 \
>>      crate://crates.io/proc-macro2/1.0.78 \
>> -    crate://crates.io/pyo3/0.20.2 \
>> -    crate://crates.io/pyo3-build-config/0.20.2 \
>> -    crate://crates.io/pyo3-ffi/0.20.2 \
>> -    crate://crates.io/pyo3-macros/0.20.2 \
>> -    crate://crates.io/pyo3-macros-backend/0.20.2 \
>> +    crate://crates.io/pyo3/0.20.3 \
>> +    crate://crates.io/pyo3-build-config/0.20.3 \
>> +    crate://crates.io/pyo3-ffi/0.20.3 \
>> +    crate://crates.io/pyo3-macros/0.20.3 \
>> +    crate://crates.io/pyo3-macros-backend/0.20.3 \
>>      crate://crates.io/quote/1.0.35 \
>>      crate://crates.io/redox_syscall/0.4.1 \
>>      crate://crates.io/scopeguard/1.2.0 \
>> @@ -74,12 +75,13 @@ SRC_URI[parking_lot-0.12.1.sha256sum] =3D "3742b2c10=
3b9f06bc9fff0a37ff4912935851be
>>  SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D "4c42a9226546d68acdd9c0a2=
80d17ce19bfe27a46bf68784e4066115788d008e"
>>  SRC_URI[pem-3.0.3.sha256sum] =3D "1b8fcc794035347fb64beda2d3b462595dd27=
53e3f268d89c5aae77e8cf2c310"
>>  SRC_URI[pkg-config-0.3.29.sha256sum] =3D "2900ede94e305130c13ddd391e0ab=
7cbaeb783945ae07a279c268cb05109c6cb"
>> +SRC_URI[portable-atomic-1.6.0.sha256sum] =3D "7170ef9988bc169ba16dd36a7=
fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
>>  SRC_URI[proc-macro2-1.0.78.sha256sum] =3D "e2422ad645d89c99f8f3e6b88a9f=
deca7fabeac836b1002371c4367c8f984aae"
>> -SRC_URI[pyo3-0.20.2.sha256sum] =3D "9a89dc7a5850d0e983be1ec2a463a171d20=
990487c3cfcd68b5363f1ee3d6fe0"
>> -SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D "07426f0d8fe5a601f26293=
f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
>> -SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D "dbb7dec17e17766b46bca4f1a4215a8=
5006b4c2ecde122076c562dd058da6cf1"
>> -SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D "05f738b4e40d50b5711957f14287=
8cfa0f28e054aa0ebdfc3fd137a843f74ed3"
>> -SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D "0fc910d4851847827daf=
9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
>> +SRC_URI[pyo3-0.20.3.sha256sum] =3D "53bdbb96d49157e65d45cc287af5f32ffad=
d5f4761438b527b055fb0d4bb8233"
>> +SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D "deaa5745de3f5231ce1051=
7a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
>> +SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D "62b42531d03e08d4ef1f6e85a2ed422=
eb678b8cd62b762e53891c05faf0d4afa"
>> +SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D "7305c720fa01b8055ec95e484a6e=
ca7a83c841267f0dd5280f0c8b8551d2c158"
>> +SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D "7c7e9b68bb9c3149c5b0=
cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
>>  SRC_URI[quote-1.0.35.sha256sum] =3D "291ec9ab5efd934aaf503a6466c5d52515=
35d108ee747472c3977cc5acc868ef"
>>  SRC_URI[redox_syscall-0.4.1.sha256sum] =3D "4722d768eff46b75989dd134e5c=
353f0d6296e5aaa3132e776cbdb56be7731aa"
>>  SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59=
bce7498c01bcc1502d7b9afe439a4e9f49"
>> diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Bump=
-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch b/meta/recipes-devtools=
/python/python3-cryptography/0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-ru=
st-10462.patch
>> new file mode 100644
>> index 00000000000..33dd7ae5d5a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-f=
rom-0.20.2-to-0.20.3-in-src-rust-10462.patch
>> @@ -0,0 +1,105 @@
>> +From f6ec5ab18b5beacb08b0157c5193ea626b44b4e1 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 27 Feb 2024 09:30:15 -0800
>> +Subject: [PATCH] Bump pyo3 from 0.20.2 to 0.20.3 in /src/rust (#10462)
>> +
>> +It fixes build on hosts without 64bit atomics
>> +
>> +Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/=
3598d2ee4b5060dbbe6938b893410ed35074567c]
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + src/rust/Cargo.lock | 28 ++++++++++++++++++----------
>> + 1 file changed, 18 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/src/rust/Cargo.lock b/src/rust/Cargo.lock
>> +index b2e0ac4..030e38d 100644
>> +--- a/src/rust/Cargo.lock
>> ++++ b/src/rust/Cargo.lock
>> +@@ -263,6 +263,12 @@ version =3D "0.3.29"
>> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> + checksum =3D "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb0=
5109c6cb"
>> +
>> ++[[package]]
>> ++name =3D "portable-atomic"
>> ++version =3D "1.6.0"
>> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> ++checksum =3D "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded3=
71eae7c0"
>> ++
>> + [[package]]
>> + name =3D "proc-macro2"
>> + version =3D "1.0.78"
>> +@@ -274,15 +280,16 @@ dependencies =3D [
>> +
>> + [[package]]
>> + name =3D "pyo3"
>> +-version =3D "0.20.2"
>> ++version =3D "0.20.3"
>> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +-checksum =3D "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1=
ee3d6fe0"
>> ++checksum =3D "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0=
d4bb8233"
>> + dependencies =3D [
>> +  "cfg-if",
>> +  "indoc",
>> +  "libc",
>> +  "memoffset",
>> +  "parking_lot",
>> ++ "portable-atomic",
>> +  "pyo3-build-config",
>> +  "pyo3-ffi",
>> +  "pyo3-macros",
>> +@@ -291,9 +298,9 @@ dependencies =3D [
>> +
>> + [[package]]
>> + name =3D "pyo3-build-config"
>> +-version =3D "0.20.2"
>> ++version =3D "0.20.3"
>> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +-checksum =3D "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f3089=
3c5163be"
>> ++checksum =3D "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085=
831d48d7"
>> + dependencies =3D [
>> +  "once_cell",
>> +  "target-lexicon",
>> +@@ -301,9 +308,9 @@ dependencies =3D [
>> +
>> + [[package]]
>> + name =3D "pyo3-ffi"
>> +-version =3D "0.20.2"
>> ++version =3D "0.20.3"
>> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +-checksum =3D "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd0=
58da6cf1"
>> ++checksum =3D "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05f=
af0d4afa"
>> + dependencies =3D [
>> +  "libc",
>> +  "pyo3-build-config",
>> +@@ -311,9 +318,9 @@ dependencies =3D [
>> +
>> + [[package]]
>> + name =3D "pyo3-macros"
>> +-version =3D "0.20.2"
>> ++version =3D "0.20.3"
>> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +-checksum =3D "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a8=
43f74ed3"
>> ++checksum =3D "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b85=
51d2c158"
>> + dependencies =3D [
>> +  "proc-macro2",
>> +  "pyo3-macros-backend",
>> +@@ -323,12 +330,13 @@ dependencies =3D [
>> +
>> + [[package]]
>> + name =3D "pyo3-macros-backend"
>> +-version =3D "0.20.2"
>> ++version =3D "0.20.3"
>> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
>> +-checksum =3D "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da=
79e8881f"
>> ++checksum =3D "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665=
f1f96185"
>> + dependencies =3D [
>> +  "heck",
>> +  "proc-macro2",
>> ++ "pyo3-build-config",
>> +  "quote",
>> +  "syn",
>> + ]
>> +--
>> +2.44.0
>> +
>> diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb=
 b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
>> index c21c4d1a03b..da10e2e60c1 100644
>> --- a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
>> +++ b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
>> @@ -11,6 +11,7 @@ LDSHARED +=3D "-pthread"
>>  SRC_URI[sha256sum] =3D "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c=
93827c57eab6cf888"
>>
>>  SRC_URI +=3D "file://0001-pyproject.toml-remove-benchmark-disable-optio=
n.patch \
>> +            file://0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-104=
62.patch \
>>              file://check-memfree.py \
>>              file://run-ptest \
>>             "
>> --
>> 2.44.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#196287): https://lists.openembedded.org/g/openembedd=
ed-core/message/196287
>> Mute This Topic: https://lists.openembedded.org/mt/104607684/924729
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [t=
icotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

