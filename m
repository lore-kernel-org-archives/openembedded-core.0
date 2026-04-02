Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DF2D39427
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 13:48:45 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16122.1775137721227135607
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 06:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mtmVZwYU;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6501725d888so713278d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 06:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775137720; cv=none;
        d=google.com; s=arc-20240605;
        b=jzCiByUyRhh+mi5HpYOyuR555AvunnEXOKrQ7YhINW3k2x9rqWgNu6R3NbAg0ncN4p
         50fuJCy8TOgICCl0I8ip0vVfCRg+Ftm16gqtbhwoDZyjCcsRuiLlKQmYdmJt4KqSoYDP
         zfeFVwDLOBgwHD8p2Wb2ud9Tp9Oyw0cutV0mXMbFYkTOQ+EbPCHfNCljCOoDbKuK21W8
         Xj4tvchOZyfr1IfgTwsud1GSRyP1mMioYIQ5yR6FL/CE/p7FtIaYVWLCobu/zaNDh1JT
         teqZ8kulNdTp4BeZrOfaZWLGQwJkJ1hQPe6+pMQoomzeaCBOElFhTcmVayhMyoa67jNw
         lVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=97ru2qftTqdkvNtggNdQ3twXDYDhtr1JraA1PCCay64=;
        fh=JVyzXYvlC6+f/TP9NdsSxuPI1wC6N+F2me8v8yce8dQ=;
        b=EygCYznkdzjL0wC9AXTtfJR4WgiJ5bBW57ri45jJczl3HXi/qusjaLco8F3DlFfGqz
         p7v/uCjkoTvUdH1WLc5a+6TQB+Zg6gwJUGSAP+2UhN7NCPaByMs072ZKni9ZRZUqpLAg
         YZuRZciSWP7bJkMlzp2hqwNXFKirhdHjzbzMyInUVzJBbbOlX+sSevRgG5xmbUSNUjrq
         nlc1EaYm+ENyLsjKkwtU/yweKJeXdG/ce6EcQgvp2vtu4RMsku4Ny4V1snrtCdimUN9x
         TGn3cibM4jR9/vgGByPv93Ir/kic4jrz1kbhMCWwfd9wqZlcY0TS3mOigf8Im9OQ4tsv
         7dhQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775137720; x=1775742520; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97ru2qftTqdkvNtggNdQ3twXDYDhtr1JraA1PCCay64=;
        b=mtmVZwYUaZJ86uFRPu6QWOxgO11WlX6Zu1JNE0ExG336L2YFEzFGYXVIiXlnjIbEW6
         SYcyOR3OrgSZasXXGom2OCn/f/aF7Cu0e4bqxKB40N6MhUNvPaxDP0W95E+j/qLoyezp
         cQmDe83FWyjaVQffLLVCQDCi8cbwkoBckeA+/odQMFksMoCzCG0VH7uBkLA99fVTjCtV
         2TcptnLHNe/6J3lg9PeKZ2dkL+cHzL2aY+KXE8CkGpPxTRv2SjueuElRlcUkbklKtNrQ
         Txwu71hFYNDGSSGBRxmTPAiyUIKFzcGC0Ghbn7BfY2bF3/uSVEfu72kFm0ln4jZERtRH
         hozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775137720; x=1775742520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97ru2qftTqdkvNtggNdQ3twXDYDhtr1JraA1PCCay64=;
        b=OggjWIvU0xwpYMrv16Q9ajO695tDk9fx00Lh6A13eibUWSuaIWcfQh7BUb4PlMYqWI
         NGZOrOUcyAKuaJPcmJnPEBE2OGTtyUUlsRigscGkbCOhAGC5zB6B+okm7uFqVVVo/+tc
         1l/+F6jWXIA2rc6wWGc9Lm32pZ9pXH9I/wvGkoJgfynjxumYw/30BbfwjF3kGHiio5VC
         Xh58q5IgKINnG/OuY1DQbjySVIFs4eUn2imN+1jl4vm1wQ2jzDLK2xw3+2HxtQ4ocQtw
         u7DkA/5ZBu/0NWqqziVCsyeO+ijwPNT8sh3c2WkNmiy+TcpDgToSzMl+jheZr0/K3K6h
         Uv4A==
X-Gm-Message-State: AOJu0Yx1ef0bj3B6nCrwYknD20XGZC/0wJ8iXAKS9s5SsxFvOWJjCoPd
	f2/JrUt3KVRYtpRLNrHtVclrYsl/rRseMsGVmwXZ3Ac9U6Lj5AfFhqb39TEzMeFwuAtBCviumn3
	o3izLWgfd9Q2vqtrj2FWmuLHBrj/MZrw=
X-Gm-Gg: AeBDieuNPKSZ9/728OmFOGm9M6HnIL6eKJMndP/HbJpNC2wzbDCgM62wcwZNsxZ/kTX
	prqyfH8YSYYYUOhLNYvRdJWvs30OVdSwaswUZsXPrnNElWUjeDCHB+724HewKE8t/NpRKm5OK5K
	txVch+s6t2/MEGr0ogjnG66uJK04+ats783bR7tNV94SiRK65pbkNhZS+y3Xqpy3LYr1zEUqSL5
	L3hBCcrBQPOvzILCP42O3ZsCdKqyIMv7IVpWR1zDXyWSnuMjq1tmIExnel7gG0YuPr1E3n7gWJ8
	dDlp0UVY7s8tmfCGbjHg0w==
X-Received: by 2002:a05:690e:11cc:b0:650:3bbc:555f with SMTP id
 956f58d0204a3-6503bbc6137mr3102829d50.2.1775137720334; Thu, 02 Apr 2026
 06:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260402093444.675082-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260402093444.675082-1-joaomarcos.costa@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 2 Apr 2026 07:48:28 -0600
X-Gm-Features: AQROBzCD2rv3jOvF3p9orBwJClsRQG_tH4nkZ4w8gsu51uhvile19GiLdBW1zzc
Message-ID: <CAJdd5GYHOAQPv+P4O5FNfyrQvsbGj8MpTA7n2NBw6yy+i_mo-w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] spdx30_tasks: fix condition in create_spdx
To: joaomarcos.costa@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	benjamin.robin@bootlin.com, steve@sakoman.com, 
	mathieu.dubois-briand@bootlin.com, pascal.eberhard@se.com, 
	yoann.congal@smile.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 13:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234526

On Thu, Apr 2, 2026 at 3:35=E2=80=AFAM Joao Marcos Costa via
lists.openembedded.org
<joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
>
> From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@bootl=
in.com>
>
> Considering that *detail* is an actual variable, not a string, remove the
> quotes to make the 'in' statement coherent.
>
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.co=
sta@bootlin.com>

LGTM thanks.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> ---
>  meta/lib/oe/spdx30_tasks.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index a8970dcca0..e7bb930b59 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -523,7 +523,7 @@ def create_spdx(d):
>              # specified.
>              if (
>                  include_vex !=3D "all"
> -                and "detail" in ("fixed-version", "cpe-stable-backport")
> +                and detail in ("fixed-version", "cpe-stable-backport")
>              ):
>                  bb.debug(1, "Skipping %s since it is already fixed upstr=
eam" % cve_id)
>                  continue
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234510): https://lists.openembedded.org/g/openembedde=
d-core/message/234510
> Mute This Topic: https://lists.openembedded.org/mt/118630503/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

