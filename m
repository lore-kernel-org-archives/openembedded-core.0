Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4149FC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 13:05:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38994.1789131922966496964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 06:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=t0Ckad57;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso8171395e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789131921; x=1789736721; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvzUZqFK+G74s2v765JWTg3xK7tOEdvcwi7umIehp1c=;
        b=t0Ckad57XKc08pQjiQQ3x/RDnsXrV2dIAFbjTHvjzQZBXwJhIOjOImE8pzD/VcHWrq
         IrbkHWxwrqOb3VP+zBSEfupl5vKiP4v/JPDTY5wrOuyfKcPZ2tWjFHmuZUH3ycvOmCdP
         EGVRuft3Vts4nJM8XCztgbaHz33cLmSWfGRQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131921; x=1789736721;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvzUZqFK+G74s2v765JWTg3xK7tOEdvcwi7umIehp1c=;
        b=HF3AQHY3jKLSYu9W6PC8agOsyS+ZZhV1I2WbppjoNLFhVpE06IaDqRZHR1KtdRG4R/
         gpmWjnsWpp5nwXXyo463tL4CPMxA71P1EI8lK3JzOKEJz75P6jZ4sq0Y2nY4PWhKtwwD
         DTmLkLLlH1LNaM0ZR9XaaFuj/JfGcK5GrmwNsvACWBWure2JpW9aYYOhIP+fsQYDx/pw
         r/Fnd2Wn9tK07sk2kjRjQlsvuVlK7jfrqt3XDKCJ+q0rPQ4lVYnyvLhO2zwSW6y1j5N1
         oFnuOsXcngBNnBFNZMuZ+2J4Ar3Gxk5oS0nYZgsTLZnKmpS+OPxsmSCcMJaNbkYnA2MZ
         HShg==
X-Forwarded-Encrypted: i=1; AKwUvByK643g7LPk33dZCAovcvO2+B5dcZQMunuNfy4C/SPZJAfplvULXqLkoljf4eFF59/hlCU0Q2llw5noUhh3qNAfeA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lLlpDlvygQ0grgtUVFNn3Hw3QwQ4vhKrR7rUalkrB1m9BsS7Mk
	0hqv37OK0fXgnasnSTOzyt2JL0RpAWGXOI61hG8q3WyVkAYoOo8v/F0D1ybznNfTIL0=
X-Gm-Gg: AYBFou3TcX52BH+y1K9LAmdqKaGLRhQWj2H2wgQkeOBAbFD2CWLQRrLvJmp0XKhLDQj
	mXzVghY9cH9Ys7w0sEJm+xTX7DWD6A7jdK06gfLCltzcsSx8/e2UjvGWbeS05XnDgnWLe7LNZOo
	D9cTx6txd8bxmHSpyU0txuFjc+YE+A+FNj9irj4o9pzpDMlF7HlSA1rlMItOv8C/orny9G8p8MY
	ijmI/VKsraBEY3RyhDqNIg5AcCTdO9oIM2Xuo7kK5salWEyj1iy1VSmO5iIr2l0lx9weLehlRKe
	C+TzRl4oo1BBEi8kd3SnjFQzNem8x8IJr/fLz2+7sQc7l6NUd6o04Lt53Ml/e5sptJQXLh+fkwa
	Jjd/Uw3DZmQHIVCJHzrvIU2fmVBpRdrkKPyw9rQAgYVrQRYieZCvCZ62lQbRDhmge/D9vn8SgnB
	8m7RDRrY6bIas+qRv1vuYUg9VDO29ETBORo0Dfo5zHCA5zCKJkfK87AXHS4rIp26czfBo28QZBY
	QSrY3IhA20IPiWBfg4YOtfyv7ezb4Un1EeAlnZbXqgscfxH8+eJKKyXnZv7udk=
X-Received: by 2002:a05:600c:8a1b:20b0:49d:17d8:abec with SMTP id 5b1f17b1804b1-49e619c1912mr35871975e9.21.1789131920925;
        Fri, 11 Sep 2026 06:05:20 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm164094185e9.5.2026.09.11.06.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:05:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 15:05:19 +0200
Message-Id: <DLCIC1493YTD.2KR894JSU7SKE@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] libxml2: Security Fix for
 CVE-2026-86137
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910200329.842463-1-sdoshi@mvista.com>
In-Reply-To: <20260910200329.842463-1-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 13:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245643

On Thu Sep 10, 2026 at 10:03 PM CEST, Siddharth Doshi via lists.openembedde=
d.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> References:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-86137
> [2] https://security-tracker.debian.org/tracker/CVE-2026-86137
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../libxml/libxml2/CVE-2026-86137.patch       | 48 +++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch

Hello,

As far as I know, this CVE also affect wrynose. Can you send a patch
there so I can accept this here?

Thanks!
--=20
Yoann Congal
Smile ECS


