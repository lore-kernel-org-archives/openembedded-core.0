Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EA6C4450B
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140016.1783291367994050487
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=v4x50nyy;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c19bad03so21176065e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291366; x=1783896166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNUZX8Y1NL8RN90sKYPrSGSTI+XSXGdu1V0Av18Tiik=;
        b=v4x50nyycWolNatJRU9XpjIat5kMGUnXVonsgusbCyC8+Xy/mci07ZXg1EPBXl4Gq6
         kcUHycUiU4dzRBChBl3vVsQ4BjfHmXOzKITcLWi34Oy3CHcLBJG5T1XeJ5pd0XFOjbQ6
         2s2FiPkdHpRnoyKOW71CqmO4jW2MI/IFTRJw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291366; x=1783896166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNUZX8Y1NL8RN90sKYPrSGSTI+XSXGdu1V0Av18Tiik=;
        b=ZVvbUPP8/GW+UdbH4ku+byqB8wcT3p3IPD2wK1KqxKbNCTZ5oTuccqICs4gaXtI3aO
         bbl0aKYEoGKfcOTR8qFYu5OClJb8d0+VRFQDlHS5i0I8XhZxx6a09i9yo03/KWJO+xZ2
         r7c6tDuoLHo5VEQWMvGzDpPQKsoH4/rS3GECX36mewNM0bqDVpCigivqk+vTExmtiZsj
         Oo6hJmGZHeye30w/E+EafF/4O9mYWSgJaPKLgdArhi//ePWqLcvciPJzMzVya0IsM1+k
         ahTOfnvS3QzhVfxX3g0RQQjtn0dLOs46+TMeIEtn813+D4NU4zj94OrTdK0MYiXzHnr9
         qK4g==
X-Gm-Message-State: AOJu0YzWXooPgiJfZ3Hfh9v55Nu70bTitSbXzd4qi7gEXEaIl1J16VgQ
	wK5xbYTV39k329fWn1/7BaZncWT1bW9yGsDdUgRDwsGLKmIcutTgB/vNY12Q3JoRSDI2dLYqCj2
	mBGfnN94=
X-Gm-Gg: AfdE7cnH2UoDtRLf3L0oMq3gxWADCCLPFIG0hZ52FmTKPxSX1P6VEvYag4JMGaWAtPq
	ETFcwPLgwmvN4rK+aCaIBsGeBVkb6knA6rzYKNSYzysM5DI4X1MusRC4zv9c+HcJBijrIsHwyd6
	e0dDKS2rmyHxsWauBghUDLgOpJH5q/I1wGYlrN89eHVISoYQKnJosH2gHyAcaPCB8ojV+ewUd1y
	HNyo+AhZYQ3OSTiMz2EEY38oGgSo8q3sehAIv+3EiWxOG4hMJCkGIbcr9GAp5pMYCkTHkOeC5gm
	IP2VNLTAPs0RmG0VUZidmOFQ34Aw4oRm1SGQitbS5JnSUWPIVsiqbSNKJqH2nNQmrnLCcxoXG8R
	LlcSSeOp+5qaI1x+N/14MxuhP7yfGNkMfsvssPwvLdwTTkzWUsnkWDqccN0r9XzL+VrfUxsWGid
	neakw9NucRhjPYKaLDQ4Y8dau/iA==
X-Received: by 2002:a05:600c:348e:b0:493:b6e4:fb2b with SMTP id 5b1f17b1804b1-493d11f1a32mr81445235e9.25.1783291366102;
        Sun, 05 Jul 2026 15:42:46 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/55] linux-yocto/6.18: qat/intel configuration warning fixes
