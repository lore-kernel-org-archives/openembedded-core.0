Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86403C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:40:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175912.1783435198902586620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xz/oJ0yz;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b77b150aso39014015e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783435197; x=1784039997; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5eMv961btD5+qA63gyGnD0csrSV2/Oy3VIX2k2A3K8g=;
        b=Xz/oJ0yzaDorZXZBvpsq6AxraIUJ83gWzsFIxWQ+BK/FYIoy/lNjjQo++4A9boiSK0
         O/e+4c1Y5J8smd5IxOAyY0lz0JSNPhf9f1TAz//y5kWqNQpVEikWQ1B/hPCv6JQDHy4z
         W2ctGM+byXskBN9qjHyNdHBMAklbp5+EyiIb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435197; x=1784039997;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eMv961btD5+qA63gyGnD0csrSV2/Oy3VIX2k2A3K8g=;
        b=B9fI0WHgQ21hDMN0dm2DwhjTpWUKyA7tiAewBV4I+cMJ8huAGqwEOcsgP4bmHjclZB
         LiJkynVcOTmQDoDcHhONXB4PJVarKqE0fmobWUQDeBMXWQL27NDigJ2Im1idtGPkNG7i
         iDBiLvWGTpx+mJLX4AyCxwE8FAkih0d7OiqszlRZZuZIpDcMcx3PNz7LhrJJD0qUqcZG
         GHp1rGuGgaV0sZDsqjSGMvi8UwmXP55fI+xwXm4+UYA6MF0Aovv6NXZdmdGBlpePcpjF
         IUpFPFgjBngoR25W7dsla/GZt33ZbwUHrAuXfc3uxr7Is0AujyVmwJpTxoqkZZITCXbS
         5V3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpqRw2Xqe7l9oQpdD7Xm7H7zZjtWGpTUvqM1v4xBDypqT02sKD5/AIEFrXHJeAI7cC7ihuanvRyqIwco25q1gNbNg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcGz4E9QGVitX24XgiBfT9mO6OfNnLG09WHKSVD2KhSAiRhnNM
	qR5kDTIcO+gap+nfNH9TBFcvEwkfFUZc0scVa9O0cto1hjasgZdWm6JlttopVgQIfCeL+FIoTuO
	U9tAHkLM=
X-Gm-Gg: AfdE7cksG11utAOlFX5KMYJhGDgPqy+i+avJfb3lX3Xy1Q3W7Pv+CY9Y3K1CIxqYX8k
	ptZwBAcEe+7KO3SYWOblvLLZHJYnPe46EArVDAY9amvpp1QpL4z24nG9vtvkiz9cgJWHuJUGC4l
	rIbBlw255zUemhg0nfVhcIU38f7VL2XvVLeKoFZJPAp8MpBDlsmvO2QMedB93Xkil7C0R4dzkm5
	tMqqgdsJ4s1EH1OgXGcs/Abhnq2IfG/faruReAydIL9ufhjz2QlZgylzp2nTtmA6XoXNYiPvXSN
	7ujDnQ//r7w2iLMU4IVnKIMwM1uRlviP8MdMxAs5Zdu0e4sFOIUgG5ZRtz47VQAhp688vAHBCgz
	l8n+8PuHklpzr/94/tkyFb6NIDJpbxab2IcM5i03Phl3+4ezfx3H+e5kYEhvKuvX/UbiKroIajM
	N6ELacfdp4U+kzdonZLNsbdGbwIaC3vqD5qhneJQ7ypf5MQVLrFCvax4zy2PwzjbiQltRgY/+0y
	IkvxCZ05q4=
X-Received: by 2002:a05:600c:4e8b:b0:493:b877:fbc with SMTP id 5b1f17b1804b1-493df080c50mr59721415e9.21.1783435196842;
        Tue, 07 Jul 2026 07:39:56 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fbb410sm63182065e9.12.2026.07.07.07.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 07:39:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 16:39:56 +0200
Message-Id: <DJSF0IKOYWX0.IQEKXHTTCXD3@smile.fr>
Cc: <kris.gavvala@windriver.com>
To: <Kris.Gavvala@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] python3: skiptest
 tracemalloc_track_race
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260703042107.2148608-1-kris.gavvala@windriver.com>
In-Reply-To: <20260703042107.2148608-1-kris.gavvala@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240395

On Fri Jul 3, 2026 at 6:21 AM CEST, Kris via lists.openembedded.org Gavvala=
 wrote:
> In python3 ptests, tracemalloc_track_race fails with a segfault.
> To avoid ptest failures for now, skip the test.
>
> Fixes [YOCTO #16182]
> Upstream Issue: https://github.com/python/cpython/issues/143143
>
> This patch contains the following additional changes to backport from
> master to scarthgap:
>
> - SKIPPED_TESTS is defined outside the sed expression for better clarity
>  ( see https://git.openembedded.org/openembedded-core/commit/?id=3Dd9a44e=
7390d7c8f2c2b73572825a6f8ceeb729ac )
>
> - class-target override is removed since ptests are only used in target b=
uilds
>  ( see https://git.openembedded.org/openembedded-core/commit/?id=3D8ba5db=
86ac364b85fa6c1ee36fa5a037c0ee818a )
>
> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 7504490ba5e6ce0317dd12bdb961542062f05830)
> ---

Hello,

I think it would make more sense with d9a44e7390 backported as a
separate commit and most likely 8ba5db86ac also.

Can you send a series with those backported individualy instead of
squashed together?

Thanks!

--=20
Yoann Congal
Smile ECS


