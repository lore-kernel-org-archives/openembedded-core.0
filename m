Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.22053.1627637281355363201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 02:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jj3D+3MP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id n28-20020a05600c3b9cb02902552e60df56so5921959wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 02:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ja+IZw7c1Z3kBVqN2B7eF7OlWYCzmmXFMZJK9PL+TSI=;
        b=Jj3D+3MPynnldN1hBiZfcxhcSBs30uYFTD7zmrpTdNm6Gv2hBYmiFfoE2l0hdheABX
         nlXwGuHIKf0eq+IObmHMBGN3le/HzwPOryVyq40+ZmNtHnl61tt6nLxAtWc/RGgw1l/M
         CZdzDdR+s9V8rJ/al6byLDDu76xE4zkyofpcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ja+IZw7c1Z3kBVqN2B7eF7OlWYCzmmXFMZJK9PL+TSI=;
        b=eh2RI8F/za59b7Vl3wOB6sf9ayCfxzrwT9MbZQ0qXCfPB2S1/LPKO3hF8dQzosLLKD
         4b4tLPL0/24+ysSfoOvNeH3wFIx0rcbRo+d0yj0yuf0Gdo66DHHlbh0tNeYxk2o0kp/n
         qtz1LBJ0RH0xvKzW5/3cI96HwTmjedeNri3p4uQZLFDujvRNDd/vy1umVje8ALgtQi4v
         5cAQLFdwXQ8VQGQHlUssvG5sTRDJYJ4QpuRys/oOTmxG48Qf5YVK969UPMzYTjH0MT+I
         +E8nG/F/D14y2YCndee+j+KCx/bVW7XnTv2lT5E433eT7mCD3H/X9JVsAryjjeUolskq
         fc/A==
X-Gm-Message-State: AOAM533xgOi3Q0SvKQ53dqETSBm7blo5d+N8DgwNSwcMKPdyWsOMmgUJ
	aF9XQACvbVfe3QvXcFgImEuFfA==
X-Google-Smtp-Source: ABdhPJwYixsk8UCg2+QZEMxES7ApPcLHctFEoxWgYgCODOIoZcSzOcmCITT9AaSAKsfN6YNGHBho+A==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr2086583wmb.12.1627637279953;
        Fri, 30 Jul 2021 02:27:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b? ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id t17sm962996wmq.17.2021.07.30.02.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 02:27:59 -0700 (PDT)
Message-ID: <98ab2870e07ad6d296d29322b7ee78bade43b9ea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Fri, 30 Jul 2021 10:27:56 +0100
In-Reply-To: <CAP71WjxcSk64Snj8Hd0Vy9nJyUH8mE9MjnkfAZC095mPt9bd6g@mail.gmail.com>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
	 <33b5d60e01b3995046709b17b8014fd45b0c48e5.camel@linuxfoundation.org>
	 <CAP71WjxcSk64Snj8Hd0Vy9nJyUH8mE9MjnkfAZC095mPt9bd6g@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-07-30 at 11:08 +0200, Nicolas Dechesne wrote:
> 
> 
> On Fri, Jul 30, 2021 at 10:03 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2021-07-22 at 14:46 +0200, Nicolas Dechesne wrote:
> > > It has been recentely mentioned to me by the YP TSC that a layer must
> > > not only pass the yocto-check-layer script, but also all its
> > > dependencies. These patches add support for testing dependencies
> > > automatically.
> > > 
> > > Patch #1 and #3 are not much related, but improvements I made along
> > > the lines. 
> > > 
> > > Patch #2 split the internal function into 2 parts, so that we can get
> > > the list of dependencies from the main script. 
> > > 
> > > Patch #4 is where the processing of the dependencies is done. I chose
> > > to enable checking the dependencies by default, and use
> > > '--no-auto-dependency' to disable it, we could decide the other way
> > > around. For any dependency of the 'layers under test' we will simply
> > > add them to the list of layers to test unless they are already there.
> > > 
> > > Here is a sample output with these changes:
> > > 
> > > $ yocto-check-layer /work/oe/sources/meta-aws \ 
> > >                     --dependency /work/oe/sources/meta-openembedded/ 
> > > 
> > > INFO: Summary of results:
> > > INFO:
> > > INFO: meta-aws ... PASS
> > > INFO: meta-python ... PASS
> > > INFO: meta-oe ... PASS
> > > INFO: meta-networking ... PASS
> > 
> > We merged this but have started seeing:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/166
> > 
> > which seems a little strange and is probably related to this series.
> > 
> 
> 
> yes, it's related.
> 
> ...
> INFO: Adding meta-poky to the list of layers to test, as a dependency
> ...
> INFO: meta-poky ... SKIPPED (Layer under test should not present in BBLAYERS)
> 
> With these changes, we are now adding all dependencies and trying to test them too. But meta-poky seems to
> be in bblayers.conf, and yocto-check-layer won't work since it needs to compute all checksum *without* the
> layer in the config first. 
> 
> It is probably a good idea to make sure bblayers only has oe-core when we try to perform YP compat.
> Alternatively, as discussed, we use --no-auto-dependency on AB.. 

Fair enough, I'll update the config to do that.

Cheers,

Richard

> 



