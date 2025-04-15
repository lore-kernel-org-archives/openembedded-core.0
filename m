Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F844C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 10:48:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.16825.1744714092566852073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 03:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b/BHvCNi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3442625f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744714090; x=1745318890; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dn0jxVhzjC2XhtXnO+Zs+LWFLLl+IfRRuLardGGztM0=;
        b=b/BHvCNi6jLygwNIyt/l0bpXHzr0y03LwMlyAj8eYMrZiJTobJfzi1PCNKAIy+hmfW
         VP/P+R5ZsPVY/lwu3OItnenLO1VU54K9260NkAGof/bm9W8Aa1Ig1Nlq2itZiUqMB8re
         DZ2D38F7py8o0p6xUOKIRu5Vpz5lJG7G86tRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714090; x=1745318890;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dn0jxVhzjC2XhtXnO+Zs+LWFLLl+IfRRuLardGGztM0=;
        b=YkqsTjpSgvkfEsFnonOh98s49L+Zid57KBqFK3IIAhVBH9rfyZQBoJ0kWYrhIJzHL1
         y6VoIADFZ30sG/r91W9m0D8iZGVV9O/ZVQMNhf9skqn8IkuwFUzd8lxC1pAp1lvZ8kYU
         qX5Soewz3L4dClzxl01IHoZQmc3eSVNRjlapX0NyMhrOi/+m6S4EfC/Gdd44khlE9Faw
         DCM50C6bsk046Da/lJsTSQHef1fv+PBPsZxUFIki9WW3et0sh3l88mlhlAvFYelOl5Q3
         6B86maezBNWzs8zRzsVNrTD91/xwt3CDvbfRwPLH9MzWuhUh1Y2ZMXLxvSBQQmUj4Rxm
         ijXg==
X-Forwarded-Encrypted: i=1; AJvYcCWNIUTr32nUGrywUWDVbNYE3r45/B10iULD2hiknWSt91a19mHtcgKr33rB4en+kgTkOHRL3eble/FB75fPU3Mrdw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzx0R2bIDyFTBXisqnjKLNVsqVm3bMA4G04skJ6vIZ09VelRGmn
	qS6C3kSFdQSvftR5+C8Qgavb+MB2wrmCk7WCKooXyehLMSbMbwouAm3ng7z8Qxk=
X-Gm-Gg: ASbGncvhh2gl1PxAx2RW7Whx9We+yLrkcmkGrst8vkwHvX+mRkxD8PbXeuYUFfnffFd
	iCqwsbqrsuocHmXCMktQHwHZP6LsJyT76gdsDqtwNwxzKwE7Bkap4hWwdYprFb7qPvUmDjzw1/D
	npU19pdKnuuVAf8oRWRTM8gp023tQXtmaWIoxVJ+wFB4D+Nh5RID9x4pgl7gNnmM1QiykelNkNG
	QR5ZrgI0r9lPT8Cysowmp1UsgW72dxq/1w4xUIo/v2T2gDI9WFM/IedN/dSs9BEnkpWOQECjvTb
	2DXVLbp+2qmd4C3d1i1kmpBTKWXDUMUQb/Px4cujENcI+56SGGCNuVsl5qcgLOKsL/IyclXdKNi
	X0tnawFISfQWUWvr4QNtC7Clp9tQzSQ==
X-Google-Smtp-Source: AGHT+IGqu4kHkJgqiDBvrj9jKS6fOWmTB/puYaFMvrdrh5JYk3XYyK0HUAtQ/N0QVqoFSEUkko8Qgw==
X-Received: by 2002:a5d:5f48:0:b0:391:304f:34e7 with SMTP id ffacd0b85a97d-39eaaec7aedmr12896295f8f.44.1744714090624;
        Tue, 15 Apr 2025 03:48:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:73a0:bdd7:c04d:8321? ([2001:8b0:aba:5f3c:73a0:bdd7:c04d:8321])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20626c19sm212323445e9.15.2025.04.15.03.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:48:09 -0700 (PDT)
Message-ID: <d375570faca49f301b13213dabd508547a0664c4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 6/6] oeqa/sdk/meson: Skip test when SDK
 arch != build machine arch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tom.hochstein@oss.nxp.com, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Tue, 15 Apr 2025 11:48:09 +0100
In-Reply-To: <20250411172803.3706607-6-tom.hochstein@oss.nxp.com>
References: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
	 <20250411172803.3706607-6-tom.hochstein@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 10:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214838

On Fri, 2025-04-11 at 12:28 -0500, Tom Hochstein via lists.openembedded.org=
 wrote:
> The SDK Meson test fails when the SDK is not for the build machine:
> ```
> Traceback (most recent call last):
> =C2=A0=C2=A0 File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeq=
a/sdk/cases/meson.py", line 47, in test_epoxy
> =C2=A0=C2=A0=C2=A0=C2=A0 self.assertNotEqual(data["build"]["c"]["exelist"=
], data["host"]["c"]["exelist"])
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~~=
~~~~~~~~~~~^^^^^
> KeyError: 'c'
> ```
>=20
> Skip the test in this case.
>=20
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
> =C2=A0meta/lib/oeqa/sdk/cases/meson.py | 5 +++++
> =C2=A01 file changed, 5 insertions(+)

I think this may not be quite right as I saw:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/1370

in my build with this series applied.

Cheers,

Richard

