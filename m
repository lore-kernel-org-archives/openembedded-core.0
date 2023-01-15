Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E048C63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 15:09:10 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.141743.1673795339850430039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 07:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dRcaoNET;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id t5so20852504wrq.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqJjkSyjMupeqgxphRvshfBrFAIve0hy8agBLz+puAg=;
        b=dRcaoNETWS1yCpIp9BYoiSlGga449dRixEaJlEV/CyWF4dSqZ/XJWlhPQqTEJHW8TN
         ku54vmp55uesgoEqW66W/aJCbnkjIWMJgzaYyiq/YH2MlzfgUrSlz6SZUqXPpfrznu3h
         msKiEjBr624Hm0QbtHnc4vGG48C/Skf0LWH/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vqJjkSyjMupeqgxphRvshfBrFAIve0hy8agBLz+puAg=;
        b=tcQ1jiYcDVyX8ToNIng9XDRBDRgrWgq+EV3nUlkFGvyZTbksswa95SAaYEbpO/8BMp
         904pnE7F9jJBMdHKOeYlBWgV3QfO48gCuU/Z2TWukyJ1w+eYam0Aa/oFN6+Wk1F8vhoI
         w1FLwIFot23OHdoQRqda8MrdycUE2T9yKb+Ea3ZGPA1VGSTDqc5+WrxQeQnV1nnAzBGP
         JVCLWLxm0T/mDLDFeBl5eYoVpJiRQQODUy6mHUl0nJJ+kJNvsIkxxcDboL3JeCnOGChf
         ltyfgs6ffYRHL2ritECvLcBUnSrtGC4KcZTeu7aSlRaLhWAw/py9lLq+9Q1O7Ls0wHzz
         bJSw==
X-Gm-Message-State: AFqh2kozYY66AOrUCrNdaBNNoD0WFEkaplV9cq2ongicGrs33vLLer8a
	lJe5E97bTGuzqTsjUShvV7d1Wg==
X-Google-Smtp-Source: AMrXdXvQxZQGW3L89Ui8e9WEla/o+NlQhxBzBJn3DOMi2HVe3otjPONr84kideQtYySiJeC/qHhR3A==
X-Received: by 2002:a05:6000:18d1:b0:242:1f46:fb8c with SMTP id w17-20020a05600018d100b002421f46fb8cmr54848581wrq.41.1673795338167;
        Sun, 15 Jan 2023 07:08:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c753:75fb:9583:e5c6? ([2001:8b0:aba:5f3c:c753:75fb:9583:e5c6])
        by smtp.gmail.com with ESMTPSA id k5-20020adfd845000000b002bdd96d88b4sm8585649wrl.75.2023.01.15.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 07:08:57 -0800 (PST)
Message-ID: <76323aa4a372a29c19bcb7baee5ea24b3afb2b73.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2] gstreamer1.0-plugins-good: Fix libsoup
 runtime dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Hochstein <tom.hochstein@nxp.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 15 Jan 2023 15:08:56 +0000
In-Reply-To: <20230114234936.2242153-1-tom.hochstein@nxp.com>
References: <20230114234936.2242153-1-tom.hochstein@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 15:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175886

On Sat, 2023-01-14 at 17:49 -0600, Tom Hochstein wrote:
> The runtime dependency on libsoup set via PACKAGECONFIG does not work.
> The problem is the dependency is placed on the main package, but the
> soup package has no dependency on the main package.
>=20
> I considered modifying the call to do_split_packages from
> gstreamer1.0-plugins-packaging.inc, changing extra_depends from '' to
> None:
>=20
> ```
>     extra_depends  -- extra runtime dependencies (RDEPENDS) to be set for
>                       all packages. The default value of None causes a
>                       dependency on the main package (${PN}) - if you do
>                       not want this, pass '' for this parameter.
> ```
>=20
> However, the problem with this solution is that it does add the runtime
> dependency to _all_ such split packages.
>=20
> So, fix the problem with an explicit runtime dependency.
>=20
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-good_1.20.5.bb      | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Better but there are still multilib issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/6551
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6425

Cheers,

Richard

