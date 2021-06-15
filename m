Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.1419.1623793180591924842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 14:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XZ5SNEvR;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id hq2so184172ejc.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=gK8gZZNT/yjFVvdNrBy10wKiwSedWCi3Stw/CY2DqtM=;
        b=XZ5SNEvRxB9kBDnY5g5f83fccFMFL4Nllc/4JVVyp15gSaORf1QqQBWxU16tN5PkSa
         /VmFcTSE45DFuPlL/PPIT3KqPXgddPtl9ls0xFgoejdCmNO+k8nzq1hk8K42v7VbVrtX
         hN9ZWUCiPf+qqgVGUjUTh6BmLSiGFWRdtyvqDrfyUVT+yOII9a3aGZdbpfPjcQXuzxy1
         diNqYRr7c1xYG1ZCyKvXqr6gUqjOTU+qOmMAgrhGhLGMikdwSkrO761g9sbHONw9gKYR
         JzKu0A78BfmD2hhD6tWcicpjHw+nULTEIJfjh9ZepNdtn9ovByKxzfdjZ5yhuakgnYtN
         t5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=gK8gZZNT/yjFVvdNrBy10wKiwSedWCi3Stw/CY2DqtM=;
        b=dgTl5ER+QSpDbsT+nzu/RMe4ZZy5NQkYXrdiPbVPt7vKOM4w5TCf0j8v420/pBzetY
         3CcLBmToLokkMI8GasnKjK5jPSC9I7Mnh+c2tdCKaNnOVq65KWPQkbUiDmlWWpKsOXK/
         EwWoQI7OT6jGnvHTVanb1wmplKFziK4zs4E9l6UNV20px3maAYYs677zlPQCbLnsS1cC
         thGfbpf4wMBic8TqfmnKpSFxG5R1SOeYxFN9tyzmTCnq8oq4Vq4SwWfFN9LXc7zRKiD0
         AXFODWd5TY6mo5DmILN16VburR+jwq54kvOu5zKVEzZovs1dW1VCIKdheOmT2sq8w97U
         6lkg==
X-Gm-Message-State: AOAM533/FYbSAEWAS+bw4qd/nZmrAXTlKwyQ3Sfb0SLc3+9gE2Sr9deA
	pVq8Wd4PPoM8iJV/c6sSLfkgQLwv4TYk0botSCjMRc//vnSW8A==
X-Google-Smtp-Source: ABdhPJwsEWXUeClMb6A1UNDcQq/H/a3l69LC2W0DW6EhH+4v2XxUgARDKH6CIKqmkZFnmAtuGBY30zqOx21wOVNBEWQ=
X-Received: by 2002:a17:907:9620:: with SMTP id gb32mr1653464ejc.127.1623793178919;
 Tue, 15 Jun 2021 14:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvb6V+Qrv6yosMSpcZxLeV0rfNsquo_SGmnxExW+AyxOw@mail.gmail.com>
In-Reply-To: <CAAQYJAvb6V+Qrv6yosMSpcZxLeV0rfNsquo_SGmnxExW+AyxOw@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Tue, 15 Jun 2021 23:39:27 +0200
Message-ID: <CAAQYJAv7kaedboVErvPRBcjjxGujJDJW1G-rNVHBJfgue67okQ@mail.gmail.com>
Subject: Re: kernel.bbclass: possible regression in Gatesgarth
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 6:26 PM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> Up to commit 86142da
> https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?id=86142dad13935a0d9af4a4177e05ff5c39003db7
>
> in Gatesgarth it was possible to build a second mini-kernel w/out
> modules, we have an example here:
> https://git.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-kexecboot_4.4.bb
>
> I you look at the recipe there is special care to avoid packaging:
>
> # disable packaging related tasks
> inherit nopackages
>
> PACKAGES = ""
> PROVIDES = ""
>
> Now the change in kernel.bblass calls a packaging routine.:
> do_deploy[prefuncs] += "read_subpackage_metadata"
>
> This uncovers the first problem, even if we don't set/have KERNEL_DEVICETREE:
> inherit kernel-devicetree
>
> does unconditionally add some extra packages:
>
> PACKAGES_append = " \
>     ${KERNEL_PACKAGE_NAME}-devicetree \
>     ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle',
> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
> "
>
> this causes the first failure:
> ERROR: linux-kexecboot-4.4-r0 do_deploy: Recipe linux-kexecboot is
> trying to create package kernel-devicetree which was already written
> by recipe linux-handheld
>
> So ok, here we can add some guards like:
> - ${KERNEL_PACKAGE_NAME}-devicetree \
> + ${@ d.getVar('KERNEL_PACKAGE_NAME') + '-devicetree' if
> (d.getVar('KERNEL_DEVICETREE')) else '' } \
>
>
> but then the above call to read_subpackage_metadata() causes the second failure:
> ERROR: linux-kexecboot-4.4-r0 do_deploy: Recipe linux-kexecboot is
> trying to create package kernel-zimage which was already written by
> recipe linux-handheld
>
> in fcat here the problem is just the simlink to zImage in /boot
> created by bthe second kernel build.
>
> Again, note we don't set KERNEL_DEVICETREE with these legacy devices.
>
> I don't know if this is a regression or not,  there is another way now
> to build a second kernel, using a custom KERNEL_PACKAGE_NAME to get in
> a subdir of DEPLOYDIR.
>
> It's just that it used to work up to dunfell since years just avoiding
> packaging.
>
> If it can be fixed, well, ok, otherwise we'll have to adapt the BSP.
>
> Cheers
> A.A.

ping?
