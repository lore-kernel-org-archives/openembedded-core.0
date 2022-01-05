Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB44EC433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 17:07:20 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.3352.1641402439832539072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F48uscnL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id i22so84374202wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=I5WYtiNCkNOeIcwowl/GjyzfxsYojQ7geDRFl5eMzOw=;
        b=F48uscnLqNADOffbj40qw+Ca9KXH65QcMosQ09JLrrzIqdj7hxhE2hTuBemF6yc3K8
         VsCBBNolgubSKK4blPzfWV7rmTtcwQYbzyTq7AfkLdL6YGFi6XsQyL/cCNnV8/AhY1C5
         3U20ecdIfUIvC4606pCZhm79lcL185Q0hC2o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=I5WYtiNCkNOeIcwowl/GjyzfxsYojQ7geDRFl5eMzOw=;
        b=Hq+4K1HqpZo7d8+VxpqKyk609vCqdTuch4dQaulFCVZN0wJ3iMENY4KqOhOVYuuoMC
         8nCV1ERNlEdn44UiLwz5NgPoIF+SjBYrL9K8d/8sWyh5cY+gdRXr//KDkGKo9xTtzwFX
         /i5nA3Eu03LUlFt3bLnGbefFg6LMZo88T42oKcxLDN2D6DBycVJfR3D8RwaZckAcD7xj
         qQ4PHw0GFN20fAmag3szg+z1MjjXKMf4ed/BUg1ktRm4+HVLoOYIXPeo3p9qfZArZ3Wf
         A5uAm+onGSRPeSPi8oIerFBGuTvJFjHT4YnVjvMx8/nJAQncLi8oqR1Z4NWNrIXpYK2c
         SMGQ==
X-Gm-Message-State: AOAM533a+jcZ2u2jCQeHotYAoi6T9pX4fkX4CCYiJCuDxsJnsGqkd4dk
	15FXAsx5uxVyScaSgJCPGQeNcw==
X-Google-Smtp-Source: 
 ABdhPJzFI0yukdT4Xsdcq/CQX86q+iEw3ZDuM4lZNCt/8OAvjMv82/gDsD//Bd6dQuddhtMcAp4KWg==
X-Received: by 2002:adf:97c2:: with SMTP id t2mr47887801wrb.577.1641402438305;
        Wed, 05 Jan 2022 09:07:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4930:6fc6:9dcd:7b1c?
 ([2001:8b0:aba:5f3c:4930:6fc6:9dcd:7b1c])
        by smtp.gmail.com with ESMTPSA id
 i8sm3734796wmq.36.2022.01.05.09.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 09:07:17 -0800 (PST)
Message-ID: 
 <f55b92395da477d06df9b545ac6fc7ac47d0df41.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: don't skip kernel and
 kernel modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
 openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com, Bruce
 Ashfield <bruce.ashfield@xilinx.com>
Date: Wed, 05 Jan 2022 17:07:15 +0000
In-Reply-To: <b90b0597-15e4-f19d-2431-9afe77d6c33c@windriver.com>
References: <20211221190809.89882-1-saul.wold@windriver.com>
	 <20211221190809.89882-3-saul.wold@windriver.com>
	 <0137a7550504afc03ed41d8bc7e7fe26e7dba9d5.camel@linuxfoundation.org>
	 <b90b0597-15e4-f19d-2431-9afe77d6c33c@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 17:07:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160211

On Tue, 2022-01-04 at 14:07 -0800, Saul Wold wrote:
> 
> On 12/22/21 01:09, Richard Purdie wrote:
> > On Tue, 2021-12-21 at 11:08 -0800, Saul Wold wrote:
> > > Stop ignoring or skipping the kernel and kernel modules code in the
> > > split debug and striping functions, this will allow create_spdx to
> > > process the kernel and modules.
> > > 
> > > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > > ---
> > >   meta/classes/package.bbclass | 8 ++------
> > >   1 file changed, 2 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > > index 84eafbd529..4b7fe4f1e1 100644
> > > --- a/meta/classes/package.bbclass
> > > +++ b/meta/classes/package.bbclass
> > > @@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
> > >       dvar = d.getVar('PKGD')
> > >       objcopy = d.getVar("OBJCOPY")
> > >   
> > > -    # We ignore kernel modules, we don't generate debug info files.
> > > -    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
> > > -        return (file, sources)
> > > -
> > >       newmode = None
> > >       if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> > >           origmode = os.stat(file)[stat.ST_MODE]
> > > @@ -1147,7 +1143,7 @@ python split_and_strip_files () {
> > >   
> > >                   if file.endswith(".ko") and file.find("/lib/modules/") != -1:
> > >                       kernmods.append(file)
> > > -                    continue
> > > +
> > >                   if oe.package.is_static_lib(file):
> > >                       staticlibs.append(file)
> > >                       continue
> > > @@ -1165,7 +1161,7 @@ python split_and_strip_files () {
> > >                       continue
> > >                   # Check its an executable
> > >                   if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
> > > -                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
> > > +                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)) or (f.startswith('vmlinux') or ".ko" in f):
> > >   
> > >                       if cpath.islink(file):
> > >                           checkelflinks[file] = ltarget
> > 
> > edgerouter:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/4513
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2507/steps/11/logs/stdio
> > 
> So I have been digging into this and it seems that an option was added a 
> decade ago or so to strip the kernel/vmlinux when it's too big, this was 
> done for at least the routerstationpro according to bug #3515 [0], and 
> persists with the edgerouter, although I am not sure if it would still 
> actually be required as the edgerouter also uses the 
> KERNEL_ALT_IMAGETYPE to create a smaller binary kernel image.
> 
> The change I proposed causes the all kernels to be stripped all the time 
> as part of the split_and_strip_files(). As I see it there few different 
> options:
> 
> 1) Set KERNEL_IMAGE_EXTRA_STRIP_SECTIONS = "" in create_spdx.bbclass
>    - This solves the problem with create_spdx.bbclass is in use, but not 
> the general case

I don't think I like this as it is a side effect that isn't obvious or expected.

> 
> 2) Remove the KERNEL_IMAGE_EXTRA_STRIP_SECTIONS from edgerouter.conf
>    - Will solve the edgerouter case but may not solve other usages 
> unknown to me.
>    - Does anyone know of other machines/layers usage of this variable?
> 
> 3) deprecate the kernel.bbclass:do_strip function in favor of using the 
> split_and_strip_files() of package.bbclass

I know Bruce has said he doesn't like this, however stepping back, these issues
were from a time our stripping code was young and evolving. If we can
standardise and have it all work together well in one set of functions, I think
that is worth looking at. I'd prefer the kernel wasn't a special case if it no
longer needs to be.

That said, I don't remember the details of why we did this.


> 
> 4) Change error to warning in packaging.bbclass for the kernel only
>    - This would explain that a kernel image (vmlinux) is already 
> stripped and extended package data would not be available for for SPDX 
> creation.
> 
> RP, Bruce, Joshua: Thoughts?

If we can simplify and stop the kernel being a special case for this code (or
handle kernels generically) that would be worth a bit of effort IMO...

Cheers,

Richard




