Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F2CC6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 12:24:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.3989.1663071882397539322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 05:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R0/BHxPq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so13280411wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=l+esPQ+Bq+zx8t+H/VtnQUtHuAxx0h2h+9vpB4Esa7c=;
        b=R0/BHxPqbsbpn9ojj34WVW2JhL0HS5DqmyKtu5oi2iHzjuQP5PbvpkKrL+jmyxGfWr
         KVCc9X3h3bpRuEzdFyb7PjnOOe0q3yMqQhk9866/UbSUyw7UNGRADpQDpSu8EoCWyXta
         DH5Lueekt+jHxuqGigZxifv+fZDUZrW8ntJ7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=l+esPQ+Bq+zx8t+H/VtnQUtHuAxx0h2h+9vpB4Esa7c=;
        b=kUAlMy/8InY/5k+MkQqBVXYQHyoYjzubKCcjaLaZueSmBD8CZ4//8Zmc32pfzlWXm/
         1mEWP9q9QVknhIldCisDvgTPI8TRKij+u02I3PIPfa+QTwR6BO8M2YiN3z9lT1SdwSus
         cOJo1MmMuQXfjzOgkjzBIRikTpbUnG6D28nvy45lOfs3sNGCJpQcc5BRHa2apyqMCgDG
         hCearlGLpK5Bepb+BK6ZwJsVnOMSJ8CN0Wigad4r4ghl9t6ZsICfGhLDg2hM2MXc4nKF
         D39nEZ/NTBGFL/6sMobWevwcY5/dHKIeYWZerH2LJCO4mVouyXDqMtr49l6k5Zsw3iKc
         GTdg==
X-Gm-Message-State: ACgBeo2ZB2iyvsMjrFHwTgUmXN0sZHoT2G5NpN7FyY57VgFslbNXKMb8
	IX3//ITnfCdKwg2IeoQzFFvUFQ==
X-Google-Smtp-Source: 
 AA6agR4rXFHvu7hZELUcxJJxFychSTaGEAZnv+G+WHpXGIRvgwRRn+5OMWBOEdURhqBHRBLfhQLZqA==
X-Received: by 2002:a05:600c:46c6:b0:3b4:61ad:17df with SMTP id
 q6-20020a05600c46c600b003b461ad17dfmr2297646wmo.107.1663071880762;
        Tue, 13 Sep 2022 05:24:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b740:75b6:5b77:5982?
 ([2001:8b0:aba:5f3c:b740:75b6:5b77:5982])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c2cb100b003a5ca627333sm14345501wmc.8.2022.09.13.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:24:40 -0700 (PDT)
Message-ID: 
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken
 native functionality
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2022 13:24:39 +0100
In-Reply-To: 
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
	 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
	 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
	 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
	 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 12:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170574

On Tue, 2022-09-13 at 14:13 +0300, Mikko Rapeli wrote:
> On Tue, 13 Sept 2022 at 13:34, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Are you using uninative? I'd have expected glibc and pthreads to come
> > from there rather than the host.
>=20
> Yes, using uninative, not host libc, sorry. Added full list of
> openat()'d files to the end of this email, from master branch with
> this patch applied.
> Delta to without this patch is just a few python modules. I can't see
> anything wrong in that list.

It looks correct to me too.

It is weird it is ubuntu 18.04 as we had a lot of problems with the
rust SDK work specifically on that platform. The problem there was rust
running things with LD_LIBRARY_PATH set which meant host tools tried to
use the SDK sysroot libs which then broke in interesting ways. It was
specific to the form of the version mismatch on 18.04.

I have no idea if there is a connection, your strace output certainly
suggests not.
>=20
> > > And then in bitbake -c devshell busybox:
> > >=20
> > > # python3 -c  "from OpenSSL import crypto"
> > >=20
> > > I guess there is no way to add a test like that for python3-cryptogra=
phy-native?
> >=20
> > You could probably put that in do_configure to test it?
>=20
> Yes, on my layer and recipes I can do this. But I'd rather upstream
> the test to python3-cryprography-native or somewhere else but I guess
> native recipes don't have selftests or similar.

I was wondering about putting something into upstream recipe...

We do somehow need to get more information about what is breaking here
:/.

Cheers,

Richard

