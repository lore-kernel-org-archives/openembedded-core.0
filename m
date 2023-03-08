Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00756C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 09:19:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2884.1678267157856290800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 01:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S74C1AY6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so768708wms.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678267156;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIbHMMG+hBZAO0ld6G/lUh/dy/Ju5ywkZUPN1PMWjfI=;
        b=S74C1AY6uPV+gMHPt1kbCTgJZwxHW9Razc2d5XeVc7ddmqemcD5rvd5LDsnkRTAB43
         rsxYhbKkOdDnYAYgl6OgXswoiR5P3H2Jajhhkgjyio+p8MnUYzi9HHSpXDeRUZ4tUzAo
         KbJ3YrmFN94FL4OFnIBLfMTsaHE3hGnWRd1ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678267156;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TIbHMMG+hBZAO0ld6G/lUh/dy/Ju5ywkZUPN1PMWjfI=;
        b=TQG2+jul2ZmqHSG+nlpln9IvdMs8I1MVPjjxq9aRlIzm0AmtNqzZKcwQdv9ZkxRB13
         JrguHOcDEdCPaOVxfhacXEmDYn2mBphqpoa2xaWl1nn43XhbVxbK2KIy7FAS+HAogtUe
         AT4UrIbkJhjM6wSiOhNzDdoq71Z5bv/OC4/Eed5kds8y0JEFKOrUgX9a0M5oFL+Wfbuy
         gXPyANUxeh4EdCotq2FaX3Szbssu7kGDQNJ7X9/X25sWkWdkCKe7BSuDwDTiZ5lD4oQ/
         tFK2Ln1BYLB6uRJ9z8BlwpzX1rp0V4Rr5jAeeZOuD3XjQkIaZsHLpVxH1njPGcSe6G+c
         nJ5g==
X-Gm-Message-State: AO0yUKV+WEv3ZicSwN2AaJUeYqeXxZA/a97W7u/XiyXH240Rl+LEUM8K
	IE3I2kAvAdcVeCs2HwAoFoxPAg==
X-Google-Smtp-Source: AK7set8eJzZrlA1lbUPXj85frb6iB3UQt6MvLgrmovGVKu91MTzGm6N0oMPTSshKKZpZrRA6/+Oe4w==
X-Received: by 2002:a05:600c:3594:b0:3eb:29fe:70de with SMTP id p20-20020a05600c359400b003eb29fe70demr15883963wmq.0.1678267156161;
        Wed, 08 Mar 2023 01:19:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b? ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id q6-20020a1ce906000000b003e0015c8618sm19157753wmc.6.2023.03.08.01.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 01:19:15 -0800 (PST)
Message-ID: <728b39e6fd12f9277b650c6d1cdca2d73da15168.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 1/5] dhcpcd: Fix install conflict when
 enable multilib.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Wed, 08 Mar 2023 09:19:14 +0000
In-Reply-To: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178157

On Wed, 2023-03-08 at 09:40 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Error: Transaction test error:
>    file /usr/share/man/man8/dhcpcd.8 conflicts between attempted installs=
 of dhcpcd-doc-9.4.1-r0.cortexa57 and lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_ne=
on
>=20
> The differences between the two files are as follows:
> @@ -821,7 +821,7 @@
>  If you always use the same options, put them here.
>  .It Pa /usr/libexec/dhcpcd-run-hooks
>  Bourne shell script that is run to configure or de-configure an interfac=
e.
> -.It Pa /usr/lib64/dhcpcd/dev
> +.It Pa /usr/lib/dhcpcd/dev
>  Linux
>  .Pa /dev
>  management modules.
>=20
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/reci=
pes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> index 39e689d2f6..03dbf31b35 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> @@ -62,3 +62,6 @@ do_install:append () {
>  }
> =20
>  FILES:${PN}-dbg +=3D "${libdir}/dhcpcd/dev/.debug"
> +
> +inherit multilib_script
> +MULTILIB_SCRIPTS =3D "${PN}-doc:${datadir}/man/man8/dhcpcd.8"

For something as simple as that we should just patch the docs to say
/usr/<libdir>/dhcpcd/dev rather than trying to manage multiple
versions.

Cheers,

Richard

