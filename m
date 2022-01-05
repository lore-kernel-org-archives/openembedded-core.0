Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B301C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 17:30:36 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.3742.1641403834578459419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OkSdOSP5;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id q14so157106425edi.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 09:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dWypw1GGQE6JXLlE/1rd+/XD6LnO8Wf/fDB21gTENIg=;
        b=OkSdOSP5uz1vrnNIM24NEU6XsxbtkNEWMp0D3qtBmi1AUB4sWPNiW83+0+6ORXUcyz
         C2icBwyUaYJXAVBjhdNnHrn5b36QhDTYE10QgBL19hMEBZQNbLBRgup67oCtUhQtnW2G
         9giV/B/1Y13prPqeqIbmUXeVhAqJ+4ZCJbgHzZlK68uHHypSYfEmy1U/oIpizMJ7axrN
         JsDiROfUOEoXGQGvZb3sZTQ3mKHI3xyC5ygsYsEVxzGBMtK6zfopFPfF1QPGQz3JfUiN
         43oC2y3EIE22TNhG+hFk9tgBNIKXXIBdRgp4yXYPS+QaMBpmLU6BMWAzwfVF3LbL5RiA
         XqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dWypw1GGQE6JXLlE/1rd+/XD6LnO8Wf/fDB21gTENIg=;
        b=TMN6WE8jyipgiejiowB5Yg7WOw30NTcTstZXVgRSGSr4HeSICY5q1ZNLPvCBGGT0Nc
         sMXTUb25H8Eq4edTm77HnBJEtgaBZ8HWy91O85mC7T4ClhABqS6GjTwqKJwpXX8GZSSo
         SOae6RLrUl2CIZO8QcBt0tXYvzNnlOVjs2CMJYL7GmJJEnlTYP42U2Lr+QGcLWjpkhZl
         ugKsU+WxHmJnLm9NQ9Feyqd53FpGAHXJHfggtGYxHVpfNJq1PK2vTnn7AdpoFYLb8fee
         nzI2IEKqYWPD66XW39BbELolwZYc+MMg5SMUrZC7ZMcF0BLPIMDN+y9zNtwbJkuezHht
         2Wpw==
X-Gm-Message-State: AOAM533/+Bn8b6VjQ/6eZ+cvNemdsAmioapF5baWLbRmVAcUyxFnawK0
	b5IOrSHSU8FLGwdp365gnxZRRsXwDCG6tVo/Os8=
X-Google-Smtp-Source: 
 ABdhPJx/AfniL2wF3lXjBwsVJitqaxxX3uezQKDxhY6Gj4ZwhuAKkOIOSkLnz5dUetjhpT0WefBjdJkejFAqei1gcO0=
X-Received: by 2002:a17:906:5048:: with SMTP id
 e8mr16919718ejk.651.1641403832677;
 Wed, 05 Jan 2022 09:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20211221190809.89882-1-saul.wold@windriver.com>
 <20211221190809.89882-3-saul.wold@windriver.com>
 <0137a7550504afc03ed41d8bc7e7fe26e7dba9d5.camel@linuxfoundation.org>
 <b90b0597-15e4-f19d-2431-9afe77d6c33c@windriver.com>
 <f55b92395da477d06df9b545ac6fc7ac47d0df41.camel@linuxfoundation.org>
In-Reply-To: 
 <f55b92395da477d06df9b545ac6fc7ac47d0df41.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Jan 2022 12:30:21 -0500
Message-ID: 
 <CADkTA4Mh78Kmg_NWoS+Bm4on+D_6wzCErawALKQqWdH9OsN9pA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: don't skip kernel and
 kernel modules
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Saul Wold <Saul.Wold@windriver.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>,
 Bruce Ashfield <bruce.ashfield@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 17:30:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160212

