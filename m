Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40322C55181
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21173.1785666538475556201
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L2LItiGu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47362928f65so2430181f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666536; x=1786271336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7iAplpfHVU2+958lhMGQhqk8RwTyYwx6qVuT4JyVR8=;
        b=L2LItiGuZzV3giZvaAG30KBnld6pS0Y0mJBQPhqmOX4PJs1QS2MTYuyr+XvGnn8Igx
         qSgX9RidLrijzaY7aG8XaYsJ0B2BfsF3M9o0KgJMzvul6L0drZVFsrBKdOk0K6AcqOs1
         D/rtB3hauQq41XcXl29AC0Ms5iDuvUfS062o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666536; x=1786271336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m7iAplpfHVU2+958lhMGQhqk8RwTyYwx6qVuT4JyVR8=;
        b=reB6X259PB2haEDEhTW0TkZWHgw6zc64eO3ooYV66JObmYNUbWl8/N3Vcq7PzShKlu
         P5m45zF3DlapgGRxMe497CwrfimgUM1Phy8T9GF3pBN4ZKZPYFAOlrM/83t2g7uh6v+o
         FvzzN+6oh5z2xDGrAz6h0DsYdBEt05p2hN6ssdyIe/vWmtc5UHBHZ8eQfKZrGewbO2vS
         4EZ+UWi6dZCeDJAyI+Ku2g9NRxAS8s+caGS+9qmoY0NYiKBWA7XJ5CaoD39pouLUu84z
         ENYmZZaoyMtbqZulhaKAjynnFQTJNlY8idjVdqpabe/XH/PUQ3kYJv3oUgYfca0AUnbV
         xgrA==
X-Gm-Message-State: AOJu0Yx2JKwpJECoexAUjpoq3Ab0Cv0N9V9FzlEvo5MWryfCVGQfDM2F
	IRrMylBYPTJgAQ+DxzWkKcrtWoscTIl272N0BAe5Cmxh+K0+R0L93j8fqt8bFX/3fFFSCtZHKA2
	wPbCgxwQ=
X-Gm-Gg: AR+sD10q3v2Qk0DZgh4FjeGvJApHBnRNrv+r+aKR470t5WQBBfmr+ekW6DawwB6y2BT
	nq4pJIlPgvAfctsCz9GvFVKyH/z85C9Jo4SCU77I1s2hCqOY4GsBlzd9dGqd1Z7ZNiabfPLhWQV
	rBynLPqwWplAMHdIN/Cbf+4VdJMBuyl4sTRBr2AG0YP0PvCgiIzRf3UVK3yxYN13Bw/gyQGPSeX
	uY+77c/8qtmNb2X/oe3RLIbI+amkYLKLPeSfVKPs07tFex1kVSO7vcFolXs1bA5Z28Mjlgm9fx+
	CRqZl+ymtQbiszTu3sQEci1OyJZxGBL++PcHVwSgbjV4RL2e6iS6VC9rXMlwcx0Rg2a+2JrWJ8r
	48M4Ryi+xXMWet0ELSFn0se1u0dHTeIWw+GAqhi3+IK+jPYPvdP4q7nfT64TLO/Xa7hea9fzeRe
	RKLOW9JuO4AvQDft/t6TRsCW2xx7qlzXXw2jCMyKYkvDa1IFeTrtPFNsMgfeGVd0eOxu3MHOwrG
	TWUJRdQLXXUO9SF8Q==
X-Received: by 2002:a05:600c:3148:b0:498:11b5:3ff7 with SMTP id 5b1f17b1804b1-49811b54490mr57964055e9.18.1785666536370;
        Sun, 02 Aug 2026 03:28:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.28.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:28:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/25] Class file improvements
Date: Sun,  2 Aug 2026 11:28:29 +0100
Message-ID: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242525

This series starts to clean up a few class file issues. The general theme is
to move python functions into lib/oe and out of the class files.

It does separate out "kernel" from barebox and u-boot which removes certain
headaches.

The series does break some things, notably:

* the get_kernel*() functions are now oe.kernel.get*()
* kernel-arch no longer exports or sets ARCH and UBOOT_ARCH, there are
  functions you can use to get the values instead
* ARCH and UBOOT_ARCH are not exported into the environment in most cases
* the default kernel build make commands now sets ARCH
* various utils.bbclass python functions are now oe.utils.XXX()
* most sanity.bbclass functions are now oe.sanity.XXX()
* the 'valid_arches' variable is no longer available to change ARCH
* the linux-kernel-base class was removed
* lsb_distro_identifier is now always oe.lsb.distro_identifier()

The changes to adapt should hopefully not be too onerous and should
give us a cleaner code base which is easier to follow with a better data 
store memory usage profile.

There is more work to be done along these lines but this is a start...

