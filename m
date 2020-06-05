Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.5358.1591338876900044676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 23:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KAsq6JOw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f185so7908170wmf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 23:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=oL20HhZ3BZ6+cNU8sQlOhcngua5uhD7Uveee5rnYndg=;
        b=KAsq6JOwwGHixa/QkCAxs2bRv7dbJn4nn3aUnxXsNHmtsj9MFVZNY2SsunEIpgyegP
         YlBoyKy+JBk+IsazPVD5DIXvMmXW+O+RBvH0Kbw+WNjuleMFnXYGYFGFPSurrWpMYnCB
         /fnGoatiNmZMxyqCMhI6N5uKXo2nPNzbR0Q08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oL20HhZ3BZ6+cNU8sQlOhcngua5uhD7Uveee5rnYndg=;
        b=PHQ4qVo9sNeCtvJeQJFs5GiyMm25PEN70IHqsY2MYyoJzhhqd+0twM2bxNLH7gKD9O
         ogX/kxPXwWywWsh24DznvttfIsgJR/VE7n9lsc0578Rbj4zgVu5pCvVlxMmedJWa6zYC
         S09B8qP2e33eAmXnP1dDnI06rejT58eKE4SENMkA+rH9OwBFovA+e0GHgmZ2D6YUt1ld
         SQl3vPfJXp4/yS5E8V/k/x1vlgGdj5j/h9wcPZgcGqXlBba3V5yiruA8+anv4NJm3cbC
         lj78ltRtaq2B5md7Y3VYS/MUqZlhThhnHTTXyqIPgRITHsoUweAXvGOzbdGMuxQyHckZ
         4pOQ==
X-Gm-Message-State: AOAM531mT73HFMlQFGaZZG+7hEFX14rOxiXFX6OGgl2mT9Cb64Eqwq+F
	ri2D/P3bZgEU3oINFj5fwHYcZQ==
X-Google-Smtp-Source: ABdhPJy8dpP413pDkx2R8rQcI3BbiTOOF8O8qJ0JlEIHRxKVE6pzU2+gmslZ4XPI4NbEeVZiDBePHg==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr1063984wmj.2.1591338875152;
        Thu, 04 Jun 2020 23:34:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u7sm10972973wrm.23.2020.06.04.23.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 23:34:34 -0700 (PDT)
