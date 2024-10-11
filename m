Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DAAD0EE19
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 17:28:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.18007.1728667703936150034
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 10:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PBodyQnV;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5399041167cso3668749e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667702; x=1729272502; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=werXJmzwjxcbGT4IMglX7XXBQGyX7086M22ETDafVrU=;
        b=PBodyQnVbHI7tOd/eDnMqxC7xb9WJaNZqaE4w7NTGzj/pVOACHLKVEc1c7mJzXNIFR
         FQOstSatAFlUmSQ+rMEf0Nt/YuXedn1RFXAL+1vB1GVsmAHqijOZv8FVk6OlpuJTlsg5
         vC407hJ3Be/GUNnk1xA5cYTuaKJvo4Doap1BbXgpWxtsoVYDPiyWF5Ex2xmv5hHw3+0n
         AjXJrleyJq4BBuno8CMvldueA2oM1IgsEQpVeQ1xBqZVQ5DPjickGIDE0ER0cKdDrHX2
         xzvmOwuOXck2ZNlHal54R8eDchnbO4HSV1PcQZJW/1xyCYRzW3LPGznUIUtk56iWlZTs
         kKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667702; x=1729272502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=werXJmzwjxcbGT4IMglX7XXBQGyX7086M22ETDafVrU=;
        b=LJ3fHoGrwAcIRrf8uw/bE9Q1oe/7sDzMnfB0kUykdjOFyB/FnAwMrAk/JU3jiZ/P0X
         /LL2QlxiVUOBBEboBFeeYFyjpqFS+6grquIvPMiCr71renLLsab/WhXFZxAQzLqlM/eb
         zjfDt2JDt+YsNTqBH9OV0pIEYMcm4QexAxDbpdtawb/wnIxrjseSZDX0Coz6qMnboZnY
         zHZEb7PEnSwsBY9Z7WhVpVA56HFu23aDc5zycrgSOeYrnbSMYXdjEMkLaKWNN+4dFIXX
         GhiiComPXs1lO57rawzThVQPTZ8/XtLtSMJhKOyAqetvfsmgwaJh5FllzhTFC0V9ebI/
         aXgg==
X-Forwarded-Encrypted: i=1; AJvYcCUCNK/6U339/dqXYx0LXE0lx5OX3MY7K8xWMmn51F4NyWIhbCrQk6pQCm7e7QtjUpcizKZaadxNpLJEcmzQ2DgQ7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5QzMjULvkAr+YgsEiYrAnR/7D9UT45e0HOdEzGBPVNYgxzj1r
	WLuBD6prdJA6Zvj7TYNx871CfKzhSpqrlqMZY2KfpDTdp8zGGj2x9wJlESZCYtUdXEEdRFEdVC3
	PiYKuy7bFrZvr58J7Cfijves1b4I=
X-Google-Smtp-Source: AGHT+IFZlU1FdKRCMnEPT/+xOSkHTXhWlEHjwgKlRwq89a4g/RxNhVN5KP64Gb+DKl6zcl4EWWi4VJERpZM0ZV/BpK0=
X-Received: by 2002:a05:6512:3402:b0:539:9ee4:baab with SMTP id
 2adb3069b0e04-539e55187c4mr254304e87.30.1728667701188; Fri, 11 Oct 2024
 10:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com> <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
In-Reply-To: <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 11 Oct 2024 10:28:09 -0700
Message-ID: <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1
To: alex.kanavin@gmail.com
Cc: Tom Geelen <t.f.g.geelen@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000043a1da062436d06f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 17:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205695

--00000000000043a1da062436d06f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The ptests are not passing on core-image-ptest-python3-cryptography (which
only has the recipe dependencies and not full python3 and all the modules).

https://snips.sh/f/9C7acm_o35
ModuleNotFoundError: No module named '__pypy__'
ModuleNotFoundError: No module named 'timeit'

I tested this by:
bitbake core-image-ptest-python3-cryptography
runqemu nographic kvm
pytest-runner 2>&1 | tee ptest-runner.log

The __pypy__ test case should arguably be disabled.
'timeit' it provided by python3, but is currently not split out into a
sub-package (so it would be in the ugly catchall python3-misc).

Reproducible builds are documented:
https://docs.yoctoproject.org/test-manual/reproducible-builds.html#reproduc=
ible-builds

OEQA_REPRODUCIBLE_TEST_TARGET =3D "python3-cryptography"
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D "python3-cryptography"
oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

The good news is that command passed.

