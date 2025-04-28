Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FC6C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 20:54:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.59752.1745873653416251229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 13:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SAmHAktC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so49744965e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745873652; x=1746478452; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nmEWac6UC2+kKMzog8mXksbpHMjPbLVySPp2yi/KaaA=;
        b=SAmHAktCqphBgMJop5FyXG4UarZQjZP9sHrvp2IRQs2CQB5+AHPq84tijCajbUUhB2
         EO9+F8TMXrzwYIS86BBBAaWaCE4b6askZ8JBGp98p81YI9x1/Dmo6WdjJpvRtvHLbI/d
         Qb0KxWH2HZ4CZaiAypQuAnJPS3g6ezI54OQpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873652; x=1746478452;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmEWac6UC2+kKMzog8mXksbpHMjPbLVySPp2yi/KaaA=;
        b=Rkuwp/o3CoP0zWSP4ZAFLhvbI/LYIpEcaAKpBt8a4J3yQJpJN5Rabyco8ZBWYPnVWS
         KllTgDJspEb3ak959MNsrl61jMkzKCwieBpB0a3F/FR8y1aAKiKeg2z+g2oftTUdtXFs
         SPszclMZ1n0MCyGiPJkPfjf/kEj/t2K9/sVmXgaEd9SzyR2FcPKMCZYDEYdig7ZP8YKC
         cIP+CcnOh0S1MkvA+cs4qygow5k3H3W43yLbsQ7f0Rl5dyY61nrhusjskPawbwuqOyNw
         Tfp9hVIT9AtOPHsYZGZ2GO0M3po6bPovFFIextFpTSkA13qAHckEPpekVGym8zGipPqp
         mMkA==
X-Forwarded-Encrypted: i=1; AJvYcCXWdVcObxb3J/T6ww/dH/vyGKPMZTEl+ptXnxUlnWj8Z/5GQcvbAWi92jJIWPfgCyBXRYu1F07aw/wQDTlDsK3yaw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMUFSJGujTg1OS4l1X5yA+Wvzq5Tr6IywasZlyao9jgD8/t0ds
	aYsSdTnwrsFGclA37xzPHJoMioSjx6n6PrtN2TDf5F40baoZrv6cZWcaZB7tO7g=
X-Gm-Gg: ASbGncvLW6CwTNWYfv62e0eL6DLlLiAgkGhLSU9jc44UG6p9p2veRObqnrwSq0zOU6F
	3u7fx5D9jq93nTB2AXjVyjGy9P9p1C0MgRBQVmVp4p/2omcrWOn1x8sgXWLF0ZWQwd5vCpgF84q
	kCR3Z8sKmMBdShFySq22E8TEMGJ+/EkYCx5Flpdx1mlSQq4WLY7LFCWwttqBBpqteahn87XUigh
	uWfla9s0c4lehhdqqEHAQ9FaajdWs60UeUq+JqzBu4PJTczkOnkmSP045bA4M7/oE5qoAJ2fS9j
	5w0CwvgCjsD9UN5382iM/gN7ITJQddWSqju/8zsXhndZuSDUBt6BG3HFyfXtc+PsRZ3nwe9Wzjf
	/Tkh81B8nUSV3BQK/sMgMsQbKmQC3XM4phPQ8G37e
X-Google-Smtp-Source: AGHT+IGWIPskddTZ80PRiRyyHoDoR9GgkvFN6xcRcpzCt3mvIuNe2EgsfbnBAVoHi8QzOaLNKpSoIw==
X-Received: by 2002:a05:600c:a42:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-441ac84c11cmr6018235e9.2.1745873651814;
        Mon, 28 Apr 2025 13:54:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1fc1:a08d:2291:3439? ([2001:8b0:aba:5f3c:1fc1:a08d:2291:3439])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530a6e9sm134714205e9.16.2025.04.28.13.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:54:11 -0700 (PDT)
Message-ID: <aa23d298b8b9f09372b417efa00547e4a42d432f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] gcc: Upgrade GCC to 15 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, "Mittal, Anuj"
	 <anuj.mittal@intel.com>, Joshua Watt <JPEWhacker@gmail.com>
Date: Mon, 28 Apr 2025 21:54:09 +0100
In-Reply-To: <20250426233051.4169011-1-raj.khem@gmail.com>
References: <20250426233051.4169011-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 20:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215633

On Sat, 2025-04-26 at 16:30 -0700, Khem Raj via lists.openembedded.org
wrote:
> * Nios2 has been removed and aarch64/ilp32 is deprecated
> * Default C dialect is switched to C23
> * {0} initializer in C or C++ for unions no longer guarantees
> clearing of the whole union
> * Compile speed improvements with LTO
> * Vectorizer can support loops with early exists but it is limited to
> loops
> =C2=A0 with fixed vector lengths
>=20
> This is major release of gcc, the changes are noted [1]
>=20
> [1] https://gcc.gnu.org/gcc-15/changes.html
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Drop musl headers ordering patch
> v3: Rebased patches

We're getting much closer. My selftest-ed change nearly worked, I'll
try a new version of that. If that works, we have left:

util-linux ptest regression:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1396
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1393

meta-mingw failure in libiconv:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1521

meta-intel failure in intel-mediasdk and intel-media-driver:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/1389

meta-virtualization in ipxe:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1402

(copying layer maintainers)

Cheers,

Richard

