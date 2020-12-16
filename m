Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.10945.1608136875405407973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 08:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gY+mjNW2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id 91so23813463wrj.7
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 08:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=47k3f2ag/AQbdALsXytdAm2NJ5q6ewAKxjiDdTo8WkQ=;
        b=gY+mjNW2zmxV2jPZJNOzegXkOJzsJ3H/X/aL4YxMJTUSjz5U9C4J+uPDQR5g6p0CRG
         CfK+4P4gE50zEL74MD1W+DL+1nnJMTpCNaUg0KBACCE9DUNGNryqxnABayamOzXLLt58
         kbDyGnuRFT1RX4ZS/9H1pOd94l+K/oQpHF3zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=47k3f2ag/AQbdALsXytdAm2NJ5q6ewAKxjiDdTo8WkQ=;
        b=n36v9L79VCO5LcvgaV883YLyIrn9NQ55hNrHDSg2Rn1dE9yvFu5MKzMa34OcdNMqDl
         BsrP6CiggEvAQRB57u0JnftUgjd9H19m4/32JF9E3tdwjrxN3wGXonv4vjDdsWYbERRa
         Zk3SJcZRFm/pWNS9MszBfwvQUcjClMNUMmnb+qbBTbI8Y+nFcfsv3Pu2RrHox+fyUaOz
         3q2u5EAOGIHVEi6oAn27XpiLAlsvMZg6jowZe0xcXDSb4UbypV/yaYmLecRKPrVw7kxU
         ox5ARu+9iOCfih7EE80V3+I8wolDEMJ6gBDhjaDuxLpLfhzVWvRSCsHRvbU4nLH6bop2
         g07A==
X-Gm-Message-State: AOAM533Eud/KYPW1V4/8QMYhya2i7wBhYLaXxcmfooMFhuBkGvKaACSD
	WdgoQV6ePEEmNveLUBeeFvOHeA==
X-Google-Smtp-Source: ABdhPJwpnlzmDKqhDSDs28WjU0cjqylUVLgg2QF2k2TE1m5tO0MViNyKhv2H+bdG7S4sZ2PYGvMLwg==
X-Received: by 2002:adf:916e:: with SMTP id j101mr39334093wrj.55.1608136873718;
        Wed, 16 Dec 2020 08:41:13 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id y130sm3704386wmc.22.2020.12.16.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 08:41:13 -0800 (PST)
Message-ID: <4c68403b74ca631b1ca2e1c0c11293b7dd4232bd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] iproute2: split ip to individual package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2020 16:41:12 +0000
In-Reply-To: <24b84835-d086-7aec-2f5b-af1313039de6@kernel.org>
References: <20201216024141.22439-1-okaya@kernel.org>
	 <fdfd532cceb2c81874e4a0ac6a9a27014a14808a.camel@linuxfoundation.org>
	 <24b84835-d086-7aec-2f5b-af1313039de6@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-16 at 11:09 -0500, Sinan Kaya wrote:
> On 12/16/2020 6:50 AM, Richard Purdie wrote:
> > > +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> > > @@ -46,10 +46,11 @@ do_install () {
> > >  # The .so files in iproute2-tc are modules, not traditional
> > > libraries
> > >  INSANE_SKIP_${PN}-tc = "dev-so"
> > >  
> > > -PACKAGES =+ "\
> > > +IPROUTE2_PACKAGES =+ "\
> > >      ${PN}-devlink \
> > >      ${PN}-genl \
> > >      ${PN}-ifstat \
> > > +    ${PN}-ip \
> > >      ${PN}-lnstat \
> > >      ${PN}-nstat \
> > >      ${PN}-rtacct \
> > > @@ -58,12 +59,17 @@ PACKAGES =+ "\
> > >      ${PN}-tipc \
> > >  "
> > > 
> > > +PACKAGES += "${IPROUTE2_PACKAGES}"
> > > +PROVIDES += "${IPROUTE2_PACKAGES}"
> > This doesn't look correct. Why do we need to add all the individual
> > package splits to PROVIDES?
> > 
> 
> I want to add iproute2-ip into my IMAGE_INSTALL and not take the rest
> of the iproute2-$foo packages. If I don't add PROVIDES, build stage
> fails saying nobody provides iproute2-ip.

IMAGE_INSTALL is a runtime namespace, the same as RPROVIDES/RDEPENDS,
not PROVIDES/DEPENDS so using iproute2-ip there should be fine.

> > or is there some other reason for this? This is basically the issue
> > with some of the other package splits too, its not using the build
> > time verses runtime namespaces correctly.
> 
> If I misunderstood something or am not doing it right, let me know.

I think IMAGE_INSTALL should work (behind the scenes it adds to
RDEPENDS for the image).

Cheers,

Richard


