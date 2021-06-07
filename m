Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.731.1623083184278227478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 09:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LiYKh9HP;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id g8so27717553ejx.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3Z7GkGvAXRJoMS7iOqSK2sGsTmnX3cIgGr5o3N5Y5KA=;
        b=LiYKh9HP2T0XX2MVbFc+X8+X9tpWYq9TROjNsuZKUArLt5JZKCID4OHheov+8waHMr
         8Rn0eN0cku8fVKJVHtXFPeGFuobB/EuWfxVFBiyhwLj3x2P99MENb7v9VabTBBcMaTt/
         RrCJx8gdu/vfjD+7wFeenuceQO+vn2tYNcLK9MN8aoq6r8qxOPprPe//9i2xn5wojSft
         dQHUNu6nSgmlNh/CurnbNsAc8Z4xRsNtZS/Gom2LSuPavygwsj5xB288RFNd3wsrKEH7
         6+Tb6rNyOOqQGAcAYYMT7aB3mJMefy9HhlYQu6I2DRVk6MHpp8oHaQRx00+OLG0qhWp9
         dVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=3Z7GkGvAXRJoMS7iOqSK2sGsTmnX3cIgGr5o3N5Y5KA=;
        b=mCEEgNyAdGR0S8D5MtplZhzOI/waGpHihVTtSCJKSgKVE7tHyt/DuWK6jb7lvWUDOy
         JKd665T7ODVxn8wGavW3x5IWjTJ9Z//jx51isOee1upkgk6BoKiUnpzFp1sOxjKwOBzr
         ltv4jVswjam9awbaPXd1pX8sF+UZJbxnCST+w6yGVkOfa7I/pEhdSIT0mpVP4CkH2304
         8f34r0I+ujbQkhL5FxDZxM8HgOI6ebahKuCQeVRQBuVuF1Jv3e6EAiVtAThJHt8frezX
         n114uzV2Z2vjnIMtUZ2KQnReJmwgjSYpVPTp6Tago/zpWbEkn9imI9zhXOkIsx6yn2oq
         dZRQ==
X-Gm-Message-State: AOAM532+kL/CVOq46PrT2qqG/0oIpnhGR+1V4YAmzco6101i6cZ1GN6H
	JqFirrr8UGDMKSnBw5sKKsKlgGDDZvaaXVvS85AedWpb0GzdgA==
X-Google-Smtp-Source: ABdhPJxEin1SlmFu7MQI0bfLOiazJhe+d/tpHYpnGAQ2lQBoNtA609PH8fBZzR83dWScibUm/rWZ8uZvhsR7Ve3odVU=
X-Received: by 2002:a17:906:8318:: with SMTP id j24mr18588094ejx.375.1623083182689;
 Mon, 07 Jun 2021 09:26:22 -0700 (PDT)
MIME-Version: 1.0
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Mon, 7 Jun 2021 18:26:12 +0200
Message-ID: <CAAQYJAvb6V+Qrv6yosMSpcZxLeV0rfNsquo_SGmnxExW+AyxOw@mail.gmail.com>
Subject: kernel.bbclass: possible regression in Gatesgarth
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Up to commit 86142da
https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?id=86142dad13935a0d9af4a4177e05ff5c39003db7

in Gatesgarth it was possible to build a second mini-kernel w/out
modules, we have an example here:
https://git.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-kexecboot_4.4.bb

I you look at the recipe there is special care to avoid packaging:

# disable packaging related tasks
inherit nopackages

PACKAGES = ""
PROVIDES = ""

Now the change in kernel.bblass calls a packaging routine.:
do_deploy[prefuncs] += "read_subpackage_metadata"

This uncovers the first problem, even if we don't set/have KERNEL_DEVICETREE:
inherit kernel-devicetree

does unconditionally add some extra packages:

PACKAGES_append = " \
    ${KERNEL_PACKAGE_NAME}-devicetree \
    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle',
''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
"

this causes the first failure:
ERROR: linux-kexecboot-4.4-r0 do_deploy: Recipe linux-kexecboot is
trying to create package kernel-devicetree which was already written
by recipe linux-handheld

So ok, here we can add some guards like:
- ${KERNEL_PACKAGE_NAME}-devicetree \
+ ${@ d.getVar('KERNEL_PACKAGE_NAME') + '-devicetree' if
(d.getVar('KERNEL_DEVICETREE')) else '' } \


but then the above call to read_subpackage_metadata() causes the second failure:
ERROR: linux-kexecboot-4.4-r0 do_deploy: Recipe linux-kexecboot is
trying to create package kernel-zimage which was already written by
recipe linux-handheld

in fcat here the problem is just the simlink to zImage in /boot
created by bthe second kernel build.

Again, note we don't set KERNEL_DEVICETREE with these legacy devices.

I don't know if this is a regression or not,  there is another way now
to build a second kernel, using a custom KERNEL_PACKAGE_NAME to get in
a subdir of DEPLOYDIR.

It's just that it used to work up to dunfell since years just avoiding
packaging.

If it can be fixed, well, ok, otherwise we'll have to adapt the BSP.

Cheers
A.A.
