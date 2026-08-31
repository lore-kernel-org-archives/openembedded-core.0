Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D05C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:32:28 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25830.1788168743174867659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qqhWx+R8;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e067e908so2356714f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 02:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788168741; x=1788773541; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkXx3pGhD/uMZ19yKDHeyKPi8mRk1cDwXsvoNwnmpok=;
        b=qqhWx+R8aZnCEWfWG4L/39IlHU4sUqsrRA7qXDc1dQ26rVlqsMHCdk+SBeigMiaOvI
         hvqqYPS9j6p29IL/yuVhIYKk/4Kz2j09t0jVCXKiS8g4XoXlk7gDJfEcQZXImq2CibCp
         XbkBzgrF+g/SE0D8uxoAhLhGxZS9sn38nB9hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168741; x=1788773541;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkXx3pGhD/uMZ19yKDHeyKPi8mRk1cDwXsvoNwnmpok=;
        b=pxfJdkWn6my3+idIXXosDiDdunyDvI8oWnyrXSqOZ8u+7loDjPzGq7ZbMdQm2Qk2DQ
         IWjI02rSnSjOgEIIQVFehMh6f96vk7PKZRBBORNWYl6aO32rLzf1/VNN1OboyZX+eNKg
         k9rNZ32Al+ID/MN7eemjxbniP4/VKuxa/unhnsI/V6B2lfud+yLdPFlAAnfJtZsuBsNO
         s1uZprNA5dMFLCfNnvOn7Xdh+vfkRRy3V8d5pyD3vS4eg2Crp42IET8AK7cCRuijAugm
         D3ynki0GPdi/aal/03oYTyABJzkRcnDqJxUYMUxcISe0kAOfZiN6uyhuqvICZJGtq13o
         5A2A==
X-Forwarded-Encrypted: i=1; AKwUvBx//pk4Eu/nV/1wdpddZqmO5f54BH3OFYY/ICGAmML8Po1B+1NAnhpIYEyNEbu1C/zzLuNCnrTJNW4SqH3CD4FJnQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++k5kFg8tSHjt37mFtK0xmBcMwVQCYGDEnOMdg8k6Lb4YuCtMFvM
	M4v7qqr9iHfISNW5rvGzuNQ1DcR+acXe1D7DqlBIiro7odOs/IrExQkWR2g1yixra8I=
X-Gm-Gg: AYBFou1PAFwKdUo7qCuKv2rNeEn8P1hTAXyIF+Z3HLAy9TYclqNFHRMiY6y1PWQJmDf
	0y8tEKgLWlfBFFHJ3JICCgYB1ILt7SWj9N2NuSmFznqPZsVlRvTsfdmfu8LHUrLLah6pUqEhsX0
	oXGHL9njQpmRrwVKbTPtdjjACYH5EkLlh2IcZ4gROtHyQhmDLS9x5p4Kpy3DYIJhPV6MwR3RlOL
	UYMMfPYZIgvXFJSP6zu54jRh30B5K4B5niG5l/0Vo7g8GgscHgNls4mtuCSzymFVdzosZkYlcu2
	g1GcVyWfJduEJJ8FLj8phy6lT3YUpxwd6J2rjNaUft7IKEglXKk5xsNEjgvgBiDvIxHslW72FHy
	Esvx6azbsN29ZxLLoX70dLWi0RsaNNhZJsAp56dGfdpOTWacmxUbscZtnR8Ap9rJbJh+3aeoO+6
	FNMbETtVFj4bm2aFeg2jRnF4C7QtKAw9O8Q5BM8qov+ZNEARLtAhxDtCODd3L71bSQfMWjslQPf
	y102ZHw5z8R9d4jLKn4BSrjOKnkqbfFFh19wvaLxX2ELFc/
X-Received: by 2002:a05:6000:4708:b0:47f:ddc0:602a with SMTP id ffacd0b85a97d-482f79f3be1mr41077254f8f.18.1788168740987;
        Mon, 31 Aug 2026 02:32:20 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20737sm19153275f8f.22.2026.08.31.02.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:32:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 11:32:20 +0200
Message-Id: <DL30WYQW8BNQ.RF8FIZO0HEI7@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] python3-mako: Fix CVE-2026-41205
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260819111509.53180-1-hthakar@cisco.com>
 <DL30HXPDJQL3.3LPAQ8V1DUDRD@smile.fr>
 <2446669.1788168172489430367@lists.openembedded.org>
In-Reply-To: <2446669.1788168172489430367@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244759

On Mon Aug 31, 2026 at 11:22 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> On Mon, Aug 31, 2026 at 02:42 PM, Yoann Congal wrote:
>
>>=20
>> On Wed Aug 19, 2026 at 1:15 PM CEST, Hetvi Thakar -X (hthakar - E
>> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>=20
>>> From: Hetvi Thakar <hthakar@cisco.com>
>>>=20
>>> This patch applies the upstream fix as referenced in [2], using
>>> the commit shown in [1].
>>>=20
>>> The backport makes Template URI normalization strip all leading
>>> slashes, preventing a double-slash URI from bypassing the path
>>> traversal check while keeping Mako at version 1.3.2.
>>>=20
>>> [1] https://github.com/sqlalchemy/mako/commit/e05ac61989a7fb9dd7dcde6cf=
d72dc48328719a3
>>>=20
>>> [2] https://github.com/advisories/GHSA-v92g-xgxw-vvmm
>>>=20
>>> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>>> ---
>>> .../python/python3-mako/CVE-2026-41205.patch | 110 ++++++++++++++++++
>>> .../python/python3-mako_1.3.2.bb | 2 +
>>> 2 files changed, 112 insertions(+)
>>> create mode 100644
>>> meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch
>>=20
>> Hello,
>>=20
>> As fas as I can tell, a fix for this CVE is also needed on wrynose.
>>=20
>> I can't merge here until this is fixed there.
>>=20
>> Can you send a patch to fix this and then, ping back here?
>>=20
>> Thanks!
>> --
>> Yoann Congal
>> Smile ECS
>
> Hi,
>
> I have submitted a package upgrade for wrynose that addresses this
> CVE:
>
> https://lists.openembedded.org/g/openembedded-core/message/244285 ( https=
://lists.openembedded.org/g/openembedded-core/message/244285 )
>
> Could you please take a look and review it?
>
> Regards,
> Hetvi

Thanks for the quick answer.

I will review both but not in the current cycle.

Regards,
--=20
Yoann Congal
Smile ECS