On Wed, Jan 5, 2022 at 12:07 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-01-04 at 14:07 -0800, Saul Wold wrote:
> >
> > On 12/22/21 01:09, Richard Purdie wrote:
> > > On Tue, 2021-12-21 at 11:08 -0800, Saul Wold wrote:
> > > > Stop ignoring or skipping the kernel and kernel modules code in the
> > > > split debug and striping functions, this will allow create_spdx to
> > > > process the kernel and modules.
> > > >
> > > > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > > > ---
> > > >   meta/classes/package.bbclass | 8 ++------
> > > >   1 file changed, 2 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > > > index 84eafbd529..4b7fe4f1e1 100644
> > > > --- a/meta/classes/package.bbclass
> > > > +++ b/meta/classes/package.bbclass
> > > > @@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
> > > >       dvar = d.getVar('PKGD')
> > > >       objcopy = d.getVar("OBJCOPY")
> > > >
> > > > -    # We ignore kernel modules, we don't generate debug info files.
> > > > -    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
> > > > -        return (file, sources)
> > > > -
> > > >       newmode = None
> > > >       if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> > > >           origmode = os.stat(file)[stat.ST_MODE]
> > > > @@ -1147,7 +1143,7 @@ python split_and_strip_files () {
> > > >
> > > >                   if file.endswith(".ko") and file.find("/lib/modules/") != -1:
> > > >                       kernmods.append(file)
> > > > -                    continue
> > > > +
> > > >                   if oe.package.is_static_lib(file):
> > > >                       staticlibs.append(file)
> > > >                       continue
> > > > @@ -1165,7 +1161,7 @@ python split_and_strip_files () {
> > > >                       continue
> > > >                   # Check its an executable
> > > >                   if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
> > > > -                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
> > > > +                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)) or (f.startswith('vmlinux') or ".ko" in f):
> > > >
> > > >                       if cpath.islink(file):
> > > >                           checkelflinks[file] = ltarget
> > >
> > > edgerouter:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/4513
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2507/steps/11/logs/stdio
> > >
> > So I have been digging into this and it seems that an option was added a
> > decade ago or so to strip the kernel/vmlinux when it's too big, this was
> > done for at least the routerstationpro according to bug #3515 [0], and
> > persists with the edgerouter, although I am not sure if it would still
> > actually be required as the edgerouter also uses the
> > KERNEL_ALT_IMAGETYPE to create a smaller binary kernel image.
> >
> > The change I proposed causes the all kernels to be stripped all the time
> > as part of the split_and_strip_files(). As I see it there few different
> > options:
> >
> > 1) Set KERNEL_IMAGE_EXTRA_STRIP_SECTIONS = "" in create_spdx.bbclass
> >    - This solves the problem with create_spdx.bbclass is in use, but not
> > the general case
>
> I don't think I like this as it is a side effect that isn't obvious or expected.
>
> >
> > 2) Remove the KERNEL_IMAGE_EXTRA_STRIP_SECTIONS from edgerouter.conf
> >    - Will solve the edgerouter case but may not solve other usages
> > unknown to me.
> >    - Does anyone know of other machines/layers usage of this variable?
> >
> > 3) deprecate the kernel.bbclass:do_strip function in favor of using the
> > split_and_strip_files() of package.bbclass
>
> I know Bruce has said he doesn't like this, however stepping back, these issues
> were from a time our stripping code was young and evolving. If we can
> standardise and have it all work together well in one set of functions, I think
> that is worth looking at. I'd prefer the kernel wasn't a special case if it no
> longer needs to be.
>
> That said, I don't remember the details of why we did this.

There's a middle ground of debug being possible, and some sections
removed to keep the footprint a bit lower. There were also some
unwinders, etc, that didn't work when everything was stripped and
split into debug. The stripping was too aggressive, and removed some
sections that were required.

While I can't exactly point to the use cases for it now, with the 5K
options in the kernel, they haven't all been removed, and I'd be very
hesitant to remove the capability completely.

Bruce

>
>
> >
> > 4) Change error to warning in packaging.bbclass for the kernel only
> >    - This would explain that a kernel image (vmlinux) is already
> > stripped and extended package data would not be available for for SPDX
> > creation.
> >
> > RP, Bruce, Joshua: Thoughts?
>
> If we can simplify and stop the kernel being a special case for this code (or
> handle kernels generically) that would be worth a bit of effort IMO...
>
> Cheers,
>
> Richard
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160211): https://lists.openembedded.org/g/openembedded-core/message/160211
> Mute This Topic: https://lists.openembedded.org/mt/87884056/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

