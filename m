Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E472C636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:48:53 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.16691.1675547327832744801
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=K2z4IRei;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 143so5897740pgg.6
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+6Usssw1rUCDFKxmhOX0CT63F6V3txMk6zsZr2vZGOE=;
        b=K2z4IReiXtxGcSa9wzI7xTQKmUN8bJVOEJ1lzfkaT/m1Qg9NbioPJxwiw83ycOMZGd
         Hstp4kNpZBPavdVdi+hA+CGGDS09nc38cv5h49q6VsUQnfhQAD3BgwPOJxzgHmTo7sQi
         JWKVt3iaDuolZ6/DnuYRhHuWiIBc7EIdcrGLFlJmPViLMSF7vNtvHJ9iYe+OxfMcGkPI
         0HxUQBDJ/IffpwvPzgP5G2WbknBVkbkHxg+rR1Vu5DjUDmenHZF7cAxG0UbgSDT5CZd9
         euyW/MbpIFpOwRwV4dfD24oddrObEm/ilWb0pN4/etyerkeEBwWm5O6R3+UrfY0fRu4g
         hNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6Usssw1rUCDFKxmhOX0CT63F6V3txMk6zsZr2vZGOE=;
        b=MHgjKCravnD26uLcD50e68of04LNpTQxjZ/0gHnuElBDkb9fwwK47mt/E/CaBPtyDD
         laRCtCOMiqe3daOMHk+/MiNEb9uPfx32n1kapRD4KValTivLl1mOWmASUq7Neta2ceS/
         G2RwSMTPDA8PeHg+XMroMeo6lfCz7sSHv7zWMXDjthnW6jfK3dsS114/TvTxQCOvATC4
         p/dQHmC1hVQECZ/HiU8kG8hbGhtA+FdBEDLUbeG38B/xVV41qmY7sjysti+xuIFV7FfA
         8PKIphaxLlkSzdlKU/I2KXRwJWLw3Uh+VDgvyZc+1+R4Unnx+G6si7OcTTcWhZ3qA5GE
         nJWQ==
X-Gm-Message-State: AO0yUKWgv8q5DTT2+p9sTMWo6DI1xiaucZBrhRF3N/qhocnn9TJcxDOu
	FA8+lMi7TmXJKLL6nHVvRX4zxQe43bIYH0lvO3s=
X-Google-Smtp-Source: AK7set9PuXBY61q9WNDQWpFcsESQywsKCvhOtP2e55ofk1UZqROb+XKLhdydNESNWoycz20fISlylw==
X-Received: by 2002:a62:3286:0:b0:59c:8937:435e with SMTP id y128-20020a623286000000b0059c8937435emr1820169pfy.28.1675547326546;
        Sat, 04 Feb 2023 13:48:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.48.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:48:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Sat,  4 Feb 2023 11:48:26 -1000
Message-Id: <cover.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176768

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4885

The following changes since commit 4f069121ddb99bb6e2f186724cd60ca07f74f503:

  python3: fix packaging of Windows distutils installer stubs (2023-02-04 04:34:20 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.229
  linux-yocto/5.4: update to v5.4.230

Khem Raj (1):
  libtirpc: Check if file exists before operating on it

Niko Mauno (1):
  Fix missing leading whitespace with ':append'

Ranjitsinh Rathod (1):
  libsdl2: Add fix for CVE-2022-4743

Steve Sakoman (4):
  lttng-modules: update 2.11.6 -> 2.11.7
  lttng-modules: update 2.11.7 -> 2.11.8
  lttng-modules: update 2.11.8 -> 2.11.9
  lttng-modules: fix build with 5.4.229 kernel

Thomas Roos (1):
  devtool: fix devtool finish when gitmodules file is empty

Vivek Kumbhar (1):
  go: fix CVE-2022-1962 go/parser stack exhaustion in all Parse*
    functions

Xiaobing Luo (1):
  devtool: Fix _copy_file() TypeError

 meta/classes/externalsrc.bbclass              |   2 +-
 meta/classes/populate_sdk_ext.bbclass         |   2 +-
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-1962.patch            | 357 ++++++++++++++++++
 .../libtirpc/libtirpc_1.2.6.bb                |   2 +-
 .../libsdl2/libsdl2/CVE-2022-4743.patch       |  38 ++
 .../libsdl2/libsdl2_2.0.12.bb                 |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...ncpy-equals-destination-size-warning.patch |  42 ---
 ...jtool-Rename-frame.h-objtool.h-v5.10.patch |  88 -----
 ...oints-output-proper-root-owner-for-t.patch | 316 ----------------
 ...rdered-extent-tracepoint-take-btrfs_.patch | 179 ---------
 ...ext4-fast-commit-recovery-path-v5.10.patch |  91 -----
 ...intr-vectoring-info-and-error-code-t.patch | 124 ------
 ...x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch |  82 ----
 ...Return-unique-RET_PF_-values-if-the-.patch |  71 ----
 ...int-Optimize-using-static_call-v5.10.patch | 155 --------
 ...-fix-include-order-for-older-kernels.patch |  31 --
 .../0011-Add-release-maintainer-script.patch  |  59 ---
 .../0012-Improve-the-release-script.patch     | 173 ---------
 ...fix-ext4-fast-commit-recovery-path-v.patch |  32 --
 ...-fix-include-order-for-older-kernels.patch |  32 --
 ...fix-tracepoint-Optimize-using-static.patch |  46 ---
 ...ion-range-for-trace_find_free_extent.patch |  30 --
 ...ix-jbd2-use-the-correct-print-format.patch | 147 ++++++++
 ...ules_2.11.6.bb => lttng-modules_2.11.9.bb} |  21 +-
 scripts/lib/devtool/standard.py               |   2 +-
 29 files changed, 569 insertions(+), 1591 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2022-4743.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-strncpy-equals-destination-size-warning.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-objtool-Rename-frame.h-objtool.h-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-make-ordered-extent-tracepoint-take-btrfs_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-fast-commit-recovery-path-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-KVM-x86-Add-intr-vectoring-info-and-error-code-t.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kvm-x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-KVM-x86-mmu-Return-unique-RET_PF_-values-if-the-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-tracepoint-Optimize-using-static_call-v5.10.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-include-order-for-older-kernels.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0011-Add-release-maintainer-script.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0012-Improve-the-release-script.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0013-fix-backport-of-fix-ext4-fast-commit-recovery-path-v.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0014-Revert-fix-include-order-for-older-kernels.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0015-fix-backport-of-fix-tracepoint-Optimize-using-static.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0016-fix-adjust-version-range-for-trace_find_free_extent.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.6.bb => lttng-modules_2.11.9.bb} (59%)

-- 
2.25.1


