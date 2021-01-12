Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.8010.1610452693946761955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 03:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fqx00+6e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id c5so2208529wrp.6
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 03:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=lonjv+FQWG/ffzdwhSBA4Hldl50Q8mwct0SzBHM4wfU=;
        b=fqx00+6ef7PSnwxMfLNVI+ZFa7XuO0hA1yZYhhsRMkd3RyJhYn7rhYr2pzILB/VTEt
         Ev851hzfNV5GkWRN3RP3lEJMAp/T5TZgKganEO+nn0IW/o9COPQBeTQhjKbZJgCIIuaN
         0zJDHlNF/UR5DfqHmRgcHnxZpSCjzhGSe3N7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lonjv+FQWG/ffzdwhSBA4Hldl50Q8mwct0SzBHM4wfU=;
        b=X9RFYD1cnRrdQQxZuUX/W4dz7EXsUGlF81F5R49Obu0n9Smunzlp39rpkxHt+9ZPdm
         OaiZBZknN3CBKr0EK5TLkk8zVM7/RElkyvj8Fhm7h2hVL5gbAGNxEkkhMU+xJdVBs7Ox
         F6N8WkZP/7snVva2V7fRDOEMcDIW1z9oTwr6hQinuBjeZUYkRPAwDPaxNgp46nCV3ZSN
         BHEPSZOatPEB40eoLQg9XRaLiH4oqfzNWA8rZuCrxoHizX0Xx3z1UHpi7j2+IWms/Oxq
         uOS47ERydmxqrCE6w+AviHzJMPgED+atiOhNKlCi5LiCndrQEmql75rV1oJwlb7/1Okx
         HElQ==
X-Gm-Message-State: AOAM531xbRLIQ8r8TSX+wF6vdDXgDOQQyP56uFM2jAjFjH35OIQCm7Kt
	ND/OzvKY67jIbKBR+hCmB5glLQ==
X-Google-Smtp-Source: ABdhPJwdMZVLCVHA1PXPMZb+arqKOpSu5mBhb4YKOkb/v2GtWr+M3TKs1Ded4Fk5wU9j8PHArIT/mw==
X-Received: by 2002:a05:6000:1624:: with SMTP id v4mr4073734wrb.210.1610452692204;
        Tue, 12 Jan 2021 03:58:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:281a:af36:8e71:af21? ([2001:8b0:aba:5f3c:281a:af36:8e71:af21])
        by smtp.gmail.com with ESMTPSA id y6sm3652826wrp.6.2021.01.12.03.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 03:58:11 -0800 (PST)
Message-ID: <5d950e39a38c70e665a6473f3a799587e8a9c353.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in parallel to do_rootfs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Ho <Michael.Ho@bmw.de>,
 openembedded-core@lists.openembedded.org,  Paul Barker
 <pbarker@konsulko.com>
Date: Tue, 12 Jan 2021 11:58:09 +0000
In-Reply-To: <1659719EDE2CEAAC.30796@lists.openembedded.org>
References: <1610369123-220800-1-git-send-email-michael.ho@bmw.de>
	 <1659719EDE2CEAAC.30796@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-12 at 09:21 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2021-01-11 at 13:45 +0100, Michael Ho wrote:
> > From: Michael Ho <Michael.Ho@bmw.de>
> > 
> > Switch do_populate_sdk for the ipk package manager to use a separate target
> > opkg config file and separate the lockfiles restricting do_rootfs and
> > do_populate_sdk from running in parallel.
> > 
> > This way if an image recipe includes a dependency to do_populate_sdk by
> > default then it will run in parallel to do_rootfs saving time compared to the
> > sequential execution.
> > 
> > Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> > ---
> >  meta/classes/package_ipk.bbclass       | 1 +
> >  meta/classes/rootfs_ipk.bbclass        | 4 ++--
> >  meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++
> >  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> I have to admit I'm very nervous about this change. The races we've
> seen betweem rootfs and sdk can be quite unusual.
> 
> I did put this in for testing and we saw:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2938
> 
> which in the pseudo.log shows:
> 
> path mismatch [2 links]: ino 372706913 db '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/tmp-wic' req '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/sdk/image/opt/poky/3.2+snapshot/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/src/debug/puzzles'.
> path mismatch [2 links]: ino 372706913 db '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/tmp-wic' req '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/sdk/image/opt/poky/3.2+snapshot/sysroots/cortexa8hf-neon-poky-linux-gnueabi/usr/src/debug/puzzles'.
> 
> its hard to know if this is due to this patch or possibly Paul's wic
> changes as both were in this test series. I suspect it won't reproduce
> every time since its a race.

Just to confirm, this is Paul's patch as it was seen with rpm packaging
and therefore couldn't be the ipk change.

I am worried we don't test ipk extensively enough to spot the races in
the ipk code though, I know I've had to fix quite a few over the years
:(. 

Cheers,

Richard