On Fri, Oct 11, 2024 at 1:24=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> You need to build the recipe twice in two different build directories
> (you can reuse the sstate for everything else except the recipe
> itself), and compare the output.
>
> And no, it wasn't caused by other 3.13 issues, in fact it was made
> clear that 3.13 was not relevant (I first thought it was fixing the
> issues, then retracted that).
>
> Alex
>
> On Fri, 11 Oct 2024 at 09:03, Tom Geelen <t.f.g.geelen@gmail.com> wrote:
> >
> > I have checked the report of the issues that were encountered on the
> > previous upgrade try and if I understand correctly those were likely
> > caused by other Python 3.13 issues.
> > So to address your question, do I wait for the autobuilder output for
> > an answer or is there a way on how I can test the issues locally.
> >
> > Regards,
> > Tom
> >
> >
> > On Fri, Oct 11, 2024 at 7:17=E2=80=AFAM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Does this address the reproducibility issues Tim mentioned?
> > >
> > > Alex
> > >
> > > On Thu 10. Oct 2024 at 23.51, Tom Geelen via lists.openembedded.org
> <t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:
> > >>
> > >> python3-cryptography-vectors: upgrade 42.0.8 -> 43.0.1
> > >>
> > >> Changelog:
> > >> - https://cryptography.io/en/latest/changelog/#v43-0-0
> > >> - https://cryptography.io/en/latest/changelog/#v43-0-1
> > >>
> > >> Change build tool to use python3-maturin-native as specified in
> pyproject.toml file.
> > >> Performed linting on the recipe and removed packages from the ptest
> which are not required according to the included pyproject.toml.
> > >>
> > >> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> > >>
> > >> ---
> > >> Tested on x86 architecture, all tests pass
> > >>
> > >>  .../python/python3-cryptography-crates.inc    | 130
> +++++++-----------
> > >>  ...=3D> python3-cryptography-vectors_43.0.1.bb} |   8 +-
> > >>  ...toml-remove-benchmark-disable-option.patch |   8 +-
> > >>  ....0.8.bb =3D> python3-cryptography_43.0.1.bb} |  63 +++++----
> > >>  4 files changed, 89 insertions(+), 120 deletions(-)
> > >>  rename meta/recipes-devtools/python/{
> python3-cryptography-vectors_42.0.8.bb =3D>
> python3-cryptography-vectors_43.0.1.bb} (75%)
> > >>  rename meta/recipes-devtools/python/{python3-cryptography_42.0.8.bb
> =3D> python3-cryptography_43.0.1.bb} (72%)
> > >>
> > >> diff --git
> a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > >> index dbeda05dc4..319a47dabd 100644
> > >> --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > >> +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > >> @@ -2,101 +2,71 @@
> > >>
> > >>  # from src/rust/Cargo.lock
> > >>  SRC_URI +=3D " \
> > >> -    crate://crates.io/asn1/0.15.5 \
> > >> -    crate://crates.io/asn1_derive/0.15.5 \
> > >> -    crate://crates.io/autocfg/1.1.0 \
> > >> -    crate://crates.io/base64/0.21.7 \
> > >> -    crate://crates.io/bitflags/1.3.2 \
> > >> -    crate://crates.io/bitflags/2.4.2 \
> > >> -    crate://crates.io/cc/1.0.83 \
> > >> +    crate://crates.io/asn1/0.16.2 \
> > >> +    crate://crates.io/asn1_derive/0.16.2 \
> > >> +    crate://crates.io/autocfg/1.3.0 \
> > >> +    crate://crates.io/base64/0.22.1 \
> > >> +    crate://crates.io/bitflags/2.6.0 \
> > >> +    crate://crates.io/cc/1.1.6 \
> > >>      crate://crates.io/cfg-if/1.0.0 \
> > >>      crate://crates.io/foreign-types/0.3.2 \
> > >>      crate://crates.io/foreign-types-shared/0.1.1 \
> > >> -    crate://crates.io/heck/0.4.1 \
> > >> -    crate://crates.io/indoc/2.0.4 \
> > >> -    crate://crates.io/libc/0.2.152 \
> > >> -    crate://crates.io/lock_api/0.4.11 \
> > >> -    crate://crates.io/memoffset/0.9.0 \
> > >> +    crate://crates.io/heck/0.5.0 \
> > >> +    crate://crates.io/indoc/2.0.5 \
> > >> +    crate://crates.io/libc/0.2.155 \
> > >> +    crate://crates.io/memoffset/0.9.1 \
> > >>      crate://crates.io/once_cell/1.19.0 \
> > >> -    crate://crates.io/openssl/0.10.64 \
> > >> +    crate://crates.io/openssl/0.10.66 \
> > >>      crate://crates.io/openssl-macros/0.1.1 \
> > >> -    crate://crates.io/openssl-sys/0.9.102 \
> > >> -    crate://crates.io/parking_lot/0.12.1 \
> > >> -    crate://crates.io/parking_lot_core/0.9.9 \
> > >> -    crate://crates.io/pem/3.0.3 \
> > >> -    crate://crates.io/pkg-config/0.3.29 \
> > >> -    crate://crates.io/portable-atomic/1.6.0 \
> > >> -    crate://crates.io/proc-macro2/1.0.78 \
> > >> -    crate://crates.io/pyo3/0.20.3 \
> > >> -    crate://crates.io/pyo3-build-config/0.20.3 \
> > >> -    crate://crates.io/pyo3-ffi/0.20.3 \
> > >> -    crate://crates.io/pyo3-macros/0.20.3 \
> > >> -    crate://crates.io/pyo3-macros-backend/0.20.3 \
> > >> -    crate://crates.io/quote/1.0.35 \
> > >> -    crate://crates.io/redox_syscall/0.4.1 \
> > >> -    crate://crates.io/scopeguard/1.2.0 \
> > >> -    crate://crates.io/self_cell/1.0.3 \
> > >> -    crate://crates.io/smallvec/1.13.1 \
> > >> -    crate://crates.io/syn/2.0.48 \
> > >> -    crate://crates.io/target-lexicon/0.12.13 \
> > >> +    crate://crates.io/openssl-sys/0.9.103 \
> > >> +    crate://crates.io/pem/3.0.4 \
> > >> +    crate://crates.io/pkg-config/0.3.30 \
> > >> +    crate://crates.io/portable-atomic/1.7.0 \
> > >> +    crate://crates.io/proc-macro2/1.0.86 \
> > >> +    crate://crates.io/pyo3/0.22.2 \
> > >> +    crate://crates.io/pyo3-build-config/0.22.2 \
> > >> +    crate://crates.io/pyo3-ffi/0.22.2 \
> > >> +    crate://crates.io/pyo3-macros/0.22.2 \
> > >> +    crate://crates.io/pyo3-macros-backend/0.22.2 \
> > >> +    crate://crates.io/quote/1.0.36 \
> > >> +    crate://crates.io/self_cell/1.0.4 \
> > >> +    crate://crates.io/syn/2.0.71 \
> > >> +    crate://crates.io/target-lexicon/0.12.15 \
> > >>      crate://crates.io/unicode-ident/1.0.12 \
> > >>      crate://crates.io/unindent/0.2.3 \
> > >>      crate://crates.io/vcpkg/0.2.15 \
> > >> -    crate://crates.io/windows-targets/0.48.5 \
> > >> -    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> > >> -    crate://crates.io/windows_aarch64_msvc/0.48.5 \
> > >> -    crate://crates.io/windows_i686_gnu/0.48.5 \
> > >> -    crate://crates.io/windows_i686_msvc/0.48.5 \
> > >> -    crate://crates.io/windows_x86_64_gnu/0.48.5 \
> > >> -    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> > >> -    crate://crates.io/windows_x86_64_msvc/0.48.5 \
> > >>  "
> > >>
> > >> -SRC_URI[asn1-0.15.5.sha256sum] =3D
> "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
> > >> -SRC_URI[asn1_derive-0.15.5.sha256sum] =3D
> "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
> > >> -SRC_URI[autocfg-1.1.0.sha256sum] =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > >> -SRC_URI[base64-0.21.7.sha256sum] =3D
> "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
> > >> -SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> > >> -SRC_URI[bitflags-2.4.2.sha256sum] =3D
> "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
> > >> -SRC_URI[cc-1.0.83.sha256sum] =3D
> "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
> > >> +SRC_URI[asn1-0.16.2.sha256sum] =3D
> "532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd"
> > >> +SRC_URI[asn1_derive-0.16.2.sha256sum] =3D
> "56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987"
> > >> +SRC_URI[autocfg-1.3.0.sha256sum] =3D
> "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
> > >> +SRC_URI[base64-0.22.1.sha256sum] =3D
> "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> > >> +SRC_URI[bitflags-2.6.0.sha256sum] =3D
> "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
> > >> +SRC_URI[cc-1.1.6.sha256sum] =3D
> "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
> > >>  SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> > >>  SRC_URI[foreign-types-0.3.2.sha256sum] =3D
> "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
> > >>  SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D
> "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
> > >> -SRC_URI[heck-0.4.1.sha256sum] =3D
> "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> > >> -SRC_URI[indoc-2.0.4.sha256sum] =3D
> "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
> > >> -SRC_URI[libc-0.2.152.sha256sum] =3D
> "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
> > >> -SRC_URI[lock_api-0.4.11.sha256sum] =3D
> "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
> > >> -SRC_URI[memoffset-0.9.0.sha256sum] =3D
> "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
> > >> +SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> > >> +SRC_URI[indoc-2.0.5.sha256sum] =3D
> "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
> > >> +SRC_URI[libc-0.2.155.sha256sum] =3D
> "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
> > >> +SRC_URI[memoffset-0.9.1.sha256sum] =3D
> "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
> > >>  SRC_URI[once_cell-1.19.0.sha256sum] =3D
> "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
> > >> -SRC_URI[openssl-0.10.64.sha256sum] =3D
> "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
> > >> +SRC_URI[openssl-0.10.66.sha256sum] =3D
> "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
> > >>  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D
> "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
> > >> -SRC_URI[openssl-sys-0.9.102.sha256sum] =3D
> "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
> > >> -SRC_URI[parking_lot-0.12.1.sha256sum] =3D
> "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
> > >> -SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D
> "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
> > >> -SRC_URI[pem-3.0.3.sha256sum] =3D
> "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
> > >> -SRC_URI[pkg-config-0.3.29.sha256sum] =3D
> "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
> > >> -SRC_URI[portable-atomic-1.6.0.sha256sum] =3D
> "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
> > >> -SRC_URI[proc-macro2-1.0.78.sha256sum] =3D
> "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
> > >> -SRC_URI[pyo3-0.20.3.sha256sum] =3D
> "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
> > >> -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D
> "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> > >> -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D
> "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
> > >> -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D
> "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
> > >> -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D
> "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
> > >> -SRC_URI[quote-1.0.35.sha256sum] =3D
> "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
> > >> -SRC_URI[redox_syscall-0.4.1.sha256sum] =3D
> "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
> > >> -SRC_URI[scopeguard-1.2.0.sha256sum] =3D
> "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> > >> -SRC_URI[self_cell-1.0.3.sha256sum] =3D
> "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
> > >> -SRC_URI[smallvec-1.13.1.sha256sum] =3D
> "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
> > >> -SRC_URI[syn-2.0.48.sha256sum] =3D
> "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
> > >> -SRC_URI[target-lexicon-0.12.13.sha256sum] =3D
> "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
> > >> +SRC_URI[openssl-sys-0.9.103.sha256sum] =3D
> "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
> > >> +SRC_URI[pem-3.0.4.sha256sum] =3D
> "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
> > >> +SRC_URI[pkg-config-0.3.30.sha256sum] =3D
> "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
> > >> +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D
> "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
> > >> +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D
> "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
> > >> +SRC_URI[pyo3-0.22.2.sha256sum] =3D
> "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
> > >> +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D
> "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
> > >> +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D
> "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
> > >> +SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D
> "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
> > >> +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D
> "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
> > >> +SRC_URI[quote-1.0.36.sha256sum] =3D
> "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
> > >> +SRC_URI[self_cell-1.0.4.sha256sum] =3D
> "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
> > >> +SRC_URI[syn-2.0.71.sha256sum] =3D
> "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"
> > >> +SRC_URI[target-lexicon-0.12.15.sha256sum] =3D
> "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
> > >>  SRC_URI[unicode-ident-1.0.12.sha256sum] =3D
> "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
> > >>  SRC_URI[unindent-0.2.3.sha256sum] =3D
> "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
> > >>  SRC_URI[vcpkg-0.2.15.sha256sum] =3D
> "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> > >> -SRC_URI[windows-targets-0.48.5.sha256sum] =3D
> "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
> > >> -SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D
> "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
> > >> -SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D
> "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
> > >> -SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D
> "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
> > >> -SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D
> "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
> > >> -SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D
> "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
> > >> -SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D
> "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
> > >> -SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D
> "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
> > >> diff --git a/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb b/meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.1.bb
> > >> similarity index 75%
> > >> rename from meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb
> > >> rename to meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.1.bb
> > >> index 1256e75c47..7b8216b05e 100644
> > >> --- a/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb
> > >> +++ b/meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.1.bb
> > >> @@ -9,19 +9,19 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
> > >>  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
> > >>  #       Upgrade both recipes at the same time
> > >>
> > >> -SRC_URI[sha256sum] =3D
> "df5657367bc0a90c374309cb261009a2c53cae91a458781339a0f724f819a46a"
> > >> +SRC_URI[sha256sum] =3D
> "68a0fc18fe27b309e933a293a54f3356b78a14c15207e96c9ff85681af0509de"
> > >>
> > >>  PYPI_PACKAGE =3D "cryptography_vectors"
> > >>
> > >>  inherit pypi python_setuptools_build_meta
> > >>
> > >> -DEPENDS +=3D " \
> > >> +DEPENDS +=3D "\
> > >>      python3-cryptography \
> > >>  "
> > >>
> > >>  do_install:append () {
> > >> -       # Remove the sha256 checksum lines for pycache files
> > >> -       sed
> ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/RECOR=
D
> -e '/__pycache__/d' -i
> > >> +    # Remove the sha256 checksum lines for pycache files
> > >> +    sed
> ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/RECOR=
D
> -e '/__pycache__/d' -i
> > >>  }
> > >>
> > >>  BBCLASSEXTEND =3D "native nativesdk"
> > >> diff --git
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > >> index 3eed171ffe..907e462653 100644
> > >> ---
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > >> +++
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > >> @@ -1,4 +1,4 @@
> > >> -From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00
> 2001
> > >> +From 31b9e612eae62452c786a5aecdcf89b131afc8fa Mon Sep 17 00:00:00
> 2001
> > >>  From: Mingli Yu <mingli.yu@windriver.com>
> > >>  Date: Tue, 17 May 2022 17:22:48 +0800
> > >>  Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
> > >> @@ -26,11 +26,11 @@ Signed-off-by: Tim Orling <
> tim.orling@konsulko.com>
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >>  diff --git a/pyproject.toml b/pyproject.toml
> > >> -index d2e304f..10aabcf 100644
> > >> +index e5b801d..985fc8c 100644
> > >>  --- a/pyproject.toml
> > >>  +++ b/pyproject.toml
> > >> -@@ -92,7 +92,7 @@ rust-version =3D ">=3D1.63.0"
> > >> -
> > >> +@@ -117,7 +117,7 @@ exclude =3D [
> > >> + ]
> > >>
> > >>   [tool.pytest.ini_options]
> > >>  -addopts =3D "-r s --capture=3Dno --strict-markers --benchmark-disa=
ble"
> > >> diff --git a/meta/recipes-devtools/python/
> python3-cryptography_42.0.8.bb b/meta/recipes-devtools/python/
> python3-cryptography_43.0.1.bb
> > >> similarity index 72%
> > >> rename from meta/recipes-devtools/python/
> python3-cryptography_42.0.8.bb
> > >> rename to meta/recipes-devtools/python/python3-cryptography_43.0.1.b=
b
> > >> index 3f70f910d4..4a97f33736 100644
> > >> --- a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
> > >> +++ b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
> > >> @@ -8,43 +8,21 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
> > >>                     "
> > >>  LDSHARED +=3D "-pthread"
> > >>
> > >> -SRC_URI[sha256sum] =3D
> "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
> > >> -
> > >> -SRC_URI +=3D
> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> > >> -            file://check-memfree.py \
> > >> -            file://run-ptest \
> > >> -           "
> > >> -
> > >> -require ${BPN}-crates.inc
> > >> -
> > >> -inherit pypi python_setuptools3_rust cargo-update-recipe-crates
> pkgconfig
> > >> -
> > >> -DEPENDS +=3D " \
> > >> +DEPENDS +=3D "\
> > >>      python3-cffi-native \
> > >>  "
> > >>
> > >> -RDEPENDS:${PN} +=3D " \
> > >> -    python3-cffi \
> > >> -"
> > >> +SRC_URI[sha256sum] =3D
> "203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb35f598fbe463ae3444d"
> > >>
> > >> -RDEPENDS:${PN}:append:class-target =3D " \
> > >> -    python3-numbers \
> > >> -    python3-threading \
> > >> +SRC_URI:append =3D " \
> > >> +    file://0001-pyproject.toml-remove-benchmark-disable-option.patc=
h
> \
> > >> +    file://check-memfree.py \
> > >> +    file://run-ptest \
> > >>  "
> > >>
> > >> -RDEPENDS:${PN}-ptest +=3D " \
> > >> -    python3-bcrypt \
> > >> -    python3-cryptography-vectors (=3D ${PV}) \
> > >> -    python3-hypothesis \
> > >> -    python3-iso8601 \
> > >> -    python3-mmap \
> > >> -    python3-pretend \
> > >> -    python3-psutil \
> > >> -    python3-pytest \
> > >> -    python3-unittest-automake-output \
> > >> -    python3-pytest-subtests \
> > >> -    python3-pytz \
> > >> -"
> > >> +require ${BPN}-crates.inc
> > >> +
> > >> +inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
> > >>
> > >>  inherit ptest
> > >>
> > >> @@ -60,8 +38,29 @@ do_install_ptest() {
> > >>      cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
> > >>  }
> > >>
> > >> -FILES:${PN}-dbg +=3D " \
> > >> +FILES:${PN}-dbg +=3D "\
> > >>      ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
> > >>  "
> > >>
> > >> +RDEPENDS:${PN} +=3D "\
> > >> +    python3-cffi \
> > >> +"
> > >> +
> > >> +RDEPENDS:${PN}:append:class-target =3D " \
> > >> +    python3-numbers \
> > >> +    python3-threading \
> > >> +"
> > >> +
> > >> +RDEPENDS:${PN}-ptest +=3D "\
> > >> +    python3-certifi \
> > >> +    python3-cryptography-vectors (=3D ${PV}) \
> > >> +    python3-pretend \
> > >> +    python3-pytest \
> > >> +    python3-pytest-benchmark \
> > >> +    python3-pytest-cov \
> > >> +    python3-pytest-subtests \
> > >> +    python3-pytest-xdist \
> > >> +    python3-unittest-automake-output \
> > >> +"
> > >> +
> > >>  BBCLASSEXTEND =3D "native nativesdk"
> > >> --
> > >> 2.43.0
> > >>
> > >>
> > >>
> > >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205663):
> https://lists.openembedded.org/g/openembedded-core/message/205663
> Mute This Topic: https://lists.openembedded.org/mt/108938651/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000043a1da062436d06f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The ptests are not passing on core-image-ptest-python=
3-cryptography (which only has the recipe dependencies and not full python3=
 and all the modules).</div><div><br></div><div><a href=3D"https://snips.sh=
