Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE26C6FA9D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:37:18 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.23786.1677681427540040764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jqzAUTVb;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id m6so17916583lfq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PQoI4lNBUSm7sL+qBdCDsJmRHm7UwfV2qAX7/kib4Eo=;
        b=jqzAUTVb541SLLbuV7m7/O7SCeYKwJqC6xi6T9NdTs0mtF8B4uw6uTLs7HOeSpP7xP
         /Bmxf0WrkG098FruVDqHih8lA8PUMcHHGAdHdok/RV60JjZEPS67iJNfXOEtrFQeiu8q
         Socw+Pp5sJXVJoi4eJpoaf8zYQou9D+ZAwBn9R/8VerLF8nnk4+s/bTrp1GdP0IlSK+Z
         Af4PLKoq9tkUlkPwO1VFFB0Ys8bPD4+DjcRgq5ks2ZbVwjTtmzQiKDE/HL3zbgpFROyh
         WuXJ2jWk+PlAKYWf8MoeZamKFwx81sEbisO0XJ2632AxSyvET7kVmp5iEnMdhc/7np5Z
         2+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQoI4lNBUSm7sL+qBdCDsJmRHm7UwfV2qAX7/kib4Eo=;
        b=YGwn+vS9aZlJerfTn3W9/G9SGR+YlBOfunO65+12r+x1gOPedCd0z+k7RiuEJ3s1gK
         v4QiI9YYjjnlvkOajpFAiz06wVn2BLj9hG7QBJjHCmxOFcXfbdbUte88tCnF0b0CiqGl
         SkuwSakJ0KsKLyIOhw+W1vjrNq9LTppkQ4Cd4e3M1iHpGnBLiakjAkZPklzfy/NDWeyP
         Li6VqNKl/NO+OfqUOko2n45kgQnY9/5rQYeZiFle9tZ/xI7+im5BHGNiblW13KXOmOox
         B8udzdIaFciNaQH7aA0LWLnEHzuZutFkHC1TUskJNS+Tjp4CfflHfzusxMMpy8eqvHMm
         Fzdw==
X-Gm-Message-State: AO0yUKVHKCA77E2u1uwU1zkT9BLR9djdfZL6z44QhpCtj5wNUJWoJXQs
	5a8E35Eo2PYIKxoWE+FKik5umw==
X-Google-Smtp-Source: AK7set+RLUDG0kTCCjuqflqJi/E8BJR5i77EXy2jsboxeYtYUWmfuz6gA0pyzCjW8qpvxNZOf4WZ7A==
X-Received: by 2002:a05:6512:518:b0:4e0:8437:d0c with SMTP id o24-20020a056512051800b004e084370d0cmr1877545lfb.32.1677681425514;
        Wed, 01 Mar 2023 06:37:05 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id c7-20020ac25307000000b004dafe604c2esm1747135lfh.211.2023.03.01.06.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 06:37:05 -0800 (PST)
Date: Wed, 1 Mar 2023 16:37:03 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>,
	openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions: ignore inapplicable
 linux-yocto CVEs
Message-ID: <Y/9jD66h53ssgyg6@nuoska>
References: <20230227110027.804671-1-geoffrey.giry@smile.fr>
 <4b3623567692b08b281fc2157701dfae310c3229.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b3623567692b08b281fc2157701dfae310c3229.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177889

Hi,

On Wed, Mar 01, 2023 at 02:11:19PM +0000, Richard Purdie wrote:
> On Mon, 2023-02-27 at 12:00 +0100, Geoffrey GIRY wrote:
> > Multiple CVE are patched in kernel but appears as active because the NVD
> > database is not up to date.
> > 
> > CVE are ignored if and only if all versions of kernel used by master are patched.
> > 
> > Also ignore CVEs with wrong CPE (applied to kernel but actually are for
> >  another package)
> > 
> > Signed-off-by: Geoffrey GIRY <geoffrey.giry@smile.fr>
> > Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  .../distro/include/cve-extra-exclusions.inc   | 296 ++++++++++++++++++
> >  1 file changed, 296 insertions(+)
> 
> FWIW, with this applied, the list reported by our tooling was reduced
> to:
> 
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-master.txt

I presume this is with 6.1.9 kernel. The data looks better but should
also be compared with
https://github.com/nluedtke/linux_kernel_cves/blob/master/data/6.1/6.1_security.txt
which shows that:

 * CVE-2022-27672 was not found but would be fixed in 6.1.12
 * CVE-2023-26545 was not found but would be fixed in 6.1.13
 * CVE-2022-2196 was found and would be fixed in 6.1.14

For the rest, few were not found in linux_kernel_cves at all for 6.1
kernels, and a few were found with unclear status.

Situation is messy overall, but that is by no means caused by the yocto
side CVE tooling. The CVE database for linux kernel issues is simply not
uptodate for all branches and point releases, and frankly same is true for the
linux_kernel_cves data. "Update to lastest kernel.org LTS branch
release" would be the way to go though...

Cheers,

-Mikko