Date: Mon,  6 Jul 2026 00:40:59 +0200
Message-ID: <98c44f0c864ae69ec26de49427139b2b2ebf2e6a.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240163

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Yogesh Tyagi
    Email: yogesh.tyagi@intel.com
    Subject: qat: fix CONFIG_CRYPTO_CTS mismatch warnings
    Date: Mon, 18 May 2026 22:21:02 +0530

    [NOTE]: 'CONFIG_CRYPTO_CTS' last val (m) and .config val (y) do not match
    [INFO]: CONFIG_CRYPTO_CTS : y ## .config: 8103 :configs/v6.18/ktypes/base/base.cfg (y) configs/v6.18/standard/features/qat/qat.cfg (m)
    [INFO]: raw config text:

            config CRYPTO_CTS
                    tristate "CTS (Cipher Text Stealing)"
                    select CRYPTO_SKCIPHER
                    select CRYPTO_MANAGER
                    depends on CRYPTO
                    help
                      CBC-CS3 variant of CTS (Cipher Text Stealing) (NIST
                      Addendum to SP800-38A (October 2010))

                      This mode is required for Kerberos gss mechanism support
                      for AES encryption.

            Config 'CRYPTO_CTS' has the following Direct dependencies (CRYPTO_CTS=y):
                    CRYPTO(=y)
            Parent dependencies are:
                 CRYPTO [y]

    [INFO]: selection details for 'CONFIG_CRYPTO_CTS':
            Symbols currently y-selecting this symbol:
              - FS_ENCRYPTION_ALGS

            Symbols currently n-selecting this symbol (no effect):
              - RXGK
              - CRYPTO_KRB5

    base.cfg pins CRYPTO_CTS=y while features/qat/qat.cfg requests =m.
    FS_ENCRYPTION_ALGS=y forces the symbol to =y at .config time, which is
    the correct outcome -- QAT consumes CRYPTO_CTS via the in-kernel
    crypto API and works against either built-in or modular CTS. Add the
    symbol to the y_or_m_enabled.cfg whitelist so the audit no longer
    flags this mismatch, matching the existing handling of CRYPTO_CCM
    and CRYPTO_GCM.

    Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Yogesh Tyagi
    Email: yogesh.tyagi@intel.com
    Subject: bsp/intel-{x86,common}: drop CONFIG_HIGHMEM64G
    Date: Mon, 18 May 2026 22:21:03 +0530

    CONFIG_HIGHMEM64G was removed from the kernel in v6.18-rc1 by:

        commit bbeb69ce301323e84f1677484eb8e4cd8fb1f9f8
        Author: Arnd Bergmann <arnd@arndb.de>
        Date:   Wed Feb 26 22:37:09 2025 +0100

            x86/mm: Remove CONFIG_HIGHMEM64G support

    The two intel 32-bit BSP fragments still carry CONFIG_HIGHMEM64G=y,
    which against a v6.18 kernel produces:

        [INFO]: the following symbols were not found in the active configuration:
            - CONFIG_HIGHMEM64G

    emitted by do_kernel_configcheck whenever MACHINE selects one of these
    BSPs (e.g. MACHINE=intel-core2-32).

    The replacement on x86-PAE kernels is the unconditional 64GiB ceiling
    that landed alongside the removal commit; no fragment-level opt-in is
    required. Drop the obsolete symbol from both fragments. This mirrors
    the recent "x86: drop CONFIG_BIG_SMP" cleanup (3260f662) for symbols
    upstream removed in the same series.

    Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ba0465eef261d649368c46ed1d2e1b24240c01f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 031c81c2b30..b5775d2fd14 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -16,7 +16,7 @@ python () {
 }
 
 SRCREV_machine ?= "dda294005f893c24b6322a7bdf58d7575f4ad21f"
-SRCREV_meta ?= "2d12860e7692327b02ec4d707585fe101b8c4d38"
+SRCREV_meta ?= "a5384458147b581e6beac32ee5cec4e4422d58b1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 824546e6618..70577b74b59 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -19,7 +19,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "8b43828d68f73df49a408e5bba88eade55b0ca09"
-SRCREV_meta ?= "2d12860e7692327b02ec4d707585fe101b8c4d38"
+SRCREV_meta ?= "a5384458147b581e6beac32ee5cec4e4422d58b1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 88b8949cf41..96ea7122d6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -28,7 +28,7 @@ SRCREV_machine:qemux86 ?= "8b43828d68f73df49a408e5bba88eade55b0ca09"
 SRCREV_machine:qemux86-64 ?= "8b43828d68f73df49a408e5bba88eade55b0ca09"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "8b43828d68f73df49a408e5bba88eade55b0ca09"
-SRCREV_meta ?= "2d12860e7692327b02ec4d707585fe101b8c4d38"
+SRCREV_meta ?= "a5384458147b581e6beac32ee5cec4e4422d58b1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same

