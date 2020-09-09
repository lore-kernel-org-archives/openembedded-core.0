Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.9324.1599641243006263071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NG5hpXLq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id y15so1514531wmi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 01:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=IU6iwsJUZK77BD3OdtjeTl+5YDCILmHuFKB5mUCURcM=;
        b=NG5hpXLqgVeGSi2GW3ySICrSStUOkdX0G3ul7pq/GOCXfQHeovOaaO/fMiDm+eXMYC
         fKWqbU9mRSRHZFvVUdj6DCpdj+NpW5LNBWOj6Qkfw5o0LMMi775+cnXkxi7W1HlEQKPr
         iufE+4zk9U1ZVyvbTTfgkFo+pbLhLCDMrb7pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IU6iwsJUZK77BD3OdtjeTl+5YDCILmHuFKB5mUCURcM=;
        b=Ls7YaBpOnwQmhLrKDY7BJI163UxGD1Im+FtEzkHYgmOShaXasWXsyNlS79hUoZmbiB
         Y8H9+w5HUkS4waU8ZWfjNoH+lpvRoNtMK3zAUEZHZfEPKMaSfQwZGrR9vq6eqWAz7wKr
         ztQP/6vznCiNSXErAoHtLpFQicGwZSeFTFdddsIMhrp6UA6rjfiMEsVNyh+zOx1vcMTG
         DgbKn5TILEuUk0Es+P8VESUeIfADXTTQsZ8Xgli9wRIUbzROjyJ2sny/6c4A3KBpdyBE
         jG7AuU3n6I2ksFr899FxEBasEX1LWdcrFuhskpZ86HZC2Rtbo/U+4ydKm63YdHxifGWw
         1uWg==
X-Gm-Message-State: AOAM531fSbo3i6R2kpFK94s4Qz5Z4Wa3jRAweW3Ndrh6Z85Vk3DDFab2
	Ar1eCvIeVtV9bOwY3DEQRiSj1g==
X-Google-Smtp-Source: ABdhPJxDltiWuM+qZcZG/03slUL66KE+Rbdui6jn9mu3Fa0MB1n46TnaKYoTWMgubgM/ZYbOWnPKQg==
X-Received: by 2002:a1c:a707:: with SMTP id q7mr2642972wme.152.1599641241449;
        Wed, 09 Sep 2020 01:47:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id i6sm3536180wra.1.2020.09.09.01.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 01:47:20 -0700 (PDT)
Message-ID: <cdc8f6a2df6c531e0e7c67414bcc03c6a76da6d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [zeus][PATCH 00/11] zeus review request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 09 Sep 2020 09:47:17 +0100
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-09 at 16:11 +0800, Anuj Mittal wrote:
> A set of CVE fixes for zeus. Please review.
> 
> I have rebased these on top of current zeus-next and have run the
> entire
> set through autobuilder using the contrib/rpurdie/zeus helper
> branch. 
> 
> There's one failure while compiling acl (for reproducibility
> test) which probably happened because of memory availability and is
> unrelated:
> 
> > make: *** read jobs pipe: Resource temporarily unavailable.  Stop.
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1358/steps/8/logs/step2d

Thanks Anuj!

One of the selftest failures wasn't this but was failures in bitbake-
selftest due to fetcher url stability issues. I've backported the
bitbake change which fixes that to 1.44.

The issue above isn't resource but is related to the attr fix I made in
thud-next. Its caused by issues with newer versions of make and the
rather weird makefile attr/acl has. The fix is to do what I did for
attr, disable parallel make during install. Newer verisons of acl/attr
don't have the problem so this is zeus specific.

Cheers,

Richard

