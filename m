Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C32C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 10:19:26 +0000 (UTC)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35970.1789640365212525750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 03:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FqUWRV6Y;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.228.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9a59so946879a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789640363; x=1790245163; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TV6jpIfG/urjtth/Bdn2+AyfTXv1NfJ/TpnkflJFxIA=;
        b=FqUWRV6YJofMLb8kMAbfBmhxM2OX6HB1dAxj/ix3G/ETpvbe7QLsjeNwnFK769imR9
         DhJjhTh+3rUxnx2IBfMYM5Wk8qy50HcWb1YZNc7mrBi2/fPI0rq8lWeO0/uEIVpiWEpu
         LpaDdcseT2sOVclu+19pSUt2Upd83lYgRk7Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789640363; x=1790245163;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TV6jpIfG/urjtth/Bdn2+AyfTXv1NfJ/TpnkflJFxIA=;
        b=IORS2Hqpf4RlGZdmVuD0HDVPXcRYEeif4W65RVxJY7J0KxoJSEejOv+QtRTWnIZf0s
         p+fwfk+Qa46JcQmBGhy/hzeBqo57R9NUPM6qXMrMpC5hKmwFOWa/ljM98bhmHASa7Se+
         a3AXmcs2aXtei+6/+vh9kFjIOSpopX3S+IxJDRixLGGEoxK93hcppQXEfWjGhW5xkYK6
         Z0tRw+Q2wzTDYVhJrIbQEcRp8psEmBS+IlsrCme277Fx4Pa+P3cfhvg1jHZQDmJcBsro
         rKFWP4cLYIj6j+8yE2L+K7LIfO7W/hLDfeyN3MUljkPh4zE3UB7KaIop1Lcw/1YifXBc
         ygAw==
X-Gm-Message-State: AFuF++kJkdXtaAuo0dsxPKdaXA5lUwXzquFFLAl7/46GTkvZ9eraCsQQ
	MpPsdlwyP/eoPe22sz34ppzSsMObl8Aa+3MhbKL4RnY35vBMMmhuM1+uspbTjyuwg+c=
X-Gm-Gg: AYBFou0IsMafEeMu/fJDyPq+092aLqUSzTayS17bxIW4JG6QpoI6I5ESAHTo8EAvsBl
	aMb1wID6on5uM5dirpH0o0RwsFR7rxvq96q/4xEoEHxkc8jl9hbDMF9HWIyoH7JqYO7xsu71rTt
	zzL9jhyR/LHpQ3BKaXoQTdtch6Fl8lGQCLqQXqZG5JPjfOE9giZiTLXhCa/mzTw32/e6J02EOS4
	bWmFOBUdtdCXdbwMQYJFBFetGS1eAP+5HTE4tzQy4bC2E3xUTqg0Q79W8oljqvqlm7D/X1uxBDQ
	J2sDbmKJSb0YJQO9RNnUE7QF7P+AcYuhbnb0D3t6tqW2K7ZaxKdM9khylpz3ZuhAu9WBBB8BuOJ
	q7Oq6NrUjmy95I2t076pk2kDHFgMisO5JUXjyeurCqRgsj4bUK13pJUteysH+7fB0XXXmiFPyGU
	ikHbW9EeHUMDAarOL+nWbdJfoWguCZlIBWyvcsnTXcNs3KO9y/iMbZ2woB9PRSepJU8bahWeIbb
	wQqwfEzSOCgm0DPCF21FQz7ECe11aUaUIbm2R5hVKvBniT/2kilH4CxLImhD5ImiWK1dDWdmTo=
X-Received: by 2002:a17:907:3e03:b0:c26:19de:9ae1 with SMTP id a640c23a62f3a-c29e5392d85mr438972066b.32.1789640363304;
        Thu, 17 Sep 2026 03:19:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4507:59aa:c79a:ecab? ([2001:8b0:aba:5f3c:4507:59aa:c79a:ecab])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de454b88sm265659466b.20.2026.09.17.03.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 03:19:22 -0700 (PDT)
Message-ID: <ef0bcc916d7d2f0559b6c5fd6de3373b539f01fe.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/6] linux-yocto: cosolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2026 11:19:21 +0100
In-Reply-To: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
References: <20260917051340.1472139-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 10:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246051

Hi Bruce,

On Thu, 2026-09-17 at 01:13 -0400, bruce.ashfield@gmail.com wrote:
> Here's the pending stable updates, one of which I think I sent
> before, but I'm
> resening it to be complete.
>=20
> We also have a fix for the autobuilder issue. I wasn't able to
> reproduce the problem here, but this is a temporary fix until
> upstream merges something.
> It didn't break my existing use case, so let's try it on the AB.
>=20
> I went back to a unified patch series for this one, just to keep us
> on our toes.

Thanks for that. We can run it through a few builds but having one less
source of error noise will be good!

Cheers,

Richard

