Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAF2C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:47:58 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.26036.1668880075577832330
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VAflP7Vb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id 4so7235635pli.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O+U4txDv55Q+xVoZMxk+rgprPAZzFNdZ9ZEvHeP1lZ8=;
        b=VAflP7Vba704i4Bcfgdv1S57QgxtTuH2tkwPmIAbky4WHyEnfqRRSvgmTkeHsM8ZQg
         aQcUneQF26sqpywLYM1iqpaQPdlt3KtEHcl6lkKc28ri8DV4XvDCN2idnqP1GJ3KUlwZ
         BOMaKcHlzZSj8UK7Lzs1WxlTigSRTeg4LfHbpIq3vt/7tGYxkH3AN6feN2X9D/T104J/
         y/hO8ZePjv+uORl5a8haUXWMSdZbc49imlYvW+VS9zMhCHPaTQChvqH3x38YH0KzGV8h
         Ct8o4gciNLhr7T+5p4ToKE5ElfBQsjdB3kfGnfzN1omxDDkzKapP3bzULfLFrG1pORo1
         9lWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+U4txDv55Q+xVoZMxk+rgprPAZzFNdZ9ZEvHeP1lZ8=;
        b=e+jhQGKMv+nAomJmk6engZ4V0JNwWg+hKpkrWGmAqOXy6CyqKbIm0901tmnl2zX90N
         uCcKxfHbev0HMfJ8q7nQ6oy0k6mwVMaKap6UwgcKnukR8Qsev2hwYdVJjA265KvegQQI
         ar47IwoOPpiLzNCFEjEsiG/mi22Fi67W/r6yOiAXRByJ8iWrux2UDlKVIGZPrZUZH7Iv
         iI2/mA/Lidl/djZ5Ys1l8Tjr4KLbBePbeajXjidkM/n3VX47fH2sfcOusr4TCRhiBC89
         sqeEf8YH5yTlNjQ1zU3CAuH6wK1IiicvzLfJfpLwoupqlAi7HZZAbIn0U6JzmV3DlcL1
         XMmw==
X-Gm-Message-State: ANoB5pmIkjDfsUTCMif3v9T0/eBEX3ifYNAy30z4DDCr8kNycLPlWrjX
	601OZwseUuYyYuBezxSA+OJ2ryEz/MR/NJEp8Hs=
X-Google-Smtp-Source: AA0mqf7Zb2u/CMLIpLFCMITc9eoi+8NYUgEa8NeOIrVA6fptD6YTW6hX2fzxcZ4R13MQxz5anRPPfA==
X-Received: by 2002:a17:902:e9cd:b0:178:2989:e2fb with SMTP id 13-20020a170902e9cd00b001782989e2fbmr4773998plk.81.1668880074240;
        Sat, 19 Nov 2022 09:47:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.47.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:47:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/21] Patch review
Date: Sat, 19 Nov 2022 07:47:28 -1000
Message-Id: <cover.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173518

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4512

