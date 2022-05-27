Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B39C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 09:13:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.1668.1653642785353975932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 02:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AK6B7JvM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id z15so5042907wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=fTzdl0HzTurP47t5yDjtC2C2Yu45HgpuKpOZWhL82Ik=;
        b=AK6B7JvMI+HamTrZpYqBvzSDEQ3iZ7Y3+M01UoMdGKNDmndAePJzyz0XqCCaRbZJw+
         B+bLAHpDaTZwCDr2pekRAfwRUWSb8zjDuBytE5QviJiqa9pWgsV0HYNNohpQU5JB27xd
         u7dLRf1kJhVkYW45Wcg/7aQxLIW2mmJU8DyH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=fTzdl0HzTurP47t5yDjtC2C2Yu45HgpuKpOZWhL82Ik=;
        b=ag+8Kw7mkLtmKfZJ2Wvj70WbKxcKlppKhlLz4KXaS6EkaM9ujAQuAHJEBFPPtV4xV3
         Dgs3ydjwkszpD4SetFRiQfhvUSwDq7VfSrnP52tNCmNbIJrYJK9HVNbLeqBAKRsCCu4M
         iGSMaGyy0GhoUxKKZepJQcHlTklkO0MH0h/zD2IjCPed9bs2mOBeibKZhwmkMgC/olGO
         6nGJ3AQq8IhxMikVk98eRAfHbqPyjUvKjiEwp1U23UQSGLBMKOISWlwFM4q0NF73R2YO
         CTIlC8B9JkBFbxMrWWSSJ7X2wEBp/ij9fyaS5Knm+lMfKXJ2dwvwQhw+pWp4CBeKAhhS
         qLTA==
X-Gm-Message-State: AOAM5323eT25R3caxMX9p0dvQVj2rwDdnWFCbnIcrnSlc/EOlrGhzO7e
	TLKXFam6MkcHZRPDYYAznK6daA==
X-Google-Smtp-Source: 
 ABdhPJxkmzdqWgVJEWT/IWoHz8F3207PguB6Sz+835F2fMmH/Jkv5E2eZv3p8SnAgDsurg2yS2KY4g==
X-Received: by 2002:a5d:4488:0:b0:210:e15:b199 with SMTP id
 j8-20020a5d4488000000b002100e15b199mr5060891wrq.321.1653642783578;
        Fri, 27 May 2022 02:13:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6a82:36c1:b105:e682?
 ([2001:8b0:aba:5f3c:6a82:36c1:b105:e682])
        by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b003973a3fe4fasm1575550wmq.42.2022.05.27.02.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 02:13:03 -0700 (PDT)
Message-ID: 
 <1da31a89d51503ae233f426b185aefefd0f48446.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] archiver: exit to avoid race conditions
From: richard.purdie@linuxfoundation.org
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Fri, 27 May 2022 10:13:02 +0100
In-Reply-To: <20220527082923.3652488-1-jose.quaresma@foundries.io>
References: <20220527082923.3652488-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 09:13:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166205

On Fri, 2022-05-27 at 09:29 +0100, Jose Quaresma wrote:
> The archiver doesn't support using multiconfig sharing the same TMPDIR
> so rise an error when we have something that shouldn't exist.
>=20
> When in the multiconfig and using the same TMPDIR: the two machines can m=
ake
> the same copy at the same time to the same destination, which will not wo=
rk.
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes/archiver.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index c19c770d11..5514e44a78 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -486,6 +486,8 @@ python do_unpack_and_patch() {
>      if d.getVarFlag('ARCHIVER_MODE', 'diff') =3D=3D '1':
>          src =3D d.getVar('S').rstrip('/')
>          src_orig =3D '%s.orig' % src
> +        if os.path.isdir(src_orig):
> +            bb.error("A previous copy of the original source already exi=
st '%s'" % src_orig)
>          oe.path.copytree(src, src_orig)
> =20
>      if bb.data.inherits_class('dos2unix', d):

I suspect we need to make archiver hard error if multiconfig is being
used in that case. This can work around some subset of the races
but=C2=A0could also still result in broken trees of files :(

I'd also note that the patch will still break since bb.error doesn't
actually exit, it just prints an error and causes the task to fail. You
probably meant bb.fatal().

Cheers,

Richard


