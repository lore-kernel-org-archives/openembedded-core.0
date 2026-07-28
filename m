Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCCFC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:48:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6643.1785224893484572479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 00:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VY25Ef4C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so39059885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 00:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785224892; x=1785829692; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TMjEvdb2e5bsNLMqdUnu+/9wuI33J3kRn9NwLD3SteE=;
        b=VY25Ef4Cgo3fw0Yg/4krDJ6L3a1V9VrAhIIY98MkOB04S6i3XZAAoNuczD10JG7Gra
         DPgOa3zMywX+uS2ppyfGX8oFc8UOSigza6AtsYcTIGTaxGubuQoDe7oXKuNGJteW7cJo
         jxypkXVDb5kUXF/qjHS9aPnk91tXcEDqG9KKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785224892; x=1785829692;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMjEvdb2e5bsNLMqdUnu+/9wuI33J3kRn9NwLD3SteE=;
        b=rNc+pqC9ciFWd7m+/PiuYzmQSLvdkTZ5BCxNP8rA3Uziwk1VJsZGs9UZxh2TuODZNV
         EX5R0TImGV6NBUSZk8KYDkbZocLqv5TT/Zmxi9j/lZ3rYeXpstuaDyY4WC9jWtHEg2VL
         /1u8IJTwZ7rk4mgORrgjErWbtr+yMvWJVmk44nJU9fSx/+LDYgowigTOW+LEg7CL2oGd
         CoCiqtpmOOfTZi6TSpJp9ocoQ14NDubnam5e+cRdrptBIB55Ur1TaHMTpt6xWGbHCLgO
         6tEHg6T01bo+GKP2VQoCLYa/DIg65TzVTWWvqqU4V/YEX7UA+NyBIGd8UNYNQfvtdYdS
         2V8A==
X-Forwarded-Encrypted: i=1; AHgh+Rpt0jDeJ/Up3dNrjtAHdvP1TBGRbBJpVfFQ5DQjZMSClNXd9nrbaRIz9auZ+5R8WIa795SUUww8K+8FbgwWZN4OyA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzCV5P/EcfY6ksoXnLjYYotcRYFjPZzNj/tiEoAVii4wGlygxqg
	dodrpn95QPR5quiX1mCZoF+x0JNK5AvvPk1m8tSU/fWsJv7eegmtwVVDq/4rZp6TnbN90T4AELR
	GXi8YC+w=
X-Gm-Gg: AR+sD12o4A0avERnNNPj3q0FEfbp7g25uzhVaaJQs3obVcJispQlcrZA9SWSrDbk+T+
	/9zZoTjY4WG3HoIhQpeIS+H2xytfcPc3pcSNCNOrPWtBPnSnAyv4EaXZC9YWUCxupXR0twefxcS
	jObPD/vQhSZpWQ3O/23ynqxN35o8Tg78OKBe++cCdxdB6MkOJfIeXXXDN6vmZQcaV9sc22Hf7yQ
	8239yhlLzSEI6FtMrrRijI6SAPy7VynjO+xtpOmEXbcEMQDjJ8otkwI12R+tL3Ay6Ws3EN0QQ+c
	4sgzM/Ri09gG4TOx3CWzV1/ZVSaQ84KKx4NgVb9q4UgS5gHd+oQV6GVXDoAlyogxjq7hkrnHUcW
	24D4fNyPwl/F9RinFkNtAGTSjmwu548kwkRAywr4WCVA6SkGSjQCkA5WeuUmhi46R9MavwgENcq
	tcgsdlV7OuYskptoTMGkeOKt8uQU/zwLMoaqIpf5P+198DHQMFE9nXhYBxvbfijDA+CeLWv+pce
	RU=
