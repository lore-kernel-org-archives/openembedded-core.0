Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C546EC02190
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 06:33:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.59844.1738477987317018686
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 22:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R1RDdHUw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso2987762f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 22:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738477986; x=1739082786; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZEaqLZ7fEl6/wU6oT0mQdkXthKEabcElkwrCVzYHRp4=;
        b=R1RDdHUwpOQp7uAm26ZzNPArjJD3Iq4c/PSZlf7sUtu92yge2aC5HVSn7S1Kh1ONjh
         6lt3x3b/8UlWYXQ5WrlzHxgy7GEmMFsXVPKn3rg+IMT24BpwE+wamGceNj3BvvmwdiKU
         O+772EusB86SNdHLFiCgp/KH9MVF9jQWMSuPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738477986; x=1739082786;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEaqLZ7fEl6/wU6oT0mQdkXthKEabcElkwrCVzYHRp4=;
        b=VyokI8pu9IPOgcawo16hMgOb1ura4J9Ux+/p+rIc+BwSQpvpjGajPb3KDTVDRJ7gqn
         fwOuEXX0H3Nnmfwwg3tUG+y1zDPFzppy3yEQ98UYlZdUFqyAujRBRcXSLZouNrCr9eHd
         B4y8yUR8PuJWuLiOz0LpUeHTr90qCJcEGtMZPnuX4KVtzURCpKVvSzMA8+oIXwkJh25F
         rfBP1wdWygVSdRv2ZgOtGeAxSc/s8Icg16A3OyAYI4f4qX2dqWgF0ltVfezEDddnxQLO
         AW1TrBVMgLvOLDd4zMgm6TIC5UJEFJvbMobA+nCi+5t62jo5rs3d29fWXaHxGTyaQwX/
         toPw==
X-Forwarded-Encrypted: i=1; AJvYcCX+O3uK8oINqIJT1+N7xcsDlAr8XlGWD2ZhLCUreLJsDrxlsaSVKJ1Bnz2oz4j+CuxJtLbj1Fyu6BSDhK6wrEDIQA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzqJqJMaSQGvja3+/uCbker863n57JZ6/RnqGu3YEuny5XHkaU
	4gHX7eyxCwX05RL6UnQxL4+nh1y6e3hT+iBr9x99yLuisp4bZ3xij5q6Vtx/bWs=
X-Gm-Gg: ASbGncvvK5r0Af2MX19tiICGtZ2COrWRNI7Hw+bHkkiyILbO39mN2+Wx9MTY+GzbT0j
	0xXlhl7QJjNSHfsfNL0hk2Urq8Uw5IwWcz0wLj8gYB6hW+tpIQ+JqcIY/vb+//FiGunGZ/GL1N8
	AKzFGVxxcElbbxIMupQIyNcjR5NMRgrPAL0JYi8kOc8DZsfkZnB8NsTJP2bxumAZE82Riw4eXt/
	J5OQYbs2XY1wk2vf15luRSAwna4NPjJEPHh7L42DYCDCBSYch6rC6BgP+FBl0aaTJb6wviJMg6/
	cWu+p8w9K9Toa0SYZpFf89D9LvFBDqXTrw6GmyqjnstbLFze5OCo5ZGd6BSawHWNKRqf/hgDV1s
	=
X-Google-Smtp-Source: AGHT+IGIHxsdH4pN1GZPVCs0E7QMY942sSTMsxadXbrP42nmZ5NdQNO2xH348ybMQU/wUKeBdvcc4g==
X-Received: by 2002:a05:6000:381:b0:386:43c9:3ac2 with SMTP id ffacd0b85a97d-38c51950f1emr16186339f8f.15.1738477985709;
        Sat, 01 Feb 2025 22:33:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9a:b7b9:6851:34be? ([2001:8b0:aba:5f3c:9a:b7b9:6851:34be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa3dsm9295880f8f.93.2025.02.01.22.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 22:33:03 -0800 (PST)
Message-ID: <166c73cfa10449a1163cefae2879ca881f3b42f9.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] ltp: Update to 20250130
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Tim Orling <tim.orling@konsulko.com>, Hui
 Min Mina Chou <minachou@andestech.com>
Date: Sun, 02 Feb 2025 06:33:02 +0000
In-Reply-To: <20250131225444.1144932-1-petr.vorel@gmail.com>
References: <20250131225444.1144932-1-petr.vorel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 06:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210614

Hi Petr,

Thanks for the patch.

On Fri, 2025-01-31 at 23:54 +0100, Petr Vorel wrote:
> Removed 0001-sched_attr-Do-not-define-for-glibc-2.41.patch
> (accepted upstream)
>=20
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi all,
>=20
> could please anybody test this patch? (I'm an LTP upstream developer
> with very little Yocto / openembedded knowledge).
>=20
> Would it be possible also to test if 0001-Add-__clear_cache-
> declaration-for-clang.patch
> is still needed? As Cyril noted at [1], it sounds like clang bug
> (__clear_cache() is a pre-defined function and as such the signature
> should be part of the compiler).
>=20
> @Tim any change your kirk recipe is merged upstream?
>=20
> Kind regards,
> Petr
>=20
> [1] https://lore.kernel.org/ltp/Zmg9WZ1TitB7D_RC@yuki/
> [2] https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/kirk

I ran it through our automated testing and whilst the main tests ran
ok, it failed on musl:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/932/steps=
/11/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/948/steps=
/11/logs/stdio

Cheers,

Richard




