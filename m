Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5C7ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 08:09:32 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.3755.1663142964306092348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rjIG2/AE;
 spf=pass (domain: linaro.org, ip: 209.85.214.177,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pl1-f177.google.com with SMTP id jm11so14316881plb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 01:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4lwwg2wrWBAHPcJOhfTTeKKDQc6pSFVTzWWZp3jkmeg=;
        b=rjIG2/AEuG1CKSYubM6NU3dWe7NhRM5yS8DcBfkSNMYRCMN7xfvBYkLRvR99BgmDKa
         cMSPRJIL3toUOyyEFomLjaCijfvau+u1FqdxI9TeFzROgyN3asV9+hqJGi5oUHkWbfKz
         bal7D07K4BgHSZIVsU0OHthL30Qc7KgZZKEQvi3upeAj6jH66YxEkgPjr0A92GUpiS4R
         lqBzUAKsUcV0G61pOVL/qcj3Olc4RS+NdOsG+3ueoVdsiEiY1KWVvNV7FDRiO0NPHRY+
         d2Yd62i3MGxRU+lNeTyA847lGaVOKSVnBoVwfdm0bQRYXb6zzS1Ywb6o98h9mYOfA2ag
         oozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4lwwg2wrWBAHPcJOhfTTeKKDQc6pSFVTzWWZp3jkmeg=;
        b=zZy18sXrNhyNpFZfS/VbJqMkNDoc1orQ2NDPmgrYWpqx3F5cnT+boxxqQB5ovx9sv5
         ZdkQAZbY4zp7WE92JPFjehUnapO1vmeoz3pIkVkO9vPCK8A2aBJDIh+kw6iY5u7g9uH5
         y5JiceLiKzYvqmHWr4ljuwrFhwWO+k8PaAkuNcTXg1J85eQNm5Q4oPmhSCwku5pjVW/S
         gXVs6AjTp1lryaebq1H9UdC3AaatTT09v3ed3hkqoEFKaUF9Q9dOumi5Ufkzu8pcna8E
         r3TBtwSKGs2r0Y5AAp9h7M8GmdmK/xzg8WLt4xBu1E8N5KkA0hrIVR7WoIfzLKAsWoAC
         Y76w==
X-Gm-Message-State: ACgBeo35fV/+ODpl3CIQnDHfi91nbMhV/4qIZIwFb+vaYeOFqwlN5JpR
	vySHVTNXnUkg9Gi5RXqv+a4T7qI+Q+q4Gn23VoFa4A==
X-Google-Smtp-Source: 
 AA6agR5L5tKMa8DimH8ql//gcHHViDTgDSulKLBo+8tE8ehF4Cxvlp0yE/De77w1RYh1ewMdUVAUD7q2u7cthJw0rEM=
X-Received: by 2002:a17:902:f641:b0:172:9642:1bf1 with SMTP id
 m1-20020a170902f64100b0017296421bf1mr36075156plg.36.1663142963672; Wed, 14
 Sep 2022 01:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
In-Reply-To: 
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Wed, 14 Sep 2022 11:09:26 +0300
Message-ID: 
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 08:09:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170640

Hi,

Found the root cause. As suggested on #pyco too maybe native openssl
was mising legacy support.
It wasn't but loading the on purpose hidden openssl legacy.so was
failing. It is located in
recipe-sysroot-native/usr/lib/ossl-modules/legacy.so and only found
via OPENSSL_MODULES
variable which wasn't set for python3-native users. These custom
variables are set in the native openssl
wrapper script and this also fixes the not found openssl.cnf. Now I
could send a patch which sets
the OPENSSL_CONF, OPENSSL_ENGINES and OPENSSL_MODULES paths for python3
users via python3native.bbclass:

--- a/meta/classes-recipe/python3native.bbclass
+++ b/meta/classes-recipe/python3native.bbclass
@@ -28,3 +28,10 @@ export PYTHONNOUSERSITE = "1"

 # autoconf macros will use their internal default preference otherwise
 export PYTHON
+
+# find openssl under python, see openssl native wrapper
+export OPENSSL_CONF="${STAGING_LIBDIR_NATIVE}/ssl-3/openssl.cnf"
+export SSL_CERT_DIR="${STAGING_LIBDIR_NATIVE}/ssl-3/certs"
+export SSL_CERT_FILE="${STAGING_LIBDIR_NATIVE}/ssl-3/cert.pem"
+export OPENSSL_ENGINES="${STAGING_LIBDIR_NATIVE}/engines-3"
+export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"

but that is still a copy of those variables which openssl recipe owns,
and other users of openssl may
have similar issues. Is there a way to export these for everyone who
depends directly or indirectly
from openssl-native?

Cheers,

-Mikko

On Tue, 13 Sept 2022 at 15:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-09-13 at 14:13 +0300, Mikko Rapeli wrote:
> > On Tue, 13 Sept 2022 at 13:34, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Are you using uninative? I'd have expected glibc and pthreads to come
> > > from there rather than the host.
> >
> > Yes, using uninative, not host libc, sorry. Added full list of
> > openat()'d files to the end of this email, from master branch with
> > this patch applied.
> > Delta to without this patch is just a few python modules. I can't see
> > anything wrong in that list.
>
> It looks correct to me too.
>
> It is weird it is ubuntu 18.04 as we had a lot of problems with the
> rust SDK work specifically on that platform. The problem there was rust
> running things with LD_LIBRARY_PATH set which meant host tools tried to
> use the SDK sysroot libs which then broke in interesting ways. It was
> specific to the form of the version mismatch on 18.04.
>
> I have no idea if there is a connection, your strace output certainly
> suggests not.
> >
> > > > And then in bitbake -c devshell busybox:
> > > >
> > > > # python3 -c  "from OpenSSL import crypto"
> > > >
> > > > I guess there is no way to add a test like that for python3-cryptography-native?
> > >
> > > You could probably put that in do_configure to test it?
> >
> > Yes, on my layer and recipes I can do this. But I'd rather upstream
> > the test to python3-cryprography-native or somewhere else but I guess
> > native recipes don't have selftests or similar.
>
> I was wondering about putting something into upstream recipe...
>
> We do somehow need to get more information about what is breaking here
> :/.
>
> Cheers,
>
> Richard

