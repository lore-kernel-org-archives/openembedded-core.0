Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123E5C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 13:29:48 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.11985.1660051778305483865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 06:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EHROobMV;
 spf=pass (domain: gmail.com, ip: 209.85.160.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-10ea7d8fbf7so13912493fac.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nHjiCq+nT+bajU8kT9r2c5GmNiemplathiOsb8jKKyc=;
        b=EHROobMV8cBtjMV1xEjhr0ksLjbzKIN7ofa44SzbaiIq/VR5TA0hPszl5c15pDDbBh
         iLCny1Rb97pjlfQggdnGk+bs/YXqodCC+jpl9Nw436UHrC48RMZElcgdmJwYhq7FSDDR
         zLMs2ntCtjJlP9XqxETBfYQbClDBjWGXW23zlKPQn4mxVLsUCtX9/KCsBI+scTYr03Qg
         lNSzDO3Hb/vWi/yie0SNGOXwgIAr7yGgMGXR6oHNSs7KgUb66xwQ+WznU6Al0szPPZDp
         uNrIxZ0ZZLotT8I/XOgdgWcdm5yyovgLxFv2KEqPan5yvcOu22FTS+dTEpnGnoRGpIe4
         qIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nHjiCq+nT+bajU8kT9r2c5GmNiemplathiOsb8jKKyc=;
        b=Fqc6H9XMdup1in07ObatMgLzIC2O+9oWBAhdxQNvLM45IM/b0Lrr09k3DRTU43Cg4+
         6kchk2pMxc2lFjno7dfRCV58l1DAoZEvpbdm+Aec68uExfTg1iE0ZiPK/kIGSVxb+l7B
         F8/CwO6GSfLw5NzXAdw57FPokCqYbkgg5Qzh/bcuv00xRfKjKizZkO/5FGKd9i/qYAmo
         6O3do7G3PoAFT/C+jv6XyYHnwsu5F6E5jJCKP1p8elmNRhC+7dc5DE6r2s5lRjOX4627
         pGUEPQgsEaNbDYyCRwK4QDkXl44h8gEyD0EuJwQuEnSxQ/8XUjyUgqtvnZavNYfTZumb
         ViMw==
X-Gm-Message-State: ACgBeo3BeCyBo59Y7N0tVQloRmlAaJKS/zEi6C43wacPm23qGbIX2Uj5
	1KP+eAOAMDpstpB+YtesUhq53vL8gdIeq6qnKImTTldYRCw=
X-Google-Smtp-Source: 
 AA6agR6aVnl2tl/9dNcnS4F+nr9QGzaM4kmWGTeVevWtiZhFSuWZaQk9jU1bJ2qG1AiznYfItbJJukYOPU4/G6HjDDU=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr14001872oae.6.1660051777510; Tue, 09
 Aug 2022 06:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220809111449.192321-1-richard.purdie@linuxfoundation.org>
 <CADkTA4MBRL7JuLA8D32K1_CcyDMcRO=hfJyghPHyUZtwKw-nqA@mail.gmail.com>
 <bfc1c1a5b9ac8093b409129b825c41696650f66a.camel@linuxfoundation.org>
In-Reply-To: 
 <bfc1c1a5b9ac8093b409129b825c41696650f66a.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 09:29:25 -0400
Message-ID: 
 <CADkTA4OnaX_jAn7GLbOVRSONWqTcMdc9Zk4Fg4ULdeUDEDjnXw@mail.gmail.com>
Subject: Re: [PATCH] kern-devsrc: Drop auto.conf creation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 13:29:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169150

On Tue, Aug 9, 2022 at 9:26 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-08-09 at 09:16 -0400, Bruce Ashfield wrote:
> > On Tue, Aug 9, 2022 at 7:14 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > After this commit in the mainline kernel, the quoting is different in auto.conf
> > > compared to .config:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=129ab0d2d9f38b9d43df35235fc66c6740d6928b
> > >
> > > We therefore can't just copy one over the other or it leads to syntax/quoting
> > > errors. We end up running make prepare anyway in all our tests so drop
> > > this copy for fix 5.19 kernels.
> >
> > It is safe to stop doing this manipulation now.
> >
> > But I am curious, I was running on-target tests for 5.19+ and didn't
> > have any issues, what is breaking that I managed to miss ?
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/5629/steps/13/logs/stdio
>
> Basically any kernelmodule.KernelModuleTest.test_kernel_module which
> was run was failing (which would run on any image with kernel-devsrc in
> and a toolchain). It failed everywhere, all sdk qemu machines equally.

odd. I never did see that same error, and I built and installed kernel
module for all the architectures.

Bruce

>
> > There is a risk that if the .cmd files start regenerating because of
> > this missing, or the different timestamp, that we'll have issues. But
> > putting it through the AB should show us if that is true.
>
> After this change is applied, the build looks a lot greener and this
> issue goes away.
>
> Cheers,
>
> Richard



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

