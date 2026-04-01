Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659DA10F6FBF
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:59:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15249.1775055538115685616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eXPILmIs;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so8501835e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775055536; x=1775660336; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ/zsdcq7r3lcLFUWiVulKw0vFdDmRhy/24yv0Y9hq0=;
        b=eXPILmIsxICJfdzr3wRHwSEL6LMKUOjTHnPyppsBqBXzHZ3CyjR4hDv1Jffjc0h2tR
         CqLPKjccNPvbbI9B/eGuax8VF62arMPRAfKpb0wCU5kpoo/MWgTmMxSzgALr3cPV4Gkg
         zb+x5a2sAPAja5WS6msMbbBUPgY9dcvow6i0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775055536; x=1775660336;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQ/zsdcq7r3lcLFUWiVulKw0vFdDmRhy/24yv0Y9hq0=;
        b=tV3tFI12unCumbYEUSayg3cib4JW2FGScJkcPqxR1CWbluWWOn/+9YLIoo51ti6TVq
         bvVfBGyt9pq/BxBKFkctalVYCGI7O7WxAmCltZfyY4Tbx8Z2O8YLj9Zxjysa5Ih4nt/G
         znAbvOOOixtCdgAxwvSSkQH1/doTboj+9JpCEB+TieU7iat9kuv9zoNX3o/XuSP5CRpj
         /roUwxiqpgQzME9NQgKAPX/A5WWJPRRgURjy5cDuWnAKax8DRz7iC7A9TzfeGqvWhFBK
         YQmiylnJwQkzlWkOTGnLFQwrhexNHZCgR5EaMqdogtGbR2wkeoATCQ4LdscG70eMgUxF
         BWLA==
X-Forwarded-Encrypted: i=1; AJvYcCWX7g00+OWHRSGk5ndmcKpDLpOdCtjXyFZkW19rYdZCvIA+jznYUa3Bp6cnQBbr0Ie6oWJXNUDewcXb7zLbbP75vQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2sETThcnNcuESYdI7wSeL263q7UnT1rNYi3qKotD+7+qrdLaJ
	O7O4zOXNbEAJouDozTJXPKJTBAToKHzApZ63VeL6zA3FcUXnj9Xc5MMYJD8Wg7b/a/U=
X-Gm-Gg: ATEYQzzKugUgKc7NoQfe48SanjDa+6UQMwKdKD+HH8RNwhM92ZNO/xPVQ5EThX/J8T3
	7DcGNQBYnTye8grnZB3uYUfoLlZ66Q7cK7L40SIIv1nAj0k/VaODazDQG3bMdCCP6m//MusRn3H
	NGJBctAGshPTTMcuLGKyC+amJuL8n4L1rwDqRbDFv9iACbjn2xhDMzRby04mu5Xw2gORs8bUIWW
	GWIJheIFzQl3K81PFsW8Zyk7opY5u54Tr49Ir3ER4aajdkhIie6ydQs/BRqLrE/ZcDFVMDao1PD
	vk8oBOEQ+jlX5Cs8r6KfhL3VYzhoKSYmFekNlVTmN0paPniBr077sfvTEGvq+jYfRFhfDBota3y
	6cVRu8Ut8Hxz+eYtYZut4IP+uCCgBHfJVBQYIU8b/fylGW8yd9j0NjP/nKUMd+JgDoZ0HfzcQsI
	Ld/Idr/ey+pct4AvrfRd8xpIkeOIaJkNShkWM7k1FIZHmON7MZHgkh3iAAeZVV3BsYzanfD9wOL
	lFU5LRUvx0=
X-Received: by 2002:a05:600c:1d0e:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488835bc1acmr62788235e9.12.1775055536391;
        Wed, 01 Apr 2026 07:58:56 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aecf6e6sm45305055e9.13.2026.04.01.07.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 07:58:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:58:55 +0200
Message-Id: <DHHWO7MO7KHD.1VQQRFF9Z3TC0@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH 07/12] seatd: Create seat user and
 package systemd service
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Khem Raj" <raj.khem@gmail.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
 <20260325021856.4053666-7-ankur.tyagi85@gmail.com>
In-Reply-To: <20260325021856.4053666-7-ankur.tyagi85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234441

On Wed Mar 25, 2026 at 3:18 AM CET, Ankur Tyagi via lists.openembedded.org =
wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> With latest version seatd does not work properly if
> user access permissions are not correctly set, therefore
> create 'seat' group and package the seatd.service file
> and enable it by default with systemd distro feature
>
> set logind to systemd when using systemd as default init system
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 26746a02fc94b569f633d581b27a8634cfba38f5)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-core/seatd/seatd_0.9.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/s=
eatd/seatd_0.9.1.bb
> index 3be27dda9d..f9f72c9e82 100644
> --- a/meta/recipes-core/seatd/seatd_0.9.1.bb
> +++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
> @@ -34,6 +34,8 @@ PACKAGECONFIG[systemd] =3D "-Dlibseat-logind=3Dsystemd,=
,systemd"
>  do_install:append() {
>          if [ "${VIRTUAL-RUNTIME_init_manager}" !=3D "systemd" ]; then
>                  install -Dm755 ${UNPACKDIR}/init ${D}/${sysconfdir}/init=
.d/seatd
> +        else
> +                install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${=
systemd_unitdir}/system/seatd.service

Hello,

The patch content does not match the description anymore (no added seat
user). Can you update it?

Thanks!

>          fi
>          install -Dm644 ${S}/contrib/systemd/seatd.service ${D}${systemd_=
unitdir}/system/seatd.service
>  }


--=20
Yoann Congal
Smile ECS


