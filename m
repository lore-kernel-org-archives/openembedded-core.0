Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B103C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 21:28:14 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.26259.1706995687925215580
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 13:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pnd2Q/dX;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6f6d10ea9so1255521276.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 13:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706995687; x=1707600487; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F4CwUuaeWo8CoVykX2tTi4XGAOBOxsQAjqRFu1RZrsw=;
        b=Pnd2Q/dXh02jvd9+VmL9cXLwEumhYLQNrJZ2gfkDNdMO0aBnytdGPtCRwt+tdVa88v
         6EbWeKX02vkrq3cG+oQTYLJYcioM6u/jHDzofsUZ5CxSmw1XP/PkWGZji+Jq8FQY6p1g
         d346IGpulCLhOjc94e2Ic0lFKiFH3le3yFL0Yzyui9WylJWNsdq4+hxPcf/hAG89mwBj
         a9bNW6gEO6mIFGVYc0kHtliv2v0CDJvJusBsRPeDBDQ7eyp3WktpKW+RD5rvW9b5w2UO
         N2Zx7cisUSIbX62tHy1pjNg3hDIr59zey5czp6mkQMDVz1F4XnM7p5KKormfrssWmXer
         9SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706995687; x=1707600487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4CwUuaeWo8CoVykX2tTi4XGAOBOxsQAjqRFu1RZrsw=;
        b=c9iQLsZK+mF8oySgMmII5N5GORth8b02upj11UQx0wIFPFZcj7mL66UkrB9xCSBcvb
         C8Kc+S8ctEW4W+aUz5nGd6xlgsrOBW+8yClmu1VR1Jdz2217uumzn18KqH2OUqF8Iwsy
         RLIJV6wKY2RuOu5DMCDBDtLak9OGkXQl28CJ344vgaR8iHT4grpeuS2A2nmyq6jLk81i
         QhWRpyGgyxNlJQVTOflhSNgzybbcqQDmYgZAIf2mSDb92OtvwHWIRV7qH/E01vdHH/ar
         pMIoCAWuaKnC8bviRnaemUvDu8qhDWehiZ9vLI5RuynpPBKVEEAIaaCd6FVPbG63X2ZN
         IcGw==
X-Gm-Message-State: AOJu0Yypk3Ysp/Ul/Okac56AuCwdYJvyAqQlz3wkV4VNlb67tk7FS/I2
	RMt+1h5q+/hGlhFCXJLPwH/J7BdAsaLfpT5UWvTijgd7PQqwSHbKk/wwKLjZW99yeOAMXuu0HAk
	H/CTwttMws5Q3oZ75LyRwX0YYfOHblPm53eM=
X-Google-Smtp-Source: AGHT+IHd/FJeiFyxmwNKfyxYgJje5XjugTar7hI0JZjaNVZP7fyXGmJeSCX62NutRasYpJEISXANPPNWrUsd26Ov8v0=
X-Received: by 2002:a05:6902:2004:b0:dc6:bec9:2070 with SMTP id
 dh4-20020a056902200400b00dc6bec92070mr5694705ybb.64.1706995686730; Sat, 03
 Feb 2024 13:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20240202045933.3427847-1-tim.orling@konsulko.com> <CAMKF1srGgwi-SHJq3vsOXCJPn_qBSZBidCdTM0VTJNVWsgNsSA@mail.gmail.com>
In-Reply-To: <CAMKF1srGgwi-SHJq3vsOXCJPn_qBSZBidCdTM0VTJNVWsgNsSA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 3 Feb 2024 13:27:55 -0800
Message-ID: <CANx9H-AGYVB4as6J+2hWfHfC4b_tbbidBdBZbrYQ3Z+RAK0ySA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: upgrade 41.0.7 to 42.0.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000008a7533061080e7fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 21:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194862

