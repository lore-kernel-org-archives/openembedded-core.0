Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A99EFB5E88
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:43 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65366.1773705816252529168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aYUeBdoX;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66732a99928so246645a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705815; x=1774310615; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qdaOcr5QxrhWw6pOwSjX5SU5X1IOco+YPF3jE4kuF4=;
        b=aYUeBdoXqpjqE7gKFW04iVcAVvda+gPgmZT5n3e56cFnSzleL7kj7etYlCIIWTgLeJ
         6OGrwhPlcFuoNzKBsTWCHR3fKoItEgkAYPxf0J3iYrTKUY3tHaaB4R17vxX0k2IJVq2Q
         VPx60594kWR01ACEMfladGfKL6ttiWXAIrtaQYMDA//qLZk1OxAeMpJR86fRMKejbm0D
         mbrpmGvc4sZEZxfbrYtOn3snjpO/lyD3cvdVGAe+FEciYX/XqwDHAxYpdxHNQ4x5unlH
         2Vq6UqGDIsPCd4d0uYq8R5y6iI443TruUoyTA+KDSGKdjunxqQiUjqhaUHMJt19PDr4N
         mHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705815; x=1774310615;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qdaOcr5QxrhWw6pOwSjX5SU5X1IOco+YPF3jE4kuF4=;
        b=CdUMxaIwG7yv1CeXsb6yE2r/PAQVz+oQ58qCoXVkaGrhHVVCL4RxNjAEjFKFsTVW5l
         6gfuMWQHTU0iUSLQGD74cZ8RTJFMt1Mxq/ry6d04LTN12QmzNzonUom/cOKs9xlYNLsu
         o9W37o8tVcbpP4nj8DMVdZQohe5xMSeGSfakC/0pw/m5Ik2kUUmfQO4G+fXn+tgfWmOi
         UMAa728us5v72Ik/X6pZ8yqnM3m4iUsOhgryf6vWvb1/QHlpMw+iLq87yg7NSKDAH4lf
         Qxi+u+yxphUbBD5WlgNm1oOJZgPjKAB+CVRAhygGNR4/458yV0drL/x3k10bCpHTVuiH
         LFMQ==
X-Gm-Message-State: AOJu0YwSCbFDa3nt6CC8ENQxpnRFH5hzh0LYVKmnMGVW91KDkr1/iCFQ
	OiXDOkcxqFxR9gIGVOymQEpFnLTuBaQMQk1vLHL7Ik5vzjNQGPR46V10
X-Gm-Gg: ATEYQzz6p8NJPLe+ORVBqCnSvOplkJZpiy6FTUjHVXoJ40uS6oEfHBeOFNCwQr7QwbM
	oDd/bdfqfA/kB5Mxm4N24YiIQco8Kk/Bl/3iuCqRSWwIJ+6a3He9WsbPsSGxSNs0pxp2usqi9HZ
	2un5TtEpjrDoKOb7m25mR7SXjH4zxbS+8+sn6dCt7E+fxqDnEItq6HaMHgak2S/YK4kEvGd0llH
	z7q3boPTsw4l2Ww7zMA1MaD7I8fMjpj+/ER6nHACJeP73A/TJJUzrBWT6+0JssleyTeMCizTBm8
	XF0TzomuMtQETdqaG/KdKm14JrOQ62w2Jsr0xrdU41rytVvR947gCXiZV4eYR5bI2zsv4kvDceh
	DwbcgTKtfPeSc7u3xuEKQtYx+J+BHhC2NbyK+0DmlsGRl7OH5gYPx4hWU5XCPWmcCkSh+3kn+OZ
	JX6mqycaccmZAZu0z4feiBhthcYQMjWC6XDfTfY0wmfN4s6foIlPDohkE=
X-Received: by 2002:a17:907:96a0:b0:b97:b836:34e6 with SMTP id a640c23a62f3a-b97b8363a65mr353119266b.46.1773705814325;
        Mon, 16 Mar 2026 17:03:34 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:34 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH v2 00/12] Confusing and invalid conditional appends
Date: Tue, 17 Mar 2026 01:03:04 +0100
Message-Id: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6DIBBFr2Jm3WkArcauvEfjgsKgkygYaEgb4
 91LPUCX7+f/93dIFJkS3KsdImVOHHwBdanAzNpPhGwLgxKqFbVs0PEb2We9sEW9beRtQuNusu/
 IKSc6KMstUqmd1sdYeOb0CvFznmT5S//7skSJoiYjns61faOGadW8XE1YYTyO4wujL32NtgAAA
 A==
X-Change-ID: 20260314-fix-invalid-appends-cf5197ef2f07
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233273

This patchset fixes several findings for variable assignments of form:
    A:someoverride += "foo"
and transforms them into:
    A:append:someoverride = " foo"

In most of those cases I assume the original intent was to have a
conditional append, but what was actually happening was append to
a conditional override.

I first noticed such problem in our internal recipes and bbappends, but
then I decided to check if similar issue exists upstream and turns out
it does.

