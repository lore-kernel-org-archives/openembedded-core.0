Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A2BC02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 15:36:23 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.10833.1739028977901340986
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 07:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bP/EtZkb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43618283d48so20873405e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 07:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739028976; x=1739633776; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKeH4ZuFVT3jWNwjnZalV6Z6PXsKHbyRGr7pjX6l09s=;
        b=bP/EtZkbh4oOh91QI6/g1YtlqOF3SM/sfpCwwkR6GTrHbphgBmF88r0QYLXVxoDi3Q
         Z5ov/MlPoJAnU+54WxuhiaPuxUUVtgFkj084tFrMVezIM8HEbmB2PNlg6pz9W8PmFV+r
         AlHAYH8oadtRgHeRCcaK6yJS/EY4IBiWB6IQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739028976; x=1739633776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKeH4ZuFVT3jWNwjnZalV6Z6PXsKHbyRGr7pjX6l09s=;
        b=ZffNpnzSpg36+w+vwxK27Ah91+PCqB8tfvBWRJAH2/Y7jJma+Bin56IsH8oFLFtuPu
         6SP2A3UInM6atyZJNxDgRQsCgbGC0qUyLgT7RtNk+pZyg87r5nAkCgoeUYU6b1FG/9f3
         3AfxfmTTYLrRWtvXNp8h+/JwjvZNTk7/tGIvdUycb1ejrCaJqfN/bipgNZlZKpqheuUe
         5yLcEghzUJZ98KLy8Dh8uPhYc+L2qq8oRp7d59h06TDleT9g/eA5OA12xkZ1bNr//vOd
         qeXv1/A5OWECOcUd7q9riBAjpzJuQxU+RGoipNOsR15ymknTdUjMrn/n3qw+hzMzdHQz
         sx1w==
X-Forwarded-Encrypted: i=1; AJvYcCUXYFCSnOVf0GLINJ0tb+sKnQeKggPF9ZRQ7dzmhuXAAOoS/+KKzftRHHPxNPXbUy0ScNxFOU/yV3+TC3la2NNDSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3HWxE+2R+jJXZcN0zEyupXcZuDc6d9oe8dw1fJ5oz/Z8XpKq9
	61Rj2I0NfIkm7iigvb6IKFTsxX6AGXzcDAi9LWgquD+bBTTDwbXQRuO/rJHTP9A=
X-Gm-Gg: ASbGncuK4P4Jh5//PJdwJTPCUi+QmkRyhYJrC9itwE8CIaE1T9LH7y/AY8BGqcEQD90
	6Zy/AcVsMtBQhC/tdCZwpFvNVWH1kqTi+rRfp6KgMBg4yfAbzyVLo8KKSpwBPX4/MSR4jW7z3/h
	jOn2qDS6JBVEM81BGR4xvrOEj1JRvBi0FCQKDeP6pThxagmxrX8aoFlTK3vmpkOKO5pjJ8Q8A/o
	bCzsjdoTtlc5xVRAsBB3FKbwinuSNdGYokJtKVwWmS4SHTlhFIWXmSP14mQvcIWkgayk9l2vVLq
	YlCZdu0+uxBLQ6QG6Thn10tou1ZF00/T4nQuP05l1xRlv3dDLEUISlo4CHm2fAaGl2xOTMznxDE
	YVt9D
X-Google-Smtp-Source: AGHT+IGH1ltM/nl5G4E8tLpg0ZCebUR16N6UYqEbZG9B9TUWdSNo5GXUxnL1qFkelA05el+UdBKQJg==
X-Received: by 2002:a05:600c:3b20:b0:434:a529:3b87 with SMTP id 5b1f17b1804b1-439249888aamr64268195e9.10.1739028976168;
        Sat, 08 Feb 2025 07:36:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1b4e:9b51:38ac:64cf? ([2001:8b0:aba:5f3c:1b4e:9b51:38ac:64cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439377ba9c6sm13720615e9.36.2025.02.08.07.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 07:36:15 -0800 (PST)
Message-ID: <4db452ef063ab2db30bb5ca91b14b9d89b21a972.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] curl: upgrade 8.11.1 -> 8.12.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 08 Feb 2025 15:36:13 +0000
In-Reply-To: <AS1PR10MB569700A2E673C96A248A212EFDF02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250207202537.2137371-1-peter.marko@siemens.com>
	 <56d49621808fc61f0dec8c739d6870cb00083f19.camel@linuxfoundation.org>
	 <AS1PR10MB569700A2E673C96A248A212EFDF02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 15:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211039

On Sat, 2025-02-08 at 14:46 +0000, Marko, Peter wrote:
> OK, I'll check this.
> Again something new to learn - mingw...

Add meta-mingw, set SDKMACHINE =3D "i686-mingw32" and bitbake nativesdk-
curl. Hopefully it is something simple...

Cheers,

Richard

