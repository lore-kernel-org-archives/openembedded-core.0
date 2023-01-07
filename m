Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D5AC46467
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 14:41:24 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.21353.1673102481267277887
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jan 2023 06:41:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DVRmY2AP;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id bk16so3745527wrb.11
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 06:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gAOUpGfo6ATp/rrZlYCaiQMMr7I6XznC8l7ka+idTh4=;
        b=DVRmY2AP5Wjim7Dtgrvz5pvpSSsqX3puOVlxdwPV1rxEL1Y5Pp9rjmqtmAMUGSrzzF
         xbwkAGq831hSoohJcDk5kAAeUCoiET0xQ/ETsXVRJam8JfMxSUp2PG3cn+UbGxMbkKP/
         PpBmg0H56K8ba2r4DgUh+PqQkbhtoJxluY8eOlIX1vXPmcwuxuJtxYJGrB8zccpJLNQv
         V+H6g9gElzxsI2eukVb9klce3uFHVaZUcalKzixb1hy7aEz5Qb2uvIvuKMPQFVcw3Jtd
         KCfA1xJTWIo+aqeeiJJs7PPWXzt3uIdSsx4C5uMH8/bb4f6e+Tb6hNoiAqLyc5fu4SeR
         nawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAOUpGfo6ATp/rrZlYCaiQMMr7I6XznC8l7ka+idTh4=;
        b=kb20O1DIigK3mtlCwYfjCXrwECactm4FFPw5ZbYE235ZPA++GFP0RnVCIw+9xi+nwQ
         4aYUBxFnziFmzJR1z2MJNqgIm6k6rllRar0PVD00jemHlENQZ6KBTVhh/Fdq7E0Vzzok
         El793V4Urm8b6Qm5QGWAyQX7g85fhx/bmVnkS3kDm+qGX7VNk07mRmmUgv/hcnHQ+LUv
         eGNku2EzPUfw4WJxMeK8ttk27uwDlEAgipWIexmWFOcxAfmVzXDni2CnaPyMeukexcUX
         GFLNwfTD+faBj37vQ5XNCP9CgdZxjzhl1FgmBG79rwdYKTHsjKs4PmIKrQlqacckh0kY
         /JHw==
X-Gm-Message-State: AFqh2kqkqagzdZfz1DQ1i/ygOP3tw9KmuQzqZ8aJdXyxQznVb9pgmJhj
	4H818G5xSjQ2kthiTOikgbq8Lx88iKw=
X-Google-Smtp-Source: AMrXdXtBTVZ+LD3kDiEMqezwZgCUx8FvOwQO8sd/qjAEC/TvuZ+UCkJbh9Ye/k1R3SQjiFpBRf0Nzw==
X-Received: by 2002:adf:ce86:0:b0:242:43f3:8950 with SMTP id r6-20020adfce86000000b0024243f38950mr34886733wrn.22.1673102479546;
        Sat, 07 Jan 2023 06:41:19 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t14-20020adfe44e000000b0028663fc8f4csm3971248wrm.30.2023.01.07.06.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 06:41:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] tune-x86-64-v3.inc: set QEMU_EXTRAOPTIONS like other tune-* files
Date: Sat,  7 Jan 2023 15:41:09 +0100
Message-Id: <20230107144109.316339-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 14:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175619

* use Skylake-Client to match QB_CPU_KVM as changed in:
  https://git.openembedded.org/openembedded-core/commit/?id=6f2af1e5d1537b4d31e14946292bf58f0fd76fc9

* explicitly set -cpu instead of letting qemu to choose based
  on host cpu

* check=false is still useful as e.g. on on AMD Threadripper 3970X:
  orc/0.4.33-r0 $ PSEUDO_UNLOAD=1 qemu-x86_64 -r 3.2.0 -cpu Skylake-Client  -L recipe-sysroot -E LD_LIBRARY_PATH=recipe-sysroot//usr/lib:recipe-sysroot//lib
  orc/0.4.33-r0/build/meson-private/sanitycheckc_cross.exe
  qemu-x86_64: warning: TCG doesn't support requested feature: CPUID.01H:ECX.pcid [bit 17]
  qemu-x86_64: warning: TCG doesn't support requested feature: CPUID.01H:ECX.x2apic [bit 21]
  qemu-x86_64: warning: TCG doesn't support requested feature: CPUID.01H:ECX.tsc-deadline [bit 24]
  qemu-x86_64: warning: TCG doesn't support requested feature: CPUID.07H:EBX.hle [bit 4]
  qemu-x86_64: warning: TCG doesn't support requested feature: CPUID.07H:EBX.invpcid [bit 10]
  qemu-x86_64: warning: TCG doesn't support requested feature: CPUID.07H:EBX.rtm [bit 11]
  qemu-x86_64: warning: TCG doesn't support requested feature: CPUID.07H:EBX.rdseed [bit 18]
  qemu-x86_64: warning: TCG doesn't support requested feature: CPUID.80000001H:ECX.3dnowprefetch [bit 8]
  qemu-x86_64: warning: TCG doesn't support requested feature: CPUID.0DH:EAX.xsavec [bit 1]

* if this still doesn't work for you on your host, you might need to downgrade
  DEFAULTTUNE to e.g. corei7-64 (all all the way back to core2-64), for
  more details see:
  https://www.openembedded.org/pipermail/openembedded-core/2018-April/150178.html

* the leading space shouldn't be needed, I've kept it for consistency
  with other QEMU_EXTRAOPTIONS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/x86/tune-x86-64-v3.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/x86/tune-x86-64-v3.inc b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
index 267c12ff50..254f03c590 100644
--- a/meta/conf/machine/include/x86/tune-x86-64-v3.inc
+++ b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
@@ -21,9 +21,11 @@ TUNE_FEATURES:tune-x86-64-v3 = "${TUNE_FEATURES:tune-x86-64} x86-64-v3"
 BASE_LIB:tune-x86-64-v3 = "lib64"
 TUNE_PKGARCH:tune-x86-64-v3 = "x86-64-v3"
 PACKAGE_EXTRA_ARCHS:tune-x86-64-v3 = "${PACKAGE_EXTRA_ARCHS:tune-corei7-64} x86-64-v3"
+QEMU_EXTRAOPTIONS_x86-64-v3 = " -cpu Skylake-Client,check=false"
 
 AVAILTUNES += "x86-64-v3-x32"
 TUNE_FEATURES:tune-x86-64-v3-x32 = "${TUNE_FEATURES:tune-x86-64-x32} x86-64-v3"
 BASE_LIB:tune-x86-64-v3-x32 = "libx32"
 TUNE_PKGARCH:tune-x86-64-v3-x32 = "x86-64-v3-x32"
 PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-x32 = "${PACKAGE_EXTRA_ARCHS:tune-corei7-64-x32} x86-64-v3-x32"
+QEMU_EXTRAOPTIONS_x86-64-v3-x32 = " -cpu Skylake-Client,check=false"
-- 
2.39.0