X-Received: by 2002:a05:600c:e549:20b0:495:71f8:7325 with SMTP id 5b1f17b1804b1-496c6586a5amr7799355e9.32.1785224891518;
        Tue, 28 Jul 2026 00:48:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:901:c1b8:a3bd:87c1? ([2001:8b0:aba:5f3c:901:c1b8:a3bd:87c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44b84edsm88533855e9.5.2026.07.28.00.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:48:10 -0700 (PDT)
Message-ID: <e9117009423ec2c41f99383a7993724bc3d221b9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/3] rust: refactor source handling into a
 shared work-shared recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2026 08:48:10 +0100
In-Reply-To: <20260725035136.1260408-2-Deepesh.Varatharajan@windriver.com>
References: <20260725035136.1260408-1-Deepesh.Varatharajan@windriver.com>
	 <20260725035136.1260408-2-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 07:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242168

On Fri, 2026-07-24 at 20:51 -0700, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> [YOCTO #15808]
>=20
> Consolidate Rust source management across all Rust recipes (rust, cargo,
> libstd-rs and their native/nativesdk variants) into a single shared
> source tree using the work-shared pattern.
>=20
> Disk savings: a world build with multilibs enabled, together with
> nativesdk-rust and nativesdk-cargo, now shares a single ~4.2 GB rustc-src
> tree instead of maintaining up to 11 independent copies (~46.2 GB total).
>=20
> Performance (clean core-image-sato build, qemux86-64):
>=20
> Before: 68m53.507s
> After:=C2=A0 65m46.159s
> Improvement: 3m07.348s (~4.5%)
>=20
> New files:
>=20
> - rust-source.bb: A shared recipe that fetches, unpacks, and patches the
> =C2=A0 rustc source tree into ${TMPDIR}/work-shared/rust-source-${PV}-${P=
R}.
> =C2=A0 All build/install/packaging tasks are disabled; this recipe exists=
 solely
> =C2=A0 to provide a single copy of the source. Inherits allarch/nopackage=
s,
> =C2=A0 excludes itself from rm_work, and is hidden from world builds.
> =C2=A0 Also defines RUST_BUILD_ARCH locally since this recipe does not in=
herit
> =C2=A0 rust-common.bbclass but still needs the mapping for snapshot fetch=
ing
> =C2=A0 via rust-snapshot.inc.
>=20
> - common-source.inc: Included by consumer recipes (rust, cargo, libstd-rs=
)
> =C2=A0 to disable their local do_fetch/do_unpack/do_patch tasks, clear SR=
C_URI,
> =C2=A0 and add task dependencies on rust-source-${PV} for configure, lice=
nsing,
> =C2=A0 and SPDX generation. Also provides is_work_shared_spdx() override =
for
> =C2=A0 correct SPDX shared-workdir detection.
>=20
> Modified files:
>=20
> - rust-source.inc:
> =C2=A0 - Replace RUST_VERSION with explicit MAJOR_VER/MINOR_VER/PATCH_VER=
 and PV.
> =C2=A0 - Set UNPACKDIR to the work-shared location so all consumers share=
 one
> =C2=A0=C2=A0=C2=A0 source tree via RUSTSRC and S.
>=20
> - rust_git.bb (renamed from rust_1.96.1.bb):
> =C2=A0 - Add 'require common-source.inc' to use the shared source tree.
> =C2=A0 - Set B =3D ${WORKDIR}/build to separate build artifacts from shar=
ed source.
> =C2=A0 - Set CARGO_HOME =3D ${WORKDIR}/cargo_home to isolate cargo cachin=
g.
> =C2=A0 - Set build-dir =3D "rust-build" in config.toml to distinguish Yoc=
to's build
> =C2=A0=C2=A0=C2=A0 directory (B), which holds config.toml, from the boots=
trap's own build
> =C2=A0=C2=A0=C2=A0 output directory. Without this, bootstrap defaults to =
"build/" inside B,
> =C2=A0=C2=A0=C2=A0 creating an ambiguous build/build/ nesting.
> =C2=A0 - Use absolute ${S}/src/bootstrap/bootstrap.py path since cwd is n=
ow B.
> =C2=A0 - Update install functions to reference rust-build/ instead of bui=
ld/.
> =C2=A0 - Update do_test_compile to use absolute ${S}/src/tools/ path.
> =C2=A0 - Change do_rust_setup_snapshot from 'after do_unpack' to depend o=
n
> =C2=A0=C2=A0=C2=A0 rust-source-${PV}:do_unpack (since local do_unpack is =
removed).
>=20
> - cargo_git.bb (renamed from cargo_1.96.1.bb):
> =C2=A0 - Add 'require common-source.inc' to use the shared source tree.
> =C2=A0 - Change do_cargo_setup_snapshot from 'after do_unpack' to depend =
on
> =C2=A0=C2=A0=C2=A0 rust-source-${PV}:do_unpack.
>=20
> - libstd-rs_git.bb (renamed from libstd-rs_1.96.1.bb):
> =C2=A0 - Add 'require common-source.inc' to use the shared source tree.
>=20
> - rust-cross-canadian_git.bb (renamed from rust-cross-canadian_1.96.1.bb)=
:
> =C2=A0 - Rename only (version now comes from rust-source.inc via PV).
>=20
> - rust-common.bbclass:
> =C2=A0 - Add a second --remap-path-prefix for ${TMPDIR}/work-shared so de=
bug
> =C2=A0=C2=A0=C2=A0 info from the shared source tree is correctly remapped=
.
> =C2=A0 - Retain RUST_BUILD_ARCH definition so that consumer recipes (rust=
, cargo,
> =C2=A0=C2=A0=C2=A0 libstd-rs) which inherit this class can resolve snapsh=
ot directory names
> =C2=A0=C2=A0=C2=A0 used by do_rust_setup_snapshot and do_cargo_setup_snap=
shot.
>=20
> - lib/oeqa/selftest/cases/rust.py:
> =C2=A0 - Adapt the selftest to the build-dir/source-dir split: use B for =
build
> =C2=A0=C2=A0=C2=A0 artifacts and RUSTSRC for source paths.
> =C2=A0 - Update remote-test-server copy path from build/ to rust-build/.
> =C2=A0 - Pass --build-dir and --config explicitly to bootstrap.py.
>=20
> - conf/distro/include/maintainers.inc:
> =C2=A0 - Add maintainer entry for the new rust-source recipe.
>=20
> License-Update: recipe file renames only, no license change
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0meta/classes-recipe/rust-common.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0meta/lib/oeqa/selftest/cases/rust.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++-
> =C2=A0.../rust/{cargo_1.96.1.bb =3D> cargo_git.bb}=C2=A0=C2=A0=C2=A0 |=C2=
=A0 8 ++-
> =C2=A0meta/recipes-devtools/rust/common-source.inc=C2=A0 | 28 ++++++++++
> =C2=A0.../{libstd-rs_1.96.1.bb =3D> libstd-rs_git.bb} |=C2=A0 4 ++
> =C2=A0...n_1.96.1.bb =3D> rust-cross-canadian_git.bb} |=C2=A0 0
> =C2=A0meta/recipes-devtools/rust/rust-source.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
 56 +++++++++++++++++++
> =C2=A0meta/recipes-devtools/rust/rust-source.inc=C2=A0=C2=A0=C2=A0 | 16 +=
++++-
> =C2=A0.../rust/{rust_1.96.1.bb =3D> rust_git.bb}=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 31 +++++++---
> =C2=A010 files changed, 140 insertions(+), 17 deletions(-)
> =C2=A0rename meta/recipes-devtools/rust/{cargo_1.96.1.bb =3D> cargo_git.b=
b} (91%)
> =C2=A0create mode 100644 meta/recipes-devtools/rust/common-source.inc
> =C2=A0rename meta/recipes-devtools/rust/{libstd-rs_1.96.1.bb =3D> libstd-=
rs_git.bb} (92%)
> =C2=A0rename meta/recipes-devtools/rust/{rust-cross-canadian_1.96.1.bb =
=3D> rust-cross-canadian_git.bb} (100%)
> =C2=A0create mode 100644 meta/recipes-devtools/rust/rust-source.bb
> =C2=A0rename meta/recipes-devtools/rust/{rust_1.96.1.bb =3D> rust_git.bb}=
 (93%)

In the patch review call we noted that "_git" isn't accurate as these
are version'd recipes, not git based. There was a suggestion to just
remove that piece but without the versions, it would make it harder to
have multiple rust versions in parallel should that be needed. This is
why the gcc recipes retain a version in the filenames.

Our suggestion would be to have rust match what gcc does for those two
reasons.

Otherwise with the LICENSE bracket fix, we think is is probably ready
to merge. The space savings are nice to have!

Cheers,

Richard