--0000000000008a7533061080e7fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 3, 2024 at 1:07=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> This is failing ptests on musl/qemux86-64
>
>     Failed ptests:
>     {'python3-cryptography': 'START: ptest-runner\n'
>                              '2024-02-03T18:58\n'
>                              'Free memory: 3.899 GB\n'
>
> This means it is passing the check-memfree.py test, so that rules out OOM
(unless we need more than this...
one test case did fail for me and then passed when I used -smp 4 -m 8192


>
> '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n'
>                              'Testsuite summary\n'
>                              '# TOTAL: 0\n'
>                              '# PASS: 0\n'
>                              '# SKIP: 0\n'
>                              '# XFAIL: 0\n'
>                              '# FAIL: 0\n'
>                              '# XPASS: 0\n'
>                              '# ERROR: 0\n'
>                              '\n'
>                              'ERROR: Exit status is 2\n'
>                              'DURATION: 6\n'}
>
>     ptests which had no test results:
>     ['python3-cryptography']
>
> This makes it look like no ptests are even being detected? Is there any
other log info?


> On Thu, Feb 1, 2024 at 9:03=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wr=
ote:
> >
> > * Also upgrade python3-cryptography-vectors
> > * Drop patch for 9129, fixed upstream
> > * Refresh pyproject.toml --benchmark-disable patch
> > * Refresh -crates.inc
> >
> > Changes:
> > https://cryptography.io/en/latest/changelog/#v42-0-2
> > https://cryptography.io/en/latest/changelog/#v42-0-1
> > https://cryptography.io/en/latest/changelog/#v42-0-0
> > https://github.com/pyca/cryptography/compare/41.0.7...42.0.2
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> > All ptests pass for core-image-ptest-python3-cryptography on qemux86-64
> > with runqemu nographic kvm qemuparams=3D"-smp 4 -m 8192"
> > (one test failed with standard memory allocation)
> >
> >  .../python/python3-cryptography-crates.inc    | 170 ++++++++----------
> >  ...=3D> python3-cryptography-vectors_42.0.2.bb} |   2 +-
> >  ...-directory-when-cross-compiling-9129.patch |  52 ------
> >  ...toml-remove-benchmark-disable-option.patch |  22 ++-
> >  ....0.7.bb =3D> python3-cryptography_42.0.2.bb} |   3 +-
> >  5 files changed, 90 insertions(+), 159 deletions(-)
> >  rename meta/recipes-devtools/python/{
> python3-cryptography-vectors_41.0.7.bb =3D>
> python3-cryptography-vectors_42.0.2.bb} (91%)
> >  delete mode 100644
> meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-direct=
ory-when-cross-compiling-9129.patch
> >  rename meta/recipes-devtools/python/{python3-cryptography_41.0.7.bb =
=3D>
> python3-cryptography_42.0.2.bb} (92%)
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > index 3a5edaa3494..4714c76bd2b 100644
> > --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > @@ -2,113 +2,99 @@
> >
> >  # from src/rust/Cargo.lock
> >  SRC_URI +=3D " \
> > -    crate://crates.io/Inflector/0.11.4 \
> > -    crate://crates.io/aliasable/0.1.3 \
> > -    crate://crates.io/asn1/0.15.2 \
> > -    crate://crates.io/asn1_derive/0.15.2 \
> > +    crate://crates.io/asn1/0.15.5 \
> > +    crate://crates.io/asn1_derive/0.15.5 \
> >      crate://crates.io/autocfg/1.1.0 \
> > -    crate://crates.io/base64/0.13.1 \
> > +    crate://crates.io/base64/0.21.7 \
> >      crate://crates.io/bitflags/1.3.2 \
> > -    crate://crates.io/bitflags/2.4.1 \
> > -    crate://crates.io/cc/1.0.79 \
> > +    crate://crates.io/bitflags/2.4.2 \
> > +    crate://crates.io/cc/1.0.83 \
> >      crate://crates.io/cfg-if/1.0.0 \
> >      crate://crates.io/foreign-types/0.3.2 \
> >      crate://crates.io/foreign-types-shared/0.1.1 \
> > -    crate://crates.io/indoc/1.0.9 \
> > -    crate://crates.io/libc/0.2.144 \
> > -    crate://crates.io/lock_api/0.4.9 \
> > -    crate://crates.io/memoffset/0.8.0 \
> > -    crate://crates.io/once_cell/1.17.2 \
> > -    crate://crates.io/openssl/0.10.60 \
> > +    crate://crates.io/heck/0.4.1 \
> > +    crate://crates.io/indoc/2.0.4 \
> > +    crate://crates.io/libc/0.2.152 \
> > +    crate://crates.io/lock_api/0.4.11 \
> > +    crate://crates.io/memoffset/0.9.0 \
> > +    crate://crates.io/once_cell/1.19.0 \
> > +    crate://crates.io/openssl/0.10.63 \
> >      crate://crates.io/openssl-macros/0.1.1 \
> > -    crate://crates.io/openssl-sys/0.9.96 \
> > -    crate://crates.io/ouroboros/0.15.6 \
> > -    crate://crates.io/ouroboros_macro/0.15.6 \
> > +    crate://crates.io/openssl-sys/0.9.99 \
> >      crate://crates.io/parking_lot/0.12.1 \
> > -    crate://crates.io/parking_lot_core/0.9.7 \
> > -    crate://crates.io/pem/1.1.1 \
> > -    crate://crates.io/pkg-config/0.3.27 \
> > -    crate://crates.io/proc-macro-error/1.0.4 \
> > -    crate://crates.io/proc-macro-error-attr/1.0.4 \
> > -    crate://crates.io/proc-macro2/1.0.64 \
> > -    crate://crates.io/pyo3/0.18.3 \
> > -    crate://crates.io/pyo3-build-config/0.18.3 \
> > -    crate://crates.io/pyo3-ffi/0.18.3 \
> > -    crate://crates.io/pyo3-macros/0.18.3 \
> > -    crate://crates.io/pyo3-macros-backend/0.18.3 \
> > -    crate://crates.io/quote/1.0.28 \
> > -    crate://crates.io/redox_syscall/0.2.16 \
> > -    crate://crates.io/scopeguard/1.1.0 \
> > -    crate://crates.io/smallvec/1.10.0 \
> > -    crate://crates.io/syn/1.0.109 \
> > -    crate://crates.io/syn/2.0.18 \
> > -    crate://crates.io/target-lexicon/0.12.7 \
> > -    crate://crates.io/unicode-ident/1.0.9 \
> > -    crate://crates.io/unindent/0.1.11 \
> > +    crate://crates.io/parking_lot_core/0.9.9 \
> > +    crate://crates.io/pem/3.0.3 \
> > +    crate://crates.io/pkg-config/0.3.29 \
> > +    crate://crates.io/proc-macro2/1.0.78 \
> > +    crate://crates.io/pyo3/0.20.2 \
> > +    crate://crates.io/pyo3-build-config/0.20.2 \
> > +    crate://crates.io/pyo3-ffi/0.20.2 \
> > +    crate://crates.io/pyo3-macros/0.20.2 \
> > +    crate://crates.io/pyo3-macros-backend/0.20.2 \
> > +    crate://crates.io/quote/1.0.35 \
> > +    crate://crates.io/redox_syscall/0.4.1 \
> > +    crate://crates.io/scopeguard/1.2.0 \
> > +    crate://crates.io/self_cell/1.0.3 \
> > +    crate://crates.io/smallvec/1.13.1 \
> > +    crate://crates.io/syn/2.0.48 \
> > +    crate://crates.io/target-lexicon/0.12.13 \
> > +    crate://crates.io/unicode-ident/1.0.12 \
> > +    crate://crates.io/unindent/0.2.3 \
> >      crate://crates.io/vcpkg/0.2.15 \
> > -    crate://crates.io/version_check/0.9.4 \
> > -    crate://crates.io/windows-sys/0.45.0 \
> > -    crate://crates.io/windows-targets/0.42.2 \
> > -    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
> > -    crate://crates.io/windows_aarch64_msvc/0.42.2 \
> > -    crate://crates.io/windows_i686_gnu/0.42.2 \
> > -    crate://crates.io/windows_i686_msvc/0.42.2 \
> > -    crate://crates.io/windows_x86_64_gnu/0.42.2 \
> > -    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
> > -    crate://crates.io/windows_x86_64_msvc/0.42.2 \
> > +    crate://crates.io/windows-targets/0.48.5 \
> > +    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> > +    crate://crates.io/windows_aarch64_msvc/0.48.5 \
> > +    crate://crates.io/windows_i686_gnu/0.48.5 \
> > +    crate://crates.io/windows_i686_msvc/0.48.5 \
> > +    crate://crates.io/windows_x86_64_gnu/0.48.5 \
> > +    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> > +    crate://crates.io/windows_x86_64_msvc/0.48.5 \
> >  "
> >
> > -SRC_URI[Inflector-0.11.4.sha256sum] =3D
> "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
> > -SRC_URI[aliasable-0.1.3.sha256sum] =3D
> "250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd"
> > -SRC_URI[asn1-0.15.2.sha256sum] =3D
> "28c19b9324de5b815b6487e0f8098312791b09de0dbf3d5c2db1fe2d95bab973"
> > -SRC_URI[asn1_derive-0.15.2.sha256sum] =3D
> "a045c3ccad89f244a86bd1e6cf1a7bf645296e7692698b056399b6efd4639407"
> > +SRC_URI[asn1-0.15.5.sha256sum] =3D
> "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
> > +SRC_URI[asn1_derive-0.15.5.sha256sum] =3D
> "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
> >  SRC_URI[autocfg-1.1.0.sha256sum] =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > -SRC_URI[base64-0.13.1.sha256sum] =3D
> "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
> > +SRC_URI[base64-0.21.7.sha256sum] =3D
> "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
> >  SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> > -SRC_URI[bitflags-2.4.1.sha256sum] =3D
> "327762f6e5a765692301e5bb513e0d9fef63be86bbc14528052b1cd3e6f03e07"
> > -SRC_URI[cc-1.0.79.sha256sum] =3D
> "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
> > +SRC_URI[bitflags-2.4.2.sha256sum] =3D
> "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
> > +SRC_URI[cc-1.0.83.sha256sum] =3D
> "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
> >  SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> >  SRC_URI[foreign-types-0.3.2.sha256sum] =3D
> "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
> >  SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D
> "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
> > -SRC_URI[indoc-1.0.9.sha256sum] =3D
> "bfa799dd5ed20a7e349f3b4639aa80d74549c81716d9ec4f994c9b5815598306"
> > -SRC_URI[libc-0.2.144.sha256sum] =3D
> "2b00cc1c228a6782d0f076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1"
> > -SRC_URI[lock_api-0.4.9.sha256sum] =3D
> "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
> > -SRC_URI[memoffset-0.8.0.sha256sum] =3D
> "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
> > -SRC_URI[once_cell-1.17.2.sha256sum] =3D
> "9670a07f94779e00908f3e686eab508878ebb390ba6e604d3a284c00e8d0487b"
> > -SRC_URI[openssl-0.10.60.sha256sum] =3D
> "79a4c6c3a2b158f7f8f2a2fc5a969fa3a068df6fc9dbb4a43845436e3af7c800"
> > +SRC_URI[heck-0.4.1.sha256sum] =3D
> "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> > +SRC_URI[indoc-2.0.4.sha256sum] =3D
> "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
> > +SRC_URI[libc-0.2.152.sha256sum] =3D
> "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
> > +SRC_URI[lock_api-0.4.11.sha256sum] =3D
> "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
> > +SRC_URI[memoffset-0.9.0.sha256sum] =3D
> "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
> > +SRC_URI[once_cell-1.19.0.sha256sum] =3D
> "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
> > +SRC_URI[openssl-0.10.63.sha256sum] =3D
> "15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8"
> >  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D
> "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
> > -SRC_URI[openssl-sys-0.9.96.sha256sum] =3D
> "3812c071ba60da8b5677cc12bcb1d42989a65553772897a7e0355545a819838f"
> > -SRC_URI[ouroboros-0.15.6.sha256sum] =3D
> "e1358bd1558bd2a083fed428ffeda486fbfb323e698cdda7794259d592ca72db"
> > -SRC_URI[ouroboros_macro-0.15.6.sha256sum] =3D
> "5f7d21ccd03305a674437ee1248f3ab5d4b1db095cf1caf49f1713ddf61956b7"
> > +SRC_URI[openssl-sys-0.9.99.sha256sum] =3D
> "22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae"
> >  SRC_URI[parking_lot-0.12.1.sha256sum] =3D
> "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
> > -SRC_URI[parking_lot_core-0.9.7.sha256sum] =3D
> "9069cbb9f99e3a5083476ccb29ceb1de18b9118cafa53e90c9551235de2b9521"
> > -SRC_URI[pem-1.1.1.sha256sum] =3D
> "a8835c273a76a90455d7344889b0964598e3316e2a79ede8e36f16bdcf2228b8"
> > -SRC_URI[pkg-config-0.3.27.sha256sum] =3D
> "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964"
> > -SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D
> "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
> > -SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] =3D
> "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
> > -SRC_URI[proc-macro2-1.0.64.sha256sum] =3D
> "78803b62cbf1f46fde80d7c0e803111524b9877184cfe7c3033659490ac7a7da"
> > -SRC_URI[pyo3-0.18.3.sha256sum] =3D
> "e3b1ac5b3731ba34fdaa9785f8d74d17448cd18f30cf19e0c7e7b1fdb5272109"
> > -SRC_URI[pyo3-build-config-0.18.3.sha256sum] =3D
> "9cb946f5ac61bb61a5014924910d936ebd2b23b705f7a4a3c40b05c720b079a3"
> > -SRC_URI[pyo3-ffi-0.18.3.sha256sum] =3D
> "fd4d7c5337821916ea2a1d21d1092e8443cf34879e53a0ac653fbb98f44ff65c"
> > -SRC_URI[pyo3-macros-0.18.3.sha256sum] =3D
> "a9d39c55dab3fc5a4b25bbd1ac10a2da452c4aca13bb450f22818a002e29648d"
> > -SRC_URI[pyo3-macros-backend-0.18.3.sha256sum] =3D
> "97daff08a4c48320587b5224cc98d609e3c27b6d437315bd40b605c98eeb5918"
> > -SRC_URI[quote-1.0.28.sha256sum] =3D
> "1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488"
> > -SRC_URI[redox_syscall-0.2.16.sha256sum] =3D
> "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
> > -SRC_URI[scopeguard-1.1.0.sha256sum] =3D
> "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
> > -SRC_URI[smallvec-1.10.0.sha256sum] =3D
> "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
> > -SRC_URI[syn-1.0.109.sha256sum] =3D
> "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
> > -SRC_URI[syn-2.0.18.sha256sum] =3D
> "32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e"
> > -SRC_URI[target-lexicon-0.12.7.sha256sum] =3D
> "fd1ba337640d60c3e96bc6f0638a939b9c9a7f2c316a1598c279828b3d1dc8c5"
> > -SRC_URI[unicode-ident-1.0.9.sha256sum] =3D
> "b15811caf2415fb889178633e7724bad2509101cde276048e013b9def5e51fa0"
> > -SRC_URI[unindent-0.1.11.sha256sum] =3D
> "e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c"
> > +SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D
> "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
> > +SRC_URI[pem-3.0.3.sha256sum] =3D
> "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
> > +SRC_URI[pkg-config-0.3.29.sha256sum] =3D
> "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
> > +SRC_URI[proc-macro2-1.0.78.sha256sum] =3D
> "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
> > +SRC_URI[pyo3-0.20.2.sha256sum] =3D
> "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
> > +SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D
> "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
> > +SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D
> "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
> > +SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D
> "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
> > +SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D
> "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
> > +SRC_URI[quote-1.0.35.sha256sum] =3D
> "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
> > +SRC_URI[redox_syscall-0.4.1.sha256sum] =3D
> "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
> > +SRC_URI[scopeguard-1.2.0.sha256sum] =3D
> "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> > +SRC_URI[self_cell-1.0.3.sha256sum] =3D
> "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
> > +SRC_URI[smallvec-1.13.1.sha256sum] =3D
> "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
> > +SRC_URI[syn-2.0.48.sha256sum] =3D
> "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
> > +SRC_URI[target-lexicon-0.12.13.sha256sum] =3D
> "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
> > +SRC_URI[unicode-ident-1.0.12.sha256sum] =3D
> "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
> > +SRC_URI[unindent-0.2.3.sha256sum] =3D
> "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
> >  SRC_URI[vcpkg-0.2.15.sha256sum] =3D
> "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> > -SRC_URI[version_check-0.9.4.sha256sum] =3D
> "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
> > -SRC_URI[windows-sys-0.45.0.sha256sum] =3D
> "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
> > -SRC_URI[windows-targets-0.42.2.sha256sum] =3D
> "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
> > -SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] =3D
> "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
> > -SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] =3D
> "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
> > -SRC_URI[windows_i686_gnu-0.42.2.sha256sum] =3D
> "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
> > -SRC_URI[windows_i686_msvc-0.42.2.sha256sum] =3D
> "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
> > -SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] =3D
> "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
> > -SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] =3D
> "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
> > -SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] =3D
> "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
> > +SRC_URI[windows-targets-0.48.5.sha256sum] =3D
> "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
> > +SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D
> "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
> > +SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D
> "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
> > +SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D
> "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
> > +SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D
> "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
> > +SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D
> "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
> > +SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D
> "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
> > +SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D
> "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
> > diff --git a/meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.7.bb b/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.2.bb
> > similarity index 91%
> > rename from meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.7.bb
> > rename to meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.2.bb
> > index eda492d312a..46778e426f5 100644
> > --- a/meta/recipes-devtools/python/
> python3-cryptography-vectors_41.0.7.bb
> > +++ b/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.2.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
> >  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
> >  #       Upgrade both recipes at the same time
> >
> > -SRC_URI[sha256sum] =3D
> "7b36f976b6e58cc1801310e1c93c584c6539d371da7f8538edd8fc463dc80d5b"
> > +SRC_URI[sha256sum] =3D
> "adcdccf5d9ee661a9602ad21d2525f678ba07a6e768ce79835994e208bab0e16"
> >
> >  PYPI_PACKAGE =3D "cryptography_vectors"
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-dire=
ctory-when-cross-compiling-9129.patch
> b/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-dire=
ctory-when-cross-compiling-9129.patch
> > deleted file mode 100644
> > index d720359ded7..00000000000
> > ---
> a/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-dire=
ctory-when-cross-compiling-9129.patch
> > +++ /dev/null
> > @@ -1,52 +0,0 @@
> > -From 2f9cd402d3293f6efe0f3ac06f17c6c14edbed86 Mon Sep 17 00:00:00 2001
> > -From: James Hilliard <james.hilliard1@gmail.com>
> > -Date: Sun, 25 Jun 2023 17:39:19 -0600
> > -Subject: [PATCH] Fix include directory when cross compiling (#9129)
> > -
> > -Upstream-Status: Backport [
> https://github.com/pyca/cryptography/pull/9129]
> > -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ----
> > - src/rust/cryptography-cffi/build.rs | 14 +++++++++++---
> > - 1 file changed, 11 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/src/rust/cryptography-cffi/build.rs
> b/src/rust/cryptography-cffi/build.rs
> > -index 07590ad2e..384af1ddb 100644
> > ---- a/src/rust/cryptography-cffi/build.rs
> > -+++ b/src/rust/cryptography-cffi/build.rs
> > -@@ -47,9 +47,14 @@ fn main() {
> > -     )
> > -     .unwrap();
> > -     println!("cargo:rustc-cfg=3Dpython_implementation=3D\"{}\"",
> python_impl);
> > --    let python_include =3D run_python_script(
> > -+    let python_includes =3D run_python_script(
> > -         &python,
> > --        "import sysconfig; print(sysconfig.get_path('include'),
> end=3D'')",
> > -+        "import os; \
> > -+         import setuptools.dist; \
> > -+         import setuptools.command.build_ext; \
> > -+         b =3D
> setuptools.command.build_ext.build_ext(setuptools.dist.Distribution()); \
> > -+         b.finalize_options(); \
> > -+         print(os.pathsep.join(b.include_dirs), end=3D'')",
> > -     )
> > -     .unwrap();
> > -     let openssl_include =3D
> > -@@ -59,12 +64,15 @@ fn main() {
> > -     let mut build =3D cc::Build::new();
> > -     build
> > -         .file(openssl_c)
> > --        .include(python_include)
> > -         .include(openssl_include)
> > -         .flag_if_supported("-Wconversion")
> > -         .flag_if_supported("-Wno-error=3Dsign-conversion")
> > -         .flag_if_supported("-Wno-unused-parameter");
> > -
> > -+    for python_include in env::split_paths(&python_includes) {
> > -+        build.include(python_include);
> > -+    }
> > -+
> > -     // Enable abi3 mode if we're not using PyPy.
> > -     if python_impl !=3D "PyPy" {
> > -         // cp37 (Python 3.7 to help our grep when we some day drop 3.=
7
> support)
> > ---
> > -2.30.2
> > -
> > diff --git
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > index 69cf451d576..f9c8d1393d2 100644
> > ---
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > +++
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > @@ -19,16 +19,18 @@ Upstream-Status: Inappropriate [OE specific]
> >
> >  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >
> > +Refresh for 42.02
> > +Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> >  ---
> > - pyproject.toml | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > + pyproject.toml | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/pyproject.toml b/pyproject.toml
> > -index b2e511f..4a285af 100644
> > +index c9a7979bd..dec4b7157 100644
> >  --- a/pyproject.toml
> >  +++ b/pyproject.toml
> > -@@ -85,7 +85,7 @@ line-length =3D 79
> > - target-version =3D ["py37"]
> > +@@ -92,7 +92,7 @@ rust-version =3D ">=3D1.63.0"
> > +
> >
> >   [tool.pytest.ini_options]
> >  -addopts =3D "-r s --capture=3Dno --strict-markers --benchmark-disable=
"
> > @@ -36,10 +38,6 @@ index b2e511f..4a285af 100644
> >   console_output_style =3D "progress-even-when-capture-no"
> >   markers =3D [
> >       "skip_fips: this test is not executed in FIPS mode",
> > -@@ -151,4 +151,4 @@ git-only =3D [
> > -     "ci-constraints-requirements.txt",
> > -     ".gitattributes",
> > -     ".gitignore",
> > --]
> > -\ No newline at end of file
> > -+]
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.7.b=
b
> b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> > similarity index 92%
> > rename from meta/recipes-devtools/python/python3-cryptography_41.0.7.bb
> > rename to meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> > index 45856774403..674130a9797 100644
> > --- a/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb
> > +++ b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> > @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
> >                     "
> >  LDSHARED +=3D "-pthread"
> >
> > -SRC_URI[sha256sum] =3D
> "13f93ce9bea8016c253b34afc6bd6a75993e5c40672ed5405a9c832f0d4a00bc"
> > +SRC_URI[sha256sum] =3D
> "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c93827c57eab6cf888"
> >
> >  SRC_URI +=3D
> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> > -
> file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
> >              file://check-memfree.py \
> >              file://run-ptest \
> >             "
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194783):
> https://lists.openembedded.org/g/openembedded-core/message/194783
> > Mute This Topic: https://lists.openembedded.org/mt/104113998/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000008a7533061080e7fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 3, 2024 at 1:07=E2=80=AFP=
M Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This=
 is failing ptests on musl/qemux86-64<br>
<br>
=C2=A0 =C2=A0 Failed ptests:<br>
=C2=A0 =C2=A0 {&#39;python3-cryptography&#39;: &#39;START: ptest-runner\n&#=
39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;2024-02-03T18:58\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Free memory: 3.899 GB\n&#39;<br>
<br></blockquote><div>This means it is passing the=C2=A0check-memfree.py te=
st, so that rules out OOM (unless we need more than this...</div><div>one t=
est case did fail for me and then passed when I used -smp 4 -m 8192</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&#39;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Testsuite summary\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# TOTAL: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# PASS: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# SKIP: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# XFAIL: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# FAIL: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# XPASS: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;# ERROR: 0\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ERROR: Exit status is 2\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;DURATION: 6\n&#39;}<br>
<br>
=C2=A0 =C2=A0 ptests which had no test results:<br>
=C2=A0 =C2=A0 [&#39;python3-cryptography&#39;]<br>
<br></blockquote><div>This makes it look like no ptests are even being dete=
cted? Is there any other log info?</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
On Thu, Feb 1, 2024 at 9:03=E2=80=AFPM Tim Orling &lt;<a href=3D"mailto:tic=
otimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * Also upgrade python3-cryptography-vectors<br>
&gt; * Drop patch for 9129, fixed upstream<br>
&gt; * Refresh pyproject.toml --benchmark-disable patch<br>
&gt; * Refresh -crates.inc<br>
&gt;<br>
&gt; Changes:<br>
&gt; <a href=3D"https://cryptography.io/en/latest/changelog/#v42-0-2" rel=
=3D"noreferrer" target=3D"_blank">https://cryptography.io/en/latest/changel=
og/#v42-0-2</a><br>
&gt; <a href=3D"https://cryptography.io/en/latest/changelog/#v42-0-1" rel=
=3D"noreferrer" target=3D"_blank">https://cryptography.io/en/latest/changel=
og/#v42-0-1</a><br>
&gt; <a href=3D"https://cryptography.io/en/latest/changelog/#v42-0-0" rel=
=3D"noreferrer" target=3D"_blank">https://cryptography.io/en/latest/changel=
og/#v42-0-0</a><br>
&gt; <a href=3D"https://github.com/pyca/cryptography/compare/41.0.7...42.0.=
2" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyca/cryptograph=
y/compare/41.0.7...42.0.2</a><br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt; All ptests pass for core-image-ptest-python3-cryptography on qemux86-6=
4<br>
&gt; with runqemu nographic kvm qemuparams=3D&quot;-smp 4 -m 8192&quot;<br>
&gt; (one test failed with standard memory allocation)<br>
&gt;<br>
&gt;=C2=A0 .../python/python3-cryptography-crates.inc=C2=A0 =C2=A0 | 170 ++=
++++++----------<br>
&gt;=C2=A0 ...=3D&gt; <a href=3D"http://python3-cryptography-vectors_42.0.2=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography-vectors_42.0=
.2.bb</a>} |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 ...-directory-when-cross-compiling-9129.patch |=C2=A0 52 ------<=
br>
&gt;=C2=A0 ...toml-remove-benchmark-disable-option.patch |=C2=A0 22 ++-<br>
&gt;=C2=A0 ....<a href=3D"http://0.7.bb" rel=3D"noreferrer" target=3D"_blan=
k">0.7.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_42.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.2.bb</a>} |=C2=
=A0 =C2=A03 +-<br>
&gt;=C2=A0 5 files changed, 90 insertions(+), 159 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-c=
ryptography-vectors_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-cryptography-vectors_41.0.7.bb</a> =3D&gt; <a href=3D"http://python3-crypt=
ography-vectors_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cry=
ptography-vectors_42.0.2.bb</a>} (91%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3-cryptogr=
aphy/0001-Fix-include-directory-when-cross-compiling-9129.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-c=
ryptography_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptog=
raphy_41.0.7.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_42.0.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.2.bb</a>}=
 (92%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.=
inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt; index 3a5edaa3494..4714c76bd2b 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt; +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt; @@ -2,113 +2,99 @@<br>
&gt;<br>
&gt;=C2=A0 # from src/rust/Cargo.lock<br>
&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/Inflector/0.11.4" r=
el=3D"noreferrer" target=3D"_blank">crates.io/Inflector/0.11.4</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aliasable/0.1.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/aliasable/0.1.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.15.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/asn1/0.15.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.15.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.15.2</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.15.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/asn1/0.15.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.15.5"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.15.5</a> \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.1.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.13.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/base64/0.13.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.21.7" rel=
=3D"noreferrer" target=3D"_blank">crates.io/base64/0.21.7</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.4.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bitflags/2.4.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.79" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/cc/1.0.79</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.4.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bitflags/2.4.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.83" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/cc/1.0.83</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types/=
0.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types/0.3.2</=
a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types-=
shared/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types-=
shared/0.1.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/1.0.9" rel=3D=
"noreferrer" target=3D"_blank">crates.io/indoc/1.0.9</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.144" rel=
=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.144</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.4.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/lock_api/0.4.9</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.8.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.8.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.17.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.17.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.60" re=
l=3D"noreferrer" target=3D"_blank">crates.io/openssl/0.10.60</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.4.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/heck/0.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/indoc/2.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.152" rel=
=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.152</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.4.11" re=
l=3D"noreferrer" target=3D"_blank">crates.io/lock_api/0.4.11</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.9.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.19.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.19.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.63" re=
l=3D"noreferrer" target=3D"_blank">crates.io/openssl/0.10.63</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-macros=
/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-macros/0.1.1=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.96"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.96</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ouroboros/0.15.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/ouroboros/0.15.6</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ouroboros_macro/0.1=
5.6" rel=3D"noreferrer" target=3D"_blank">crates.io/ouroboros_macro/0.15.6<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.99"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.99</a> \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot/0.=
12.1" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.12.1</a>=
 \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.=
9.7" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.9.7<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/1.1.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/pem/1.1.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.27" =
rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.27</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-error/1.=
0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-error/1.0.4<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-error-at=
tr/1.0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-error-a=
ttr/1.0.4</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.64"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.64</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.18.3" rel=3D=
"noreferrer" target=3D"_blank">crates.io/pyo3/0.18.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0=
.18.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.1=
8.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.18.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.18.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.18.3"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.18.3</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend=
/0.18.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend=
/0.18.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.28" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.28</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.2.1=
6" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.2.16</a> =
\<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.1.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.10.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/smallvec/1.10.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/1.0.109" rel=3D=
"noreferrer" target=3D"_blank">crates.io/syn/1.0.109</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.18" rel=3D"=
noreferrer" target=3D"_blank">crates.io/syn/2.0.18</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12=
.7" rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.7</a=
> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.9=
" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.9</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unindent/0.1.11" re=
l=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.1.11</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.=
9.9" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.9.9<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.3" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/pem/3.0.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.29" =
rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.29</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.78"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.78</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/pyo3/0.20.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0=
.20.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.2=
0.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.2" re=
l=3D"noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.2</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend=
/0.20.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend=
/0.20.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.35" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.35</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.4.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.4.1</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.2.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/1.0.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/self_cell/1.0.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.13.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/smallvec/1.13.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.48" rel=3D"=
noreferrer" target=3D"_blank">crates.io/syn/2.0.48</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12=
.13" rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.13<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.1=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.12</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unindent/0.2.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.2.3</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/vcpkg/0.2.15" =
rel=3D"noreferrer" target=3D"_blank">crates.io/vcpkg/0.2.15</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.4</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-sys/0.45.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/windows-sys/0.45.0</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.4=
2.2" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.42.2<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnu=
llvm/0.42.2" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64=
_gnullvm/0.42.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msv=
c/0.42.2" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_ms=
vc/0.42.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.=
42.2" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.42.=
2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0=
.42.2" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.4=
2.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/=
0.42.2" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0=
.42.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnul=
lvm/0.42.2" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_g=
nullvm/0.42.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc=
/0.42.2" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc=
/0.42.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.4=
8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.48.5<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnu=
llvm/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64=
_gnullvm/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msv=
c/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_ms=
vc/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.=
48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.48.=
5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0=
.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.4=
8.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/=
0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0=
.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnul=
lvm/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_g=
nullvm/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc=
/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc=
/0.48.5</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[Inflector-0.11.4.sha256sum] =3D &quot;fe438c63458706e03479442=
743baae6c88256498e6431708f6dfc520a26515d3&quot;<br>
&gt; -SRC_URI[aliasable-0.1.3.sha256sum] =3D &quot;250f629c0161ad8107cf8931=
9e990051fae62832fd343083bea452d93e2205fd&quot;<br>
&gt; -SRC_URI[asn1-0.15.2.sha256sum] =3D &quot;28c19b9324de5b815b6487e0f809=
8312791b09de0dbf3d5c2db1fe2d95bab973&quot;<br>
&gt; -SRC_URI[asn1_derive-0.15.2.sha256sum] =3D &quot;a045c3ccad89f244a86bd=
1e6cf1a7bf645296e7692698b056399b6efd4639407&quot;<br>
&gt; +SRC_URI[asn1-0.15.5.sha256sum] =3D &quot;ae3ecbce89a22627b5e8e6e11d69=
715617138290289e385cde773b1fe50befdb&quot;<br>
&gt; +SRC_URI[asn1_derive-0.15.5.sha256sum] =3D &quot;861af988fac460ac69a09=
f41e6217a8fb9178797b76fcc9478444be6a59be19c&quot;<br>
&gt;=C2=A0 SRC_URI[autocfg-1.1.0.sha256sum] =3D &quot;d468802bab17cbc0cc575=
e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
&gt; -SRC_URI[base64-0.13.1.sha256sum] =3D &quot;9e1b586273c5702936fe7b7d68=
96644d8be71e6314cfe09d3167c95f712589e8&quot;<br>
&gt; +SRC_URI[base64-0.21.7.sha256sum] =3D &quot;9d297deb1925b89f2ccc13d763=
5fa0714f12c87adce1c75356b39ca9b7178567&quot;<br>
&gt;=C2=A0 SRC_URI[bitflags-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1dde09=
4a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
&gt; -SRC_URI[bitflags-2.4.1.sha256sum] =3D &quot;327762f6e5a765692301e5bb5=
13e0d9fef63be86bbc14528052b1cd3e6f03e07&quot;<br>
&gt; -SRC_URI[cc-1.0.79.sha256sum] =3D &quot;50d30906286121d95be3d479533b45=
8f87493b30a4b5f79a607db8f5d11aa91f&quot;<br>
&gt; +SRC_URI[bitflags-2.4.2.sha256sum] =3D &quot;ed570934406eb16438a4e976b=
1b4500774099c13b8cb96eec99f620f05090ddf&quot;<br>
&gt; +SRC_URI[cc-1.0.83.sha256sum] =3D &quot;f1174fb0b6ec23863f8b971027804a=
42614e347eafb0a95bf0b12cdae21fc4d0&quot;<br>
&gt;=C2=A0 SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619=
e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
&gt;=C2=A0 SRC_URI[foreign-types-0.3.2.sha256sum] =3D &quot;f6f339eb8adc052=
cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1&quot;<br>
&gt;=C2=A0 SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D &quot;00b02284=
11908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b&quot;<br>
&gt; -SRC_URI[indoc-1.0.9.sha256sum] =3D &quot;bfa799dd5ed20a7e349f3b4639aa=
80d74549c81716d9ec4f994c9b5815598306&quot;<br>
&gt; -SRC_URI[libc-0.2.144.sha256sum] =3D &quot;2b00cc1c228a6782d0f076e7b23=
2802e0c5689d41bb5df366f2a6b6621cfdfe1&quot;<br>
&gt; -SRC_URI[lock_api-0.4.9.sha256sum] =3D &quot;435011366fe56583b16cf956f=
9df0095b405b82d76425bc8981c0e22e60ec4df&quot;<br>
&gt; -SRC_URI[memoffset-0.8.0.sha256sum] =3D &quot;d61c719bcfbcf5d62b3a09ef=
a6088de8c54bc0bfcd3ea7ae39fcc186108b8de1&quot;<br>
&gt; -SRC_URI[once_cell-1.17.2.sha256sum] =3D &quot;9670a07f94779e00908f3e6=
86eab508878ebb390ba6e604d3a284c00e8d0487b&quot;<br>
&gt; -SRC_URI[openssl-0.10.60.sha256sum] =3D &quot;79a4c6c3a2b158f7f8f2a2fc=
5a969fa3a068df6fc9dbb4a43845436e3af7c800&quot;<br>
&gt; +SRC_URI[heck-0.4.1.sha256sum] =3D &quot;95505c38b4572b2d910cecb028156=
0f54b440a19336cbbcb27bf6ce6adc6f5a8&quot;<br>
&gt; +SRC_URI[indoc-2.0.4.sha256sum] =3D &quot;1e186cfbae8084e513daff4240b4=
797e342f988cecda4fb6c939150f96315fd8&quot;<br>
&gt; +SRC_URI[libc-0.2.152.sha256sum] =3D &quot;13e3bf6590cbc649f4d1a3eefc9=
d5d6eb746f5200ffb04e5e142700b8faa56e7&quot;<br>
&gt; +SRC_URI[lock_api-0.4.11.sha256sum] =3D &quot;3c168f8615b12bc01f9c17e2=
eb0cc07dcae1940121185446edc3744920e8ef45&quot;<br>
&gt; +SRC_URI[memoffset-0.9.0.sha256sum] =3D &quot;5a634b1c61a95585bd15607c=
6ab0c4e5b226e695ff2800ba0cdccddf208c406c&quot;<br>
&gt; +SRC_URI[once_cell-1.19.0.sha256sum] =3D &quot;3fdb12b2476b595f9358c51=
61aa467c2438859caa136dec86c26fdd2efe17b92&quot;<br>
&gt; +SRC_URI[openssl-0.10.63.sha256sum] =3D &quot;15c9d69dd87a29568d4d017c=
fe8ec518706046a05184e5aea92d0af890b803c8&quot;<br>
&gt;=C2=A0 SRC_URI[openssl-macros-0.1.1.sha256sum] =3D &quot;a948666b637a0f=
465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c&quot;<br>
&gt; -SRC_URI[openssl-sys-0.9.96.sha256sum] =3D &quot;3812c071ba60da8b5677c=
c12bcb1d42989a65553772897a7e0355545a819838f&quot;<br>
&gt; -SRC_URI[ouroboros-0.15.6.sha256sum] =3D &quot;e1358bd1558bd2a083fed42=
8ffeda486fbfb323e698cdda7794259d592ca72db&quot;<br>
&gt; -SRC_URI[ouroboros_macro-0.15.6.sha256sum] =3D &quot;5f7d21ccd03305a67=
4437ee1248f3ab5d4b1db095cf1caf49f1713ddf61956b7&quot;<br>
&gt; +SRC_URI[openssl-sys-0.9.99.sha256sum] =3D &quot;22e1bf214306098e48324=
60f797824c05d25aacdf896f64a985fb0fd992454ae&quot;<br>
&gt;=C2=A0 SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quot;3742b2c103b9f06b=
c9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f&quot;<br>
&gt; -SRC_URI[parking_lot_core-0.9.7.sha256sum] =3D &quot;9069cbb9f99e3a508=
3476ccb29ceb1de18b9118cafa53e90c9551235de2b9521&quot;<br>
&gt; -SRC_URI[pem-1.1.1.sha256sum] =3D &quot;a8835c273a76a90455d7344889b096=
4598e3316e2a79ede8e36f16bdcf2228b8&quot;<br>
&gt; -SRC_URI[pkg-config-0.3.27.sha256sum] =3D &quot;26072860ba924cbfa98ea3=
9c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964&quot;<br>
&gt; -SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D &quot;da25490ff9892aab3=
fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c&quot;<br>
&gt; -SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] =3D &quot;a1be40180e52=
ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869&quot;<br>
&gt; -SRC_URI[proc-macro2-1.0.64.sha256sum] =3D &quot;78803b62cbf1f46fde80d=
7c0e803111524b9877184cfe7c3033659490ac7a7da&quot;<br>
&gt; -SRC_URI[pyo3-0.18.3.sha256sum] =3D &quot;e3b1ac5b3731ba34fdaa9785f8d7=
4d17448cd18f30cf19e0c7e7b1fdb5272109&quot;<br>
&gt; -SRC_URI[pyo3-build-config-0.18.3.sha256sum] =3D &quot;9cb946f5ac61bb6=
1a5014924910d936ebd2b23b705f7a4a3c40b05c720b079a3&quot;<br>
&gt; -SRC_URI[pyo3-ffi-0.18.3.sha256sum] =3D &quot;fd4d7c5337821916ea2a1d21=
d1092e8443cf34879e53a0ac653fbb98f44ff65c&quot;<br>
&gt; -SRC_URI[pyo3-macros-0.18.3.sha256sum] =3D &quot;a9d39c55dab3fc5a4b25b=
bd1ac10a2da452c4aca13bb450f22818a002e29648d&quot;<br>
&gt; -SRC_URI[pyo3-macros-backend-0.18.3.sha256sum] =3D &quot;97daff08a4c48=
320587b5224cc98d609e3c27b6d437315bd40b605c98eeb5918&quot;<br>
&gt; -SRC_URI[quote-1.0.28.sha256sum] =3D &quot;1b9ab9c7eadfd8df19006f1cf1a=
4aed13540ed5cbc047010ece5826e10825488&quot;<br>
&gt; -SRC_URI[redox_syscall-0.2.16.sha256sum] =3D &quot;fb5a58c1855b4b6819d=
59012155603f0b22ad30cad752600aadfcb695265519a&quot;<br>
&gt; -SRC_URI[scopeguard-1.1.0.sha256sum] =3D &quot;d29ab0c6d3fc0ee92fe66e2=
d99f700eab17a8d57d1c1d3b748380fb20baa78cd&quot;<br>
&gt; -SRC_URI[smallvec-1.10.0.sha256sum] =3D &quot;a507befe795404456341dfab=
10cef66ead4c041f62b8b11bbb92bffe5d0953e0&quot;<br>
&gt; -SRC_URI[syn-1.0.109.sha256sum] =3D &quot;72b64191b275b66ffe2469e8af2c=
1cfe3bafa67b529ead792a6d0160888b4237&quot;<br>
&gt; -SRC_URI[syn-2.0.18.sha256sum] =3D &quot;32d41677bcbe24c20c52e7c70b0d8=
db04134c5d1066bf98662e2871ad200ea3e&quot;<br>
&gt; -SRC_URI[target-lexicon-0.12.7.sha256sum] =3D &quot;fd1ba337640d60c3e9=
6bc6f0638a939b9c9a7f2c316a1598c279828b3d1dc8c5&quot;<br>
&gt; -SRC_URI[unicode-ident-1.0.9.sha256sum] =3D &quot;b15811caf2415fb88917=
8633e7724bad2509101cde276048e013b9def5e51fa0&quot;<br>
&gt; -SRC_URI[unindent-0.1.11.sha256sum] =3D &quot;e1766d682d402817b5ac4490=
b3c3002d91dfa0d22812f341609f97b08757359c&quot;<br>
&gt; +SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D &quot;4c42a9226546d68ac=
dd9c0a280d17ce19bfe27a46bf68784e4066115788d008e&quot;<br>
&gt; +SRC_URI[pem-3.0.3.sha256sum] =3D &quot;1b8fcc794035347fb64beda2d3b462=
595dd2753e3f268d89c5aae77e8cf2c310&quot;<br>
&gt; +SRC_URI[pkg-config-0.3.29.sha256sum] =3D &quot;2900ede94e305130c13ddd=
391e0ab7cbaeb783945ae07a279c268cb05109c6cb&quot;<br>
&gt; +SRC_URI[proc-macro2-1.0.78.sha256sum] =3D &quot;e2422ad645d89c99f8f3e=
6b88a9fdeca7fabeac836b1002371c4367c8f984aae&quot;<br>
&gt; +SRC_URI[pyo3-0.20.2.sha256sum] =3D &quot;9a89dc7a5850d0e983be1ec2a463=
a171d20990487c3cfcd68b5363f1ee3d6fe0&quot;<br>
&gt; +SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D &quot;07426f0d8fe5a60=
1f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be&quot;<br>
&gt; +SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D &quot;dbb7dec17e17766b46bca4f1=
a4215a85006b4c2ecde122076c562dd058da6cf1&quot;<br>
&gt; +SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D &quot;05f738b4e40d50b571195=
7f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3&quot;<br>
&gt; +SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D &quot;0fc910d485184=
7827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f&quot;<br>
&gt; +SRC_URI[quote-1.0.35.sha256sum] =3D &quot;291ec9ab5efd934aaf503a6466c=
5d5251535d108ee747472c3977cc5acc868ef&quot;<br>
&gt; +SRC_URI[redox_syscall-0.4.1.sha256sum] =3D &quot;4722d768eff46b75989d=
d134e5c353f0d6296e5aaa3132e776cbdb56be7731aa&quot;<br>
&gt; +SRC_URI[scopeguard-1.2.0.sha256sum] =3D &quot;94143f37725109f92c262ed=
2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49&quot;<br>
&gt; +SRC_URI[self_cell-1.0.3.sha256sum] =3D &quot;58bf37232d3bb9a2c4e641ca=
2a11d83b5062066f88df7fed36c28772046d65ba&quot;<br>
&gt; +SRC_URI[smallvec-1.13.1.sha256sum] =3D &quot;e6ecd384b10a64542d77071b=
d64bd7b231f4ed5940fba55e98c3de13824cf3d7&quot;<br>
&gt; +SRC_URI[syn-2.0.48.sha256sum] =3D &quot;0f3531638e407dfc0814761abb7c0=
0a5b54992b849452a0646b7f65c9f770f3f&quot;<br>
&gt; +SRC_URI[target-lexicon-0.12.13.sha256sum] =3D &quot;69758bda2e78f098e=
4ccb393021a0963bb3442eac05f135c30f61b7370bbafae&quot;<br>
&gt; +SRC_URI[unicode-ident-1.0.12.sha256sum] =3D &quot;3354b9ac3fae1ff6755=
cb6db53683adb661634f67557942dea4facebec0fee4b&quot;<br>
&gt; +SRC_URI[unindent-0.2.3.sha256sum] =3D &quot;c7de7d73e1754487cb58364ee=
906a499937a0dfabd86bcb980fa99ec8c8fa2ce&quot;<br>
&gt;=C2=A0 SRC_URI[vcpkg-0.2.15.sha256sum] =3D &quot;accd4ea62f7bb7a82fe230=
66fb0957d48ef677f6eeb8215f372f52e48bb32426&quot;<br>
&gt; -SRC_URI[version_check-0.9.4.sha256sum] =3D &quot;49874b5167b65d7193b8=
aba1567f5c7d93d001cafc34600cee003eda787e483f&quot;<br>
&gt; -SRC_URI[windows-sys-0.45.0.sha256sum] =3D &quot;75283be5efb2831d37ea1=
42365f009c02ec203cd29a3ebecbc093d52315b66d0&quot;<br>
&gt; -SRC_URI[windows-targets-0.42.2.sha256sum] =3D &quot;8e5180c00cd44c9b1=
c88adb3693291f1cd93605ded80c250a75d472756b4d071&quot;<br>
&gt; -SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] =3D &quot;597a51185=
70b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8&quot;<br>
&gt; -SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] =3D &quot;e08e8864a60f=
06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43&quot;<br>
&gt; -SRC_URI[windows_i686_gnu-0.42.2.sha256sum] =3D &quot;c61d927d8da41da9=
6a81f029489353e68739737d3beca43145c8afec9a31a84f&quot;<br>
&gt; -SRC_URI[windows_i686_msvc-0.42.2.sha256sum] =3D &quot;44d840b6ec649f4=
80a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060&quot;<br>
&gt; -SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] =3D &quot;8de912b8b8feb5=
5c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36&quot;<br>
&gt; -SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] =3D &quot;26d41b46a3=
6d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3&quot;<br>
&gt; -SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] =3D &quot;9aec5da331524=
158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0&quot;<br>
&gt; +SRC_URI[windows-targets-0.48.5.sha256sum] =3D &quot;9a2fa6e2155d7247b=
e68c096456083145c183cbbbc2764150dda45a87197940c&quot;<br>
&gt; +SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D &quot;2b38e32f0=
abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8&quot;<br>
&gt; +SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D &quot;dc35310971f3=
b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc&quot;<br>
&gt; +SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D &quot;a75915e7def60c94=
dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e&quot;<br>
&gt; +SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D &quot;8f55c233f70c4b2=
7f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406&quot;<br>
&gt; +SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D &quot;53d40abd2583d2=
3e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e&quot;<br>
&gt; +SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D &quot;0b7b527678=
68a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc&quot;<br>
&gt; +SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D &quot;ed94fce61571a=
4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cr=
yptography-vectors_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
cryptography-vectors_41.0.7.bb</a> b/meta/recipes-devtools/python/<a href=
=3D"http://python3-cryptography-vectors_42.0.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-cryptography-vectors_42.0.2.bb</a><br>
&gt; similarity index 91%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-cry=
ptography-vectors_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-c=
ryptography-vectors_41.0.7.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-crypt=
ography-vectors_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cry=
ptography-vectors_42.0.2.bb</a><br>
&gt; index eda492d312a..46778e426f5 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy-vectors_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptog=
raphy-vectors_41.0.7.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy-vectors_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptog=
raphy-vectors_42.0.2.bb</a><br>
&gt; @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617=
db4fb6fae01f1d253ab91511e4 \<br>
&gt;=C2=A0 # NOTE: Make sure to keep this recipe at the same version as pyt=
hon3-cryptography<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same tim=
e<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;7b36f976b6e58cc1801310e1c93c584c6539d371=
da7f8538edd8fc463dc80d5b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;adcdccf5d9ee661a9602ad21d2525f678ba07a6e=
768ce79835994e208bab0e16&quot;<br>
&gt;<br>
&gt;=C2=A0 PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Fi=
x-include-directory-when-cross-compiling-9129.patch b/meta/recipes-devtools=
/python/python3-cryptography/0001-Fix-include-directory-when-cross-compilin=
g-9129.patch<br>
&gt; deleted file mode 100644<br>
&gt; index d720359ded7..00000000000<br>
&gt; --- a/meta/recipes-devtools/python/python3-cryptography/0001-Fix-inclu=
de-directory-when-cross-compiling-9129.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,52 +0,0 @@<br>
&gt; -From 2f9cd402d3293f6efe0f3ac06f17c6c14edbed86 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com"=
 target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; -Date: Sun, 25 Jun 2023 17:39:19 -0600<br>