/f/9C7acm_o35">https://snips.sh/f/9C7acm_o35</a><br></div><div>ModuleNotFou=
ndError: No module named &#39;__pypy__&#39;<br></div><div>ModuleNotFoundErr=
or: No module named &#39;timeit&#39;<br></div><div><br></div><div>I tested =
this by:</div><div>bitbake core-image-ptest-python3-cryptography</div><div>=
runqemu nographic kvm</div><div>pytest-runner 2&gt;&amp;1 | tee ptest-runne=
r.log</div><div><br></div><div>The __pypy__ test case should arguably be di=
sabled.</div><div>&#39;timeit&#39; it provided by python3, but is currently=
 not split out into a sub-package (so it would be in the ugly catchall pyth=
on3-misc).</div><div><br></div><div>Reproducible=C2=A0builds are documented=
:=C2=A0<a href=3D"https://docs.yoctoproject.org/test-manual/reproducible-bu=
ilds.html#reproducible-builds">https://docs.yoctoproject.org/test-manual/re=
producible-builds.html#reproducible-builds</a></div><div><br></div><div>OEQ=
A_REPRODUCIBLE_TEST_TARGET =3D &quot;python3-cryptography&quot;<br>OEQA_REP=
RODUCIBLE_TEST_SSTATE_TARGETS =3D &quot;python3-cryptography&quot;<br></div=
><div>oe-selftest -r reproducible.ReproducibleTests.test_reproducible_build=
s<br></div>=C2=A0<div>The good news is that command passed.<br><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 11, 20=
24 at 1:24=E2=80=AFAM Alexander Kanavin via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">You need =
to build the recipe twice in two different build directories<br>
(you can reuse the sstate for everything else except the recipe<br>
itself), and compare the output.<br>
<br>
And no, it wasn&#39;t caused by other 3.13 issues, in fact it was made<br>
clear that 3.13 was not relevant (I first thought it was fixing the<br>
issues, then retracted that).<br>
<br>
Alex<br>
<br>
On Fri, 11 Oct 2024 at 09:03, Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen=
@gmail.com" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I have checked the report of the issues that were encountered on the<b=
r>
&gt; previous upgrade try and if I understand correctly those were likely<b=
r>
&gt; caused by other Python 3.13 issues.<br>
&gt; So to address your question, do I wait for the autobuilder output for<=
br>
&gt; an answer or is there a way on how I can test the issues locally.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Tom<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Oct 11, 2024 at 7:17=E2=80=AFAM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Does this address the reproducibility issues Tim mentioned?<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt; On Thu 10. Oct 2024 at 23.51, Tom Geelen via <a href=3D"http://li=
sts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedd=
ed.org</a> &lt;t.f.g.geelen=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; python3-cryptography-vectors: upgrade 42.0.8 -&gt; 43.0.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Changelog:<br>
&gt; &gt;&gt; - <a href=3D"https://cryptography.io/en/latest/changelog/#v43=
-0-0" rel=3D"noreferrer" target=3D"_blank">https://cryptography.io/en/lates=
t/changelog/#v43-0-0</a><br>
&gt; &gt;&gt; - <a href=3D"https://cryptography.io/en/latest/changelog/#v43=
-0-1" rel=3D"noreferrer" target=3D"_blank">https://cryptography.io/en/lates=
t/changelog/#v43-0-1</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Change build tool to use python3-maturin-native as specified =
in pyproject.toml file.<br>
&gt; &gt;&gt; Performed linting on the recipe and removed packages from the=
 ptest which are not required according to the included pyproject.toml.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@=
