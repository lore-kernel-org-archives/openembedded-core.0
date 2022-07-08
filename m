Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D31C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 13:37:15 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.7616.1657287435205007703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qYBLomqU;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id j3so10910059pfb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qNB0g3Azc/WO65NeJSYPDy8IQTPEaJB77QA+R3S56GQ=;
        b=qYBLomqUw1gOrwDf4dW6YyvQzYcKNgncm2vWCfd1/DOvxEJc1E/Q2DHSwp4KuV8hRV
         hWeu5Er2FJYmdfJTW11LAjWkvtYCvI3ioEnUgxsU1MOajlKHHP2YsLUHm6/72vhGQlIl
         OBtP0XBvrXhVi6YRRAYb51KcIDjPtIR4ObnBqRAksK1JR/5FLK9uPOJjYxhRpqpBWLNM
         p3i141G2wHXsZYHXIUJM5OQAbSLlTLcBjc76a2BptGXSMNff9s7sztW3RO2wDKYSEU+i
         IZjLuBTc3iimDn/cEqjNXm/BiU9relYdUnCJvQPEmeXX+E7iX25Fc4bI5NgVD+vdZzGR
         tHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qNB0g3Azc/WO65NeJSYPDy8IQTPEaJB77QA+R3S56GQ=;
        b=mLhs7JzT9s9RHuraaGgRrvoTSCPyHjIpK/sVQB4OELBXaeHhPMBTAlGX6QuetSx2W5
         sVTC05vUsQSxxeUg8GeC/4odOPIs6ZwJOgjEtigEFr+lgwuSTUcZGtFoY/y+Eg7JEOiG
         UJzyw6JOr9TehsHcU8Jrves+xVAA9y+HVRMNfKNKztgfj+zCT8NvY2jt3AXFpeNPdvJN
         QFiR+uP57z7V3TNUQPvl5jI9igjlOydb1W+LNuIQeNRR59m2LSw133ICWpPbDlzl5j5Z
         kSGK7mcCUjg9f4ZEL98hMpEMLwpy+XHX02lopqaA2gBbmCYF02jWSj3zRsGqkjmKPuzV
         WwHQ==
X-Gm-Message-State: AJIora99q5+A5Jl1pZefeEtVglvKb0OgcK5glcPHHCudaNmHl8LwuAHU
	B9a2/IrcjpRR9TAYS7gBlbAR7rWom8GNq1WihJQ=
X-Google-Smtp-Source: 
 AGRyM1vJ9okd4nf3hMRkgVIKWCe0OJfeYYfaXCYmRWCR97qGnxvLupmnBP9Ujr2gMw5Z9pRHXBbaujDm3dDc/vb0Ed0=
X-Received: by 2002:a63:9041:0:b0:415:c0e8:c588 with SMTP id
 a62-20020a639041000000b00415c0e8c588mr1161522pge.282.1657287434385; Fri, 08
 Jul 2022 06:37:14 -0700 (PDT)
MIME-Version: 1.0
References: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
In-Reply-To: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Jul 2022 09:37:02 -0400
Message-ID: 
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 13:37:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167824

On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi All,
>
> We've made good progress and I appreciate the help from people. I ran a
> fresh build on the autobuilder and I forced it to rerun the QA checks
> for all recipes. The tricky bit about warnings is that they don't show
> up for objects from sstate and the addition of the buildpaths QA check
> doesn't cause the checks to rerun. Due to that a few more previsouly
> unseen issues cropped up.
>
> The list of issues now stands are:
>
> qemuppc:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5428
> WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]

I'll take this one. My fix was only for arch/arm, but I'll expand it
to cover ppc32.

>
> meta-arm:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2629
> stdio: WARNING: perl-5.36.0-r0 do_package_qa: QA Issue: File /usr/lib/perl/ptest/dist/threads-shared/Makefile.old in package perl-ptest contains reference to TMPDIR
>
> meta-gplv2:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/5460
> WARNING: bash-3.2.57-r0 do_package_qa: QA Issue: File /usr/bin/bashbug in package bash contains reference to TMPDIR [buildpaths]
> WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDIR
> WARNING: diffutils-2.8.1-r7.0 do_package_qa: QA Issue: File /usr/bin/diff.diffutils in package diffutils contains reference to TMPDIR [buildpaths]
> WARNING: findutils-4.2.31-r4 do_package_qa: QA Issue: File /usr/bin/updatedb in package findutils contains reference to TMPDIR [buildpaths]
> WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]
>
> There is a proposal on the oe-architecture list about simply disabling
> this layer going forward. The increased number of issues reinforces my
> view on that.
>
> meta-virt:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/292
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/xen/boot/xen-shim in package xen-tools-shim contains reference to TMPDIR [buildpaths]
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/src/debug/xen-tools/4.16+stableAUTOINC+f265444922-r0/git/tools/libs/light/dsdt_pvh.c in package xen-tools-src contains reference to TMPDIR [buildpaths]
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.so.4.16.0 in package xen-tools-libxenlight contains reference to TMPDIR [buildpaths]
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.a in package xen-tools-staticdev contains reference to TMPDIR [buildpaths]
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/debug/usr/lib/xen/boot/xen-shim-syms in package xen-tools-dbg contains reference to TMPDIR [buildpaths]
>

Hopefully Christopher can chime in here. If not, I'll have a look
early next week (or over the weekend).

> There is also still the lttng-modules issue if we enable .debug
> checking. I disabled that for these tests to reduce the noise.

This is one I can pick up as well, if no one else gets there first.

Bruce

>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167819): https://lists.openembedded.org/g/openembedded-core/message/167819
> Mute This Topic: https://lists.openembedded.org/mt/92248896/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

