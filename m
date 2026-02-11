Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB569ECD6F9
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 23:40:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33162.1770853200851922908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 15:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q7YCZzOx;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so46531665e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 15:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770853199; x=1771457999; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDljzZ9WNE8RFzP5Qvamy8KP+T0xE+gMZ73hQzWBcBM=;
        b=q7YCZzOx332hJUDSy/LJLgCT5TahJ03w09SN9hBwP5zyXxh1na1udpeK/uRawlZYq7
         hTo2Xgi34x0VSYsng9HSZqeo/wsACswFJTGFe7wkpn1x9VdvTgu26E6bf7YaxDf5PLEq
         US++J+Jsro7S834awOGJ8TIUdZ+XerCpRoUZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770853199; x=1771457999;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDljzZ9WNE8RFzP5Qvamy8KP+T0xE+gMZ73hQzWBcBM=;
        b=BRP2TVT9TS31FZ+Hvoun4lTLveoIDfQfj+1jt2SdVu7NFXLaeKv29hO1ngT2UsZSOn
         ro3ZJXQK2pvQkwHis7TEHNGBGuiWrI58/4+K5+EzHRmFNAxZ4epZTO5CeZcA9z/GiUol
         nu85dSSdxRoulIu0w8x6pfnRYIC2bniLDwHUocUtxydzZV3sYvX6hAC6FxzkgmXADWKR
         iGvsFHvJrub7zNVLsVj57g+uSQYctcKc/fR9oZ4TIwHQ+iD8cGB6DdcIurzCpk6gSWyX
         3L/x+/l6tdVo0BUKV1TQhrJuap2urmri0/7v7Tkbc/tiuhLmQ1ZgmMuQIMIPNOplwAaL
         vDzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8GslG832Wtzmr9vxt+Pcw0iBHqAxmTbs5c/JDanxVn2d2VA3RFbkqesGN9ezGyv2ba+eV4lXoZy9wHKvAxxKBeQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw2TZcYCBWO41u4qZY5BtX2hQNP88zhGmDLIxt30+jnzVvezzOk
	/u09LVZQ9zcM0+eFVXD0ChrIQsxohzs14HLhLHbbtGUtzDGLY3YVFoTMmW83oSo3e3Q=
X-Gm-Gg: AZuq6aJHcM2ym5EfouJzDEv1STqCVRavw/QB4hX5Z08KRjK4JOZpr+IZaiGUTlt79Mw
	AWGHYSqueMyDsb9h1X1T758B/XdEH2/qksCpYhPS21MCW83yLpHJjry0WTWWOG1Ws+w+Jn8IfQ+
	tUvvpLT6CzK9VgwY68RTaIzsyPMaHygm8B5zt3NLR0zNg4ud8noOI0gYdDk85RCDYuKI7iSiYE4
	1djOD3DJ/RhzGj3x4qGgPrbMKjjwzC95/SwLonNEMFh3S9S+ykBHqWhm8NGOmVjiP14YfGZaWg9
	a5IbKwCjJIvvos5yWcnDAeQTZgBuNI9nfCe8GysS1Q+TYV+XW2fJRabg0/l4q8U74VJs/ym7G3c
	oBR2BuLIkI0vnKgjhBpd7M/sJlKgbu33lL/l3BhIAfZ+jqUUfTjHWOIVRq8t2JIUXkXMyOXTJ34
	zYRf8o8MZuhKwRHIDjp0jNpAxz+jE/nFqHTlvl76dWYjDwKnjY+IkIoElBv0iiflHpIjS4QDq0o
	OXcVc9tdRgt3HHtLVQ+BEGfHw==
X-Received: by 2002:a05:600c:1d86:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-4836571faf9mr11265285e9.35.1770853199025;
        Wed, 11 Feb 2026 15:39:59 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783dfc2b0sm7321393f8f.21.2026.02.11.15.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 15:39:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 00:39:58 +0100
Message-Id: <DGCJ2GK9B8L9.VZW7S6NH40RA@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH] texinfo: Fix gcc 15 compile
 errors
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <tonyb@cybernetics.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <e314bff9-bec6-4085-b3f2-7fca14f95bba@cybernetics.com>
In-Reply-To: <e314bff9-bec6-4085-b3f2-7fca14f95bba@cybernetics.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 23:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231001

On Wed Feb 11, 2026 at 5:39 PM CET, Tony Battersby via lists.openembedded.o=
rg wrote:
> gcc 15 switches the default from -std=3Dgnu17 to -std=3Dgnu23, wich cause=
s
> multiple errors compiling texinfo:
>
> texinfo-7.2/info/terminal.c:164:7:
>   error: too many arguments to function 'tputs'; expected 0, have 3
> etc.
>
> Fix by specifying -std=3Dgnu17.
>
> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> ---
>  meta/recipes-extended/texinfo/texinfo_7.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/texinfo/texinfo_7.2.bb b/meta/recipes-=
extended/texinfo/texinfo_7.2.bb
> index 784f67f65b..08da15deb5 100644
> --- a/meta/recipes-extended/texinfo/texinfo_7.2.bb
> +++ b/meta/recipes-extended/texinfo/texinfo_7.2.bb
> @@ -40,6 +40,8 @@ tex_texinfo =3D "texmf/tex/texinfo"
> =20
>  inherit gettext autotools multilib_script
> =20
> +CFLAGS +=3D "-std=3Dgnu17"
> +
>  MULTILIB_SCRIPTS =3D "${PN}:${bindir}/texi2any"
> =20
>  EXTRA_AUTORECONF +=3D "-I ${S}/gnulib/m4"

Hello,

Thank you for this patch.

As far as I can tell, the problem this patch fixes also exist on master.
Can you fix it on master first, then, ask for a backport here on
whinlatter?

On master, an upgrade of texinfo might be more acceptable than forcing
the C std.

Regards,
--=20
Yoann Congal
Smile ECS