gmail.com" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt; Tested on x86 architecture, all tests pass<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 .../python/python3-cryptography-crates.inc=C2=A0 =C2=A0=
 | 130 +++++++-----------<br>
&gt; &gt;&gt;=C2=A0 ...=3D&gt; <a href=3D"http://python3-cryptography-vecto=
rs_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography-vec=
tors_43.0.1.bb</a>} |=C2=A0 =C2=A08 +-<br>
&gt; &gt;&gt;=C2=A0 ...toml-remove-benchmark-disable-option.patch |=C2=A0 =
=C2=A08 +-<br>
&gt; &gt;&gt;=C2=A0 ....<a href=3D"http://0.8.bb" rel=3D"noreferrer" target=
=3D"_blank">0.8.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_43.0.=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_43.0.1.bb</=
a>} |=C2=A0 63 +++++----<br>
&gt; &gt;&gt;=C2=A0 4 files changed, 89 insertions(+), 120 deletions(-)<br>
&gt; &gt;&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://=
python3-cryptography-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-cryptography-vectors_42.0.8.bb</a> =3D&gt; <a href=3D"http://pyth=
on3-cryptography-vectors_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-cryptography-vectors_43.0.1.bb</a>} (75%)<br>
&gt; &gt;&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://=
python3-cryptography_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-cryptography_42.0.8.bb</a> =3D&gt; <a href=3D"http://python3-cryptography=
_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_43.0.=
1.bb</a>} (72%)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/python/python3-cryptograph=
y-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc=
<br>
&gt; &gt;&gt; index dbeda05dc4..319a47dabd 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/python/python3-cryptography-crate=
s.inc<br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/python/python3-cryptography-crate=
s.inc<br>
&gt; &gt;&gt; @@ -2,101 +2,71 @@<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 # from src/rust/Cargo.lock<br>
&gt; &gt;&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.15.=
5" rel=3D"noreferrer" target=3D"_blank">crates.io/asn1/0.15.5</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_deriv=
e/0.15.5" rel=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.15.5=
</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.=
1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.2=
1.7" rel=3D"noreferrer" target=3D"_blank">crates.io/base64/0.21.7</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1=
.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<b=
r>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2=
.4.2" rel=3D"noreferrer" target=3D"_blank">crates.io/bitflags/2.4.2</a> \<b=
r>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.83"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/cc/1.0.83</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.16.=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/asn1/0.16.2</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_deriv=
e/0.16.2" rel=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.16.2=
</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.=
3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.3.0</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.2=
2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/base64/0.22.1</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2=
.6.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bitflags/2.6.0</a> \<b=
r>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.1.6" =
rel=3D"noreferrer" target=3D"_blank">crates.io/cc/1.1.6</a> \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-i=
f/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<=
br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/forei=
gn-types/0.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-type=
s/0.3.2</a> \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/forei=
gn-types-shared/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/forei=
gn-types-shared/0.1.1</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.4.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/heck/0.4.1</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.=
4" rel=3D"noreferrer" target=3D"_blank">crates.io/indoc/2.0.4</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.1=
52" rel=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.152</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0=
.4.11" rel=3D"noreferrer" target=3D"_blank">crates.io/lock_api/0.4.11</a> \=
<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/=
0.9.0" rel=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.9.0</a> \=
<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.5.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/heck/0.5.0</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.=
5" rel=3D"noreferrer" target=3D"_blank">crates.io/indoc/2.0.5</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.1=
55" rel=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.155</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/=
0.9.1" rel=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.9.1</a> \=
<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_=
cell/1.19.0" rel=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.19.=
0</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.=
10.64" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl/0.10.64</a> \=
<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.=
10.66" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl/0.10.66</a> \=
<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/opens=
sl-macros/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-mac=
ros/0.1.1</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sy=
s/0.9.102" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.1=
02</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lo=
t/0.12.1" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.12.1=
</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lo=
t_core/0.9.9" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_co=
re/0.9.9</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.3"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pem/3.0.3</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config=
/0.3.29" rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.29</=
a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-a=
tomic/1.6.0" rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic=
/1.6.0</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro=
2/1.0.78" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.78=
</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.=
3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3/0.20.3</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build=
-config/0.20.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-c=
onfig/0.20.3</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0=
.20.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.3</a> \=
<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macro=
s/0.20.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.3=
</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macro=
s-backend/0.20.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macro=
s-backend/0.20.3</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.=
35" rel=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.35</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_sysc=
all/0.4.1" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.4=
.1</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard=
/1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.2.0</a>=
 \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/=