The following changes since commit ce99d451a54b8ce46b7f9030deaba86355009b1a:

  wic: swap partitions are not added to fstab (2022-11-11 04:24:18 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bhabu Bindu (2):
  libxml2: Fix CVE-2022-40303
  libxml2: Fix CVE-2022-40304

Hitendra Prajapati (1):
  sudo: CVE-2022-43995 heap-based overflow with very small passwords

Manuel Leonhardt (1):
  sstate: Account for reserved characters when shortening sstate
    filenames

Omkar (1):
  python3: Fix CVE-2022-45061

Ralph Siemsen (11):
  golang: fix CVE-2021-33195
  golang: fix CVE-2021-33198
  golang: fix CVE-2021-44716
  golang: fix CVE-2022-24291
  golang: fix CVE-2022-28131
  golang: fix CVE-2022-28327
  golang: ignore CVE-2022-29804
  golang: ignore CVE-2021-33194
  golang: ignore CVE-2021-41772
  golang: ignore CVE-2022-30580
  golang: ignore CVE-2022-30630

Ranjitsinh Rathod (1):
  systemd: Fix CVE-2022-3821 issue

Steve Sakoman (1):
  maintainers: update gcc version to 9.5

Sundeep KOKKONDA (1):
  gcc : upgrade to v9.5

Tim Orling (1):
  vim: upgrade 9.0.0614 -> 9.0.0820

Vivek Kumbhar (1):
  libtasn1: fix CVE-2021-46848 off-by-one in asn1_encode_simple_der

 meta/classes/sstate.bbclass                   |   2 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../libxml/libxml2/CVE-2022-40303.patch       | 623 +++++++++++++++++
 .../libxml/libxml2/CVE-2022-40304.patch       | 104 +++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +
 .../systemd/systemd/CVE-2022-3821.patch       |  47 ++
 meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
 ...-PR-tree-optimization-97236-fix-bad-.patch | 119 ----
 ...ight-Line-Speculation-SLS-mitigation.patch | 204 ------
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 600 ----------------
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 659 ------------------
 ...x-missing-dependencies-for-selftests.patch |  45 --
 .../gcc/{gcc-9.3.inc => gcc-9.5.inc}          |  13 +-
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |   0
 .../0002-gcc-poison-system-directories.patch  |   0
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0004-64-bit-multilib-hack.patch           |   0
 .../0005-optional-libstdc.patch               |   0
 .../0006-COLLECT_GCC_OPTIONS.patch            |   0
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0008-fortran-cross-compile-hack.patch     |   0
 .../0009-cpp-honor-sysroot.patch              |   0
 .../0010-MIPS64-Default-to-N64-ABI.patch      |   0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...gcc-Fix-argument-list-too-long-error.patch |   0
 .../0013-Disable-sdt.patch                    |   0
 .../{gcc-9.3 => gcc-9.5}/0014-libtool.patch   |   0
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...-config-files-from-B-instead-of-usin.patch |   0
 ...ir-from-.la-which-usually-points-to-.patch |   0
 .../0018-export-CPP.patch                     |   0
 ...e-target-gcc-headers-can-be-included.patch |   0
 ...ild-with-disable-dependency-tracking.patch |   0
 ...t-directory-during-relink-if-inst_pr.patch |   0
 ...IR-replacement-instead-of-hardcoding.patch |   0
 ...23-aarch64-Add-support-for-musl-ldso.patch |   0
 ...-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...le-sysroot-support-for-nativesdk-gcc.patch |   0
 ...sroot-gcc-version-specific-dirs-with.patch |   0
 ...ous-_FOR_BUILD-and-related-variables.patch |   0
 ...028-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   0
 ...d-to-link-commandline-for-musl-targe.patch |   0
 .../0030-ldbl128-config.patch                 |   0
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
 ...as-for-__cpu_indicator_init-instead-.patch |   0
 .../0033-sync-gcc-stddef.h-with-musl.patch    |   0
 ...-fault-in-precompiled-header-generat.patch |   0
 .../0035-Fix-for-testsuite-failure.patch      |   0
 ...Re-introduce-spe-commandline-options.patch |   0
 ...heck-zero-value-in-simple_object_elf.patch |   0
 ...s-Do-not-use-__LINE__-for-maintainin.patch |   0
 ...ands-Don-t-match-user-defined-regs-o.patch |   0
 ...adian_9.3.bb => gcc-cross-canadian_9.5.bb} |   0
 .../{gcc-cross_9.3.bb => gcc-cross_9.5.bb}    |   0
 ...cc-crosssdk_9.3.bb => gcc-crosssdk_9.5.bb} |   0
 ...{gcc-runtime_9.3.bb => gcc-runtime_9.5.bb} |   0
 ...anitizers_9.3.bb => gcc-sanitizers_9.5.bb} |   0
 .../{gcc-source_9.3.bb => gcc-source_9.5.bb}  |   0
 .../gcc/{gcc_9.3.bb => gcc_9.5.bb}            |   0
 ...c-initial_9.3.bb => libgcc-initial_9.5.bb} |   0
 .../gcc/{libgcc_9.3.bb => libgcc_9.5.bb}      |   0
 ...{libgfortran_9.3.bb => libgfortran_9.5.bb} |   0
 meta/recipes-devtools/go/go-1.14.inc          |  17 +
 .../go/go-1.14/CVE-2021-33195.patch           | 373 ++++++++++
 .../go/go-1.14/CVE-2021-33198.patch           | 113 +++
 .../go/go-1.14/CVE-2021-44716.patch           |  93 +++
 .../go/go-1.14/CVE-2022-24921.patch           | 198 ++++++
 .../go/go-1.14/CVE-2022-28131.patch           | 104 +++
 .../go/go-1.14/CVE-2022-28327.patch           |  36 +
 .../python/files/CVE-2022-45061.patch         | 100 +++
 .../recipes-devtools/python/python3_3.8.14.bb |   1 +
 .../sudo/sudo/CVE-2022-43995.patch            |  59 ++
 meta/recipes-extended/sudo/sudo_1.8.32.bb     |   1 +
 .../gnutls/libtasn1/CVE-2021-46848.patch      |  45 ++
 .../recipes-support/gnutls/libtasn1_4.16.0.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 76 files changed, 1926 insertions(+), 1640 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch
 rename meta/recipes-devtools/gcc/{gcc-9.3.inc => gcc-9.5.inc} (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0002-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0004-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0005-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0006-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0008-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0009-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0010-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0012-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0013-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0014-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0018-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0019-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0023-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0025-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0027-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0030-ldbl128-config.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0033-sync-gcc-stddef.h-with-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0034-fix-segmentation-fault-in-precompiled-header-generat.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0035-Fix-for-testsuite-failure.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0036-Re-introduce-spe-commandline-options.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.3.bb => gcc-cross-canadian_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_9.3.bb => gcc-cross_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.3.bb => gcc-crosssdk_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_9.3.bb => gcc-runtime_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.3.bb => gcc-sanitizers_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_9.3.bb => gcc-source_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_9.3.bb => gcc_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_9.3.bb => libgcc-initial_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_9.3.bb => libgcc_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_9.3.bb => libgfortran_9.5.bb} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33195.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33198.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-44716.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-24921.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-28131.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-28327.patch
 create mode 100644 meta/recipes-devtools/python/files/CVE-2022-45061.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2022-43995.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2021-46848.patch

-- 
2.25.1


