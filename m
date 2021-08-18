Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.50946.1629270008927799315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 00:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z7tEeZGH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id f5so1764723wrm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 00:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8H2myNFUi8nbyC2By0ogWCWysgzNn0t4Vemf5oqSKno=;
        b=Z7tEeZGHfJc1AFRpdR5EwjIBgCCn5+e9KgNHdDUkRVP43nmk8C1CMBZSEMeJf2lqmp
         3NPyASl65E5UGxwgcSCC+tgYNvUJu0baKe0+th0s99ZoO2cEgp0snyeo2TY6iy2rZrml
         lJQIkCuBoRVVOgZBHgPXtm/vzDzJJBzHMXzsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8H2myNFUi8nbyC2By0ogWCWysgzNn0t4Vemf5oqSKno=;
        b=EebiI5nWcwkYy9EZPSFkGmWyZGOMk7emjcoC31oGKPU0Vvp/AJr2W+lTQfAVnMCNmm
         HVDrhCe+rfPm6nIQPHC/OD8EkwzvxbG7sG2J6Rh7n43YORh3Q6xLKGrfBevjvg3F1jG4
         o4tK8Z+cR2bhelDQFLCi2dIWgyglr/3aoLk72ESlZVH4pkqYkW05xgtqb+I6dNLoNT8x
         DS2hhGB4UAHHkv2HLRx1pOPzSjPQtc0c9Q3yv/wMbO4QYUjHVnpMggMOEKCMq5+AeXZm
         XVfSiDnIr8KHSx0vWxhMSnU3zCtpjG4+ISk0Zy7m2FPBSzmUFVlS1zYX7OqVipPVa49s
         yAWw==
X-Gm-Message-State: AOAM533F9n+dXmDZNr0pGZGyivElghcxH8K6TGAcywS3ndacPZJ+DEJQ
	zFA+YQNS+qEvC/qJBifz4gN4Qg==
X-Google-Smtp-Source: ABdhPJwvy2ZUiDO0N6cSnY6ZMbEyepDzZ1eeUk6p4HbilPY0MHjwOqLL+ccL54Bnk4JZSMQiG+Pglg==
X-Received: by 2002:a5d:4e0d:: with SMTP id p13mr8557715wrt.274.1629270007368;
        Wed, 18 Aug 2021 00:00:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2? ([2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2])
        by smtp.gmail.com with ESMTPSA id w29sm5257351wra.88.2021.08.18.00.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:00:06 -0700 (PDT)
Message-ID: <fb8ec5484f790866114c755b47f677746e42dab6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: package the stub .a libaries into glibc-dev
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Aug 2021 08:00:02 +0100
In-Reply-To: <CAMKF1soAhzSgaYfuJarzoj6VEkAwcm1+51ymGprGwB=Sn53XZw@mail.gmail.com>
References: <20210817222919.2170420-1-ross.burton@arm.com>
	 <CAMKF1sp83v6TkKLAAMdDExij9ZceOaCGpSrp=cLPJEkQUCB-pQ@mail.gmail.com>
	 <CAMKF1soAhzSgaYfuJarzoj6VEkAwcm1+51ymGprGwB=Sn53XZw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-08-17 at 17:40 -0700, Khem Raj wrote:
> hmm I am seeing pseudo build failures on master-next on all arches see
> [1].  I wonder if this is related
> 
> https://errors.yoctoproject.org/Errors/Details/601473/

I think that would be an issue with my patch in master-next to try and fix
other pseudo issues with 2.34 hosts.

Basically we need pseudo to work with older glibc where the dlsym/dlvsym/dlerror
functions are in libdl. This is because libpseudo may be loaded against host binaries
which were not linked with glibc 2.34 but something older.

To do that, we need to inject older versioning but the version to use is arch 
specific. I have a patch covering 32/64 bit x86 and arm but I haven't got further
than that:


++#if defined (__aarch64__)
++#define DLSYMVER "2.17"
++#define DLSYMVER2 "2.17"
++#elif defined(__i386__)
++#define DLSYMVER "2.0"
++#define DLSYMVER2 "2.1"
++#else
++#define DLSYMVER "2.2.5"
++#define DLSYMVER2 "2.2.5"
++#endif
++
++__asm__(".symver dlerror,dlerror@GLIBC_" DLSYMVER);
++__asm__(".symver dlvsym,dlvsym@GLIBC_" DLSYMVER2);
++__asm__(".symver dlsym,dlsym@GLIBC_" DLSYMVER);


I may need help finishing this off for other arches people are building it for. So far
I was using this as a test to see if this would even work!

Cheers,

Richard

