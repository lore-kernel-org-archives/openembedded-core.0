Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD1EC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 22:51:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45739.1782514278372400425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 15:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=L3WL1/0O;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so12770155e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782514276; x=1783119076; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0G0LqfA8jTV15OKMln8k1Oxa+9C3CVJIxnICZKsXKQ=;
        b=L3WL1/0OIikbgMF3O0BGJoO63yp5GStIYZ9/agpoK9cP9HbkywJSxXk+g0LPwRmAiH
         iktuwLB5C7Q8JEI0thmTxW2vNXY4C09qPHmWgt+nGxmz45H9ZMyGBbgPjfP0RuaaYVkV
         r0G5Svp/jy9KsgoKibK1Gl4bcwqU2edCbrkbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782514276; x=1783119076;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e0G0LqfA8jTV15OKMln8k1Oxa+9C3CVJIxnICZKsXKQ=;
        b=NapuaLnCH/51lBCLxhjkO25n29xIBC3ubw3CTHCDdsI6YAwh38J8lSlhpOkjVP5XFC
         42A9XAYr1jWdE3uf8n2YNEsD7ZBYHoNfaObh6IOr65r8hfX9PQNwvZkfOxP4v9Jk+RIQ
         /jACYGAObh0sWMEg7Ad/m5AGfy3w2+6pOIE9PpCvFLcoN8x1tWPIekmKXH142Zh7e0B5
         ON2O+2PCxYQRDiiX+M/i4JJyIwOD3260PCzNImAUwpKHfMeF1JvP5QwO/9gBWbKA0dX+
         P0tga+zdC6yvCex1CCGXe2ttRUpEr7MhpwTKx29ZeM9PuR73qZTrXh/HAZotWtWdXA2a
         Q+Sw==
X-Forwarded-Encrypted: i=1; AFNElJ9Tdh/KhU2awrjGz1rc6HaZtrhg78mFfwQBcD0yByPUvzQsn6jcFLPs0LXW4z5vrZqEZmjXc9BvwqBF/rDbKLeUGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHOLVUefO4wMGIRKuX7J1c/HaHyJe8NtGeCWE3ezxkz21ua5BO
	aqQ//jaGF2lZF1ddG4EfGxPnTEIu1xmbZXJHZnMu5cEbBoXyKFDz7/TWT5fZwF8e+i8=
X-Gm-Gg: AfdE7cmWCzqxjnuimjWwvrjrSb5/iN1RbcI6MKjda+BEphuD/cR0OXx+FjgTeZnV0Ar
	a0oxUtrTt6pvQLLcJEAPyupH49RsopKOn/LYt0pq9fh0zVAz+udERy/anbQDncIdnBvzADUjmW5
	aCgYtSv5Pmmlft7edf+QN/3v1t98TiMmbl88XUkPjLWKoeFIQp+UpDcDHA0P3scwmODJOk0PCZP
	fyvUxQwYkVXGXXJGjR8iNoGbiQBWHZ6hERyQ5KSQLSqTk5UvkzWJbM8oD81caaJgyBFuhfsgESb
	4ePfqR3E5bVznZ4aU8vcjyKZNTt9nJvkfJqPs3OWDlRXGttqRxDaXYdP6I5UY530hL7b/+2iOWn
	uWypUFdwMc8mg/3VumNnTTyydXeu9YyJsaTDwbSgzrBrZqgcb9NBYWvrTXwSTB2AmvO3bf2xVv9
	AFFs9gtv10dk4KW930mZYkA0RQmXiMYxKD8nPnO1D9LFYhmZjKI15LO8OfrCg3PWuIGIW1myNt0
	px/Ug==
X-Received: by 2002:a05:600c:e548:20b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-49266883322mr92984995e9.25.1782514276458;
        Fri, 26 Jun 2026 15:51:16 -0700 (PDT)
Received: from localhost (2a01cb001331aa00b5501ee7aae29268.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b550:1ee7:aae2:9268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm41164015e9.4.2026.06.26.15.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 15:51:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 00:51:14 +0200
Message-Id: <DJJCKP83KPUW.2ECUA0V3VKK9P@smile.fr>
To: <aleksandar.nikolic010@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2] wic: Fix updating fstab for
 nvme devices
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Aleksandar Nikolic" <aleksandar.nikolic@zeiss.com>
X-Mailer: aerc 0.20.0
References: <20260621202519.177293-1-aleksandar.nikolic22@pm.me>
In-Reply-To: <20260621202519.177293-1-aleksandar.nikolic22@pm.me>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 22:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239668

On Sun Jun 21, 2026 at 10:25 PM CEST, Aleksandar Nikolic via lists.openembe=
dded.org wrote:
> From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>
> In case wks file references nvme, update_fstab() function will not add
> prefix 'p' before the partition number, as the if condition only takes
> mmcblk into consideration.
>
> In case of nvme0n1 this leads that following entries are added to fstab:
>
>     /dev/nvme0n11
>     /dev/nvme0n13
>
> instead of:
>
>     /dev/nvme0n1p1
>     /dev/nvme0n1p3
>
> The patch fixes this as it extends the if condition and adds prefix 'p' f=
or
> both mmcblk and nvme.
>
> Upstream-Status: Backport [https://git.yoctoproject.org/wic/commit/?id=3D=
f20cda73b495b75ef399c331f59b0e2401a3e76a]
> Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Hello,

Sorry I missed it in earlier reviews but it look like this patch is also
needed on wrynose: wrynose has wic 0.3.0 but this patch is 2 commits
above that.

To accept this patch on scarthgap, I would need a equivalent patch for
wrynose. Can you send that and ping back here?

Thanks!

> ---
>  scripts/lib/wic/plugins/imager/direct.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
> index a1d152659b..b06e6a8f23 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):
>              elif part.use_label:
>                  device_name =3D "LABEL=3D%s" % part.label
>              else:
> -                # mmc device partitions are named mmcblk0p1, mmcblk0p2..
> -                prefix =3D 'p' if  part.disk.startswith('mmcblk') else '=
'
> +                # mmc and nvme device partitions start with prefix 'p'
> +                prefix =3D 'p' if part.disk.startswith(('mmcblk', 'nvme'=
)) else ''
>                  device_name =3D "/dev/%s%s%d" % (part.disk, prefix, part=
.realnum)
> =20
>              opts =3D part.fsopts if part.fsopts else "defaults"
> @@ -266,7 +266,7 @@ class DirectPlugin(ImagerPlugin):
>                  elif part.label and self.ptable_format !=3D 'msdos':
>                      return "PARTLABEL=3D%s" % part.label
>                  else:
> -                    suffix =3D 'p' if part.disk.startswith('mmcblk') els=
e ''
> +                    suffix =3D 'p' if part.disk.startswith(('mmcblk', 'n=
vme')) else ''
>                      return "/dev/%s%s%-d" % (part.disk, suffix, part.rea=
lnum)
> =20
>      def cleanup(self):


--=20
Yoann Congal
Smile ECS


