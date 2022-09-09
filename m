Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D85ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 22:54:19 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.398.1662764049275836462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 15:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V8J5E0q9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id b5so5373705wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 15:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=H/HgOUpyOrpVJE4MjSgtcnCeCU7j/h008vq/wnZNOL8=;
        b=V8J5E0q9EtKBP/7InAldyLJKcO5b5UQ/qCgkow2R5FO62PwAarICUGNbj5dwdrN4wt
         +Oiob0g7IW/b2wk9giINsVJ+nQVqOw6LO4/6+azMSoKG0UOtz5Snb35f4IgDsSCKkeUp
         clpSueUAoBuBZNeiMjtgpIuchlEkIkl2ZTqMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=H/HgOUpyOrpVJE4MjSgtcnCeCU7j/h008vq/wnZNOL8=;
        b=zbPB7isfb2TkjPcUsgmydMIMw0ax5J+AqG55dLE8fW4hOgTZwfhYupwFkQNhVHV8Sy
         5ry8k3hCVUQvQO1VY0d36O72FlV1HFSmBvVP5wpVKfQiHo9iGQgm89iBbHXDci8aQ6GE
         Cbu9fAvQLD412kHq8HVbe0vdbfR26sQOeduKTljqFjm9LcUZ1ZIeVeajZckV04w298gN
         K7RXUPElzIrfZrE7dKBvu4xVTphEp8Z4+/8h5rhbjY6zjOlosvTf4B3atL/+86J75S9d
         dCTstEIyHQ/IWKO80IKiUpUEsnU47PzBMfn7m4kNm0qbobRMLVuLeJzLBKLsdmYgCEOp
         X+Ig==
X-Gm-Message-State: ACgBeo0w86tM8yEH8qoE/nJ3XtqMZv4yk/uwM8zi0HASSmeUi20GO2dr
	qbI3FX5ORGVgBQDa/j3p5m/yiQ==
X-Google-Smtp-Source: 
 AA6agR7ihU12AOzcCX4GDl5ryrcXG8bDKy1A/5fhPYpZ6aZG45j3FqyaAqrVvgEgVOqpLua8teB1Kw==
X-Received: by 2002:a05:6000:154e:b0:22a:3177:1985 with SMTP id
 14-20020a056000154e00b0022a31771985mr5571994wry.117.1662764047632;
        Fri, 09 Sep 2022 15:54:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f3f:2c42:74bd:be1a?
 ([2001:8b0:aba:5f3c:3f3f:2c42:74bd:be1a])
        by smtp.gmail.com with ESMTPSA id
 c1-20020a7bc001000000b003a5ffec0b91sm1720804wmb.30.2022.09.09.15.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 15:54:07 -0700 (PDT)
Message-ID: 
 <7dc0b18df66594ddaaaf94f94e4568e14b2a0a34.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Cc: schnitzeltony@gmail.com
Date: Fri, 09 Sep 2022 23:54:05 +0100
In-Reply-To: <20220909163640.1985612-1-ross.burton@arm.com>
References: <20220909163640.1985612-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 22:54:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170509

On Fri, 2022-09-09 at 17:36 +0100, Ross Burton wrote:
> The KDE build uses custom catalogs by setting XML_CATALOG_FILES, so this
> wrapper should not override that value if it has already been set.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/libxml/libxml2_2.9.14.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-co=
re/libxml/libxml2_2.9.14.bb
> index 2b2289e38a6..165c92d4114 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> @@ -121,7 +121,7 @@ do_install:append:class-native () {
>  	# Docs are not needed in the native case
>  	rm ${D}${datadir}/gtk-doc -rf
> =20
> -	create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=3D${sysconfdir}/=
xml/catalog
> +	create_wrapper ${D}${bindir}/xmllint 'XML_CATALOG_FILES=3D${XML_CATALOG=
_FILES:-${sysconfdir}/xml/catalog}'
>  }

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/5823/step=
s/24/logs/stdio

:/

Cheers,

Richard


