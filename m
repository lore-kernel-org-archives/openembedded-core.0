Return-Path: <geissonator@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEC7CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 20:51:11 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.937.1781643065102318812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 13:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ejeSoowu;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: geissonator@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6c047c6bfso4054665a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 13:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781643064; x=1782247864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2R5SvtPaaUlTBRJMd3GgTeuq5VSiNtOblMurs7PxHY=;
        b=ejeSoowump33yG38CvaC0hj+jngwPOocnM4jJSR1Rv1UYg6FpLxA1E55agrjbifo7A
         WC3ssaBKW92pjSxd02RjHOkYQian8dBUKKw5oBZO2xhTXWtRa6s8JhFiKhe1IbESpmbq
         bMXK+fL+4CXJ/tzHcywVW2BoR1eqh+eJMECLrHFEsLLr8vSvlRZNPCKzSTunG18+DPO0
         nu6r8juFtRAnUptXpJTJ+Q/rtf6azuGqgSRKu8dgQc6TAEnrbCtvXrbD1SDYgSY3I6MH
         xoKMcY9PTuAAj45EgzbkxWCcWhL06BXs3MdupQqKLExKSwPNx/IIENRSV/1Kj0y+92d5
         7vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781643064; x=1782247864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2R5SvtPaaUlTBRJMd3GgTeuq5VSiNtOblMurs7PxHY=;
        b=jqk8XWD8ol0BGhbYn/885iBoKmnFHnjeYzTfDZC+H5IFMhawgaIekMASrIG9XfEBlR
         83EZ13v5Z7D/vOIC3tO5V/RYfrg7SAs9SFV4sH4VDli/RsDxkVeqj+QP4IortLyWHRMc
         2dgSdhqjBxsX2KHBDaoW4OMZViOuBVQ2Esh3gDEC1gDSOveweeqJp8cxS4LTQS0V/HI5
         EDzmCYKkkHzj82VVxnF7vSM3LFXYF8zt0dyzh24jzHvfrcocdjOBBTYSLSgZCpPaCFRK
         Geg5bhT9hmqOBGqIMpNxvPfXqc9uaJFhl1hl7SWPHZvo+RrPusVr1P4GKvKwEQycVo7z
         P7mw==
X-Gm-Message-State: AOJu0YzHwktYOQlVbc09pE9JRz5w40GzY9WGIHQ0gOW4mowC29o5Y9W7
	cVblwe9YJ5EfbbiTd5MmDc7Yr6PDxQo3TvW9uA1pRLlv0gUTUjVwU2q+1KuxJw==
X-Gm-Gg: Acq92OGkestDjY4KweDRy75W2eV6oqYpbQKsFunSt2nIvJGNQISPHh3mJf+eBBhpCUz
	IFYzXW/6/rPzuJNAv4GGRK60gil8jKQ4vpm3yUSiACbz4EpVtlzfTDPt3FkptrLPlaFSD8nV8wv
	jV3vu41VdqNCjvzDaJ8oKhoKnSRin07OKvCE9Y445xqxQRpv286Nkgj+hNVOx9YyH6a91w1u9yI
	vbBKj177D6hf6FFkuj9scnEX9AzRRaPnqIZdJP0wazeCfu3b8wacI7vz5rUKdo4wmp802CqFltf
	ABJKQVjlpthwXaY0z2Im5jOD3p3pw7k8J03IK31OvaspnAW6w/2rSeVb6R6Z9vFQON4GzEwvtGb
	mN2guC+UMzMx9eTa/HKfrHJhzBdwA3AcHDs2MgNEDdydokp2m8TI4CNpF/uGkj25095L8i5UGI+
	We+YOvr0ECDXq+v8V+CRFnt+UNl3pHIiNx9ATs7PbEPLvLLjRj4r8AjTOwuGMc2bNtt6exZwhrl
	wkIvOPhTk7D9LoYmCSSQnolmA==
X-Received: by 2002:a05:6830:82e7:b0:7df:5fc:3fd8 with SMTP id 46e09a7af769-7e90b2ae84cmr1251518a34.1.1781643064230;
        Tue, 16 Jun 2026 13:51:04 -0700 (PDT)
Received: from IBM-PW05FM02.ibm.com ([136.49.149.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f6f9f48sm7425735a34.25.2026.06.16.13.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:51:03 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
X-Google-Original-From: Andrew Geissler <geissonator@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@yahoo.com>
Subject: [PATCH] qemu: add ppc64le support to COMPATIBLE_HOST
Date: Tue, 16 Jun 2026 15:50:30 -0500
Message-ID: <20260616205030.50367-1-geissonator@yahoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 20:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238962

The move to qemu 11 and the enforcement of 64 bit machines broke ppc64le
machines. Add ppc64le wherever there is a ppc64 machine.

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb | 2 +-
 meta/recipes-devtools/qemu/qemu-targets.inc             | 2 +-
 meta/recipes-devtools/qemu/qemu.inc                     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 60fb635600..e591cf0f29 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Qemu helper scripts"
 LICENSE = "GPL-2.0-only"
 # QEMU 11.0.0+ requires a 64-bit host architecture
-COMPATIBLE_HOST = "(aarch64|x86_64|ppc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
+COMPATIBLE_HOST = "(aarch64|x86_64|ppc64|ppc64le|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
 RDEPENDS:${PN} = "nativesdk-qemu nativesdk-unfs3 nativesdk-pseudo \
                   nativesdk-python3-shell nativesdk-python3-fcntl nativesdk-python3-logging \
                 "
diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index 937ef1a911..3af7b74eec 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -26,7 +26,7 @@ def get_qemu_target_list(d):
     if 'linux' not in tos:
         return softmmuonly + ''.join([arch + "-softmmu" + "," for arch in archs]).rstrip(',')
     # QEMU 11.0.0+ only supports linux-user on 64-bit host architectures
-    linux_user_hosts = ['aarch64', 'loongarch64', 'mips64', 'ppc64', 'riscv64', 's390x', 'sparc64', 'x86_64']
+    linux_user_hosts = ['aarch64', 'loongarch64', 'mips64', 'ppc64', 'ppc64le', 'riscv64', 's390x', 'sparc64', 'x86_64']
     if tarch not in linux_user_hosts:
         return softmmuonly + ''.join([arch + "-softmmu" + "," for arch in archs]).rstrip(',')
     return softmmuonly + linuxuseronly + ''.join([arch + "-linux-user" + "," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3071f74650..fa6a74f598 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -63,8 +63,8 @@ COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
 # QEMU 11.0.0+ requires a 64-bit host architecture for emulator builds
-COMPATIBLE_HOST:class-target = "(aarch64|x86_64|ppc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
-COMPATIBLE_HOST:class-nativesdk = "(aarch64|x86_64|ppc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
+COMPATIBLE_HOST:class-target = "(aarch64|x86_64|ppc64|ppc64le|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
+COMPATIBLE_HOST:class-nativesdk = "(aarch64|x86_64|ppc64|ppc64le|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
 
 # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
 # upstream states qemu doesn't work without optimization
-- 
2.43.0


