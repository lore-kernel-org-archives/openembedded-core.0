Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90188ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:19:22 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.3740.1663143557560097149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gvAld7ey;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id s6so12748966lfo.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JTGSwQLzN0ngwHTmozsgrO6eKlKdOCvuU8UlHZz+6jY=;
        b=gvAld7eyVTHCzUD2c88ABvcGliylxF8zi5vhZ9MweUWS6IpBgErwqripJTTdHoYUzq
         ajN8FHDsogqwzCdOvXW+2E7MnlSS459IoaU3emksgoCGxgBWSwY6jina7Gg1mfCKOYwU
         PEKvAqPn3x0+7GB1WOBCXmmiPymveMj1IyUfR8bSBf1Hc+IOwLJMmblcnYUzFXzPQlUE
         /af/M5CWIkTDPsPzAaJ8b+RTKzbZsrpYc2jlpddFasU3DrIRJy/WWtoVzYpTI8f+tCPG
         pSNzm3V+SINhZlcGzeYwlvgJx51+wGuKvjqo3QrZ3NpMw77wBw3HU87ut/xCaAPn7CiB
         kN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JTGSwQLzN0ngwHTmozsgrO6eKlKdOCvuU8UlHZz+6jY=;
        b=e3EpYgbvvM251HbPwFYNMFUijew+g5uZWh4fGhtg0svuKoAsikZNVogVUUD1Je7sEZ
         sSid5V5x0nB7XFqNnM04T0vNENYtO/YnF35ltZw7LbfpjSsjdzytmj6Qr6v9XXOYBsYv
         t5684auCCb85+lP81pgdWIroPnpiJLeGx2GjemNeAzkaBw54Q4znVKig45RMX+Uo0kaL
         sQLHWjNl8b7QFyVLlhpVmzWNF28rnlOX4ZQ6hXg13VxZb3e1Nq/aqxOReGR5TAlDc1G3
         1JutGS95pIt0lD95e8A9qdW2tWldujRLNDhKvh8fzDIn2TuYFs4q5V5b4rwTVt74ZesO
         nbow==
X-Gm-Message-State: ACgBeo37lxEdwx6P4/P0V1Pyd+QxCh76TjdW08Qe0BIcn2BhjqjDSzzd
	W31HARnqyhy3fAcP7SFstVTBAMHrCfIWjm0QlVk=
X-Google-Smtp-Source: 
 AA6agR7jgkeKMMOmvKDNsru4ULWUx37Me+S5laT01L9/PK868n9WNQgID+2IWjgAadJAcrowdVZ5jg5UPT1wTzHjljw=
X-Received: by 2002:a05:6512:10c4:b0:499:4c:64d7 with SMTP id
 k4-20020a05651210c400b00499004c64d7mr7780759lfg.521.1663143555638; Wed, 14
 Sep 2022 01:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
In-Reply-To: 
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Sep 2022 10:19:03 +0200
Message-ID: 
 <CANNYZj8FpujQ+D3xc+g63LMJahyY2NRZK0KQpp2m=L2L9Jadow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:19:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170642

I can only think of patching openssl to pick up a oe-specific
environment variable pointing to staging_libdir_native - making a
wrapper for every native binary that sets those variables doesn't seem
feasible.

Alex

On Wed, 14 Sept 2022 at 10:09, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Hi,
>
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
>
> --- a/meta/classes-recipe/python3native.bbclass
> +++ b/meta/classes-recipe/python3native.bbclass
> @@ -28,3 +28,10 @@ export PYTHONNOUSERSITE = "1"
>
>  # autoconf macros will use their internal default preference otherwise
>  export PYTHON
> +
> +# find openssl under python, see openssl native wrapper
> +export OPENSSL_CONF="${STAGING_LIBDIR_NATIVE}/ssl-3/openssl.cnf"
> +export SSL_CERT_DIR="${STAGING_LIBDIR_NATIVE}/ssl-3/certs"
> +export SSL_CERT_FILE="${STAGING_LIBDIR_NATIVE}/ssl-3/cert.pem"
> +export OPENSSL_ENGINES="${STAGING_LIBDIR_NATIVE}/engines-3"
> +export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
>
> but that is still a copy of those variables which openssl recipe owns,
> and other users of openssl may
> have similar issues. Is there a way to export these for everyone who
> depends directly or indirectly
> from openssl-native?
>
> Cheers,
>
> -Mikko
>
> On Tue, 13 Sept 2022 at 15:24, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2022-09-13 at 14:13 +0300, Mikko Rapeli wrote:
> > > On Tue, 13 Sept 2022 at 13:34, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > Are you using uninative? I'd have expected glibc and pthreads to come
> > > > from there rather than the host.
> > >
> > > Yes, using uninative, not host libc, sorry. Added full list of
> > > openat()'d files to the end of this email, from master branch with
> > > this patch applied.
> > > Delta to without this patch is just a few python modules. I can't see
> > > anything wrong in that list.
> >
> > It looks correct to me too.
> >
> > It is weird it is ubuntu 18.04 as we had a lot of problems with the
> > rust SDK work specifically on that platform. The problem there was rust
> > running things with LD_LIBRARY_PATH set which meant host tools tried to
> > use the SDK sysroot libs which then broke in interesting ways. It was
> > specific to the form of the version mismatch on 18.04.
> >
> > I have no idea if there is a connection, your strace output certainly
> > suggests not.
> > >
> > > > > And then in bitbake -c devshell busybox:
> > > > >
> > > > > # python3 -c  "from OpenSSL import crypto"
> > > > >
> > > > > I guess there is no way to add a test like that for python3-cryptography-native?
> > > >
> > > > You could probably put that in do_configure to test it?
> > >
> > > Yes, on my layer and recipes I can do this. But I'd rather upstream
> > > the test to python3-cryprography-native or somewhere else but I guess
> > > native recipes don't have selftests or similar.
> >
> > I was wondering about putting something into upstream recipe...
> >
> > We do somehow need to get more information about what is breaking here
> > :/.
> >
> > Cheers,
> >
> > Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170640): https://lists.openembedded.org/g/openembedded-core/message/170640
> Mute This Topic: https://lists.openembedded.org/mt/93651845/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

