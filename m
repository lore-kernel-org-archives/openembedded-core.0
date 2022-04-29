Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41A2C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 18:17:10 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web12.13703.1651256221265324189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 11:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=B5BT7TEo;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id h8so10559114iov.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 11:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kl9XHUHskSA/sM2LjN4uTcjnHLW59vHYqgOgZxpY6EA=;
        b=B5BT7TEol1RBo4y6MYCL7NQ6084FTNFqjnJErMnGS1HI7WLyF7UwUOT7WK4vqiMXvq
         m4pN0Dx/3xItJnheJyTZQkeGP9knoUErR5JjthZT6GAUaCiHCdqPy5/Hxff2OF/c+lA5
         0WK93EWvk/aUmfiY4c88iyCfhla0dgHY4PiyWVjh7y9z+oROZO+iL2DqXjdZTxDMYktA
         8OlzZ0BKo6yeWmKTQ1xaY4MDkHIwIsGtZNVsPlvi3zu7EUo1DbFM2FkT+pyCop5V9ZYE
         ArIywvMHvWsqjM2Uz/pzHSmcgnAH3NKJrfef0JE3mOweUtpHJXFdgk29qnoX26o0Wrji
         B4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kl9XHUHskSA/sM2LjN4uTcjnHLW59vHYqgOgZxpY6EA=;
        b=bytyJ2w73ilkWqjc3YeiQMs9UMcxTPeluhRcUt/NlzkTPzSb/3gTcClEK9xQXTccuX
         0E/WrXgzqUOZYNsQ0XLy7zcS8Vmb2yEeEVJ1wPaIJpJYICOBeXdJ20fjSI04x6fo1p2J
         nIeoaeusxrRJ7JZmGOJkfTzhZwd1A/ReEcMjAcPzAOtgJhQyDy0Mn6fu59gNv6dxH3hU
         EfvsePuP23u5/D4h0FdRSrHbniC1z4aSx6DqG7IkFhb2tghTDcB02CeuPJZKjXqdfAp4
         CkRAEORXV21ZhXYkt0/Cwj1oXzpS42LkjhgPjAdD1TC/YrUf8H9maGzjKq3PZ3Vik5IO
         E84g==
X-Gm-Message-State: AOAM5324Sdcfv3Qg+WIcsFVnMQGJ45AiDRIEhFyHrmWA1zpFLPUr521O
	7KF/GgiMfMZZl+ydO388jsytHwAn03+QgUTcG6Q=
X-Google-Smtp-Source: 
 ABdhPJzobwIPSl/hbFDgRz2HB5gqH6xb4j+pU1Zq7RpFKD1V6DUk1HASqOUeFCfPi+p5hl6UJrVWj87IbpGskCANcwg=
X-Received: by 2002:a05:6638:12d0:b0:32b:3b37:4712 with SMTP id
 v16-20020a05663812d000b0032b3b374712mr279008jas.54.1651256220545; Fri, 29 Apr
 2022 11:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220419112118.60914-1-peter.marko@siemens.com>
 <AS1PR10MB56979EF202CB2921C9EA4C6AFDFC9@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56979EF202CB2921C9EA4C6AFDFC9@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 29 Apr 2022 08:16:49 -1000
Message-ID: 
 <CAGDS+nkTey6cB9OAFMFYA=uG6SR=pF=xwkay2DXS_dUQQozgrw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] openssl: extract legacy provider module to a
 separate package
To: Peter Marko <peter.marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 18:17:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165054

On Fri, Apr 29, 2022 at 2:27 AM Peter Marko <peter.marko@siemens.com> wrote:
>
> This is important for seamless migration of applications to openssl3.
> In particular poco from meta-oe needs this as packageconfig cannot add rdepends to a sub-package.
> Could this be picked to kirkstone or do I need to send it as new patch?

No need to send a patch, I'll cherry-pick it in my next patch set.

Thanks,

Steve

> > -----Original Message-----
> > From: Marko, Peter <Peter.Marko@siemens.com>
> > Sent: Tuesday, April 19, 2022 13:21
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marko, Peter <Peter.Marko@siemens.com>
> > Subject: [OE-core][PATCH] openssl: extract legacy provider module to a separate package
> >
> > This module contains legacy cipher suites from libcrypto.
> > We should not need to include base package because we want
> >   to use this part of libcrypto.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/recipes-connectivity/openssl/openssl_3.0.2.bb | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb b/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> > index ff2a22c6c3..a809666aa7 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> > @@ -224,7 +224,7 @@ do_install_ptest () {  # file to be installed for both the openssl-bin package and the libcrypto  # package since the openssl-bin package depends on the libcrypto package.
> >
> > -PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
> > +PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-module-legacy"
> >
> >  FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
> >  FILES:libssl = "${libdir}/libssl${SOLIBS}"
> > @@ -235,12 +235,13 @@ FILES:${PN}-engines = "${libdir}/engines-3"
> >  # ${prefix} comes from what we pass into --prefix at configure time (which is used for INSTALLTOP)  FILES:${PN}-engines:append:mingw32:class-nativesdk = " ${prefix}${libdir}/engines-3"
> >  FILES:${PN}-misc = "${libdir}/ssl-3/misc ${bindir}/c_rehash"
> > +FILES:${PN}-ossl-module-legacy = "${libdir}/ossl-modules/legacy.so"
> >  FILES:${PN} =+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
> >  FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
> >
> >  CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
> >
> > -RRECOMMENDS:libcrypto += "openssl-conf"
> > +RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
> >  RDEPENDS:${PN}-misc = "perl"
> >  RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed"
> >
> > --
> > 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165009): https://lists.openembedded.org/g/openembedded-core/message/165009
> Mute This Topic: https://lists.openembedded.org/mt/90559122/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

