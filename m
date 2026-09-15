Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB54DC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 21:23:54 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1094.1789507415202182353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 14:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZQlRcy/t;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso1828945e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789507413; x=1790112213; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x4qA4Y6jMLAxFSe1lhYkJXLL3rB7OoURNNdGTE+Q+cM=;
        b=ZQlRcy/tvDzHHcEQZIS9rmfg76Bw6brJrH4aGRZOdytS//vguP1ajU7AnXV0S6VDug
         FJXisLfXQIzLVRgfT7jhAiHovABUHC0M6QPaGMxM4vvzwLzvAD7HHMx8lJVoqGqHW1ob
         fQqp1pNunGceyLXS4FDY81VSU2YEHfHs5dIkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789507413; x=1790112213;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4qA4Y6jMLAxFSe1lhYkJXLL3rB7OoURNNdGTE+Q+cM=;
        b=YxTCUwD/5lwDfVcqSNcIpM+9nilE8MLXgDFCYjMhJ1rkxBapzyUGC4H1kvF9JVuVF2
         ndr/kYn5K/3PH1zpttrPgsj2M+9EimXhQ6BMPTBtlTM4ssZAteZm/W7ulxSlpTNBBZtq
         j/iFhEgFHzbhwejKTea581via8qKBR5aL1PDlAm9J3cWcvYnMvzsTcNQvSOfjpcro/qt
         17TMsP3gijZAlreXfLPsl2fb1GPlze2NlDI5rmouz7V7FiiOrbQuGqS4WJadRsu8D/yt
         t0fpNhin81dLSMsX/ZdCyJayriXM0QkRkRNuQe2M03MoMWpBv5MASqx+/fcVW8s8vC7T
         OIfw==
X-Forwarded-Encrypted: i=1; AKwUvBxyhxn3kljPXUrhmrIaJa2vEImdeywbvot2dFlgiiRZhWIio0hTcD5mCr/PXZEvlavYTnns+1NRBrMZJzU2FNOPIA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lvvIBdmqs4IJnPqM9zng0nDkDaQpIplXTiAZV5RBWWn5Hi1UWi
	+ow0mmacufqxf2VTNXva3sBq1ELk/OClP97L+I+DhbKMuFNymbqvE91vqaMNZSTLabg=
X-Gm-Gg: AYBFou1joDxFAmfFEsMRzGU9jexd2gdCHDiqzZ07QndUTnQ6MTST6uNa5b4QilYTCNp
	41BHq+8zwKyOpezWUAkba9L9opx4dvoBiQLmpuZigBBwB7XPHtDvopbcR+4bC6kL4nx03nKmHNG
	zf8EyfMqnXt14ckm6cB5viSiLbfv+8bD4EXA0cKWHFSA2GnUGtn3gEyy5Rg20cP4Onj43HkLv6c
	h3AwJSMfwdYQ1X9rqequ830XKxuwzH5jCl9qS7T/dz6KFnMSvJA65hRa+cKUNnWWTkH3HHxDeat
	WWqBO7o6ZONHL95ordxWiO43uSuhViymtFlluYEjlIV1VM/uNWsDXnzWU+HOJ+esLXmU5zfqX5U
	7AEN6WN9gR2CcWnlZACBdqWJN/iHjzwYb0q2jhlgYiyWpdohwSAswC/Y/cycV4BiKOXYmWqqOqc
	odRBmxJrKCuDuEipM9ggmrhp+36cQyMniKMB5PnLe5XwxKvxPkAROLVe2HVYBCjbjC7ztrX/gBI
	+ARzOy6FocydNzivJ01y2zQmiNy4/o8EIIkTslgVNTbbjknU1v8/vFqPt9YDg==
X-Received: by 2002:a05:600c:698e:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49e7a638778mr206422065e9.3.1789507413425;
        Tue, 15 Sep 2026 14:23:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8a6f:78a6:4575:a18? ([2001:8b0:aba:5f3c:8a6f:78a6:4575:a18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d10940sm18410565e9.1.2026.09.15.14.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:23:32 -0700 (PDT)
Message-ID: <dea392b2a2fa69238156e1400b535677d51e3509.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] tiff: add ptest support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: randy.macleod@windriver.com, Himani Ramesh Barde	
 <HimaniRamesh.Barde@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Shiva Komati <Shiva.Komati@windriver.com>, Ross Burton
 <ross.burton@arm.com>
Date: Tue, 15 Sep 2026 22:23:31 +0100
In-Reply-To: <0e241da6-c332-4965-8f99-14f9c3469701@windriver.com>
References: <20260915073620.2271352-1-HimaniRamesh.Barde@windriver.com>
	 <0e241da6-c332-4965-8f99-14f9c3469701@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 21:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245905

On Tue, 2026-09-15 at 17:19 -0400, Randy MacLeod via lists.openembedded.org=
 wrote:
> > buildpaths QA is skipped for the -ptest package since the compiled test
> > binaries legitimately embed build paths.
>=20
>=20
> =C2=A0Well, maybe not legitimately but we haven't yet demanded that the p=
test code be reproducbile AFAIK.

ptests in core are all reproducible and this will fail on the
autobuilder. This needs to be fixed somehow.

Cheers,

Richard