&gt; -Subject: [PATCH] Fix include directory when cross compiling (#9129)<b=
r>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/pyca/cryptog=
raphy/pull/9129" rel=3D"noreferrer" target=3D"_blank">https://github.com/py=
ca/cryptography/pull/9129</a>]<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ----<br>
&gt; - src/rust/cryptography-cffi/<a href=3D"http://build.rs" rel=3D"norefe=
rrer" target=3D"_blank">build.rs</a> | 14 +++++++++++---<br>
&gt; - 1 file changed, 11 insertions(+), 3 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/rust/cryptography-cffi/<a href=3D"http://build.rs" r=
el=3D"noreferrer" target=3D"_blank">build.rs</a> b/src/rust/cryptography-cf=
fi/<a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">build.r=
s</a><br>
&gt; -index 07590ad2e..384af1ddb 100644<br>
&gt; ---- a/src/rust/cryptography-cffi/<a href=3D"http://build.rs" rel=3D"n=
oreferrer" target=3D"_blank">build.rs</a><br>
&gt; -+++ b/src/rust/cryptography-cffi/<a href=3D"http://build.rs" rel=3D"n=
oreferrer" target=3D"_blank">build.rs</a><br>
&gt; -@@ -47,9 +47,14 @@ fn main() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0.unwrap();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0println!(&quot;cargo:rustc-cfg=3Dpython_implement=
ation=3D\&quot;{}\&quot;&quot;, python_impl);<br>
&gt; --=C2=A0 =C2=A0 let python_include =3D run_python_script(<br>
&gt; -+=C2=A0 =C2=A0 let python_includes =3D run_python_script(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;python,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;import sysconfig; print(sysconfig.=
get_path(&#39;include&#39;), end=3D&#39;&#39;)&quot;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;import os; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import setuptools.dist; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import setuptools.command.build_ex=
t; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =3D setuptools.command.build_ext=
.build_ext(setuptools.dist.Distribution()); \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b.finalize_options(); \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(os.pathsep.join(b.include_di=
rs), end=3D&#39;&#39;)&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0.unwrap();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0let openssl_include =3D<br>
&gt; -@@ -59,12 +64,15 @@ fn main() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0let mut build =3D cc::Build::new();<br>
&gt; -=C2=A0 =C2=A0 =C2=A0build<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.file(openssl_c)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 .include(python_include)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.include(openssl_include)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flag_if_supported(&quot;-Wconversi=
on&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flag_if_supported(&quot;-Wno-error=
=3Dsign-conversion&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flag_if_supported(&quot;-Wno-unuse=
d-parameter&quot;);<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 for python_include in env::split_paths(&amp;python_inc=
ludes) {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 build.include(python_include);<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0// Enable abi3 mode if we&#39;re not using PyPy.<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0if python_impl !=3D &quot;PyPy&quot; {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// cp37 (Python 3.7 to help our gre=
p when we some day drop 3.7 support)<br>
&gt; ---<br>
&gt; -2.30.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-py=
project.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/=
python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-op=
tion.patch<br>
&gt; index 69cf451d576..f9c8d1393d2 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject=
.toml-remove-benchmark-disable-option.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject=
.toml-remove-benchmark-disable-option.patch<br>
&gt; @@ -19,16 +19,18 @@ Upstream-Status: Inappropriate [OE specific]<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriv=
er.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;<br>
&gt; +Refresh for 42.02<br>
&gt; +Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.c=
om" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - pyproject.toml | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; + pyproject.toml | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/pyproject.toml b/pyproject.toml<br>
&gt; -index b2e511f..4a285af 100644<br>
&gt; +index c9a7979bd..dec4b7157 100644<br>
&gt;=C2=A0 --- a/pyproject.toml<br>
&gt;=C2=A0 +++ b/pyproject.toml<br>
&gt; -@@ -85,7 +85,7 @@ line-length =3D 79<br>
&gt; - target-version =3D [&quot;py37&quot;]<br>
&gt; +@@ -92,7 +92,7 @@ rust-version =3D &quot;&gt;=3D1.63.0&quot;<br>
&gt; +<br>
&gt;<br>
&gt;=C2=A0 =C2=A0[tool.pytest.ini_options]<br>
&gt;=C2=A0 -addopts =3D &quot;-r s --capture=3Dno --strict-markers --benchm=
ark-disable&quot;<br>
&gt; @@ -36,10 +38,6 @@ index b2e511f..4a285af 100644<br>
&gt;=C2=A0 =C2=A0console_output_style =3D &quot;progress-even-when-capture-=
no&quot;<br>
&gt;=C2=A0 =C2=A0markers =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;skip_fips: this test is not executed i=
n FIPS mode&quot;,<br>
&gt; -@@ -151,4 +151,4 @@ git-only =3D [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&quot;ci-constraints-requirements.txt&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&quot;.gitattributes&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&quot;.gitignore&quot;,<br>
&gt; --]<br>
&gt; -\ No newline at end of file<br>
&gt; -+]<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cr=
yptography_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy_41.0.7.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3=
-cryptography_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypt=
ography_42.0.2.bb</a><br>
&gt; similarity index 92%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-cry=
ptography_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogra=
phy_41.0.7.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-crypt=
ography_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograph=
y_42.0.2.bb</a><br>
&gt; index 45856774403..674130a9797 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy_41.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_41=
.0.7.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42=
.0.2.bb</a><br>
&gt; @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c361=
7db4fb6fae01f1d253ab91511e4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>
&gt;=C2=A0 LDSHARED +=3D &quot;-pthread&quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;13f93ce9bea8016c253b34afc6bd6a75993e5c40=
672ed5405a9c832f0d4a00bc&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433=
219dc8c93827c57eab6cf888&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchmark-d=
isable-option.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-include-dir=
ectory-when-cross-compiling-9129.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://check-memfree.p=
y \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#194783): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/194783" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/194783</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10411399=
8/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/104113998/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000008a7533061080e7fa--

