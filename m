Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99ACC3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 17:15:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.19658.1673025292109997389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 09:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nia/3iYw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so4022748wmb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 09:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvHnIa0QO/Ypv5DeFokyz+Da6h+yGnxOaVOZnfVS4wE=;
        b=Nia/3iYwvyFU8yWo9rtMdP51UnDzKAvwdnCbqQgrbDUDueRL09JEIeah41mUI0uqw+
         3BHT9FP0fPuQDpz1aJfPB4GdUvSuApHyWOq91SL3sP/PsvmDDtrWJeZ8sNWJw2fLYrBA
         CydratgMi20s2NbVmDzdPA/uriBozAoe36lBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RvHnIa0QO/Ypv5DeFokyz+Da6h+yGnxOaVOZnfVS4wE=;
        b=07wrxgK75MKjBo/d+IcX3079oRcKq/qeGCKP6rTQfq1oQ20183SCyFdfyw7vPxKEJ9
         EyVTi38sSyXHUp+vIAuB+1X/iKdGCbiCCOazXgY83NbkgtqnZeQhWFgGWCLtG+DRSbA/
         cXQweQCtIXmx6cP74kWaLwjHy57RJim5PfHguVN0AcSh2O8Ra97DtFgK0f/AlDeGb7Ex
         iqMfu/ig01gI9kFvjZTfEGDqJG6qxT9p0uv8Q3gk0rIcIEJzAkdzd2FtYWb3f1lJET6S
         CbbefMd8ZN8toK80/7+5lsLVFCn/JyRCOKDiQKt+X3muxkNaS3Y7GR02p2s5+hvLaEib
         GsJQ==
X-Gm-Message-State: AFqh2kosiKwS/W1YEA6SZv/1QqpMrrDk3gUgrqnHHy0l2Ba7y0K1zpFt
	sxgWM8w+mSMNDNpYk/JevMwcWQ==
X-Google-Smtp-Source: AMrXdXuyJ8UrwaJ/012+E7v1XDqjzVgAzgJXPtM8cHnGOGKa5Gz1gyePcPtMazC/CIMoz7Irnv+JTQ==
X-Received: by 2002:a05:600c:1509:b0:3d2:17a5:17fe with SMTP id b9-20020a05600c150900b003d217a517femr40085614wmg.18.1673025290345;
        Fri, 06 Jan 2023 09:14:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:49cf:c46d:e32d:e951? ([2001:8b0:aba:5f3c:49cf:c46d:e32d:e951])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003d974076f13sm2688276wmo.3.2023.01.06.09.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 09:14:49 -0800 (PST)
Message-ID: <d23c3d94a126fa25bd82d5c7dd9e5a0565008068.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] busybox: rm temporary files if do_compile was
 interrupted
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antoningodard@pm.me>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Jan 2023 17:14:49 +0000
In-Reply-To: <20230106170048.2662828-2-antoningodard@pm.me>
References: <20230106170048.2662828-1-antoningodard@pm.me>
	 <20230106170048.2662828-2-antoningodard@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 17:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175604

On Fri, 2023-01-06 at 17:02 +0000, Antonin Godard wrote:
> To avoid working with undeterministic config files, remove all the
> temporary files to start from scratch.
>=20
> Signed-off-by: Antonin Godard <antoningodard@pm.me>
> ---
>  meta/recipes-core/busybox/busybox.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 5dd783aa24..126afb522e 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -155,7 +155,9 @@ do_compile() {
>  		# split the .config into two parts, and make two busybox binaries
>  		if [ -e .config.orig ]; then
>  			# Need to guard again an interrupted do_compile - restore any backup
> +			# and remove temporary files.
>  			cp .config.orig .config
> +			rm -f .config.app.suid .config.app.nosuid .config.disable.apps .confi=
g.nonapps

These latter list of files can probably be removed unconditionally?

Cheers,

Richard


