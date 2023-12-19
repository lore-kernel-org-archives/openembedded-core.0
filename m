Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D7BC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 08:29:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.7972.1702974555290610121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 00:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CM/DkKHz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3363aa1b7d2so4031465f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 00:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702974553; x=1703579353; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2UhCoZV9d4jDmPY/OhmPwt3uNa23BtvXYjum5WPIv2Q=;
        b=CM/DkKHzgJKKAsBCEkIhY9ClcL9BwIRiRS8dU62Lwe5Mf9S7wfKgi1BxcrOrOEqBqp
         5yIh6/1dvO0m6MxesmY7SbgvOFsUBB9QO24ZOiEGc7xjQiHGvGvrVKLl+gDm/95upVGi
         bgZ280ArAmol2ulJFkV80c+pj3azdcV4b2i9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702974553; x=1703579353;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2UhCoZV9d4jDmPY/OhmPwt3uNa23BtvXYjum5WPIv2Q=;
        b=GKRZKbdI71QWHG4szqkiZu981bBf1kp/QOAjDfbH18ZrMcNSU0Yf+h2iQbbZYYh3yA
         0NXQ2Sw/0cKcNH8nIW2Ig73s11k+Q1XWV9zyulxijyAo/jwCZhvaXKov4Ja/jRK9rzcj
         cva/b11cH2U+wGdUOezUV7vp44Wumjou1AVntG0CvehlacZ2PNsTtls05pYjUUReo2yu
         Pg7dAJbTtNMO2BXP8Nr3jLbpNvCLH82VRbO2jGdZAdkAvGbUegmU9lPAshlPXGNdBF6W
         rpVlrz1W0xVum7lTtiCLJYa4RiWFYE/FB3jwN6Ta9aMJM897tR0PuPfEptH0J34afrpU
         kM1Q==
X-Gm-Message-State: AOJu0Yy2IqmIRnEOImP/kTIq0XkDMmTc0coh+aDBd9LZI1tIFEU44+ZZ
	fYiG0XJHFFIH9l1G8rs7SYK7og==
X-Google-Smtp-Source: AGHT+IECpwe5YSrcecRS0pLk3efPIuPSeHm3VJsRfMbRgoRTYw44FQ9j5OaT1IA1STmp2RnHuiPn6Q==
X-Received: by 2002:adf:e84b:0:b0:336:4d84:9707 with SMTP id d11-20020adfe84b000000b003364d849707mr3173014wrn.146.1702974553561;
        Tue, 19 Dec 2023 00:29:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b87d:537f:7c6:e419? ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d5551000000b003333521a1cesm4127025wrw.57.2023.12.19.00.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 00:29:13 -0800 (PST)
Message-ID: <787d16b8c357e46bc7607339f601ce1293a1e3a5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2] libxcrypt.inc: use alternatives to resolve
 crypt.3 conflict
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <Ross.Burton@arm.com>
Date: Tue, 19 Dec 2023 08:29:12 +0000
In-Reply-To: <7a8e831d-bb7e-4d3d-bda7-ba225e453bb0@windriver.com>
References: <179E2737483C0885.1352@lists.openembedded.org>
	 <179E27474C306557.1352@lists.openembedded.org>
	 <7a8e831d-bb7e-4d3d-bda7-ba225e453bb0@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 08:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192694

On Tue, 2023-12-19 at 12:07 +0800, Changqing Li wrote:
> Kindly ping
>=20
>=20
> And why have this change:
>=20
> In old version of man-pages's README,=C2=A0 it mentioned:
>=20
> Note that sometimes these pages are duplicates of pages also distributed=
=20
> in other
> packages. Be careful not to overwrite more up-to-date versions.
>=20
> So we set man-pages to lower priority,=C2=A0 so the doc in the related=
=20
> packages are used.
>=20
>=20
> And if we delete them from man-pages recipes, it will make man-pages=20
> missing these docs
>=20
> when eg: libcrypt-doc is not installed.
>=20
> in man-pages recipe, ALTERNATIVE_PRIORITY set to 100. So I send an V2 to=
=20
> update
>=20
> ALTERNATIVE_PRIORITY of libcrypt-doc to 200.

Please delete the version from man-pages. Those are only added there if
the upstream doesn't have a man page. libxcrypt does now have this so
the doc isn't needed from there.

I suspect a future version of man-pages will do this anyway.

Cheers,

Richard


