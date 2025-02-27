Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A6EC197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 21:14:44 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.1005.1740690878110760876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 13:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TIrsLhj/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390dd3403fdso1183035f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 13:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740690876; x=1741295676; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KQOenOJe3J8SF7hQWwr6aPiC+MejnRXBvVfOLCmstsI=;
        b=TIrsLhj/4zA1+32vygDnqJvRNARBrSJetdspNi8QNia/ZZ79xU+lXpuWrRgOj5FIa9
         b6+9plAfsWkW3dgZAXCsZ7cH/auKgXAolIGEt5JbjAoTcdhRXvvrLbIh/YD+C6PHRO0g
         Um/M1Sg9bs1GVmXMCH4dJvFvU0QdFmM5dfE04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740690876; x=1741295676;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQOenOJe3J8SF7hQWwr6aPiC+MejnRXBvVfOLCmstsI=;
        b=jYaUiyTUoHqdb/+ALP0GE6XQ2Qk+Rn772pQ8DhzME5wuSB1LrU2a6u481KkuQYl9y4
         CLpBXxpXa7d+ZTTxUAPis3t6T6iIR+cZDviqQSngUMPk0wuW13KYeXqjcYEMMivjqtLm
         3jr5hNBegZaS/UWGAM1XPBvtefGSy5np/H9h0XABYe8wN+29nVO/Bc8+5ZIuEYjGkAUk
         QEo/iRD4GFfSoLEF6cBG0pN1hwLrRAW4tUuhd2NMmDtv/zr6u8r6ihr2jz9OsaoVWevw
         w6Lq0jEWJfrdAUNyZzEXQlBYtz6VIoMV6TkHQDb1MTbMMGEUtEChDXIKgREq6Lb4Dal3
         7jRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBa3KHkyHMeWQ8mo2iKzEygLffaLuVPJaYcVmagNjjD16yxzEaW/M3Um0i1rfsuwg1NNrNa9l6tPHgUmCUA3dJGQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyzpc3IQkhvOXNeoRE4/VQT2o5Mli/mKKuEau9bGVCzCEEMC6eF
	ZCkhWD8IBTnW1yhPaMEJAFcr/gnh3PTFvscVIwUS+T2LGcIuOXEF6MHusUU0mQLV53q5ygWPwhJ
	l
X-Gm-Gg: ASbGncsfmrQxGHiyooSL7vFSKhIdf6JfN/TEDtyKBKKku7wzzVb3IAApe0ZnO8vV7gi
	V4ByBfV1NMsjLAyA/szGlNqnVx2BKNTOn3Me+Oe0qc3obb7ifhv22H4V7IrJlgsWZ9eGmwMvkvS
	OhKTK2uAhnN46bBtvIichCQV0c88P27medvCQUjjyhbtlKYR8g/DGghIwZiHVBFJptCzktxsWPo
	tLT7LPwssKnqpDy6pnfcr9Y/vTnAg1MBKx2YZGS4glJVYeftw1exR/Q30hOjPwmRGM1hmG+Yc4K
	p+D1vGt30t+/56dh+5Cd67S8BwYhhSRcomtC8hAAbkCW1bQMuh2n6yFfEBIDoVS8KTfPD2mSIEp
	coUVUrhMBgDBTiUg=
X-Google-Smtp-Source: AGHT+IE1VTunEZp7xxMOyFLDgOEz3Ta45UiQ/YcqS2ezkNGumCdyPncJlscQkwi102us/9Y5fu5rRw==
X-Received: by 2002:a5d:5848:0:b0:390:d7e5:e8b2 with SMTP id ffacd0b85a97d-390ec7ceca1mr538155f8f.17.1740690876352;
        Thu, 27 Feb 2025 13:14:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:26a3:608b:106c:59dc? ([2001:8b0:aba:5f3c:26a3:608b:106c:59dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7c43sm3083491f8f.49.2025.02.27.13.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 13:14:35 -0800 (PST)
Message-ID: <1c152e08abc31721bb9ff8f5e27a996d9e0f251d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] selftest-ed: Upgrade 1.14.1 -> 1.14.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Thu, 27 Feb 2025 21:14:34 +0000
In-Reply-To: <20250227134340.144081-3-Deepesh.Varatharajan@windriver.com>
References: <20250227134340.144081-1-Deepesh.Varatharajan@windriver.com>
	 <20250227134340.144081-3-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 21:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212041

On Thu, 2025-02-27 at 05:43 -0800, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> Upgrading selftest-ed because the current PV version is not available
> in https://ftp.gnu.org/gnu/ed/=C2=A0. Hence updated to latest stable vers=
ion.
>=20
> -----------------------------------------------------------------------
> ERROR: selftest-ed-1.14.1-r0 do_fetch: Bitbake Fetcher
> Error: FetchError ('Unable to fetch URL from any source.',
> 'https://ftp.gnu.org/gnu/ed/ed-1.14.1.tar.lz')
> -----------------------------------------------------------------------
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0.../{selftest-ed_1.14.1.bb =3D> selftest-ed_1.14.2.bb}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename meta-selftest/recipes-test/selftest-ed/{selftest-ed_1.14.1.b=
b =3D> selftest-ed_1.14.2.bb} (86%)

This breaks all the archiver tests:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/76/builds/1048/ste=
ps/15/logs/stdio

Cheers,

Richard

