Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79987C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 11:11:05 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.10268.1633518664352092318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bDlSZNMP;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id p13so8663033edw.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nsWyc78jvt93Sbc7S8FEdm0I8N9DUOiiW5BWXZxuV8s=;
        b=bDlSZNMPKhpJ3OisWYtgZIwcYQqDzZAxvfaJVxiSJYGy1QUPQ6dGJltaWgtO1XPg1E
         zRqNRZymAj347KkVOW4Bf1eIFlYaxfjHe67kjDeI0ZIArtgoV7wlQYi01BYstUkq5ImU
         H5sOLEYFjk/Yaj2jZRXBlsYAJGUAlHs15NM3hO4z0CNeNQ1F7Rw0e4O0y36Lnqhb/kCj
         4B6nsLBXFs5oZopV3gIkzGsJQvE/Z1QwEDNfWwDqyveRSVSeGxxvBLt8Q4ppzKkXM/49
         t6h+Ow0qpDbZNV4ZBESWgb6Qk5IAv+mD9Gs7pf8DRH0H9UIClb/T4lko29P6eMZg9LJS
         lQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nsWyc78jvt93Sbc7S8FEdm0I8N9DUOiiW5BWXZxuV8s=;
        b=5Y/YPShrCO9j4vA+xydcndTGnTXaedw5KBJt5b2KcnAn/mg4ABG/axEods5muHRVQ0
         BLKwXbnnd+uKQ65/mJZpEOg7O1Zey/LO8rPhPhgenA6vuhT6Bdyk37xqVx4zlivgO3vu
         99mhck4Slq8aCVk3pAHIFB9xPcH/MmfbFexwqtV4En70ub/0l9DwW3QTojXT4iXz0yuo
         N8z2BQejTuIgN7PikcKqcY30yFSLgGbWqjjHgD5+DkyS78fzrtAiPqjAzpp8zdtixKYc
         zQiErfCJ8k87ggN/FGWk54bqtZnJGpIL8T9pX2jNyAPqZU38OQRCbnEqcSSuazpTTXMS
         MdUA==
X-Gm-Message-State: AOAM5322kU5tXzbtT65RDK6S42YZhbN8TnrbduQ8t+0sVgbVF2ajg/A5
	4kxV5VVTxwPp0SbfmY0icg2fzEmwd+z82vTdmAk=
X-Google-Smtp-Source: 
 ABdhPJzogZldzd5aK7Trah2wkIebmKRvAZSrqYHVkCsXl0e843sq6Czy5NwSgE/wUCkHbygKiRkScBCOhuicPRgqShk=
X-Received: by 2002:aa7:de17:: with SMTP id
 h23mr13207907edv.223.1633518662550;
 Wed, 06 Oct 2021 04:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
 <9666edbab2d32cc53726d177bb23af9976ef90c9.1633478971.git.bruce.ashfield@gmail.com>
 <CAAnfSTs=_KTfkrRNn0bAwjEsG1kDX2MT1O9-Oo9swMh4+_L7fA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTs=_KTfkrRNn0bAwjEsG1kDX2MT1O9-Oo9swMh4+_L7fA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Oct 2021 08:10:51 -0300
Message-ID: 
 <CADkTA4PkEnyhXoF90Z6jtNW3UAkGCyxW3qxndszOiRLaFGw6PQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] linux-yocto/5.14: scripts/gcc-plugins:
 consistently use HOSTCC
To: Ross Burton <ross@burtonini.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 11:11:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156688

On Wed, Oct 6, 2021 at 7:05 AM Ross Burton <ross@burtonini.com> wrote:
>
> Can you drop this.  Turns out in fixing it, I broke it more!

This particular commit has to stay, since all the -stable kernels are
stacked on top.

But I'll revert, merge it to the branches and send a new SRCREV update
that would follow the -stable bumps.

Bruce

>
> Ross
>
> On Wed, 6 Oct 2021 at 01:12, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Integrating the following commit(s) to linux-yocto/5.14:
> >
> >     724df5812165 scripts/gcc-plugins: consistently use HOSTCC
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../linux/linux-yocto-rt_5.14.bb              |  4 ++--
> >  .../linux/linux-yocto-tiny_5.14.bb            |  6 ++---
> >  meta/recipes-kernel/linux/linux-yocto_5.14.bb | 22 +++++++++----------
> >  3 files changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
> > index a147e632e4..06064706e0 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
> > @@ -11,8 +11,8 @@ python () {
> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?= "7630ebb9fd510cf7aa31b6f1dd472f3b0442afb3"
> > -SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
> > +SRCREV_machine ?= "87e920626b63515458e304527509289993be2796"
> > +SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
> >
> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
> > index 20ff40d267..699c8c7da0 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
> > @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
> >  KMETA = "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL = "2"
> >
> > -SRCREV_machine:qemuarm ?= "ee2ccc84e65ade5ba0f8e1a700fba29a755746a1"
> > -SRCREV_machine ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> > -SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
> > +SRCREV_machine:qemuarm ?= "f956536237159b85f94d70bb9e74b5894e6bf07d"
> > +SRCREV_machine ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> > +SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
> >
> >  PV = "${LINUX_VERSION}+git${SRCPV}"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
> > index 0c6fbff75e..809b6fa066 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
> > @@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
> >  KBRANCH:qemux86-64 ?= "v5.14/standard/base"
> >  KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
> >
> > -SRCREV_machine:qemuarm ?= "8226a3a65df2dbae0fe71e9ff54cba70a9ba85e5"
> > -SRCREV_machine:qemuarm64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> > -SRCREV_machine:qemumips ?= "b5389debd85300e24b877f25c2e90381f1df7678"
> > -SRCREV_machine:qemuppc ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> > -SRCREV_machine:qemuriscv64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> > -SRCREV_machine:qemuriscv32 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> > -SRCREV_machine:qemux86 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> > -SRCREV_machine:qemux86-64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> > -SRCREV_machine:qemumips64 ?= "56cc67b699194944809832f4c8f58b9828f02bf9"
> > -SRCREV_machine ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> > -SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
> > +SRCREV_machine:qemuarm ?= "139cd4a6ac01e83002011680d9fbb14048c1bc3a"
> > +SRCREV_machine:qemuarm64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> > +SRCREV_machine:qemumips ?= "f5a73ebec6f028075220c690bbb121284313ebd3"
> > +SRCREV_machine:qemuppc ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> > +SRCREV_machine:qemuriscv64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> > +SRCREV_machine:qemuriscv32 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> > +SRCREV_machine:qemux86 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> > +SRCREV_machine:qemux86-64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> > +SRCREV_machine:qemumips64 ?= "912fc3d0cf57239e6fe5030b82165b2d6f0632e3"
> > +SRCREV_machine ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> > +SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
> >
> >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
> >  # get the <version>/base branch, which is pure upstream -stable, and the same
> > --
> > 2.19.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156661): https://lists.openembedded.org/g/openembedded-core/message/156661
> > Mute This Topic: https://lists.openembedded.org/mt/86108488/1676615
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

