Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EA9ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:58:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.3964.1663145890855940824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RazJgxaO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so15006253wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=biQ6d0T53A4/Cxc8kXam5RiG82FpOtWi+gwt0dQDXNQ=;
        b=RazJgxaOMBAYnmhNVSyWahLBxXQogZ0mU0DC0buGO0NakVAEOr6bVeA+UrMb3exijK
         5goW39boV0y2CXsndcyIeM+xryl/KOftWLYO+z9b+72Zus3YULKJZnKpCE7LO5B15CcB
         vz4X6oH/xZU8R139T6gaXC/2JNjpQ7qY4+HIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=biQ6d0T53A4/Cxc8kXam5RiG82FpOtWi+gwt0dQDXNQ=;
        b=EOtiSzlRbx7htN1YOQdYqSS2/B1QXAznuaDGPaQTfwC93+LoXRD9TO1BOT5MVAJdbt
         xjshUA5DuHchz1nL7dx0m7KGCiG6CAvYA1jqMlAy09plMeS0MzqDrOl5+RYoHRaSqJaQ
         39LnDs21goPRjx2LRyHvjOJnIVjCVqVw+Q1oS9cR1mDB1lI5wRwJ8ZoygxldHUAzdlaY
         LRu8p/aANmBLWcRHDyG3kEtbK48s5gsSWTpXLhKDnjxhrbuxZJ//jHf1rV/oqPrDMmxn
         tEqPoOTMokD7JYSDMWq+D89tAyCmVzv4IjTsf3jWuG+w8wIiIbgoH5rL/SvufZ5niVlT
         5CNA==
X-Gm-Message-State: ACgBeo3PJkDhfsoNhOQjfssK6FJUBjgi6o9gPafFbZNnpwIdEbGh5mYx
	zaO3sfF3B2yLBXhX50ZFXXAKOg==
X-Google-Smtp-Source: 
 AA6agR6eaVp7V1TUlqXwZdWl0aM2OgPtUPs9t2wgKey7sRcNuUXsMopV/6mEGrZcBRakN2ib4pflQQ==
X-Received: by 2002:a05:600c:2d09:b0:3b4:7ff0:ae89 with SMTP id
 x9-20020a05600c2d0900b003b47ff0ae89mr2185970wmf.163.1663145889136;
        Wed, 14 Sep 2022 01:58:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7369:4bad:cd2e:7973?
 ([2001:8b0:aba:5f3c:7369:4bad:cd2e:7973])
        by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c038a00b003b2878b9e0dsm15938694wmd.20.2022.09.14.01.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 01:58:08 -0700 (PDT)
Message-ID: 
 <5ec5afd63da50d7bcd823275857dc0da4a2e9ae0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken
 native functionality
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2022 09:58:06 +0100
In-Reply-To: 
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
	 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
	 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
	 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
	 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
	 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
	 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:58:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170649

On Wed, 2022-09-14 at 11:09 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> Found the root cause. As suggested on #pyco too maybe native openssl
> was mising legacy support.
> It wasn't but loading the on purpose hidden openssl legacy.so was
> failing. It is located in
> recipe-sysroot-native/usr/lib/ossl-modules/legacy.so and only found
> via OPENSSL_MODULES
> variable which wasn't set for python3-native users. These custom
> variables are set in the native openssl
> wrapper script and this also fixes the not found openssl.cnf. Now I
> could send a patch which sets
> the OPENSSL_CONF, OPENSSL_ENGINES and OPENSSL_MODULES paths for python3
> users via python3native.bbclass:
>=20
> --- a/meta/classes-recipe/python3native.bbclass
> +++ b/meta/classes-recipe/python3native.bbclass
> @@ -28,3 +28,10 @@ export PYTHONNOUSERSITE =3D "1"
>=20
>  # autoconf macros will use their internal default preference otherwise
>  export PYTHON
> +
> +# find openssl under python, see openssl native wrapper
> +export OPENSSL_CONF=3D"${STAGING_LIBDIR_NATIVE}/ssl-3/openssl.cnf"
> +export SSL_CERT_DIR=3D"${STAGING_LIBDIR_NATIVE}/ssl-3/certs"
> +export SSL_CERT_FILE=3D"${STAGING_LIBDIR_NATIVE}/ssl-3/cert.pem"
> +export OPENSSL_ENGINES=3D"${STAGING_LIBDIR_NATIVE}/engines-3"
> +export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
>=20
> but that is still a copy of those variables which openssl recipe owns,
> and other users of openssl may
> have similar issues. Is there a way to export these for everyone who
> depends directly or indirectly
> from openssl-native?

Thanks for finding the root cause, this definitely helps a lot.

I'm extremely reluctant to add global exports to the system, they have
nasty effects on sstate checksum files and add overhead I'd prefer not
to have.

I wondered if we could patch openssl to code/find the location of these
files relative to the main library? Presumably that code knows where
the library itself is located so searching a relative path from there
might be something upstream might consider? It is a generic approach
which would work for al the variables too.

It is a patch we'd probably consider carrying if necessary but if there
were upstream buyin, that would obviously be much better.

Cheers,

Richard

