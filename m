Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DD3C4167B
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 10:43:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.118881.1699526596040866712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 02:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QWfLPWWy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32da4ffd7e5so424012f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 02:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699526594; x=1700131394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r+mnSIsaYjz03rYzd2N9U8qRiP24Ma5ymzdnp3zrrms=;
        b=QWfLPWWyvEY9AWyLmtfZx5Qy+fDBwtgjvUxvas6N84fY2gONPiCodz6GktD29c7g7R
         0592i/AZdrWV4sxsjT9M9onWZsHVChAx3I3j4orgYIU0Asl/uprlYuA/XiNRl3GcSlL0
         7k1uW2adxix2rSnetJUvD6Nxgi9dS5wMm2R1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699526594; x=1700131394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+mnSIsaYjz03rYzd2N9U8qRiP24Ma5ymzdnp3zrrms=;
        b=cqCLBbsJxVOPjue7/43gq4kqBDaJdDzt5viGTjU43Vm0ipassu7EmntTy16vbUArj9
         zLLYSDEhOyoLJphes4/cqnZ4MJR5akE2mADUkprDV1EyLhfPnMIvGtnyQT8o+ePBz+Ce
         Rc7JES5yanfnL54T1F7wA/X3LB/PxBQPPtRNdoWSr1eefgv+dpkpmA1SuLmzeDtprknK
         sca37rUsB5sJJ29ry2zTUnE9RUzNR8K6t1sGnVQUqUQrxequawNj0Ewb3LlsufhXVL9S
         usgiZVteHS9fTxQB5qGUU86qmHiWoTxZmmtr5AS2BTtn2b2jHHsxxLsTsfaTP5EQDApH
         eO0g==
X-Gm-Message-State: AOJu0YwTkXhD8wiXuxkDNnW+OBXkFGwOTZFI657vC8/MNK0GdX2kVWLX
	7QuaXdtgOV2Imq3fy7dZAUo/9mUSOV8RJHb8C84=
X-Google-Smtp-Source: AGHT+IF8SR5qdwER4Ft919W9XuoR1u+yLR/eSSDtIPJhaXgi4Q8q+DEYt31+x5mbRqO0+O0MReJRQg==
X-Received: by 2002:a5d:5904:0:b0:32d:8c67:be05 with SMTP id v4-20020a5d5904000000b0032d8c67be05mr5628771wrd.22.1699526594036;
        Thu, 09 Nov 2023 02:43:14 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d6a:4777:87ed:703e])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4806000000b0032dbf99bf4fsm7186716wrq.89.2023.11.09.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:43:13 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <Jon.Mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2] libdnf: Fix arm arch mapping issues for qemuarmv5
Date: Thu,  9 Nov 2023 10:43:12 +0000
Message-Id: <20231109104312.1640551-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 10:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190381

qemuarmv5 currently fails with:

$ dnf --help
Error: Incorrect or unknown "arch": armv5hl

Fix this by removing the code in libdnf which is trying to be too
clever, we don't need this mappings given the way OE configures rpm.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libdnf/libdnf/armarch.patch               | 42 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.72.0.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/armarch.patch

v2 - actually send the right patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
new file mode 100644
index 00000000000..99eaf1d521f
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -0,0 +1,42 @@
+We change the way rpm architectures work, we make the machine name the default machine
+specific package architecture.
+
+This arm mapping code can work or in the case of qemuarmv5, it doesn't as it creates
+armv5hl which doesn't exist and causes errrors. We can simply remove it, we don't need it.
+
+Upstream-Status: Inappropriate [Relies on OE rpm config]
+
+Index: git/libdnf/hy-util.cpp
+===================================================================
+--- git.orig/libdnf/hy-util.cpp
++++ git/libdnf/hy-util.cpp
+@@ -117,29 +117,6 @@ hy_detect_arch(char **arch)
+     if (uname(&un) < 0)
+         return DNF_ERROR_FAILED;
+ 
+-    if (!strncmp(un.machine, "armv", 4)) {
+-        /* un.machine is armvXE, where X is version number and E is
+-         * endianness (b or l); we need to add modifiers such as
+-         * h (hardfloat), n (neon). Neon is a requirement of armv8 so
+-         * as far as rpm is concerned armv8l is the equivilent of armv7hnl
+-         * (or 7hnb) so we don't explicitly add 'n' for 8+ as it's expected. */
+-        char endian = un.machine[strlen(un.machine)-1];
+-        char *modifier = un.machine + 5;
+-        while(isdigit(*modifier)) /* keep armv7, armv8, armv9, armv10, armv100, ... */
+-            modifier++;
+-        if (getauxval(AT_HWCAP) & HWCAP_ARM_VFP)
+-            *modifier++ = 'h';
+-        if ((atoi(un.machine+4) == 7) && (getauxval(AT_HWCAP) & HWCAP_ARM_NEON))
+-            *modifier++ = 'n';
+-        *modifier++ = endian;
+-        *modifier = 0;
+-    }
+-#ifdef __MIPSEL__
+-    if (!strcmp(un.machine, "mips"))
+-        strcpy(un.machine, "mipsel");
+-    else if (!strcmp(un.machine, "mips64"))
+-        strcpy(un.machine, "mips64el");
+-#endif
+     *arch = g_strdup(un.machine);
+     return 0;
+ }
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
index d58ad0353ff..a8685a16048 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
+           file://armarch.patch \
            "
 
 SRCREV = "908dba63c9e18c86a2d81166ce7523559e65338c"
-- 
2.39.2


