Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD327C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 14:39:35 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.20936.1753454365941430329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 07:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJZyhHHL;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8d7ad77e4cso1766872276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753454365; x=1754059165; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BPT+33xFugPed1c6NFzbihbXzBj4nVeTJop9Gw42w4=;
        b=HJZyhHHLyqF4CD2z95gq1vDH06K5poUTZVhmW8jwHDFPT6iU6NzRd298r905dqojxY
         WXNCC93jDvY80Gz8rE7wOaPOzECT9+Qwbxlz/Zkdis/dAJpdu/HsgUWCxonRdY4Hv/XK
         q5MKFNvJyAjRC1Gxh2KykL8qNQTCk31JogAYHvQEvO4WX0RwOWZLZpE4HXKXp9zknBlJ
         4AyhihjoHyr+iu824A2eZOvi9gJc72+WHIn14qsPSNdViHV2UilZOvBjw1yx4F0df1kH
         kOJMKa+SKM9t3u8aKpktKx3oCszytsKQQ74au/eCyVVI3tOajnDLeV3NqU4umwWiYd1K
         /Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753454365; x=1754059165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BPT+33xFugPed1c6NFzbihbXzBj4nVeTJop9Gw42w4=;
        b=l762w1YHGkQnqHiDcr9vaVXhr4wpPrCdafb1B5e5E5MQfPHaLsNn2h0EJGcSc5WYba
         2InxbJCuywcb9JRp28D/UzXV4ZUG92+cUv1Z+JGIKRPsodNWyTj4HtVKgWpesNeLkx3x
         dGKh8kL3oNERpnnyKTw9PmvGofNkoNStbrLhOqphkXrhN8cztcfMqmg7U6rvoqTFJA3n
         doR0uN5ND2SRHfDnkLb1lfEiX4yZzEmHNfvQGprHk6zjfH/6JVXqZkJlpMTqmSn3eO0a
         +i3HyKHkCSXvisnLSjwHcZdHZHx10RlTHE06mcFmivGm04/jnJpeM31mAxt+uRslTu1N
         uU5Q==
X-Gm-Message-State: AOJu0YyrW+Tp4coh0fzo7kC4ERFe/2nNjWi8V5AGcpM5vpfKfQWRfUKl
	ptH3yzH1Wiel3k2jnyYeCk2Cz3ZQyTWfkfR5DCXzAZpcY9IES3wM7rlzV7WAizHjYKTrhWUS7a6
	L7C7t6o5kSgc9KCOtafIs9+mo/9pVuuQ=
X-Gm-Gg: ASbGncvDAgxIQZrl75oRd+/fLnNav0GZ0e2zLt0eQ5cToYIt9CKRHnAz9qw+bJOI12L
	GRXZoLhLjICLQHKxqtKaQdVajzBoYcIwQ+OyJVqa86aBxlzaG9MrfZRRyUcpDhFaiEzY5AHMiTi
	/ota0cK2Okb5yPlO2bvhpLZmRSYZlpBIN92mwGE2t8xxSLrmuNz7N1uqw1Z8MV8BhSDc43DCrPk
	Z0QwMA38lWe+sd1c2kcp0EF3LiELbvzuX6qqRFi
X-Google-Smtp-Source: AGHT+IFkl79JVODHPYGu+tYQPEdtqAzpx6z1j46foExGzKL9RFL2IKcFTgfzSXN+I/JgpC9cpIsmfwmAGihd9B+qfIw=
X-Received: by 2002:a05:6902:140b:b0:e8d:718f:cffa with SMTP id
 3f1490d57ef6-e8df115a523mr2380905276.6.1753454363835; Fri, 25 Jul 2025
 07:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250725074253.4112524-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250725074253.4112524-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jul 2025 07:38:56 -0700
X-Gm-Features: Ac12FXxQv1_XQJB4s6y4DnWKt-lL4cyJaIM_oLT19kBnSmTvHkYQORqwMa89bgE
Message-ID: <CAMKF1sr1yXO8DBhB920SwVbd6TO7+GVo4vRpRh=-X7Otgp7OQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.87.0 -> 1.88.0
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	Maganuru.Jayasurya@windriver.com, Yash.Shinde@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 14:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220915

On Fri, Jul 25, 2025 at 12:43=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
>
> Rust stable version updated to 1.88.0.
> https://blog.rust-lang.org/2025/06/26/Rust-1.88.0/
>
> * Rebase existing patches with v1.88.0
>
> * Exclude tidy and coverage-dump from OE self-tests due to test failures
>   Although the build completes successfully, OE self-tests fail:
>   tools/coverage-dump panics during test execution.
>   tools/tidy fails due to a mismatched GCC submodule commit.
>   These tests are excluded to allow successful OE self-test runs.
>
> * Two tests from the`codegen` modules now fail only on riscv64.

It would be good to open a bugzilla for this issue. Its perhaps due
to us not enabling rvv extension I am guessing

>   Enable them on arm32/64 and x86-32/64 targets, while restricting
>   them on riscv64 via `only-<target_arch>` tags.
>
>   Test Results Summary:
>   +-----------+--------+---------+
>   | Machine   | Passed | Ignored |
>   +-----------+--------+---------+
>   | arm-32    | 28,664 | 1,451   |
>   | arm-64    | 28,748 | 1,396   |
>   | x86-32    | 28,657 | 1,432   |
>   | x86-64    | 28,904 | 1,213   |
>   | riscv-64  | 28,722 | 1,421   |
>   +-----------+--------+---------+
>
> Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  meta/lib/oeqa/selftest/cases/rust.py          |   2 +
>  .../rust/{cargo_1.87.0.bb =3D> cargo_1.88.0.bb} |   0
>  ...l-codes-on-riscv32gc-unknown-linux-g.patch |  38 -------
>  ...teps-tool.rs-switch-off-lto-for-rust.patch |  18 ++--
>  ...epro-issue-fix-with-cc-crate-hashmap.patch | 102 ------------------
>  ...d-statically-in-rustc_driver-feature.patch |   6 +-
>  .../rust/files/rust-oe-selftest.patch         |  48 +++++++--
>  ...ibstd-rs_1.87.0.bb =3D> libstd-rs_1.88.0.bb} |   0
>  ....87.0.bb =3D> rust-cross-canadian_1.88.0.bb} |   0
>  ...ust-llvm_1.87.0.bb =3D> rust-llvm_1.88.0.bb} |   2 +-
>  meta/recipes-devtools/rust/rust-snapshot.inc  |  78 +++++++-------
>  meta/recipes-devtools/rust/rust-source.inc    |   2 +-
>  .../rust/{rust_1.87.0.bb =3D> rust_1.88.0.bb}   |   0
>  14 files changed, 94 insertions(+), 204 deletions(-)
>  rename meta/recipes-devtools/rust/{cargo_1.87.0.bb =3D> cargo_1.88.0.bb}=
 (100%)
