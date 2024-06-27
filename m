Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB45C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 13:29:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7895.1719494934808676505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 06:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I3fXLtqF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-425624255f3so8198165e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719494933; x=1720099733; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cPQiSGAuFFZB9zwtvHIAYyTIHLpk8AyE2LDjP1YZRJI=;
        b=I3fXLtqFVE26CLv7du8YLj2LFQ/AiY6QXcNU2V8zyWiK35PF7zRhmPmUBBIxCQ/ZvM
         h+iKM+Bgh1iY6NjAAOe10+jevqt9iM1CK1M8xSXxOE+KVc1VYC3bM1NugMN5W6iPTpgi
         hYOvWsaq5OtTFISRbCbJw/NIuNBmXEPViYfjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719494933; x=1720099733;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPQiSGAuFFZB9zwtvHIAYyTIHLpk8AyE2LDjP1YZRJI=;
        b=qF4k5lC0hiq+KNee0bzmdMS8LXrdtJcxPJhm9OoOiJC2HOMtokll3xPqBXYo1yTSiv
         u7F69nNo8grs2LmO9HN7NS7PnD60xwIWE9uesdb7hHT9vw0m0pxY/tN3kn9QsD68TPmS
         q72npeS3YeQnrV0rTfceMK7MpwxBRVf6Ic/LwmU+I1tGFKgdRr23tek4kaIFyQlkyBI1
         3ZY+fiExgHwGoN1ZCVJTfhnByCsu+FW7tBfaFNYoCYr0TNH0HMW1SgT4vmC2g0pIi3fv
         uPmL2O/+4vMaqDt+P5vQ3aFFbIAL/0I7wSQXGYs1XvZxZLJEmVOz/V5fuAsn0EGTcNZu
         myTQ==
X-Gm-Message-State: AOJu0YwcCA3UhrI4VVtTOE2BB+Pb0OFW2DKtgyu8Dd0Mrxz18izBHgLj
	nTNwMlNzX8ZDxdM4lsQeI8YXFq1szPr+kzd39Wz1aiXGQjW+wyQprzABtS9kLzI=
X-Google-Smtp-Source: AGHT+IGZAb8Z/9tNpm+TbWh74w1xYeV4YCfGFZOgtja3NC4yeEJz59ZftxhbzfqFMD6fYYCogPTviA==
X-Received: by 2002:a05:600c:548c:b0:421:b906:8088 with SMTP id 5b1f17b1804b1-42564292285mr19987125e9.0.1719494933223;
        Thu, 27 Jun 2024 06:28:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:edd1:8c91:3c15:8e70? ([2001:8b0:aba:5f3c:edd1:8c91:3c15:8e70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8424554sm66173785e9.37.2024.06.27.06.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:28:52 -0700 (PDT)
Message-ID: <aac6891416a1c458f3156bbc2ab6e46c2178f1aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.py: Add Requires.private field in
 process_pkgconfig
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Sreejith Ravi <sreejith.ravi087@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2024 14:28:52 +0100
In-Reply-To: <20240627092915d7c0fb2b@mail.local>
References: <20240626140500.1857-1-sreejith.ravi087@gmail.com>
	 <20240627092915d7c0fb2b@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 13:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201203

On Thu, 2024-06-27 at 11:29 +0200, Alexandre Belloni via
lists.openembedded.org wrote:
> I believe this causes the following reproducibility failures:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4998/s=
teps/13/logs/stdio
>=20
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240627-3tye=
ozgn/packages/diff-html/
>=20

This is exposing a problem with the way we're handling python library
functions and their effect or lack of effect on the task hashes.

If you do something like:

bitbake libdrm -S none

then look at=20

bitbake-dumpsig tmp/stamps/core2-64-poky-linux/libdrm/2.4.120.do_package.si=
gdata.*

you'll see:

List of dependencies for variable oe.package.process_pkgconfig is ['PACKAGE=
S', 'PKGDEST', 'SHLIBSDIRS', 'SHLIBSWORKDIR']
List of dependencies for variable package_do_pkgconfig is ['oe.package.proc=
ess_pkgconfig']
Variable package_do_pkgconfig value is     oe.package.process_pkgconfig(pkg=
files, d)
Variable oe.package.process_pkgconfig value is=20

i.e. it knows the function is being used but isn't caching its value.
That was by design but it does mean when you change funcitonality, you
have to manually tweak the tashhash which I'm not sure is a great idea
when put like this.

I'm pondering the best way to improve/fix this.

Cheers,

Richard

