Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7B3C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 14:13:42 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.11362.1661350420109124495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 07:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ff9Vjr4m;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id g189so1086884pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=J0flWsJTmHb27oyTxHkBoqcknXTJMUBvW0UDcmxYsO4=;
        b=Ff9Vjr4mZ8/gCVcSltkboIJxNk+7gVte4MSNXMIK9oLt3NTtLUXd9pCIA1fjDZzQeD
         TSRuSdw+K7SGOspAO7a6cTW/yc1ADeA7BD10WAqa/ek4odGCEJqqFhm476unVXcfNRuJ
         eVtM9YOc/EHIm1VIH9MtNZCJ61K0FGufsbvThUx4fsKIKr79coMvnAwWTidow8Od6CFi
         r9lrgNICTDHrqz9p3GqUNfRGfUlD68Fh9dbh/auoPHEDeB65HrkgSEdoCccldKqR/6de
         Mj2I8M8WP7qr8so+E4Pecn/EqKWJTtioSWGK7L/JzYxfIIsmW5/VuhxRSAuuU9FWliKp
         6IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=J0flWsJTmHb27oyTxHkBoqcknXTJMUBvW0UDcmxYsO4=;
        b=Kz2c6pgtYCMD8jWbVdbfVMNm+hr1UQTW4QbL8up5bI5ksFzYMOGRoc4cH2RgL4qazt
         /5i8aTASzQo+irSsUDfpD51bkyiEx2KyfCF4sawBQZ/6Jbbcq1AkVcDMOYZE1c72GesM
         jdxMEKdbRV2lSB7AYv1JmrDCLTRfV1/YN4o/qjivBmUGySkB2OJwCq3YPNIFvvKO6+0n
         tUeNSRG5uJwoPpQ3617guKvjSLlxtj9S2TTpS251zZrfoQg9ZYu06OLP/XPRBP/Z+2ma
         DB6d01WL2yK0mmBZQ5dRIRz2/J29uDnQYRMFzPWbVQKDVQ3v4W1Gj9UfaS9RhZvJt4uv
         5nZw==
X-Gm-Message-State: ACgBeo0F5KZz1YtED0yN0kkPoU97/3dOayaPmuAFa6HJuTOuvybBnbyJ
	ryAX9JaOSg9AmzyqAqbWQAtFMwallrZ3zw==
X-Google-Smtp-Source: 
 AA6agR5QvuFDFeGIKSR/AkuZhzR8GCrAKI2L0yLRnOyaJ8nyW4Ue7HOobikF2JipUlthV9mx7wLg7Q==
X-Received: by 2002:a05:6a00:3406:b0:535:f76f:c971 with SMTP id
 cn6-20020a056a00340600b00535f76fc971mr27649571pfb.5.1661350419223;
        Wed, 24 Aug 2022 07:13:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170902d55100b00172ea32fa9bsm6693778plf.287.2022.08.24.07.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 07:13:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Update to latest on 2.36
Date: Wed, 24 Aug 2022 07:13:36 -0700
Message-Id: <20220824141336.4025637-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 14:13:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169820

Solves the mount.h conflict with linux kernel headers with needed
backports from trunk

These are the complete list of changes this brings

* 3bd3c612e9 Linux: Fix enum fsconfig_command detection in <sys/mount.h>
* bb1e8b0ca9 linux: Fix sys/mount.h usage with kernel headers
* d48813227b linux: Use compile_c_snippet to check linux/mount.h availability
* 4dad97e2a2 linux: Mimic kernel defition for BLOCK_SIZE
* 1cc5513114 linux: Use compile_c_snippet to check linux/pidfd.h availability
* 0062e7dd1c glibcextract.py: Add compile_c_snippet
* 5c62874f42 NEWS: Add entry for bug 28846
* d13a7a6f10 socket: Check lengths before advancing pointer in CMSG_NXTHDR
* 8b139cd4f1 alpha: Fix generic brk system call emulation in __brk_call (bug 29490)
* e982657073 Linux: Terminate subprocess on late failure in tst-pidfd (bug 29485)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 74b48b05f4..a078eb6377 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.36/master"
 PV = "2.36"
-SRCREV_glibc ?= "302bc33bc53c787da6e74162a7092e9c0fb964a8"
+SRCREV_glibc ?= "3bd3c612e98a53ce60ed972f5cd2b90628b3cba5"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.37.2


