Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.12254.1601461366051741517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 03:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DUjsBwrI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id a9so1138834wmm.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vNyt0kgX/4UGZ0ychAh7CU+DNKCJzKkZjsc3VfzQ5gM=;
        b=DUjsBwrIZrh89oz8fmKCdGtAIKoHbchR1nxKeGJ3JFIykLi/zjluFxE6Nd7B/G6ulY
         Fh4NRswNyRs/6IFy/e+bDRoMR1PnhoVl/xTctYtyzQ44nFfxBQUQoEUS2zCXEx0rlxB6
         qvAJuAp9KypIUcaLPgyJAexcMmqMN6UlrThM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vNyt0kgX/4UGZ0ychAh7CU+DNKCJzKkZjsc3VfzQ5gM=;
        b=ke6loHBV1dajecFZM5sHkBsWdme7FeplnYkv905ejNB5fqCB5K3h2xqgo3fB2xKNU4
         4V9ypb8X3TNOUguHh0mnlG0YbDCNLrJKzh6+7uXQPvnr9x2sDxA38DQ7WnYmvrS+Cpgm
         JcRCDxp92ws899iX2IzJX7kAhX8La27vBKh/zoY4GOHIXzOQ9YpspH4ji+A0Yaq7zi1V
         36P/ZjlgjkhgRIPJSBNuPL72M9L0Kg7CdO4wmKwAzRgXCxpnCJdC5ZC8Y5RwAOiyjmKm
         SJ3uLj5N612mGW7j8XmVA5e/x9ghhNk51/vyjwjYuaBIXMrmbZrpUV5+vOQE/cUd5C23
         0Utw==
X-Gm-Message-State: AOAM532qwhra7sMOL5J6OqZ+nRcr6k1waFo2V5kKDexDy41Ov2JjI7Ko
	J84QRy/yEPJG9EXpr2TmSsuYZA==
X-Google-Smtp-Source: ABdhPJw9jq1LbSgzU2fexwwcnrE8x3MvfqoM4yWKtWomBuGr7l5EuM72+W2uivsf6Zm8/jvvjZgjcA==
X-Received: by 2002:a1c:39c4:: with SMTP id g187mr2163522wma.126.1601461364278;
        Wed, 30 Sep 2020 03:22:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id d83sm2109664wmf.23.2020.09.30.03.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 03:22:43 -0700 (PDT)
Message-ID: <1fc2b55903cd1762530f4cd65ba37c7a8e7b8b48.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: generate openssl RSA keys for signing fitimage
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Usama Arif <usama.arif@arm.com>, openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Wed, 30 Sep 2020 11:22:40 +0100
In-Reply-To: <558ac686-dba5-6f51-2b83-a226b5de6a41@arm.com>
References: <20200908122835.38284-1-usama.arif@arm.com>
	 <5e940f933da98f5546c1626e8f2ba0fd7b3c58fa.camel@linuxfoundation.org>
	 <1636CF692A74423D.559@lists.openembedded.org>
	 <558ac686-dba5-6f51-2b83-a226b5de6a41@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-30 at 11:14 +0100, Usama Arif wrote:
> 
> On 21/09/2020 14:24, Usama Arif via lists.openembedded.org wrote:
> > On 21/09/2020 14:03, Richard Purdie wrote:
> > > On Tue, 2020-09-08 at 13:28 +0100, Usama Arif wrote:
> > > > The keys are only generated if they dont exist. The key
> > > > generation can be turned off by setting FIT_GENERATE_KEYS to
> > > > "0".
> > > > The default key length for private keys is 2048 and the default
> > > > format for public key certificate is x.509.
> > > > 
> > > > Signed-off-by: Usama Arif <usama.arif@arm.com>
> > > > ---
> > > >   meta/classes/kernel-fitimage.bbclass | 44
> > > > ++++++++++++++++++++++++++++
> > > >   1 file changed, 44 insertions(+)
> > > 
> > > I'm worried about this as keys are generally something the user
> > > needs
> > > to handle carefully. Making it all "magic" means that a missing
> > > key
> > > might not throw an error when it should and also, someone might
> > > not
> > > save the keys when they might need to.
> > > 
> > To make sure the keys exists, we could check in step 7 of 
> > fitimage_assemble that
> > ${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key 
> > and ${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt exist if 
> > UBOOT_SIGN_ENABLE is set to 1?
> > 
> > > Perhaps this code should need to be explicitly enabled?
> > 
> > By explicitly enable do you mean change the ?= to = in the below
> > line?
> > 
> > FIT_GENERATE_KEYS ?= "${@bb.utils.contains('UBOOT_SIGN_ENABLE',
> > '1', 
> > '1', '0', d)}"
> > 
> > I actually think that keeping ?= is a good idea as users might want
> > to 
> > use some other key not generated by oe-core, so they can choose to 
> > disable FIT_GENERATE_KEYS.
> > 
> > Thanks for the review!
> > Usama
> > 
> 
> Hi,
> 
> Just wanted to check if there were any more review comments or
> anymore 
> comments on above, i.e. would you like me to add a check in step 7
> to 
> make sure the keys exist and do you think its a good idea to use = 
> instead of ?= for setting FIT_GENERTATE_KEYS?

What I meant in my previous reply was setting:

FIT_GENERATE_KEYS ?= "0"

as the default and requiring the user to set it to something else to
enable the key generation.

I'm worried that otherwise, users won't realise keys are being
generated and they won't be managing them appropriately. Keys are
probably something you should be preserving between builds for example?

Cheers,

Richard



