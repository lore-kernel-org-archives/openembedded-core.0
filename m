Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.10564.1597133979303872080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 01:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OKDKkfJr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id a15so10575095wrh.10
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=HvbjSJfMxvhn8ndlKcCaxJLJ+rttAG1y3nHnSQfGTHw=;
        b=OKDKkfJrSGGB/pNn6vYysQDNKU4vLwQYgdvNoQZXsdaGcT33c4IBfOMVRklLfYJwwA
         LU7YDf1pIBoZMgLakrATX3FPPSVBuYXp2Rz2oA9h/zTOWpKAFUp82BIgp9GGzQjEGW7R
         UoVAIAxltbFD35z00YKsi8llQ4P1FvO0fc3x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HvbjSJfMxvhn8ndlKcCaxJLJ+rttAG1y3nHnSQfGTHw=;
        b=q/tNsAadEzZltpGV1EG/PcuF8PtBbZPm6PUu0U6usazeG01jnjQ6QokpDbCdJjB9DF
         ywvucfl8dYCCP+pwrluMHODkrSgawOwSrZ2g6BDUgTix8AGkdfExw6o0XJ0wTFGhgbPm
         XhzIyKpVkwvQRWNl3h8uLrN8MfFP5oFTCj53/x5k/jv/6eXq2UX8g+NW7Gg58ZeEe1TN
         /BB3y+kimMSCpZY5aP/TN8en1oi6wc8wZ3LvuLl6GZhxYo/8yVRPqgUNyyzTE2TX6yCc
         UpHlYnVdY06UJn7mc1p+JgUYqNm6Usf+22vlnS1QVXGOBsGf4r9Os/bMY3K+bdkvp5GL
         oJRw==
X-Gm-Message-State: AOAM531kYQxrHtdkPaFP0vSBNtKqZU1DsNBtwZhw8QqsX6kFUHy+Ju5F
	ZoamWjejEC8nFUmwxKo3+vvm1g==
X-Google-Smtp-Source: ABdhPJzcfR9A/hwX/Pcg7jly+Ix/VU/hi6X00NfZOPdLwhblU4ilPX1vMP2SqMFQGsZaQI4lT9becQ==
X-Received: by 2002:adf:9e90:: with SMTP id a16mr29950939wrf.40.1597133977656;
        Tue, 11 Aug 2020 01:19:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.1.8.7.e.c.7.c.b.7.0.b.c.1.9.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.1.8.7.e.c.7.c.b.7.0.b.c.1.9.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:291c:b07b:c7ce:781b])
        by smtp.gmail.com with ESMTPSA id x204sm6060925wmg.2.2020.08.11.01.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 01:19:37 -0700 (PDT)
Message-ID: <95b06a10d29546555e1a0064cd5644018bb90006.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: set the default pigz thread
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2020 09:19:36 +0100
In-Reply-To: <ae3b1594-1a8a-4a77-e777-03d7c6d6060f@windriver.com>
References: <20200811072258.4074290-1-mingli.yu@windriver.com>
	 <2803933a96d0b791c8cad542bbfec3c3dd67eefd.camel@linuxfoundation.org>
	 <ae3b1594-1a8a-4a77-e777-03d7c6d6060f@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-11 at 16:09 +0800, Yu, Mingli wrote:
> Hi RP,
> 
> On 8/11/20 3:57 PM, Richard Purdie wrote:
> > On Tue, 2020-08-11 at 15:22 +0800, Yu, Mingli wrote:
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > > 
> > > pigz, which stands for parallel implementation of gzip, is a
> > > fully functional replacement for gzip that exploits multiple
> > > processors and multiple cores to the hilt when compressing data.
> > > 
> > > do_package uses pigz to compress data to speed up the time
> > > if there is pigz available on the build server.
> > > 
> > > But for some big package such as clang, there comes below
> > > error during do_package.
> > > gzip: stdout: Cannot allocate memory
> > > tar: TOPDIR/sstate-cache/20/80/sstate:clang:cortexa57-wrs-
> > > linux:10.0.1:r0:cortexa57:3:20808f8a746b00ec9470a81057c8595d878cf
> > > e8c565cfbcbbaa3ea870528ee34_package.tgz.QF5dss8M: Wrote only 8192
> > > of 10240 bytes
> > > tar: Child returned status 1
> > > tar: Error is not recoverable: exiting now
> > > 
> > > So set the default pigz thread and the user also can customize
> > > the pigz thread such as via PIGZ = "-p 3" or PIGZ_pn-clang = "-p
> > > 3"
> > > for the individual package in local.conf to avoid eating so much
> > > memory.
> > > 
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > ---
> > >   meta/conf/bitbake.conf | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 353caacef9..bc87e78d78 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -804,6 +804,9 @@ XZ_THREADS ?= "${@oe.utils.cpu_count(at_least
> > > =2)}"
> > >   XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --
> > > threads=${XZ_THREADS}"
> > >   XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
> > >   
> > > +# Default parallelism and resource usage for pigz
> > > +export PIGZ = "-p ${@oe.utils.cpu_count(at_least=2)}"
> > 
> > Why not just set this in the cases you need it in and leave the
> > defaults alone? You can just export it in the tasks which need it
> > too.
> 
> Actually I just want to use this logic in this patch altogether 
> PIGZ_pn-clang = "-p 3" in local.conf to limit the pigz thread number
> for clang.
> 
> Without this patch, I think PIGZ_pn-clang = "-p 3" doesn't take
> effect.

You'll have to use something like:

PIGZEXPORT = "0"
PIGZEXPORT_pn-clang = "1"
PIGZ[export] = "${PIGZEXPORT}"

> > This change actually makes the sstate number of cpus specific which
> > we
> > definitely don't want.
> 
>  From my understanding, the default behavior for pigz is to take all 
> online cores, it should be the same with  export PIGZ = "-p 
> ${@oe.utils.cpu_count(at_least=2)}".

I understand why you want to do it and what it does. It breaks sstate
signatures for everyone else though so it is not acceptable.

Cheers,

Richard





