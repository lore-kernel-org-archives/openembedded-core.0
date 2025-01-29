Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6ADC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:04:25 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.10134.1738148656396500528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FgDcz1PP;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso60883366d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 03:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738148655; x=1738753455; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dvc7ITKXUPMpzOhc3s0wQCBehcf3LazMi2p2rlOUWZg=;
        b=FgDcz1PP5YSYFAQ28bE/kPF3GUfsMuBeo0Rd+9wdYQmZimi7TNU1AlD88GCsqbLtdJ
         RGYR89u7pCyyiP2wuC8GxlEdUekKiheEV5IMHKBkkp7xlm17urhsF1RxfArv/j1CwkuF
         cv8pHLo6potjKRr64yuuQ+irhNY/E/MCRVIsnr0+tsUHeg72NkW7LUnlYIisN3zc3nja
         PgBqpHWr4IHWj1Uj3ubiOuhRFkGaVwiyn6uGf/2Wgxs0i5Q156sQjzhiTqGs4uU/dZmT
         f9fLiVQXjzKZzs2QqpcTgeWSmZ8yJ0BRR62kj0A0Mr4MYIcaDiQWXqEjX/3VRwYQcnti
         4eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738148655; x=1738753455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dvc7ITKXUPMpzOhc3s0wQCBehcf3LazMi2p2rlOUWZg=;
        b=XtTprMUBtA2252aq2jo0L0G9ucmP3j/6BJHylkJLmGiqhbTIuRq3JPE8EW0RC57YRT
         P/z/4VByy+nXvgAl2KDOapu6KQCXnrytQcDcPImjTSUgDOxThJ5cjWFDNsYSTSJKQBxJ
         RBeCzME1Fxh1BJ6hwwDHnlQAlqGy/Hk9hRUSldWZVDvYCJrHgz/rfF2bHM6sAxjUUWcN
         etH4GMSrXV2FPcsLtBmEXkZBoq90Lb6LOHCKAArPW2Htt3XLERpJCNXBF2id9JJTEbEm
         WuOPZYmVN5bM8E5TDq+cvfR7v8tWclrM7B/2qtbWlLf3++HSwEMbFHOK3An9yxTbJacX
         4RYQ==
X-Gm-Message-State: AOJu0YwGb0563OwoT6cpJm7mHaPlpn1H5UvOunKMopX/iSCoX+sD6vYg
	7M6wGJVr214uIoa+N+JnV7hPoqVLMRiEwU+VlwKKKl/NbQexOtljT07Zl9gvXHxf6UE0sAGYd/z
	0aYNcDexzM1LbUxsj9anfc4y6kCY=
X-Gm-Gg: ASbGncsq355gAOcKUGDUi/0O8fF4dC969g3p4RYg97ju3dY0nst/w+r+kN8VC2oKMZm
	xqPwlCZa0hmmDwsvmaI0xw3KlJz4mmaxA5Ocs26YWKD7vEp/FOH9nSdL9sw4jjxl19LWiigwTf5
	XFVl0VL5dcHThE3ly02QC/FEJijsK+ibs=
X-Google-Smtp-Source: AGHT+IFfM8fx76zXs9qHWVEnT6dV1+CPVLwb1bUt4/gfwQ/YMeLFxIVpuo4LzHw3AtE39fGSKcilPFYY+XLWsvZrIIw=
X-Received: by 2002:a05:6214:19e8:b0:6d8:7ed4:3364 with SMTP id
 6a1803df08f44-6e243bf3618mr42233506d6.3.1738148655412; Wed, 29 Jan 2025
 03:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20250129104150.2391653-1-zboszor@gmail.com>
In-Reply-To: <20250129104150.2391653-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 12:04:04 +0100
X-Gm-Features: AWEUYZnjAxV3q4j04SBu0bnb1ajqJywVh3KzVBylI-KTnaJDVRWKIl_WQeUyp3Y
Message-ID: <CANNYZj84GhZfxXJ-Snnyb2Zfh2Qu_A5BZemxWNWCm=sKH39=Hw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 1/2] rpm-sequoia: New recipe for version 1.6.0
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210371

On Wed, 29 Jan 2025 at 11:41, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:
> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb

Let's take the latest version right at this point, which is 1.7.0.

> +# The license line is taken verbatim from Fedora's specfile
> +# with formatting differences for Yocto. (AND -> &, OR -> |)
> +# https://kojipkgs.fedoraproject.org//packages/rust-rpm-sequoia/1.7.0/3.=
fc41/src/rust-rpm-sequoia-1.7.0-3.fc41.src.rpm
> +LICENSE =3D "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode-DF=
S-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | MIT)=
"

This is the original source, please replace the link:
https://src.fedoraproject.org/rpms/rust-rpm-sequoia/blob/rawhide/f/rust-rpm=
-sequoia.spec

Does the target rpm-sequoia build without issues, or did you try only
the native?

Otherwise, this looks really good, thanks for working through to a
much better recipe :)

