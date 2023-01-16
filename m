Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC352C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:47:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.172026.1673887639806029236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 08:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TfJeJW0d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso18258421wms.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 08:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBVptoTTsTggKmepjnooO/niAnkxF4pOXPZzH0KpSRY=;
        b=TfJeJW0dxOMObMAAiTa7BahyU3UkMF9N6VV1FUL/yoBZKzhj8s0GH/LvsYYI1/EhSP
         BOrv65cH0aegUc0Zfucv6g54SHi8uMVSadcIJPygYpsG5ctqwNkskUiWr/10Gtjy9Qtj
         vOfmmn7VMPZIgLvs8YYWSW6FlDNH2Bv8MCPro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qBVptoTTsTggKmepjnooO/niAnkxF4pOXPZzH0KpSRY=;
        b=y2np+oLfihXwK+5plt3agQe80jbmqsDlazVAn6HOxh24zPTt3vuMd0r5fUJEP7RITV
         wZbS2f/XA91ZXL3aX3LdOKf9Jbtuw7p3ij1sBCma2EDVWtcSHU6/qf9wft0LzgZ2wpAU
         LSpMQIV8ZnZUi+imh1aMx0ltlWdmLjAtU/APp2pWSOqzmeE9y1fUILOAP7YdziYyQyCN
         v2WI9zzXvHCnpd7AUuwpqsROE0XkmD4K9isRCo1L5rfRJM37Aycsg8Z5dh/u2/l/grLW
         +ehdzROSQ+Ss/Goqz7EvK/STnLL36orm7uIYbpx76jnXDI42LIPYVcww4wmjokflW32i
         AxAA==
X-Gm-Message-State: AFqh2kpvN28/kNXiZh/LX52pmdsCyCi0RHDxsH9z8aPxExVP5AeQLWD5
	W0naayjEWK+DBeUBq24+LpEeGg==
X-Google-Smtp-Source: AMrXdXt1lXI56/sUWOFlq7jXDiWYs5Z2nwL6fyYs97NxVJktmuqu2pvXsLqkYlMLobRnZ/ykWFvlbg==
X-Received: by 2002:a1c:4c04:0:b0:3d9:f0d8:708c with SMTP id z4-20020a1c4c04000000b003d9f0d8708cmr8856214wmf.26.1673887638027;
        Mon, 16 Jan 2023 08:47:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b003b47b80cec3sm44623332wmb.42.2023.01.16.08.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 08:47:17 -0800 (PST)
Message-ID: <ca881583fdf1906bb5828607c19a11113cbd895d.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] neard: dont pull in wpa-supplicant
 unconditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 16:47:16 +0000
In-Reply-To: <20230116164325.289867-1-f_l_k@t-online.de>
References: <20230116164325.289867-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 16:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176004

On Mon, 2023-01-16 at 17:43 +0100, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-connectivity/neard/neard_0.18.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/neard/neard_0.18.bb b/meta/recipes=
-connectivity/neard/neard_0.18.bb
> index 23e999acc4..17dbfc4378 100644
> --- a/meta/recipes-connectivity/neard/neard_0.18.bb
> +++ b/meta/recipes-connectivity/neard/neard_0.18.bb
> @@ -42,7 +42,7 @@ RDEPENDS:${PN} =3D "dbus"
>  # Bluez & Wifi are not mandatory except for handover
>  RRECOMMENDS:${PN} =3D "\
>                       ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez5', '', d)} \
> -                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa=
-supplicant', '', d)} \
> +                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','${W=
IRELESS_DAEMON}', '', d)} \
>                      "
> =20
>  INITSCRIPT_NAME =3D "neard"

That isn't going to work as there is no default value for
WIRELESS_DAEMON ?

Cheers,

Richard


