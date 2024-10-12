Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686A1CF2577
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 18:38:41 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.16588.1728758311273767160
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 11:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ckw37/hn;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cd76c513cso897395ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 11:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728758311; x=1729363111; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P0zcpbfiB6eDmw41KCIzdIngCuKPc2S8UA156tnwwJw=;
        b=Ckw37/hn5/6KNlS1tYRw3+o0j39g3fFGeOkWp6nxspajEEaaNM250DeZb6yXC6zFv3
         m8H0A7f9/cMrEErs+qli/hop42ILY0ZmQgNeXIn+DRILk4MV0zIwBvABgMIjirF5QnrW
         e4CP8awe0wrwV3+MrfuNXZG5GEVA10j7Qm7eeV4E4wndT5APorZD7AmCyUjhZkoqdE9e
         pu9fsGWwqfCIEWNh8agmmnrC6r9IaGIt1C2FnBclRlwRLMSFfzApyYWWBmpVxEuamhYj
         N7qWWt99NH+VsskDoZhjGe0UNXI1P6QWadrc6cjAEHSLS5jzOlPjaXdMmUJnr9yDb1Cy
         QcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728758311; x=1729363111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0zcpbfiB6eDmw41KCIzdIngCuKPc2S8UA156tnwwJw=;
        b=Gk6bymERoEnIELVmu+a3sExtbmyUcJ67xgAkvlnURv3PdcxuNfs4u+LnB9feiQ2pX8
         Jcd/cQxsP0eursb4lu+uZv62HhhxPJhEGEHpo5uhcRwL1Y/nyc3ZgD5DQKOeUDIWFyzc
         rRedkqFK4jMpzQJnG6n9VMj2QQxKZ+lMeMcuCEnjw+bjvRp6PnaVmTkWTLf/vTPQ80j7
         50ffQjPB0uGQ8iKLDBlMtg+aqovkro2fZsrkUcaK0kQuItVjxxQhvtquYvZdd08RVj8y
         7EnlDiQ5XiN5l8CyOyjiPD0zAql4WixqsrJZAk3pcMTQC9TXZz9pSaqj8jbNqvVIRs6Q
         Ifcg==
X-Forwarded-Encrypted: i=1; AJvYcCU+xW6/DlItriERZHBW+n0XrG8tPO7CVAfm261DAjd8n8ihj/G21xVQK4D4JJ2G9w8ysnDnItqaaWv7h+MBj82TaA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywq0CW2oNmHG3MFdVrf/jFjWpngGKvO5TW/aQrsfJ+7e7xpIS7I
	ePnrnBSgEdsDRZ2lQJU8QjsUtUOWNp3skjN5d2DjrIK4Nan3ra2skYRxJmcLgtCWN5d+C+4mtyC
	myW83k4bFmpo8FXi+D3qcG4do1ASqrg==
X-Google-Smtp-Source: AGHT+IF6KOXkozrJaVY2m0qaT/a8VlkfwWXPamQVPfJ881x32FAbWurqcRyX4cOK1fHcE84YgtUF21hcdZyGZf5WVBI=
X-Received: by 2002:a17:90a:ee8f:b0:2d8:dd14:79ed with SMTP id
 98e67ed59e1d1-2e2f0d7aa18mr8061584a91.31.1728758310184; Sat, 12 Oct 2024
 11:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
 <3d120a63-7fbf-43fc-8f44-5ad50ab1a061@smile.fr> <CANx9H-Bi0CKSMdH9fsQ8hAzabuyk2bX3hm3ZqUoPdmuupLeK_A@mail.gmail.com>
In-Reply-To: <CANx9H-Bi0CKSMdH9fsQ8hAzabuyk2bX3hm3ZqUoPdmuupLeK_A@mail.gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Sat, 12 Oct 2024 20:38:21 +0200
Message-ID: <CAJo0Az6nDT-av_8HuudUt5Ob5ga7+=Qofaaa2Z2RTjKpsC1T+w@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1
To: Tim Orling <ticotimo@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fb319606244be800"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 18:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205711

--000000000000fb319606244be800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That the documentation could be more elaborate I agree on, this is my first
attempt at pushing a fix I Poky and there is a lot of things to take into
account. It makes it daunting to contribute as I'll be making a lot of
mistakes.

On Sat, Oct 12, 2024, 8:32=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wrote=
:

