Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEB9C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:53:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18576.1786020826861246993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 05:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G14C8Hy4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so5359205e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 05:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786020825; x=1786625625; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5AtKoxW5q8Xd5ge9ZUuCep4n2d3E830UGWWKmfmIvtU=;
        b=G14C8Hy4uByCfFDLTbORMCzX1a6f74TrYFGlLFw7UuVldlocX5wm7/ef8WufhJOppt
         W1j6PLbKSO0hPJ3eau1wCABqy15U5ZV4Ks7xF7woaRVM/rREe8qVPj3GD5dEWDjZxKQV
         pkSiP+kQf2YtWq/ZVoOoebCRxt9CF+sNZq4rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786020825; x=1786625625;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AtKoxW5q8Xd5ge9ZUuCep4n2d3E830UGWWKmfmIvtU=;
        b=LBLr1LOeZ7M9HawxezZz5IKNrnfjEq5WWMkn7YZuitv8EYgc+Ly8lLcNmqnRBFqDoZ
         2f6AUS1FHd/6YPVqIXeUzFLNSi+WgSZppcjGA4zIfdq3inZ0B/ABus1OM0AIRpnmAT47
         0txFbaD+PN48igmbC67q9cw2IxsJE250IiTpjznn3Z18e7ZhtLUFiWPjvCsv5WeN6jv5
         eTNWxThpW1UjW1uWrSk8sAEZk/uUFb5VjvcfNsGQluPnNNY7726wZP08GF8h79lynPu2
         251VbjV3LiX6zPJAvGY7VpGE3I5Z00qt/toyQthfHvYgNAEmCZDogdVuMfMv/v63wokz
         S38A==
X-Forwarded-Encrypted: i=1; AHgh+Ro1ZOdv0RIVR+oQIjbDu6duma9euPh9y6RUuK7BoAM6ZcXflNBZ9XsC5eWsLqhkMcpYlmZiEhTTmyV7pYM5NPHubA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyjjx7cX+oGAodIepLhQ4RLyxj2cKoeLiOiQXzsGWbBSxSFxhT/
	prPn4YHzjJzV9mKCyKrqJmVtgDUERw4N08slPBo4QJXbW2ii1PtIo1wAoBq4e3z/cQQ=
X-Gm-Gg: AR+sD11tYlBkB6oUNIunzoNWxN6KI4iIzuRK6eCe/nDK6oIBDtMfN7Blb1q7y8EDxN9
	PzzPcmohQJebDzxr80YmNdE4OnFMy7cXOxD4XPTBeYqj6WfLplYc3ttHUWXKkStqTfNsMKJHMBm
	4kKIDuskuC2k7y3wzhEh/OnJBz1e7+/oR4lyxcDMOxkXfqZ4qfL1L1OAnVI670v04ks/NtHpuBA
	A5pu55AYL68PhFwWnGZpL6ykU2V9vKq8BmSwXkxX8qYwUSeFC0cA234xXMBmXG5LTvXMK8k9g4y
	zix321PW+roND3Uf1bcm56i5jtKL3ajnie85jubQmMD91XOeLkR5M7iLOB13VL+ElGi5+tY4Z8g
	A4Te+9h3aBK/dp5v8GhCJM0V/DJcknFpg2wfbGrbP7bLnG0EfQc4v6Ug3+6/XZbV15JOGqng0Xn
	1LU7wq99hrp3C6Wda4lNgNwR+IMKbFy7NLBz8djGTpc3pG85s4jMU7ITVX3h8AjyTIUMGqnObEB
	RsbHwN6W5mSDyQQPzNWU59Zqf9i6QBjzCheoU1NwS7Gs3+lhXxrS8y6B50Js/fc
