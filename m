Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90C8ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:45:52 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.3939.1663145142447671367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iX69uwao;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id i26so24029319lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3/Vlo7FDpEgtPzar51I5rN3C6uuxYwpdEQ5VQHwUkDg=;
        b=iX69uwaoJ4Ih0gk87yoBeBq9imsKYzrtQCZYPOqoXz9o8iH8RHlJg/ATcvNZPRudGo
         LPgVMPmmTerWHQQzpnEAd6sAta3rZfUU1jY/EkXup5WFHRCvonEz3lGt2E8u0bvuO621
         lv+hjQn2KgDHbSR5TwWkO1Ote03Muz0BkSa91jbNp7OsdYeZLmHexAR1iNQfWy8lzGTY
         8NF5lSLM1GUzbdg/2kJay3g1EQfgwtw63UHJg+t5jyBBMZJbuDE18utvps1/HKd85dvd
         we+oG4gPLdgTEMVhWYQIQf7I7xVaNhrV9gUoTE9Vg2kkMfPeYn2weg9XwwMHYD9nYUqV
         yS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3/Vlo7FDpEgtPzar51I5rN3C6uuxYwpdEQ5VQHwUkDg=;
        b=zLImqitMzDx7dSG1jotLGg0itKVJilxJ77st8+O9GNOixJMG8xbP6BuTc5O02tRbBB
         1hL421S9m/MuzTY8XxRJ5yvVyhQxK/7AEVJ9g/R2u/Zd1kgYmAkaQJ5PuYLW7JaIGikC
         Hkt1zi9m6AvYOAWK07hwp1Ek7nVnKQnwD/swlh9oaxu+96T9wa6W7UrzEVqldQwaR16c
         Au4xmjuKbVkuwx09FSqqSnwXCQlkTvybNz6EJYb1JWHzOhN2UUxIA1Rn77EJAqa7Dn3M
         H1YrowgVfcGOCEd/feji1ElwmlU+JpICCH/LuA7nSwDhTasdbNMCzkA89CbIoQ2jl5gd
         iPcg==
X-Gm-Message-State: ACgBeo3+I6Ejpr1Hb1dKMrU+f2/UZRxn7T9DTuO669RQsTeydNa6VeE1
	zpO/WecKdU9jh/6Hg4Bg1qJIvL1wjYfVhfP2v+JxIiAZYa4=
X-Google-Smtp-Source: 
 AA6agR4SyFL67Ye4cmB+MYz6t1U05cjSglsbv+hGmGVuSSVyl1F+1Rj9Dx7g6T293z0GYRudEiCFatiFBzZBy4kvBeI=
X-Received: by 2002:a05:6512:3091:b0:49a:d800:2828 with SMTP id
 z17-20020a056512309100b0049ad8002828mr4262844lfd.534.1663145140753; Wed, 14
 Sep 2022 01:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
 <CANNYZj8FpujQ+D3xc+g63LMJahyY2NRZK0KQpp2m=L2L9Jadow@mail.gmail.com>
 <CAJFpGrN4DzOqFsq-HLgdonuNuLFKTyb1BKRg=_6btzjjtN+eOg@mail.gmail.com>
In-Reply-To: 
 <CAJFpGrN4DzOqFsq-HLgdonuNuLFKTyb1BKRg=_6btzjjtN+eOg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Sep 2022 10:45:28 +0200
Message-ID: 
 <CANNYZj8AiQ2bEfxk5ujs2H7C+3ER1OQ+hUeXUVnJxZjJ2O3QaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:45:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170645

But I'm not asking to make wrappers. I'm asking to patch openssl code
itself to check for an oe-specific environment variable where it's
making the decision where these things should be looked for. We
already do this with native python.

Alex

On Wed, 14 Sept 2022 at 10:43, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> On Wed, 14 Sept 2022 at 11:19, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > I can only think of patching openssl to pick up a oe-specific
> > environment variable pointing to staging_libdir_native - making a
> > wrapper for every native binary that sets those variables doesn't seem
> > feasible.
>
> Hmm. I'm a bit worried that things like git, subversion, http clients
> using openssl shared libraries are
> not configured correctly to check certificates.
>
> The default use cases in shared library work, only the legacy module
> is tricky to find. But config
> and certificate store are tricky.
>
> Basically without the cert paths TLS connections don't verify verify:
>
> # OPENSSL_CONF="" OPENSSL_ENGINES="" OPENSSL_MODULES=""
> SSL_CERT_DIR="" SSL_CERT_FILE="" openssl.real s_client -connect
> www.google.com:443 < /dev/null | grep ^Verification
> depth=2 C = US, O = Google Trust Services LLC, CN = GTS Root R1
> verify error:num=20:unable to get local issuer certificate
> verify return:1
> depth=1 C = US, O = Google Trust Services LLC, CN = GTS CA 1C3
> verify return:1
> depth=0 CN = www.google.com
> verify return:1
> DONE
> Verification error: unable to get local issuer certificate
>
> With the openssl wrapper and if those variables are set correcty for
> the native sysroot paths, then certs get verified:
>
> # openssl s_client -connect www.google.com:443 < /dev/null | grep ^Verification
> depth=2 C = US, O = Google Trust Services LLC, CN = GTS Root R1
> verify return:1
> depth=1 C = US, O = Google Trust Services LLC, CN = GTS CA 1C3
> verify return:1
> depth=0 CN = www.google.com
> verify return:1
> DONE
> Verification: OK
>
> For example subversion-native doesn't work without the certs and hangs
> on the question:
>
> # OPENSSL_CONF="" OPENSSL_ENGINES="" OPENSSL_MODULES=""
> SSL_CERT_DIR="" SSL_CERT_FILE="" svn co https://www.google.com
> Error validating server certificate for 'https://www.google.com:443':
>  - The certificate is not issued by a trusted authority. Use the
>    fingerprint to validate the certificate manually!
> Certificate information:
>  - Hostname: www.google.com
>  - Valid: from Aug 29 08:20:19 2022 GMT until Nov 21 08:20:18 2022 GMT
>  - Issuer: GTS CA 1C3, Google Trust Services LLC, US
>  - Fingerprint: BB:17:2A:6B:F5:43:2C:2B:53:D6:EC:11:21:D3:54:EF:9A:95:19:33
> (R)eject, accept (t)emporarily or accept (p)ermanently?
>
> If the openssl variables are set it works:
>
> # set|grep SSL
> OPENSSL_CONF=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/ssl-3/openssl.cnf
> OPENSSL_ENGINES=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/engines-3
> OPENSSL_MODULES=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/ossl-modules
> SSL_CERT_DIR=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/ssl-3/certs
> SSL_CERT_FILE=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/ssl-3/cert.pem
> # svn co https://www.google.com
> svn: E170013: Unable to connect to a repository at URL 'https://www.google.com'
> svn: E175015: The HTTP method 'OPTIONS' is not allowed on '/'
>
> Wrappers here and there doesn't seem like a good idea..
>
> Cheers,
>
> -Mikko

