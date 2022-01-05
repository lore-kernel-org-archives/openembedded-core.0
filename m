Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530D0C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 17:40:07 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.3888.1641404406211723864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:40:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dkHN1tMo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id h23so1649485wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ENqsd8PWOac9oxFvuvlbrn0RLjDKRPhs6ABhOUaJRss=;
        b=dkHN1tMoZLKFl5VG8T0MfYsEG5yMVmjH/x68PFWQEHVJAn5fAVaoVXoeOIfP9FA7ie
         DkDHFApJORc6a/LblUA6SDACtdkz6Sk9hWAo1yN+pcmxjuwYM0B2vM3Ee0DBSTEiel1m
         od4bZD7POv4auI8hYJCW9+Nfew07c1Lih1RdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ENqsd8PWOac9oxFvuvlbrn0RLjDKRPhs6ABhOUaJRss=;
        b=Wv+dIU9GEh9IsBtzEU3jriTZOwaFQHTgrit1ZHk5EoW4qLPSnBxbkOocAkRivdvfZF
         CVT7l+Az7EeCsc+KcW/PFKxb4wELD3wcFE5txJNMn69fJduk5PXpfq4we1Je2gqZBc0k
         prNg/WjDti/RE8D6CoLTaqoPEvWGXoE66/5WRNPHLlp/QH6JGZt+q6Z1lrr4WchgZAK7
         5bU8WRSMDMItJykp+omHLdviLXLof1hzsFsmyYf0IWtXihJwCRytcsDZ427FzWaPTiWJ
         FfSDrED2r+KTvfVXFhs3vsc6T350HVZ2BOn9axXyI7bnB3VvlmA7B1rx6bYalMp40oDS
         Ih1A==
X-Gm-Message-State: AOAM531CcMrXJY81N3Ku7yCg9t/pD9zi2frY7P8nmFPH4ROe1MetVLn0
	7sdY8T6ZIcMVnJEhEDJwYT0evw==
X-Google-Smtp-Source: 
 ABdhPJw4FwKWYv67vhaggnQQNj8iBzSpRN6i1FDQJz1pWeXxrLad2/3cAf7nFxz3Vsqc3dOBU7LczA==
X-Received: by 2002:a5d:6088:: with SMTP id w8mr48384263wrt.85.1641404404516;
        Wed, 05 Jan 2022 09:40:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4930:6fc6:9dcd:7b1c?
 ([2001:8b0:aba:5f3c:4930:6fc6:9dcd:7b1c])
        by smtp.gmail.com with ESMTPSA id u11sm866699wmq.2.2022.01.05.09.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 09:40:04 -0800 (PST)
Message-ID: 
 <f0919c705fd584ecea4ff5f73f09462ec88f74d6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: don't skip kernel and
 kernel modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Saul Wold <Saul.Wold@windriver.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>, Joshua Watt
 <JPEWhacker@gmail.com>, Bruce Ashfield <bruce.ashfield@xilinx.com>
Date: Wed, 05 Jan 2022 17:40:02 +0000
In-Reply-To: 
 <CADkTA4Mh78Kmg_NWoS+Bm4on+D_6wzCErawALKQqWdH9OsN9pA@mail.gmail.com>
References: <20211221190809.89882-1-saul.wold@windriver.com>
	 <20211221190809.89882-3-saul.wold@windriver.com>
	 <0137a7550504afc03ed41d8bc7e7fe26e7dba9d5.camel@linuxfoundation.org>
	 <b90b0597-15e4-f19d-2431-9afe77d6c33c@windriver.com>
	 <f55b92395da477d06df9b545ac6fc7ac47d0df41.camel@linuxfoundation.org>
	 <CADkTA4Mh78Kmg_NWoS+Bm4on+D_6wzCErawALKQqWdH9OsN9pA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 17:40:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160213