>  rename meta/recipes-devtools/rust/{libstd-rs_1.87.0.bb =3D> libstd-rs_1.=
88.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.87.0.bb =3D> ru=
st-cross-canadian_1.88.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-llvm_1.87.0.bb =3D> rust-llvm_1.=
88.0.bb} (99%)
>  rename meta/recipes-devtools/rust/{rust_1.87.0.bb =3D> rust_1.88.0.bb} (=
100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index c506bb3ad5..fefd3324b6 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>  GCCVERSION ?=3D "15.%"
>  SDKGCCVERSION ?=3D "${GCCVERSION}"
>  GLIBCVERSION ?=3D "2.41%"
> -RUSTVERSION ?=3D "1.87.0%"
> +RUSTVERSION ?=3D "1.88.0%"
>
>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
> index d99a58d6b9..922aa6773b 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -67,6 +67,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
>                              'src/etc/test-float-parse',
>                              'src/librustdoc',
>                              'src/rustdoc-json-types',
> +                            'src/tools/coverage-dump',
>                              'src/tools/jsondoclint',
>                              'src/tools/lint-docs',
>                              'src/tools/replace-version-placeholder',
> @@ -74,6 +75,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
>                              'src/tools/rustdoc-themes',
>                              'src/tools/rust-installer',
>                              'src/tools/suggest-tests',
> +                            'src/tools/tidy',
>                              'tests/assembly/asm/aarch64-outline-atomics.=
rs',
>                              'tests/codegen/issues/issue-122805.rs',
>                              'tests/codegen/thread-local.rs',
> diff --git a/meta/recipes-devtools/rust/cargo_1.87.0.bb b/meta/recipes-de=
vtools/rust/cargo_1.88.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/cargo_1.87.0.bb
> rename to meta/recipes-devtools/rust/cargo_1.88.0.bb
> diff --git a/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-code=
s-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/rust/files/000=
1-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
> index 82edd71206..ff90e7b55b 100644
> --- a/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-codes-on-ri=
scv32gc-unknown-linux-g.patch
> +++ b/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-codes-on-ri=
scv32gc-unknown-linux-g.patch
> @@ -10,44 +10,6 @@ Upstream-Status: Submitted [https://github.com/rust-la=
ng/libc/pull/4382]

We can replace this patch with what got merged upstream.
https://github.com/rust-lang/libc/pull/4382/commits/4b439b0953573e0383da7e0=
92b1f516ba21f3398

I have submitted a patch for this backport and its already in master-next
https://git.yoctoproject.org/poky-contrib/commit/?h=3Dyoe/mut&id=3Dbcbc6ded=
a0951db24be0df545a64360b43162588

Please rebase your patch on top of it.

>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - vendor/libc-0.2.158/.cargo-checksum.json                    | 2 +-
> - .../src/unix/linux_like/linux/arch/generic/mod.rs           | 6 +++++-
> - vendor/libc-0.2.167/.cargo-checksum.json                    | 2 +-
> - .../src/unix/linux_like/linux/arch/generic/mod.rs           | 4 +++-
> - vendor/libc-0.2.169/.cargo-checksum.json                    | 2 +-
> - .../src/unix/linux_like/linux/arch/generic/mod.rs           | 4 +++-
> - 6 files changed, 14 insertions(+), 6 deletions(-)
> -
> -diff --git a/vendor/libc-0.2.167/.cargo-checksum.json b/vendor/libc-0.2.=
167/.cargo-checksum.json
> -index 7ea5d4122..def87f4ef 100644
> ---- a/vendor/libc-0.2.167/.cargo-checksum.json
> -+++ b/vendor/libc-0.2.167/.cargo-checksum.json
> -@@ -1 +1 @@
> --{"files":{"CHANGELOG.md":"ab0bd175d8a317894835d3bea1e1d78780adb818705bd=
77e230d6972c2ed3633","CONTRIBUTING.md":"155e7f4e96fafe9ee5c8adb5068be27a22d=
e89a95ca9bfc7baf517b9850d20d6","Cargo.toml":"0912337103f997c684c700d066b621=
81c7f7b9a23e4e12faaf5c1a2b54a78757","LICENSE-APACHE":"62c7a1e35f56406896d7a=
a7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f=
56a8932dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"38061c8bb60=
0c2e01b48b662288cb11f38c0ec27bbe6d496e7f0acb1016991c4","build.rs":"bcbe11dc=
711029460fcc4f7fd8e38c487006ad0860007915ae6718bd90fb891a","rustfmt.toml":"e=
9321ff995242e8cb0a4984254f0748ef11a89ca4618cab8f047ee59a88768e7","src/fixed=
_width_ints.rs":"10eb30cf48390768f0167e1fa46ae99461968a05e93bd96aff721f5455=
0ae66c","src/fuchsia/aarch64.rs":"d430586295c7eb022eb8202f7b18e483a9dd0e7de=
1857f7963453792c7161def","src/fuchsia/mod.rs":"f452b1cc842cc92c6c7676376adb=
a83c1f5ccc2460e80626099ec520ba23a48b","src/fuchsia/riscv64.rs":"7efd6cbcbd2=
cb25d6380f6df69ad91cf62efd55fb9cb7cb85884c490b601743e","src/fuchsia/x86_64.=
rs":"e63daa4085c6f6ab35d9711df6d7e027247a8b3b2a6dc47fcb2b21e1f4820a2f","src=
/hermit.rs":"35c1e248f2b3608017f696a79d4a114c889176c9d281a1544916360c62be23=
01","src/lib.rs":"a8cd1626f2dd03c25242ce82856d04625ef0c3910de6ea2df72940883=
1eeda38","src/macros.rs":"cb65803b265ba63ffe37375ae08703ab0b8b90972ed22da3c=
f7812eef421a6cd","src/psp.rs":"dcf53184a1ab06d18aa34431ca42644c5646fe78d05a=
53678ef9529607ba3ea7","src/sgx.rs":"f0f1a9fa864cd3dc94c4b3ce73f88e67f11453f=
63d8b4d52823de2ccbba7eb49","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a=
2c183408d0cad105ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef=
3b97b8c95758ad741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"01=
116b18b9be6791fdf4ff572d12154b64dfa43a18afc33940ea676e1884bdbb","src/switch=
.rs":"bb0ce1331c61a28caea7bd201e399d1e1127f303dcc7747b4f07f63d188ea49c","sr=
c/teeos/mod.rs":"7e0a8b550f1109c8247136cabb69308bd0ed2838f00ce0c99a695a3ef9=
afca22","src/trusty.rs":"2e829bfdaefbba31b907ee5ef577ebc9e8f2e2fee2cde2a4e6=
08d5219a435390","src/unix/aix/mod.rs":"4fc9eb4d97b2496aff094754cf6417713b49=
ca8fea63f29c2bdadd5336cd842b","src/unix/aix/powerpc64.rs":"666146ac9e4cb01c=
49ba046ef470d93499d91c0948d86fdce65fcd6cff6ece14","src/unix/bsd/apple/b32/m=
od.rs":"9f20c77e86b812ff09d8193a48fe4f3afd6dae8a43d5a0d78b8592971cc3726e","=
src/unix/bsd/apple/b64/aarch64/mod.rs":"1ebe9f1a1e07318813da7e2a78195937533=
c22b51a23a4527b9404c948318f86","src/unix/bsd/apple/b64/mod.rs":"164e734befe=
87fa6e2d79fb856ce314282bd219ea4f2f357c6446dca6d2de359","src/unix/bsd/apple/=
b64/x86_64/mod.rs":"e03794fdeaaf4a86c7b12f41e490a7538c12d4a77743a5448237f73=
d5a8593f4","src/unix/bsd/apple/mod.rs":"c9f17938a9733a426e02f4c0951eec9987d=
231f9dac925d342fca049e548b17c","src/unix/bsd/freebsdlike/dragonfly/errno.rs=
":"07b19390b9ae8f541ac35fd4e14685d639b95152d6d7a33814bb749b8b927298","src/u=
nix/bsd/freebsdlike/dragonfly/mod.rs":"f130937ac556080c77d7d1f011f2d2c964b6=
5eb633bf6b7f1251a045670b9ec8","src/unix/bsd/freebsdlike/freebsd/aarch64.rs"=
:"aea276451dca89f086d014b66e2e83e1eb948ab8dfbf920170c1b8338c9777c3","src/un=
ix/bsd/freebsdlike/freebsd/arm.rs":"f70c76405a72754db37dff7de3fd586a19e1512=
b47f452493b430f295d7264af","src/unix/bsd/freebsdlike/freebsd/freebsd11/b32.=
rs":"8d9bef35f3e490d04755a59a99ad054ef20498beff979ae8b14acbec1097318a","src=
/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"45f718f556a8368f282944d9a1=
4afae7261827ec4838d26719290466efc4f023","src/unix/bsd/freebsdlike/freebsd/f=
reebsd11/mod.rs":"400f18465ef118e202ac9b1b9db47b1333fc17eb5841709082f2d1d5a=
5179391","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"fb999d55cf4f3=
403ac934dff1fc70c666087de234d7a91321bcfb5009bbafc6f","src/unix/bsd/freebsdl=
ike/freebsd/freebsd12/x86_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743b=
faa14004692a56cee44be21","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs=
":"e6f3430838d94dd17e359419f5de7d28a6b3adb8fcab7727d24e034bc6ed5d1e","src/u=
nix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"64c4bd82eaf30a2681417f982=
fce28de7d1b0743bfaa14004692a56cee44be21","src/unix/bsd/freebsdlike/freebsd/=
freebsd14/mod.rs":"7d23d7d6b779265bca9c53c8b3e50b4dadb33f3911000ce88c8e09c9=
f0b60eab","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"d6e66809e=
109dc779efe5584b79d34fcd6fdba91973a415d64ae66f481f45940","src/unix/bsd/free=
bsdlike/freebsd/freebsd15/mod.rs":"45921502545212949a756d0edad2d861a5c6bc19=
25a4c13c8afc057ce6b4d8fe","src/unix/bsd/freebsdlike/freebsd/freebsd15/x86_6=
4.rs":"d6e66809e109dc779efe5584b79d34fcd6fdba91973a415d64ae66f481f45940","s=
rc/unix/bsd/freebsdlike/freebsd/mod.rs":"10c26d1f6c09f797578980e0310978023f=
f14e4c05977a5748d9c7d65006cc12","src/unix/bsd/freebsdlike/freebsd/powerpc.r=
s":"36912b999e0571adccc06d9ebbd237e537a95c36ddb97d67a81e940ab28b36e7","src/=
unix/bsd/freebsdlike/freebsd/powerpc64.rs":"c1c13a3e7633ab6e84929ac3bfac96a=
67779e6cdac157d64b5b9f7c2b32b1691","src/unix/bsd/freebsdlike/freebsd/riscv6=
4.rs":"b6bbfb556ed35c3897a98efffbafd5a07854dce1786643ffc1aaaa5a4e7dbe1e","s=
rc/unix/bsd/freebsdlike/freebsd/x86.rs":"8102bc641970bec32d4f2b93c8ba0e9c04=
32f84cef1442e3bf5438c3ba9c6c4d","src/unix/bsd/freebsdlike/freebsd/x86_64/mo=
d.rs":"fab655006e7b0eded6e5a6db0b0cb1efd3dee9205b9a02f315c06093100883a1","s=
rc/unix/bsd/freebsdlike/mod.rs":"31adfff1db7bed60fa8044b37ef40fbabb929b0556=
70cefe3bac88782de879f8","src/unix/bsd/mod.rs":"a776f9bf11ab5245bcddc37bde00=
2f28f84ff8f0d919d2dbc37055b3a679d86b","src/unix/bsd/netbsdlike/mod.rs":"d08=
9eef37c5888f59479c4961415b247470a662cd14a1ec65d1f3ebcd304cf31","src/unix/bs=
d/netbsdlike/netbsd/aarch64.rs":"1b526d8c7053d129548202faf3505033152d9c0a66=
82cefe2e8ae23a2a40b289","src/unix/bsd/netbsdlike/netbsd/arm.rs":"47abd680dd=
b4879648cac3d462e0daa7e980b5e6be7ba346f5f494ccdebee6e8","src/unix/bsd/netbs=
dlike/netbsd/mips.rs":"8420d476126ca2740ff2cbd1e85d0a31334e2c68dd0a70d3ac3e=
3d802b5b5782","src/unix/bsd/netbsdlike/netbsd/mod.rs":"742d6c0607ee20c81a21=
84a6378dc2d9c18f7180a0dc93aa91f830a0d1a06878","src/unix/bsd/netbsdlike/netb=
sd/powerpc.rs":"42f66be7650e95398a3687886db5053e55c77dc04eb139315bebf9668b2=
bed68","src/unix/bsd/netbsdlike/netbsd/riscv64.rs":"81664f910e884d70f0a758c=
42a17cc242db4811ce9dda1257fbd66b291cf0d52","src/unix/bsd/netbsdlike/netbsd/=
sparc64.rs":"78985b140b0337f6bb951f9db68e0db0b5a0a8131ac5c4426a342ed002e27a=
82","src/unix/bsd/netbsdlike/netbsd/x86.rs":"dda4e401f03084a87762fb68c48399=
8756a07b7c5d4b86348fc3f79380024fb7","src/unix/bsd/netbsdlike/netbsd/x86_64.=
rs":"b60e896c10ba86a59b13a189fe2e6b94265244fa4b2bc3f89a46065e7d469dea","src=
/unix/bsd/netbsdlike/openbsd/aarch64.rs":"91b6ac97e6411261cf5206ab1951a4e4e=
1f1cc9ca26217d7144f000f8f7c8580","src/unix/bsd/netbsdlike/openbsd/arm.rs":"=
f8c975d4b94a8b8d11dcc5224db628997003a8d289f12fb12b398e9445c2f122","src/unix=
/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124e09b=
d39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"2e6e0e=
94ae9dd802692bc7258deaf14a4f1b6544bc2dfa853ae753e7e4f27afb","src/unix/bsd/n=
etbsdlike/openbsd/powerpc.rs":"f8c975d4b94a8b8d11dcc5224db628997003a8d289f1=
2fb12b398e9445c2f122","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"d53f6=
ccd830b8bbe94c9be8a92a719105ed29846d6a11ce6c972fa7ff142a001","src/unix/bsd/=
netbsdlike/openbsd/riscv64.rs":"21a90502854e1aab413700edc41bd7922bc6e0fc3d7=
240aa57f258bb4546fa9c","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd2=
87afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/n=
etbsdlike/openbsd/x86.rs":"ebe65020c0d457af0458f549b8c44099a8c274d734bfa6c3=
362f0b6423fa3c7a","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"2aec823a0800=
d28fe546d35e98ae1dc671aa253663f9923d147548233def260a","src/unix/haiku/b32.r=
s":"c56aa69ed87dded0d297d44a9177577b1d2d4a79ed176e6768c7fc4dab90bfb4","src/=
unix/haiku/b64.rs":"d44daef26b89e75d58ac0204a169a66ba5fbc13fc40948f67f19700=
e6033a07e","src/unix/haiku/mod.rs":"2589765aa89ad146cf0cb942fe371340293f97a=
5aaecd2dfc0ac0f563eac86f3","src/unix/haiku/native.rs":"8dbd270e9e1d64099527=
09a5a37383bda2660008b745aa01adc02172a20bf939","src/unix/haiku/x86_64.rs":"8=
d8ef6b462bc32b3270440526f35c8dec572b502355c27ad451e64a816c4a176","src/unix/=
hurd/b32.rs":"3e79bb09b66d8a1d3b7589a4b2b2076e57bd7b51b747f5219f24d3bd2019a=
d6a","src/unix/hurd/b64.rs":"f61f0263a71f39a5130ac749bb0f146e5b95e7b054f492=
9197366f28e8c22815","src/unix/hurd/mod.rs":"37fe6e548eac4add081e157524d22de=
976dec369104a14da1e3b20a4396d45ec","src/unix/linux_like/android/b32/arm.rs"=
:"75c57d6c70f74f44b00b803975d4e81e444189ea28c4f34dea8c0570fc947076","src/un=
ix/linux_like/android/b32/mod.rs":"a94d3e03741ea30082411f0f858dd302b9a8b7b8=
a8f0d8325ecaf2f7ca70312e","src/unix/linux_like/android/b32/x86/mod.rs":"27f=
b796a7b202997ad83c2c23268cbbea3fa77cb8dfae8712501d4e5c9c9a5cf","src/unix/li=
nux_like/android/b64/aarch64/mod.rs":"03a71c8e142e098486dbe6674158317bc2f90=
a3e27132d3e9549aee8f5e3b1d0","src/unix/linux_like/android/b64/mod.rs":"186e=
dde6293b874c5ae96e10be760f38a967907fa9049bcaf8335aff51b3c6d1","src/unix/lin=
ux_like/android/b64/riscv64/mod.rs":"504de667a5e03f1a0e1cf4bcfc78bbdc156903=
7e039fafe00edda18cf7388365","src/unix/linux_like/android/b64/x86_64/mod.rs"=
:"dd3f5db929900147f0d52bd23d4cd88886cd04148db99f6961d244106e06bcfb","src/un=
ix/linux_like/android/mod.rs":"120f0df52ded5fd7d499f2254583e2bedd02adaaf27e=
b3409fe2a505a3a76198","src/unix/linux_like/emscripten/lfs64.rs":"3a1d1779bc=
f16525a578a68237f9854090eae4c9819e18ffb5a288f39be4afbe","src/unix/linux_lik=
e/emscripten/mod.rs":"358a82517c559c46906b751217eea5f918d793f8bf84c3451d472=
b2ed9a1cf77","src/unix/linux_like/linux/arch/generic/mod.rs":"695b717593cbd=
254bf8250521a261d87a39824333f35a50b7c75f252eae5a7d6","src/unix/linux_like/l=
inux/arch/mips/mod.rs":"abcb98291a77d26f0c0792f1ee87763538559f1f9d7fcbf4e8e=
6401b4442515b","src/unix/linux_like/linux/arch/mod.rs":"8bc5898b03760a95dd4=
f124ac76ad92e5ae36b2d0644203d752ef2b37e487c3a","src/unix/linux_like/linux/a=
rch/powerpc/mod.rs":"92c19d5f1ede9389f9044faf8f4f16fc5408b6fb04bbaa67c9bb1f=
69e32123e0","src/unix/linux_like/linux/arch/sparc/mod.rs":"dfd07a3a6d8b1756=
78b180ff9903e0d5d529c8112d01bd135f53fce742f433a6","src/unix/linux_like/linu=
x/gnu/b32/arm/mod.rs":"7ed85493e121e05d0d52a6751e744451548a390139a5ae947499=
fbfcff1910be","src/unix/linux_like/linux/gnu/b32/csky/mod.rs":"5fa98a93b92a=
e3336a0f6a279c0cd6a95c79ccb86443848fc96ddc1026279696","src/unix/linux_like/=
linux/gnu/b32/m68k/mod.rs":"c5717f5e2266a40144c236e05475ffb2d964c01d956745f=
29678b69170dd1a1f","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"5a19abd=
7401743cad8e6e03ddee15686bbaf7d1bd5b2710e8c2eb97224ed54f0","src/unix/linux_=
like/linux/gnu/b32/mod.rs":"a9033d128bc441cd970caa4f912d0f842ac169b573e3dfa=
5539b763609e87d70","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"ee6e9a11=
848747e0a480407ba7379befef6e2abaffc91ef7906a84e585cd2440","src/unix/linux_l=
ike/linux/gnu/b32/riscv32/mod.rs":"e576a35240eff5e1d6bca073a78f57fe8190a723=
c47c81bea287ddbd4bba7237","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":=
"5e2e2d605ca74af943e539c8c1ba410715461870b314973c444eba0fee3039cd","src/uni=
x/linux_like/linux/gnu/b32/x86/mod.rs":"4869c3fa80b115803adc0a5b77754077035=
fae36edea27c3abe1504e73f0e516","src/unix/linux_like/linux/gnu/b64/aarch64/i=
lp32.rs":"47cc25f28c4bea16c00cd6023c84d09bdc8056217f35744dfdfe27c7f2ea0ca5"=
,"src/unix/linux_like/linux/gnu/b64/aarch64/lp64.rs":"39593a2f8fd78fccbbd98=
2734c0feb9d15cb3a6a9a6b029bb972ce5b89c78420","src/unix/linux_like/linux/gnu=
/b64/aarch64/mod.rs":"24f9ec2670ec41ae3c108c0c412b39daef9faf315e0d7c3a53f1e=
f05dcd6e027","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"c0b4c6=
c252104151390dfc521ffd63e739da709dffbb5cb71a3aba6e270b6fc2","src/unix/linux=
_like/linux/gnu/b64/mips64/mod.rs":"dd6aeee535eb66b1286365119b7976dffee6216=
f6653a981963b1cc288fa7516","src/unix/linux_like/linux/gnu/b64/mod.rs":"66b8=
a981ff02176331f2402806e6ffd7d1a301fe23f285dd4e5dd2d9ed70ea1b","src/unix/lin=
ux_like/linux/gnu/b64/powerpc64/mod.rs":"450ad230da45da6ab33b4806db8ff24f6b=
1ca9b400fa2c5fb9187189a8545347","src/unix/linux_like/linux/gnu/b64/riscv64/=
mod.rs":"597c804422b1ea028f998d6c7ed61a9c54ae708b87456544597ab4f7a26a2579",=
"src/unix/linux_like/linux/gnu/b64/s390x.rs":"bcac1400cad0226c7b8b8300d6cba=
b300cd98922545c88b1968206442501aaaf","src/unix/linux_like/linux/gnu/b64/spa=
rc64/mod.rs":"006ce42969449eb5bb8cdd7c03422be2a436717b152b3982d267ed437be4d=
5e4","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"bf75505d274e3185694=
c2d5a28fecbeff276faad5cb79c7ec2122ce024b8782f","src/unix/linux_like/linux/g=
nu/b64/x86_64/not_x32.rs":"fdb2d3b26336297d34c452633afc705bcaf9c1b4e4fda359=
f695c4f708d81f17","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"54c1ac=
9bd8d9fe13eeb9b27a92baf715c9d77af1229262fce93362da72f11fe5","src/unix/linux=
_like/linux/gnu/mod.rs":"a9356a442dc62dcfb6a6a586afea9fa47fd223f33cbd17f09a=
1dcaa243c5cc0a","src/unix/linux_like/linux/mod.rs":"0ad7afb4c32fe6c69882fbd=
e2d7782338a30d652657a18c55f83392264bf4ed5","src/unix/linux_like/linux/musl/=
b32/arm/mod.rs":"64d2f81625dd6691ea81bc64a4a3ed88d41b125a7cd00ed347875b795d=
6a4905","src/unix/linux_like/linux/musl/b32/hexagon.rs":"b0247dd57999a4ddbb=
d7247a471255181e22458825c61b5464fafd36a31a8545","src/unix/linux_like/linux/=
musl/b32/mips/mod.rs":"b962ea54c35281131aaa990bf59949d54f24f9583c7191a7efc9=
c384d6159cfa","src/unix/linux_like/linux/musl/b32/mod.rs":"b9adac558a356cba=
ddb821588645590a7a11d22c1f11f6d2cc636c177f2e28e9","src/unix/linux_like/linu=
x/musl/b32/powerpc.rs":"95295bd0e58668a204799a1b5f1a0f636c67be28a959e10ee1a=
b92631b53c82f","src/unix/linux_like/linux/musl/b32/riscv32/mod.rs":"738bc36=
f9a0f312cc2336cac38ecd5390a9d91b53da51d26afd2542449b54e7b","src/unix/linux_=
like/linux/musl/b32/x86/mod.rs":"0f6e1c0d5e7d650832da95cf7dce85dff82845876e=
53b6587154e546b09d3efc","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs"=
:"8e718cec34d53079e9c841084cb2eca7942a0a66139360a833a0e2ebf0bfe95a","src/un=
ix/linux_like/linux/musl/b64/loongarch64/mod.rs":"a825259bb56e78a62f559dccf=
d1c35e686d8d15f781ce78f83c5266cc398fe82","src/unix/linux_like/linux/musl/b6=
4/mips64.rs":"be1c8bd1f406d3fb1873075cf613ec17b545200ef514423a12190d6dbc420=
16c","src/unix/linux_like/linux/musl/b64/mod.rs":"db84391acba3ed3c9462ba899=
f0f1a88747bdb5207658343ba699505bc7d4f8c","src/unix/linux_like/linux/musl/b6=
4/powerpc64.rs":"eb4d57a7201ffbfc8090bc8f97a62e1642a09d224cd70d4556d3c18cf6=
3ac802","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a14269927d8462=
88dadc72a12ff2182274cc0522abe48802b5e9e4563402b73b","src/unix/linux_like/li=
nux/musl/b64/s390x.rs":"67d922c392d53c3928798d9725d3f4336a967d1ef20c5088e49=
8cf331af17fd1","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"9e958fbd=
b3cb6c3b48d2413a73961db7259fc34863f4c2f67afa2a17b7b1af05","src/unix/linux_l=
ike/linux/musl/lfs64.rs":"308c5b5c9b2f4b1ad17e5c2d02946f84ae83e8f5cb0e789d8=
d3e76c1923a5d31","src/unix/linux_like/linux/musl/mod.rs":"c7ee52da16396aea3=
a39573ae9a0ba071500d0e966a53b938793a5ef8b3bb25c","src/unix/linux_like/linux=
/uclibc/arm/mod.rs":"1b0ce2d0d4467cc32a1dd5e5c62f0d57fc1963354ae223bdc636b8=
d6d5d6fea3","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"73d70042=
db5148d5a789880100879541563fa1de8bf5feb792341b4270244968","src/unix/linux_l=
ike/linux/uclibc/mips/mips64/mod.rs":"0a6c13d1873d3f165171a69433bb9b2df1c91=
51cc1085735613791e603865a06","src/unix/linux_like/linux/uclibc/mips/mod.rs"=
:"ead3f9c05e3bdd5d5b52f25dd4a2d154471555a6bae2d4cbd5c07e976513dcea","src/un=
ix/linux_like/linux/uclibc/mod.rs":"1cc653e9ad8524408c9023cbd7245b53b81c105=
ee3b341cb3e98c435196d191e","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs=
":"076ad477f0786a2e4944cc0550a4492b21d4b65d094006947ec40e0c7ee5365d","src/u=
nix/linux_like/linux/uclibc/x86_64/mod.rs":"889f06553111d8bdcf6a0aff344d1c2=
320ec6c067a612b46441f9e817853b5c0","src/unix/linux_like/linux/uclibc/x86_64=
/other.rs":"12f8d4049862fc0c4d94b770f2d0341c1c7bf3da0619436169c12cadc4093de=
f","src/unix/linux_like/mod.rs":"979205c66cd960da2506e3115a4950a8fe24ce963f=
dba3d5d05b9e19d8f077ea","src/unix/mod.rs":"eb23bc25b5e03276cf7c174386f5cbee=
fff1fd13a43a311d45a375a1fbf3a296","src/unix/newlib/aarch64/mod.rs":"e08ba9d=
6ac7f8b381f8699b3604cf460a5fcd5b8e68e139bba4f29bfba4781a4","src/unix/newlib=
/arm/mod.rs":"ddea29e7ce40756f2af4c9792d5cefdd0c634401aaeb146dc686f1f125e3b=
ac8","src/unix/newlib/espidf/mod.rs":"d8f90d04b485eb31092ecaeb7fca3a27e8456=
c7bb8116074febb9e00ac5c96a8","src/unix/newlib/generic.rs":"182e584f14e09849=
34130425dd2be0781ca2c131449b3ae1734a07c72c3d43cd","src/unix/newlib/horizon/=
mod.rs":"a484d84f56fd5b49fed83d6d8a5e8ec5647f0bfa3d30b496a7fa6fe5e546a980",=
"src/unix/newlib/mod.rs":"2f3e9c6217994ec34b0e3b49bf5ebe1335f3b12146f7f55a7=
97ea7041cb1f44c","src/unix/newlib/powerpc/mod.rs":"1a161a27493adb2c3b47d60e=
ebc8ac57b2f0ef0111abdcd5b4d55d11c36d37e5","src/unix/newlib/rtems/mod.rs":"2=
39c90d1daf783ff95168a3fcbc5a0c3d1f9c4b5a0ef32a0e4a22b861f82713a","src/unix/=
newlib/vita/mod.rs":"fcf4400037d9a59d1c2d2cbab874f12c3b09fa968ffcaeb53315f6=
7302c8f29d","src/unix/nto/aarch64.rs":"91d0448f932d0cf6af4f11e4f8c9d68a7810=
0ed561e560665983359b7b943075","src/unix/nto/mod.rs":"01938d623e161fb8e20e28=
d86977403023bb1645c83cec2ffef3632d7ec29750","src/unix/nto/neutrino.rs":"039=
ab7b1ed702d515f3e06d7f3536709704715a49905024b6c520696a65086f9","src/unix/nt=
o/x86_64.rs":"c8efb0f67811e440d798786911f51160c9d3d1c20fb3ca633b5e80ec05dff=
3ca","src/unix/nuttx/mod.rs":"f1f5529c96b2a3e6f1600a5bdcfea4dfb859b5e116de4=
36ea24f9965df5c64f5","src/unix/redox/mod.rs":"5c0ba01e67bcdf076057dea7f893e=
14f8ee84b8b2b1a372d39f4d000ff4fc93c","src/unix/solarish/compat.rs":"c02a889=
18852b7a9c60e45a34f7b003901000380f5c1b2832b8bd79f84936c8b","src/unix/solari=
sh/illumos.rs":"cc7104f002a5379f981c59a779ef4afad00c874e0be21dda339901cd5ee=
a4af1","src/unix/solarish/mod.rs":"2b6c62850c168e7200955ba1f52464fa03c329df=
7a4e77a30054544280308dc1","src/unix/solarish/solaris.rs":"51b6bf12427319c9a=
f9db4e1b2a984a4d75f994adcd4139f2fc878c9b92f6e1d","src/unix/solarish/x86.rs"=
:"44261c1f1b300dac9fa0dab93ec85d0c3b3c48b15bc4515b9820c9421cff7427","src/un=
ix/solarish/x86_64.rs":"768bfd0e1f4b2ac3fbbf1e2d8239ef58f21726540b9de5c72a9=
b1cd534ab0ea1","src/unix/solarish/x86_common.rs":"4ae02d88622f7f080f5e8cd32=
8f13187edbc5e124fb3e05e4cf212597f6cce48","src/vxworks/aarch64.rs":"98f0afdc=
511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/mod.rs":"6d111d4dc3b6201fd2c45b247d0592e9403ee4b65a481afda727f7422=
223f9a9","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba43=
5b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e50=
6c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/riscv32.rs":"552f=
007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/=
riscv64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b51=
4a","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122=
f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc088=
3d8b8e5f2fa917b900a7f98ed6b514a","src/wasi/mod.rs":"f7b39137ce2c005367016a0=
0e00f0affdce627d9165681c9dc9280534720640b","src/wasi/p2.rs":"feecc0485eabd2=
c32bc5d800df6ad1b9b4d282741342fb08792f2635204e1e08","src/windows/gnu/mod.rs=
":"320ddf761f731c24a27e061438ddbacb0630e3ad6f3bb39f6514c28dffd8ac9f","src/w=
indows/mod.rs":"282daeacf420e36c5ba2f8129d045104e1172b29a9035e73c10739836a8=
af440","src/windows/msvc/mod.rs":"7bc0f1e7e73815296cd6b63b2700e12624e9f47b5=
c4113a1a87fae8e64549c00","src/xous.rs":"17b571c988119fe3f71dbcccfe722de5c77=
2abc3ca20dc4b09b58780980b78e9","tests/const_fn.rs":"8ac3171d7bced3576a4e93f=
48570b3e00c553d7510ab85a7473ae3b716a812dc"},"package":"09d6582e104315a817df=
f97f75133544b2e094ee22447d2acf4a74e189ba06fc"}
> -\ No newline at end of file
> -+{"files":{"CHANGELOG.md":"ab0bd175d8a317894835d3bea1e1d78780adb818705bd=
77e230d6972c2ed3633","CONTRIBUTING.md":"155e7f4e96fafe9ee5c8adb5068be27a22d=
e89a95ca9bfc7baf517b9850d20d6","Cargo.toml":"0912337103f997c684c700d066b621=
81c7f7b9a23e4e12faaf5c1a2b54a78757","LICENSE-APACHE":"62c7a1e35f56406896d7a=
a7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f=
56a8932dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"38061c8bb60=
0c2e01b48b662288cb11f38c0ec27bbe6d496e7f0acb1016991c4","build.rs":"bcbe11dc=
711029460fcc4f7fd8e38c487006ad0860007915ae6718bd90fb891a","rustfmt.toml":"e=
9321ff995242e8cb0a4984254f0748ef11a89ca4618cab8f047ee59a88768e7","src/fixed=
_width_ints.rs":"10eb30cf48390768f0167e1fa46ae99461968a05e93bd96aff721f5455=
0ae66c","src/fuchsia/aarch64.rs":"d430586295c7eb022eb8202f7b18e483a9dd0e7de=
1857f7963453792c7161def","src/fuchsia/mod.rs":"f452b1cc842cc92c6c7676376adb=
a83c1f5ccc2460e80626099ec520ba23a48b","src/fuchsia/riscv64.rs":"7efd6cbcbd2=
cb25d6380f6df69ad91cf62efd55fb9cb7cb85884c490b601743e","src/fuchsia/x86_64.=
rs":"e63daa4085c6f6ab35d9711df6d7e027247a8b3b2a6dc47fcb2b21e1f4820a2f","src=
/hermit.rs":"35c1e248f2b3608017f696a79d4a114c889176c9d281a1544916360c62be23=
01","src/lib.rs":"a8cd1626f2dd03c25242ce82856d04625ef0c3910de6ea2df72940883=
1eeda38","src/macros.rs":"cb65803b265ba63ffe37375ae08703ab0b8b90972ed22da3c=
f7812eef421a6cd","src/psp.rs":"dcf53184a1ab06d18aa34431ca42644c5646fe78d05a=
53678ef9529607ba3ea7","src/sgx.rs":"f0f1a9fa864cd3dc94c4b3ce73f88e67f11453f=
63d8b4d52823de2ccbba7eb49","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a=
2c183408d0cad105ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef=
3b97b8c95758ad741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"01=
116b18b9be6791fdf4ff572d12154b64dfa43a18afc33940ea676e1884bdbb","src/switch=
.rs":"bb0ce1331c61a28caea7bd201e399d1e1127f303dcc7747b4f07f63d188ea49c","sr=
c/teeos/mod.rs":"7e0a8b550f1109c8247136cabb69308bd0ed2838f00ce0c99a695a3ef9=
afca22","src/trusty.rs":"2e829bfdaefbba31b907ee5ef577ebc9e8f2e2fee2cde2a4e6=
08d5219a435390","src/unix/aix/mod.rs":"4fc9eb4d97b2496aff094754cf6417713b49=
ca8fea63f29c2bdadd5336cd842b","src/unix/aix/powerpc64.rs":"666146ac9e4cb01c=
49ba046ef470d93499d91c0948d86fdce65fcd6cff6ece14","src/unix/bsd/apple/b32/m=
od.rs":"9f20c77e86b812ff09d8193a48fe4f3afd6dae8a43d5a0d78b8592971cc3726e","=
src/unix/bsd/apple/b64/aarch64/mod.rs":"1ebe9f1a1e07318813da7e2a78195937533=
c22b51a23a4527b9404c948318f86","src/unix/bsd/apple/b64/mod.rs":"164e734befe=
87fa6e2d79fb856ce314282bd219ea4f2f357c6446dca6d2de359","src/unix/bsd/apple/=
b64/x86_64/mod.rs":"e03794fdeaaf4a86c7b12f41e490a7538c12d4a77743a5448237f73=
d5a8593f4","src/unix/bsd/apple/mod.rs":"c9f17938a9733a426e02f4c0951eec9987d=
231f9dac925d342fca049e548b17c","src/unix/bsd/freebsdlike/dragonfly/errno.rs=
":"07b19390b9ae8f541ac35fd4e14685d639b95152d6d7a33814bb749b8b927298","src/u=
nix/bsd/freebsdlike/dragonfly/mod.rs":"f130937ac556080c77d7d1f011f2d2c964b6=
5eb633bf6b7f1251a045670b9ec8","src/unix/bsd/freebsdlike/freebsd/aarch64.rs"=
:"aea276451dca89f086d014b66e2e83e1eb948ab8dfbf920170c1b8338c9777c3","src/un=
ix/bsd/freebsdlike/freebsd/arm.rs":"f70c76405a72754db37dff7de3fd586a19e1512=
b47f452493b430f295d7264af","src/unix/bsd/freebsdlike/freebsd/freebsd11/b32.=
rs":"8d9bef35f3e490d04755a59a99ad054ef20498beff979ae8b14acbec1097318a","src=
/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"45f718f556a8368f282944d9a1=
4afae7261827ec4838d26719290466efc4f023","src/unix/bsd/freebsdlike/freebsd/f=
reebsd11/mod.rs":"400f18465ef118e202ac9b1b9db47b1333fc17eb5841709082f2d1d5a=
5179391","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"fb999d55cf4f3=
403ac934dff1fc70c666087de234d7a91321bcfb5009bbafc6f","src/unix/bsd/freebsdl=
ike/freebsd/freebsd12/x86_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743b=
faa14004692a56cee44be21","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs=
":"e6f3430838d94dd17e359419f5de7d28a6b3adb8fcab7727d24e034bc6ed5d1e","src/u=
nix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"64c4bd82eaf30a2681417f982=
fce28de7d1b0743bfaa14004692a56cee44be21","src/unix/bsd/freebsdlike/freebsd/=
freebsd14/mod.rs":"7d23d7d6b779265bca9c53c8b3e50b4dadb33f3911000ce88c8e09c9=
f0b60eab","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"d6e66809e=
109dc779efe5584b79d34fcd6fdba91973a415d64ae66f481f45940","src/unix/bsd/free=
bsdlike/freebsd/freebsd15/mod.rs":"45921502545212949a756d0edad2d861a5c6bc19=
25a4c13c8afc057ce6b4d8fe","src/unix/bsd/freebsdlike/freebsd/freebsd15/x86_6=
4.rs":"d6e66809e109dc779efe5584b79d34fcd6fdba91973a415d64ae66f481f45940","s=
rc/unix/bsd/freebsdlike/freebsd/mod.rs":"10c26d1f6c09f797578980e0310978023f=
f14e4c05977a5748d9c7d65006cc12","src/unix/bsd/freebsdlike/freebsd/powerpc.r=
s":"36912b999e0571adccc06d9ebbd237e537a95c36ddb97d67a81e940ab28b36e7","src/=
unix/bsd/freebsdlike/freebsd/powerpc64.rs":"c1c13a3e7633ab6e84929ac3bfac96a=
67779e6cdac157d64b5b9f7c2b32b1691","src/unix/bsd/freebsdlike/freebsd/riscv6=
4.rs":"b6bbfb556ed35c3897a98efffbafd5a07854dce1786643ffc1aaaa5a4e7dbe1e","s=
rc/unix/bsd/freebsdlike/freebsd/x86.rs":"8102bc641970bec32d4f2b93c8ba0e9c04=
32f84cef1442e3bf5438c3ba9c6c4d","src/unix/bsd/freebsdlike/freebsd/x86_64/mo=
d.rs":"fab655006e7b0eded6e5a6db0b0cb1efd3dee9205b9a02f315c06093100883a1","s=
rc/unix/bsd/freebsdlike/mod.rs":"31adfff1db7bed60fa8044b37ef40fbabb929b0556=
70cefe3bac88782de879f8","src/unix/bsd/mod.rs":"a776f9bf11ab5245bcddc37bde00=
2f28f84ff8f0d919d2dbc37055b3a679d86b","src/unix/bsd/netbsdlike/mod.rs":"d08=
9eef37c5888f59479c4961415b247470a662cd14a1ec65d1f3ebcd304cf31","src/unix/bs=
d/netbsdlike/netbsd/aarch64.rs":"1b526d8c7053d129548202faf3505033152d9c0a66=
82cefe2e8ae23a2a40b289","src/unix/bsd/netbsdlike/netbsd/arm.rs":"47abd680dd=
b4879648cac3d462e0daa7e980b5e6be7ba346f5f494ccdebee6e8","src/unix/bsd/netbs=
dlike/netbsd/mips.rs":"8420d476126ca2740ff2cbd1e85d0a31334e2c68dd0a70d3ac3e=
3d802b5b5782","src/unix/bsd/netbsdlike/netbsd/mod.rs":"742d6c0607ee20c81a21=
84a6378dc2d9c18f7180a0dc93aa91f830a0d1a06878","src/unix/bsd/netbsdlike/netb=
sd/powerpc.rs":"42f66be7650e95398a3687886db5053e55c77dc04eb139315bebf9668b2=
bed68","src/unix/bsd/netbsdlike/netbsd/riscv64.rs":"81664f910e884d70f0a758c=
42a17cc242db4811ce9dda1257fbd66b291cf0d52","src/unix/bsd/netbsdlike/netbsd/=
sparc64.rs":"78985b140b0337f6bb951f9db68e0db0b5a0a8131ac5c4426a342ed002e27a=
82","src/unix/bsd/netbsdlike/netbsd/x86.rs":"dda4e401f03084a87762fb68c48399=
8756a07b7c5d4b86348fc3f79380024fb7","src/unix/bsd/netbsdlike/netbsd/x86_64.=
rs":"b60e896c10ba86a59b13a189fe2e6b94265244fa4b2bc3f89a46065e7d469dea","src=
/unix/bsd/netbsdlike/openbsd/aarch64.rs":"91b6ac97e6411261cf5206ab1951a4e4e=
1f1cc9ca26217d7144f000f8f7c8580","src/unix/bsd/netbsdlike/openbsd/arm.rs":"=
f8c975d4b94a8b8d11dcc5224db628997003a8d289f12fb12b398e9445c2f122","src/unix=
/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124e09b=
d39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"2e6e0e=
94ae9dd802692bc7258deaf14a4f1b6544bc2dfa853ae753e7e4f27afb","src/unix/bsd/n=
etbsdlike/openbsd/powerpc.rs":"f8c975d4b94a8b8d11dcc5224db628997003a8d289f1=
2fb12b398e9445c2f122","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"d53f6=
ccd830b8bbe94c9be8a92a719105ed29846d6a11ce6c972fa7ff142a001","src/unix/bsd/=
netbsdlike/openbsd/riscv64.rs":"21a90502854e1aab413700edc41bd7922bc6e0fc3d7=
240aa57f258bb4546fa9c","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd2=
87afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/n=
etbsdlike/openbsd/x86.rs":"ebe65020c0d457af0458f549b8c44099a8c274d734bfa6c3=
362f0b6423fa3c7a","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"2aec823a0800=
d28fe546d35e98ae1dc671aa253663f9923d147548233def260a","src/unix/haiku/b32.r=
s":"c56aa69ed87dded0d297d44a9177577b1d2d4a79ed176e6768c7fc4dab90bfb4","src/=
unix/haiku/b64.rs":"d44daef26b89e75d58ac0204a169a66ba5fbc13fc40948f67f19700=
e6033a07e","src/unix/haiku/mod.rs":"2589765aa89ad146cf0cb942fe371340293f97a=
5aaecd2dfc0ac0f563eac86f3","src/unix/haiku/native.rs":"8dbd270e9e1d64099527=
09a5a37383bda2660008b745aa01adc02172a20bf939","src/unix/haiku/x86_64.rs":"8=
d8ef6b462bc32b3270440526f35c8dec572b502355c27ad451e64a816c4a176","src/unix/=
hurd/b32.rs":"3e79bb09b66d8a1d3b7589a4b2b2076e57bd7b51b747f5219f24d3bd2019a=
d6a","src/unix/hurd/b64.rs":"f61f0263a71f39a5130ac749bb0f146e5b95e7b054f492=
9197366f28e8c22815","src/unix/hurd/mod.rs":"37fe6e548eac4add081e157524d22de=
976dec369104a14da1e3b20a4396d45ec","src/unix/linux_like/android/b32/arm.rs"=
:"75c57d6c70f74f44b00b803975d4e81e444189ea28c4f34dea8c0570fc947076","src/un=
ix/linux_like/android/b32/mod.rs":"a94d3e03741ea30082411f0f858dd302b9a8b7b8=
a8f0d8325ecaf2f7ca70312e","src/unix/linux_like/android/b32/x86/mod.rs":"27f=
b796a7b202997ad83c2c23268cbbea3fa77cb8dfae8712501d4e5c9c9a5cf","src/unix/li=
nux_like/android/b64/aarch64/mod.rs":"03a71c8e142e098486dbe6674158317bc2f90=
a3e27132d3e9549aee8f5e3b1d0","src/unix/linux_like/android/b64/mod.rs":"186e=
dde6293b874c5ae96e10be760f38a967907fa9049bcaf8335aff51b3c6d1","src/unix/lin=
ux_like/android/b64/riscv64/mod.rs":"504de667a5e03f1a0e1cf4bcfc78bbdc156903=
7e039fafe00edda18cf7388365","src/unix/linux_like/android/b64/x86_64/mod.rs"=
:"dd3f5db929900147f0d52bd23d4cd88886cd04148db99f6961d244106e06bcfb","src/un=
ix/linux_like/android/mod.rs":"120f0df52ded5fd7d499f2254583e2bedd02adaaf27e=
b3409fe2a505a3a76198","src/unix/linux_like/emscripten/lfs64.rs":"3a1d1779bc=
f16525a578a68237f9854090eae4c9819e18ffb5a288f39be4afbe","src/unix/linux_lik=
e/emscripten/mod.rs":"358a82517c559c46906b751217eea5f918d793f8bf84c3451d472=
b2ed9a1cf77","src/unix/linux_like/linux/arch/generic/mod.rs":"74e073817b492=
61c7b9b194c6a7b2cb94adb7a66ee0449bfa4af169d2acbae47","src/unix/linux_like/l=
inux/arch/mips/mod.rs":"abcb98291a77d26f0c0792f1ee87763538559f1f9d7fcbf4e8e=
6401b4442515b","src/unix/linux_like/linux/arch/mod.rs":"8bc5898b03760a95dd4=
f124ac76ad92e5ae36b2d0644203d752ef2b37e487c3a","src/unix/linux_like/linux/a=
rch/powerpc/mod.rs":"92c19d5f1ede9389f9044faf8f4f16fc5408b6fb04bbaa67c9bb1f=
69e32123e0","src/unix/linux_like/linux/arch/sparc/mod.rs":"dfd07a3a6d8b1756=
78b180ff9903e0d5d529c8112d01bd135f53fce742f433a6","src/unix/linux_like/linu=
x/gnu/b32/arm/mod.rs":"7ed85493e121e05d0d52a6751e744451548a390139a5ae947499=
fbfcff1910be","src/unix/linux_like/linux/gnu/b32/csky/mod.rs":"5fa98a93b92a=
e3336a0f6a279c0cd6a95c79ccb86443848fc96ddc1026279696","src/unix/linux_like/=
linux/gnu/b32/m68k/mod.rs":"c5717f5e2266a40144c236e05475ffb2d964c01d956745f=
29678b69170dd1a1f","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"5a19abd=
7401743cad8e6e03ddee15686bbaf7d1bd5b2710e8c2eb97224ed54f0","src/unix/linux_=
like/linux/gnu/b32/mod.rs":"a9033d128bc441cd970caa4f912d0f842ac169b573e3dfa=
5539b763609e87d70","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"ee6e9a11=
848747e0a480407ba7379befef6e2abaffc91ef7906a84e585cd2440","src/unix/linux_l=
ike/linux/gnu/b32/riscv32/mod.rs":"e576a35240eff5e1d6bca073a78f57fe8190a723=
c47c81bea287ddbd4bba7237","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":=
"5e2e2d605ca74af943e539c8c1ba410715461870b314973c444eba0fee3039cd","src/uni=
x/linux_like/linux/gnu/b32/x86/mod.rs":"4869c3fa80b115803adc0a5b77754077035=
fae36edea27c3abe1504e73f0e516","src/unix/linux_like/linux/gnu/b64/aarch64/i=
lp32.rs":"47cc25f28c4bea16c00cd6023c84d09bdc8056217f35744dfdfe27c7f2ea0ca5"=
,"src/unix/linux_like/linux/gnu/b64/aarch64/lp64.rs":"39593a2f8fd78fccbbd98=
2734c0feb9d15cb3a6a9a6b029bb972ce5b89c78420","src/unix/linux_like/linux/gnu=
/b64/aarch64/mod.rs":"24f9ec2670ec41ae3c108c0c412b39daef9faf315e0d7c3a53f1e=
f05dcd6e027","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"c0b4c6=
c252104151390dfc521ffd63e739da709dffbb5cb71a3aba6e270b6fc2","src/unix/linux=
_like/linux/gnu/b64/mips64/mod.rs":"dd6aeee535eb66b1286365119b7976dffee6216=
f6653a981963b1cc288fa7516","src/unix/linux_like/linux/gnu/b64/mod.rs":"66b8=
a981ff02176331f2402806e6ffd7d1a301fe23f285dd4e5dd2d9ed70ea1b","src/unix/lin=
ux_like/linux/gnu/b64/powerpc64/mod.rs":"450ad230da45da6ab33b4806db8ff24f6b=
1ca9b400fa2c5fb9187189a8545347","src/unix/linux_like/linux/gnu/b64/riscv64/=
mod.rs":"597c804422b1ea028f998d6c7ed61a9c54ae708b87456544597ab4f7a26a2579",=
"src/unix/linux_like/linux/gnu/b64/s390x.rs":"bcac1400cad0226c7b8b8300d6cba=
b300cd98922545c88b1968206442501aaaf","src/unix/linux_like/linux/gnu/b64/spa=
rc64/mod.rs":"006ce42969449eb5bb8cdd7c03422be2a436717b152b3982d267ed437be4d=
5e4","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"bf75505d274e3185694=
c2d5a28fecbeff276faad5cb79c7ec2122ce024b8782f","src/unix/linux_like/linux/g=
nu/b64/x86_64/not_x32.rs":"fdb2d3b26336297d34c452633afc705bcaf9c1b4e4fda359=
f695c4f708d81f17","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"54c1ac=
9bd8d9fe13eeb9b27a92baf715c9d77af1229262fce93362da72f11fe5","src/unix/linux=
_like/linux/gnu/mod.rs":"a9356a442dc62dcfb6a6a586afea9fa47fd223f33cbd17f09a=
1dcaa243c5cc0a","src/unix/linux_like/linux/mod.rs":"0ad7afb4c32fe6c69882fbd=
e2d7782338a30d652657a18c55f83392264bf4ed5","src/unix/linux_like/linux/musl/=
b32/arm/mod.rs":"64d2f81625dd6691ea81bc64a4a3ed88d41b125a7cd00ed347875b795d=
6a4905","src/unix/linux_like/linux/musl/b32/hexagon.rs":"b0247dd57999a4ddbb=
d7247a471255181e22458825c61b5464fafd36a31a8545","src/unix/linux_like/linux/=
musl/b32/mips/mod.rs":"b962ea54c35281131aaa990bf59949d54f24f9583c7191a7efc9=
c384d6159cfa","src/unix/linux_like/linux/musl/b32/mod.rs":"b9adac558a356cba=
ddb821588645590a7a11d22c1f11f6d2cc636c177f2e28e9","src/unix/linux_like/linu=
x/musl/b32/powerpc.rs":"95295bd0e58668a204799a1b5f1a0f636c67be28a959e10ee1a=
b92631b53c82f","src/unix/linux_like/linux/musl/b32/riscv32/mod.rs":"738bc36=
f9a0f312cc2336cac38ecd5390a9d91b53da51d26afd2542449b54e7b","src/unix/linux_=
like/linux/musl/b32/x86/mod.rs":"0f6e1c0d5e7d650832da95cf7dce85dff82845876e=
53b6587154e546b09d3efc","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs"=
:"8e718cec34d53079e9c841084cb2eca7942a0a66139360a833a0e2ebf0bfe95a","src/un=
ix/linux_like/linux/musl/b64/loongarch64/mod.rs":"a825259bb56e78a62f559dccf=
d1c35e686d8d15f781ce78f83c5266cc398fe82","src/unix/linux_like/linux/musl/b6=
4/mips64.rs":"be1c8bd1f406d3fb1873075cf613ec17b545200ef514423a12190d6dbc420=
16c","src/unix/linux_like/linux/musl/b64/mod.rs":"db84391acba3ed3c9462ba899=
f0f1a88747bdb5207658343ba699505bc7d4f8c","src/unix/linux_like/linux/musl/b6=
4/powerpc64.rs":"eb4d57a7201ffbfc8090bc8f97a62e1642a09d224cd70d4556d3c18cf6=
3ac802","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a14269927d8462=
88dadc72a12ff2182274cc0522abe48802b5e9e4563402b73b","src/unix/linux_like/li=
nux/musl/b64/s390x.rs":"67d922c392d53c3928798d9725d3f4336a967d1ef20c5088e49=
8cf331af17fd1","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"9e958fbd=
b3cb6c3b48d2413a73961db7259fc34863f4c2f67afa2a17b7b1af05","src/unix/linux_l=
ike/linux/musl/lfs64.rs":"308c5b5c9b2f4b1ad17e5c2d02946f84ae83e8f5cb0e789d8=
d3e76c1923a5d31","src/unix/linux_like/linux/musl/mod.rs":"c7ee52da16396aea3=
a39573ae9a0ba071500d0e966a53b938793a5ef8b3bb25c","src/unix/linux_like/linux=
/uclibc/arm/mod.rs":"1b0ce2d0d4467cc32a1dd5e5c62f0d57fc1963354ae223bdc636b8=
d6d5d6fea3","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"73d70042=
db5148d5a789880100879541563fa1de8bf5feb792341b4270244968","src/unix/linux_l=
ike/linux/uclibc/mips/mips64/mod.rs":"0a6c13d1873d3f165171a69433bb9b2df1c91=
51cc1085735613791e603865a06","src/unix/linux_like/linux/uclibc/mips/mod.rs"=
:"ead3f9c05e3bdd5d5b52f25dd4a2d154471555a6bae2d4cbd5c07e976513dcea","src/un=
ix/linux_like/linux/uclibc/mod.rs":"1cc653e9ad8524408c9023cbd7245b53b81c105=
ee3b341cb3e98c435196d191e","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs=
":"076ad477f0786a2e4944cc0550a4492b21d4b65d094006947ec40e0c7ee5365d","src/u=
nix/linux_like/linux/uclibc/x86_64/mod.rs":"889f06553111d8bdcf6a0aff344d1c2=
320ec6c067a612b46441f9e817853b5c0","src/unix/linux_like/linux/uclibc/x86_64=
/other.rs":"12f8d4049862fc0c4d94b770f2d0341c1c7bf3da0619436169c12cadc4093de=
f","src/unix/linux_like/mod.rs":"979205c66cd960da2506e3115a4950a8fe24ce963f=
dba3d5d05b9e19d8f077ea","src/unix/mod.rs":"eb23bc25b5e03276cf7c174386f5cbee=
fff1fd13a43a311d45a375a1fbf3a296","src/unix/newlib/aarch64/mod.rs":"e08ba9d=
6ac7f8b381f8699b3604cf460a5fcd5b8e68e139bba4f29bfba4781a4","src/unix/newlib=
/arm/mod.rs":"ddea29e7ce40756f2af4c9792d5cefdd0c634401aaeb146dc686f1f125e3b=
ac8","src/unix/newlib/espidf/mod.rs":"d8f90d04b485eb31092ecaeb7fca3a27e8456=
c7bb8116074febb9e00ac5c96a8","src/unix/newlib/generic.rs":"182e584f14e09849=
34130425dd2be0781ca2c131449b3ae1734a07c72c3d43cd","src/unix/newlib/horizon/=
mod.rs":"a484d84f56fd5b49fed83d6d8a5e8ec5647f0bfa3d30b496a7fa6fe5e546a980",=
"src/unix/newlib/mod.rs":"2f3e9c6217994ec34b0e3b49bf5ebe1335f3b12146f7f55a7=
97ea7041cb1f44c","src/unix/newlib/powerpc/mod.rs":"1a161a27493adb2c3b47d60e=
ebc8ac57b2f0ef0111abdcd5b4d55d11c36d37e5","src/unix/newlib/rtems/mod.rs":"2=
39c90d1daf783ff95168a3fcbc5a0c3d1f9c4b5a0ef32a0e4a22b861f82713a","src/unix/=
newlib/vita/mod.rs":"fcf4400037d9a59d1c2d2cbab874f12c3b09fa968ffcaeb53315f6=
7302c8f29d","src/unix/nto/aarch64.rs":"91d0448f932d0cf6af4f11e4f8c9d68a7810=
0ed561e560665983359b7b943075","src/unix/nto/mod.rs":"01938d623e161fb8e20e28=
d86977403023bb1645c83cec2ffef3632d7ec29750","src/unix/nto/neutrino.rs":"039=
ab7b1ed702d515f3e06d7f3536709704715a49905024b6c520696a65086f9","src/unix/nt=
o/x86_64.rs":"c8efb0f67811e440d798786911f51160c9d3d1c20fb3ca633b5e80ec05dff=
3ca","src/unix/nuttx/mod.rs":"f1f5529c96b2a3e6f1600a5bdcfea4dfb859b5e116de4=
36ea24f9965df5c64f5","src/unix/redox/mod.rs":"5c0ba01e67bcdf076057dea7f893e=
14f8ee84b8b2b1a372d39f4d000ff4fc93c","src/unix/solarish/compat.rs":"c02a889=
18852b7a9c60e45a34f7b003901000380f5c1b2832b8bd79f84936c8b","src/unix/solari=
sh/illumos.rs":"cc7104f002a5379f981c59a779ef4afad00c874e0be21dda339901cd5ee=
a4af1","src/unix/solarish/mod.rs":"2b6c62850c168e7200955ba1f52464fa03c329df=
7a4e77a30054544280308dc1","src/unix/solarish/solaris.rs":"51b6bf12427319c9a=
f9db4e1b2a984a4d75f994adcd4139f2fc878c9b92f6e1d","src/unix/solarish/x86.rs"=
:"44261c1f1b300dac9fa0dab93ec85d0c3b3c48b15bc4515b9820c9421cff7427","src/un=
ix/solarish/x86_64.rs":"768bfd0e1f4b2ac3fbbf1e2d8239ef58f21726540b9de5c72a9=
b1cd534ab0ea1","src/unix/solarish/x86_common.rs":"4ae02d88622f7f080f5e8cd32=
8f13187edbc5e124fb3e05e4cf212597f6cce48","src/vxworks/aarch64.rs":"98f0afdc=
511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/mod.rs":"6d111d4dc3b6201fd2c45b247d0592e9403ee4b65a481afda727f7422=
223f9a9","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba43=
5b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e50=
6c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/riscv32.rs":"552f=
007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/=
riscv64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b51=
4a","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122=
f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc088=
3d8b8e5f2fa917b900a7f98ed6b514a","src/wasi/mod.rs":"f7b39137ce2c005367016a0=
0e00f0affdce627d9165681c9dc9280534720640b","src/wasi/p2.rs":"feecc0485eabd2=
c32bc5d800df6ad1b9b4d282741342fb08792f2635204e1e08","src/windows/gnu/mod.rs=
":"320ddf761f731c24a27e061438ddbacb0630e3ad6f3bb39f6514c28dffd8ac9f","src/w=
indows/mod.rs":"282daeacf420e36c5ba2f8129d045104e1172b29a9035e73c10739836a8=
af440","src/windows/msvc/mod.rs":"7bc0f1e7e73815296cd6b63b2700e12624e9f47b5=
c4113a1a87fae8e64549c00","src/xous.rs":"17b571c988119fe3f71dbcccfe722de5c77=
2abc3ca20dc4b09b58780980b78e9","tests/const_fn.rs":"8ac3171d7bced3576a4e93f=
48570b3e00c553d7510ab85a7473ae3b716a812dc"},"package":"09d6582e104315a817df=
f97f75133544b2e094ee22447d2acf4a74e189ba06fc"}
> -diff --git a/vendor/libc-0.2.167/src/unix/linux_like/linux/arch/generic/=
mod.rs b/vendor/libc-0.2.167/src/unix/linux_like/linux/arch/generic/mod.rs
> -index 10953fe78..e9fd7fcce 100644
> ---- a/vendor/libc-0.2.167/src/unix/linux_like/linux/arch/generic/mod.rs
> -+++ b/vendor/libc-0.2.167/src/unix/linux_like/linux/arch/generic/mod.rs
> -@@ -122,6 +122,7 @@ cfg_if! {
> -         target_arch =3D "x86_64",
> -         target_arch =3D "arm",
> -         target_arch =3D "aarch64",
> -+        target_arch =3D "riscv32",
> -         target_arch =3D "riscv64",
> -         target_arch =3D "s390x",
> -         target_arch =3D "csky",
> -@@ -258,7 +259,8 @@ cfg_if! {
> -     if #[cfg(any(
> -         target_arch =3D "x86",
> -         target_arch =3D "arm",
> --        target_arch =3D "csky"
> -+        target_arch =3D "csky",
> -+        target_arch =3D "riscv32"
> -     ))] {
> -         pub const FS_IOC_GETFLAGS: Ioctl =3D 0x80046601;
> -         pub const FS_IOC_SETFLAGS: Ioctl =3D 0x40046602;
>  diff --git a/vendor/libc-0.2.169/.cargo-checksum.json b/vendor/libc-0.2.=
169/.cargo-checksum.json
>  index 073f360a5..1e9c85b18 100644
>  --- a/vendor/libc-0.2.169/.cargo-checksum.json
> diff --git a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-t=
ool.rs-switch-off-lto-for-rust.patch b/meta/recipes-devtools/rust/files/000=
1-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
> index a7da69dce3..1ff43d11c5 100644
> --- a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-=
switch-off-lto-for-rust.patch
> +++ b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-=
switch-off-lto-for-rust.patch
> @@ -24,10 +24,10 @@ diff --git a/src/bootstrap/src/core/build_steps/tool.=
rs b/src/bootstrap/src/core
>  index 087df2f8a..00790affb 100644
>  --- a/src/bootstrap/src/core/build_steps/tool.rs
>  +++ b/src/bootstrap/src/core/build_steps/tool.rs
> -@@ -15,14 +15,12 @@
> +@@ -15,14 +15,12 @@ use std::{env, fs};
>   #[cfg(feature =3D "tracing")]
>   use tracing::instrument;
> -
> +
>  -use crate::core::build_steps::compile::is_lto_stage;
>   use crate::core::build_steps::toolstate::ToolState;
>   use crate::core::build_steps::{compile, llvm};
> @@ -42,14 +42,13 @@ index 087df2f8a..00790affb 100644
>   use crate::utils::channel::GitInfo;
>   use crate::utils::exec::{BootstrapCommand, command};
>   use crate::utils::helpers::{add_dylib_path, exe, t};
> -@@ -148,20 +146,7 @@
> +@@ -148,20 +146,7 @@ impl Step for ToolBuild {
>               &self.extra_features,
>           );
> -
> --        if path.ends_with("/rustdoc") &&
> --            // rustdoc is performance sensitive, so apply LTO to it.
> --            is_lto_stage(&self.compiler)
> --        {
> +
> +-        // Rustc tools (miri, clippy, cargo, rustfmt, rust-analyzer)
> +-        // could use the additional optimizations.
> +-        if self.mode =3D=3D Mode::ToolRustc && is_lto_stage(&self.compi=
ler) {
>  -            let lto =3D match builder.config.rust_lto {
>  -                RustcLto::Off =3D> Some("off"),
>  -                RustcLto::Thin =3D> Some("thin"),
> @@ -60,10 +59,11 @@ index 087df2f8a..00790affb 100644
>  -                cargo.env(cargo_profile_var("LTO", &builder.config), lt=
o);
>  -            }
>  -        }
> +-
>  +        cargo.rustflag("-Clto=3Doff");
> -
>           if !self.allow_features.is_empty() {
>               cargo.allow_features(self.allow_features);
> +         }
>  diff --git a/src/bootstrap/src/core/builder/mod.rs b/src/bootstrap/src/c=
ore/builder/mod.rs
>  --- a/src/bootstrap/src/core/builder/mod.rs
>  +++ b/src/bootstrap/src/core/builder/mod.rs
> diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-cra=
te-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc=
-crate-hashmap.patch
> index 911c5604b3..53b129057c 100644
> --- a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hash=
map.patch
> +++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hash=
map.patch
> @@ -64,105 +64,3 @@ index b070eeb322..ba768ff86f 100644
>  -{"files":{"CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe93057068cb1906a7f=
10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b371f7ae29e501=
e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bdd514509d98cdb=
c59e96e5f10888df4b6fca19d3a75","LICENSE-APACHE":"a60eea817514531668d7e00765=
731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39=
418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78=
333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db43=
50883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helper=
s.rs":"b766a70e39b8ea7bb57afd288bcac205a23f6a26ac5619cb1d5b10f70c5dfdea","s=
rc/detect_compiler_family.c":"97ca4b021495611e828becea6187add37414186a16dfe=
dd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5c694b2a02e5353452ee08a2=
9e4e4d4d67ea8fcbd87605df","src/parallel/async_executor.rs":"4ce24435fff6b65=
55b43fee042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.=
rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68cfa2bf557ac24e5f2","src=
/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255=
436fa063","src/parallel/stderr.rs":"74384d41198740a6fce0877f144262db09fb091=
225fa8fbfa771314bb11487c6","src/target.rs":"7313240db078ad85c1209a42a5fa96c=
3692b5d6e5093c7f366a1b99677247109","src/target/apple.rs":"6afbecac9f66aa72d=
b55694413532f80b2753f28466a6213d1aa901a03c78bcd","src/target/generated.rs":=
"af067e1c291e895ddb591f92534eed0c48977cdb2b58f8239423e07c6de31cd3","src/tar=
get/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b48154e4c8b6cb12f5373c5935d=
a6e","src/target/parser.rs":"4f2129a24273d62bf8ab339098e7f758e4e42b0df369dd=
2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08b0706916ed911d4245240e6=
0c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e6550062e021f2b394388172bbb01=
e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.rs":"52b30b24a1c31cdefb1=
05309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/windows/com.rs":"a2800d=
db81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3f2a5e3","src/windows/fi=
nd_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7bd07a83918d13a70c846564=
2e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea5295d3e4200439af3cc5c6433b=
af81502596040a89","src/windows/registry.rs":"c521b72c825e8095843e73482ffa81=
0ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cb=
ab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_i=
nstances.rs":"946527cf8fd32c3472f6a2884dcdec290763101097334c7478f9c24c3950d=
b6b","src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678=
b076147c6cdb5db046c","src/windows/windows_sys.rs":"e2714c8307bfa083b9745eb0=
e46cadd7f98d7b88abf45a7637172019324e34b8","src/windows/windows_targets.rs":=
"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2e6e2c49d1ccee"},"packag=
e":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e12706b94263b36db8"}
>  \ No newline at end of file
>  +{"files":{"CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe93057068cb1906a7f=
10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b371f7ae29e501=
e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bdd514509d98cdb=
c59e96e5f10888df4b6fca19d3a75","LICENSE-APACHE":"a60eea817514531668d7e00765=
731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39=
418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78=
333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db43=
50883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helper=
s.rs":"174101852b2633a2478cef20d063fb9c2f1b092eac47913a6e708c85663b8404","s=
rc/detect_compiler_family.c":"97ca4b021495611e828becea6187add37414186a16dfe=
dd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5c694b2a02e5353452ee08a2=
9e4e4d4d67ea8fcbd87605df","src/parallel/async_executor.rs":"4ce24435fff6b65=
55b43fee042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.=
rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68cfa2bf557ac24e5f2","src=
/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255=
436fa063","src/parallel/stderr.rs":"74384d41198740a6fce0877f144262db09fb091=
225fa8fbfa771314bb11487c6","src/target.rs":"7313240db078ad85c1209a42a5fa96c=
3692b5d6e5093c7f366a1b99677247109","src/target/apple.rs":"6afbecac9f66aa72d=
b55694413532f80b2753f28466a6213d1aa901a03c78bcd","src/target/generated.rs":=
"af067e1c291e895ddb591f92534eed0c48977cdb2b58f8239423e07c6de31cd3","src/tar=
get/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b48154e4c8b6cb12f5373c5935d=
a6e","src/target/parser.rs":"4f2129a24273d62bf8ab339098e7f758e4e42b0df369dd=
2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08b0706916ed911d4245240e6=
0c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e6550062e021f2b394388172bbb01=
e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.rs":"52b30b24a1c31cdefb1=
05309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/windows/com.rs":"a2800d=
db81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3f2a5e3","src/windows/fi=
nd_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7bd07a83918d13a70c846564=
2e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea5295d3e4200439af3cc5c6433b=
af81502596040a89","src/windows/registry.rs":"c521b72c825e8095843e73482ffa81=
0ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cb=
ab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_i=
nstances.rs":"946527cf8fd32c3472f6a2884dcdec290763101097334c7478f9c24c3950d=
b6b","src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678=
b076147c6cdb5db046c","src/windows/windows_sys.rs":"e2714c8307bfa083b9745eb0=
e46cadd7f98d7b88abf45a7637172019324e34b8","src/windows/windows_targets.rs":=
"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2e6e2c49d1ccee"},"packag=
e":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e12706b94263b36db8"}
> -diff --git a/vendor/cc-1.0.99/src/command_helpers.rs b/vendor/cc-1.0.99/=
src/command_helpers.rs
> -index fe919a5239..2b1f442019 100644
> ---- a/vendor/cc-1.0.99/src/command_helpers.rs
> -+++ b/vendor/cc-1.0.99/src/command_helpers.rs
> -@@ -257,6 +257,7 @@ fn wait_on_child(
> - /// and store them in the output Object.
> - pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Re=
sult<Vec<Object>, Error> {
> -     let mut objects =3D Vec::with_capacity(files.len());
> -+    let target_substring =3D ["rustc"];
> -     for file in files {
> -         let basename =3D file
> -             .file_name()
> -@@ -277,10 +278,29 @@ pub(crate) fn objects_from_files(files: &[Arc<Path=
>], dst: &Path) -> Result<Vec<
> -             })?
> -             .to_string_lossy();
> -
> -+        // Function to find the position of the first occurrence of the=
 target substring
> -+        fn find_target_position(s: &str, targets: &[&str]) -> Option<us=
ize> {
> -+            let mut pos =3D None;
> -+            for target in targets {
> -+                if let Some(index) =3D s.rfind(target) {
> -+                    //If a target is found and pos is None, set it
> -+                        if pos.is_none() || index < pos.unwrap() {
> -+                            pos =3D Some(index);
> -+                        }
> -+                }
> -+            }
> -+            pos
> -+        }
> -+
> -+        let filtered_dirname =3D if let Some(pos) =3D find_target_posit=
ion(&dirname, &target_substring) {
> -+            dirname[pos..].to_string()  //Keep everything from the targ=
et substring onwards
> -+        }  else {
> -+            dirname.to_string()  //If target substring is not found, ke=
ep the original dirname
> -+        };
> -         // Hash the dirname. This should prevent conflicts if we have m=
ultiple
> -         // object files with the same filename in different subfolders.
> -         let mut hasher =3D hash_map::DefaultHasher::new();
> --        hasher.write(dirname.to_string().as_bytes());
> -+        hasher.write(filtered_dirname.as_bytes());
> -         let obj =3D dst
> -             .join(format!("{:016x}-{}", hasher.finish(), basename))
> -             .with_extension("o");
> -diff --git a/vendor/cc-1.1.22/src/command_helpers.rs b/vendor/cc-1.1.22/=
src/command_helpers.rs
> -index 07dfb80412..e01b62fa39 100644
> ---- a/vendor/cc-1.1.22/src/command_helpers.rs
> -+++ b/vendor/cc-1.1.22/src/command_helpers.rs
> -@@ -285,6 +285,7 @@ fn wait_on_child(
> - /// and store them in the output Object.
> - pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Re=
sult<Vec<Object>, Error> {
> -     let mut objects =3D Vec::with_capacity(files.len());
> -+    let target_substring =3D ["rustc"];
> -     for file in files {
> -         let basename =3D file
> -             .file_name()
> -@@ -305,10 +306,29 @@ pub(crate) fn objects_from_files(files: &[Arc<Path=
>], dst: &Path) -> Result<Vec<
> -             })?
> -             .to_string_lossy();
> -
> -+        // Function to find the position of the first occurrence of the=
 target substring
> -+        fn find_target_position(s: &str, targets: &[&str]) -> Option<us=
ize> {
> -+            let mut pos =3D None;
> -+            for target in targets {
> -+                if let Some(index) =3D s.rfind(target) {
> -+                    //If a target is found and pos is None, set it
> -+                        if pos.is_none() || index < pos.unwrap() {
> -+                            pos =3D Some(index);
> -+                        }
> -+                }
> -+            }
> -+            pos
> -+        }
> -+
> -+        let filtered_dirname =3D if let Some(pos) =3D find_target_posit=
ion(&dirname, &target_substring) {
> -+            dirname[pos..].to_string()  //Keep everything from the targ=
et substring onwards
> -+        }  else {
> -+            dirname.to_string()  //If target substring is not found, ke=
ep the original dirname
> -+        };
> -         // Hash the dirname. This should prevent conflicts if we have m=
ultiple
> -         // object files with the same filename in different subfolders.
> -         let mut hasher =3D hash_map::DefaultHasher::new();
> --        hasher.write(dirname.to_string().as_bytes());
> -+        hasher.write(filtered_dirname.as_bytes());
> -         let obj =3D dst
> -             .join(format!("{:016x}-{}", hasher.finish(), basename))
> -             .with_extension("o");
> -diff --git a/vendor/cc-1.0.99/.cargo-checksum.json b/vendor/cc-1.0.99/.c=
argo-checksum.json
> -index b070eeb322..ba768ff86f 100644
> ---- a/vendor/cc-1.0.99/.cargo-checksum.json
> -+++ b/vendor/cc-1.0.99/.cargo-checksum.json
> -@@ -1 +1 @@
> --{"files":{"Cargo.lock":"1dc698513383b70d5460f3f9668b670bc72ce51ff6be79d=
139acb515b39d35da","Cargo.toml":"3c555dbe1a698f12b66c8a5748ed52ff26ff7b8ebb=
12237c1a72a1cbe4b9392e","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25d=
ac0a7598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"15afbc=
35930a5a53f00d74a8910cff35caeb5511c26642cffe5630377aced901","src/detect_com=
piler_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf39=
2f5a29","src/lib.rs":"92440d3adb5cb6ea05596d9ca860a205d3937dbf0fc959e524bac=
5f2b748c1af","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c1=
6bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295=
c965c684904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod=
.rs":"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","sr=
c/parallel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a763=
07e31597f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f17=
1648e15e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615d=
c83250b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"e13c439a96d8311ba8d37b9=
d5522cd6997d94261cbb95517c82df70525acaa7f","src/windows/com.rs":"a2800ddb81=
215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3f2a5e3","src/windows/find_t=
ools.rs":"4c350cddbce1557682b7f40cd917cc4f131ad89ff2e34c23d629014ed8d7203e"=
,"src/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9a=
e0c48ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed0=
66ad8bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab49=
2afd44c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_insta=
nces.rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587"=
,"src/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076=
147c6cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e8753=
186797793bc5d7896292c408fb44c12dfed3"},"package":"96c51067fd44124faa7f870b4=
b1c969379ad32b2ba805aa959430ceaa384f695"}
> -\ No newline at end of file
> -+{"files":{"Cargo.toml":"3c555dbe1a698f12b66c8a5748ed52ff26ff7b8ebb12237=
c1a72a1cbe4b9392e","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7b2b=
a96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a25dac0a7=
598e678e9b601a7d99a791069bddaf180dfe","src/command_helpers.rs":"4c4a9ea55a1=
09dbeada9e23d4ec963c257a56451b5fd16c7e4e8b97374f1a2ff","src/detect_compiler=
_family.c":"72903b91d7a28f49b39e7d730f4c9c4bb39fb901948fa1279cd08abf392f5a2=
9","src/lib.rs":"92440d3adb5cb6ea05596d9ca860a205d3937dbf0fc959e524bac5f2b7=
48c1af","src/parallel/async_executor.rs":"4ce24435fff6b6555b43fee042c16bd65=
d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"352a0295c965c=
684904329d334f3b9889db3a9c3f201701f8db44e4d00e00515","src/parallel/mod.rs":=
"bd9c1334d17d138c281961c690b8d8118a2d6295a7d6cd7296826255436fa063","src/par=
allel/stderr.rs":"a2d18ba3f2e04deb9047ece9ab7ca5452d9a76b515afbe20a76307e31=
597f34b","src/target_info.rs":"342be00f6215e161d8163e272a2945bb9f52f171648e=
15e11d46800a73186955","src/tempfile.rs":"47a58e904ac07da6682004b5b615dc8325=
0b253a8d3e8ba1b9bcaf6cdf4fd142","src/tool.rs":"e13c439a96d8311ba8d37b9d5522=
cd6997d94261cbb95517c82df70525acaa7f","src/windows/com.rs":"a2800ddb81215ff=
f2bf618336f5c4ff8e8bdb746dd18b795873c7304b3f2a5e3","src/windows/find_tools.=
rs":"4c350cddbce1557682b7f40cd917cc4f131ad89ff2e34c23d629014ed8d7203e","src=
/windows/mod.rs":"42f1ad7fee35a17686b003e6aa520d3d1940d47d2f531d626e9ae0c48=
ba49005","src/windows/registry.rs":"c521b72c825e8095843e73482ffa810ed066ad8=
bb9f86e6db0c5c143c171aba1","src/windows/setup_config.rs":"754439cbab492afd4=
4c9755abcbec1a41c9b2c358131cee2df13c0e996dbbec8","src/windows/vs_instances.=
rs":"76e3cee74b5fd38ddaf533bba11fe401667c50dda5f9d064099840893eaa7587","src=
/windows/winapi.rs":"250d51c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6=
cdb5db046c","src/windows/windows_sys.rs":"5a440eb39d8a0c176b66177e875318679=
7793bc5d7896292c408fb44c12dfed3"},"package":"96c51067fd44124faa7f870b4b1c96=
9379ad32b2ba805aa959430ceaa384f695"}
> -diff --git a/vendor/cc-1.1.22/.cargo-checksum.json b/vendor/cc-1.1.22/.c=
argo-checksum.json
> -index 8c7be07836..473b5ad39c 100644
> ---- a/vendor/cc-1.1.22/.cargo-checksum.json
> -+++ b/vendor/cc-1.1.22/.cargo-checksum.json
> -@@ -1 +1 @@
> --{"files":{"CHANGELOG.md":"92aeb6dec3e4b55e3951a4d00f6df20edc51545afca12=
4d983454f7c05e37357","Cargo.lock":"565d86121026a1cade3014777f9a32c97dc76b84=
3510f2c709cff3562ff04e1c","Cargo.toml":"1352b0476c28b89568e740579130ab017ad=
0f4b546083cf03ff61827d45361f3","LICENSE-APACHE":"a60eea817514531668d7e00765=
731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39=
418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78=
333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db43=
50883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helper=
s.rs":"0b54800fe5c89cd102a5f872fe1a843c1a58e026bc4bbc611e207914b8c84dda","s=
rc/detect_compiler_family.c":"97ca4b021495611e828becea6187add37414186a16dfe=
dd26c2947cbce6e8b2f","src/lib.rs":"c80c94e82937980f711500cd3289842ab4bc42bc=
c4efd9febf64729e27410ecc","src/parallel/async_executor.rs":"4ce24435fff6b65=
55b43fee042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.=
rs":"f4ed0a03d89a42bfd5527133d12b267af519b745f3f2b997ed293df15a2641b8","src=
/parallel/mod.rs":"55fb4c2d15e66677b2ed5ffa6d65ea161bcf1a1e1dc7910ee3bde06f=
2f67ab14","src/parallel/once_lock.rs":"d13e4cb82d6bca3297ca8671d83a40dd5aff=
d7ac89191d733dd451867181bb02","src/parallel/stderr.rs":"74384d41198740a6fce=
0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target_info.rs":"f939a5=
70c99d897fdd37cd491a4ee0657e2c7480ec71acbd9cbee48732d4bfbc","src/tempfile.r=
s":"ebafb5b0e5d08b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/=
tool.rs":"2e6550062e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9"=
,"src/utilities.rs":"a13bb0a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9=
e5fbfe7b53","src/windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746d=
d18b795873c7304b3f2a5e3","src/windows/find_tools.rs":"dd6b2450909cd8334a2aa=
2ce856bcc72a9654d92422267d6345d5fabfcbf57c5","src/windows/mod.rs":"34cfa201=
cfbcac7ccaa3ea5295d3e4200439af3cc5c6433baf81502596040a89","src/windows/regi=
stry.rs":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1"=
,"src/windows/setup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c35813=
1cee2df13c0e996dbbec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a=
2884dcdec290763101097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d5=
1c1826d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/w=
indows_sys.rs":"e2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324=
e34b8","src/windows/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d=
094b7bec217264ba2e6e2c49d1ccee"},"package":"9540e661f81799159abee814118cc13=
9a2004b3a3aa3ea37724a1b66530b90e0"}
> -\ No newline at end of file
> -+{"files":{"CHANGELOG.md":"92aeb6dec3e4b55e3951a4d00f6df20edc51545afca12=
4d983454f7c05e37357","Cargo.toml":"1352b0476c28b89568e740579130ab017ad0f4b5=
46083cf03ff61827d45361f3","LICENSE-APACHE":"a60eea817514531668d7e0076573144=
9fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3=
f2d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"f1ddbede208a5b78333a2=
5dac0a7598e678e9b601a7d99a791069bddaf180dfe","clippy.toml":"aa7850db4350883=
c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb1d","src/command_helpers.rs"=
:"a2ee7ae686b9cb186bebfdd597438251536bcaa9815699c95eab349385b4b949","src/de=
tect_compiler_family.c":"97ca4b021495611e828becea6187add37414186a16dfedd26c=
2947cbce6e8b2f","src/lib.rs":"c80c94e82937980f711500cd3289842ab4bc42bcc4efd=
9febf64729e27410ecc","src/parallel/async_executor.rs":"4ce24435fff6b6555b43=
fee042c16bd65d4150d0346567f246b9190d85b45983","src/parallel/job_token.rs":"=
f4ed0a03d89a42bfd5527133d12b267af519b745f3f2b997ed293df15a2641b8","src/para=
llel/mod.rs":"55fb4c2d15e66677b2ed5ffa6d65ea161bcf1a1e1dc7910ee3bde06f2f67a=
b14","src/parallel/once_lock.rs":"d13e4cb82d6bca3297ca8671d83a40dd5affd7ac8=
9191d733dd451867181bb02","src/parallel/stderr.rs":"74384d41198740a6fce0877f=
144262db09fb091225fa8fbfa771314bb11487c6","src/target_info.rs":"f939a570c99=
d897fdd37cd491a4ee0657e2c7480ec71acbd9cbee48732d4bfbc","src/tempfile.rs":"e=
bafb5b0e5d08b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.=
rs":"2e6550062e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src=
/utilities.rs":"a13bb0a351fcef72823485b1b5dc4f514c533fa4feac95deb66ed9e5fbf=
e7b53","src/windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b7=
95873c7304b3f2a5e3","src/windows/find_tools.rs":"dd6b2450909cd8334a2aa2ce85=
6bcc72a9654d92422267d6345d5fabfcbf57c5","src/windows/mod.rs":"34cfa201cfbca=
c7ccaa3ea5295d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.=
rs":"c521b72c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src=
/windows/setup_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2=
df13c0e996dbbec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884d=
cdec290763101097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c182=
6d1a2329e9889dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/window=
s_sys.rs":"e2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8=
","src/windows/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7=
bec217264ba2e6e2c49d1ccee"},"package":"9540e661f81799159abee814118cc139a200=
4b3a3aa3ea37724a1b66530b90e0"}
> diff --git a/meta/recipes-devtools/rust/files/revert-link-std-statically-=
in-rustc_driver-feature.patch b/meta/recipes-devtools/rust/files/revert-lin=
k-std-statically-in-rustc_driver-feature.patch
> index 9bbbce0182..3f920142b6 100644
> --- a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rust=
c_driver-feature.patch
> +++ b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rust=
c_driver-feature.patch
> @@ -43,14 +43,16 @@ index 39fa23766b..51d86b4009 100644
>   use rustc_hir::def_id::{CrateNum, LOCAL_CRATE};
>   use rustc_index::IndexVec;
>   use rustc_middle::bug;
> -@@ -161,44 +161,19 @@ fn calculate_type(tcx: TyCtxt<'_>, ty: CrateType) =
-> DependencyList {
> +@@ -159,46 +159,19 @@ fn calculate_type(tcx: TyCtxt<'_>, ty: CrateType) =
-> DependencyList {
>           }
>           Linkage::Dynamic | Linkage::IncludedFromDylib =3D> {}
>       }
>  -
>  -    let all_dylibs =3D || {
>  -        tcx.crates(()).iter().filter(|&&cnum| {
> --            !tcx.dep_kind(cnum).macros_only() && tcx.used_crate_source(=
cnum).dylib.is_some()
> +-            !tcx.dep_kind(cnum).macros_only()
> +-                && (tcx.used_crate_source(cnum).dylib.is_some()
> +-                    || tcx.used_crate_source(cnum).sdylib_interface.is_=
some())
>  -        })
>  -    };
>  -
> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/me=
ta/recipes-devtools/rust/files/rust-oe-selftest.patch
> index b7ef806e65..547807f94c 100644
> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> @@ -119,7 +119,7 @@ index 1a9d3d3f12f..0a9cfc48806 100644
>   fn test_get_mut_poison() {
>       let mut m =3D new_poisoned_rwlock(NonCopy(10));
>
> -@@ -567,6 +576,7 @@
> +@@ -571,6 +571,7 @@
>
>   #[test]
>   #[cfg_attr(not(panic =3D "unwind"), ignore =3D "test requires unwinding=
 support")]
> @@ -130,7 +130,7 @@ index 1a9d3d3f12f..0a9cfc48806 100644
>  diff --git a/library/test/src/tests.rs b/library/test/src/tests.rs
>  --- a/library/test/src/tests.rs
>  +++ b/library/test/src/tests.rs
> -@@ -424,6 +424,7 @@
> +@@ -414,6 +414,7 @@
>   }
>
>   #[test]
> @@ -173,7 +173,7 @@ diff --git a/compiler/rustc_data_structures/src/tagge=
d_ptr/tests.rs b/compiler/r
>  index 160af8a65d..686f4607bb 100644
>  --- a/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
>  +++ b/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
> -@@ -5,6 +5,7 @@ use crate::stable_hasher::{HashStable, StableHasher};
> +@@ -39,6 +39,7 @@ use crate::stable_hasher::{HashStable, StableHasher};
>   }
>
>   #[test]
> @@ -185,19 +185,19 @@ diff --git a/library/std/tests/thread_local/tests.r=
s b/library/std/tests/thread_
>  index 9d4f52a092..d425e5f7b7 100644
>  --- a/library/std/tests/thread_local/tests.rs
>  +++ b/library/std/tests/thread_local/tests.rs
> -@@ -346,6 +346,7 @@ fn join_orders_after_tls_destructors() {
> -
> - // Test that thread::current is still available in TLS destructors.
> +@@ -363,6 +363,7 @@ fn join_orders_after_tls_destructors() {
> + // ** musl: https://github.com/kraj/musl/blob/1880359b54ff7dd9f5016002b=
fdae4b136007dde/src/thread/pthread_key_create.c#L87
> + #[cfg(target_thread_local)]
>   #[test]
>  +#[ignore]
>   fn thread_current_in_dtor() {
> -     // Go through one round of TLS destruction first.
> -     struct Defer;
> +     use std::thread::Builder;
> +
>  diff --git a/library/alloctests/tests/sort/tests.rs b/library/alloctests=
/tests/sort/tests.rs
>  index 14e6013f96..b670f27ab4 100644
>  --- a/library/alloctests/tests/sort/tests.rs
>  +++ b/library/alloctests/tests/sort/tests.rs
> -@@ -915,12 +915,14 @@ gen_sort_test_fns_with_default_patterns_3_ty!(
> +@@ -922,12 +922,14 @@ gen_sort_test_fns_with_default_patterns_3_ty!(
>   macro_rules! instantiate_sort_test_inner {
>       ($sort_impl:ty, miri_yes, $test_fn_name:ident) =3D> {
>           #[test]
> @@ -239,7 +239,7 @@ index 5b8e5ff4f4a..e558fbd7bd7 100644
>  +
>   //@ only-linux
>   //@ aux-build:dwarf-mixed-versions-lto-aux.rs
> - //@ compile-flags: -C lto -g -Zdwarf-version=3D5
> + //@ compile-flags: -C lto -g -Cdwarf-version=3D5
>  diff --git a/tests/codegen/dont-shuffle-bswaps.rs b/tests/codegen/dont-s=
huffle-bswaps.rs
>  index 0e712bc3a4e..93965d990d0 100644
>  --- a/tests/codegen/dont-shuffle-bswaps.rs
> @@ -250,7 +250,7 @@ index 0e712bc3a4e..93965d990d0 100644
>  +//@ only-arm
>  +//@ only-aarch64
>  +
> - //@ revisions: OPT2 OPT3
> + //@ revisions: OPT2 OPT3 OPT3_S390X
>   //@[OPT2] compile-flags: -Copt-level=3D2
>   //@[OPT3] compile-flags: -C opt-level=3D3
>  diff --git a/tests/codegen/uninhabited-transparent-return-abi.rs b/tests=
/codegen/uninhabited-transparent-return-abi.rs
> @@ -280,3 +280,29 @@ index 57027364699..3faa7ea035e 100644
>   // We used to not handle all "rustic" ABIs in a (relatively) uniform wa=
y,
>   // so we failed to fix up arguments for actually passing through the AB=
I...
>   #![feature(rust_cold_cc)]
> +diff --git a/tests/codegen/simd/extract-insert-dyn.rs b/tests/codegen/si=
md/extract-insert-dyn.rs
> +index 729f0145314..1b21356518e 100644
> +--- a/tests/codegen/simd/extract-insert-dyn.rs
> ++++ b/tests/codegen/simd/extract-insert-dyn.rs
> +@@ -1,3 +1,8 @@
> ++//@ only-x86
> ++//@ only-x86_64
> ++//@ only-arm
> ++//@ only-aarch64
> ++
> + //@compile-flags: -C opt-level=3D3 -C no-prepopulate-passes
> +
> + #![feature(
> +diff --git a/tests/codegen/const-vector.rs b/tests/codegen/const-vector.=
rs
> +index 42921442e03..af0edc2ee92 100644
> +--- a/tests/codegen/const-vector.rs
> ++++ b/tests/codegen/const-vector.rs
> +@@ -1,3 +1,8 @@
> ++//@ only-x86
> ++//@ only-x86_64
> ++//@ only-arm
> ++//@ only-aarch64
> ++
> + //@ revisions: OPT0 OPT0_S390X
> + //@ [OPT0] ignore-s390x
> + //@ [OPT0_S390X] only-s390x
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.88.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/libstd-rs_1.87.0.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.88.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.87.0.bb b/m=
eta/recipes-devtools/rust/rust-cross-canadian_1.88.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.87.0.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.88.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.87.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.88.0.bb
> similarity index 99%
> rename from meta/recipes-devtools/rust/rust-llvm_1.87.0.bb
> rename to meta/recipes-devtools/rust/rust-llvm_1.88.0.bb
> index d70aa350ab..5ecc34afc2 100644
> --- a/meta/recipes-devtools/rust/rust-llvm_1.87.0.bb
> +++ b/meta/recipes-devtools/rust/rust-llvm_1.88.0.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.rust-lang.org"
>
>  # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
>  #
> -LLVM_RELEASE =3D "20.1.1"
> +LLVM_RELEASE =3D "20.1.5"
>
>  require rust-source.inc
>
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-=
devtools/rust/rust-snapshot.inc
> index 87b39a2cc2..76ec8092d1 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -4,56 +4,56 @@
>  ## The exact (previous) version that has been used is specified in the s=
ource tarball.
>  ## The version is replicated here.
>
> -SNAPSHOT_VERSION =3D "1.86.0"
> +SNAPSHOT_VERSION =3D "1.87.0"
>
> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "ccece9e59546d2e6ff3fc3b8f=
4b033aab21631c271eefbe814b3cbace6628c6e"
> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "176129577a5d560bbd94bc=
d2d24c0228bb495b73219df02556b4e4b4f0815bf7"
> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "37156542b702e8b4ffd1c5c75=
017632582343e93ca378285cdc92196c85c77e3"
> -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "e70edcf560e6b50861618d70=
45d2b38cae9e2a555f489062570e2e7041563f42"
> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "93c59a880632aa1c69e3ffaa1=
830b5b19c08341ae2cd364bf4e6d13901facfed"
> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "80fab79c1f57b7cd89a1e6=
379b2196a208352403aa7bd7f674341a172ac0697f"
> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "51e237e7f383840a404a5be72=
1491a8ca4671bf9c14e62566ecadccfcc6e4291"
> +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "38b5bb919b5e256cc8bed5b6=
9eecca577677ccb404fdd7bc3a9f2f79bede1a50"
>
> -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "976f4604d949d722738a9fe95313=
035226571128396e942b0fc678180be487b0"
> -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "ce9f0fa4b0760730e26bf315c=
ebe099f0b883436e095c5fc4b94ba20bd9f121a"
> -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "24f20bdc1bb14f4ffbdc2f540488=
bebc3340437418725c3162215ae03cdad480"
> -SRC_URI[clippy-snapshot-i686.sha256sum] =3D "6788449fa0eceebe4ea8c797bba=
f27495dad152087b3085d58dc05cacab0617a"
> +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "e59bb135589f8ca062e63ec244f6=
1a4226fa348de5221fa96e9350f3e28a5fd1"
> +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "df2bcaa75c9bfec12b4d0b431=
12c90647383865871cd0ea19f4af16b8942ac9f"
> +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "840baaa8d99087b4fbb67c57cf06=
87f53b51f387b0c44ea206d5c6262114c9ed"
> +SRC_URI[clippy-snapshot-i686.sha256sum] =3D "fbaf630b50109512573152d6679=
7760933a1aa44e4ab2056c39e2e5ef457ffd9"
>
> -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "970089ad61f8ca82017b5=
9444aee483c1fc005e3f7a6af63cd5f146df8287cce"
> -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "2f528377f57fbf81da=
35e2f08ec7ba50daddabebdce2cc86b6ec909fee157a33"
> -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "c3b8ab03b64c824f2ea25=
db578b5760d44302be3fd1e4a78404c98cba39301f4"
> -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "1ab711423497a1d02408=
a240da28ad366450574dd7f528ffaee80d1d5ed10550"
> +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "21f2e20d2dab04683f247=
71a4a1ba81500bf2d876b3f8e134b6f39ba88cafc33"
> +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "333cf7f4328c13e2ea=
0d05fa87ee0509d63c57bab570b685c891fe6113e6d36a"
> +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "ae613f51e848f09e2e2b0=
79b0036f07beee965a3a15f80b39ec1f791c72c6a8f"
> +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "7825d8bc9ab68f2015a1=
b432b26aad9f208b6293369a67887d2a2f8b5cabfb01"
>
> -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "21ea61181ba7daa04f61bec6a=
295ad76ce34bfbd74ad1d679c4548977bd82eb9"
> -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "e5ed58a861619bcc89fc3f=
969174c84fd6ed8a26b5d4b196f06efb868653c1c1"
> -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "fd832c269af81dd1ee9f38319=
91fccdc2c7312e9a9069908510eefe7c313d144"
> -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "c94578d31e4145a4169ab576=
1537a2a0133818278fb62ee76251ef8ef45228c8"
> +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "a650e3d8701c5916893845f5c=
eae1eb0bf9714ac608ef304976a9ee2ace16caf"
> +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "df327566871a7595efc393=
e8fec9cd529615d4296727a228625cffd67a322126"
> +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "b6ffefdf0c1bc00880aae0a2a=
4fc038e1412b7df364c8f601b63ca3589ef9e76"
> +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "53307af7138bf26b8cd5da20=
57c2642830969b4482560c9fb1c229d984d8abdb"
>
> -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "a54bbe16e6a405f137a0dc5=
1fd570140c80077ba769d29d885a60e74cb3196bb"
> -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "06538b41a9351c449d21=
5498d4ec2f072f728bd18df8fac7ef8534a0d0f34e27"
> -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "4d398cd8da17d1a5f26734b=
39cb17e791b243ac3570f8da2e5e5580a9dfad578"
> -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "0abf31a8cb2762a7a81dbe=
e8a5798e43e11a83326711ce00ad16c5587bcf5e49"
> +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "96c0a3d1a6f1c3d9ac67718=
7af6837e1b0fb782a270762741d02b5c299c62d77"
> +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "4a69e1a021ddd0c645fe=
7bee229a4db306c08a6f4976dc5eaf64bf95a810f7c2"
> +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "c3992ae2b799941acd29561=
978115315ccc31fae851d23c7ac93c716b7b10ad7"
> +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "7f968106335bb20b944ad0=
ff988ebe918b62a923d8f5fcfe8a998583ea22cebd"
>
> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "7585a20b02b7dd497e393=
a2e7552a0c6aabb51556fcf7507c6f7ffde530f8c88"
> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "fcf940c0553a04cb9b=
d85cce524729c2f54b000b554fee95c7aa218d608b7e3d"
> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "8fefd2317023716a01898=
6c4a62558a7b543ccf34e4e6d1104afc66edcae1c9c"
> -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "8cc65649396ccad73cec=
d17b972ab8d4c34837136cf374425be63d697b541469"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "b861d2ccaa379261d7a05=
331b25971687a9d90efbab14c58829b78abe3add2e6"
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "73ed9c6ef539095cdc=
a4e41b789b4e47effce6f796be73542f86cb9d5855a9ea"
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "2b9ef59c3c1818d6712ea=
4ec8af53720a0c2017ace80a15c287f05768ac04e0a"
> +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "1dd6d1622f4e8fe33af9=
0f4fca7851757fe2856248c36d79fdef38abc81f98b2"
>
> -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "4d1106b576221182f84412f=
3377a5148eab6950d20e45e4274cd8b58df46f26b"
> -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "b28b9c2f183521a204f2=
899610253c11c86ee4aa903fe66d8410dfaa22c926e6"
> -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "7825556908e10a48320cfb2=
d812851271d7cf549977173e028a0dd23af9d7eac"
> -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "c39c53a82fdaaa97413728=
a4f3f9feb5b31bdf3e3e563c64651bd01713e79166"
> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "45708d5767ecd589ec85206=
8dc0e0afb27427e7e9e03b4586f2cb75673f885b6"
> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "71f3a9dee3955255cd25=
ea4b15fe664284ac89591bc920667b9e47ff37f330fd"
> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "ced9e08041d4d2461159336=
6537f3f14db63cede6a4d65c1297853b72c7b72d9"
> +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "8d3665a04ecf3191196998=
f7aeb94cd6cdafba9200345387d854101629f94fe6"
>
> -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "18caf22fbfc4d26c80b39b4c6b1=
cd5fb42dba3e32d5d3600c22eae6f688d7f4c"
> -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "3919f6962d0aefdd2cd75d8d=
ba749ed826936065b64c9a8d54d1d85c2685fd66"
> -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "1c6eb1be254574881a611a3b890=
4cdcfe43c79a285875673e59c890dcd5766c2"
> -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "c87183b52ddb4085ddf2524a77=
5fd255d5fd11ad2fdd6424574f08750a8cf378"
> +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "4b961ed0731f0f4f3c1270c1655=
198a01269e6e4ca129bf1b975114e3bde511e"
> +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "9fb2a2ceb9671ab74ccceb61=
c5763c591eb1be21584b944ad7e5458edab171c9"
> +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "73402a5585c32bdc80ace0070ce=
c695768395fcc85efa0843ca42a453034a953"
> +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "bab8cff53f93466c77d2f17b00=
7132c77cf782314bfc6c3d897dc0fc1e4e6375"
>
> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "4438b809ce4a083af31ed17aee=
edcc8fc60ccffc0625bef1926620751b6989d7"
> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "67be7184ea388d8ce0feaf7=
fdea46f1775cfc2970930264343b3089898501d37"
> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "c5c1590f7e9246ad9f4f97cfe2=
6ffa92707b52a769726596a9ef81565ebd908b"
> -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "02aaff2c1407d2da8dba19aa4=
970dd873e311902b120a66cbcdbe51eb8836edf"
> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "e8395c5c5756253b76107055e0=
93ffbc4431af7b30aeebe72ce2684b9cb53973"
> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "1b57253bd32b8b292c965b3=
a2d992a266763158494cab8555584c09360b90f77"
> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "469d5dc479835adadd728bc358=
7f8abf1941b3dd71f9865abd3e0783ae662555"
> +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "9d440eef6811112a000acf96a=
062df7bcbc013fa4f8e00a7f9a4f57ef90637a1"
>
> -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "f0bddc6dba7d719b8ba131bcd=
634a8379e00fc825a51c0f17abf424c9cb5c052"
> +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "fc656140b5810a1bfa3b80456=
e416a0381dd68c565fc67fd23f945f8df80254b"
>
> -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "722238ae13e6e101d1b698=
d2b3a7915d59bb7f485b594e8d833cce8b9460383b"
> +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "2a7f654b1c31cb60b4841b=
f0a041a2fcdec9baecf8bb0f9ae1d1743862073907"
>
>  SRC_URI +=3D " \
>      ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std=
-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index ed15d9c763..efa5063b75 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -11,7 +11,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n
>              file://0001-Disable-libunwind-cross-architecture-unwinding.p=
atch;patchdir=3D${RUSTSRC} \
>              file://triagebot.patch;patchdir=3D${RUSTSRC} \
>  "
> -SRC_URI[rust.sha256sum] =3D "8623b8651893e8c6aebfa45b6a90645a4f652f7b181=
89a0992a90d11ac2631f4"
> +SRC_URI[rust.sha256sum] =3D "0c1dcbb4f762513d021e1a282c0ac58c0a423642b3a=
6bf581cafb5414df4193e"
>
>  RUSTSRC =3D "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
>
> diff --git a/meta/recipes-devtools/rust/rust_1.87.0.bb b/meta/recipes-dev=
tools/rust/rust_1.88.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust_1.87.0.bb
> rename to meta/recipes-devtools/rust/rust_1.88.0.bb
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220898): https://lists.openembedded.org/g/openembedde=
d-core/message/220898
> Mute This Topic: https://lists.openembedded.org/mt/114334370/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

