Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0897FCA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 18:45:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2411.1791312337071114278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 11:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d8uoH2wy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso7855295e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 11:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791312335; x=1791917135; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w8TDbZgT0TQctVf7HjSlN0uJC76XcyYmCgS8z19zzOw=;
        b=d8uoH2wyfXNM4TwvX2hC8vXP/yMIuj3Ua0B0esR/BvORDXTIi2aq2tdB1uUCsNQCvN
         IpWngWxyT6/GkKgg1c3nl81Dr2GblI/UXrm4obKU6CE95cU1qBjyQ2KzBnCp5YETj+lM
         D6/ENrpaQQifzrqSl1azyzQuy37J/+QtJa04U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791312335; x=1791917135;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8TDbZgT0TQctVf7HjSlN0uJC76XcyYmCgS8z19zzOw=;
        b=QlHx3i09FzSHX7vve+MJ5InXGnGZ2DrsHEYc2YLfYYwpQgRuJsGpmSyIenymaFU03Q
         e7blW1OqEfQNwgRMe9YLWZYHTyUZzFP5tpwd9AiuJp3tnrsQFt3a4+MTeBHC9w/P8qX4
         spIU7og739clT92tHSgwwOqPu81ceoUCWhkeH91MuSxMPsyma/AZ7eRg7KBGhindTDDb
         LDqs94/wYZVZgORwaMzNoJ9vkwtUHGWLlCulgKHAMPLdKRnG/hPOA9VKnZEA629mLa7R
         QRJaSQS6SJAeW6tJ/U7115kxUbiYp0L/IybiVZsc1nlz6Og0UatDLf7t3/re7EERkPMy
         6IMg==
X-Forwarded-Encrypted: i=1; AKwUvByxLeybdG8PVhSaSqodQuqSuhJEpDzvK0B4pMLby+EC2sQnS/RcqcSo9t8AWvS8ipiEj1QwV9wZYpqpET8FjbBLAg==@lists.openembedded.org
X-Gm-Message-State: AFuF++m48fGz5NuMBZwv4dtnB/T3TQgK5Efj7uPrxwt2HbZWnXrX7bRf
	QganT7uhG3VKbVn2+ft/VkTG+j9Qup1NvLiLtzPN891pBvF0dNIHr+2olyzu7H7fzN+ihxTAwPp
	oMivxIWc=
X-Gm-Gg: AYBFou3w5x1RHUbSZhh83naQsEU2y366QvoI5qqlM7/e3ksjgXitppSZZtm9UOmWtOH
	TFY8Zk9OnvQW/rEBlRVj5Kp7szn4idpxAlUY5xLAE40K0JZLvkyT/rlPgN0u06Eg0jUabKuXrix
	c5O8A+zlhj+7fK95BKvU4wLetYYAuPWJ9OhRGDq02CX8jjE96WBmriTNLlJaGakGaNQad04cI4x
	grJ231Rv2Tvrwy692BCktWI4UTt558sBsEzaalZ3MXHqkeVrpSKR05Exb/cvpb19EYHFfWZ+jZq
	dJiYc76gPY3Kd9Tf9nnYu4qmnT8rdWxX96S86WIWDFQ0PArEfs9HN8hc3CsmlqCWCd3u9XcvLXY
	NjpqzAmk4dTleLN0ft+7tjUcDUaPEKMhh2cISmtsWZMmTOCZHPzWw9Uy7h8E4odWA3mZJ97znyb
	JAsy/FIFJw/az+715PkPwZMbChaXHL4RdTn8rMalBvNQsr3Ee1gHw9Wi7jhUqmoJ4boQZOeD2BM
	GXnDE4+NU3REiOd1eUFNn9nzDtlQqrEwbm7ANz0JnpZh4p5SxPD7EQb84ag7yE=
X-Received: by 2002:a05:600c:c48e:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-4a17b538d78mr35873515e9.19.1791312335143;
        Tue, 06 Oct 2026 11:45:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c33:a6fd:944f:6e89? ([2001:8b0:aba:5f3c:7c33:a6fd:944f:6e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2fba1sm1012888f8f.48.2026.10.06.11.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:45:34 -0700 (PDT)
Message-ID: <8e2ed66c100c18257c4d8f1d6ce85c7dd28ac12f.camel@linuxfoundation.org>
Subject: Re: [OE-core][blacksail 00/19] Patch review
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Tue, 06 Oct 2026 19:45:33 +0100
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 18:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247318

On Tue, 2026-10-06 at 17:45 +0200, Yoann Congal via lists.openembedded.org =
wrote:
> Please review this set of changes for blacksail and have comments back by
> end of day Thursday, October 8.
>=20
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4887
> (The review branch slightly changed from this commit: SoBs, patch
> comments, no code change.
> * qemuriscv64-ptest failed on:
> =C2=A0 * 16422 =E2=80=93 AB-INT PTEST RISCV64: python3 ptest failure (pyt=
hon3-more-itertools)
> =C2=A0 * 15896 =E2=80=93 AB-INT PTEST RISCV64: e2fsprogs ptest failure
> =C2=A0 ... both known AB-INT issues that a similar branch passed:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://autobuilder.yoctoproject.org/valky=
rie/#/builders/56/builds/2553
> =C2=A0 I don't think a re-spin is needed here.
>=20
> The following changes since commit 419c1b0f1ed0e3ce22b1022061f763d0078831=
21:
>=20
> =C2=A0 build-appliance-image: Update to blacksail head revisions (2026-09=
-29 20:31:43 +0100)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 https://git.openembedded.org/openembedded-core-contrib=C2=A0stable=
/blacksail-review
> =C2=A0 https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dst=
able/blacksail-review
>=20
> for you to fetch changes up to f59af8082a2f7cdb27a4ba5968b81d740bdeff35:
>=20
> =C2=A0 recipes-support/gnutls: disable slow tests for RISCV64 (2026-10-06=
 17:04:27 +0200)
>=20
> ----------------------------------------------------------------
>=20
> Ankur Tyagi (1):
> =C2=A0 tzdata/tzcode-native: upgrade 2026d -> 2026e
>=20
> Bhavikkumar Girishbhai Ronvelia (1):
> =C2=A0 libpcre2-ptest: add testoutput3C for locale variant
>=20
> Bruce Ashfield (2):
> =C2=A0 linux-yocto/6.18: update to v6.18.54
> =C2=A0 linux-yocto/7.2: update to v7.2.8
>=20
> Jaipaul Cheernam (2):
> =C2=A0 perlcross: Upgrade 1.6.4 -> 1.6.5
> =C2=A0 perlcross: drop redundant LDFLAGS-when-linking-libperl patch
>=20
> Jinwang Li (1):
> =C2=A0 bluez5: fix obexd/pbap u128_to_string skipping data[4]
>=20
> Joao Marcos Costa (1):
> =C2=A0 recipes-support/gnutls: disable slow tests for RISCV64
>=20
> Joerg Vehlow (1):
> =C2=A0 tclibc-baremetal.inc: fix gcc-cross EXTRA_OECONF

Definitely not this. There is a request for a revert.

Cheers,

Richard