Richard Purdie (25):
  sstatesig: Use kernel.bbclass instead of linux-kernel-base.bbclass
  linux-kernel-base: Delete unused function
  lib/oe/kernel: Move python functions from linux-kernel-base to library
    code
  kernel-yocto: Simplify code for cleanliness and slight performance
  kernel-arch: Move kernel and uboot arch functions to lib/oe/kernel.py
  kernel-arch: Simplify KERNEL_ARCH variable usage
  kernel-arch: Don't export UBOOT_ARCH
  u-boot: Separate out from kernel-arch.bbclass
  barebox: Separate out from kernel-arch.bbclass
  lib/oe/kernel: Simplify map_uboot_arch
  image_types/kernel-uimage: Swap UBOOT_ARCH for
    oe.kernel.map_uboot_arch call
  kernel-fit-image: Swap UBOOT_ARCH for oe.kernel.map_uboot_arch call
  linux-yocto-fitimage: Set UBOOT_ARCH
  kernel-arch: Drop UBOOT_ARCH
  linux-libc-headers: Drop kernel-arch and set ARCH directly
  toolchain-scripts: Drop usage of kernel-arch
  kernel-arch: Move ARCH usage into target classes
  linux-yocto-fitimage: Drop obsolete dependency on linux-kernel-base
  linux-kernel-base: Fold remainder into kernel-arch and drop
  kernel-devicetree: Add missing function prefixes
  utils: Drop explode_deps function
  utils: Move functions from utils.bbclass to utils.py
  lib/oe/lsb: Merge distro_identifier functions
  sanity: Move code to lib/oe
  sanity: Drop unreachable code

 meta/classes-global/base.bbclass              |   14 +-
 meta/classes-global/package.bbclass           |    2 +-
 meta/classes-global/sanity.bbclass            | 1050 +----------------
 meta/classes-global/utils.bbclass             |   93 --
 meta/classes-recipe/barebox.bbclass           |    4 +-
 meta/classes-recipe/cross-canadian.bbclass    |    2 +-
 meta/classes-recipe/devicetree.bbclass        |    4 +-
 meta/classes-recipe/image.bbclass             |    4 +-
 meta/classes-recipe/image_types.bbclass       |    4 +-
 meta/classes-recipe/kernel-arch.bbclass       |   80 +-
 meta/classes-recipe/kernel-devicetree.bbclass |    8 +-
 meta/classes-recipe/kernel-fit-image.bbclass  |    4 +-
 meta/classes-recipe/kernel-uimage.bbclass     |    2 +-
 meta/classes-recipe/kernel-yocto.bbclass      |   10 +-
 meta/classes-recipe/kernel.bbclass            |   19 +-
 meta/classes-recipe/kernelsrc.bbclass         |    6 +-
 meta/classes-recipe/linux-kernel-base.bbclass |   62 -
 meta/classes-recipe/module-base.bbclass       |    1 +
 meta/classes-recipe/populate_sdk_base.bbclass |   10 +-
 meta/classes-recipe/populate_sdk_ext.bbclass  |    2 +-
 meta/classes-recipe/testimage.bbclass         |    2 +-
 meta/classes-recipe/toolchain-scripts.bbclass |    4 +-
 meta/classes/multilib.bbclass                 |    2 +-
 meta/classes/report-error.bbclass             |    2 +-
 meta/classes/sign_ipk.bbclass                 |    4 +-
 meta/classes/sign_package_feed.bbclass        |    4 +-
 meta/classes/sign_rpm.bbclass                 |    6 +-
 meta/conf/multilib.conf                       |    2 +-
 meta/lib/oe/__init__.py                       |    2 +-
 meta/lib/oe/kernel.py                         |   88 ++
 meta/lib/oe/lsb.py                            |   10 +-
 meta/lib/oe/sanity.py                         | 1032 ++++++++++++++++
 meta/lib/oe/sstatesig.py                      |    2 +-
 meta/lib/oe/utils.py                          |   85 ++
 meta/lib/oeqa/sdk/testsdk.py                  |    2 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |    7 +-
 meta/recipes-core/glibc/glibc-ld.inc          |    2 +-
 meta/recipes-core/meta/dummy-sdk-package.inc  |    2 +-
 meta/recipes-core/meta/meta-environment.bb    |    2 +-
 meta/recipes-core/meta/meta-go-toolchain.bb   |    2 +-
 .../packagegroups/packagegroup-core-sdk.bb    |    4 +-
 .../packagegroup-cross-canadian.bb            |    6 +-
 .../packagegroup-go-cross-canadian.bb         |    2 +-
 .../packagegroup-rust-cross-canadian.bb       |    2 +-
 .../linux-libc-headers/linux-libc-headers.inc |    4 +-
 .../linux/linux-yocto-fitimage.bb             |    6 +-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |    8 +-
 meta/recipes-kernel/perf/perf.bb              |    4 +-
 48 files changed, 1323 insertions(+), 1356 deletions(-)
 delete mode 100644 meta/classes-recipe/linux-kernel-base.bbclass
 create mode 100644 meta/lib/oe/kernel.py
 create mode 100644 meta/lib/oe/sanity.py


