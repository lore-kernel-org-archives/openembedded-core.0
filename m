Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF23C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 07:29:49 +0000 (UTC)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9527.1789543779079104501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 00:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VzLIRVGw;
 spf=pass (domain: linaro.org, ip: 74.125.230.76, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso5525591fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 00:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789543777; x=1790148577; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v5JCEEDAANTKA4Vmq5m3k+rarjqwLXfYuLXJISnJGyU=;
        b=VzLIRVGwUqIAuz1fo+LlojSft9Pv2DfDghKwIKhFXfOQk92KATP8rggKlfZJj/qTWP
         sAr9d5bkkKLEAz9RTDRLj0ZExA8amUdCpH7nDmoORPRh0TI7mLuY3HEXZ31mKhERD5Yq
         mkqaY1+jwXL1az/I0LJ4zx6lu6t36x2+Qd2ruEmEW76ucX4LtizO5HgocCvMQZeCOnR7
         fsTZweyfKn0lnbTcEDEN/1nsE0Qm7Kk6ghA7Q1+dnWB7SR5IJgl5ss7JWXS+V482Ek44
         xqUD7cDFsSW6lctvytnvWw4vHBb2SdbwRj3Z080NBYVNSvRviojZThMKwXlbUj4x0x2M
         1+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543777; x=1790148577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5JCEEDAANTKA4Vmq5m3k+rarjqwLXfYuLXJISnJGyU=;
        b=iMSTG3n4CsLHvG6iEVggNWQP2E0fjNJUCAcf7pRiqFJNLG88U2YtFj2DfWbIFuTAFW
         5TRbrYskgnVobPcioBWoM6t1btfePFk7409dEuonplWYMtPs2OuT7Dgi5fFg19hPIDD0
         w6njyr1E6CXT+7hOkqDgQLYQ6yDy4ITvODNI99hzoykHls+ros74Qw7tiw3Oioa5GcmH
         yz6o4SIxnP7p2A+odyJR1YBHQ2mqEpv2z6KQ14MRgAmzzs9YmKhW5EnqNQmTRVMZqABc
         O+nhv091zKAbSoWieQ6t+z336kSvz5ty0/j0hOIbeU7T9evRzP/mZxUl+x3+tdMUAZOJ
         o2Tg==
X-Forwarded-Encrypted: i=1; AKwUvBy9dwAx9Tv1kedBWF+xeSBjAD7q3Gk/Ur3WeNNdXRJmqQZqJERxWuXAUyuSvZwndi1yzR6wekEXFNRm4Z7wDLPP5A==@lists.openembedded.org
X-Gm-Message-State: AFuF++n2rBmYJLgNLJR7ArNmcqxWRX16dEIOhsOOkdHPQC2gJY7Sy5zI
	ryglfBuHKHlZ/QLyJZlevDZScNsT7WamnljT20Z/QYxY9qPeXMl83RnvNs9iOiUVofM=
X-Gm-Gg: AYBFou0iRhu/YVlvtuHGJasx0w2gabXhFbt/4oMbMX2acohiHO7NB9pOvzYupknxLEl
	07MWQaP+l0KTtgYAY+OC8sCP5awLuEhvaeJ9fDWTJR2lO+7AhbxCqE8UYnNj8ftHKfuwJ2clSt6
	F4ihvQg1tAW9vc09OOeJAEWROfDmJhXII9/y3n7TslSugHLs8OHOnDlG3Y3oJe6Y0srBVy9AfcV
	N8htf85s8ibrmnhyofFht+A4uRulVQ9LvYlBsd9vRy26ankzwsB/C40ACBKFN6xr4Ijm9z8kuKY
	jDv6/LPv9mAdZLxBvZCixWtF5VW2yCYyVOTCzxcnSt6oIu+3SAB8fvXhR84pxfQkZYj3F0+UB17
	kj0rCqjlL4vVc1vF8LYZ9c0rZfjGJxKM722sbLRUZOEgl1x6/KcJ975fdjDQCoHKR46E1t1wqH9
	YT4MA5gHYSHE1yDKW3B1uJ0Cw+ABVOcpT6qcsWKfMSAyg25XASKxKedYrIe2ww5w7Af+m8TBJuV
	SMB1wnJPshToIsvZfcU+aEBq1C9/ADBz+Z1
X-Received: by 2002:a2e:a807:0:b0:3a5:db7a:2395 with SMTP id 38308e7fff4ca-3a5dc9cdc4bmr5456201fa.8.1789543776638;
        Wed, 16 Sep 2026 00:29:36 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5daf9fcf4sm4616291fa.21.2026.09.16.00.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:29:36 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:29:34 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta][PATCH 01/02] linux-yocto/6.18: update to
 v6.18.50
Message-ID: <aqpFXlqVacE4TWRh@nuoska>
References: <18D59CE1160E5503.1924412@lists.openembedded.org>
 <CADkTA4PK+tZuCHuBR4ZPahYUYy4QmYEoz85Vv1q34AT70c8mMg@mail.gmail.com>
 <aqo4hfLnicviWL3O@nuoska>
 <DLGK1VZBV39U.7XRHLEI6RC90@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLGK1VZBV39U.7XRHLEI6RC90@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245933

Hi,

On Wed, Sep 16, 2026 at 09:16:46AM +0200, Antonin Godard wrote:
> On Wed Sep 16, 2026 at 8:34 AM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > Hi Bruce,
> >
> > On Tue, Sep 15, 2026 at 05:50:36PM -0400, Bruce Ashfield via lists.openembedded.org wrote:
> >> There's no second patch coming, it went to the yocto list for BSPs!
> >
> > I don't see the yocto-bsp side patch in https://lists.yoctoproject.org/g/poky/messages list
> > archives. Same was with previous kernel update series.
> >
> > Maybe they just went to Richard directly?
> 
> It was sent the yocto list:
> https://lore.kernel.org/r/20260915214911.1095011-1-bruce.ashfield@gmail.com

Right. I can see where the confusion comes from. meta-yocto README.md says
that patches to meta-yocto/meta-poky/meta-yocto-bsp should go to
poky@lists.yoctoproject.org. Maybe yocto@ is a better match and the
docs need to be updated. Not much left of "poky"...

Cheers,

-Mikko

