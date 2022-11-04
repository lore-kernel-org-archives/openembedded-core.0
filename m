Return-Path: <chase.qi@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCF2C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 10:16:50 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web09.9489.1667557000428232606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 03:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ldoWYrlU;
 spf=pass (domain: linaro.org, ip: 209.85.166.41, mailfrom: chase.qi@linaro.org)
Received: by mail-io1-f41.google.com with SMTP id p184so3397967iof.11
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLldBuSOqF0VgeYigo3BO/9VFsjADg+U+vK3hjxmdO8=;
        b=ldoWYrlUShwB2ry78qGigYsAjWo2QsJFCD82T0ydijfHslCnxmHN4L5FfyCd2f0Gdj
         SrC+hDClJ5aa6SOYbJk9ZmLSltfCiSWMVtLc+g2veYrHt7NzjAY4bkMGHHx7VKANE746
         shJqHWd2S6f/WPc927+SBHaML4JCs8EsqysQ7Hn+oB+dPL5zI0hFA1Qqv5aXwxQyaOgy
         9umpeq4EbBr/WVe6dzjbKng4R4Y7fYLCXf1QtPsf6cPK/XuvqePe6f33LAzbpXFQYGDQ
         G1bKfuBmAorZH5VPpdZA0ZNVKzs0+wjVpnJo9TyiB//yBZckENzq+pGBGD3x/NheDium
         dEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLldBuSOqF0VgeYigo3BO/9VFsjADg+U+vK3hjxmdO8=;
        b=seoIJ+khSo6K1QgDqqMGZc+26IOn/Rchozh7d1oJf4jsphi/DCBMlUlv7rbjj0VQ55
         IgN2fW5u9T95NY1hs8687Grp3YRNU+/sSp63dr9QP2BviIcC5Cqd9ZlBgHVrjdJCuMtR
         De5c3xiHxsjKlk3O5YN1eiyzNJtPcSBPJQ+YqwkuSWqimDX6NCsEyhXj3Bp2zPOzGISh
         gV/mq7Vsw0DLoA4oZcMU/pjRvF2Ki3mwNgwLqRJUiDgxNvRznTcf/ybSNrAmTA9Jm/Md
         dXCC3YKXrOex1IahHQqAwH0CX+B6tr5REnQtuVLrIw6g2FiNs2tYydzohZwULn6mwE/s
         n7LA==
X-Gm-Message-State: ACrzQf2putnIWe/tlJLjhWQ0wOdmn/vYujam92W2bZaI0CH2khTNwmy5
	Rd92Zd1/T5B+kxQAp4KytZ/MFSNynMG+BJsdBURAAnN4nQmfQmRy4mM=
X-Google-Smtp-Source: AMsMyM48tS+KN7wMdsBd4i1KEuNa0UcWDTbt+eB3whGKzxUUhVMJ49XPAmiMwvhzx/IafI/UqbQcEzfbKQ1pIQh9KFA=
X-Received: by 2002:a02:cb91:0:b0:375:662b:5032 with SMTP id
 u17-20020a02cb91000000b00375662b5032mr14801669jap.219.1667556999592; Fri, 04
 Nov 2022 03:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221103053926.719998-1-chase.qi@linaro.org> <019492FD-CF5A-495F-A76D-4038A4035D52@arm.com>
In-Reply-To: <019492FD-CF5A-495F-A76D-4038A4035D52@arm.com>
From: Chase Qi <chase.qi@linaro.org>
Date: Fri, 4 Nov 2022 18:16:28 +0800
Message-ID: <CACLiBhBpiu6Q9mHaKu5VUbB4c6UZmpjQv8iktAxG_S4RvT6GNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libc-test: add libc testsuite for musl
To: Ross Burton <Ross.Burton@arm.com>
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 10:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172706

Hi Ross,

Thanks for the review.

On Thu, 3 Nov 2022 at 21:51, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 3 Nov 2022, at 05:39, Chase Qi via lists.openembedded.org <chase.qi=3D=
linaro.org@lists.openembedded.org> wrote:
> > +MIRRORS +=3D "git://nsz.repo.hu:49100/repo/libc-test git://repo.or.cz/=
libc-test"
>
> Why do this recipe need a MIRRORS?
>

The main repo looks like a personal repo hosted in a kind of
self-maintained hosting service. It is owned by http://igor2.repo.hu/.
The mirror is the official mirror documented on the wiki
https://wiki.musl-libc.org/libc-test.html. I think it can be helpful
when the main repo is unreachable.

> > +RDEPENDS:${PN}-ptest =3D " \
> > +    bash \
> > +    grep \
> > +    musl \
> > +    packagegroup-core-buildessential \
> > +    sed \
> > +"
> > +
> > +do_install_ptest () {
> > +    cp ${S}/Makefile ${D}${PTEST_PATH}
> > +    cp ${S}/config.mak.def ${D}${PTEST_PATH}/config.mak
> > +    cp -r ${S}/src ${D}${PTEST_PATH}/
> > +}
> > +
> > +# libc-test-ptest depends on empty libc-test.
> > +ALLOW_EMPTY:${PN} =3D "1"
>
> It would be neater if the test suite was installed to libc-test, and libc=
-test-ptest simply contained the run-ptest script. This way the packaging r=
eflects reality and you don=E2=80=99t need to set ALLOW_EMPTY.
>
> Basically: the package contains a test suite, and a ptest harness.  If we=
 ever move from ptest to something else then the libc-test package won=E2=
=80=99t change, just the harness will.
>

+1 Thanks for your proposal. I have submitted v2. Would you please take a l=
ook?

> > +COMPATIBLE_HOST =3D "null"
> > +COMPATIBLE_HOST:libc-musl =3D "(.*)"
>
> Is there any value in running the test suite on glibc?
>

I tried the test suite on glibc. It reported all tests passed, but I
do see errors in the test log. I think it doesn't work well on glibc.
Considering glibc has its own test suite, the
'meta/recipes-core/glibc/glibc-tests_2.36.bb', I think we should start
with musl only.

Thanks,
Chase

> Ross
>

