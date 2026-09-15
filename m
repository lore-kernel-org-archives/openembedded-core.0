Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E064AC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:24:05 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24319.1789482241963561763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s190XJ1P;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso2298229f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789482240; x=1790087040; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AA/9NCJxFpeQlmAx/DPKxgZ+Bj4Bhi5yO8k/ZanWPiY=;
        b=s190XJ1PuHWYNdKeU89nJAkRXq5Urxbsh1sp46FM+c6tE9HOftg4W/zNOx3EaerSbR
         0dmehYjKAH0x6MCo0jxklql4DUBNIEklPSISvXS0JfGzahRzugpFm8ZPZkauxa7dUtB+
         fkNTnAkT4IdUhb7VvkQl7HqdymtOOVVnnE/y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482240; x=1790087040;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AA/9NCJxFpeQlmAx/DPKxgZ+Bj4Bhi5yO8k/ZanWPiY=;
        b=Z6vfgOXmRa+B5g6AMQy7paRnTRr3iQldAOrAQTgd7c1CgZzHa3evmcKte4QEKeokmO
         PX3swgzO36YDbHE4Bg0XEipoKRGPeaHbrPyUuMfBM2AOBd+Z05wVFThPQdoish+gqIQc
         PAaB6x6KD7+O6nRy1gwldfTWmjZbEFcI7X1R8Zua78IG2xL9vadEwJU5WGqc4tgNnT9F
         oJk5GLZbdmspUmirOBVwcYHNvi6w7sAATKXOQF3YG7xG2lIVJTRPRsLn9Z2lNsdz1l9H
         TXLA3fbxr8nh6ARBb7Plwv5T6cGKAMkda0sxUTnWIh6vZlK3hTZoU5RkpU3DROGP6VTR
         F1nQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDoYhqRGR6jjIwS8tmvQ1DmCTPSn59PvOh+VmzWf3yqMxEUe1k3++meoc2CEqa3HDTBGaJEMoIDOQ5VFQU8ZYX2A==@lists.openembedded.org
X-Gm-Message-State: AFuF++nVgcNFm6xNUQHG/zyR9y4zvo5DLpuE75s2v0VYPT1hSxaXOWjP
	gGrgtMvPAa/ybvj1x+xo3NGOaxJ9GdQyYr5qTElCI7+pjGEv6eeLwJzde/1pMG4SNGdivQZWwHj
	kAl07KlQ=
X-Gm-Gg: AYBFou09KK5QwbqRWv3BJT73kaBzxbk2+khQIT4sB3AJG/Ymgl9E0CUNkYDhBt5toi0
	aykkgA1Rr9JH4R5wIWCMS/F0Q5YfrHb4pF/0FYuC5+D0DsVP/88QusITJdt3xMkW8QaY3rzMyCK
	OYbtEzvb0Wm/XqkD3Tbyq6WGemn5dY2iU0nAeZ+eOSvZy8b6eYOyOkaGFosWDWlZCcBtkMidV1Q
	3x8LY0fwA2FA4u/Lims1sj22de7sbCaXTN96FNs48PLoaP/imqM2l/5zDM9QghqThRbPlKSUpVb
	4AQHOH/mXJ1Mmpco36DI6k1SBktN8gP6jCGOh9rUQyOJn1Iao2C2IHIneoX/oM0RigaKbasNR6s
	EvxsvAeSpELxDersTDIUBTrlojjYBI3H0Pwd4tIufI5/AqiELuxCkZlh1jxIOZk+KrvGa69NCHi
	SLBTFSTagqXhvutUgtU4xy8A/mq2/l7vhgcd+KL0L7Mtvtx1861r8ZGxjOa7FKGtWZlQpW8RRTU
	gF5/sqHY9phdIsb9OWog0oKOIpjSTtBKLihHSwAGsU46sfbc32pDfNapNbYK9B75wfiog==
X-Received: by 2002:a05:600c:4f43:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-49e7a6704d3mr101619745e9.15.1789482239948;
        Tue, 15 Sep 2026 07:23:59 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef735cesm70024475e9.6.2026.09.15.07.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:23:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 16:23:59 +0200
Message-Id: <DLFYIFTG2IKP.NGNVCLRC36D0@smile.fr>
Subject: Re: [wrynose][oe-core][PATCH 03/10] ffmpeg: set CVE_STATUS for
 CVE-2026-64832
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <bhavesh.maheshwari@einfochips.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
 <20260910133357.452394-3-bhavesh.maheshwari@einfochips.com>
In-Reply-To: <20260910133357.452394-3-bhavesh.maheshwari@einfochips.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245849

On Thu Sep 10, 2026 at 3:31 PM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:
> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>
> Analysis:
> - CVE-2026-64832 affects NVIDIA NVDEC hardware acceleration.[1]
> - The ffmpeg recipe does not enable or build NVIDIA NVDEC hardware accele=
ration by default.
> - Hence CVE is not applicable.
>
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-64832
>
> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_8.0.3.bb
> index af05ab4af9..68f09c2bc4 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
> @@ -187,3 +187,4 @@ CVE_STATUS[CVE-2025-59730] =3D "fixed-version: this C=
VE are fixed since v8.0"
>  CVE_STATUS[CVE-2026-8461] =3D "cpe-stable-backport: this CVE are fixed s=
ince v8.0.3"
>  CVE_STATUS[CVE-2026-40962] =3D "cpe-stable-backport: this CVE are fixed =
since v8.0.2"
>  CVE_STATUS[CVE-2026-64831] =3D "not-applicable-config: Vulkan HEVC hardw=
are acceleration is not enabled or built by this recipe."
> +CVE_STATUS[CVE-2026-64832] =3D "not-applicable-config: NVIDIA NVDEC hard=
ware acceleration is not enabled or built by this recipe."

Same as 2/10.

Regards,
--=20
Yoann Congal
Smile ECS


