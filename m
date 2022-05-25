Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BD2C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 09:33:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.4840.1653471203572433906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 02:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JC9WAMRB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id y24so4367392wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=bZpcD7AZnaAQ81nFntz8aobszzlwekWTT1Hp51RfRfw=;
        b=JC9WAMRBNmFxdwgTqEGYLU3VGGLagwrfdBBAzBmS8yows/GlUIkdyXbUj5WVPvf8l9
         Yre5fUSpvPc7hvCIPW/zTNS1O9u53SEQ8NrhhwiefEbgsXWoq06HPR3KrDD2P83FTIHd
         rTluXownWg7vgALWuaEHv4OI41aT7+hhR+Ids=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=bZpcD7AZnaAQ81nFntz8aobszzlwekWTT1Hp51RfRfw=;
        b=ov/HTGsTsm0neYI2HbwuMY10FVWd7lqs6cQvqDEpAWguY4z1W1K6bmN+0dloUFPQTA
         cpvUx/m8DJrJXKP5OfvCaMP/IqpGztjclr1FctRC8M1BYZqpd9/Q+Fj5gryadVVSFwMa
         WpXM3SUY1MiEJJRkFdu+yCZSS9FBg4ts6WJ66X8ldMjQCv5uGrFl/EfzZmMIKJF25gr3
         fqrnuhfM07NTjATmiA9wjWjgXAeKKMzuqOJI1cLhVzzFIOcleCa+K06ZILZa1Vt0Rw65
         3MBueorU4FFw2bvPnptJ+uYBLUziI81YjFgIbUsJpSUh8RV7bOb7dRxH/yCFWidxSrY0
         OxJg==
X-Gm-Message-State: AOAM532Dalv6aoItE6Y4OQuw90zAufwDi3uQREyZS07pd/c+6xahCWH/
	cD24eCtvuow2/PrIkJs8Y4GNLg==
X-Google-Smtp-Source: 
 ABdhPJydiOaGcTibJgDZ1UxxhL/sbRjcb2CBhXSZkAEFAfMXIbYPmrxC1aLcsTCm9zCTe/WMJeovEA==
X-Received: by 2002:a05:600c:3d89:b0:396:fd5d:8934 with SMTP id
 bi9-20020a05600c3d8900b00396fd5d8934mr7242323wmb.161.1653471202014;
        Wed, 25 May 2022 02:33:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:e02b:90d6:3f52?
 ([2001:8b0:aba:5f3c:5808:e02b:90d6:3f52])
        by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b003942a244f53sm1376138wmq.44.2022.05.25.02.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 02:33:21 -0700 (PDT)
Message-ID: 
 <6585ba44a9ef9dd9ef8c0d70ac570f97d8e24bb2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/9] mtd-utils: disable LZO by default
From: richard.purdie@linuxfoundation.org
To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Wed, 25 May 2022 10:33:19 +0100
In-Reply-To: <20220524152401.1663317-3-ross.burton@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
	 <20220524152401.1663317-3-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 09:33:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166109

On Tue, 2022-05-24 at 16:23 +0100, Ross Burton wrote:
> LZO is a fairly obsolete compression format these days, so disable it by
> default.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
> index 3318277477f..8931e870324 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -23,7 +23,7 @@ S =3D "${WORKDIR}/git"
>  # xattr support creates an additional compile-time dependency on acl bec=
ause
>  # the sys/acl.h header is needed. libacl is not needed and thus enabling=
 xattr
>  # regardless whether acl is enabled or disabled in the distro should be =
okay.
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} =
lzo jffs ubifs"
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} =
jffs ubifs"
>  PACKAGECONFIG[lzo] =3D "--with-lzo,--without-lzo,lzo"
>  PACKAGECONFIG[xattr] =3D "--with-xattr,--without-xattr,acl"
>  PACKAGECONFIG[crypto] =3D "--with-crypto,--without-crypto,openssl"

This and kernel compression are the two pieces that worry me a little.
LZO is still probably one of the best speed/size compromises and was
the reason it was added to jffs2. I'm not sure there are many devices
that still use flash directly via jffs2 but this probably still does
have a use there. Obviously it would still be in meta-oe but I'm
worried the "off by default" will catch out a few old BSPs and be a
pain to enable. At lot of this history was paged out in long term
storage!

Cheers,

Richard


