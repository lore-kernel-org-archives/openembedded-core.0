Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9CFC56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 16:12:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23036.1786032762608573245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 09:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LBkUSP2n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so27744365e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786032761; x=1786637561; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1YdomCxrbKq12os0bFTtXuOSazPhLFTUnyio1Jr/6Zw=;
        b=LBkUSP2n+pTlXnq7v3JYiSpoiTKpJWipSI0ROTdtcd3kK+Ruac6bNc8Rx0E+RY+J30
         5DR+5hzbZbdnZHOecHaCQoVTVX1AxJRP8t/98+7oWldd5n35+uNo/yXx+CG/yygn815a
         CN32+3IxBi4Y9UQTaZkPC8v+taRdqb7Uc/4ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786032761; x=1786637561;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1YdomCxrbKq12os0bFTtXuOSazPhLFTUnyio1Jr/6Zw=;
        b=BNYxtZHSYnY9ReyvGbh7Ryk3B2sbLDdu3iBkkT48JrymzlVyAjXtPsiOfXS0kAXQqz
         qBQz7qfpY0TF+xFi4QO2dFXGkMKyrOPdRC/+HvWGeDT+VeYiOtZHjMfvqAgOiYPKpcc1
         Xkc+jg8wj4PT5rzHVdDJfXbBWllAUQTZMdxYloXlYRHE+kivw1HYCSPTL0CrC8WYdjxY
         sTzh93wdzCuEg8IedgeRn/WfBFoJEcIL24EcNTax1hA8OJSRyUSVdnGa6smrAroM8pm9
         SwzDw1mfvWF+XsuhW7TyXuQBHIwB2X8E2cxpTSVYyoSBRd7FlpJkR7uETGdu8tpXzm0G
         PlBw==
X-Forwarded-Encrypted: i=1; AHgh+RpD1dunXJUCB+e4ebwVBqqnO7SljXnsLpkGmCe3VJpXmINfVR96/iR5kyfSCD/CNeaZVDLp7CatgwfOlTecSXVi9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEyz1xFSnZRgf33fioJ2Jq/wQrmgtuRBcbUgu8wpMLavfBEeT1
	Sp+ATIBomEoXo0hd4ihc53yfwKrGVif3OkxWU4jAW5EACZLdwU5zgDIi55stCpYPDvu4R4e3Te1
	0HACVDyI=
X-Gm-Gg: AR+sD10MigJVviirh9F5wTZI6mrgX5OBQGfMe3Fc81dy2EaF074T1BK5F6+InkDia+4
	dZNJW2Osbp4SaBVM2zw8RFtijLosQxzjyThtBdd+U9bqi9AzK+HE5XsOdHXNr9g6rbCxf5lJquA
	+9nfp+PcpeeKo3tHQ4eWRmufAZIDIF/6MBZmBvaP1Pb4OiOZPMgXxIMzSnG6Wns86KrzYlOCOCa
	T3Cmg1xJedSIOmoxWGKjHRH5OQzk9sNnLeHbYOlAmcLiLTOORQ5zJ9g388GeGnnwgaCGD0UfR9Q
	6GhbaRgbFlz01cHFDSAlp6/4asFP4t13uXqr9csWosr2H502sb6nn5Jt1gunVSkk+ex1gejQ+au
	l2PG+nzXEegVzhe0Tcq0o0NO+J1s/bPsII/v22LWL4AulyQ8ZFY4ytp1m9/8hVbhv8j7C+VaSy/
	+k3r+a5R2PuCvXCwgI1YjqW52S4nAYri5CMZgKlDN++dtelELz3MshUOz2Luiz+O7BNNKtMp4+1
	Y7Z2XS5Wy4+gqJ+sXZigWk0U9f200SHCkxikRMp3WD9P7Xc3vrRkd/BgDrNNWvGHQ==