X-Received: by 2002:a05:600c:3213:b0:495:648c:a1 with SMTP id 5b1f17b1804b1-49952da88a9mr73374075e9.3.1786020824789;
        Thu, 06 Aug 2026 05:53:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6? ([2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a718bsm6672600f8f.5.2026.08.06.05.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:53:43 -0700 (PDT)
Message-ID: <90b9c09acf04cca3d4d03e03b14577b0c1c63e11.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] bitbake.conf, rust-common.bbclass:
 include RUST_BUILD_SYS in the task hash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alhe@linux.microsoft.com, openembedded-core@lists.openembedded.org
Date: Thu, 06 Aug 2026 13:53:43 +0100
In-Reply-To: <20260804220456.2342710-4-alhe@linux.microsoft.com>
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
	 <20260804220456.2342710-4-alhe@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 12:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242942

On Tue, 2026-08-04 at 22:04 +0000, Alejandro Hernandez Samaniego via lists.=
openembedded.org wrote:
> RUST_BUILD_SYS is currently listed in BB_BASEHASH_IGNORE_VARS, which
> tells bitbake that rust recipes should hash-match regardless of the
> build machine's triplet. In practice that is not true:
>=20
> rustc computes each crate's Strict Version Hash (SVH) using inputs
> that include the *stage0/stage1 bootstrap compiler* fingerprint, which
> in turn depends on the build host arch. That seed cascades through
> every dependent crate's mangled symbols and the packing order of
> rodata sections, so an sstate blob populated on one worker arch and
> reused on a differently-arched worker produces byte-different (but
> semantically identical) artifacts and fails the reproducibility
> selftest causing autobuilder intermittent issues when the sstate
> matches for the incorrect architecture.
>=20
> Remove RUST_BUILD_SYS from BB_BASEHASH_IGNORE_VARS so the task hash
> tracks the build triplet and mixed-arch autobuilder pools get an
> sstate miss instead of a silently-wrong hit. RUST_HOST_SYS and
> RUST_TARGET_SYS stay excluded because they're already covered by the
> target/host arch hash inputs.
>=20
> While this is not ideal, it should unblock the reproducible test case,
> another solution would be to patch rust sources manually and attempt
> to upstream that change.
>=20
> This also has the side-effect that multiple variants of the conflicting
> rust recipes sstate artifacts are created, but they'll be correctly used
> now in each architecture.
>=20
> Also add an explanatory comment next to the RUST_*_SYS[vardepvalue]
> declarations in rust-common.bbclass so future readers don't re-add
> the exclusion.
>=20
> Verified locally: Tier 1 sighash test toggling BUILD_ARCH now produces
> different task hashes for rust/libstd-rs/rpm-sequoia/python3-crypto-
> graphy/cargo/librsvg, where previously the hashes matched despite the
> build machine change.
>=20
> [YOCTO #15554]
>=20
> Assisted-by: AI - OpenAI
> Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
> ---
> =C2=A0meta/classes-recipe/rust-common.bbclass | 10 ++++++++++
> =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A02 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recip=
e/rust-common.bbclass
> index 6bc42016d1..98b46c4e3c 100644
> --- a/meta/classes-recipe/rust-common.bbclass
> +++ b/meta/classes-recipe/rust-common.bbclass
> @@ -114,6 +114,16 @@ RUST_HOST_SYS[vardepvalue] =3D "${RUST_HOST_SYS}"
> =C2=A0RUST_TARGET_SYS =3D "${@rust_base_triple(d, 'TARGET')}"
> =C2=A0RUST_TARGET_SYS[vardepvalue] =3D "${RUST_TARGET_SYS}"
> =C2=A0
> +# Note: RUST_BUILD_SYS is intentionally NOT on BB_BASEHASH_IGNORE_VARS
> +# (see meta/conf/bitbake.conf). rustc's crate SVH (Strict Version Hash)
> +# is seeded by the stage0/stage1 bootstrap compiler whose fingerprint
> +# depends on the BUILD host arch; that seed cascades through every
> +# dependent crate's mangled symbols and rodata packing order. Excluding
> +# RUST_BUILD_SYS from task hashes let a mixed-arch autobuilder pool
> +# populate sstate on one worker arch and get a cache hit on a differentl=
y-
> +# arched worker, producing byte-different (but semantically identical)
> +# artifacts and failing reproducibility tests. See Yocto bug #15554.
> +
> =C2=A0# wrappers to get around the fact that Rust needs a single
> =C2=A0# binary but Yocto's compiler and linker commands have
> =C2=A0# arguments. Technically the archiver is always one command but
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index bdf37d0da2..ee23459506 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -969,7 +969,7 @@ BB_HASHEXCLUDE_COMMON ?=3D "TMPDIR FILE PATH PWD BB_T=
ASKHASH BBPATH BBSERVER DL_DI
> =C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSER=
VE GIT_CEILING_DIRECTORIES \
> =C2=A0=C2=A0=C2=A0=C2=A0 OMP_NUM_THREADS BB_CURRENTTASK"
> =C2=A0BB_BASEHASH_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} PSEUDO_INCLU=
DE_PATHS BUILDHISTORY_DIR \
> -=C2=A0=C2=A0=C2=A0 SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST=
_SYS RUST_TARGET_SYS"
> +=C2=A0=C2=A0=C2=A0 SSTATE_DIR SOURCE_DATE_EPOCH RUST_HOST_SYS RUST_TARGE=
T_SYS"
> =C2=A0BB_HASHCONFIG_IGNORE_VARS ?=3D "${BB_HASHEXCLUDE_COMMON} DATE TIME =
SSH_AGENT_PID \
> =C2=A0=C2=A0=C2=A0=C2=A0 SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUGH_AD=
DITIONS DISABLE_SANITY_CHECKS \
> =C2=A0=C2=A0=C2=A0=C2=A0 PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_IN=
VALIDCONF BBINCLUDED \

Just to be clear, the sstatetests fail for this change for good reason,
it breaks the way "native" works in our system. We work on the
principle that "native" things work the same way regardless of
architecture and that the sstate hashes remain the same.

If you change this as above all of the rust targets will rebuild
depending on the build architecture, despite the fact they're meant to
be build architecture independent. It might manage to fool the test but
the output would still not be build architecture independent and hence
doesn't fix the real issue, just hides it from the tests.

Cheers,

Richard


