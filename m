Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59497C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 17:06:30 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web09.418.1660237585096685423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 10:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M4QghD6e;
 spf=pass (domain: gmail.com, ip: 209.85.160.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so22227709fac.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=q7HYOZzjPUL9Vh8d+wijD/krtgEbU6BcOccCqoXbtM8=;
        b=M4QghD6eFbaYppaOYrtnhxNNfecJ36LhWrtKz+/FB3+TQVybA5ybNxO3XjH3XhIaJU
         rDTucKfx0068+BWlEAdT1Pmj4TlHBVg0OxW0h3ZlMmAc7O5vHDmkmkVYOSkDYp8dFKEW
         aUoH3MSouxr7n0F1I2x12vz7/wWzfxkhNcQTyWuxznv/OZs3yhkzXaL1IjGxBPsCgv+C
         yWesTV9ejB75GolI0q19trjlzw4TDXhbiGadFbZuCytAhspgT2PpX8sbd5Ql4jhZ1tTq
         IpTsyEz+aGW8tb4ReeVfouh32iBAbRbOAeJef6ooQgsoiZ2Q5Lvp4tVXtzRL8Vo9fAGd
         +dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=q7HYOZzjPUL9Vh8d+wijD/krtgEbU6BcOccCqoXbtM8=;
        b=RYcS5o05xy5z3iuuI+gEG4o0yFMFIv38g/dM9js5kBGAXIASFwZHerK/RiN2JEtHi7
         9HhCBQyiJEhfSTCp/HTURNu8roKLrd9/SWHndas7nU24TrYy2yCE75g8dYaOv+uBe/pS
         BGgYSyG4vb7G/1Ma1mVVgBrH9xpJ/eovuYLaGh7szaIG71oalQoVEQrC70yJsSlF6/aj
         +X3+381Vf2aVcgDTWuM6fJm8xOcypnZl1ivKalDL+OdUYmlPC2QmOmmDh7Ue/ItFIKeT
         AY7/fyfPfmEu3le49nYg04o3QKKsEUnezQTBfbYRnroyr6imA3AnPFEjeA8HqavAdqSX
         D4KA==
X-Gm-Message-State: ACgBeo3BsKafGsbyKE14GQB8RdfVFM/Y49c3JxIUXxNvGkrYvRR4Pl32
	juAh/ru0p33J7RoXFTAWKsThNDOtvUD30dylOdg=
X-Google-Smtp-Source: 
 AA6agR69sjukFH1Z/jmF2H/tENcV6MkynsX1pbvvR0vFejY4O4M3TN0r3XkJ4E69mMo/zZSlJrD7zE0abhKuF9LBtP4=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr4062010oae.6.1660237584361; Thu, 11 Aug
 2022 10:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220811161757.278819-1-jose.quaresma@foundries.io>
In-Reply-To: <20220811161757.278819-1-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Aug 2022 13:06:12 -0400
Message-ID: 
 <CADkTA4PaFdRpyxko=bpRQ5CVoAVgD8g8Nt4SMW_0USAYme3RkQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] module.bbclass: rebuild the modules when kernel
 change
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io,
	daiane.angolini@foundries.io, otavio@ossystems.com.br,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 17:06:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169258

On Thu, Aug 11, 2022 at 12:18 PM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> When the kernel is rebuild or some of they tasks change the
> kernel modules is not rebuild as well and will comes from
> the sstate-cache.
>
> [YOCTO #14885] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14885
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes/module.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index a09ec3ed1e..d377a08bc6 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -1,5 +1,7 @@
>  inherit module-base kernel-module-split pkgconfig
>
> +DEPENDS += "virtual/kernel"

There's already a dependency on virtual/kernel:do_shared_workdir() through
module-base.bbclass and the make-mod-scripts dependency.

And that dependency was a change to this:

-# This is instead of DEPENDS = "virtual/kernel"
-do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"

i.e. we've always had a finer grained dependency than what is being
proposed here.

We need to understand why that shared_workdir() dependency isn't
doing the job any more, and if there's no way to fix it .. then going back
to the older compile dependency is still lighter weight than depending
on virtual/kernel (and the default of do_prepare_recipe_sysroot).

It must (could?) be something with the shared workdir changing the interactions.

Bruce

> +
>  EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
>
>  MODULES_INSTALL_TARGET ?= "modules_install"
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169253): https://lists.openembedded.org/g/openembedded-core/message/169253
> Mute This Topic: https://lists.openembedded.org/mt/92962048/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

