Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B13CC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 08:02:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.14168.1679040138679823317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 01:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bWyZKlCB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso4581397wmb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 01:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679040137;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP1D7FJZqpjVHapPMKxzXzjhYxZgWnh8V2WrDMeAKZw=;
        b=bWyZKlCBlFolP/5zVcPL9U3u80y4EhJzbOPX72G6xQ95tox05a6g1RUXYmtd68Vpmz
         j10qqyb2UK2/v9m5leHpFD7btssOx6dkq3CCaxcn8FK5/OWMWlKyZJkSUQVY3wt3bV+V
         H98/U7N1zW0JSP8uIvGA4Ic8/QYjOw5ilXwbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679040137;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SP1D7FJZqpjVHapPMKxzXzjhYxZgWnh8V2WrDMeAKZw=;
        b=KIAmtVuJlWeq2D5DDVIB6gD+C9aRwbWDTWssac9+0Rif6l4ateJGfxsNZCcInadXkm
         Mm1ElpmeBvnIf0TH0aU2s8kEjx9Z0LUwOZQkauutq1/MhGDUIRpknmW7UbHmSr0KVFKy
         yLBI9eEKs2DnMDs9trqVKZy/auzXG97B0hsR3mdUwIID/utgY+XAjjZgTj0jLN6TrSHr
         3dIPgozvzUQmgHdicLlsq1ydj+h89eGXAA4yrbmk7PQkzYR1YHj7y5GZ6fbErjXB/N+C
         gkVZl4buSQBVw0X/BwCXF7AfVyPkaZ0SqXKvaLNvg3CVGABEBjYky9fP+oUFDZb7mOh8
         5xtw==
X-Gm-Message-State: AO0yUKWxiTwE8bYjHRzVidwlHR6IHEsHOgxhS9LIRiOXMQUnZbZDnhFN
	56HYfox1scoDz7jpJevqDMOB4A==
X-Google-Smtp-Source: AK7set8KXJPFZymRX0EyQDJPHYZIYs7mkhKkYWyBLm/T09e8lXnK5VGRdVl93BtEat9TJqwZt+ICXw==
X-Received: by 2002:a05:600c:3d95:b0:3eb:5990:aea4 with SMTP id bi21-20020a05600c3d9500b003eb5990aea4mr1565002wmb.12.1679040137078;
        Fri, 17 Mar 2023 01:02:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4a14:4396:c3b7:b66e? ([2001:8b0:aba:5f3c:4a14:4396:c3b7:b66e])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c028400b003eb192787bfsm1241778wmk.25.2023.03.17.01.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 01:02:16 -0700 (PDT)
Message-ID: <3a75a7b37cf689642f5fa12c043e629236e17a3c.camel@linuxfoundation.org>
Subject: Re: [RFC][oe-core][PATCH] initscripts: dont use /tmp symlink if
 ptest is enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2023 08:02:15 +0000
In-Reply-To: <20230317060342.386014-1-f_l_k@t-online.de>
References: <20230317060342.386014-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178745

On Fri, 2023-03-17 at 07:03 +0100, Markus Volk wrote:
> glib-2.0 ptest will fail if /tmp is a symlink to /var/tmp
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/reci=
pes-core/initscripts/initscripts_1.0.bb
> index 4dc477bb8d..51a90ddf58 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -108,7 +108,7 @@ do_install () {
>  		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root =
0755 /var/log /var/volatile/log' \
>  			${D}${sysconfdir}/default/volatiles/00_core
>  	fi
> -	if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]; then
> +	if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]  || ${@bb.utils.contains('DISTR=
O_FEATURES','ptest','true','false',d)}; then
>  		sed -i -e "/\<tmp\>/d" ${D}${sysconfdir}/default/volatiles/00_core
>  	fi
>  	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d

Having a delta between what we ship and what we test on is asking for a
ton of trouble so this isn't an option.

We can't change a key image behaviour just to make some ptests pass.

Cheers,

Richard





