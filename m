Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD68C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:32:24 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.11228.1645453942937997560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XJ002Kj8;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id u18so29789551edt.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iqbAl155TtBx0TD29EP3iQwM0MtnWOCLukBQx8yZlw0=;
        b=XJ002Kj8yk5TO+olmQDsqjfWUEYGdIhM9Tdid3sCovdLM9MaXvfxrBvoiV5D7hurNg
         CZMilx/c6XUnkihdtuk5oJw7WNfkmhXyJyg2A/k0v4eQ1FF1dAAbjMoqVCYQQU9E1niG
         Y4vtN3CaUF/73GH0PxwLhHTEPy7Dr0l2vuwlJfvYztSqZ1dSRUZH3PQ2S/t9on3aW4JT
         hE3a804QFycAA72z96ZqX93IT4qYm6YvrybxDLI3x6PlA/vGs753qNDjtziJoINKQOo7
         VmHWPns416hDUTESm++rTEPHAQJnML3VJtRiux/x3qyVRMpmwt961LXX/D6VR1lxG5wt
         RXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iqbAl155TtBx0TD29EP3iQwM0MtnWOCLukBQx8yZlw0=;
        b=DXjeA3sw2I0TcSkCDQz1ONHqd+LIxyenxyu+UHkkXOXWl+9nO4G4kE2Epzuj4Yv8Mq
         Uj9Q6UjwchoN848t9k5gSY5VCk4P/HGMLoJA/u8n7mAuh5hP6rdJ56J9+/qyt8StB5e2
         lcmF30VwqohOACZ9wydc3Z09/7jzh6Hi561OU3mfVbCXz6ylp2zNP1EZB4p4ZC7lQJi2
         NDmmCyefpd9X5WZQtjA0dwX2sIBx0JZB8qOxbiuNMEGWpVeo2snwGE37MnOzE3nLk+qs
         UPaaAhYvyjmIaCMNueLICmhiXw/j6wOdlOOIDQlrxDfucg2+qhJFBIdL9cXQcvYJEmzL
         26SQ==
X-Gm-Message-State: AOAM531k3mc2o3Ds3Dxe5KB+ox5C6UCxqvIq93nC4Q/xZKSveXxNDnza
	TYr1EgS4hqPEyN+XQv/muc0OXM4C5VVoDnHGs9vYrg==
X-Google-Smtp-Source: 
 ABdhPJyCqHFIlWZseg7c9+tPddDlnKdIgzGTFMD+xj7PHppdN7/Ua3bQb/MRsVkaj0brlhWjYyrxwkG/5lWg2x8KC7c=
X-Received: by 2002:a05:6402:190c:b0:408:80a7:ed8a with SMTP id
 e12-20020a056402190c00b0040880a7ed8amr22019949edz.137.1645453941383; Mon, 21
 Feb 2022 06:32:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645452535.git.steve@sakoman.com>
 <b9d88fa46bad2987bd045b0fa98ecde7b42dbb1c.1645452535.git.steve@sakoman.com>
 <AM9PR09MB464250E2C2F58B2AC22BF7C2A83A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB464250E2C2F58B2AC22BF7C2A83A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 21 Feb 2022 04:32:09 -1000
Message-ID: 
 <CAOSpxdYXU2h1xJAruGdHCBDnifC6Cau7h53A1=xyRpwyrcDohQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 20/20] ruby: correctly set native/target
 dependencies
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:32:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162054

On Mon, Feb 21, 2022 at 4:17 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> This patch should be merged without this fix
> https://git.yoctoproject.org/poky/commit/?id=89004bc2480808576582001460e37d98143bf9a3

Thanks for reviewing Konrad!  I will add the above fix before sending
the pull request.

Steve

>
> On 21.02.22 15:14, Steve Sakoman wrote:
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > In particular libffi was missing from native, which
> > led to linking with host libffi instead.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 293c9f879252a814107579542e8fca9af9dde599)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >   meta/recipes-devtools/ruby/ruby.inc | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
> > index 7b6d4edc61..367cd98d09 100644
> > --- a/meta/recipes-devtools/ruby/ruby.inc
> > +++ b/meta/recipes-devtools/ruby/ruby.inc
> > @@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "\
> >       file://LEGAL;md5=2b6d62dc0d608f34d510ca3f428110ec \
> >   "
> >
> > -DEPENDS = "ruby-native zlib openssl libyaml gdbm readline libffi"
> > -DEPENDS_class-native = "openssl-native libyaml-native readline-native zlib-native"
> > +DEPENDS = "zlib openssl libyaml gdbm readline libffi"
> > +DEPENDS_class-target:append = " ruby-native"
> >
> >   SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> >   SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162048): https://lists.openembedded.org/g/openembedded-core/message/162048
> > Mute This Topic: https://lists.openembedded.org/mt/89294107/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

