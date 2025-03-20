Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6DCC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 17:07:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.274.1742490414606152467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 10:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TUYMjsTe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso8296295e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 10:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742490413; x=1743095213; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1zX4Ao4dgRvOnADAaTsNc2utUgllGOsTjO4/BjhE5g8=;
        b=TUYMjsTedyW4tkib9kMnheqhssTOD0snz/RVwGk7Eyki5yNP7FqMPYCpKTI88ZyY/P
         2AfhNl9c/W82LyAf8p/G2ARiHy8a7RaRbMVZL4KYHUpYROqj2D27kWKvi64KkVwjdMjG
         VkQrg5Ynf0dfHSxQb2KGd9EHrnrx/W0rNX93o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742490413; x=1743095213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zX4Ao4dgRvOnADAaTsNc2utUgllGOsTjO4/BjhE5g8=;
        b=NZe7QETVvngqEMNr2Im0Tamy64PnwE+V1v33beCN9xlfDE8LfKyKzT1AzX7wV9Z1eK
         rdm3h+2d4+qNlVgldyKpXBaZEDIoV+ufUhfn4RGtN+GuWVF0t1OZtMiKu9IZ6nSWZbzG
         VjS2BjJLPdajKTqXoO4RCq0NA/zL5wuR68QxiDFD01TO9VIcCOw05/Eg8JpeZDNcMLBY
         npz0n0EwQEFipyDMa8hx+qV/ErlheHMoFzz7Z/67DjTE9/FWeAPW8QjYAsvzlVv6Mrlg
         WVhdM04UNwbuPDMZJrFbEwjdsJGEHZ6zu+/dL8+Q70lhh17xDb1tZF+F++hGGNKhkyvU
         /ogg==
X-Gm-Message-State: AOJu0YzR7d5uK0QDCMxlLYcZ98dCr4uYiSsROBGdQQQMytLoXtKqi8+V
	kedjb1cqEKGyhbliBGOdioIR37z+Y63AhtIMMPKHVIdVbhMgAmAebD1dvIVwgbY=
X-Gm-Gg: ASbGncsy6o3NXkoPLtH2s079VgdHjSzSjzPMAUiUKS8KmyLkJGZgOVCgP1QmsE7ckcP
	ZgQJmtexbj2wGTS4mttYUn1sUpJSjgvynwhjiAc1q1dMtNRpFRjB+DRh0tgIjBUD4mwuvEe7Vs0
	OPjSrAuh/aGuIBBRyLYORFMnwyt6s67I6N59L3Qo/ak2FnoCUmAdDkqfYLtrb8HjJ17kaeiClwn
	bvkZT18HsesFoFlHzppVnrA6b6n29acFqXOy1ye0EN0lODf2VK/6jIpIPRMfkN+HtNfKMfEbA8u
	AzgALBwRsMTaZ+/8WcFHnCUmLi1sX8o6eqDw/I+TLi71WZ/3vg/NX99CS41sMldr2MPppnoQIjO
	aBkDj8BHEtRrTQ3MbkDxfhbe2eGUI858BtQ==
X-Google-Smtp-Source: AGHT+IEt1wTXTv2YrOuom98oPM3yHyzcx+yP0Hc8N9Ec96TsuuPJ1BIlR1Q1PfyLUlZDY3iBRBrrRQ==
X-Received: by 2002:a05:600c:848f:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-43d43792a6dmr60937785e9.9.1742490412876;
        Thu, 20 Mar 2025 10:06:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ede9:63ed:996d:ca84? ([2001:8b0:aba:5f3c:ede9:63ed:996d:ca84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e674fsm109560f8f.80.2025.03.20.10.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:06:52 -0700 (PDT)
Message-ID: <96be4b2c2028b7443ed3d3477465d278aa90e34b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending
 PACKAGECONFIG_CONFARGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, Jean-Pierre Geslin	
 <jarsoper@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
  Bartosz Golaszewski	 <brgl@bgdev.pl>
Date: Thu, 20 Mar 2025 17:06:51 +0000
In-Reply-To: <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
References: <20250320165517.129442-1-martin.jansa@gmail.com>
	 <182E912DEB60EF95.20788@lists.openembedded.org>
	 <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 17:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213420

On Thu, 2025-03-20 at 17:59 +0100, Martin Jansa via lists.openembedded.org =
wrote:
> This 2nd one was supposed to be sent only as RFC, but I forgot to
> update subject sorry.
>=20
> And this version also has a typo "=3D ?=3D", will send v2 if we want to d=
o
> something like this (reverting the
> https://git.openembedded.org/openembedded-core/commit/?id=3D16745b20452de=
60ae2474433cc1a2fb1ed9f6a64
> is imho better as it doesn't respect the original author from
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.6=
0232-4-brgl@bgdev.pl/
> and with CARGO_BUILD_FLAGS_PACKAGECONFIG it's imho more confusing than
> useful as the default)

I have a strong preference for not carrying things like this. If there
are existing recipes that break, we should just fix them and move on
rather than letting the past dictate the future IMO.

I'm trying really hard to simplify things where we can.

Cheers,

Richard

