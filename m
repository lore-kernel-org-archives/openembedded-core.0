Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CB3ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 10:20:07 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.9974.1663669198364848359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mUZJtv6A;
 spf=pass (domain: linaro.org, ip: 209.85.216.50,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pj1-f50.google.com with SMTP id rt12so50415pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Rx23Xfkr0MgLXKSIfyol6279auGz35YKNLAdXWekeJE=;
        b=mUZJtv6A9B2qMVGAvOvt5O2m+ioIq7vqKag+LZ+MuDkUndoU1/BHRe7GJ+vmX3vNJt
         N0LjyeJ0UNNe/twALhxUXJeLyEHY/jOhYvdYj4h++Q01DEWNlaU7YvSvTFaFyhmlZKfF
         DOZexnLmQ8xSuwVh4C1qHZobFQTyZWvysr13Lvb7sk9rZ+pkt13YyT7QLoBKig7Jujmb
         KvUniJYnKtxd6BlUZIpBsOLw/ZWdhts0i+mBtKbE/SKwS9ZOyzzZV6HyokKt5n0GntlD
         wIGiBdSZ13Uiga/2+PlqshfMsb9oO6wsdtErXWOvmxr9cL/Cu+9sIHKFEHi5Z99lb5v9
         uV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Rx23Xfkr0MgLXKSIfyol6279auGz35YKNLAdXWekeJE=;
        b=g5Miiu+/CHR4z2FU4x3gXJkPlYjCTRcHt8WAIRi3YpJkEZe+kyFSqYd9UH16luLmPe
         QwxDXBs9iTgdYYBfiDryR5fDeda1S1FV3x6YZoFKUDlNRFvBMk+SAv5RhEidfwtgWqlC
         c+jrXN8txMtHMSmeNQ8F1lMxBi9tuP5yIzxVF1BrWsvB5NzcTrgvZA9YYITPRBilMql8
         Q6/tr0XHNchmGL0evjByW8jGlgpCXna5/epK2+LzvGcuImOuadM8IjM0YTQvH5Oww7Rs
         iy+63yH69qR2FszNcjARp+vJwsInZ8rxY57i3VCiq4wwbUFGk2zReyx8tofmVXT9E+1P
         8B4A==
X-Gm-Message-State: ACrzQf2eeAMMuGpURK/1kghM7zpHbpaEVEO1sXhrCFXzHV1n5w++zuzc
	58SGOVysNxw6pw27NYDqsEBaxaZ7oPwT9Fw/KL0VoQ==
X-Google-Smtp-Source: 
 AMsMyM4HVeSK3Q0J592EyZhafmwGVzr1d5TpOQ6+Rw85w1wR0/Qm6WDJvNKMk2I3kdF5+ktG9QhJU6vqopy0TdwJUkQ=
X-Received: by 2002:a17:902:ced0:b0:178:9bd4:b730 with SMTP id
 d16-20020a170902ced000b001789bd4b730mr4197243plg.36.1663669197706; Tue, 20
 Sep 2022 03:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220913093452.47839-1-mikko.rapeli@linaro.org>
 <0d0f3e3d53f675a0edff4e1582b33998288c95e6.camel@linuxfoundation.org>
 <CAJFpGrO=Kd5qTgUQRbzcX3kYuCZKJNayxA6puVXAc_W=ATN6Pg@mail.gmail.com>
 <7a1aa96b6b8883d47234c198992963c25b3ff6cd.camel@linuxfoundation.org>
 <CAJFpGrMqa3hk=QL56zFgZBHiJn173Wocz7a5AH=2a9=Eny1tog@mail.gmail.com>
 <41df899720a40675568c55a571308c9624ef5d2e.camel@linuxfoundation.org>
 <CAJFpGrNM3sqj0o0L3CtNOtiLsq=++sbxun5eGXZHPN+A-oT3Zg@mail.gmail.com>
 <41221D4F-B1B5-4FFF-9F98-E8B4B8A035CB@arm.com>
 <CAJFpGrP11ifFQnK1n3MHvMUaJPwgh6igdav7zotvRQevX70vwg@mail.gmail.com>
 <CA+chaQd5ZYV4jL6jRB-_M9LJuVqp13vHRE5zkueTjjXdp8xWGA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQd5ZYV4jL6jRB-_M9LJuVqp13vHRE5zkueTjjXdp8xWGA@mail.gmail.com>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Tue, 20 Sep 2022 13:20:08 +0300
Message-ID: 
 <CAJFpGrO8nxxovNFPK=cvoARuV=uteB2FxwofM0GMd5ok7aRw6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: workaround broken native
 functionality
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 10:20:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170890

Hi,

I created an issue in openssl about this:

https://github.com/openssl/openssl/issues/19242

Then I have the openssl patches in:

https://github.com/openssl/openssl/compare/master...mikkorapeli-linaro:openssl:relative_paths

The feedback so far is cold in upstream. Yes, the patches are a bit
ugly too, but IMO so are the original code paths in openssl.
I'll follow-up on openssl side if there is anything that could be
improved. Comments and more feedback is welcome.

So what should we do now on oe side? python3-cryptography is
completely broken and users really need to export at least

export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"

or apply https://github.com/openssl/openssl/commit/a10a6c298878cf438cc8c13f5878d97f476eb0d0
to openssl-native.
But that still leaves config files, engines and certificate paths broken.

Cheers,
-Mikko