Message-ID: <fbca27d924e7f0f89da34872fbcda680b5dc0042.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v7 0/3] Add a new bbclass that abstracts the generation of FIT blobs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nandor Han <nandor.han@vaisala.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 05 Jun 2020 07:34:33 +0100
In-Reply-To: <cover.1590559408.git.nandor.han@vaisala.com>
References: <cover.1590559408.git.nandor.han@vaisala.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 09:05 +0300, Nandor Han wrote:
> Description
> ----------
> Add a new class and unittest for generating FIT blobs.
> 
> 
> Testing
> -------
> 
>     1. linux-yocto_5.4.bbappend was modified to have the following
> configuration:
> 
>     ```
>     inherit fit-image
> 
>     KERNEL_IMAGE_NODE[name] = "kernel"
>     KERNEL_IMAGE_NODE[description] = "${PF}"
>     KERNEL_IMAGE_NODE[data] =
> '/incbin/("./arch/${ARCH}/boot/zImage")'
>     KERNEL_IMAGE_NODE[type] = "kernel"
>     KERNEL_IMAGE_NODE[arch] = "${ARCH}"
>     KERNEL_IMAGE_NODE[os] = "linux"
>     KERNEL_IMAGE_NODE[compression] = "none"
>     KERNEL_IMAGE_NODE[load] = "${UBOOT_LOADADDRESS}"
>     KERNEL_IMAGE_NODE[entry] = "${UBOOT_ENTRYPOINT}"
>     KERNEL_IMAGE_NODE[hash] = "sha256"
> 
>     FDT_IMAGE_NODE[name] = "fdt"
>     FDT_IMAGE_NODE[description] = "FDT blob"
>     FDT_IMAGE_NODE[data] = '/incbin/("./arch/${ARCH}/boot/dts/am335x-
> bone.dtb")'
>     FDT_IMAGE_NODE[type] = "flat_dt"
>     FDT_IMAGE_NODE[arch] = "${ARCH}"
>     FDT_IMAGE_NODE[compression] = "none"
>     FDT_IMAGE_NODE[hash] = "sha256"
> 
>     CONF1_CONF_NODE[name] = "conf"
>     CONF1_CONF_NODE[description] = "Linux kernel and FDT blob"
>     CONF1_CONF_NODE[kernel] = "kernel"
>     CONF1_CONF_NODE[fdt] = "fdt"
> 
>     FIT_IMAGES_NODE = "KERNEL_IMAGE_NODE FDT_IMAGE_NODE"
>     FIT_CONFIGURATIONS_NODE = "CONF1_CONF_NODE"
>     FIT_CONFIGURATIONS_NODE[default] = "${@d.getVarFlag('CONF1_CONF_N
> ODE', 'name') or ""}"
>     ```
>     2. Build the kernel: `bitbake virtual/kernel`
>     3. Verify that `image-fit.itb` is present in the build directory:
> PASS
>     4. Disassemble the image using the command: `dtc -I dtb -O dts
> image-fit.itb`
>     5. Verify that the FIT source contains the expected
> configuration: PASS
>     6. Run the unittest using the command: `oe-selftest --run-tests
> fit_image.FitImage`
>     7. Verify that is successfully: PASS
>     ```
>     2020-05-26 16:54:34,996 - oe-selftest - INFO - SUMMARY:
>     2020-05-26 16:54:34,996 - oe-selftest - INFO - oe-selftest () -
> Ran 13
>     tests in 1956.639s
>     2020-05-26 16:54:34,997 - oe-selftest - INFO - oe-selftest - OK -
> All
>     required tests passed (successes=13, skipped=0, failures=0,
> errors=0)
>     ```         
>  
> 
>     Changes since v1:
>     ----------------
>     - Change the format of short-log to "<target>: <summary>"
> 
>     Changes since v2:
>     ----------------
>     - rename the file from `fit-image` to `fit_image` to successfully
> export the class functions.
>     - adding new sanity checks.
>     - add missing dependency.
>     - fix a variable reference in a debug log.
>     
>     Changes since v3:
>     ----------------
>     - unit-test added
>     - class updated to support also properties for U-Boot image
> 
>     Changes since v4:
>     ----------------
>     - remove a wrong patch
> 
>     Changes since v5:
>     ----------------
>     - something went wrong with generation of the patches. regenerate
> 
>     Changes since v6:
>     ----------------
>     - fix the shortlog for one of the patches
> 
> Nandor Han (3):
>   python-fdt: add a recipe for `python3-fdt` package
>   classes: Add a new bbclass that abstracts the generation of FIT
> blobs
>   selftest: add a unit-test for fit-image bbclass
> 
>  .../fit-image-test/files/dt-fake.dtb          |   3 +
>  .../fit-image-test/files/zImage-fake          |   3 +
>  .../fit-image-test/fit-image-test.bb          |  17 +
>  meta/classes/fit_image.bbclass                | 387
> ++++++++++++++++++
>  meta/lib/oeqa/selftest/cases/fit_image.py     | 212 ++++++++++
>  .../python/python3-fdt_0.2.0.bb               |  14 +
>  6 files changed, 636 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/fit-image-
> test/files/dt-fake.dtb
>  create mode 100644 meta-selftest/recipes-test/fit-image-
> test/files/zImage-fake
>  create mode 100644 meta-selftest/recipes-test/fit-image-test/fit-
> image-test.bb
>  create mode 100644 meta/classes/fit_image.bbclass
>  create mode 100644 meta/lib/oeqa/selftest/cases/fit_image.py
>  create mode 100644 meta/recipes-devtools/python/python3-fdt_0.2.0.bb

This did show up two issues in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1022

(step2d)

Basically there is no maintainer listed for python3-fdt which is an
easy fix and secondly the tests need python3-fdt-native which isn't
present in the test environment.

Cheers,

Richard



