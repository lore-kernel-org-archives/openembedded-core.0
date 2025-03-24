Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466C9C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 22:24:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.53020.1742855042357305143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 15:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ADK9kCBZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso32879395e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 15:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742855040; x=1743459840; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHNP3RCF4Dh5BkTszugmH3TQtbM3ESJ/xN1qT0Jhe1o=;
        b=ADK9kCBZpEEomIURoALRt5FNlJqbi/yl63/Kj1eGsnd+cufiPmY9r5Sa8/Lozhxm2C
         +ITowdAM4hxFvO5puPamYzSos3g4sFJ9K9z8JfZjbNNh2S1sZdRjr1w35Y4Qe7XfX53P
         UnAs3kGQb/LTTzwsLQHVFkniU2gYLUAR8Cquo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742855040; x=1743459840;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IHNP3RCF4Dh5BkTszugmH3TQtbM3ESJ/xN1qT0Jhe1o=;
        b=M/6s8bo865PP1QkNcfg4ViI/UU9qqqRQHfwqL4E8vGrBTyvEwFaF4EUOEeWKlpveg8
         mpQqg3QW+iHBCRY5Gu+oT2eWp/YQF8FOFnphBARqBC2Vqdp+rVGt/2RmIOL5ie4bmt9X
         vKUqGeVbvrCyI+IhfJ/CINdeUJ2WrO8Io8NT1DDj9VVuFbA0KUSBH1LrR2HoYtj/Hryp
         GRY+Mrb1/ZPTR8QWIapBd1lJvhw+pQ5jdLlL/8C41MUqpi+ct2mO3Rh5dsJTL9G8p1QT
         vwmlB4qqcre2czINCwU6O1INekzPZ+FCsjg5nnK0jLF3510Kw0hD0A1wA2MMYX+Qx1gW
         FP2w==
X-Forwarded-Encrypted: i=1; AJvYcCWXML/cnQKsHOji6Bgh1U/kz2C5HeCTlKqxBOrw7lhSzQRLjPjUAwA0eGFh1GMbQp0NC8hFW2b0tt85b+G60Z7yVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLCwC5PCK83Tlpu2ybvSHB58w1qFajFBu+sADCSd4hM3Lq6R7F
	lTBlGQ3jPXdIJK/Zh+uPA0PkhqmSaOalTp8dMBvDIeVaGpPJ5kxwIMVh/3p1cSQ=
X-Gm-Gg: ASbGncs9LcNQKVc3uvfOoJTZd1zPzFYhqAJ9gmWoKSRAgfGNmTO6BEEzW6Q0DRAy7TM
	I+D6fUnDjbdmrbqd/9ePud2au9cDz4N/04cIOk8jMIgn8UJXJ1iJ+/+s3eSymf/LM669ZNzs2mU
	NQQySdnnnJsPYqWrIyzoIfiK3ZPXxn/FaePqYzIcFNlma38IchfaMGaq+BqM02vOTyD3UN5vae4
	4uL87Y42yEfM0n62jtM5Nv13FY0Bnb+d7EuBZPvu/8MuMpopLfB69bXfvBn6XthOxFhg0vx0gv3
	6IcUFflwsMVaK2D+vKB8q0TUPSP6xYuE4bHguCshQwmkq/3Fh8oHsUXOUpSaYS4H1qFJoHl9jRp
	pwNAKdbq/l7lm3ZWgg1aZkSnNqinHfvHamg==
X-Google-Smtp-Source: AGHT+IECMFC86nw8NyZRE0eeN+QWLCCdWJPMzMpyyr2Tkp4KvfBhFvK6EMflKx4PhSXiLb/S5dCesg==
X-Received: by 2002:a05:600c:3109:b0:43b:cf12:2ca5 with SMTP id 5b1f17b1804b1-43d509efa3bmr127636255e9.8.1742855040425;
        Mon, 24 Mar 2025 15:24:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a60f:7d04:efa2:677a? ([2001:8b0:aba:5f3c:a60f:7d04:efa2:677a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fcea6ecsm133975245e9.5.2025.03.24.15.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 15:23:59 -0700 (PDT)
Message-ID: <dc2ad3405aaa9383b657dff6dbb731074575da91.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 21/21] vulkan-samples: Fix build with GCC-15
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 24 Mar 2025 22:23:58 +0000
In-Reply-To: <20250324-b4-musl-gcc15-v1-21-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
	 <20250324-b4-musl-gcc15-v1-21-ca68c03c5b01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 22:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213583

On Mon, 2025-03-24 at 09:33 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> Include cstdint for uint32_t definition
> Update to tip if trunk as it helps with GCC-15 fixes
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0...-SpvBuilder.h-add-missing-cstdint-include.patch | 28 +++++++++++=
+++++++++++
> =C2=A0.../0001-framework-Include-stdint.h.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 26 ++++++++++++++++++++
> =C2=A0meta/recipes-graphics/vulkan/vulkan-samples_git.bb |=C2=A0 6 ++++-
> =C2=A03 files changed, 59 insertions(+), 1 deletion(-)

This seems to break one of the oe-selftests:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1166/ste=
ps/14/logs/stdio

oe-selftest -r devtool.DevtoolUpdateTests.test_devtool_git_submodules

Cheers,

Richard