>
>
> On Sat, Oct 12, 2024 at 8:03=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr>
> wrote:
>
>>
>>
>> Le 11/10/2024 =C3=A0 19:28, Tim Orling via lists.openembedded.org a =C3=
=A9crit :
>> > The ptests are not passing on core-image-ptest-python3-cryptography
>> > (which only has the recipe dependencies and not full python3 and all t=
he
>> > modules).
>> >
>> > https://snips.sh/f/9C7acm_o35 <https://snips.sh/f/9C7acm_o35>
>> > ModuleNotFoundError: No module named '__pypy__'
>> > ModuleNotFoundError: No module named 'timeit'
>> >
>> > I tested this by:
>> > bitbake core-image-ptest-python3-cryptography
>> > runqemu nographic kvm
>> > pytest-runner 2>&1 | tee ptest-runner.log
>> >
>> > The __pypy__ test case should arguably be disabled.
>> > 'timeit' it provided by python3, but is currently not split out into a
>> > sub-package (so it would be in the ugly catchall python3-misc).
>> >
>> > Reproducible builds are
>> > documented:
>> https://docs.yoctoproject.org/test-manual/reproducible-builds.html#repro=
ducible-builds
>> <
>> https://docs.yoctoproject.org/test-manual/reproducible-builds.html#repro=
ducible-builds
>> >
>> >
>> > OEQA_REPRODUCIBLE_TEST_TARGET =3D "python3-cryptography"
>> > OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D "python3-cryptography"
>> > oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
>>
>> Beware, this config will not build but grab python3-cryptography from
>> sstate *twice*. OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS is the list of
>> targets that the reproducibility test is allowed to grab from sstate.
>>
>> To quickly test the reproducibility of a singular package, I put only
>> its dependencies in OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS. In this case,
>> I would use:
>>
>> OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D "pkgconfig-native \
>> virtual/x86_64-poky-linux-gcc virtual/x86_64-poky-linux-compilerlibs \
>> virtual/libc cargo-native  python3-setuptools-native \
>> python3-wheel-native python3-setuptools-rust-native      \
>> python3-cffi-native  python3-native  rust-native libstd-rs \
>> python3-native python3 python3 python3-build-native \
>> python3-installer-native"
>>
>> (list taken from "bitbake-getvar -r python3-cryptography DEPENDS")
>>
>
>
> We need to capture more of how to do this in the documentation. I did wha=
t
> seemed to be what the variable names would indicate. In the past, I alway=
s
> ran the full reproducible builds without restricting to =E2=80=9Cone reci=
pe=E2=80=9D (slow).
>
>
>> > The good news is that command passed.
>
>
> The bad news is that command didn=E2=80=99t test anything useful ;)
>
>
>>
>> >
>> > On Fri, Oct 11, 2024 at 1:24=E2=80=AFAM Alexander Kanavin via
>> > lists.openembedded.org <http://lists.openembedded.org>
>> > <alex.kanavin=3Dgmail.com@lists.openembedded.org
>> > <mailto:gmail.com@lists.openembedded.org>> wrote:
>> >
>> >     You need to build the recipe twice in two different build
>> directories
>> >     (you can reuse the sstate for everything else except the recipe
>> >     itself), and compare the output.
>> >
>> >     And no, it wasn't caused by other 3.13 issues, in fact it was made
>> >     clear that 3.13 was not relevant (I first thought it was fixing th=
e
>> >     issues, then retracted that).
>> >
>> >     Alex
>> >
>> >     On Fri, 11 Oct 2024 at 09:03, Tom Geelen <t.f.g.geelen@gmail.com
>> >     <mailto:t.f.g.geelen@gmail.com>> wrote:
>> >     >
>> >     > I have checked the report of the issues that were encountered on
>> the
>> >     > previous upgrade try and if I understand correctly those were
>> likely
>> >     > caused by other Python 3.13 issues.
>> >     > So to address your question, do I wait for the autobuilder outpu=
t
>> for
>> >     > an answer or is there a way on how I can test the issues locally=
.
>> >     >
>> >     > Regards,
>> >     > Tom
>> >     >
>> >     >
>> >     > On Fri, Oct 11, 2024 at 7:17=E2=80=AFAM Alexander Kanavin
>> >     > <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>> >     > >
>> >     > > Does this address the reproducibility issues Tim mentioned?
>> >     > >
>> >     > > Alex
>> >     > >
>> >     > > On Thu 10. Oct 2024 at 23.51, Tom Geelen via
>> >     lists.openembedded.org <http://lists.openembedded.org>
>> >     <t.f.g.geelen=3Dgmail.com@lists.openembedded.org
>> >     <mailto:gmail.com@lists.openembedded.org>> wrote:
>> >     > >>
>> >     > >> python3-cryptography-vectors: upgrade 42.0.8 -> 43.0.1
>> >     > >>
>> >     > >> Changelog:
>> >     > >> - https://cryptography.io/en/latest/changelog/#v43-0-0
>> >     <https://cryptography.io/en/latest/changelog/#v43-0-0>
>> >     > >> - https://cryptography.io/en/latest/changelog/#v43-0-1
>> >     <https://cryptography.io/en/latest/changelog/#v43-0-1>
>> >     > >>
>> >     > >> Change build tool to use python3-maturin-native as specified =
in
>> >     pyproject.toml file.
>> >     > >> Performed linting on the recipe and removed packages from the
>> >     ptest which are not required according to the included
>> pyproject.toml.
>> >     > >>
>> >     > >> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com
>> >     <mailto:t.f.g.geelen@gmail.com>>
>> >     > >>
>> >     > >> ---
>> >     > >> Tested on x86 architecture, all tests pass
>> >     > >>
>> >     > >>  .../python/python3-cryptography-crates.inc    | 130
>> >     +++++++-----------
>> >     > >>  ...=3D> python3-cryptography-vectors_43.0.1.bb
>> >     <http://python3-cryptography-vectors_43.0.1.bb>} |   8 +-
>> >     > >>  ...toml-remove-benchmark-disable-option.patch |   8 +-
>> >     > >>  ....0.8.bb <http://0.8.bb> =3D> python3-cryptography_43.0.1.=
bb
>> >     <http://python3-cryptography_43.0.1.bb>} |  63 +++++----
>> >     > >>  4 files changed, 89 insertions(+), 120 deletions(-)
>> >     > >>  rename
>> >     meta/recipes-devtools/python/{
>> python3-cryptography-vectors_42.0.8.bb
>> >     <http://python3-cryptography-vectors_42.0.8.bb> =3D>
>> >     python3-cryptography-vectors_43.0.1.bb
>> >     <http://python3-cryptography-vectors_43.0.1.bb>} (75%)
>> >     > >>  rename
>> >     meta/recipes-devtools/python/{python3-cryptography_42.0.8.bb
>> >     <http://python3-cryptography_42.0.8.bb> =3D>
>> >     python3-cryptography_43.0.1.bb
>> >     <http://python3-cryptography_43.0.1.bb>} (72%)
>> >     > >>
>> >     > >> diff --git
>> >     a/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> >     b/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> >     > >> index dbeda05dc4..319a47dabd 100644
>> >     > >> ---
>> a/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> >     > >> +++
>> b/meta/recipes-devtools/python/python3-cryptography-crates.inc
>> >     > >> @@ -2,101 +2,71 @@
>> >     > >>
>> >     > >>  # from src/rust/Cargo.lock
>> >     > >>  SRC_URI +=3D " \
>> >     > >> -    crate://crates.io/asn1/0.15.5 <
>> http://crates.io/asn1/0.15.5> \
>> >     > >> -    crate://crates.io/asn1_derive/0.15.5
>> >     <http://crates.io/asn1_derive/0.15.5> \
>> >     > >> -    crate://crates.io/autocfg/1.1.0
>> >     <http://crates.io/autocfg/1.1.0> \
>> >     > >> -    crate://crates.io/base64/0.21.7
>> >     <http://crates.io/base64/0.21.7> \
>> >     > >> -    crate://crates.io/bitflags/1.3.2
>> >     <http://crates.io/bitflags/1.3.2> \
>> >     > >> -    crate://crates.io/bitflags/2.4.2
>> >     <http://crates.io/bitflags/2.4.2> \
>> >     > >> -    crate://crates.io/cc/1.0.83 <http://crates.io/cc/1.0.83>
>> \
>> >     > >> +    crate://crates.io/asn1/0.16.2 <
>> http://crates.io/asn1/0.16.2> \
>> >     > >> +    crate://crates.io/asn1_derive/0.16.2
>> >     <http://crates.io/asn1_derive/0.16.2> \
>> >     > >> +    crate://crates.io/autocfg/1.3.0
>> >     <http://crates.io/autocfg/1.3.0> \
>> >     > >> +    crate://crates.io/base64/0.22.1
>> >     <http://crates.io/base64/0.22.1> \
>> >     > >> +    crate://crates.io/bitflags/2.6.0
>> >     <http://crates.io/bitflags/2.6.0> \
>> >     > >> +    crate://crates.io/cc/1.1.6 <http://crates.io/cc/1.1.6> \
>> >     > >>      crate://crates.io/cfg-if/1.0.0
>> >     <http://crates.io/cfg-if/1.0.0> \
>> >     > >>      crate://crates.io/foreign-types/0.3.2
>> >     <http://crates.io/foreign-types/0.3.2> \
>> >     > >>      crate://crates.io/foreign-types-shared/0.1.1
>> >     <http://crates.io/foreign-types-shared/0.1.1> \
>> >     > >> -    crate://crates.io/heck/0.4.1 <http://crates.io/heck/0.4.=
1>
>> \
>> >     > >> -    crate://crates.io/indoc/2.0.4 <
>> http://crates.io/indoc/2.0.4> \
>> >     > >> -    crate://crates.io/libc/0.2.152
>> >     <http://crates.io/libc/0.2.152> \
>> >     > >> -    crate://crates.io/lock_api/0.4.11
>> >     <http://crates.io/lock_api/0.4.11> \
>> >     > >> -    crate://crates.io/memoffset/0.9.0
>> >     <http://crates.io/memoffset/0.9.0> \
>> >     > >> +    crate://crates.io/heck/0.5.0 <http://crates.io/heck/0.5.=
0>
>> \
>> >     > >> +    crate://crates.io/indoc/2.0.5 <
>> http://crates.io/indoc/2.0.5> \
>> >     > >> +    crate://crates.io/libc/0.2.155
>> >     <http://crates.io/libc/0.2.155> \
>> >     > >> +    crate://crates.io/memoffset/0.9.1
>> >     <http://crates.io/memoffset/0.9.1> \
>> >     > >>      crate://crates.io/once_cell/1.19.0
>> >     <http://crates.io/once_cell/1.19.0> \
>> >     > >> -    crate://crates.io/openssl/0.10.64
>> >     <http://crates.io/openssl/0.10.64> \
>> >     > >> +    crate://crates.io/openssl/0.10.66
>> >     <http://crates.io/openssl/0.10.66> \
>> >     > >>      crate://crates.io/openssl-macros/0.1.1
>> >     <http://crates.io/openssl-macros/0.1.1> \
>> >     > >> -    crate://crates.io/openssl-sys/0.9.102
>> >     <http://crates.io/openssl-sys/0.9.102> \
>> >     > >> -    crate://crates.io/parking_lot/0.12.1
>> >     <http://crates.io/parking_lot/0.12.1> \
>> >     > >> -    crate://crates.io/parking_lot_core/0.9.9
>> >     <http://crates.io/parking_lot_core/0.9.9> \
>> >     > >> -    crate://crates.io/pem/3.0.3 <http://crates.io/pem/3.0.3>
>> \
>> >     > >> -    crate://crates.io/pkg-config/0.3.29
>> >     <http://crates.io/pkg-config/0.3.29> \
>> >     > >> -    crate://crates.io/portable-atomic/1.6.0
>> >     <http://crates.io/portable-atomic/1.6.0> \
>> >     > >> -    crate://crates.io/proc-macro2/1.0.78
>> >     <http://crates.io/proc-macro2/1.0.78> \
>> >     > >> -    crate://crates.io/pyo3/0.20.3 <
>> http://crates.io/pyo3/0.20.3> \
>> >     > >> -    crate://crates.io/pyo3-build-config/0.20.3
>> >     <http://crates.io/pyo3-build-config/0.20.3> \
>> >     > >> -    crate://crates.io/pyo3-ffi/0.20.3
>> >     <http://crates.io/pyo3-ffi/0.20.3> \
>> >     > >> -    crate://crates.io/pyo3-macros/0.20.3
>> >     <http://crates.io/pyo3-macros/0.20.3> \
>> >     > >> -    crate://crates.io/pyo3-macros-backend/0.20.3
>> >     <http://crates.io/pyo3-macros-backend/0.20.3> \
>> >     > >> -    crate://crates.io/quote/1.0.35
>> >     <http://crates.io/quote/1.0.35> \
>> >     > >> -    crate://crates.io/redox_syscall/0.4.1
>> >     <http://crates.io/redox_syscall/0.4.1> \
>> >     > >> -    crate://crates.io/scopeguard/1.2.0
>> >     <http://crates.io/scopeguard/1.2.0> \
>> >     > >> -    crate://crates.io/self_cell/1.0.3
>> >     <http://crates.io/self_cell/1.0.3> \
>> >     > >> -    crate://crates.io/smallvec/1.13.1
>> >     <http://crates.io/smallvec/1.13.1> \
>> >     > >> -    crate://crates.io/syn/2.0.48 <http://crates.io/syn/2.0.4=
8>
>> \
>> >     > >> -    crate://crates.io/target-lexicon/0.12.13
>> >     <http://crates.io/target-lexicon/0.12.13> \
>> >     > >> +    crate://crates.io/openssl-sys/0.9.103
>> >     <http://crates.io/openssl-sys/0.9.103> \
>> >     > >> +    crate://crates.io/pem/3.0.4 <http://crates.io/pem/3.0.4>
>> \
>> >     > >> +    crate://crates.io/pkg-config/0.3.30
>> >     <http://crates.io/pkg-config/0.3.30> \
>> >     > >> +    crate://crates.io/portable-atomic/1.7.0
>> >     <http://crates.io/portable-atomic/1.7.0> \
>> >     > >> +    crate://crates.io/proc-macro2/1.0.86
>> >     <http://crates.io/proc-macro2/1.0.86> \
>> >     > >> +    crate://crates.io/pyo3/0.22.2 <
>> http://crates.io/pyo3/0.22.2> \
>> >     > >> +    crate://crates.io/pyo3-build-config/0.22.2
>> >     <http://crates.io/pyo3-build-config/0.22.2> \
>> >     > >> +    crate://crates.io/pyo3-ffi/0.22.2
>> >     <http://crates.io/pyo3-ffi/0.22.2> \
>> >     > >> +    crate://crates.io/pyo3-macros/0.22.2
>> >     <http://crates.io/pyo3-macros/0.22.2> \
>> >     > >> +    crate://crates.io/pyo3-macros-backend/0.22.2
>> >     <http://crates.io/pyo3-macros-backend/0.22.2> \
>> >     > >> +    crate://crates.io/quote/1.0.36
>> >     <http://crates.io/quote/1.0.36> \
>> >     > >> +    crate://crates.io/self_cell/1.0.4
>> >     <http://crates.io/self_cell/1.0.4> \
>> >     > >> +    crate://crates.io/syn/2.0.71 <http://crates.io/syn/2.0.7=
1>
>> \
>> >     > >> +    crate://crates.io/target-lexicon/0.12.15
>> >     <http://crates.io/target-lexicon/0.12.15> \
>> >     > >>      crate://crates.io/unicode-ident/1.0.12
>> >     <http://crates.io/unicode-ident/1.0.12> \
>> >     > >>      crate://crates.io/unindent/0.2.3
>> >     <http://crates.io/unindent/0.2.3> \
>> >     > >>      crate://crates.io/vcpkg/0.2.15
>> >     <http://crates.io/vcpkg/0.2.15> \
>> >     > >> -    crate://crates.io/windows-targets/0.48.5
>> >     <http://crates.io/windows-targets/0.48.5> \
>> >     > >> -    crate://crates.io/windows_aarch64_gnullvm/0.48.5
>> >     <http://crates.io/windows_aarch64_gnullvm/0.48.5> \
>> >     > >> -    crate://crates.io/windows_aarch64_msvc/0.48.5
>> >     <http://crates.io/windows_aarch64_msvc/0.48.5> \
>> >     > >> -    crate://crates.io/windows_i686_gnu/0.48.5
>> >     <http://crates.io/windows_i686_gnu/0.48.5> \
>> >     > >> -    crate://crates.io/windows_i686_msvc/0.48.5
>> >     <http://crates.io/windows_i686_msvc/0.48.5> \
>> >     > >> -    crate://crates.io/windows_x86_64_gnu/0.48.5
>> >     <http://crates.io/windows_x86_64_gnu/0.48.5> \
>> >     > >> -    crate://crates.io/windows_x86_64_gnullvm/0.48.5
>> >     <http://crates.io/windows_x86_64_gnullvm/0.48.5> \
>> >     > >> -    crate://crates.io/windows_x86_64_msvc/0.48.5
>> >     <http://crates.io/windows_x86_64_msvc/0.48.5> \
>> >     > >>  "
>> >     > >>
>> >     > >> -SRC_URI[asn1-0.15.5.sha256sum] =3D
>> >     "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
>> >     > >> -SRC_URI[asn1_derive-0.15.5.sha256sum] =3D
>> >     "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
>> >     > >> -SRC_URI[autocfg-1.1.0.sha256sum] =3D
>> >     "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
>> >     > >> -SRC_URI[base64-0.21.7.sha256sum] =3D
>> >     "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
>> >     > >> -SRC_URI[bitflags-1.3.2.sha256sum] =3D
>> >     "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
>> >     > >> -SRC_URI[bitflags-2.4.2.sha256sum] =3D
>> >     "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
>> >     > >> -SRC_URI[cc-1.0.83.sha256sum] =3D
>> >     "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
>> >     > >> +SRC_URI[asn1-0.16.2.sha256sum] =3D
>> >     "532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd"
>> >     > >> +SRC_URI[asn1_derive-0.16.2.sha256sum] =3D
>> >     "56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987"
>> >     > >> +SRC_URI[autocfg-1.3.0.sha256sum] =3D
>> >     "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
>> >     > >> +SRC_URI[base64-0.22.1.sha256sum] =3D
>> >     "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
>> >     > >> +SRC_URI[bitflags-2.6.0.sha256sum] =3D
>> >     "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
>> >     > >> +SRC_URI[cc-1.1.6.sha256sum] =3D
>> >     "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
>> >     > >>  SRC_URI[cfg-if-1.0.0.sha256sum] =3D
>> >     "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
>> >     > >>  SRC_URI[foreign-types-0.3.2.sha256sum] =3D
>> >     "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
>> >     > >>  SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D
>> >     "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
>> >     > >> -SRC_URI[heck-0.4.1.sha256sum] =3D
>> >     "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
>> >     > >> -SRC_URI[indoc-2.0.4.sha256sum] =3D
>> >     "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
>> >     > >> -SRC_URI[libc-0.2.152.sha256sum] =3D
>> >     "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
>> >     > >> -SRC_URI[lock_api-0.4.11.sha256sum] =3D
>> >     "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
>> >     > >> -SRC_URI[memoffset-0.9.0.sha256sum] =3D
>> >     "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
>> >     > >> +SRC_URI[heck-0.5.0.sha256sum] =3D
>> >     "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
>> >     > >> +SRC_URI[indoc-2.0.5.sha256sum] =3D
>> >     "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
>> >     > >> +SRC_URI[libc-0.2.155.sha256sum] =3D
>> >     "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
>> >     > >> +SRC_URI[memoffset-0.9.1.sha256sum] =3D
>> >     "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
>> >     > >>  SRC_URI[once_cell-1.19.0.sha256sum] =3D
>> >     "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
>> >     > >> -SRC_URI[openssl-0.10.64.sha256sum] =3D
>> >     "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
>> >     > >> +SRC_URI[openssl-0.10.66.sha256sum] =3D
>> >     "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
>> >     > >>  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D
>> >     "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
>> >     > >> -SRC_URI[openssl-sys-0.9.102.sha256sum] =3D
>> >     "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
>> >     > >> -SRC_URI[parking_lot-0.12.1.sha256sum] =3D
>> >     "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
>> >     > >> -SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D
>> >     "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
>> >     > >> -SRC_URI[pem-3.0.3.sha256sum] =3D
>> >     "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
>> >     > >> -SRC_URI[pkg-config-0.3.29.sha256sum] =3D
>> >     "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
>> >     > >> -SRC_URI[portable-atomic-1.6.0.sha256sum] =3D
>> >     "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
>> >     > >> -SRC_URI[proc-macro2-1.0.78.sha256sum] =3D
>> >     "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
>> >     > >> -SRC_URI[pyo3-0.20.3.sha256sum] =3D
>> >     "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
>> >     > >> -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D
>> >     "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
>> >     > >> -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D
>> >     "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
>> >     > >> -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D
>> >     "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
>> >     > >> -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D
>> >     "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
>> >     > >> -SRC_URI[quote-1.0.35.sha256sum] =3D
>> >     "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
>> >     > >> -SRC_URI[redox_syscall-0.4.1.sha256sum] =3D
>> >     "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
>> >     > >> -SRC_URI[scopeguard-1.2.0.sha256sum] =3D
>> >     "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
>> >     > >> -SRC_URI[self_cell-1.0.3.sha256sum] =3D
>> >     "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
>> >     > >> -SRC_URI[smallvec-1.13.1.sha256sum] =3D
>> >     "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
>> >     > >> -SRC_URI[syn-2.0.48.sha256sum] =3D
>> >     "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
>> >     > >> -SRC_URI[target-lexicon-0.12.13.sha256sum] =3D
>> >     "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
>> >     > >> +SRC_URI[openssl-sys-0.9.103.sha256sum] =3D
>> >     "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
>> >     > >> +SRC_URI[pem-3.0.4.sha256sum] =3D
>> >     "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
>> >     > >> +SRC_URI[pkg-config-0.3.30.sha256sum] =3D
>> >     "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
>> >     > >> +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D
>> >     "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
>> >     > >> +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D
>> >     "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
>> >     > >> +SRC_URI[pyo3-0.22.2.sha256sum] =3D
>> >     "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
>> >     > >> +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D
>> >     "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
>> >     > >> +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D
>> >     "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
>> >     > >> +SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D
>> >     "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
>> >     > >> +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D
>> >     "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
>> >     > >> +SRC_URI[quote-1.0.36.sha256sum] =3D
>> >     "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
>> >     > >> +SRC_URI[self_cell-1.0.4.sha256sum] =3D
>> >     "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
>> >     > >> +SRC_URI[syn-2.0.71.sha256sum] =3D
>> >     "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"
>> >     > >> +SRC_URI[target-lexicon-0.12.15.sha256sum] =3D
>> >     "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
>> >     > >>  SRC_URI[unicode-ident-1.0.12.sha256sum] =3D
>> >     "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
>> >     > >>  SRC_URI[unindent-0.2.3.sha256sum] =3D
>> >     "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
>> >     > >>  SRC_URI[vcpkg-0.2.15.sha256sum] =3D
>> >     "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
>> >     > >> -SRC_URI[windows-targets-0.48.5.sha256sum] =3D
>> >     "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
>> >     > >> -SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D
>> >     "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
>> >     > >> -SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D
>> >     "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
>> >     > >> -SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D
>> >     "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
>> >     > >> -SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D
>> >     "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
>> >     > >> -SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D
>> >     "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
>> >     > >> -SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D
>> >     "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
>> >     > >> -SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D
>> >     "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
>> >     > >> diff --git
>> >     a/meta/recipes-devtools/python/
>> python3-cryptography-vectors_42.0.8.bb <
>> http://python3-cryptography-vectors_42.0.8.bb>
>> b/meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb <
>> http://python3-cryptography-vectors_43.0.1.bb>
>> >     > >> similarity index 75%
>> >     > >> rename from
>> >     meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.b=
b
>> >     <http://python3-cryptography-vectors_42.0.8.bb>
>> >     > >> rename to
>> >     meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.b=
b
>> >     <http://python3-cryptography-vectors_43.0.1.bb>
>> >     > >> index 1256e75c47..7b8216b05e 100644
>> >     > >> ---
>> >     a/meta/recipes-devtools/python/
>> python3-cryptography-vectors_42.0.8.bb <
>> http://python3-cryptography-vectors_42.0.8.bb>
>> >     > >> +++
>> >     b/meta/recipes-devtools/python/
>> python3-cryptography-vectors_43.0.1.bb <
>> http://python3-cryptography-vectors_43.0.1.bb>
>> >     > >> @@ -9,19 +9,19 @@ LIC_FILES_CHKSUM =3D
>> >     "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
>> >     > >>  # NOTE: Make sure to keep this recipe at the same version as
>> >     python3-cryptography
>> >     > >>  #       Upgrade both recipes at the same time
>> >     > >>
>> >     > >> -SRC_URI[sha256sum] =3D
>> >     "df5657367bc0a90c374309cb261009a2c53cae91a458781339a0f724f819a46a"
>> >     > >> +SRC_URI[sha256sum] =3D
>> >     "68a0fc18fe27b309e933a293a54f3356b78a14c15207e96c9ff85681af0509de"
>> >     > >>
>> >     > >>  PYPI_PACKAGE =3D "cryptography_vectors"
>> >     > >>
>> >     > >>  inherit pypi python_setuptools_build_meta
>> >     > >>
>> >     > >> -DEPENDS +=3D " \
>> >     > >> +DEPENDS +=3D "\
>> >     > >>      python3-cryptography \
>> >     > >>  "
>> >     > >>
>> >     > >>  do_install:append () {
>> >     > >> -       # Remove the sha256 checksum lines for pycache files
>> >     > >> -       sed
>> >
>>  ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/REC=
ORD
>> -e '/__pycache__/d' -i
>> >     > >> +    # Remove the sha256 checksum lines for pycache files
>> >     > >> +    sed
>> >
>>  ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/REC=
ORD
>> -e '/__pycache__/d' -i
>> >     > >>  }
>> >     > >>
>> >     > >>  BBCLASSEXTEND =3D "native nativesdk"
>> >     > >> diff --git
>> >
>>  a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml=
-remove-benchmark-disable-option.patch
>> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-=
remove-benchmark-disable-option.patch
>> >     > >> index 3eed171ffe..907e462653 100644
>> >     > >> ---
>> >
>>  a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml=
-remove-benchmark-disable-option.patch
>> >     > >> +++
>> >
>>  b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml=
-remove-benchmark-disable-option.patch
>> >     > >> @@ -1,4 +1,4 @@
>> >     > >> -From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17
>> >     00:00:00 2001
>> >     > >> +From 31b9e612eae62452c786a5aecdcf89b131afc8fa Mon Sep 17
>> >     00:00:00 2001
>> >     > >>  From: Mingli Yu <mingli.yu@windriver.com
>> >     <mailto:mingli.yu@windriver.com>>
>> >     > >>  Date: Tue, 17 May 2022 17:22:48 +0800
>> >     > >>  Subject: [PATCH] pyproject.toml: remove --benchmark-disable
>> option
>> >     > >> @@ -26,11 +26,11 @@ Signed-off-by: Tim Orling
>> >     <tim.orling@konsulko.com <mailto:tim.orling@konsulko.com>>
>> >     > >>   1 file changed, 1 insertion(+), 1 deletion(-)
>> >     > >>
>> >     > >>  diff --git a/pyproject.toml b/pyproject.toml
>> >     > >> -index d2e304f..10aabcf 100644
>> >     > >> +index e5b801d..985fc8c 100644
>> >     > >>  --- a/pyproject.toml
>> >     > >>  +++ b/pyproject.toml
>> >     > >> -@@ -92,7 +92,7 @@ rust-version =3D ">=3D1.63.0"
>> >     > >> -
>> >     > >> +@@ -117,7 +117,7 @@ exclude =3D [
>> >     > >> + ]
>> >     > >>
>> >     > >>   [tool.pytest.ini_options]
>> >     > >>  -addopts =3D "-r s --capture=3Dno --strict-markers
>> >     --benchmark-disable"
>> >     > >> diff --git
>> >     a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
>> >     <http://python3-cryptography_42.0.8.bb>
>> >     b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
>> >     <http://python3-cryptography_43.0.1.bb>
>> >     > >> similarity index 72%
>> >     > >> rename from
>> >     meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
>> >     <http://python3-cryptography_42.0.8.bb>
>> >     > >> rename to
>> >     meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
>> >     <http://python3-cryptography_43.0.1.bb>
>> >     > >> index 3f70f910d4..4a97f33736 100644
>> >     > >> ---
>> >     a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
>> >     <http://python3-cryptography_42.0.8.bb>
>> >     > >> +++
>> >     b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
>> >     <http://python3-cryptography_43.0.1.bb>
>> >     > >> @@ -8,43 +8,21 @@ LIC_FILES_CHKSUM =3D
>> >     "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
>> >     > >>                     "
>> >     > >>  LDSHARED +=3D "-pthread"
>> >     > >>
>> >     > >> -SRC_URI[sha256sum] =3D
>> >     "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
>> >     > >> -
>> >     > >> -SRC_URI +=3D
>> >     "file://0001-pyproject.toml-remove-benchmark-disable-option.patch =
\
>> >     > >> -            file://check-memfree.py \
>> >     > >> -            file://run-ptest \
>> >     > >> -           "
>> >     > >> -
>> >     > >> -require ${BPN}-crates.inc
>> >     > >> -
>> >     > >> -inherit pypi python_setuptools3_rust
>> >     cargo-update-recipe-crates pkgconfig
>> >     > >> -
>> >     > >> -DEPENDS +=3D " \
>> >     > >> +DEPENDS +=3D "\
>> >     > >>      python3-cffi-native \
>> >     > >>  "
>> >     > >>
>> >     > >> -RDEPENDS:${PN} +=3D " \
>> >     > >> -    python3-cffi \
>> >     > >> -"
>> >     > >> +SRC_URI[sha256sum] =3D
>> >     "203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb35f598fbe463ae3444d"
>> >     > >>
>> >     > >> -RDEPENDS:${PN}:append:class-target =3D " \
>> >     > >> -    python3-numbers \
>> >     > >> -    python3-threading \
>> >     > >> +SRC_URI:append =3D " \
>> >     > >> +
>> >     file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
>> >     > >> +    file://check-memfree.py \
>> >     > >> +    file://run-ptest \
>> >     > >>  "
>> >     > >>
>> >     > >> -RDEPENDS:${PN}-ptest +=3D " \
>> >     > >> -    python3-bcrypt \
>> >     > >> -    python3-cryptography-vectors (=3D ${PV}) \
>> >     > >> -    python3-hypothesis \
>> >     > >> -    python3-iso8601 \
>> >     > >> -    python3-mmap \
>> >     > >> -    python3-pretend \
>> >     > >> -    python3-psutil \
>> >     > >> -    python3-pytest \
>> >     > >> -    python3-unittest-automake-output \
>> >     > >> -    python3-pytest-subtests \
>> >     > >> -    python3-pytz \
>> >     > >> -"
>> >     > >> +require ${BPN}-crates.inc
>> >     > >> +
>> >     > >> +inherit pypi python_maturin cargo-update-recipe-crates
>> pkgconfig
>> >     > >>
>> >     > >>  inherit ptest
>> >     > >>
>> >     > >> @@ -60,8 +38,29 @@ do_install_ptest() {
>> >     > >>      cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
>> >     > >>  }
>> >     > >>
>> >     > >> -FILES:${PN}-dbg +=3D " \
>> >     > >> +FILES:${PN}-dbg +=3D "\
>> >     > >>
>> ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
>> >     > >>  "
>> >     > >>
>> >     > >> +RDEPENDS:${PN} +=3D "\
>> >     > >> +    python3-cffi \
>> >     > >> +"
>> >     > >> +
>> >     > >> +RDEPENDS:${PN}:append:class-target =3D " \
>> >     > >> +    python3-numbers \
>> >     > >> +    python3-threading \
>> >     > >> +"
>> >     > >> +
>> >     > >> +RDEPENDS:${PN}-ptest +=3D "\
>> >     > >> +    python3-certifi \
>> >     > >> +    python3-cryptography-vectors (=3D ${PV}) \
>> >     > >> +    python3-pretend \
>> >     > >> +    python3-pytest \
>> >     > >> +    python3-pytest-benchmark \
>> >     > >> +    python3-pytest-cov \
>> >     > >> +    python3-pytest-subtests \
>> >     > >> +    python3-pytest-xdist \
>> >     > >> +    python3-unittest-automake-output \
>> >     > >> +"
>> >     > >> +
>> >     > >>  BBCLASSEXTEND =3D "native nativesdk"
>> >     > >> --
>> >     > >> 2.43.0
>> >     > >>
>> >     > >>
>> >     > >>
>> >     > >>
>> >
>> >
>> >
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#205695):
>> https://lists.openembedded.org/g/openembedded-core/message/205695
>> > Mute This Topic: https://lists.openembedded.org/mt/108938651/4316185
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
>> yoann.congal@smile.fr]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>> --
>> Yoann Congal
>> Smile ECS - Tech Expert
>>
>

--000000000000fb319606244be800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">That the documentation could be more elaborate I agree on=
, this is my first attempt at pushing a fix I Poky and there is a lot of th=
ings to take into account. It makes it daunting to contribute as I&#39;ll b=
e making a lot of mistakes.</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sat, Oct 12, 2024, 8:32=E2=80=AFPM Tim Orling=
 &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div><br></div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 12, 202=
4 at 8:03=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.=
fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)"><br>
<br>
Le 11/10/2024 =C3=A0 19:28, Tim Orling via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> a =C3=A9crit=C2=A0:<br>
&gt; The ptests are not passing on core-image-ptest-python3-cryptography<br=
>
&gt; (which only has the recipe dependencies and not full python3 and all t=
he<br>
&gt; modules).<br>
&gt; <br>
&gt; <a href=3D"https://snips.sh/f/9C7acm_o35" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://snips.sh/f/9C7acm_o35</a> &lt;<a href=3D"https:=
//snips.sh/f/9C7acm_o35" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://snips.sh/f/9C7acm_o35</a>&gt;<br>
&gt; ModuleNotFoundError: No module named &#39;__pypy__&#39;<br>
&gt; ModuleNotFoundError: No module named &#39;timeit&#39;<br>
&gt; <br>
&gt; I tested this by:<br>
&gt; bitbake core-image-ptest-python3-cryptography<br>
&gt; runqemu nographic kvm<br>
&gt; pytest-runner 2&gt;&amp;1 | tee ptest-runner.log<br>
&gt; <br>
&gt; The __pypy__ test case should arguably be disabled.<br>
&gt; &#39;timeit&#39; it provided by python3, but is currently not split ou=
t into a<br>
&gt; sub-package (so it would be in the ugly catchall python3-misc).<br>
&gt; <br>
&gt; Reproducible=C2=A0builds are<br>
&gt; documented:=C2=A0<a href=3D"https://docs.yoctoproject.org/test-manual/=
reproducible-builds.html#reproducible-builds" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://docs.yoctoproject.org/test-manual/reproducible-b=
uilds.html#reproducible-builds</a> &lt;<a href=3D"https://docs.yoctoproject=
.org/test-manual/reproducible-builds.html#reproducible-builds" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://docs.yoctoproject.org/test-manu=
al/reproducible-builds.html#reproducible-builds</a>&gt;<br>
&gt; <br>
&gt; OEQA_REPRODUCIBLE_TEST_TARGET =3D &quot;python3-cryptography&quot;<br>
&gt; OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D &quot;python3-cryptography&q=
uot;<br>
&gt; oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds=
<br>
<br>
Beware, this config will not build but grab python3-cryptography from<br>
sstate *twice*. OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS is the list of<br>
targets that the reproducibility test is allowed to grab from sstate.<br>
<br>
To quickly test the reproducibility of a singular package, I put only<br>
its dependencies in OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS. In this case,<br=
>
I would use:<br>
<br>
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS =3D &quot;pkgconfig-native \<br>
virtual/x86_64-poky-linux-gcc virtual/x86_64-poky-linux-compilerlibs \<br>
virtual/libc cargo-native=C2=A0 python3-setuptools-native \<br>
python3-wheel-native python3-setuptools-rust-native=C2=A0 =C2=A0 =C2=A0 \<b=
r>
python3-cffi-native=C2=A0 python3-native=C2=A0 rust-native libstd-rs \<br>
python3-native python3 python3 python3-build-native \<br>
python3-installer-native&quot;<br>
<br>
(list taken from &quot;bitbake-getvar -r python3-cryptography DEPENDS&quot;=
)<br>
=C2=A0=C2=A0</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">We n=
eed to capture more of how to do this in the documentation. I did what seem=
ed to be what the variable names would indicate. In the past, I always ran =
the full reproducible builds without restricting to =E2=80=9Cone recipe=E2=
=80=9D (slow).</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"aut=
o"><br>
&gt; The good news is that command passed.</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">The bad news is that command didn=E2=80=99t test =
anything useful ;)</div><div dir=3D"auto"><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D=
"auto"><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
&gt; <br>
&gt; On Fri, Oct 11, 2024 at 1:24=E2=80=AFAM Alexander Kanavin via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer=
" target=3D"_blank">lists.openembedded.org</a> &lt;<a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">http://li=
sts.openembedded.org</a>&gt;<br>
&gt; &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
 target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a><=
