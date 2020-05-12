Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.7265.1589294837390150567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 07:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fmYPcVR9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id e26so22067018wmk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=S4jXOqNOBvAWfCttZa3XdmPO7CyoVp2LFaveE/W5xVo=;
        b=fmYPcVR9h6MMWtN5Q5Hfdr3iCq+j94NtmyKllRtI16UaYPqaFQEWcD9mIP5RTO0sTN
         3cSofp/IktUqjyO0NFibqa/15VntBtx3pCQebn5IX5NjmDdW2gqvI6TGj/xMHun181K0
         Jk4vxnivjSBHzq1QcDQ7m6VhkpVtwmse9R2t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S4jXOqNOBvAWfCttZa3XdmPO7CyoVp2LFaveE/W5xVo=;
        b=RLOwzXrURsDYThipXJWVsoL4+aJKMIb+YwOOqJ1D5r7P+JNgmvQ9l33yEoAuYnhyu9
         7y/tb1Cz8t+Yps+D+qHRA3ZULZk+1ToK6qKqVKww4SpK7qMi3RTP1WGqQ0tDubTiNMko
         kSxl/rAZeicweyoOSDB52VVqzbBbwnU3vNblq4k+vxP8g2GOLAlZgP0pVL25nNYf/OLq
         UJndxvbWYb3kpWkhBpNpQSahiK5QgYujT/m49FQvsEnPxG+PhHRuv+Cr7iMQ2Q7O/EcH
         imWapT4i4rxDGpmcq3U9PhQr/WtilE9QclZjCf1mkDoCODmLsOctdydJzqk9yDky+Hrr
         rutQ==
X-Gm-Message-State: AGi0PuZn/jy48NhfqsVpjCw+2ZFQD/HHnXBSA0/ga2j6xssRuGpYrrvc
	SUIDK04oM0sKu2L9HI33N/JO9w==
X-Google-Smtp-Source: APiQypKIA3VoV255wASn4Ajkz499DCOiqOHTSZZiUttscT+2LVGysgv2hK17UXiuFeN7hXoNudeewA==
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr39306077wmm.174.1589294835904;
        Tue, 12 May 2020 07:47:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e5sm20497353wro.3.2020.05.12.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 07:47:15 -0700 (PDT)
Message-ID: <5277aa09b9b424951d0ee22025ff7f605f793847.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/kernel: Generate reproducible kernel module tarball
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2020 15:47:13 +0100
In-Reply-To: <4c850dcd-5049-55fd-279e-ad1a858ffce0@gmail.com>
References: <20200512134013.25080-1-JPEWhacker@gmail.com>
	 <3f5f200c47a92bc0a417300d0d0efa73d423d9ba.camel@linuxfoundation.org>
	 <4c850dcd-5049-55fd-279e-ad1a858ffce0@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-12 at 09:27 -0500, Joshua Watt wrote:
> On 5/12/20 9:22 AM, Richard Purdie wrote:
> > On Tue, 2020-05-12 at 08:40 -0500, Joshua Watt wrote:
> > > If reproducible binaries are requested, generate the kernel modules
> > > tarball in a reproducible way. Namely, sort the tarball contents, clamp
> > > the mtime to the source date epoch, compress the archive with a
> > > consistent compression level (9), and don't include the name and
> > > timestamp in the compressed file.
> > > 
> > > [YOCTO #12719]
> > > 
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >   meta/classes/kernel.bbclass | 10 +++++++++-
> > >   1 file changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index a724645466..c124645643 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -691,7 +691,15 @@ kernel_do_deploy() {
> > >   
> > >   	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> > >   		mkdir -p ${D}${root_prefix}/lib
> > > -		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
> > > +		if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> > > +			TAR_ARGS="--sort=name --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
> > > +			GZIP_ARGS="-9n"
> > > +		else
> > > +			TAR_ARGS=""
> > > +			GZIP_ARGS=""
> > > +		fi
> > > +		tar $TAR_ARGS -cv -C ${D}${root_prefix} lib | gzip $GZIP_ARGS > $deployDir/modules-${MODULE_TARBALL_NAME}.tgz
> > > +
> > >   		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
> > >   	fi
> > Do we need to make this conditional or could we just do it by default?
> 
> I don't know if we can rely on SOURCE_DATE_EPOCH being set unless 
> reproducible_build.bbclass is inherited, but at a minimum we can always 
> use the gzip args.

Good point, I assumed we had a default for some reason.

I think the patch will be more obvious if its conditional on
SOURCE_DATE_EPOCH and we just use the other options unconditionally.

I wonder if we should just move build_reproducibility_simple.bbclass
into bitbake.conf?

Cheers,

Richard

