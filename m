Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.2229.1596013755470520491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 02:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hPVsgCEu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id g10so1711027wmc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NIlmBt211DRdl3lwcbik9Oe32Qe9deGsOBlAfWWfZxc=;
        b=hPVsgCEuec/qVie8o3i54QYCQji+U79dZQCSfrXnrZyibzvUq3joUCcM1dlcmD/7Nq
         mBntV+L9BAkCE5A9SJZiXKjU3SR+EZI0b6jssEAk+wC9cha2MuYYqqgdgr2HJuu9KgER
         IU7RNaqE2SxzlfcSACu8C3mFN6WZRShBHUzOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NIlmBt211DRdl3lwcbik9Oe32Qe9deGsOBlAfWWfZxc=;
        b=KBNDxgLrBMnb9ctYaKK+U+Dg6G/xT3wEahVFTFW8umQXtqustycSsEi7DhHXQuuAzn
         GJIRDBRuYEbZw0Mgordz2cdOM5lNFC5eGi3BEXwwTn7fYPu/nBCegV6YUO+aA3DVollL
         NVPQjd1SY+cRX5cXWamLcV5Yj8ECJv7Nj/5R4vP5VMAza8XPO/Ny+IbVc0t0LYUGCcpZ
         xdspvnV/bOoFiSMvYN4cK7XXcEcuTBnVb/ZgBqRomwkBYuMYUQXov1hzoxWzA2Cox8zZ
         XSgkbVx6oscIWTscOUypQjE5n38G3K6zdus9qFwklFsJMVim6xzxLmZqhOgVADP9RN58
         VYvQ==
X-Gm-Message-State: AOAM5316nzIK4Uuc7LTc0diMvwhAsO1MDf8kmhGEMtu/15Q0o+MVwsS2
	MB/wAugWK095SB6KQsdxh7nPoQ==
X-Google-Smtp-Source: ABdhPJznrLI3edIfBGTimuNKAJy8mhPWZ19UslDEt2IuhOkcuvzXUOIQavKkfpu0Jrvw/2ke9itreA==
X-Received: by 2002:a1c:4b0d:: with SMTP id y13mr7677874wma.6.1596013753393;
        Wed, 29 Jul 2020 02:09:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:20af:3d2:ab93:e15b])
        by smtp.gmail.com with ESMTPSA id i4sm3797020wrw.26.2020.07.29.02.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 02:09:09 -0700 (PDT)
Message-ID: <fb0c6275a8f77cc9f053ff4ba6abfd31428b7124.camel@linuxfoundation.org>
Subject: Re: [OE-core] sdk package_arch and yum
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: douglas.royds@taitradio.com, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2020 10:09:07 +0100
In-Reply-To: <cf22da6d-2a72-15b4-9027-8b81fe3cc264@taitradio.com>
References: <cf22da6d-2a72-15b4-9027-8b81fe3cc264@taitradio.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-29 at 14:33 +1200, Douglas via lists.openembedded.org
wrote:
> I was unable to install my nativesdk packages on CentOS using yum, as
> the package architecture was set to "x86_64_nativesdk". My web-
> digging revealed no work-around I could use for yum.

This is not what the nativesdk packages are intended for. They're there
to allow standalone SDKs to be built or standalone toolsets like
buildtools tarball.

They contain special handling to allow them to be relocated. They're
simply not designed to work with the host's package manager.

> dnf (available in CentOS 8, I believe) supports a --forcearch option,
> and also provides an ignorearch configuration option, though this
> seems an unsatisfactory work-around.
> 
> For the experiment, I forced the sdk package_arch to simply "x86_64",
> and yum cheerfully installed the resulting rpm packages:
> 
> > PACKAGE_ARCH_class-nativesdk = "${SDK_ARCH}"
> > SDK_PACKAGE_ARCHS = "all any noarch ${SDK_ARCH}"
> 
> I have no familiarity with yum. Am I missing something?
> 
> If not, I will propose a patch to create packages with PACKAGE_ARCH =
> x86_64 in the nativesdk case, but I wanted a sanity check before I
> did this work.
> 
> For the record, apt did install the corresponding .deb files,
> cheerfully ignoring the architecture.

Whilst you may be able to force them to install, I'd be very surprised
if the result was usable.

The patch is inappropriate as nativesdk is not designed to work this
way and if you do drop the nativesdk prefix, they'll have a namespace
collision with target packages.

Cheers,

Richard