On Wed, 2022-01-05 at 12:30 -0500, Bruce Ashfield wrote:
> On Wed, Jan 5, 2022 at 12:07 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Tue, 2022-01-04 at 14:07 -0800, Saul Wold wrote:
> > > 
> > > On 12/22/21 01:09, Richard Purdie wrote:
> > > > On Tue, 2021-12-21 at 11:08 -0800, Saul Wold wrote:
> > > > > Stop ignoring or skipping the kernel and kernel modules code in the
> > > > > split debug and striping functions, this will allow create_spdx to
> > > > > process the kernel and modules.
> > > > > 
> > > > > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > > > > ---
> > > > >   meta/classes/package.bbclass | 8 ++------
> > > > >   1 file changed, 2 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > > > > index 84eafbd529..4b7fe4f1e1 100644
> > > > > --- a/meta/classes/package.bbclass
> > > > > +++ b/meta/classes/package.bbclass
> > > > > @@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
> > > > >       dvar = d.getVar('PKGD')
> > > > >       objcopy = d.getVar("OBJCOPY")
> > > > > 
> > > > > -    # We ignore kernel modules, we don't generate debug info files.
> > > > > -    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
> > > > > -        return (file, sources)
> > > > > -
> > > > >       newmode = None
> > > > >       if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> > > > >           origmode = os.stat(file)[stat.ST_MODE]
> > > > > @@ -1147,7 +1143,7 @@ python split_and_strip_files () {
> > > > > 
> > > > >                   if file.endswith(".ko") and file.find("/lib/modules/") != -1:
> > > > >                       kernmods.append(file)
> > > > > -                    continue
> > > > > +
> > > > >                   if oe.package.is_static_lib(file):
> > > > >                       staticlibs.append(file)
> > > > >                       continue
> > > > > @@ -1165,7 +1161,7 @@ python split_and_strip_files () {
> > > > >                       continue
> > > > >                   # Check its an executable
> > > > >                   if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
> > > > > -                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
> > > > > +                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)) or (f.startswith('vmlinux') or ".ko" in f):
> > > > > 
> > > > >                       if cpath.islink(file):
> > > > >                           checkelflinks[file] = ltarget
> > > > 
> > > > edgerouter:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/4513
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2507/steps/11/logs/stdio
> > > > 
> > > So I have been digging into this and it seems that an option was added a
> > > decade ago or so to strip the kernel/vmlinux when it's too big, this was
> > > done for at least the routerstationpro according to bug #3515 [0], and
> > > persists with the edgerouter, although I am not sure if it would still
> > > actually be required as the edgerouter also uses the
> > > KERNEL_ALT_IMAGETYPE to create a smaller binary kernel image.
> > > 
> > > The change I proposed causes the all kernels to be stripped all the time
> > > as part of the split_and_strip_files(). As I see it there few different
> > > options:
> > > 
> > > 1) Set KERNEL_IMAGE_EXTRA_STRIP_SECTIONS = "" in create_spdx.bbclass
> > >    - This solves the problem with create_spdx.bbclass is in use, but not
> > > the general case
> > 
> > I don't think I like this as it is a side effect that isn't obvious or expected.
> > 
> > > 
> > > 2) Remove the KERNEL_IMAGE_EXTRA_STRIP_SECTIONS from edgerouter.conf
> > >    - Will solve the edgerouter case but may not solve other usages
> > > unknown to me.
> > >    - Does anyone know of other machines/layers usage of this variable?
> > > 
> > > 3) deprecate the kernel.bbclass:do_strip function in favor of using the
> > > split_and_strip_files() of package.bbclass
> > 
> > I know Bruce has said he doesn't like this, however stepping back, these issues
> > were from a time our stripping code was young and evolving. If we can
> > standardise and have it all work together well in one set of functions, I think
> > that is worth looking at. I'd prefer the kernel wasn't a special case if it no
> > longer needs to be.
> > 
> > That said, I don't remember the details of why we did this.
> 
> There's a middle ground of debug being possible, and some sections
> removed to keep the footprint a bit lower. There were also some
> unwinders, etc, that didn't work when everything was stripped and
> split into debug. The stripping was too aggressive, and removed some
> sections that were required.
> 
> While I can't exactly point to the use cases for it now, with the 5K
> options in the kernel, they haven't all been removed, and I'd be very
> hesitant to remove the capability completely.

What may help would be to move the kernel stripping code from kernel.bbclass to
live along with the package stripping code, which would then at least solve some
of the QA warning issues and the two code blocks not fighting with each other.
it would also allow the debug symbols to move to the linked debug files where
appropriate more easily.

I think one of the challenges in doing that is the do_deploy of the kernel image
though which may not then have the right stripping :(.

We may be able to call the strip function from do_deploy though?

Cheers,

Richard




