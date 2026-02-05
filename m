Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BCAE9129A
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 15:10:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22872.1770304241875532982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 07:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eqxLAMnF;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so10589425e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 07:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770304240; x=1770909040; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvF+fW9cTkT5is6Xt8nasHzY6JJi8vXjO3Oyfr94w0M=;
        b=eqxLAMnFAVH7HKQlko6CUFn6W6OBzMnuehSdeNH12/QABrCtaStpLntOyJ/pNq8c4+
         pV29wk/2PzkoZ5xcygQZgztkyqnyaoptMULc7e6CUnuPUhfxEfZ3luENqatmg7tToQ4l
         C8uVDjGjpVsYue+DMMG+vEZfzEt4JxSdpD65U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770304240; x=1770909040;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvF+fW9cTkT5is6Xt8nasHzY6JJi8vXjO3Oyfr94w0M=;
        b=nPVxgOONHLIupaEsROA6D9Tj+BBS7Jv+sLjRnpIrZo5l/k1geW922auKlGsjReZRPT
         QXmRQvIRMvtnezddFFL900i2Bc3W3mVyC/TdbMe+GMZS/cFjBobvkIxBHX5vlOkWYycw
         WoOupTKlKSlXFZ02aAymuKC7hjJV2thz2L7XkSt1o7Ua0jioP0wx3uSmDUFnW8NiinQU
         Atrac0FtayTnWJn0JWcyhbHy0QOGIJLPBB5+UuiepydMpWq2mnD2H5qqN96IaaWUvCh/
         z2NCAf+Cni3jK7lejo4xYGCR91NoEKddKT71tNvrlWCVHSTBLOZbQVUO3CAE2090x1v7
         rtmA==
X-Forwarded-Encrypted: i=1; AJvYcCUBp7Tc46iutsURHUMl63QoCSeTFcWbFiTsGhSZF0cGRXhnJL6U9x9NtUVhzZk2kQjs8ZFkQzUWxwOANjyOsQMy5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLd/9rFw4g4Mjz8iNrx8AySQeZWVXe7C2r7KeiJ9S5LWoxaWXX
	yN0MaU4DzGfWzxuX60dJ2B/1lzL+ZpnyLMQlEwT+thPG21i4mxelvGiusgLPSXAF34Q=
X-Gm-Gg: AZuq6aLoM3VQ45nQ26evl4+k3HCa/LwiOMWKXyfOCtpKE94slh+h0xxSHHf8WWUjhEP
	UFoIx3S/pfweo7SkQGOIzTUBW9r4XH/rvuBjyIPFZyTg/rCB/YP6mg5wUOQ4/Y8n0dTwrnU5Q2P
	PUuAs36fPImrN4+RQZZcRt5n/yYX6RJ6N9PKEk19QLhKHdQ6f/4FoYpx97A2VQk3iXem6nrE+jS
	q13PmYmfy1mhKmey+vVv9723ShPwAjf1kbvL40YcZWbzhwoE93QwVNIABfgb2fTfsa5OHi9gzYA
	fu5IXrf3uO+nws00AG3WoUC8eW6qJognbNVwV+nRa3vzCLxknsakyWiy2faJSQ6+eEtqiS0DYqh
	w42H4vKcYkCAPANctZrj/uspFoQmjElLZ99SAMgnRrBQ6W5ktopZSkt5g6PnXPxTRmArPN5An9o
	5dKxmF6RltjeE0IdEFs7K4lfl0O+vr3NFZPzZRwtqsm4b6usrWikAxSW7S7YdC8z7Sa+UPpxwJM
	nLit6itQatLzQ==
X-Received: by 2002:a05:600c:4708:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-483179d0583mr46576645e9.15.1770304240276;
        Thu, 05 Feb 2026 07:10:40 -0800 (PST)
Received: from localhost (2a01cb001331aa008fabb4f40b3eded6.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8fab:b4f4:b3e:ded6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d4a6b1sm64958015e9.11.2026.02.05.07.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 07:10:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 16:10:39 +0100
Message-Id: <DG74H88QW53S.32HY2RYC20ZF5@smile.fr>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 2/3] ffmpeg: ignore CVE-2025-25469
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260202040805.596021-1-ankur.tyagi85@gmail.com>
 <20260202040805.596021-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260202040805.596021-2-ankur.tyagi85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 15:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230581

On Mon Feb 2, 2026 at 5:08 AM CET, Ankur Tyagi via lists.openembedded.org w=
rote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details https://nvd.nist.gov/vuln/detail/CVE-2025-25469
>
> This vulnerability exists in IAMF (Immersive Audio Model and Formats demu=
xer)
> which was introduced in version 7.0 [1]
>
> $ git tag --contains 4ee05182b7cccfa6928dcb0a45c2b50b7d9ea39b
> n7.0
> n7.0.1
> n7.0.2
> n7.0.3
> n7.1
> n7.1-dev
> n7.1.1
> n7.1.2
> n7.1.3
> n7.2-dev
> n8.0
> n8.0.1
> n8.1-dev
>
> [1] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/4ee05182b7cccfa6928dc=
b0a45c2b50b7d9ea39b
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 ++
>  1 file changed, 2 insertions(+)

Hello,=20

Thank you for the patch, I reviewed it and I'm OK with it.

Can I ask you to contact NVD to try to get the CPE fixed?

Thanks in advance,

Regards,
--=20
Yoann Congal
Smile ECS


