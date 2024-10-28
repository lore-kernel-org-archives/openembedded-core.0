Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4E6D33984
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 14:00:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.52370.1730124026281255080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 07:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VEV3gm8H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso42755545e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730124025; x=1730728825; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EQirZpAUcINANpzqvUpGkPEmRNdViaTSkQMS7gpKtlM=;
        b=VEV3gm8Hq58mxNXUbf4nW0eIhM9eesSCktr3vWVaJcfwJClntgq4bIB2WS40JK+eAW
         DprGlgzz955Ew+UFicHEtcazdU78p6CDZN9M5Y+xB69V8Pd4GNzHRo4pl0Ti2AD+99AG
         cYjgj4RWLwCH1B2U/0x7IxgbNtQIt85kpXLDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124025; x=1730728825;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQirZpAUcINANpzqvUpGkPEmRNdViaTSkQMS7gpKtlM=;
        b=gaIgjmhMe+lDT4O1/Obo9X3fTNVyHfxV8ANOrKa8St1+V4EUZsvKdsPVDkytXrJBWF
         XzssxSZ4PufzpQrBXqkaCVt+BulwVXWP2S7gLXiEvjbvxDLby8FjTvWJIcnPznft02PB
         gv/VlPO62EyNuMwA8jgG4aYng8MjZ+MuO8DO0Uy5aBPXX9hxNRApGoNNp3c8JMdPnl1W
         Xqb6uZ0geJ8SClVI5j7AhXOYfE+HZe0rYjUdwvF49hOyY+D3U6XbcunX+YpD4mS6STNm
         I94+mxDxTRWILEdqXfvs19YSey7Kdq15vBcOakZ/q/llfz7FMWemBd6uh+aJiZLMYZ8N
         fjqg==
X-Forwarded-Encrypted: i=1; AJvYcCUeBdumTxBsN5GqvIeaoBMaAMEVwi+0IExnREN5wtM/cNcpAIpNpqH3dsZBbzOmX9SmuNxGeKrBuqKX8M6I72w6uA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtX+vEDTdOHeOAmqCPzgu56kdVGrEyqdFK/nvXXPj1pOI2eAYm
	dv1I8u1CQeUKyO7D3FCelpfQMMNnZMny03NbXpuRd6yUvXYdBKFRTBk8wz6/vHNfARg8cHQcV+n
	g3nE=
X-Google-Smtp-Source: AGHT+IF9lDUHsWqb0dbd+IF9wTRWSMEiUgtlWqQAeW4V2hCIAVRgtnTnFw+gq7r184EiTOh3yqWvLw==
X-Received: by 2002:adf:9793:0:b0:367:9881:7d66 with SMTP id ffacd0b85a97d-380612008e6mr6558268f8f.41.1730124024462;
        Mon, 28 Oct 2024 07:00:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:509d:a248:a274:a307? ([2001:8b0:aba:5f3c:509d:a248:a274:a307])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bddbsm9553553f8f.27.2024.10.28.07.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:00:24 -0700 (PDT)
Message-ID: <f03d68120fc582a4bcc572dabf1202e554c01997.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3] rust-cross-canadian: Fix file conflicts
 for arm and aarch64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Mon, 28 Oct 2024 14:00:21 +0000
In-Reply-To: <20231216085644.3202920-1-Deepthi.Hemraj@windriver.com>
References: <20231216085644.3202920-1-Deepthi.Hemraj@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 14:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206445

On Sat, 2023-12-16 at 00:56 -0800, Hemraj, Deepthi via lists.openembedded.o=
rg wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>=20
> Rust multilib sdks broken because of the conflicts between attempted inst=
alls of rust-cross-canadian for arm and aarch64.
>=20
> Arm and aarch64 target architectures are trying to install cargo.sh and r=
ust.sh in the same path which resulted in the issue.
>=20
> The current patch modifies CARGO_ENV_SETUP_SH and RUST_ENV_SETUP_SH macro=
s that uses MLPREFIX based on the multilib architecture.
> Hence, creates different file names for the environment setup scripts and=
 resolves the issue.
>=20
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust-cross-canadian.inc | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/re=
cipes-devtools/rust/rust-cross-canadian.inc
> index 7bfef6d175..9996d3d4a3 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -52,7 +52,7 @@ do_install () {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-s=
etup.d
> =C2=A0=C2=A0=C2=A0=C2=A0 mkdir "${ENV_SETUP_DIR}"
> -=C2=A0=C2=A0=C2=A0 RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/rust.sh"
> +=C2=A0=C2=A0=C2=A0 RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/${MLPREFIX}rust=
.sh"
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | =
tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> =C2=A0=C2=A0=C2=A0=C2=A0 RUST_HOST_TRIPLE=3D`echo ${RUST_HOST_SYS} | tr '=
[:lower:]' '[:upper:]' | sed 's/-/_/g'`
> @@ -66,7 +66,7 @@ do_install () {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 chown -R root.root ${D}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo.sh"
> +=C2=A0=C2=A0=C2=A0 CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/${MLPREFIX}car=
go.sh"
> =C2=A0=C2=A0=C2=A0=C2=A0 cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
> =C2=A0	export CARGO_HOME=3D"\$OECORE_TARGET_SYSROOT/home/cargo"
> =C2=A0	mkdir -p "\$CARGO_HOME"
>=20

Sorry, but this patch isn't correct as far as I can tell.

As I understand it, the files in environment-setup.d will be sourced by
the parent environment script. Whilst this patch gives them separate
filenames and hence avoids a conflict at build, it places them both in
the directory and both will be sourced, one will win and the other will
never get used. This means we swap a build failure for it being usuable
at execution time in the SDK.

If I'm misunderstanding how this is used, please correct me but it
looks incorrect.

Cheers,

Richard



