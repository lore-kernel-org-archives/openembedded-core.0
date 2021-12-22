Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915BFC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 10:04:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.17500.1640167480435632428
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 02:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=EfZzaJSb;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id l4so1199948wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hMhJwJ0N+FS69QgRNpq4XfEU0157TE0CkLcbMCmKZ4k=;
        b=EfZzaJSbJf9mEinTrEzw2l6ve0zEOlPk+G5LgG/ozemENfNBayFrbB9bcHuT8pep8h
         WWKtjHJ8gkP+24gB8rcdCIYFXxwy5+PfM855ffhgo2haVrs8UYyuRhloOPuYhUtR1Vu3
         G8AMy2z8LLcPUitP/pwg0rWeO+OLWQS0w7NmSRJ+ysLwrSdUv874qBTCNH1x8Gi6+iAW
         g38MOmET4mqgJWlp3uUbzlQHnjAobXVfnj5d9MeERS9In6EkUfsVMix/FYgS7maWHGMl
         lEJb6U8LSPx1Qr3b02kdSKU0ausC99ZnkdTnjUjHy0sNMo7tS0+aYHTPYzCg/WjNQDUS
         lcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hMhJwJ0N+FS69QgRNpq4XfEU0157TE0CkLcbMCmKZ4k=;
        b=Prl5YuKg1TEH7dXKKFGiTBk9t9jq2EGFFYHqOrOSg8rPHGE+WhnJrD7IdL8DWYn6R3
         u34fGf4AxVKnUWQCs+JdrUJcuBuIDfyfkmHfz47Impb0CG7peLR+2bZFZBsvXzX7dm+x
         0Tt6P/Pck9/lLnD6LGR2/P/EAuRLxh8YUz+6ruMK/wlGobeTXkOsrR8TJLz2sY3A3it/
         mmlLobLkyULbVZog8yaMUPPJ13a088ZHdWLeo4xgZPUjbymWgSQCGRIz2pVrdh59ifYz
         3CCcDXaL9TOYiqJdM0xbpVOgXCdOmrJhywg148ut24t2VPvJcbjgJZVcu9K1zw76MCBn
         PhpQ==
X-Gm-Message-State: AOAM53113Xq7T7XDCyHpdKOqLK46k9GjQP+Vv/AO3us98mMgLbcKKsJx
	fcUbieVxVGK+fUpO+Vn9qlHwQAdUzmsgxaAYJHuKyw==
X-Google-Smtp-Source: 
 ABdhPJw5IJYKKbNrGVAMtZMvugX5QCp2orbe1OHGs1jD4iYD5asVyOIogzn7hVAh15JoGe7kpwx/jBzH/5m4ocyICVI=
X-Received: by 2002:a05:600c:3514:: with SMTP id
 h20mr399964wmq.62.1640167478816;
 Wed, 22 Dec 2021 02:04:38 -0800 (PST)
MIME-Version: 1.0
References: <20211220150347.13577-1-rybczynska@gmail.com>
In-Reply-To: <20211220150347.13577-1-rybczynska@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 22 Dec 2021 10:04:27 +0000
Message-ID: 
 <CAAnfSTuhHstDi2jqPxxL5qF0ktUhoiq9roxs5V2h8ZmmzrYhxA@mail.gmail.com>
Subject: Re: [oe-core][PATCH v2] cve-check: add coverage statistics on recipes
 without CVEs
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 10:04:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159944

On Mon, 20 Dec 2021 at 15:04, Marta Rybczynska <rybczynska@gmail.com> wrote:
> An example entry:
> LAYER: meta
> PACKAGE NAME: libsdl2-native
> PACKAGE VERSION: 2.0.14
> CVES FOUND IN RECIPE: Yes
>     PRODUCT: simple_directmedia_layer (Yes)
>     PRODUCT: sdl (No)

Is this meant to be human-readable or machine-readable?  Currently its
hard for a human to read (uppercase field names, key/value pairs) but
would also be hard to trivially parse.

I'd actually prefer to see an actual machine-readable report (JSON,
for example) that can be extended over time and contains all of the
information available as the current reports are also that half-way
between human and machine readable which is hard for everyone to read.

Ross

