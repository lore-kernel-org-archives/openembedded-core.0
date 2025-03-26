Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208BFC3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 17:36:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.28906.1743010570658619936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 10:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DnxpnhxD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39127512371so33283f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743010569; x=1743615369; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWXyt2uRrEjR9Sgedy7nVF2aHGD4Aa/rrpOfq6e9V5U=;
        b=DnxpnhxDI9Qjp+a0jVS51683aNXKSf0V+5AbZFDnEhQ84GryCovOyFj+ZqOA7iSGf4
         Ieka2vdIO/LTav4YfsTDXqfAxBEI9l+mvo29jXtVVMw1Ky5HJyi46paiPVEJWQWfbPde
         tRdslWJlMeIvI1D8pzZQfBUjwYyAU4OGPlhFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010569; x=1743615369;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xWXyt2uRrEjR9Sgedy7nVF2aHGD4Aa/rrpOfq6e9V5U=;
        b=WOGD7tKHTKADoq2vDnbJ2aHwUc0hSIa51lPdSjaKXCeteKyvcCAtzIC0DCy2iz1JiY
         rQz1p6iU/NtL2iOju9xHOby1nhWHY83rl8q/WGuipxK4huAiSHa26nQ1VvjF/Pn5kWhS
         Xd3YcI4L7v3bQVT+kqj7LhzNmCIYhQleN8PHIokKJyUFwS+BeRo/EBh9Mjwjv0cQ+6du
         HI4xBnyfO0GSk6j/lFzrObbXXUdi+z17DM5IquG5KHpSpwKv4rxZ0sx2oslT66mHYfNg
         S3fW0/yNfpwUU2AkZH1zYjJ+XxVHqEyCxo4ug4OlqKxHKg3wYXdcYAhfIslG3vDtK60L
         AqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTDGiI+qBOF6IKJyvs5DHPtRuDOdURtp4071erZrRxsdiA4MOYBZ7WWxd0LNgSJ8VPiye+gTC1cQg37dgaeTs7sg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywe+DEtDvbe0At/mILnUJ7KFTmlG3XuTO8E5SF62auBCKUQlkRv
	BhLNScY0ZZ5uvwyks96mi+VHRg1J/CxnSBsKEMxs9K4wNjbEVyIQ7+yGvrV35oY=
X-Gm-Gg: ASbGncsA6rqqpLKGpPOQTqhAW2Cc8M/0l3f9eAiI1If0Iw8imfUqng4yTFiRF1tGgGG
	4S20tZBcLkAY16dfg/5Fg0Px8v260m4Wy8LeaUQ0FajEy6mg3HGXe5vkZ37oDnJkkQENLGqp3PX
	XIz4WgK7zH319Oal+v0P+lbYJAF1hOByK71IxOvxQcIMsdDe4Y/CUsUCkUJQF1uy8KNN0+k93cA
	wlkqfYF1TQOtV3k4itDKLBwiBo3OR/J4snggmm7toKWy3XUCFeT6bpDoLvY1eUTTERBlEQiwRMC
	XIh5sFPs4tHHxshzDWWLL+CPanUHOqxjQ7DLK5orFCDY4T/O2f8pK6qlSnp4X9AyKNLW4EAY4Lc
	uelxDF/gQe7cy0l+djRLcsg9D4cEkHpIeNWFgZ2VccFIM
X-Google-Smtp-Source: AGHT+IFm1pWOnllCTXDZbUc6teQiKuFm3HQM7eoID53xmA76HvBPNPrU938D6aJAq7jJwVuV0NkR1Q==
X-Received: by 2002:a05:6000:1889:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-39ad174dfccmr291085f8f.25.1743010568960;
        Wed, 26 Mar 2025 10:36:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fab8:513e:e094:22ef? ([2001:8b0:aba:5f3c:fab8:513e:e094:22ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995789sm17660410f8f.17.2025.03.26.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:36:08 -0700 (PDT)
Message-ID: <f9d967463a92bb2262aee22dc760e2f7b859faf4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perl-ptest: copy xconfig data from perl
 source directory
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rajendra.desai@emerson.com, openembedded-core@lists.openembedded.org
Date: Wed, 26 Mar 2025 17:36:07 +0000
In-Reply-To: <20250325155148.981445-1-rajendra.desai@emerson.com>
References: <20250325155148.981445-1-rajendra.desai@emerson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 17:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213655

On Tue, 2025-03-25 at 21:21 +0530, Rajendra Desai via lists.openembedded.or=
g wrote:
> The following perl ptests:
>=20
> =C2=A0 - dist/ExtUtils-ParseXS/t/001-basic
> =C2=A0 - dist/ExtUtils-ParseXS/t/002-more
> =C2=A0 - dist/ExtUtils-ParseXS/t/003-usage
> =C2=A0 - cpan/ExtUtils-Constant/t/Constant
> =C2=A0 - cpan/ExtUtils-MakeMaker/t/02-xsdynamic
>=20
> are erroring out with:
> > /usr/lib/perl/ptest/perl_langinfo.h:8:10: fatal error:
> xconfig.h: No such file or directory
> > =C2=A0=C2=A0=C2=A0 8 | #include "xconfig.h"
>=20
> xconfig.h contains references to the build host architecture and was
> removed by commit 2e0f30c46802 ("perl: do not install files that contain
> build host specific data")
>=20
> However, it is still included from various other places including these
> tests, and we are still depending on build host architecture data by
> including the patches from perl-cross recipe, a dependency to perl recipe=
.
>=20
> xconfig.h was added back as a copy step in the commit f90922cdeef5
> ("update 5.36.1 -> 5.38.0") but was not added back in perl-ptest include
> file.
>=20
> Borrowed the logic from the above commit to make a copy of config.h
> that is specific to the target architecture. The changes in this commit
> fixes the test failures.
>=20
> Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
> ---
> =C2=A0meta/recipes-devtools/perl/perl-ptest.inc | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)

The patch sounds reasonable but which version of the project was this
patch against? It doesn't seem to apply against master.

Cheers,

Richard

