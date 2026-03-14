Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC0D106FD70
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 20:03:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16873.1773518635783356521
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 13:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NFYPuzfU;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48539d21b76so22870645e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 13:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773518634; x=1774123434; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EMwpwq740G4q1WZy22gQB+CFZbQaisBOXqls86CkvU=;
        b=NFYPuzfUwVr2S2Aruts5g4UIVAbWoHiNmmmMcTiGqOYAO39Ev655SN2LvwYsDlvNCN
         91ubWfmZdhe0vIkKPrDmHA8fiM38iqLOY9fb81rnsBelZSm3aJqEFgqRdILoUfIAfKz/
         ezbQF7Z9/2uGfRl0mzSvCupPzSxlBSprIFI8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773518634; x=1774123434;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9EMwpwq740G4q1WZy22gQB+CFZbQaisBOXqls86CkvU=;
        b=qgQYi3pVzZwgm5nbQjgI1OjhcaN4J3wkmdq/uHWuLQWWShSptdauTNp/HdTJq9h7Nd
         Zm6JfqAJVYqiiArMJzLOxLG0U0ksv9bR8Sj5On7Y8imf3OyaH4m6L/qyLcsNuWjVdNMF
         RBmirgjRPE4lYtezqYX3dsG3NPPcWh/fMhRcNFyUl8walSfE+7wopUBsUIDsk0ucj/3c
         Y/sfyPQE/C5mqdnsVAhtNKV8eGhg69a030OyIkbpj6ZI7JUNtnZ72FGWBbsUdIJTCAcI
         Z7la7C18crIXMe26y5EawJrXHMyXlW0c+a1mOUMB1OfilbSBlQKXeG9013VH2joGQQlb
         Q5Og==
X-Forwarded-Encrypted: i=1; AJvYcCWyzQcZeSuVxlJanZi5UqoIz0KwuXQ2B+XTKgsbBGVWCwQ2vnC78fWZJUlLkMTZUji/YBeVlChLUocUmgzAtKk/ww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKBvNK1zgw03bEVNnjg6V3hoHYlNKOZtxb4l+qepy9kFhCOgGW
	DIzeL1UYrbKQlaVokQcFgA+mzajakzrZpUmdQUDDIZpO5jWKusGvJscsREDeLejI8r0=
X-Gm-Gg: ATEYQzwdZSnoE+q7aHky3JgI1QiTbOUrW/6M+nyhL6FgpR3VlcLrTN/h+kv92XXV1lr
	eiNe5LgURUC2Q1d3Y4XDzq6b1pwcyBFAXP8zeGvDPo0xyqYfEsZoUjNmGIQ7gbnESXuEP0W5R2A
	6BF5vfpTR5iAVX7sSgfikR3d7AudN27KMsbhB1Js8gbYhtKjWziwOTkSEqKUKBqbf6hb4bkhA+7
	Wj+NgvZgFJAYTJo8/vmePgEnHRbG/I44hhdatLWFCGYKLqYMFSuZIaOu/HYudXAgpMWxsBHZjZj
	CRcqoe+uzq5XB2CNgweZXMqva5CGFT0kgkzNd4woR+JYlF90umsV6EuKwihCOpftJlQseELJnm0
	Gi16STfF5H0WGLtgxcqyp+wOSkSSMAXoGJZa9VQBeNKv55BN3hW3Dz2Z3i1/cQruNetACJgliqp
	8GuGkbHjD9fRI+SjTTsW2oMEUK8PWpeXFNNXYCvLG7ugYwyhI4g/npcHGxbv9cUdNq8Rww5r+MG
	IgjmGhpcrmv31U=
X-Received: by 2002:a05:600c:3b14:b0:485:410c:119b with SMTP id 5b1f17b1804b1-485566d6f93mr129312135e9.13.1773518634054;
        Sat, 14 Mar 2026 13:03:54 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6c24sm275078715e9.5.2026.03.14.13.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 13:03:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 21:03:53 +0100
Message-Id: <DH2RVWI85JHY.9VXXCUXB22I3@smile.fr>
To: <aleksandar.nikolic010@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [whinlatter][PATCH] scripts/install-buildtools:
 Update to 5.3.2
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Aleksandar Nikolic" <aleksandar.nikolic22@pm.me>
X-Mailer: aerc 0.20.0
References: <20260314180151.43501-1-aleksandar.nikolic22@pm.me>
 <20260314180151.43501-3-aleksandar.nikolic22@pm.me>
In-Reply-To: <20260314180151.43501-3-aleksandar.nikolic22@pm.me>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 20:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233099

On Sat Mar 14, 2026 at 7:01 PM CET, Aleksandar Nikolic via lists.openembedd=
ed.org wrote:
> Update to the 5.3.2 release of the 5.3 series for buildtools
>
> Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
> ---
>  scripts/install-buildtools | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
> index c3f257ff93..b9c008a2ec 100755
> --- a/scripts/install-buildtools
> +++ b/scripts/install-buildtools
> @@ -57,8 +57,8 @@ logger =3D scriptutils.logger_create(PROGNAME, stream=
=3Dsys.stdout)
> =20
>  DEFAULT_INSTALL_DIR =3D os.path.join(os.path.split(scripts_path)[0],'bui=
ldtools')
>  DEFAULT_BASE_URL =3D 'https://downloads.yoctoproject.org/releases/yocto'
> -DEFAULT_RELEASE =3D 'yocto-5.3.1'
> -DEFAULT_INSTALLER_VERSION =3D '5.3.1'
> +DEFAULT_RELEASE =3D 'yocto-5.3.2'
> +DEFAULT_INSTALLER_VERSION =3D '5.3.2'
>  DEFAULT_BUILDDATE =3D '202110XX'
> =20
>  # Python version sanity check

Hello,

I already sent it: [whinlatter][PATCH] scripts/install-buildtools: Update t=
o 5.3.2
https://lore.kernel.org/openembedded-core/20260312231730.751467-1-yoann.con=
gal@smile.fr/
It should be merged soon.

FYI, I've noted to do this upgrade in the next review cycle after each
release. Feel free to remind me if I forget.

Regards,
--=20
Yoann Congal
Smile ECS


