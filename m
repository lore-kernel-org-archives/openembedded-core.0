Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6ECC624DA
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 11:06:38 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11579.1771758396351736856
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 03:06:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BVyt0j+q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483703e4b08so27167125e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 03:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771758395; x=1772363195; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zxbg5jDoUurnnoYEf1KxPENJhxEuS5a60aei+3hyZQ=;
        b=BVyt0j+qQXxszWcegk8CgS0HK7tBkssOf049RTzP0IltNVqJuzYuCNLMVJ0KCVfncx
         c7WkljzS2AgxT6F02W9bX+u2mdYjtEPr0iIpdfr1D71vHw9LWyZM68WbvKKi9Ba9Rji+
         e6Q6NYTLGgkiY5RogYJ0is+DRI5W5VU/x8B3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771758395; x=1772363195;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zxbg5jDoUurnnoYEf1KxPENJhxEuS5a60aei+3hyZQ=;
        b=evW+lZztdgXjsyH72pAEIeEaNgDezkEQwoeNOSlqufFci7ZF4YNkGq6zo+3qmMEjHR
         h1jfSZ4ASKN2sCRmi5kFUGxCMuKVM/38DvxPsMjrC4ZUhJjJEU9aIr8U9LNPY5sTRmbx
         9glluZljLcQy+DCzH4gqGTZx127geCEu4qvfTU9YXXi47BtXJabT3eR7wcZGufKClVak
         JKIwbZFc3ddax5HpVgmYnMxwB8OM/FQd3E4jezMTT06QLLoeR2ZbCYrKYWtvNprWaJRy
         OVHlSwXrk9pl7hj70MZOqxXyb7ZweYr+gpEpuKXPYRD5DscpXqRnmVXmsrU1D0LTEb4x
         juZw==
X-Forwarded-Encrypted: i=1; AJvYcCVTk8JK/sDKu1pGQ8w3pz6aRJCgi8Z6W7+tvsy3/IpFe1DlkPAT51ujtKpE0iIxX98ixi6OWyDlpM1ZJ+GM39wyzA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwmnytJT3Mp/p4UCoOiJjMAIfvFm2rGQR+9Lw060WU49BVQWZn+
	uHJx12KKR91u4m9JVcu+kB5yO7JvEBAAPHnGlndf8+XPjzVokYB5Ahy0/0hLQvmsr7c=
X-Gm-Gg: AZuq6aJoYhNmanHxcoTUQSAoZD5rstZD1umFxdOLHQMaMMwC2ulvDOQgYgPejYQREHc
	fKwqllexNGNUz5rQ05KIgS9jMN5qAVekFzPS63RgaHAz/K9dIZHGcStSo80ssOms6yN1e3x+X+f
	A+vlTu9Ium/Op4Z9sA07XrD03mK+vuwOnzGtrlMZZMTN0XY44wdf9+RJIfJ32oTjTtf9lKwYiSj
	hsUXJ34p3qgWrWVWPQ8Ai1IAkiYbnl542uhj/RSwj1b8ioNLCc088DliT46977dWBJX2+/Ib6HB
	YkSU/VSOSJXnm+xj+SEWvPldtwoDEla6NOjEWoYbFYCxm+R78SLYdPyyjyvYhx0vqokXv7qXCT+
	/uvvqAHQOpUXIBuZO0d4tNdDj2z7E6/NyGf5IPqZ6llQJpwBo5JKqKVTn22zcFqeNK1J+VV1a4W
	P1R0hui/wDubzKO47NjZCitv7fPu4x/T3W9y7YVBGVvVMW+drKUGV21X0SFrphP2K/SV/UFf4Gm
	atxfxux08qiVmGIQMWsIbbQYA==
X-Received: by 2002:a05:600d:8446:20b0:483:4b37:8620 with SMTP id 5b1f17b1804b1-483a9d8de00mr58850475e9.10.1771758394650;
        Sun, 22 Feb 2026 03:06:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9947:54dc:f0e6:4b7b? ([2001:8b0:aba:5f3c:9947:54dc:f0e6:4b7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b75e63sm193130135e9.6.2026.02.22.03.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 03:06:34 -0800 (PST)
Message-ID: <8b2e8f05867d2c29c683311a51f402c782e0bfec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/6] conf: Switch to systemd by default and
 simplify init manager selection
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 22 Feb 2026 11:06:33 +0000
In-Reply-To: <DGLC1R76NVAU.1T2H9X9Z8I4J7@bootlin.com>
References: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
	 <DGLC1R76NVAU.1T2H9X9Z8I4J7@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 11:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231627

Hi Mathieu,

On Sun, 2026-02-22 at 09:03 +0100, Mathieu Dubois-Briand wrote:
> We got the following warnings:
>=20
> genericx86-64/build/build/command-1-build-targets.log in /srv/pokybuild/y=
octo-worker/genericx86-64/build/build
> WARNING: Duplicate inclusion for /srv/pokybuild/yocto-worker/genericx86-6=
4/build/layers/openembedded-core/meta/conf/distro/include/no-static-libs.in=
c in /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-co=
re/meta/conf/distro/defaultsetup.conf
> WARNING: Duplicate inclusion for /srv/pokybuild/yocto-worker/genericx86-6=
4/build/layers/openembedded-core/meta/conf/distro/include/security_flags.in=
c in /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-co=
re/meta/conf/distro/defaultsetup.conf
> WARNING: Duplicate inclusion for /srv/pokybuild/yocto-worker/genericx86-6=
4/build/layers/openembedded-core/meta/conf/distro/include/yocto-space-optim=
ize.inc in /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembed=
ded-core/meta/conf/distro/defaultsetup.conf
> WARNING: Duplicate inclusion for /srv/pokybuild/yocto-worker/genericx86-6=
4/build/layers/openembedded-core/meta/conf/distro/include/yocto-uninative.i=
nc in /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-c=
ore/meta/conf/distro/defaultsetup.conf
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3233
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3242
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3274

Sorry, you need:

https://git.yoctoproject.org/meta-yocto/commit/?h=3Dmaster-next&id=3Dabfe67=
3b428084292daa581447df98a62e4e3958

That will leave one warning on oecore-world which we'll need to make a
simple tweak to config.jon on autobuilder-helper for.

Cheers,

Richard