br>
&gt; &lt;mailto:<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt;&gt;=
 wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You need to build the recipe twice in two different=
 build directories<br>
&gt;=C2=A0 =C2=A0 =C2=A0(you can reuse the sstate for everything else excep=
t the recipe<br>
&gt;=C2=A0 =C2=A0 =C2=A0itself), and compare the output.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0And no, it wasn&#39;t caused by other 3.13 issues, =
in fact it was made<br>
&gt;=C2=A0 =C2=A0 =C2=A0clear that 3.13 was not relevant (I first thought i=
t was fixing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0issues, then retracted that).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Alex<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri, 11 Oct 2024 at 09:03, Tom Geelen &lt;<a hre=
f=3D"mailto:t.f.g.geelen@gmail.com" target=3D"_blank" rel=3D"noreferrer">t.=
f.g.geelen@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:t.f.g.geelen@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">t.f.g.geelen@gmail.com</a>&gt;&gt; w=
rote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I have checked the report of the issues that w=
ere encountered on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; previous upgrade try and if I understand corre=
ctly those were likely<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; caused by other Python 3.13 issues.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; So to address your question, do I wait for the=
 autobuilder output for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; an answer or is there a way on how I can test =
the issues locally.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Tom<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Fri, Oct 11, 2024 at 7:17=E2=80=AFAM Alexan=
der Kanavin<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</a> &lt;mailto:=
<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferr=
er">alex.kanavin@gmail.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Does this address the reproducibility iss=
ues Tim mentioned?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Alex<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; On Thu 10. Oct 2024 at 23.51, Tom Geelen =
via<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org" rel=3D"no=
referrer noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;<a hr=
ef=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=
=3D"_blank">http://lists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;t.f.g.geelen=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.op=
enembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:gmail.com@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedd=
ed.org</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; python3-cryptography-vectors: upgrade=
 42.0.8 -&gt; 43.0.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Changelog:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; - <a href=3D"https://cryptography.io/=
