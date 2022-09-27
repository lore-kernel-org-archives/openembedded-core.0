Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC7BC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 19:24:16 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.15238.1664306645940332084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cVPeTrYy;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 129so8840786pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GOTq5Swz+8ikD5c0YFG+dO/plXU1EAWEl0aMtJszqH4=;
        b=cVPeTrYyWntic+boLkTwlkt7/J0K9iRsASXYX1plXQIVBdY1TeGHUCHjUlO5hsf6A7
         GdV1Ogrdh3frt2fyGdLqfEZ9wOcSjzIuYNCJmyiUPAdGITBwy7BknHIy3NGOkDwwMrOV
         jRRr4hrzRSRx+z0BsOsOH8LafFbsE0Yf247Y7G2WygyZy/RMHO8Gb2qW1gTBQxQ+4oDr
         X9pA/Gdm/zaKaD9K4UGy1QPKHjAnFBZ/jgtpus3Dx1MS1cgQh9+p9BhgRN0ChMsYxCB3
         i3sXiNiHf79fDkLqQ+ZYshztz+gfFicL5IqxD0mpaqWt6E/SX22BwrkRddN4HrlAjdVo
         x/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GOTq5Swz+8ikD5c0YFG+dO/plXU1EAWEl0aMtJszqH4=;
        b=irbITX6ftYfafQxaFR4lteCc37YYLP5cB/gQHewTPS8Uu6uNgxwWQs4/hYG39C5rZ5
         iI4mu1mRdjy3ODFeaReempS+1xSIs1BOQnl8iNrTRCw2knSQhfuI1yTqhtljEAqGZDxd
         wl2dN/J2sUbknCrI14d1oyQE0Yh8OXFSwQ7NcwnvpWwH3+0bjawVf64O2BC1K5qzOkjW
         FWf8cwbiqiw/GPjy7P4HLvbJUTcEcAcCJDVnE5Qkm87VoBl3KcbUFIg2vgjPG4nWneYd
         H4W2n58qM8Bm2ES2k/ZdvZKKxooe7gK5pNQ1e+LyFZST/CMUxef+H/wc9o8xDjD0b/yi
         zP/g==
X-Gm-Message-State: ACrzQf0WGLcT4DC7nx2gb5Jiz5Pv+vBrDgHwJHE6wR/knF/ys/K/QfA4
	35LgDPTTIX4aGPoes5BWxZ3YFt9mzNTNyB+2bHg=
X-Google-Smtp-Source: 
 AMsMyM5ynm0Pic8sfZ53tWiTE0miOPuTAjxAjlrYSC+2y/ejZaPCG/xvr1g8hJ0o21FIcvNT8Lprr0K+MEEpdrGuc4s=
X-Received: by 2002:a63:d241:0:b0:43c:474c:c6c6 with SMTP id
 t1-20020a63d241000000b0043c474cc6c6mr20901845pgi.523.1664306645299; Tue, 27
 Sep 2022 12:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220927190553.7313-1-bruce.ashfield@gmail.com>
 <CAMKF1so9ByR=p1N=RW+TFkF0O6A8rR-JkpSQYNq41NGZFy+W6A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so9ByR=p1N=RW+TFkF0O6A8rR-JkpSQYNq41NGZFy+W6A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Sep 2022 15:23:53 -0400
Message-ID: 
 <CADkTA4M=1Cem8aikAi2ui6C-RkEkGOy+2HX+b89D71NmCuo3eQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/5.19: fix gcc-11 warning
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 19:24:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171128

11. The full upstream commit is:

Author: Florian Fainelli <f.fainelli@gmail.com>
Date:   Sun Jul 31 19:51:09 2022 -0700
    libbpf: Initialize err in probe_map_create

   GCC-11 warns about the possibly unitialized err variable in
    probe_map_create:


    libbpf_probes.c: In function 'probe_map_create':
    libbpf_probes.c:361:38: error: 'err' may be used uninitialized in
this function [-Werror=maybe-uninitialized]
      361 |                 return fd < 0 && err == exp_err ? 1 : 0;
          |                                  ~~~~^~~~~~~~~~

    Fixes: 878d8def0603 ("libbpf: Rework feature-probing APIs")
    Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Bruce

On Tue, Sep 27, 2022 at 3:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> gcc11 or 12 ?
>
> On Tue, Sep 27, 2022 at 12:05 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Integrating the following commit(s) to linux-yocto/5.19:
> >
> >     65a9a22786a6 libbpf: Initialize err in probe_map_create
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >
> > Ross identified this change as worth backporting to fix some
> > gcc-11 warnings. I've been soaking it for a bit, and haven't
> > seen any issues.
> >
> > Bruce
> >
> >  .../linux/linux-yocto-rt_5.19.bb              |  2 +-
> >  .../linux/linux-yocto-tiny_5.19.bb            |  2 +-
> >  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 20 +++++++++----------
> >  3 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> > index 17ae94066c..b3e9fbae62 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
> > @@ -11,7 +11,7 @@ python () {
> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?= "3596666292dcf3fc078090666dc327d233695310"
> > +SRCREV_machine ?= "bc8af638c00f28a46e77e34056079087638f6e65"
> >  SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
> >
> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> > index c18278ad79..466b7063b4 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
> > @@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
> >  KMETA = "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL = "2"
> >
> > -SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > +SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> >  SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
> >
> >  PV = "${LINUX_VERSION}+git${SRCPV}"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > index 4fc1ae9245..f882972e35 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > @@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
> >  KBRANCH:qemux86-64 ?= "v5.19/standard/base"
> >  KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
> >
> > -SRCREV_machine:qemuarm ?= "9111e441d26961e67bef7866919c51b27e794bac"
> > -SRCREV_machine:qemuarm64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > -SRCREV_machine:qemumips ?= "5f89b6548b6665f3ebec11266f2c7db2793129da"
> > -SRCREV_machine:qemuppc ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > -SRCREV_machine:qemuriscv64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > -SRCREV_machine:qemuriscv32 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > -SRCREV_machine:qemux86 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > -SRCREV_machine:qemux86-64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > -SRCREV_machine:qemumips64 ?= "99613988297ac45653cc81319e63b2821645a3ba"
> > -SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
> > +SRCREV_machine:qemuarm ?= "446661f6a3b07535304497c1a51d9cab95f48f0b"
> > +SRCREV_machine:qemuarm64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > +SRCREV_machine:qemumips ?= "98da147618fca3da29cf1c6ab9c53f24de2c587c"
> > +SRCREV_machine:qemuppc ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > +SRCREV_machine:qemuriscv64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > +SRCREV_machine:qemuriscv32 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > +SRCREV_machine:qemux86 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > +SRCREV_machine:qemux86-64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> > +SRCREV_machine:qemumips64 ?= "53842054198d851b5deb5810afaf126156efbb54"
> > +SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
> >  SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
> >
> >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
> > --
> > 2.19.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171124): https://lists.openembedded.org/g/openembedded-core/message/171124
> > Mute This Topic: https://lists.openembedded.org/mt/93957254/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

