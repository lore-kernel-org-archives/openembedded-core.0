Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A194AECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:43:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.3926.1663144988316017793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=e8yaZPjc;
 spf=pass (domain: linaro.org, ip: 209.85.216.44,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pj1-f44.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso18249694pjk.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rN0zX5nHXB9fKLNTJOC1exlqmhliX9aObV3wdKyn3nk=;
        b=e8yaZPjcg8INCnp6kk56QdxN6mEUVwnx79c3g5I9dCGnvSsABxTDHLpxpRpoHaCuHG
         N+mMtwbGnssf/PRWppQX3dt/7hc+lJYdSP8MlGGX/Pk4ZsEbamWIOFaN2ch7aemnMd26
         6LtRTPtbVa6NaW+QMRJ2mp4F9bN+ROo+w345bpFKP7RjXBg2hTJtzrKLUhF4G+oUSZ9X
         r8FbQnKgwJ48MLD0/5bzU7/Dp7311a0kyy8EOQwIRQQG7soU6+YNNEUiJbxzl8zsFoaS
         Klm6/9njz32NN07hWc33BEB4GLuNHS369CH+WigRpjaTpMucvBq/X4BxG65O0FdZ6N5y
         GeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rN0zX5nHXB9fKLNTJOC1exlqmhliX9aObV3wdKyn3nk=;
        b=uOG9SgmF0IUNjSHUZ2rpvxsEmF5yONL1wN/aVSO6jrcuAUVBUG1E/qkunACbXtx8xs
         VHdEv6vjKRpZGXvmu8rVxEFNxiaJv8jCIQ1ibwhLmyxusyP/dDXbfSzdZJe06Zsh2NuP
         UpAy20aHmj+61KozU8PN0mCsWc3ZTiDDMmsk2zSZPZCzlCwh8o2jHH6v2qvk7KOkUv+k
         yKXFs4rB+9WtzD8OSeGYOef5+JhHMEwoOb6NxyflSPLuu0gEh2zC6R0hI/2gIDe1P3k0
         FgY1w1QgkFYThw64TtqOSdUaxXf+/AUXZ2UErrRdI0XtXAcfaHURR8gg2w2FxMQV9FTQ
         bn8g==
X-Gm-Message-State: ACgBeo24W9u7jfZq9mNzCl1IZ7WD2D69UdAoQcigaitHloTYPxow7MA+
	L2rBiUuSzKrZpox1NzCK/iOY9CxeX/J8o3pNJV5hFA==
X-Google-Smtp-Source: 
 AA6agR5W3M4znEMaIal3OQrPSwj2XpaRfsfqWdcdX0WMZAt17aF0ZxwptOOZb/1OZibyFlQMeuN9bYkiL5QHPzGOdvY=
X-Received: by 2002:a17:902:f08a:b0:176:b477:8be0 with SMTP id
 p10-20020a170902f08a00b00176b4778be0mr36514995pla.66.1663144987627; Wed, 14
 Sep 2022 01:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
 <CANNYZj8FpujQ+D3xc+g63LMJahyY2NRZK0KQpp2m=L2L9Jadow@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8FpujQ+D3xc+g63LMJahyY2NRZK0KQpp2m=L2L9Jadow@mail.gmail.com>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Wed, 14 Sep 2022 11:43:10 +0300
Message-ID: 
 <CAJFpGrN4DzOqFsq-HLgdonuNuLFKTyb1BKRg=_6btzjjtN+eOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:43:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170644

On Wed, 14 Sept 2022 at 11:19, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> I can only think of patching openssl to pick up a oe-specific
> environment variable pointing to staging_libdir_native - making a
> wrapper for every native binary that sets those variables doesn't seem
> feasible.

Hmm. I'm a bit worried that things like git, subversion, http clients
using openssl shared libraries are
not configured correctly to check certificates.

The default use cases in shared library work, only the legacy module
is tricky to find. But config
and certificate store are tricky.

Basically without the cert paths TLS connections don't verify verify:

# OPENSSL_CONF="" OPENSSL_ENGINES="" OPENSSL_MODULES=""
SSL_CERT_DIR="" SSL_CERT_FILE="" openssl.real s_client -connect
www.google.com:443 < /dev/null | grep ^Verification
depth=2 C = US, O = Google Trust Services LLC, CN = GTS Root R1
verify error:num=20:unable to get local issuer certificate
verify return:1
depth=1 C = US, O = Google Trust Services LLC, CN = GTS CA 1C3
verify return:1
depth=0 CN = www.google.com
verify return:1
DONE
Verification error: unable to get local issuer certificate

With the openssl wrapper and if those variables are set correcty for
the native sysroot paths, then certs get verified:

# openssl s_client -connect www.google.com:443 < /dev/null | grep ^Verification
depth=2 C = US, O = Google Trust Services LLC, CN = GTS Root R1
verify return:1
depth=1 C = US, O = Google Trust Services LLC, CN = GTS CA 1C3
verify return:1
depth=0 CN = www.google.com
verify return:1
DONE
Verification: OK

For example subversion-native doesn't work without the certs and hangs
on the question:

# OPENSSL_CONF="" OPENSSL_ENGINES="" OPENSSL_MODULES=""
SSL_CERT_DIR="" SSL_CERT_FILE="" svn co https://www.google.com
Error validating server certificate for 'https://www.google.com:443':
 - The certificate is not issued by a trusted authority. Use the
   fingerprint to validate the certificate manually!
Certificate information:
 - Hostname: www.google.com
 - Valid: from Aug 29 08:20:19 2022 GMT until Nov 21 08:20:18 2022 GMT
 - Issuer: GTS CA 1C3, Google Trust Services LLC, US
 - Fingerprint: BB:17:2A:6B:F5:43:2C:2B:53:D6:EC:11:21:D3:54:EF:9A:95:19:33
(R)eject, accept (t)emporarily or accept (p)ermanently?

If the openssl variables are set it works:

# set|grep SSL
OPENSSL_CONF=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/ssl-3/openssl.cnf
OPENSSL_ENGINES=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/engines-3
OPENSSL_MODULES=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/ossl-modules
SSL_CERT_DIR=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/ssl-3/certs
SSL_CERT_FILE=/home/builder/poky/build_master/tmp/work/core2-64-poky-linux/busybox/1.35.0-r0/recipe-sysroot-native/usr/lib/ssl-3/cert.pem
# svn co https://www.google.com
svn: E170013: Unable to connect to a repository at URL 'https://www.google.com'
svn: E175015: The HTTP method 'OPTIONS' is not allowed on '/'

Wrappers here and there doesn't seem like a good idea..

Cheers,

-Mikko

