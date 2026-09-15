Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02635C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:20:26 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24225.1789482023472802725
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iHCJLERs;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so13576415e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789482022; x=1790086822; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kYweK3XZeNCOQImAVb8oDzfFm2rymj5mlQr6hDIvX4=;
        b=iHCJLERsomaYHPGVtFtLAxWgFSsKkYIWHrlt2+0+jghhYJ8PT0t1kaXv78FGZ1bq1y
         Qf8HhZGpDjF4GOa9GW6rpffLeCMRKxB5JCDxNDqbqrMyoK15hJO/Hlx6U+zsOvLxets/
         iI5L6Y80if22xOcnOSdCZotrMUgURipyTRlJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482022; x=1790086822;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4kYweK3XZeNCOQImAVb8oDzfFm2rymj5mlQr6hDIvX4=;
        b=eVzmdDdDtK4+hTFwMlKeOlosBRZeg13Qa61qTxX90RX51q7GmwZWcuFUUgNqZRN/g3
         SVeJk5nEHgPPiMlo23pgzbn1WFFPwnyvQv6uNIJq3SvdP+5RPygqnSzBLuL6MZbO+chr
         ylT6m5uXyFIT2IZ0UDqvJsOdNvAtoik8ysjyvdrzEPZ8DZsWAJ993x8hbngyCqKYu7oe
         c9cjZOjK6aGoPZRzNeKPw45oohOA6S43zXeEJxC23fd4zfWq9Z+fdudg7nGrESe4c9x8
         29OSm4f4Q0WabZ9Wp8hJzZL1L5WFvOaRI7DyqevE7AmELl9FQTgQQ4cP8PvFVUmuhNYR
         pt9A==
X-Forwarded-Encrypted: i=1; AKwUvBy+uH+0vBRftYkxoslmXorQ/tI7q/mTq8sYKuiGq71iae4QGZ/FUkrNqMEpqV1goKGwbItx/K5tZh6fCXe8S1PCew==@lists.openembedded.org
X-Gm-Message-State: AFuF++mWp2Cu5enIsgSLSk4P8rPdyRXaxoQytwHQG7br8xAevWwwzkzu
	2Z0ofCjuw7C1OMECtqtr08mZyBuC2FGxma5Ux5e+4iNRpAKkrgiMQhb2SGM3tyBbE7I=
X-Gm-Gg: AYBFou3iHnuTDEZTgOqRIF3xjSqXcosnAh4HgOqcJSoz12J4bq2FP3gDycVfcberCIS
	sddUIOA6oy91flpZHacbdP35IjrSLfS1Qe51Y/k1tYryEhSGJx1GbhLl04cucf4CtfsW0QgZ3yF
	wjrk2r6OVLVre9tIyAvtP1fLVu7IMWkDj8uoWduOjdvw+gaX90wLSyOLZ55JeWyPd3bUPhe5P0l
	XnS52ZC8w7+mdpzrDvAlFITrRCP72SNLbT7z6unlVY/gSjQBmpaygi3ZRAVqqWVk/EpVBimwFLY
	MF191xXahqTl5nKwTTiJ48YiEHqts7tUXTxVehyMlpGWNPxeEOt7SbDL5j5oQXwk4yBdh1AFR6a
	bh7WEPo4cX3Rk526AM4sLBaeknpyALZDqE+egYQLZH1iKo40QBVNUnMrt4awoSedUiEQVj2sbBP
	dw4syhvWuJTqgYlzwYMsYyqz6oDZDsxvsXWMOK5ol8r3PTVKQD9UvWXzxhks8GDhUriSn9pQ2EW
	QVoKtSfr8sLU4huXbE8XEWukG6dxs81VSPCjgaCMicpaZ92AgQHPbYRJds=
X-Received: by 2002:a05:600c:4e47:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49e7a677cdbmr72493615e9.25.1789482021418;
        Tue, 15 Sep 2026 07:20:21 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83a24c72sm144835e9.0.2026.09.15.07.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:20:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 16:20:20 +0200
Message-Id: <DLFYFNE7WFWL.3F3WFUFA1M1VX@smile.fr>
Subject: Re: [wrynose][oe-core][PATCH 02/10] ffmpeg: set CVE_STATUS for
 CVE-2026-64831
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <bhavesh.maheshwari@einfochips.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910133357.452394-1-bhavesh.maheshwari@einfochips.com>
 <20260910133357.452394-2-bhavesh.maheshwari@einfochips.com>
In-Reply-To: <20260910133357.452394-2-bhavesh.maheshwari@einfochips.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245848

On Thu Sep 10, 2026 at 3:31 PM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:
> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>
> Analysis:
> - CVE-2026-64831 affects Vulkan HEVC hardware acceleration.[1]
> - The ffmpeg recipe does not enable or build Vulkan HEVC hardware acceler=
ation by default.
> - Hence CVE is not applicable.
>
> Reference:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-64831
>
> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_8.0.3.bb
> index 8c1969369b..af05ab4af9 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
> @@ -186,3 +186,4 @@ CVE_STATUS[CVE-2025-59729] =3D "fixed-version: this C=
VE are fixed since v8.0"
>  CVE_STATUS[CVE-2025-59730] =3D "fixed-version: this CVE are fixed since =
v8.0"
>  CVE_STATUS[CVE-2026-8461] =3D "cpe-stable-backport: this CVE are fixed s=
ince v8.0.3"
>  CVE_STATUS[CVE-2026-40962] =3D "cpe-stable-backport: this CVE are fixed =
since v8.0.2"
> +CVE_STATUS[CVE-2026-64831] =3D "not-applicable-config: Vulkan HEVC hardw=
are acceleration is not enabled or built by this recipe."

Hello,

Nothing prevent a downstream layer from activating this feature.

The CVE fix[0] (per NVD) is quite simple and does apply on the ffmpeg
8.0.x branch. Can you send a backport of the fix instead?

I'll keep reviewing the rest of the series.

[0]: https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23665/commits/ea8087200ce9=
1f3f296a30541a89b19ae4af19a2

Thanks!
--=20
Yoann Congal
Smile ECS


