Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.7785.1615810901884952451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 05:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CfKlb8IK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so20142386wml.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EdX3ayqIkb2dZMkr549JSgiOP+NiKtrfiCEj+qTzymE=;
        b=CfKlb8IKzx8+PlI7Je8AlfwG8EkbVdYyYjlRPjnVz/3yytcZT5aVeGNRU/jMPL0Zaf
         g8AiULh8eFxJ2CgAf4EfGfmk2KBjhzlsfBZiryP64VZUcYzzGEM5XRQSzkXqg2+HaGmi
         eZRlVnIlxVnw3LJTR6VPE9NNglMJ8lTaWkOiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EdX3ayqIkb2dZMkr549JSgiOP+NiKtrfiCEj+qTzymE=;
        b=L8IEsOByNGMNFPNhkZkgqaDoAziaVNr3idqBnhNQWFYCO/y1MuASy6jOQUZ7pI+3v5
         ZV0zgdSo3XbqxkwPz5EeXnH4hLxUXeVPi8eRWdsfYeWjZ3YKbgnvPeoqltz4SK/lxqID
         uHPnlfWYhJ+YM6hx7BsDqyKMAp1wLdtx9bKHPwrpUoqao1ATl2kTX7D+rDqYjVdKPRbi
         vOdCFhtZeXcXTrx2ay90zXubU1iDPoeYdRWY3rcPdAvkkNktCYAVJD71KLJpkMrTqW4i
         BW2ylZcrp1xP/EG3RYrVRQ+iqQk76tQeXnjEnP7QSD1qyzRamzLlhSYFcPDy4r9ICyna
         4NVQ==
X-Gm-Message-State: AOAM532SqPaiHExQnb+TsmMGfO2+pUO4kbGH6Z46tTO2WjI03w7EIZku
	jrg6e8Pj1UNflZbIJJdlC6xMkg==
X-Google-Smtp-Source: ABdhPJwl58It0bRw4vlYix7hpqSCIKg4WPSxYqdObZCeo4bhlslUcp05+fIbsmTHJo3GuyVQYJNV2w==
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr25698329wmc.164.1615810900327;
        Mon, 15 Mar 2021 05:21:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e? ([2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e])
        by smtp.gmail.com with ESMTPSA id n6sm18792294wrt.1.2021.03.15.05.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:21:40 -0700 (PDT)
Message-ID: <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
Subject: Re: [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Mon, 15 Mar 2021 12:21:37 +0000
In-Reply-To: <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
	 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
	 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
	 <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
	 <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-15 at 11:50 +0000, Luca Boccassi wrote:
> On Mon, 2021-03-15 at 10:49 +0000, Richard Purdie wrote:
> > On Mon, 2021-03-15 at 10:44 +0000, Luca Boccassi wrote:
> > > On Sun, 2021-03-14 at 22:10 +0000, Richard Purdie wrote:
> > > > On Thu, 2021-03-11 at 15:09 +0000, luca.boccassi@gmail.com wrote:
> > > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > > 
> > > > > Recently util-linux gained an (optional) build dependency on libcryptsetup.
> > > > > But libcryptsetup build-depends on util-linux for blkid (optional, can be disabled)
> > > > > and uuid (mandatory).
> > > > > Split out util-linux-uuid in a different recipe to break the cycle.
> > > > > 
> > > > > https://github.com/karelzak/util-linux/pull/898
> > > > > 
> > > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > 
> > > > Unfortunately I noticed we had a performance regression in buildtimes in 
> > > > recent changes. The closest I have this narrowed down to so far:
> > > > 
> > > > https://autobuilder.yocto.io/pub/non-release/20210314-14/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20210314181831_d42487bf52.html
> > > > 
> > > > suggests it may be this change. I have more tests queued to confirm
> > > > that definitively, if so we'll have to figure out why as this shouldn't
> > > > really happen, its an 8% regression :(.
> > > 
> > > Very strange that a single recipe could do that - is there something
> > > wrong in the new .bb that I missed and could cause this?
> > 
> > I'm wondering if it is because we're building util-linux twice now and
> > there is some key choke point in the dependency chain. I have no evidence
> > for that yet, it is just speculation though.
> 
> With the autoconf options I've set, on my laptop it takes 32s to do
> configure + make -j2. Most of that is autoconf - make -j2 takes 8s.
> 
> Only 3 libraries are built with this combination: libcommon.a,
> libtcolors.a, and libuuid.a/so. No executables or anything else is
> built. It doesn't look like libtcolors is actually needed, I'll see if
> I can prepare a patch to skip it, but I don't think it will buy more
> than 1s, it's just two object files.
> 
> The good news is that meson support is about to land upstream, which
> should be significantly faster than autoconf + make:
> 
> https://github.com/karelzak/util-linux/commits/topic/meson

Meson definitely improves the speed! I was wondering if it was from
configure for example.

I now have more performance test results in (takes time to interleave 
them with testing of master):

https://autobuilder.yocto.io/pub/non-release/20210315-1/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20210315005048_6bb1621815.html

and I think this means it isn't from the util-linux change but one of 
another three. I'm not entirely convinced those changes could do this
but it is what the data says. 

I've queued more bisection to narrow it down from there...

Cheers,

Richard