In most places the override that was happening was harmless as there was
no value that was being overriden, but that wasn't the case for libffi.
Before patch:
    $ grep EXTRA_OECONF /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb
    EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
    EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
    $ bitbake-getvar -r libffi-native EXTRA_OECONF
    #
    # $EXTRA_OECONF [6 operations]
    #   set /path/to/layers/openembedded-core/meta/conf/bitbake.conf:590
    #     ""
    #   :append /path/to/layers/openembedded-core/meta/conf/distro/include/no-static-libs.inc:24
    #     "${DISABLE_STATIC}"
    #   set /path/to/layers/openembedded-core/meta/conf/documentation.conf:164
    #     [doc] "Additional configure script options."
    #   append /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:18
    #     "--disable-builddir --disable-exec-static-tramp"
    #   :append /path/to/layers/openembedded-core/meta/classes-recipe/autotools.bbclass:134
    #     " ${PACKAGECONFIG_CONFARGS}"
    #   override[class-native]:append /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:19
    #     "--with-gcc-arch=generic"
    # pre-expansion value:
    #   " --with-gcc-arch=generic${DISABLE_STATIC} ${PACKAGECONFIG_CONFARGS}"
    EXTRA_OECONF=" --with-gcc-arch=generic --disable-static "

After patch:
    $ grep EXTRA_OECONF /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb
    EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
    EXTRA_OECONF:append:class-native = " --with-gcc-arch=generic"
    $ bitbake-getvar -r libffi-native EXTRA_OECONF#
    # $EXTRA_OECONF [6 operations]
    #   set /path/to/layers/openembedded-core/meta/conf/bitbake.conf:590
    #     ""
    #   :append /path/to/layers/openembedded-core/meta/conf/distro/include/no-static-libs.inc:24
    #     "${DISABLE_STATIC}"
    #   set /path/to/layers/openembedded-core/meta/conf/documentation.conf:164
    #     [doc] "Additional configure script options."
    #   append /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:18
    #     "--disable-builddir --disable-exec-static-tramp"
    #   :append[class-native] /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:19
    #     " --with-gcc-arch=generic"
    #   :append /path/to/layers/openembedded-core/meta/classes-recipe/autotools.bbclass:134
    #     " ${PACKAGECONFIG_CONFARGS}"
    # pre-expansion value:
    #   " --disable-builddir --disable-exec-static-tramp${DISABLE_STATIC} --with-gcc-arch=generic ${PACKAGECONFIG_CONFARGS}"
    EXTRA_OECONF=" --disable-builddir --disable-exec-static-tramp --disable-static --with-gcc-arch=generic "

---
Changes in v2:
- Split initial single commit into smaller ones
- Described actual impact on the overriden variables
- Added some recipes that I missed last time
- Link to v1: https://lore.kernel.org/r/20260314-fix-invalid-appends-v1-1-03ec0bff6942@gmail.com

---
Michal Sieron (12):
      libffi: Fix invalid conditional append
      coreutils: Convert confusing append to override syntax
      expat: Convert confusing append to override syntax
      tune-power[567]: Remove confusing overrides
      no-gplv3.inc: Convert confusing appends to override syntax
      bootchart2: Convert confusing appends to override syntax
      pigz: Convert confusing append to override syntax
      systemtap: Convert confusing append to override syntax
      ovmf: Convert confusing append to override syntax
      dnf: Convert confusing append to override syntax
      qemu: Convert confusing append to override syntax
      recipes-devtools/python: Convert confusing appends to override syntax

 meta/conf/distro/include/no-gplv3.inc                    |  4 ++--
 meta/conf/machine/include/powerpc/tune-power5.inc        |  3 +--
 meta/conf/machine/include/powerpc/tune-power6.inc        |  3 +--
 meta/conf/machine/include/powerpc/tune-power7.inc        |  3 +--
 meta/recipes-core/coreutils/coreutils_9.10.bb            |  4 ++--
 meta/recipes-core/expat/expat_2.7.4.bb                   |  2 +-
 meta/recipes-core/ovmf/ovmf_git.bb                       |  2 +-
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb    | 10 +++++-----
 meta/recipes-devtools/dnf/dnf_4.24.0.bb                  |  2 +-
 meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb |  2 +-
 meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb     |  2 +-
 meta/recipes-devtools/python/python3-chardet_5.2.0.bb    |  2 +-
 meta/recipes-devtools/python/python3-cython_3.2.4.bb     |  4 ++--
 meta/recipes-devtools/python/python3-ply_3.11.bb         |  2 +-
 meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb     |  2 +-
 meta/recipes-devtools/python/python3-pycparser_3.0.bb    |  4 ++--
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb    |  2 +-
 meta/recipes-devtools/python/python3-pytz_2025.2.bb      |  2 +-
 meta/recipes-devtools/qemu/qemu_10.2.0.bb                |  2 +-
 meta/recipes-extended/pigz/pigz_2.8.bb                   |  2 +-
 meta/recipes-kernel/systemtap/systemtap_5.4.bb           |  2 +-
 meta/recipes-support/libffi/libffi_3.5.2.bb              |  2 +-
 22 files changed, 30 insertions(+), 33 deletions(-)
---
base-commit: f5e62a13cbe17947baa387c723422bc8ca766d34
change-id: 20260314-fix-invalid-appends-cf5197ef2f07

Best regards,
-- 
Michal Sieron <michalwsieron@gmail.com>


