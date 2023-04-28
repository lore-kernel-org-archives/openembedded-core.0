Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F998C7EE21
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.14760.1682671711231919775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=j+Ip8wBF;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-2f917585b26so8719331f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671709; x=1685263709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2D1PU3l5n6hr7Bb/gaGnM4hcBHfPdgXibh1R2CyuZAo=;
        b=j+Ip8wBF/XJD8E8HaxM5lp72dtu/funpw7MYHSSmfVhJR4u/j7jn1PjFwhg9la+qKF
         lPnunzXatclYjMfYpEMhiO5TDS7DqWw/BdG1maW8DlZbpD04FLgT4hgwdV1e+QKoPZZq
         jBiRl6JaYqRyDx0B+LtyDTMsko8XNXR7xwIR0pvEEq5r0ymUSoZXFtslnqXlJMnaivlU
         av17FewFzHUnRXdLOpheBdmtzfZYtVoZKwtGceDuFxCO1dXaTinfj9seZaOyKDi44elO
         9n47jl+LlTRy3zdeIRpGj8v3nGQTe6rSOs1OBzIFkpfGPmlJS0suRAyEb9TRjtr2ZJgA
         3uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671709; x=1685263709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2D1PU3l5n6hr7Bb/gaGnM4hcBHfPdgXibh1R2CyuZAo=;
        b=FliFfT4UnsDBsdiM0aklut7jZfw77UdU/eWXlAl61cjlidmB4rvCTBndC9arMvVsiA
         K3Dpy5Sp8guGJbjZuH0pDl3TRS2VoVRzR8OpxGAUya5dxwOK72BVDXzOwEfkI7b6kwMH
         vyP8AjkL+rdinMSuiMA3WYh5j338R6I8btBunLpdEOiLgMgFC1Fxbfq+QumLv66Dre7e
         7C/ASP6fLg3IXmTMLvzhgwo1BZCH9Gw7FmCV2M7EBuQctFUivWlN1PMfZ30Ssi4EURCp
         ixRmJPqTvowngl2ZN+w5d0/ymMhh8YfB3BQXNryg+f0rppchd6KHGAN3BxxME8ADtawh
         dQUA==
X-Gm-Message-State: AC+VfDyhR1B7lRoRost7Yc9TkLAaAonxpNrCMxy4UZ++qQfGuZ9UpuC8
	PoGct53nibOPm4fRCwV9lmTiJa5YkT8=
X-Google-Smtp-Source: ACHHUZ7wIHxfolhyjhu4htF9pfuyytzK2hSO2V1q+s5wZyacOCt8ftA0ZUktgyRtGRZ2OtDaNQsCSA==
X-Received: by 2002:adf:ed04:0:b0:2cb:76d4:42ea with SMTP id a4-20020adfed04000000b002cb76d442eamr3270392wro.36.1682671709619;
        Fri, 28 Apr 2023 01:48:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 05/11] bitbake.conf: set minimum required target kernel to 5.15
Date: Fri, 28 Apr 2023 10:43:46 +0200
Message-Id: <20230428084352.836515-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180516

In particular this enables a number of useful features in glibc
(which utilize newer kernel APIs), such as actually using 64 bit
time_t versions of kernel syscalls:

https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/kernel-features.h;h=07b440f4eea364b05fa49bf71ceebf78f80efe13;hb=HEAD#l164

In general, OLDEST_KERNEL setting is used in these two places:

- kernel.bbclass compares it with the target kernel version being built.
If a vendor BSP still offers an older kernel, OLDEST_KERNEL should be set to match.

- glibc recipe passes it as a parameter to the build so that additional features
and optimized paths that kernels older than OLDEST_KERNEL are enabled.

Note that there is a related setting, SDK_OLDEST_KERNEL, which remains as
it was (at 3.2.0) to ensure maximum compatibility with kernels on SDK host
machines; that setting is used to build nativesdk-glibc and verify the kernel
version when the SDK is being installed.

Build host kernel versions are not checked directly; compatible distros
are listed instead.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

---
v2: rewrite the description to address the concerns about build host kernels
and sdk host kernels
---
 meta/conf/bitbake.conf | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index afd9e2f5527..2db84a46eed 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,12 +469,7 @@ SDKPATHINSTALL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 # Kernel info.
 ##################################################################
 
-OLDEST_KERNEL = "3.2.0"
-OLDEST_KERNEL:aarch64 = "3.14"
-OLDEST_KERNEL:nios2 = "3.19"
-OLDEST_KERNEL:powerpc64le = "3.10.0"
-OLDEST_KERNEL:riscv32 = "5.4"
-OLDEST_KERNEL:riscv64 = "4.15"
+OLDEST_KERNEL = "5.15"
 
 # SDK_OLDEST_KERNEL can't be set using overrides since there are
 # none for the SDK architecture. Best to set it from a machine-sdk
-- 
2.30.2