X-Received: by 2002:a05:600c:630c:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-4994e71c87bmr178786175e9.7.1786032760677;
        Thu, 06 Aug 2026 09:12:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6? ([2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542133f0sm82167175e9.5.2026.08.06.09.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:12:39 -0700 (PDT)
Message-ID: <531b4a89adf5a60df265531abd6765e4861242d9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] bitbake.conf, rust-common.bbclass:
 include RUST_BUILD_SYS in the task hash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alhe@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Aug 2026 17:12:39 +0100
In-Reply-To: <0add5cde-b000-4147-bce7-8844067d250a@linux.microsoft.com>
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
	 <20260804220456.2342710-4-alhe@linux.microsoft.com>
	 <90b9c09acf04cca3d4d03e03b14577b0c1c63e11.camel@linuxfoundation.org>
	 <0add5cde-b000-4147-bce7-8844067d250a@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 16:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242956

On Thu, 2026-08-06 at 09:50 -0600, Alejandro Hernandez wrote:
> =C2=A0
> On 8/6/2026 6:53 AM, Richard Purdie via lists.openembedded.org wrote:
> =C2=A0
> > On Tue, 2026-08-04 at 22:04 +0000, Alejandro Hernandez Samaniego via li=
sts.openembedded.org wrote:
> > > RUST_BUILD_SYS is currently listed in BB_BASEHASH_IGNORE_VARS, which
> > > tells bitbake that rust recipes should hash-match regardless of the
> > > build machine's triplet. In practice that is not true:
> > >=20
> > > rustc computes each crate's Strict Version Hash (SVH) using inputs
> > > that include the *stage0/stage1 bootstrap compiler* fingerprint, whic=
h
> > > in turn depends on the build host arch. That seed cascades through
> > > every dependent crate's mangled symbols and the packing order of
> > > rodata sections, so an sstate blob populated on one worker arch and
> > > reused on a differently-arched worker produces byte-different (but
> > > semantically identical) artifacts and fails the reproducibility
> > > selftest causing autobuilder intermittent issues when the sstate
> > > matches for the incorrect architecture.
> > >=20
> > > Remove RUST_BUILD_SYS from BB_BASEHASH_IGNORE_VARS so the task hash
> > > tracks the build triplet and mixed-arch autobuilder pools get an
> > > sstate miss instead of a silently-wrong hit. RUST_HOST_SYS and
> > > RUST_TARGET_SYS stay excluded because they're already covered by the
> > > target/host arch hash inputs.
> > >=20
> > > While this is not ideal, it should unblock the reproducible test case=
,
> > > another solution would be to patch rust sources manually and attempt
> > > to upstream that change.
> > >=20
> > > This also has the side-effect that multiple variants of the conflicti=
ng
> > > rust recipes sstate artifacts are created, but they'll be correctly u=
sed
> > > now in each architecture.
> > >=20
> > > Also add an explanatory comment next to the RUST_*_SYS[vardepvalue]
> > > declarations in rust-common.bbclass so future readers don't re-add
> > > the exclusion.
> > >=20
> > > Verified locally: Tier 1 sighash test toggling BUILD_ARCH now produce=
s
> > > different task hashes for rust/libstd-rs/rpm-sequoia/python3-crypto-
> > > graphy/cargo/librsvg, where previously the hashes matched despite the
> > > build machine change.
> > >=20
> > > [YOCTO #15554]
> > >=20
> > > Assisted-by: AI - OpenAI
> > > Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
> > > ---
> > > =C2=A0meta/classes-recipe/rust-common.bbclass | 10 ++++++++++
> > > =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +=
-
> > > =C2=A02 files changed, 11 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-r=
ecipe/rust-common.bbclass
> > > index 6bc42016d1..98b46c4e3c 100644
> > > --- a/meta/classes-recipe/rust-common.bbclass
> > > +++ b/meta/classes-recipe/rust-common.bbclass
> > > @@ -114,6 +114,16 @@ RUST_HOST_SYS[vardepvalue] =3D "${RUST_HOST_SYS}=
"
> > > =C2=A0RUST_TARGET_SYS =3D "${@rust_base_triple(d, 'TARGET')}"
> > > =C2=A0RUST_TARGET_SYS[vardepvalue] =3D "${RUST_TARGET_SYS}"
> > > =C2=A0
> > > +# Note: RUST_BUILD_SYS is intentionally NOT on BB_BASEHASH_IGNORE_VA=
RS
> > > +# (see meta/conf/bitbake.conf). rustc's crate SVH (Strict Version Ha=
sh)
> > > +# is seeded by the stage0/stage1 bootstrap compiler whose fingerprin=
t
> > > +# depends on the BUILD host arch; that seed cascades through every
> > > +# dependent crate's mangled symbols and rodata packing order. Exclud=
ing
> > > +# RUST_BUILD_SYS from task hashes let a mixed-arch autobuilder pool
> > > +# populate sstate on one worker arch and get a cache hit on a differ=
ently-
> > > +# arched worker, producing byte-different (but semantically identica=
l)
> > > +# artifacts and failing reproducibility tests. See Yocto bug #15554.
> > > +
> > > =C2=A0# wrappers to get around the fact that Rust needs a single
> > > =C2=A0# binary but Yocto's compiler and linker commands have
> > > =C2=A0# arguments. Technically the archiver is always one command but
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index bdf37d0da2..ee23459506 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -969,7 +969,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD =
BB_TASKHASH BBPATH BBSERVER DL_DI
> > > =C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HAS=
HSERVE GIT_CEILING_DIRECTORIES \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 OMP_NUM_THREADS BB_CURRENTTASK"
> > > =C2=A0BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_I=
NCLUDE_PATHS BUILDHISTORY_DIR \
> > > -=C2=A0=C2=A0=C2=A0 SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_=
HOST_SYS RUST_TARGET_SYS"
> > > +=C2=A0=C2=A0=C2=A0 SSTATE_DIR SOURCE_DATE_EPOCH RUST_HOST_SYS RUST_T=
ARGET_SYS"
> > > =C2=A0BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE T=
IME SSH_AGENT_PID \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUG=
H_ADDITIONS DISABLE_SANITY_CHECKS \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV B=
B_INVALIDCONF BBINCLUDED \
> > > =C2=A0
> > >=20
> > =C2=A0
> >=20
> > Just to be clear, the sstatetests fail for this change for good reason,
> > it breaks the way "native" works in our system. We work on the
> > principle that "native" things work the same way regardless of
> > architecture and that the sstate hashes remain the same.
> >=20
> > If you change this as above all of the rust targets will rebuild
> > depending on the build architecture, despite the fact they're meant to
> > be build architecture independent. It might manage to fool the test but
> > the output would still not be build architecture independent and hence
> > doesn't fix the real issue, just hides it from the tests.
>=20
> Yes, that makes sense, the good thing is I think the root cause is correc=
t, but if we instead patch rusts sources
> we'll end up with the same problem since the packages would also be arch =
independent, correct?
>=20
> Is the correct thing here to add packages to an ignore/allow list?

We probably need to patch rust itself not to put the host information
into the SVH.

Cheers,

Richard

