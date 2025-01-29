Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9182CC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 13:05:26 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.12076.1738155925057898488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 05:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qjnra4xg;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e1a41935c3so97395986d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 05:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738155924; x=1738760724; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zPn/81LBgUUpSTDA4ABUTsWY99uZBCKpRad2OtX1cg=;
        b=Qjnra4xgZaPv5OUQOqqaQ1wnue1bxspbjCUTgN+epQLGqKJp0WKB7TrjkJLbzUVgK+
         LcAwzavYD2LTlZZCyiJfkz+40kwTUGI6QqB2FMTLNi8Xa6q0OXUKrOWGrldvryPEFBwg
         iDoxogk+kSORGKgDRVN97KK2+y4CbYYwPNhhMmkaj8dpVj7s5kE97J+uPD0xsnP+DqD9
         iGwi6JaJcITualdlQamEZt4YjQf6dz7bkrjtnfxdVZp3YlQk2VBWOg1rqMasdAxO+/N5
         pKKhu0rq5ueReZL5n/RF1Y05Uw6b6Ug57WJrpAPaZKJB8O1PiMnBljK+1UJ88cJuVP7o
         da4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738155924; x=1738760724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zPn/81LBgUUpSTDA4ABUTsWY99uZBCKpRad2OtX1cg=;
        b=IoT1OPPbU8entLWcDDhz5Avv31gaKAWJBx9kz7yyZpEACP7ec5gLI6gT5QI6nd0K1p
         2ZpQh76n2mYBSGEqYDmjFEEChcT5sTwRj1knf+oimrprcalwR2ikOo1E1Hz01Av6cb84
         XXTaU3cucmoND+R0OhfMdz3UWpz/YBkOYtUZmdEhT+mKWYNF1JmnUfQcUPQvWzuHzRw2
         ohOqsiz7mPv4ucYE3oDgQV1q23HZ3B18WIqTYV0gSOt7olDnuyGVV3hCm0aKhvC5JgZN
         UmT8JNSWSmyMzlvGYtYtA3yprO9yxwY8pui0Y3+zdjX/YzR9RL5pGHfVtkYVWhDBcgAr
         nFLA==
X-Gm-Message-State: AOJu0YwFPg0WqxNrII9zj1oM1NFAJF8+MFpfyV4kutuYa21Fq6FptPsi
	qh3H7KiByajao4QAUmnh9KiYrNWTWrE7VhxGPIPpLd1U/Lo4XQCII7y5WmfhXK4NLX5pce728wF
	SYBeE95YEeMg9jwOEbFvKIRV8Amw=
X-Gm-Gg: ASbGnctq9u2AZSSVIhV4bfsJBsDLtzutNgxN6UtZDS03QsAZ3w+J5CJ4DpY2rQw3k1u
	URd3gZa/bkCJieukuRMPNSe+LCyru96/IP6GYji7rY38mrQNO540cOsshnCts+4pxALYfIesRfe
	TXR9qWtj7Ck5lRZi2TCHgK4CyrZ5gk46s=
X-Google-Smtp-Source: AGHT+IEvd8sh6+bWPdBIOkcs5HbFSB2r9aWUpsMV2gOgkR6331VYbPTtriY2mgPFJp97j0LD8N9ZnMvtSr0AZZi/BA0=
X-Received: by 2002:a05:6214:1d01:b0:6d8:9dad:e14b with SMTP id
 6a1803df08f44-6e243bbc197mr57240846d6.13.1738155923749; Wed, 29 Jan 2025
 05:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20250129124741.4115324-1-zboszor@gmail.com> <20250129124741.4115324-2-zboszor@gmail.com>
In-Reply-To: <20250129124741.4115324-2-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 14:05:12 +0100
X-Gm-Features: AWEUYZmNoQYmYzdHns6QKiavPTrO7WWFfToNC3O72IkR30aE7NumKVKJy3QL4Dc
Message-ID: <CANNYZj-123Mqr8zyCjmtqyE6BYD2R=wVRy+5NMACu18KAdidSQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] oeqa/selftest/cases/signing.py: Re-enable self-test
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 13:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210382

On Wed, 29 Jan 2025 at 13:47, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:

> +        feature +=3D 'PACKAGECONFIG:append:pn-rpm-native =3D " sequoia"\=
n'
> +        feature +=3D 'PACKAGECONFIG:append:pn-rpm =3D " sequoia"\n'

This and the other patch are now fine, and can go into testing. But:

- bonus points for updating the signing section in
yocto-docs/dev-manual/packages.rst to mention the above
- extra bonus points for updating the 5.2 migration guide in the same
repo under documentation/migration-guides/.

Alex

