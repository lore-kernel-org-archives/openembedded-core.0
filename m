Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E323C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:39:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.6902.1737621539973994080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 00:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GcPWOXf9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so6425015e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 00:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737621538; x=1738226338; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjFZk07QWscuYfu5+xHOXS0X8nWTk9oXbD2otUjXQQ8=;
        b=GcPWOXf91l+H6pqOAh6p3DaOE+HgrlGPNGKIpqIkX6OvZG1JWgJLCCST5T3K//Z+4j
         7SM+90q8b3yUpSjhPN5+pQTwJjeEcAiPuepqtFw4cirAhGGfR3hKILOArxVm/mHouSJH
         Le7vSXDLYxWOpUwyqREr/59gfpv0TwYpkMjMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737621538; x=1738226338;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjFZk07QWscuYfu5+xHOXS0X8nWTk9oXbD2otUjXQQ8=;
        b=pI/U/tge7vpATfWpD9xh2j9aCbPNClNn+r6DDP5Bi+DBcM3o7OEcTnCNMquCwcq62x
         DGg2dIUDnyhGVHwXEMXoO9Ng/2r/KX7sSIqVRXmOS8aS6UZGTvmq6CNTrolrfD3sKq7I
         0UgG5G9KVNh6AYAgB+Q+BE7ZRQgvAaCU3z/BTmq+SXvqi0N1sVZJcqlYrgAjj3PaEbzy
         8nD5BpkC6+glBQb3njUM6q20edK5cylq8itDP+zj6spvG8Z0Z791vCpiwa5C4IUPJXJc
         C6p5kc3oZhEINP6ntTginwz5+18nlZkpWK2x9tNsVUFJc+ViSBBrdqYdxssnHxMqpUYl
         yaBg==
X-Forwarded-Encrypted: i=1; AJvYcCX0A1arrH2nsgkLTmTVR+jA38gNrplkbkW1iStob5a+lnGBAk1k6Im/yF9U1VwrmWDINGYwHYD2wD317qR/fp4XuA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcJgHfAIS95B5B+upwr+gU7ZEmCqCBZa8sr1aKunnBSRjNxrLU
	KILr29hU5/XqzGcr57aoTcQYXhxGlNH7hLBiYfvLVrkszy3dzN17Lzuu1Y0NlUk=
X-Gm-Gg: ASbGnctidyK8mN39rNpULMiatNsxy3lEM1u9Mi89B0kIHAOrsS547gbgns1KrKJMV0N
	zkHraNZnQsVR6Hjg63iTiZJ9KXYQUpJ4VrVRxxb86kFJUpoocVFfQl2rDTV0ieWVsB0fuBzS2cR
	CsfzIsc+xLsMDXGIw0AmfPDdrii49hymhqSMBLiHgMVfKiPnkoA6O2ecWMdPPohoEnVBQQS9S/A
	sHsU9dQEB263xZ2mWpAMORDCrldtoYeJjk3V5tY9QNhykOAf+zUXerOkMp36t0AENDHxVqw2m96
	qrdDxMR9Ci/Szghkf2GQoC3Hi3xM1XcOjHjBI34pjHpWG1Ky9c2BRY6POBmDaWDMu0lf2g==
X-Google-Smtp-Source: AGHT+IGbVTFoOjtzvzQbpNYBmi9TMUkkZZhNDKbxk5juvisnbWDHgnmCFKkE+QXwVt1kP82Ljd4R5Q==
X-Received: by 2002:a05:600c:601a:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-438a2114bc9mr139684675e9.1.1737621538355;
        Thu, 23 Jan 2025 00:38:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e9f3:6482:e693:9d62? ([2001:8b0:aba:5f3c:e9f3:6482:e693:9d62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31adbccsm55870225e9.19.2025.01.23.00.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:38:56 -0800 (PST)
Message-ID: <ad7f050333aa6393382e4d8ae750ab50d6f1c202.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] dos2unix.bbclass: Fix patch error for
 recipes that inherit dos2unix.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2025 08:38:56 +0000
In-Reply-To: <20250123082500.903901-1-hongxu.jia@windriver.com>
References: <20250122044245.3463096-1-hongxu.jia@windriver.com>
	 <20250123082500.903901-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 08:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210180

On Thu, 2025-01-23 at 16:25 +0800, hongxu via lists.openembedded.org wrote:
> While SPDX_INCLUDE_SOURCES =3D "1", call do_patch in do_create_spdx faile=
d
> for these recipes inherit dos2unix
>=20
> Prepend function do_convert_crlf_to_lf to task do_patch to assure always
> run before do_patch
>=20
> Add dos2unix-native to DEPENDS to assure the existence of command dos2uni=
x
> before do_convert_crlf_to_lf is executed in any task
>=20
> Also remove extra do_convert_crlf_to_lf in archiver.bbclass which
> is not necessary any more
>=20
> Suggested-by Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> Changed in v2:
>=20
> Do not call bb.build.exec_func to run do_convert_crlf_to_lf in classes/sp=
dx-common,
> preprend it to task do_patch to assure always run before do_patch
>=20
> =C2=A0meta/classes-recipe/dos2unix.bbclass | 8 +++++---
> =C2=A0meta/classes/archiver.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 3 ---
> =C2=A02 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes-recipe/dos2unix.bbclass b/meta/classes-recipe/d=
os2unix.bbclass
> index 18e89b1cf2..edc8c3afb4 100644
> --- a/meta/classes-recipe/dos2unix.bbclass
> +++ b/meta/classes-recipe/dos2unix.bbclass
> @@ -10,11 +10,13 @@
> =C2=A0# on Linux(LF), which can cause annoying patching errors during
> =C2=A0# git push/checkout processes.
> =C2=A0
> -do_convert_crlf_to_lf[depends] +=3D "dos2unix-native:do_populate_sysroot=
"
> +DEPENDS +=3D "dos2unix-native"

That will break the class for normal do_patch unfortunately, DEPENDS is too=
 late.

Cheers,

Richard

