Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8F9C35273
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.1399.1649447633353020669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=oZIlVxv3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id c199so3994060qkg.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iunc42Sz4221gEA7InsZ5PhJaxBLgXqrkNxqe7Xb5R0=;
        b=oZIlVxv3ICDGgk3b5y/6NTzYf+b7eVn99OajWeVs2CMdKS5B5r3Q+vZV6JNcsWYPcl
         7eZ2cgbILYMbTRaPLp/2a3vEqOODQTBsKTushGvGhBtCO88Gsv/iId4xdGyrQsQSk5j8
         FcPTj5fTOkh+Zsu/UKergDoVJjU4UsWwswJDGsJaLfzNtgt7DWihod6Dl9LErgAWq66X
         6VssNi2OXeqyXLjuwqSVGWV8/lNI40vOsRjF77CmMXursnQsEnYnH8HhOnw7MhmPiNhF
         uC0T8QEyxhprbALsPrpEklzlJZefeMgKcV7Me0kwgGxiGPwYXNJtDt9jl6QksJx88FqO
         aCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iunc42Sz4221gEA7InsZ5PhJaxBLgXqrkNxqe7Xb5R0=;
        b=en7VVN5KXiqBnzqi0EJuoRDPIQ+vZWcMS/NqLKeqkuvEQFXhIhsP3+VALQS4qFFs8P
         TeA1d4uJVCr3/+VuTr9WvoAsIDEdtixPkN5ULumnnRb2VBFKnBnbUvPH/NH2L9bClWZc
         zngkn6NRkLj9fCD5uf0HhRgiUCl4q4iREhB8wH1/1j54FVzqlk1cmUamVXusCd+5KQ5a
         fvTSdG5DRBavpcZEBBKhKi5oLen+282Te/+YFMzdFDe0twguOy1FSWD/Q+tPHMyextrF
         fOd6GXLegZf49LvjwwzZKLuM5CSPR3lQ73cFfwGnonqBqjeq3KpzQJTCBUAUXVixXZEh
         UVqg==
X-Gm-Message-State: AOAM531hdUI8LN1ZxqFzLKxLQ6ESqBZkEeYGu1SjPUZcDiDjNNmLbX7D
	Y6sFzj3rO4vfnKiVUUa8cIQ1fiAXjTDLY8O/bC3ogw==
X-Google-Smtp-Source: 
 ABdhPJwHcjiJmGITH67iPQn2sE3FephNaUgW9bt3MMrZKZ9nEvJe577RYwQEg/tz+Ywys4DAUoRdQpjrX4L2mSBhx7c=
X-Received: by 2002:a05:620a:95c:b0:680:e024:5336 with SMTP id
 w28-20020a05620a095c00b00680e0245336mr14288167qkw.690.1649447632416; Fri, 08
 Apr 2022 12:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220408192521.1608764-1-jdmason@kudzu.us>
 <20220408192521.1608764-7-jdmason@kudzu.us>
 <5fdfba27-f618-e1c5-106a-85d967fa77f9@gmail.com>
In-Reply-To: <5fdfba27-f618-e1c5-106a-85d967fa77f9@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 8 Apr 2022 15:53:41 -0400
Message-ID: 
 <CAPoiz9xwgBZCWM3uaat7ifXAOEMth0ss22PFvGQU7=2toYiPrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 6/6] poky-tiny: enable qemuarmv5/qemuarm64
 and cleanups
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164171

On Fri, Apr 8, 2022 at 3:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 4/8/22 12:25 PM, Jon Mason wrote:
> > Add support for qemuarmv5 and qemuarm64, and remove qemuarm specific
> > entries, as it should be generic now.
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >   meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > index d8ce5dc518d5..43a5ad728a5d 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > @@ -1,5 +1,4 @@
> >   KBRANCH ?= "v5.15/standard/tiny/base"
> > -KBRANCH:qemuarm  ?= "v5.15/standard/tiny/arm-versatile-926ejs"
> >
> >   LINUX_KERNEL_TYPE = "tiny"
> >   KCONFIG_MODE = "--allnoconfig"
> > @@ -15,7 +14,6 @@ DEPENDS += "openssl-native util-linux-native"
> >   KMETA = "kernel-meta"
> >   KCONF_BSP_AUDIT_LEVEL = "2"
> >
> > -SRCREV_machine:qemuarm ?= "cc9e92e826af229b841fcaf8c645e638a86eba43"
> >   SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
> >   SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
> >
> > @@ -24,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
> >   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> >              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
> >
> > -COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
> > +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"
>
> why are we dropping qemuarm ?

What?  It's adding qemuarm64, which looks like a change of qemuarm to
qemuarm64, but you can see qemuarm after qemuarm64.

>
> >
> >   # Functionality flags
> >   KERNEL_FEATURES = ""
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164169): https://lists.openembedded.org/g/openembedded-core/message/164169
> Mute This Topic: https://lists.openembedded.org/mt/90343240/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

