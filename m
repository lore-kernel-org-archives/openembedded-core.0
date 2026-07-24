Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80547C531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:17 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15310.1784883736000812034
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nfgypGh1;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e5c92c389so11106785a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883735; x=1785488535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8OC83y0DyZ4+a57PUswniWlbdvGBjhtYPOpxhEyrkRQ=;
        b=nfgypGh15e5Ftv8whH7yje7Mt5knboj8mJRcaXlSiz3iTL4QkawAHcf4XPWwNz8657
         sYI/ZHLL5jcDxCJoJ+f1dWcsAZPzRGdtksJXxokD2HwEv3Ra9olXSiRY38XXQmMMU3iI
         jPlusayyxHdDUZLIdMBhhjhmk094CDMzNKEr7ocw5NExBo+sf3ovM2WqO+snfLfu+nxQ
         FkefChlkcD27q3mJJpztWLKngFXjVbzHD+MCYqzK0peS2JExwwLPvdbOJk+wnUhooEr3
         EBu++dAYEg5dV0PpCn9nyRv+Xf00phNtu/TV0RK37PtnyKd648//vvxKZCVMidYuMXJY
         m/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883735; x=1785488535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8OC83y0DyZ4+a57PUswniWlbdvGBjhtYPOpxhEyrkRQ=;
        b=RLoH8+P5dCP9zux3sVE+/7pDS2K6RC8+Td3BG8S7f176hCc/puA83Vy9p1z/y5dCah
         laHt7BM0vzrizXdGpMlIcF0lgyY9rC2MIMJmT/x7RDqPjhKDPNfD+0ul+nHg8R9tkxq2
         VVuIxjbfuoYewToxye7IRKyWBEVSQI+Yqtz+ahJ9h/cG+ZuknF3uzyEz7RsV9C6XjM4D
         4wep97CUXkKXGXSxb34+L0dLld2ZGA9vrarADWqnihA+W5sE4R3xnFnGTvNbIHzOZlpM
         pySRkfmibmYMK8gf54XbVXnh1lWf7mbEXsC0MHM5TMjV/mWdH+HwPBkhZxniVYrtk/+x
         CQjg==
X-Gm-Message-State: AOJu0YwHPHm/z9hPfjL/HUTGrgAjkmwmEsR8v/fpUK9ZZiMYfuIAR9mg
	z5oO1pvxPU/x8ADLinYJbEtVybn1Q7cQyXH3UL0fRHmbDFGNssvB43gUpZBRqw==
X-Gm-Gg: AR+sD128VlCEncBZG1EXg9+IovUw5x5RiMB6xJwsO9o7jLp13opvJ3oz0xFBT8gbPY3
	ha/wYE6ny+dBq+TEeuQ4WU6C3pOEZqYtUsDZoE+fdHSDxpc06mzGCvz56mjonhV6lkov38+A0SF
	R2HsP0a7MQcZr71gGCXuedIIEGH1Yz8xaGLGmFMatvbVb2VegkTI90yHtk+wCUHlGqmHVk1HEkO
	ZKYZh/KTUIE/eMsRmrl2aDIC7ZBoyB7E3SbJIcsyFGspXrBw1z+4sMh3Cd9rEsCd/mum20ZozLM
	+qrlvzzSTTOAktBmQgSNyJr5ZavNR5unpQpPQUF3jHNdHmFIjJvb6Hx6UyrME78J5o8cGFTLQgF
	DZBPlCjwAYwf58eB1MstAlG9znlp/iGMRlOEfaMYSD6BDRtkndvfPNkuFAbH6I+NFHppZKkIoHg
	cEgpJMc/aEeyGplUorvrPSoiOYhJObkuEpsGqf8/IxYi98
X-Received: by 2002:a05:620a:c4d:b0:92e:e7c9:615b with SMTP id af79cd13be357-9310384ef71mr651192585a.18.1784883734761;
        Fri, 24 Jul 2026 02:02:14 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.02.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:13 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 09/10] nativesdk-packagegroup-sdk-host: gate qemu behind SDK_FEATURES
Date: Fri, 24 Jul 2026 05:01:45 -0400
Message-ID: <20260724090146.19924-10-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241919

qemu (with its helper) is added to every standalone SDK on the
architectures where it builds. It is only useful for running target
binaries on the host via qemu-usermode, which not every SDK user wants,
and it is a large thing to carry when they do not.

Move it behind the "qemu" SDK feature, which is enabled by default so an
unmodified configuration still gets qemu exactly as before on the same
architectures; the architecture guard is retained. A configuration that
does not want it removes the "qemu" feature from SDK_FEATURES.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- reordered after the opt-in features (wic, sbom, lldb); the default-on
  features (qemu, gdb) now come last

changes in v3:
- new in v3
---
 meta/conf/bitbake.conf                                          | 2 +-
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8f590ed374f0..f96ede6d88df 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -898,7 +898,7 @@ OES_BITBAKE_CONF = "1"
 
 MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
 SDK_MACHINE_FEATURES ?= ""
-SDK_FEATURES ?= ""
+SDK_FEATURES ?= "qemu"
 
 DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
 
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 9e3190af2a56..bf9de4201810 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -13,7 +13,7 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 # build some recent linux kernels (5.14+) for arm
 RDEPENDS:${PN} = "\
     nativesdk-pkgconfig \
-    ${@'nativesdk-qemu nativesdk-qemu-helper' if d.getVar('SDK_ARCH') in ['x86_64', 'aarch64', 'ppc64', 'ppc64le', 'riscv64', 'loongarch64', 'mips64', 's390x', 'sparc64'] else ''} \
+    ${@'nativesdk-qemu nativesdk-qemu-helper' if bb.utils.contains('SDK_FEATURES', 'qemu', True, False, d) and d.getVar('SDK_ARCH') in ['x86_64', 'aarch64', 'ppc64', 'ppc64le', 'riscv64', 'loongarch64', 'mips64', 's390x', 'sparc64'] else ''} \
     nativesdk-pseudo \
     nativesdk-unfs3 \
     nativesdk-opkg \
-- 
2.50.0.173.g8b6f19ccfc3a


