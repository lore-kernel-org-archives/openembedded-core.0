Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65671F99C76
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 05:11:33 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12666.1776659627335626817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2026 21:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@chromium.org header.s=google header.b=l/aQOIra;
 spf=pass (domain: chromium.org, ip: 209.85.167.53, mailfrom: sjg@chromium.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so2710780e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 21:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776659625; cv=none;
        d=google.com; s=arc-20240605;
        b=bHoi5uIkSaFBWIFBYBdQqV6GWb6cNodJTkA5cWW5dSBULjOscZgHzCV9A9CnNnlMGH
         Z/i+Cv92CNeMnMMIeU3xXc3gpr16q7WYqE2j2RETxrlmAmDTDSoWG0OnwoD0iWddGR3L
         +amLsN77AD5c7nNE817kZiq4s3S2Q9M7wEFndD36I2+dtIVv9F4NJ18+CzdZsvhhsRie
         f3IJZmIUDfom1VncGXDCae1Vs0UYsKYLRpIFWji5JsQh7oiLthNA0vDVWtqt8SF/tJXM
         7ezXMZpfdTM8q4Wpf/aqtpY3Jrmipu+1dJA1imjB4Zm9G0jFafdc66uvrmY6sgTtOrjp
         KnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ebVc4ijCxOyOF4OhisBlxIRjzsqTdMQ4vk+J1uaQsT8=;
        fh=8VmvRlivy8s47IaZ1dgrh698CqNE/Zy3pJYfSakcM70=;
        b=IaJ1+HscbjcTI7nkdDKztGNAOd3GVObAqGrtQtf6hP/WbeTMpSpTEnIy7qa7kmad+p
         iPvtxBVjh4n8A8YuwaIOhigne0xkrCpD+zyDyMowhHopAC5FothV2d5Ch2FJ8vcq/ExI
         GZJbx+0rDCeNEXafJ9RU0a9ukRaqGxNUkgy2UUj93LhxE3eW9XORDeelZ3K5Z1Px3LGw
         qPy6VbikU3cS4NpxW0mjgAdZGvvRjIqzaJOPBnW9LBeP9rt0IH1sOtu9Wqs4hHQ+7r52
         +hsL4FaDcAkEOmmAFNMvpt0TUUPJ0uLeNTWZp/G4CijwL7k9g3TmX6EWBY5S0foXjZCt
         CIbQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776659625; x=1777264425; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ebVc4ijCxOyOF4OhisBlxIRjzsqTdMQ4vk+J1uaQsT8=;
        b=l/aQOIra7OnbJtz3GlAIWnsCpAxdSUy83oDnWdw+A0M3ncxOuJ3d4TkncB+mksrnRf
         KZGrhyLpg0ZF9Az3/lWjyB4YLCoieTt9nG+lbsYzWG2KsN2JVovZSeyfey2qkqRuhu0I
         UeVuC5E9EjzqdzfYw2EvRoJouogQjPHw/wo2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776659625; x=1777264425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebVc4ijCxOyOF4OhisBlxIRjzsqTdMQ4vk+J1uaQsT8=;
        b=gpVj0rG7zxT6Qn2DG3N3GZdD+RHfJPUY3qw1x/OVmop9dUAqklqmCCT+AstRvoopuZ
         QEfAv0xngDzUJT1oUePgCwkwxiyh97YPM1/Kyiu51+t9klfQoeYUwNPUvjmgK84s4LRA
         J9nB7cub522lqqm7KRW5Fp25bQt+lqOayo0djGtzt32EAoA5gdFZr0drYTNGyW47GNe3
         0OsDDpk86fqEu9OZcHky2WpuyUzH61B5pSlNCObNF9uwgZMJoKvGD5cQuzTBVS4SI2pt
         7GVD0tJA2jKNDhUOySgQzrFgG9289IeH5ia3TViyv0OPvr00dvAknr80vNzdFLZ9ePo+
         AVnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pbfX9yXjFRu2XoV0JXD+1HeiZpjIB1OiC1iRkYBN8IKJLJUXopBZctQti9w4ybJcnV2xd2kiKNYuMTCowxyAc+A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfS1nnMLW3SnDeFXGPiACPaKghZHfTkUI3P31Jdsr2Jf7z9XWW
	TUYpxNeXLbzjCTnRJWmCrBu8YPzqqIIHp/k0yfVgZB1oV3g2hOjaQPP2akVwdiZ7cFN/KVWJksp
	OtZ9QjQhY47g0uA3kOsHOpnTiECNsS7hUrN7SmsRwIi3W9IKVC+oUfw==
X-Gm-Gg: AeBDietgrHqUp9tnUuHFnNXQExtL7G6jkU5ozm+tH96R6uR/WfpHs8hvGMKcHlXGySB
	u3fnoOiI2lNxlCQXgKlqjLiLYlplyAN9cdYGPxA/16XXcjOZfPQTcol5JmvAH+kKuLABbA2HTZp
	g5TKppJkqSVsZvOECx2VqV1FFEPAVX01ey/xznsQ1Yn4XZelw1RWXn2PBstVybfKwCLGFweGv5o
	+ET8s6D93/6+JBzqHYJ6H+KDD2OsvYjIYa3huRV7xsa+rPKUjvNZMeApbAZZ2jw2tnSvv52oy9A
	WkjjvnTAapG6BHeogPc6
X-Received: by 2002:a17:907:6d1b:b0:b97:ce8f:b9db with SMTP id
 a640c23a62f3a-ba41916eb89mr525366566b.10.1776659236297; Sun, 19 Apr 2026
 21:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260409074710.1322519-1-Wojciech.Dubowik@mt.com>
In-Reply-To: <20260409074710.1322519-1-Wojciech.Dubowik@mt.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 Apr 2026 16:27:03 +1200
X-Gm-Features: AQROBzACsMqcZS2W3-E4GjMmaex2eovy9tsQ2r3T9pE2VdDWVox4SslQFKpS-8A
Message-ID: <CAFLszTjN_MPr-RtBm4QMzcKVGU3mz7_TouvBugWOG=7CeTCb6Q@mail.gmail.com>
Subject: Re: [PATCH] tools: mkeficapsule: Add disable pkcs11 menu option
To: Wojciech.Dubowik@mt.com
Cc: u-boot@lists.denx.de, Franz Schnyder <fra.schnyder@gmail.com>, trini@konsulko.com, 
	"openembedded-core @ lists . openembedded . org" <openembedded-core@lists.openembedded.org>, 
	Francesco Dolcini <francesco@dolcini.it>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 05:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235532

Hi Wojciech,

On 2026-04-09T07:47:07, Wojciech Dubowik <Wojciech.Dubowik@mt.com> wrote:
> tools: mkeficapsule: Add disable pkcs11 menu option
>
> Some distros are using gnutls library without pkcs11 support
> and linking of mkeficapsule will fail. Add disable pkcs11
> option with default set to no so distros can control this
> feature with config option.
>
> Suggested-by: Tom Rini <trini@konsulko.com>
> Cc: Franz Schnyder <fra.schnyder@gmail.com>
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
>
> tools/Kconfig        |  8 ++++++++
>  tools/Makefile       |  3 +++
>  tools/mkeficapsule.c | 14 ++++++++++++++
>  3 files changed, 25 insertions(+)

> diff --git a/tools/mkeficapsule.c b/tools/mkeficapsule.c
> @@ -301,6 +305,7 @@ static int create_auth_data(struct auth_context *ctx)
> +#else
> +             fprintf(stdout, "Pkcs11 support is disabled\n");
> +             return -1;

Please can you use stderr here for consistency with surrounding error handling.

> diff --git a/tools/mkeficapsule.c b/tools/mkeficapsule.c
> @@ -301,6 +305,7 @@ static int create_auth_data(struct auth_context *ctx)

The cleanup code at lines 420-423 calls gnutls_pkcs11_deinit() when
pkcs11_cert || pkcs11_key is true. When
CONFIG_MKEFICAPSULE_DISABLE_PKCS11 is defined, these can still be set
if the user provides a "pkcs11:" URL, but gnutls_pkcs11_deinit() will
not be available. Please can you wrap that cleanup block with #ifndef
CONFIG_MKEFICAPSULE_DISABLE_PKCS11 as well, or ensure the function
returns before reaching that code path.

Regards,
Simon