en/latest/changelog/#v43-0-0" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://cryptography.io/en/latest/changelog/#v43-0-0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://cryptography.io/en/latest/ch=
angelog/#v43-0-0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://c=
ryptography.io/en/latest/changelog/#v43-0-0</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; - <a href=3D"https://cryptography.io/=
en/latest/changelog/#v43-0-1" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://cryptography.io/en/latest/changelog/#v43-0-1</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://cryptography.io/en/latest/ch=
angelog/#v43-0-1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://c=
ryptography.io/en/latest/changelog/#v43-0-1</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Change build tool to use python3-matu=
rin-native as specified in<br>
&gt;=C2=A0 =C2=A0 =C2=A0pyproject.toml file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Performed linting on the recipe and r=
emoved packages from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0ptest which are not required according to the inclu=
ded pyproject.toml.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Signed-off-by: Tom Geelen &lt;<a href=
=3D"mailto:t.f.g.geelen@gmail.com" target=3D"_blank" rel=3D"noreferrer">t.f=
.g.geelen@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:t.f.g.geelen@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">t.f.g.geelen@gmail.com</a>&gt;&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Tested on x86 architecture, all tests=
 pass<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 .../python/python3-cryptography=
-crates.inc=C2=A0 =C2=A0 | 130<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++-----------<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 ...=3D&gt; <a href=3D"http://py=
thon3-cryptography-vectors_43.0.1.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-cryptography-vectors_43.0.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography-vectors_=
43.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-c=
ryptography-vectors_43.0.1.bb</a>&gt;} |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 ...toml-remove-benchmark-disabl=
e-option.patch |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 ....<a href=3D"http://0.8.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">0.8.bb</a> &lt;<a href=3D"ht=
tp://0.8.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http://0.8.bb<=
/a>&gt; =3D&gt; <a href=3D"http://python3-cryptography_43.0.1.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">python3-cryptography_43.0.1.bb</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography_43.0.1.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-cryptogra=
phy_43.0.1.bb</a>&gt;} |=C2=A0 63 +++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 4 files changed, 89 insertions(=
+), 120 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/python/{<a href=3D"http://pyt=
hon3-cryptography-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-cryptography-vectors_42.0.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography-vectors_=
42.0.8.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-c=
ryptography-vectors_42.0.8.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://python3-cryptography-vectors_43.0=
.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-cryptography=
-vectors_43.0.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography-vectors_=
43.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-c=
ryptography-vectors_43.0.1.bb</a>&gt;} (75%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/python/{<a href=3D"http://pyt=
hon3-cryptography_42.0.8.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
">python3-cryptography_42.0.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography_42.0.8.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-cryptogra=
phy_42.0.8.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://python3-cryptography_43.0.1.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">python3-cryptography_43.0.1.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography_43.0.1.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-cryptogra=
phy_43.0.1.bb</a>&gt;} (72%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/python/python3-cryptography=
-crates.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/python/python3-cryptography=
-crates.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; index dbeda05dc4..319a47dabd 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; --- a/meta/recipes-devtools/python/py=
thon3-cryptography-crates.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +++ b/meta/recipes-devtools/python/py=
thon3-cryptography-crates.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; @@ -2,101 +2,71 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 # from src/rust/Cargo.lock<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/asn1/0.15.5" rel=3D"noreferrer noreferrer" target=3D"_blank">=
crates.io/asn1/0.15.5</a> &lt;<a href=3D"http://crates.io/asn1/0.15.5" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/asn1/0.15.5</=
a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/asn1_derive/0.15.5" rel=3D"noreferrer noreferrer" target=3D"_=
blank">crates.io/asn1_derive/0.15.5</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/asn1_derive/0.15.5"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/asn1_deri=
ve/0.15.5</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/autocfg/1.1.0" rel=3D"noreferrer noreferrer" target=3D"_blank=
">crates.io/autocfg/1.1.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/autocfg/1.1.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/autocfg/1.1.0=
</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/base64/0.21.7" rel=3D"noreferrer noreferrer" target=3D"_blank=
">crates.io/base64/0.21.7</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/base64/0.21.7" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/base64/0.21.7=
</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/bitflags/1.3.2" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">crates.io/bitflags/1.3.2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/bitflags/1.3.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/bitflags/1.3.=
2</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/bitflags/2.4.2" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">crates.io/bitflags/2.4.2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/bitflags/2.4.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/bitflags/2.4.=
2</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/cc/1.0.83" rel=3D"noreferrer noreferrer" target=3D"_blank">cr=
ates.io/cc/1.0.83</a> &lt;<a href=3D"http://crates.io/cc/1.0.83" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">http://crates.io/cc/1.0.83</a>&gt; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/asn1/0.16.2" rel=3D"noreferrer noreferrer" target=3D"_blank">=
crates.io/asn1/0.16.2</a> &lt;<a href=3D"http://crates.io/asn1/0.16.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/asn1/0.16.2</=
a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/asn1_derive/0.16.2" rel=3D"noreferrer noreferrer" target=3D"_=
blank">crates.io/asn1_derive/0.16.2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/asn1_derive/0.16.2"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/asn1_deri=
ve/0.16.2</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/autocfg/1.3.0" rel=3D"noreferrer noreferrer" target=3D"_blank=
">crates.io/autocfg/1.3.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/autocfg/1.3.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/autocfg/1.3.0=
</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/base64/0.22.1" rel=3D"noreferrer noreferrer" target=3D"_blank=
">crates.io/base64/0.22.1</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/base64/0.22.1" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/base64/0.22.1=
</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/bitflags/2.6.0" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">crates.io/bitflags/2.6.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/bitflags/2.6.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/bitflags/2.6.=
0</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/cc/1.1.6" rel=3D"noreferrer noreferrer" target=3D"_blank">cra=
tes.io/cc/1.1.6</a> &lt;<a href=3D"http://crates.io/cc/1.1.6" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">http://crates.io/cc/1.1.6</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=
=3D"http://crates.io/cfg-if/1.0.0" rel=3D"noreferrer noreferrer" target=3D"=
_blank">crates.io/cfg-if/1.0.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/cfg-if/1.0.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/cfg-if/1.0.0<=
/a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=
=3D"http://crates.io/foreign-types/0.3.2" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">crates.io/foreign-types/0.3.2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/foreign-types/0.3.2=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/foreign-=
types/0.3.2</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=
=3D"http://crates.io/foreign-types-shared/0.1.1" rel=3D"noreferrer noreferr=
er" target=3D"_blank">crates.io/foreign-types-shared/0.1.1</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/foreign-types-share=
d/0.1.1" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/f=
oreign-types-shared/0.1.1</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/heck/0.4.1" rel=3D"noreferrer noreferrer" target=3D"_blank">c=
rates.io/heck/0.4.1</a> &lt;<a href=3D"http://crates.io/heck/0.4.1" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://crates.io/heck/0.4.1</a>&gt=
; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/indoc/2.0.4" rel=3D"noreferrer noreferrer" target=3D"_blank">=
crates.io/indoc/2.0.4</a> &lt;<a href=3D"http://crates.io/indoc/2.0.4" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/indoc/2.0.4</=
a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/libc/0.2.152" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>crates.io/libc/0.2.152</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/libc/0.2.152" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/libc/0.2.152<=
/a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/lock_api/0.4.11" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/lock_api/0.4.11</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/lock_api/0.4.11" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/lock_api/0.4=
.11</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/memoffset/0.9.0" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/memoffset/0.9.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/memoffset/0.9.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/memoffset/0.=
9.0</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/heck/0.5.0" rel=3D"noreferrer noreferrer" target=3D"_blank">c=
rates.io/heck/0.5.0</a> &lt;<a href=3D"http://crates.io/heck/0.5.0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://crates.io/heck/0.5.0</a>&gt=
; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/indoc/2.0.5" rel=3D"noreferrer noreferrer" target=3D"_blank">=
crates.io/indoc/2.0.5</a> &lt;<a href=3D"http://crates.io/indoc/2.0.5" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/indoc/2.0.5</=
a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/libc/0.2.155" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>crates.io/libc/0.2.155</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/libc/0.2.155" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/libc/0.2.155<=
/a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/memoffset/0.9.1" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/memoffset/0.9.1</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/memoffset/0.9.1" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/memoffset/0.=
9.1</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=
=3D"http://crates.io/once_cell/1.19.0" rel=3D"noreferrer noreferrer" target=
=3D"_blank">crates.io/once_cell/1.19.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/once_cell/1.19.0" r=
el=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/once_cell/1=
.19.0</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/openssl/0.10.64" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/openssl/0.10.64</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/openssl/0.10.64" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/openssl/0.10=
.64</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/openssl/0.10.66" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/openssl/0.10.66</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/openssl/0.10.66" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/openssl/0.10=
.66</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=
=3D"http://crates.io/openssl-macros/0.1.1" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">crates.io/openssl-macros/0.1.1</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/openssl-macros/0.1.=
1" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/openssl=
-macros/0.1.1</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/openssl-sys/0.9.102" rel=3D"noreferrer noreferrer" target=3D"=
_blank">crates.io/openssl-sys/0.9.102</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/openssl-sys/0.9.102=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/openssl-=
sys/0.9.102</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/parking_lot/0.12.1" rel=3D"noreferrer noreferrer" target=3D"_=
blank">crates.io/parking_lot/0.12.1</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/parking_lot/0.12.1"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/parking_l=
ot/0.12.1</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/parking_lot_core/0.9.9" rel=3D"noreferrer noreferrer" target=
=3D"_blank">crates.io/parking_lot_core/0.9.9</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/parking_lot_core/0.=
9.9" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/parki=
ng_lot_core/0.9.9</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pem/3.0.3" rel=3D"noreferrer noreferrer" target=3D"_blank">cr=
ates.io/pem/3.0.3</a> &lt;<a href=3D"http://crates.io/pem/3.0.3" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">http://crates.io/pem/3.0.3</a>&gt; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pkg-config/0.3.29" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">crates.io/pkg-config/0.3.29</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pkg-config/0.3.29" =
rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pkg-config=
/0.3.29</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/portable-atomic/1.6.0" rel=3D"noreferrer noreferrer" target=
=3D"_blank">crates.io/portable-atomic/1.6.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/portable-atomic/1.6=
.0" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/portab=
le-atomic/1.6.0</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/proc-macro2/1.0.78" rel=3D"noreferrer noreferrer" target=3D"_=
blank">crates.io/proc-macro2/1.0.78</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/proc-macro2/1.0.78"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/proc-macr=
o2/1.0.78</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3/0.20.3" rel=3D"noreferrer noreferrer" target=3D"_blank">=
crates.io/pyo3/0.20.3</a> &lt;<a href=3D"http://crates.io/pyo3/0.20.3" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pyo3/0.20.3</=
a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3-build-config/0.20.3" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">crates.io/pyo3-build-config/0.20.3</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pyo3-build-config/0=
.20.3" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pyo=
3-build-config/0.20.3</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3-ffi/0.20.3" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/pyo3-ffi/0.20.3</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pyo3-ffi/0.20.3" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pyo3-ffi/0.2=
0.3</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3-macros/0.20.3" rel=3D"noreferrer noreferrer" target=3D"_=
blank">crates.io/pyo3-macros/0.20.3</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pyo3-macros/0.20.3"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pyo3-macr=
os/0.20.3</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3-macros-backend/0.20.3" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">crates.io/pyo3-macros-backend/0.20.3</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pyo3-macros-backend=
/0.20.3" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/p=
yo3-macros-backend/0.20.3</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/quote/1.0.35" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>crates.io/quote/1.0.35</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/quote/1.0.35" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/quote/1.0.35<=
/a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/redox_syscall/0.4.1" rel=3D"noreferrer noreferrer" target=3D"=
_blank">crates.io/redox_syscall/0.4.1</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/redox_syscall/0.4.1=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/redox_sy=
scall/0.4.1</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/scopeguard/1.2.0" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">crates.io/scopeguard/1.2.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/scopeguard/1.2.0" r=
el=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/scopeguard/=
1.2.0</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/self_cell/1.0.3" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/self_cell/1.0.3</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/self_cell/1.0.3" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/self_cell/1.=
0.3</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/smallvec/1.13.1" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/smallvec/1.13.1</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/smallvec/1.13.1" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/smallvec/1.1=
3.1</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/syn/2.0.48" rel=3D"noreferrer noreferrer" target=3D"_blank">c=
rates.io/syn/2.0.48</a> &lt;<a href=3D"http://crates.io/syn/2.0.48" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://crates.io/syn/2.0.48</a>&gt=
; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/target-lexicon/0.12.13" rel=3D"noreferrer noreferrer" target=
=3D"_blank">crates.io/target-lexicon/0.12.13</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/target-lexicon/0.12=
.13" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/targe=
t-lexicon/0.12.13</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/openssl-sys/0.9.103" rel=3D"noreferrer noreferrer" target=3D"=
_blank">crates.io/openssl-sys/0.9.103</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/openssl-sys/0.9.103=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/openssl-=
sys/0.9.103</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pem/3.0.4" rel=3D"noreferrer noreferrer" target=3D"_blank">cr=
ates.io/pem/3.0.4</a> &lt;<a href=3D"http://crates.io/pem/3.0.4" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">http://crates.io/pem/3.0.4</a>&gt; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pkg-config/0.3.30" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">crates.io/pkg-config/0.3.30</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pkg-config/0.3.30" =
rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pkg-config=
/0.3.30</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/portable-atomic/1.7.0" rel=3D"noreferrer noreferrer" target=
=3D"_blank">crates.io/portable-atomic/1.7.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/portable-atomic/1.7=
.0" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/portab=
le-atomic/1.7.0</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/proc-macro2/1.0.86" rel=3D"noreferrer noreferrer" target=3D"_=
blank">crates.io/proc-macro2/1.0.86</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/proc-macro2/1.0.86"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/proc-macr=
o2/1.0.86</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3/0.22.2" rel=3D"noreferrer noreferrer" target=3D"_blank">=
crates.io/pyo3/0.22.2</a> &lt;<a href=3D"http://crates.io/pyo3/0.22.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pyo3/0.22.2</=
a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3-build-config/0.22.2" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">crates.io/pyo3-build-config/0.22.2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pyo3-build-config/0=
.22.2" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pyo=
3-build-config/0.22.2</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3-ffi/0.22.2" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/pyo3-ffi/0.22.2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pyo3-ffi/0.22.2" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pyo3-ffi/0.2=
2.2</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3-macros/0.22.2" rel=3D"noreferrer noreferrer" target=3D"_=
blank">crates.io/pyo3-macros/0.22.2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pyo3-macros/0.22.2"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/pyo3-macr=
os/0.22.2</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/pyo3-macros-backend/0.22.2" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">crates.io/pyo3-macros-backend/0.22.2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/pyo3-macros-backend=
/0.22.2" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/p=
yo3-macros-backend/0.22.2</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/quote/1.0.36" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>crates.io/quote/1.0.36</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/quote/1.0.36" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/quote/1.0.36<=
/a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/self_cell/1.0.4" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/self_cell/1.0.4</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/self_cell/1.0.4" re=
l=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/self_cell/1.=
0.4</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/syn/2.0.71" rel=3D"noreferrer noreferrer" target=3D"_blank">c=
rates.io/syn/2.0.71</a> &lt;<a href=3D"http://crates.io/syn/2.0.71" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://crates.io/syn/2.0.71</a>&gt=
; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/target-lexicon/0.12.15" rel=3D"noreferrer noreferrer" target=
=3D"_blank">crates.io/target-lexicon/0.12.15</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/target-lexicon/0.12=
.15" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/targe=
t-lexicon/0.12.15</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=
=3D"http://crates.io/unicode-ident/1.0.12" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">crates.io/unicode-ident/1.0.12</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/unicode-ident/1.0.1=
2" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/unicode=
-ident/1.0.12</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=
=3D"http://crates.io/unindent/0.2.3" rel=3D"noreferrer noreferrer" target=
=3D"_blank">crates.io/unindent/0.2.3</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/unindent/0.2.3" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/unindent/0.2.=
3</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=
=3D"http://crates.io/vcpkg/0.2.15" rel=3D"noreferrer noreferrer" target=3D"=
_blank">crates.io/vcpkg/0.2.15</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/vcpkg/0.2.15" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/vcpkg/0.2.15<=
/a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/windows-targets/0.48.5" rel=3D"noreferrer noreferrer" target=
=3D"_blank">crates.io/windows-targets/0.48.5</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/windows-targets/0.4=
8.5" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/windo=
ws-targets/0.48.5</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/windows_aarch64_gnullvm/0.48.5" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">crates.io/windows_aarch64_gnullvm/0.48.5</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/windows_aarch64_gnu=
llvm/0.48.5" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.=
io/windows_aarch64_gnullvm/0.48.5</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/windows_aarch64_msvc/0.48.5" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">crates.io/windows_aarch64_msvc/0.48.5</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/windows_aarch64_msv=
c/0.48.5" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/=
windows_aarch64_msvc/0.48.5</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/windows_i686_gnu/0.48.5" rel=3D"noreferrer noreferrer" target=
=3D"_blank">crates.io/windows_i686_gnu/0.48.5</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/windows_i686_gnu/0.=
48.5" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/wind=
ows_i686_gnu/0.48.5</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/windows_i686_msvc/0.48.5" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">crates.io/windows_i686_msvc/0.48.5</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/windows_i686_msvc/0=
.48.5" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/win=
dows_i686_msvc/0.48.5</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/windows_x86_64_gnu/0.48.5" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">crates.io/windows_x86_64_gnu/0.48.5</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/windows_x86_64_gnu/=
0.48.5" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/wi=
ndows_x86_64_gnu/0.48.5</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/windows_x86_64_gnullvm/0.48.5" rel=3D"noreferrer noreferrer" =
target=3D"_blank">crates.io/windows_x86_64_gnullvm/0.48.5</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/windows_x86_64_gnul=
lvm/0.48.5" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.i=
o/windows_x86_64_gnullvm/0.48.5</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 crate://<a href=3D"htt=
p://crates.io/windows_x86_64_msvc/0.48.5" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">crates.io/windows_x86_64_msvc/0.48.5</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://crates.io/windows_x86_64_msvc=
/0.48.5" rel=3D"noreferrer noreferrer" target=3D"_blank">http://crates.io/w=
indows_x86_64_msvc/0.48.5</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[asn1-0.15.5.sha256sum] =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;ae3ecbce89a22627b5e8e6e11d69715617138290289e3=
85cde773b1fe50befdb&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[asn1_derive-0.15.5.sha256sum=
] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;861af988fac460ac69a09f41e6217a8fb9178797b76fc=
c9478444be6a59be19c&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[autocfg-1.1.0.sha256sum] =3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f5=
5e3529ffa43161b97fa&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[base64-0.21.7.sha256sum] =3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c=
75356b39ca9b7178567&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[bitflags-1.3.2.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f=
4fdc18d06fb1037718a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[bitflags-2.4.2.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;ed570934406eb16438a4e976b1b4500774099c13b8cb9=
6eec99f620f05090ddf&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[cc-1.0.83.sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;f1174fb0b6ec23863f8b971027804a42614e347eafb0a=
95bf0b12cdae21fc4d0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[asn1-0.16.2.sha256sum] =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;532ceda058281b62096b2add4ab00ab3a453d30dee28b=
8890f62461a0109ebbd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[asn1_derive-0.16.2.sha256sum=
] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f00=
12893aefd86ce19c987&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[autocfg-1.3.0.sha256sum] =3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022=
cd21c80c6fbdd9476b0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[base64-0.22.1.sha256sum] =3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fb=
ecb9d91f575e0fbb8c6&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[bitflags-2.6.0.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78=
fa8a6ddc2613f6f71de&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[cc-1.1.6.sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47=
e397cc8810827f9694f&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 SRC_URI[cfg-if-1.0.0.sha256sum]=
 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;baf1de4339761588bc0619e3cbc0120ee582ebb74b53b=
4efbf79117bd2da40fd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 SRC_URI[foreign-types-0.3.2.sha=
256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb6=
48e6485e4d3fc06f3b1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 SRC_URI[foreign-types-shared-0.=
1.1.sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;00b0228411908ca8685dba7fc2cdd70ec9990a6e753e8=
9b6ac91a84c40fbaf4b&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[heck-0.4.1.sha256sum] =3D<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;95505c38b4572b2d910cecb0281560f54b440a19336cb=
bcb27bf6ce6adc6f5a8&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[indoc-2.0.4.sha256sum] =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;1e186cfbae8084e513daff4240b4797e342f988cecda4=
fb6c939150f96315fd8&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[libc-0.2.152.sha256sum] =3D<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb0=
4e5e142700b8faa56e7&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[lock_api-0.4.11.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185=
446edc3744920e8ef45&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[memoffset-0.9.0.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;5a634b1c61a95585bd15607c6ab0c4e5b226e695ff280=
0ba0cdccddf208c406c&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[heck-0.5.0.sha256sum] =3D<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fc=
a7d82fe33449bbe55ea&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[indoc-2.0.5.sha256sum] =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;b248f5224d1d606005e02c97f5aa4e88eeb230488bcc0=
3bc9ca4d7991399f2b5&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[libc-0.2.155.sha256sum] =3D<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;97b3888a4aecf77e811145cadf6eef5901f4782c53886=
191b2f693f24761847c&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[memoffset-0.9.1.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;488016bfae457b036d996092f6cb448677611ce4449e9=
70ceaf42695203f218a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 SRC_URI[once_cell-1.19.0.sha256=
sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;3fdb12b2476b595f9358c5161aa467c2438859caa136d=
ec86c26fdd2efe17b92&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[openssl-0.10.64.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;95a0481286a310808298130d22dd1fef0fa571e05a8f4=
4ec801801e84b216b1f&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[openssl-0.10.66.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78=
c5529441ed39d4bd9c1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 SRC_URI[openssl-macros-0.1.1.sh=
a256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;a948666b637a0f465e8564c73e89d4dde00d72d4d473c=
c972f390fc3dcee7d9c&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[openssl-sys-0.9.102.sha256su=
m] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9=
493e398b5df4fb45fa2&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[parking_lot-0.12.1.sha256sum=
] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f=
3c02bcc755bcfec228f&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[parking_lot_core-0.9.9.sha25=
6sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68=
784e4066115788d008e&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[pem-3.0.3.sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;1b8fcc794035347fb64beda2d3b462595dd2753e3f268=
d89c5aae77e8cf2c310&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[pkg-config-0.3.29.sha256sum]=
 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2900ede94e305130c13ddd391e0ab7cbaeb783945ae07=
a279c268cb05109c6cb&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[portable-atomic-1.6.0.sha256=
sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76=
d4c03daded371eae7c0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[proc-macro2-1.0.78.sha256sum=
] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b10=
02371c4367c8f984aae&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[pyo3-0.20.3.sha256sum] =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;53bdbb96d49157e65d45cc287af5f32ffadd5f4761438=
b527b055fb0d4bb8233&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[pyo3-build-config-0.20.3.sha=
256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6=
b5842292085831d48d7&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b76=
2e53891c05faf0d4afa&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[pyo3-macros-0.20.3.sha256sum=
] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;7305c720fa01b8055ec95e484a6eca7a83c841267f0dd=
5280f0c8b8551d2c158&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[pyo3-macros-backend-0.20.3.s=
ha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb43377=
23c4ccdb665f1f96185&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[quote-1.0.35.sha256sum] =3D<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;291ec9ab5efd934aaf503a6466c5d5251535d108ee747=
472c3977cc5acc868ef&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[redox_syscall-0.4.1.sha256su=
m] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;4722d768eff46b75989dd134e5c353f0d6296e5aaa313=
2e776cbdb56be7731aa&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[scopeguard-1.2.0.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;94143f37725109f92c262ed2cf5e59bce7498c01bcc15=
02d7b9afe439a4e9f49&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[self_cell-1.0.3.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7=
fed36c28772046d65ba&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[smallvec-1.13.1.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba=
55e98c3de13824cf3d7&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[syn-2.0.48.sha256sum] =3D<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;0f3531638e407dfc0814761abb7c00a5b54992b849452=
a0646b7f65c9f770f3f&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[target-lexicon-0.12.13.sha25=
6sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;69758bda2e78f098e4ccb393021a0963bb3442eac05f1=
35c30f61b7370bbafae&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[openssl-sys-0.9.103.sha256su=
m] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;7f9e8deee91df40a943c71b917e5874b951d32a802526=
c85721ce3b776c929d6&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[pem-3.0.4.sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;8e459365e590736a54c3fa561947c84837534b8e9af6f=
c5bf781307e82658fae&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[pkg-config-0.3.30.sha256sum]=
 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;d231b230927b5e4ad203db57bbcbee2802f6bce620b1e=
4a9024a07d94e2907ec&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[portable-atomic-1.7.0.sha256=
sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db=
5959940044ecfc67265&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[proc-macro2-1.0.86.sha256sum=
] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;5e719e8df665df0d1c8fbfd238015744736151d4445ec=
0836b8e628aae103b77&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[pyo3-0.22.2.sha256sum] =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;831e8e819a138c36e212f3af3fd9eeffed6bf1510a805=
af35b0edee5ffa59433&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[pyo3-build-config-0.22.2.sha=
256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;1e8730e591b14492a8945cdff32f089250b05f5accecf=
74aeddf9e8272ce1fa8&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;5e97e919d2df92eb88ca80a037969f44e5e7035655965=
4962cbb3316d00300c6&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[pyo3-macros-0.22.2.sha256sum=
] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5=
714cae4b7bee7d3f206&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[pyo3-macros-backend-0.22.2.s=
ha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;ec480c0c51ddec81019531705acac51bcdbeae563557c=
982aa8263bb96880372&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[quote-1.0.36.sha256sum] =3D<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1=
c6bd4e6ad4208acaca7&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[self_cell-1.0.4.sha256sum] =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;d369a96f978623eb3dc28807c4852d6cc617fed53da5d=
3c400feff1ef34a714a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[syn-2.0.71.sha256sum] =3D<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;b146dcf730474b4bcd16c311627b31ede9ab149045db4=
d6088b3becaea046462&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[target-lexicon-0.12.15.sha25=
6sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;4873307b7c257eddcb50c9bedf158eb669578359fb284=
28bef438fec8e6ba7c2&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 SRC_URI[unicode-ident-1.0.12.sh=
a256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;3354b9ac3fae1ff6755cb6db53683adb661634f675579=
42dea4facebec0fee4b&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 SRC_URI[unindent-0.2.3.sha256su=
m] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;c7de7d73e1754487cb58364ee906a499937a0dfabd86b=
cb980fa99ec8c8fa2ce&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 SRC_URI[vcpkg-0.2.15.sha256sum]=
 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb82=
15f372f52e48bb32426&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[windows-targets-0.48.5.sha25=
6sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;9a2fa6e2155d7247be68c096456083145c183cbbbc276=
4150dda45a87197940c&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[windows_aarch64_gnullvm-0.48=
.5.sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e5=
3e2882c3cbaf0d905d8&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[windows_aarch64_msvc-0.48.5.=
sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab=
7cc1be722937c26b4bc&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[windows_i686_gnu-0.48.5.sha2=
56sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;a75915e7def60c94dcef72200b9a8e58e5091744960da=
64ec734a6c6e9b3743e&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[windows_i686_msvc-0.48.5.sha=
256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e=
05a4eb49d4166cca406&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[windows_x86_64_gnu-0.48.5.sh=
a256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;53d40abd2583d23e4718fddf1ebec84dbff8381c07cae=
67ff7768bbf19c6718e&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[windows_x86_64_gnullvm-0.48.=
5.sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;0b7b52767868a23d5bab768e390dc5f5c55825b6d30b8=
6c844ff2dc7414044cc&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[windows_x86_64_msvc-0.48.5.s=
ha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;ed94fce61571a4006852b7389a063ab983c02eb1bb37b=
47f8272ce92d06d9538&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-cryptography-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-cryptography-vectors_42.0.8.bb</a> &lt;<a href=3D"http:=
//python3-cryptography-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">http://python3-cryptography-vectors_42.0.8.bb</a>&gt; b/meta=
/recipes-devtools/python/<a href=3D"http://python3-cryptography-vectors_43.=
0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-cryptograph=
y-vectors_43.0.1.bb</a> &lt;<a href=3D"http://python3-cryptography-vectors_=
43.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-c=
ryptography-vectors_43.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; similarity index 75%<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-cryptography-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">python3-cryptography-vectors_42.0.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography-vectors_=
42.0.8.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-c=
ryptography-vectors_42.0.8.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-cryptography-vectors_43.0.1.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">python3-cryptography-vectors_43.0.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography-vectors_=
43.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-c=
ryptography-vectors_43.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; index 1256e75c47..7b8216b05e 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-cryptography-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-cryptography-vectors_42.0.8.bb</a> &lt;<a href=3D"http:=
//python3-cryptography-vectors_42.0.8.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">http://python3-cryptography-vectors_42.0.8.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-cryptography-vectors_43.0.1.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-cryptography-vectors_43.0.1.bb</a> &lt;<a href=3D"http:=
//python3-cryptography-vectors_43.0.1.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">http://python3-cryptography-vectors_43.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; @@ -9,19 +9,19 @@ LIC_FILES_CHKSUM =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://LICENSE;md5=3D8c3617db4fb6fae01f1d253a=
b91511e4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 # NOTE: Make sure to keep this =
recipe at the same version as<br>
&gt;=C2=A0 =C2=A0 =C2=A0python3-cryptography<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0Upg=
rade both recipes at the same time<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;df5657367bc0a90c374309cb261009a2c53cae91a4587=
81339a0f724f819a46a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;68a0fc18fe27b309e933a293a54f3356b78a14c15207e=
96c9ff85681af0509de&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 PYPI_PACKAGE =3D &quot;cryptogr=
aphy_vectors&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 inherit pypi python_setuptools_=
build_meta<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +DEPENDS +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-cryptogra=
phy \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove =
the sha256 checksum lines for pycache files<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed<br>
&gt;=C2=A0 =C2=A0 =C2=A0${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors=
-${PV}.dist-info/RECORD -e &#39;/__pycache__/d&#39; -i<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 # Remove the sha256 ch=
ecksum lines for pycache files<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 sed<br>
&gt;=C2=A0 =C2=A0 =C2=A0${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors=
-${PV}.dist-info/RECORD -e &#39;/__pycache__/d&#39; -i<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native =
nativesdk&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/python/python3-cryptography=
/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-d=
evtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-di=
sable-option.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; index 3eed171ffe..907e462653 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/python/python3-cryptography=
/0001-pyproject.toml-remove-benchmark-disable-option.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/python/python3-cryptography=
/0001-pyproject.toml-remove-benchmark-disable-option.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -From e4d7856fe842f3df7c614554d006d81=
253a5edf2 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +From 31b9e612eae62452c786a5aecdcf89b=
131afc8fa Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 From: Mingli Yu &lt;<a href=3D"=
mailto:mingli.yu@windriver.com" target=3D"_blank" rel=3D"noreferrer">mingli=
.yu@windriver.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingli.yu@windriver.co=
m" target=3D"_blank" rel=3D"noreferrer">mingli.yu@windriver.com</a>&gt;&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 Date: Tue, 17 May 2022 17:22:48=
 +0800<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 Subject: [PATCH] pyproject.toml=
: remove --benchmark-disable option<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; @@ -26,11 +26,11 @@ Signed-off-by: Ti=
m Orling<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:tim.orling@konsulko.com" targ=
et=3D"_blank" rel=3D"noreferrer">tim.orling@konsulko.com</a> &lt;mailto:<a =
href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank" rel=3D"noreferrer=
">tim.orling@konsulko.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A01 file changed, 1 inserti=
on(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 diff --git a/pyproject.toml b/p=
yproject.toml<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -index d2e304f..10aabcf 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +index e5b801d..985fc8c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 --- a/pyproject.toml<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 +++ b/pyproject.toml<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -@@ -92,7 +92,7 @@ rust-version =3D &=
quot;&gt;=3D1.63.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +@@ -117,7 +117,7 @@ exclude =3D [<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; + ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0[tool.pytest.ini_options]=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 -addopts =3D &quot;-r s --captu=
re=3Dno --strict-markers<br>
&gt;=C2=A0 =C2=A0 =C2=A0--benchmark-disable&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-cryptography_42.0.8.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">python3-cryptography_42.0.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography_42.0.8.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-cryptogra=
phy_42.0.8.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-cryptography_43.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">python3-cryptography_43.0.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography_43.0.1.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-cryptogra=
phy_43.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; similarity index 72%<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-cryptography_42.0.8.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>python3-cryptography_42.0.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography_42.0.8.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-cryptogra=
phy_42.0.8.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/python/<a href=3D"http://pyth=
on3-cryptography_43.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>python3-cryptography_43.0.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography_43.0.1.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-cryptogra=
phy_43.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; index 3f70f910d4..4a97f33736 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-cryptography_42.0.8.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">python3-cryptography_42.0.8.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography_42.0.8.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-cryptogra=
phy_42.0.8.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-cryptography_43.0.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">python3-cryptography_43.0.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://python3-cryptography_43.0.1.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">http://python3-cryptogra=
phy_43.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; @@ -8,43 +8,21 @@ LIC_FILES_CHKSUM =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://LICENSE;md5=3D8c3617db4fb6fae01f1d253a=
b91511e4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 LDSHARED +=3D &quot;-pthread&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f=
69ef25f64b3bce842f2&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -SRC_URI +=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://0001-pyproject.toml-remove-benchmark-d=
isable-option.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://check-memfree.py \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -require ${BPN}-crates.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -inherit pypi python_setuptools3_rust=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0cargo-update-recipe-crates pkgconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +DEPENDS +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-cffi-nati=
ve \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -RDEPENDS:${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-cffi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb=
35f598fbe463ae3444d&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -RDEPENDS:${PN}:append:class-target =
=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-numbers \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-threading \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +SRC_URI:append =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-pyproject.toml-remove-benchmark-disable=
-option.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 file://check-memfree.p=
y \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -RDEPENDS:${PN}-ptest +=3D &quot; \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-bcrypt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-cryptography-v=
ectors (=3D ${PV}) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-hypothesis \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-iso8601 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-mmap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-pretend \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-psutil \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-pytest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-unittest-autom=
ake-output \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-pytest-subtest=
s \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -=C2=A0 =C2=A0 python3-pytz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +require ${BPN}-crates.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +inherit pypi python_maturin cargo-up=
date-recipe-crates pkgconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 inherit ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; @@ -60,8 +38,29 @@ do_install_ptest()=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 cp -r ${S}/pyproj=
ect.toml ${D}${PTEST_PATH}/<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; -FILES:${PN}-dbg +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +FILES:${PN}-dbg +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${PYTHON_SITEPACK=
AGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +RDEPENDS:${PN} +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-cffi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +RDEPENDS:${PN}:append:class-target =
=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-numbers \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-threading \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +RDEPENDS:${PN}-ptest +=3D &quot;\<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-certifi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-cryptography-v=
ectors (=3D ${PV}) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pretend \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest-benchma=
rk \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest-cov \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest-subtest=
s \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-pytest-xdist \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +=C2=A0 =C2=A0 python3-unittest-autom=
ake-output \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native =
nativesdk&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; 2.43.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#205695): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/205695" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/2056=
95</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10893865=
1/4316185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/108938651/4316185</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.cong=
al@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>=
]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS - Tech Expert<br>
</blockquote></div></div>
</blockquote></div>

--000000000000fb319606244be800--

