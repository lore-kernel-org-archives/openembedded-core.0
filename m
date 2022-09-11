Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E58C6FA83
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 22:21:45 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.1189.1662934896104177451
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 15:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZLBMv12P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so5989079wms.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 15:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=CJqfqtD9sceVBlW408Sur6hc/jBf2c3HR99cTq+XhFY=;
        b=ZLBMv12PVuqTRlg3dqUnqMsOSPaglNnITHf/4/yUONRiZPJAbQ9/+GouH/HvI5/z6Z
         qVt+AmCfmYprBKrA44MW4zrCL5AxTAhY2vX4ww5JDsB5IijKGNKqHIfucOSEmBBR9nf4
         cYsDyGmVkzjX395RBFOgIJq2XQymKPqLRpNCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=CJqfqtD9sceVBlW408Sur6hc/jBf2c3HR99cTq+XhFY=;
        b=vKsvX1a+eeOIZVbJm5L/Hyyl8ucRB7gAAfiE/m2tQXff+LBnjZMyBEsNCrHqkpZ4l3
         p3yI9GWZF3DjfyDsTADU21IIyGxlvzkp/UB7H5loCmxcTUK/uLHfIiRZ4NMUOoVCp60F
         AANk5UTcbaIwiM4h2NL0QebMrGvgvHrEY7rtKFkeJTy4J1qNlIs/hTuUMjiFHARWFuH6
         l6lZ8l2k0KXpoJicfQ72z3LElj3mftiw6yXap2hnD7Ci5Hn6HmETNtQgEfUfh5nC+F0B
         wgBTb1LoCoTCewiIdbl9stv484MNBk5o5KpLtLzH57xCmhrXlMRA6TPo0S7F+diPLtZw
         zogA==
X-Gm-Message-State: ACgBeo0xKrEPZNCgo7nVdRUaMbfriDlyRYeF7KwkBmW5LfsQTCdf8ani
	VeafZhBVuzP4s7QM7x5l4RVwEA==
X-Google-Smtp-Source: 
 AA6agR62W28Ao6POvtYuxVbDbOSedU7gPHLgkW9iaPIXNI0gQgvYZvAyGSEnh2RhISqBIh1lCL7vvw==
X-Received: by 2002:a1c:2743:0:b0:3b3:4066:fa61 with SMTP id
 n64-20020a1c2743000000b003b34066fa61mr9849167wmn.79.1662934894390;
        Sun, 11 Sep 2022 15:21:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba09:b36:cbe7:aaa2?
 ([2001:8b0:aba:5f3c:ba09:b36:cbe7:aaa2])
        by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003b32aa0fabcsm7504591wmm.4.2022.09.11.15.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 15:21:33 -0700 (PDT)
Message-ID: 
 <3ecc273fd91c19a71f3989be831228b4d03c94df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Cc: schnitzeltony@gmail.com
Date: Sun, 11 Sep 2022 23:21:32 +0100
In-Reply-To: <17135317F9CABC3C.4025@lists.openembedded.org>
References: <20220909163640.1985612-1-ross.burton@arm.com>
	 <17135317F9CABC3C.4025@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 22:21:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170522

On Fri, 2022-09-09 at 23:54 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2022-09-09 at 17:36 +0100, Ross Burton wrote:
> > The KDE build uses custom catalogs by setting XML_CATALOG_FILES, so thi=
s
> > wrapper should not override that value if it has already been set.
> >=20
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-core/libxml/libxml2_2.9.14.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-=
core/libxml/libxml2_2.9.14.bb
> > index 2b2289e38a6..165c92d4114 100644
> > --- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
> > +++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> > @@ -121,7 +121,7 @@ do_install:append:class-native () {
> >  	# Docs are not needed in the native case
> >  	rm ${D}${datadir}/gtk-doc -rf
> > =20
> > -	create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=3D${sysconfdir=
}/xml/catalog
> > +	create_wrapper ${D}${bindir}/xmllint 'XML_CATALOG_FILES=3D${XML_CATAL=
OG_FILES:-${sysconfdir}/xml/catalog}'
> >  }
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/5823/st=
eps/24/logs/stdio


Dependency on variable XML_CATALOG_FILES:-/media/build1/poky/build-st-28228=
4/tmp-sstatesamehash/work/x86_64-linux/libxml2-native/2.9.14-r0/recipe-sysr=
oot-native/etc/xml/catalog was added
Dependency on Variable XML_CATALOG_FILES:-/media/build1/poky/build-st-28228=
4/tmp-sstatesamehash2/work/x86_64-linux/libxml2-native/2.9.14-r0/recipe-sys=
root-native/etc/xml/catalog was removed

i.e. it is expanding the variable in the keyname!

Cheers,

Richard