1.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io/self_cell/1.0.3</a> \=
<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1=
.13.1" rel=3D"noreferrer" target=3D"_blank">crates.io/smallvec/1.13.1</a> \=
<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.48=
" rel=3D"noreferrer" target=3D"_blank">crates.io/syn/2.0.48</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lex=
icon/0.12.13" rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon=
/0.12.13</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sy=
s/0.9.103" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.1=
03</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.4"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pem/3.0.4</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config=
/0.3.30" rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.30</=
a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-a=
tomic/1.7.0" rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic=
/1.7.0</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro=
2/1.0.86" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.86=
</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.22.=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3/0.22.2</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build=
-config/0.22.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-c=
onfig/0.22.2</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0=
.22.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.22.2</a> \=
<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macro=
s/0.22.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.22.2=
</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macro=
s-backend/0.22.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macro=
s-backend/0.22.2</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.=
36" rel=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.36</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/=
1.0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/self_cell/1.0.4</a> \=
<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.71=
" rel=3D"noreferrer" target=3D"_blank">crates.io/syn/2.0.71</a> \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lex=
icon/0.12.15" rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon=
/0.12.15</a> \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unico=
de-ident/1.0.12" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ide=
nt/1.0.12</a> \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unind=
ent/0.2.3" rel=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.2.3</a=
> \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/vcpkg=
/0.2.15" rel=3D"noreferrer" target=3D"_blank">crates.io/vcpkg/0.2.15</a> \<=
br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-ta=
rgets/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-target=
s/0.48.5</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aa=
rch64_gnullvm/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/window=
s_aarch64_gnullvm/0.48.5</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aa=
rch64_msvc/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_a=
arch64_msvc/0.48.5</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i6=
86_gnu/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_=
gnu/0.48.5</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i6=
86_msvc/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686=
_msvc/0.48.5</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x8=
6_64_gnu/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86=
_64_gnu/0.48.5</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x8=
6_64_gnullvm/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows=
_x86_64_gnullvm/0.48.5</a> \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x8=
6_64_msvc/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x8=
6_64_msvc/0.48.5</a> \<br>
&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -SRC_URI[asn1-0.15.5.sha256sum] =3D &quot;ae3ecbce89a22627b5e=
8e6e11d69715617138290289e385cde773b1fe50befdb&quot;<br>
&gt; &gt;&gt; -SRC_URI[asn1_derive-0.15.5.sha256sum] =3D &quot;861af988fac4=
60ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c&quot;<br>
&gt; &gt;&gt; -SRC_URI[autocfg-1.1.0.sha256sum] =3D &quot;d468802bab17cbc0c=
c575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
&gt; &gt;&gt; -SRC_URI[base64-0.21.7.sha256sum] =3D &quot;9d297deb1925b89f2=
ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567&quot;<br>
&gt; &gt;&gt; -SRC_URI[bitflags-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1d=
de094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
&gt; &gt;&gt; -SRC_URI[bitflags-2.4.2.sha256sum] =3D &quot;ed570934406eb164=
38a4e976b1b4500774099c13b8cb96eec99f620f05090ddf&quot;<br>
&gt; &gt;&gt; -SRC_URI[cc-1.0.83.sha256sum] =3D &quot;f1174fb0b6ec23863f8b9=
71027804a42614e347eafb0a95bf0b12cdae21fc4d0&quot;<br>
&gt; &gt;&gt; +SRC_URI[asn1-0.16.2.sha256sum] =3D &quot;532ceda058281b62096=
b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd&quot;<br>
&gt; &gt;&gt; +SRC_URI[asn1_derive-0.16.2.sha256sum] =3D &quot;56e6076d38cc=
17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987&quot;<br>
&gt; &gt;&gt; +SRC_URI[autocfg-1.3.0.sha256sum] =3D &quot;0c4b4d0bd25bd0b74=
681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0&quot;<br>
&gt; &gt;&gt; +SRC_URI[base64-0.22.1.sha256sum] =3D &quot;72b3254f16251a838=
1aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6&quot;<br>
&gt; &gt;&gt; +SRC_URI[bitflags-2.6.0.sha256sum] =3D &quot;b048fb63fd8b5923=
fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de&quot;<br>
&gt; &gt;&gt; +SRC_URI[cc-1.1.6.sha256sum] =3D &quot;2aba8f4e9906c7ce3c7346=
3f62a7f0c65183ada1a2d47e397cc8810827f9694f&quot;<br>
&gt; &gt;&gt;=C2=A0 SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761=
588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
&gt; &gt;&gt;=C2=A0 SRC_URI[foreign-types-0.3.2.sha256sum] =3D &quot;f6f339=
eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1&quot;<br>
&gt; &gt;&gt;=C2=A0 SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D &quot=
;00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b&quot;<br>
&gt; &gt;&gt; -SRC_URI[heck-0.4.1.sha256sum] =3D &quot;95505c38b4572b2d910c=
ecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8&quot;<br>
&gt; &gt;&gt; -SRC_URI[indoc-2.0.4.sha256sum] =3D &quot;1e186cfbae8084e513d=
aff4240b4797e342f988cecda4fb6c939150f96315fd8&quot;<br>
&gt; &gt;&gt; -SRC_URI[libc-0.2.152.sha256sum] =3D &quot;13e3bf6590cbc649f4=
d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7&quot;<br>
&gt; &gt;&gt; -SRC_URI[lock_api-0.4.11.sha256sum] =3D &quot;3c168f8615b12bc=
01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45&quot;<br>
&gt; &gt;&gt; -SRC_URI[memoffset-0.9.0.sha256sum] =3D &quot;5a634b1c61a9558=
5bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c&quot;<br>
&gt; &gt;&gt; +SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b5=
5b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea&quot;<br>
&gt; &gt;&gt; +SRC_URI[indoc-2.0.5.sha256sum] =3D &quot;b248f5224d1d606005e=
02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5&quot;<br>
&gt; &gt;&gt; +SRC_URI[libc-0.2.155.sha256sum] =3D &quot;97b3888a4aecf77e81=
1145cadf6eef5901f4782c53886191b2f693f24761847c&quot;<br>
&gt; &gt;&gt; +SRC_URI[memoffset-0.9.1.sha256sum] =3D &quot;488016bfae457b0=
36d996092f6cb448677611ce4449e970ceaf42695203f218a&quot;<br>
&gt; &gt;&gt;=C2=A0 SRC_URI[once_cell-1.19.0.sha256sum] =3D &quot;3fdb12b24=
76b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92&quot;<br>
&gt; &gt;&gt; -SRC_URI[openssl-0.10.64.sha256sum] =3D &quot;95a0481286a3108=
08298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f&quot;<br>
&gt; &gt;&gt; +SRC_URI[openssl-0.10.66.sha256sum] =3D &quot;9529f4786b70a3e=
8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1&quot;<br>
&gt; &gt;&gt;=C2=A0 SRC_URI[openssl-macros-0.1.1.sha256sum] =3D &quot;a9486=
66b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c&quot;<br>
&gt; &gt;&gt; -SRC_URI[openssl-sys-0.9.102.sha256sum] =3D &quot;c597637d56f=
bc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2&quot;<br>
&gt; &gt;&gt; -SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quot;3742b2c103b9=
f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f&quot;<br>
&gt; &gt;&gt; -SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D &quot;4c42a922=
6546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e&quot;<br>
&gt; &gt;&gt; -SRC_URI[pem-3.0.3.sha256sum] =3D &quot;1b8fcc794035347fb64be=
da2d3b462595dd2753e3f268d89c5aae77e8cf2c310&quot;<br>
&gt; &gt;&gt; -SRC_URI[pkg-config-0.3.29.sha256sum] =3D &quot;2900ede94e305=
130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb&quot;<br>
&gt; &gt;&gt; -SRC_URI[portable-atomic-1.6.0.sha256sum] =3D &quot;7170ef998=
8bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0&quot;<br>
&gt; &gt;&gt; -SRC_URI[proc-macro2-1.0.78.sha256sum] =3D &quot;e2422ad645d8=
9c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae&quot;<br>
&gt; &gt;&gt; -SRC_URI[pyo3-0.20.3.sha256sum] =3D &quot;53bdbb96d49157e65d4=
5cc287af5f32ffadd5f4761438b527b055fb0d4bb8233&quot;<br>
&gt; &gt;&gt; -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D &quot;deaa57=
45de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7&quot;<br>
&gt; &gt;&gt; -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D &quot;62b42531d03e08d=
4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa&quot;<br>
&gt; &gt;&gt; -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D &quot;7305c720fa01=
b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158&quot;<br>
&gt; &gt;&gt; -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D &quot;7c7e=
9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185&quot;<br>
&gt; &gt;&gt; -SRC_URI[quote-1.0.35.sha256sum] =3D &quot;291ec9ab5efd934aaf=
503a6466c5d5251535d108ee747472c3977cc5acc868ef&quot;<br>
&gt; &gt;&gt; -SRC_URI[redox_syscall-0.4.1.sha256sum] =3D &quot;4722d768eff=
46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa&quot;<br>
&gt; &gt;&gt; -SRC_URI[scopeguard-1.2.0.sha256sum] =3D &quot;94143f37725109=
f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49&quot;<br>
&gt; &gt;&gt; -SRC_URI[self_cell-1.0.3.sha256sum] =3D &quot;58bf37232d3bb9a=
2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba&quot;<br>
&gt; &gt;&gt; -SRC_URI[smallvec-1.13.1.sha256sum] =3D &quot;e6ecd384b10a645=
42d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7&quot;<br>
&gt; &gt;&gt; -SRC_URI[syn-2.0.48.sha256sum] =3D &quot;0f3531638e407dfc0814=
761abb7c00a5b54992b849452a0646b7f65c9f770f3f&quot;<br>
&gt; &gt;&gt; -SRC_URI[target-lexicon-0.12.13.sha256sum] =3D &quot;69758bda=
2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae&quot;<br>
&gt; &gt;&gt; +SRC_URI[openssl-sys-0.9.103.sha256sum] =3D &quot;7f9e8deee91=
df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6&quot;<br>
&gt; &gt;&gt; +SRC_URI[pem-3.0.4.sha256sum] =3D &quot;8e459365e590736a54c3f=
a561947c84837534b8e9af6fc5bf781307e82658fae&quot;<br>
&gt; &gt;&gt; +SRC_URI[pkg-config-0.3.30.sha256sum] =3D &quot;d231b230927b5=
e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec&quot;<br>
&gt; &gt;&gt; +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D &quot;da544ee21=
8f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265&quot;<br>
&gt; &gt;&gt; +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D &quot;5e719e8df665=
df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77&quot;<br>
&gt; &gt;&gt; +SRC_URI[pyo3-0.22.2.sha256sum] =3D &quot;831e8e819a138c36e21=
2f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433&quot;<br>
&gt; &gt;&gt; +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D &quot;1e8730=
e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8&quot;<br>
&gt; &gt;&gt; +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D &quot;5e97e919d2df92e=
b88ca80a037969f44e5e70356559654962cbb3316d00300c6&quot;<br>
&gt; &gt;&gt; +SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D &quot;eb57983022ad=
41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206&quot;<br>
&gt; &gt;&gt; +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D &quot;ec48=
0c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372&quot;<br>
&gt; &gt;&gt; +SRC_URI[quote-1.0.36.sha256sum] =3D &quot;0fa76aaf39101c4578=
36aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7&quot;<br>
&gt; &gt;&gt; +SRC_URI[self_cell-1.0.4.sha256sum] =3D &quot;d369a96f978623e=
b3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a&quot;<br>
&gt; &gt;&gt; +SRC_URI[syn-2.0.71.sha256sum] =3D &quot;b146dcf730474b4bcd16=
c311627b31ede9ab149045db4d6088b3becaea046462&quot;<br>
&gt; &gt;&gt; +SRC_URI[target-lexicon-0.12.15.sha256sum] =3D &quot;4873307b=
7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2&quot;<br>
&gt; &gt;&gt;=C2=A0 SRC_URI[unicode-ident-1.0.12.sha256sum] =3D &quot;3354b=
9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b&quot;<br>
&gt; &gt;&gt;=C2=A0 SRC_URI[unindent-0.2.3.sha256sum] =3D &quot;c7de7d73e17=
54487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce&quot;<br>
&gt; &gt;&gt;=C2=A0 SRC_URI[vcpkg-0.2.15.sha256sum] =3D &quot;accd4ea62f7bb=
7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426&quot;<br>
&gt; &gt;&gt; -SRC_URI[windows-targets-0.48.5.sha256sum] =3D &quot;9a2fa6e2=
155d7247be68c096456083145c183cbbbc2764150dda45a87197940c&quot;<br>
&gt; &gt;&gt; -SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D &quot;=
2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8&quot;<br>
&gt; &gt;&gt; -SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D &quot;dc3=
5310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc&quot;<br>
&gt; &gt;&gt; -SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D &quot;a75915e=
7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e&quot;<br>
&gt; &gt;&gt; -SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D &quot;8f55c2=
33f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406&quot;<br>
&gt; &gt;&gt; -SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D &quot;53d40=
abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e&quot;<br>
&gt; &gt;&gt; -SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D &quot;0=
b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc&quot;<br>
&gt; &gt;&gt; -SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D &quot;ed94=
fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538&quot;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://p=
ython3-cryptography-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-cryptography-vectors_42.0.8.bb</a> b/meta/recipes-devtools/python/=
<a href=3D"http://python3-cryptography-vectors_43.0.1.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-cryptography-vectors_43.0.1.bb</a><br>
&gt; &gt;&gt; similarity index 75%<br>
&gt; &gt;&gt; rename from meta/recipes-devtools/python/<a href=3D"http://py=
thon3-cryptography-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-cryptography-vectors_42.0.8.bb</a><br>
&gt; &gt;&gt; rename to meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-cryptography-vectors_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-cryptography-vectors_43.0.1.bb</a><br>
&gt; &gt;&gt; index 1256e75c47..7b8216b05e 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-=
cryptography-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-cryptography-vectors_42.0.8.bb</a><br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-=
cryptography-vectors_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-cryptography-vectors_43.0.1.bb</a><br>
&gt; &gt;&gt; @@ -9,19 +9,19 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;m=
d5=3D8c3617db4fb6fae01f1d253ab91511e4 \<br>
&gt; &gt;&gt;=C2=A0 # NOTE: Make sure to keep this recipe at the same versi=
on as python3-cryptography<br>
&gt; &gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the=
 same time<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -SRC_URI[sha256sum] =3D &quot;df5657367bc0a90c374309cb261009a=
2c53cae91a458781339a0f724f819a46a&quot;<br>
&gt; &gt;&gt; +SRC_URI[sha256sum] =3D &quot;68a0fc18fe27b309e933a293a54f335=
6b78a14c15207e96c9ff85681af0509de&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 inherit pypi python_setuptools_build_meta<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -DEPENDS +=3D &quot; \<br>
&gt; &gt;&gt; +DEPENDS +=3D &quot;\<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-cryptography \<br>
&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 do_install:append () {<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove the sha256 checksum line=
s for pycache files<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed ${D}${PYTHON_SITEPACKAGES_DIR=
}/cryptography_vectors-${PV}.dist-info/RECORD -e &#39;/__pycache__/d&#39; -=
i<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 # Remove the sha256 checksum lines for pycache=
 files<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 sed ${D}${PYTHON_SITEPACKAGES_DIR}/cryptograph=
y_vectors-${PV}.dist-info/RECORD -e &#39;/__pycache__/d&#39; -i<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/python/python3-cryptograph=
y/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-=
devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-d=
isable-option.patch<br>
&gt; &gt;&gt; index 3eed171ffe..907e462653 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/python/python3-cryptography/0001-=
pyproject.toml-remove-benchmark-disable-option.patch<br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/python/python3-cryptography/0001-=
pyproject.toml-remove-benchmark-disable-option.patch<br>
&gt; &gt;&gt; @@ -1,4 +1,4 @@<br>
&gt; &gt;&gt; -From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt; +From 31b9e612eae62452c786a5aecdcf89b131afc8fa Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt;&gt;=C2=A0 From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriv=
er.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; &gt;&gt;=C2=A0 Date: Tue, 17 May 2022 17:22:48 +0800<br>
&gt; &gt;&gt;=C2=A0 Subject: [PATCH] pyproject.toml: remove --benchmark-dis=
able option<br>
&gt; &gt;&gt; @@ -26,11 +26,11 @@ Signed-off-by: Tim Orling &lt;<a href=3D"=
mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</=
a>&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 diff --git a/pyproject.toml b/pyproject.toml<br>
&gt; &gt;&gt; -index d2e304f..10aabcf 100644<br>
&gt; &gt;&gt; +index e5b801d..985fc8c 100644<br>
&gt; &gt;&gt;=C2=A0 --- a/pyproject.toml<br>
&gt; &gt;&gt;=C2=A0 +++ b/pyproject.toml<br>
&gt; &gt;&gt; -@@ -92,7 +92,7 @@ rust-version =3D &quot;&gt;=3D1.63.0&quot;=
<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt; +@@ -117,7 +117,7 @@ exclude =3D [<br>
&gt; &gt;&gt; + ]<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0[tool.pytest.ini_options]<br>
&gt; &gt;&gt;=C2=A0 -addopts =3D &quot;-r s --capture=3Dno --strict-markers=
 --benchmark-disable&quot;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://p=
ython3-cryptography_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-cryptography_42.0.8.bb</a> b/meta/recipes-devtools/python/<a href=3D"http:=
//python3-cryptography_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-cryptography_43.0.1.bb</a><br>
&gt; &gt;&gt; similarity index 72%<br>
&gt; &gt;&gt; rename from meta/recipes-devtools/python/<a href=3D"http://py=
thon3-cryptography_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
cryptography_42.0.8.bb</a><br>
&gt; &gt;&gt; rename to meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-cryptography_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cr=
yptography_43.0.1.bb</a><br>
&gt; &gt;&gt; index 3f70f910d4..4a97f33736 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-=
cryptography_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypto=
graphy_42.0.8.bb</a><br>
&gt; &gt;&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-=
cryptography_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypto=
graphy_43.0.1.bb</a><br>
&gt; &gt;&gt; @@ -8,43 +8,21 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;m=
d5=3D8c3617db4fb6fae01f1d253ab91511e4 \<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;&gt;=C2=A0 LDSHARED +=3D &quot;-pthread&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -SRC_URI[sha256sum] =3D &quot;8d09d05439ce7baa8e9e95b07ec5b6c=
886f548deb7e0f69ef25f64b3bce842f2&quot;<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt; -SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchma=
rk-disable-option.patch \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://check-memfr=
ee.py \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \=
<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt; -require ${BPN}-crates.inc<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt; -inherit pypi python_setuptools3_rust cargo-update-recipe-cra=
tes pkgconfig<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt; -DEPENDS +=3D &quot; \<br>
&gt; &gt;&gt; +DEPENDS +=3D &quot;\<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-cffi-native \<br>
&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -RDEPENDS:${PN} +=3D &quot; \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-cffi \<br>
&gt; &gt;&gt; -&quot;<br>
&gt; &gt;&gt; +SRC_URI[sha256sum] =3D &quot;203e92a75716d8cfb491dc47c79e17d=
0d9207ccffcbcb35f598fbe463ae3444d&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-numbers \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-threading \<br>
&gt; &gt;&gt; +SRC_URI:append =3D &quot; \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 file://0001-pyproject.toml-remove-benchmark-di=
sable-option.patch \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 file://check-memfree.py \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 file://run-ptest \<br>
&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-bcrypt \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-cryptography-vectors (=3D ${PV}) \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-hypothesis \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-iso8601 \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-mmap \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-pretend \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-psutil \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-pytest \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-unittest-automake-output \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-pytest-subtests \<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-pytz \<br>
&gt; &gt;&gt; -&quot;<br>
&gt; &gt;&gt; +require ${BPN}-crates.inc<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +inherit pypi python_maturin cargo-update-recipe-crates pkgco=
nfig<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 inherit ptest<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -60,8 +38,29 @@ do_install_ptest() {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 cp -r ${S}/pyproject.toml ${D}${PTEST_PAT=
H}/<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -FILES:${PN}-dbg +=3D &quot; \<br>
&gt; &gt;&gt; +FILES:${PN}-dbg +=3D &quot;\<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/haz=
mat/bindings/.debug \<br>
&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +RDEPENDS:${PN} +=3D &quot;\<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-cffi \<br>
&gt; &gt;&gt; +&quot;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-numbers \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-threading \<br>
&gt; &gt;&gt; +&quot;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +RDEPENDS:${PN}-ptest +=3D &quot;\<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-certifi \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-cryptography-vectors (=3D ${PV}) \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pretend \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest-benchmark \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest-cov \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest-subtests \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest-xdist \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-unittest-automake-output \<br>
&gt; &gt;&gt; +&quot;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.43.0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#205663): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/205663" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/205663</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108938651/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/108938651/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--00000000000043a1da062436d06f--

