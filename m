Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F2AC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 18:40:08 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.30115.1752691206735600986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 11:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VCMvlzmC;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae3b336e936so28216766b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 11:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752691205; x=1753296005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wAwbjzZCfTNqaQTbWIxrJStdqOOxZO2ZM+xgRlkt3k4=;
        b=VCMvlzmC8M3e1xc9K3e3M1nb+6RhU4RFXcSIc//XncKwafZyH2Qg8ltvQ9k1HWkCgh
         lIh8WCCs+Xa2e+jRYEzQ33GGB+pHduNV6CPkqBV1EUuhfRUf40dzk9Bn41RGI+oHzSBn
         nSSV4DBhMXoMaExZUTaiQD0VKv0wEG9BzDbgL6AWKhHqqpTEf6F8zAwsMrJSqQpa2CFW
         UZesPsxVoAPSLBHOhilnPr9Ejvp49qrCuwtN1mYK4FU/HH6aoXd2pvFvJb31f/IlSjdW
         JeoA2iYhCzos7jk9t7jpG3Ps5z4wJBq4d26xCObUDrozVW8CjpurKD5pL+NFCytZf5Pe
         naSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752691205; x=1753296005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAwbjzZCfTNqaQTbWIxrJStdqOOxZO2ZM+xgRlkt3k4=;
        b=gkpiNBMBN7713Remc36Vcd3vMcxiWv9hAPZwdoGTvVmlO9qEDZgQ0Wjw6eGTXF//D1
         28O1aBEeLQa89q//IZuiOd69Jdef83i4tOX9pdJErUVFe+cSbju3aJCsh8ouFMpjDZbR
         w9WVhHjOtLa7YdiNl67LzlNkrymP387P2PdTE1GtwphdXCtkhX0PT6zKrI8/QI81stUU
         5bHtsozu9THUv+qctFE03FzTH01rUsu9ZSDAcv7nc6CxMNqsO6VmSPzcwCsWq5ghkO+g
         Zd5Q5TBnkg7jZjNmWno5WAd1JeMHB22gJPx7Rlt809Apvdn6nr7Knofuh5q6yE8D0x0Y
         UAxw==
X-Gm-Message-State: AOJu0Yzu4DdJqo2pD2MECdMt9lSCC3FBEo3ZY3Q2JM46Ht2auglS32MC
	HmOnknpPnMM9qRBdEWhv7zsS9W3WSYPpE+EcsrrOAMjCGc2lGWmnhtDAS+RlAg==
X-Gm-Gg: ASbGncsKvibO8SpCkhWbB7g1IeHRrNGnjfw5o6tbsDbseAn7v8odYwT5bJh/w5XNZ4g
	mnk8o+qoXMwW9Fils2jK/O7Wc1/O3FF42B1MLngS9EFKm6PgRfnT+UaabCAHky3u3A1Ws+mj4xx
	J0D6w3ukgqwvz3lNrNDrPeOmo8h7LYp+slpTQL62i4i4Qd0EFoy1TSwuzDG7LOaVyPjI2IdzjNa
	ihmnb3MOfYOB0noFes4LENhqttE7nF32HW8XJcWZvkHe/wO3TsU8YKY9JxmVuKxwpGRiU//6AC6
	GlUd6wLGALg/ZgwNuUlbzDpwO3Bo0gEIYjGlBuHmo6wLYxbWd/LhsTed+CF2AvqRoGdg1Gpic2h
	N+XmV+aZGTbUM+8mnhQHdxEeZMS9TWQ==
X-Google-Smtp-Source: AGHT+IHQQUXIjN3QNpknx0RwUxp32HVZkR00J+bEZAsqdkdb8pvVCGuBR8YjVwoTSGpeUQ0rqdSZsg==
X-Received: by 2002:a17:906:6a17:b0:ae0:dfa5:3520 with SMTP id a640c23a62f3a-ae9ce0d2ce4mr423029066b.31.1752691204343;
        Wed, 16 Jul 2025 11:40:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82952d2sm1238239566b.140.2025.07.16.11.40.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:40:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] tunes: set valid clang tune for big.LITTLE Arm SoCs
Date: Wed, 16 Jul 2025 20:40:02 +0200
Message-ID: <20250716184002.2334552-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 18:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220473

clang doesn't have Arm big.LITTLE specific tune options - when such an option is used,
the compilation fails with an error like this:

aarch64-poky-linux-clang: error: unsupported argument 'cortex-a72.cortex-a53+crc+crypto' to option '-mcpu='

To avoid this, in case a big.LITTLE SoC is the target and the toolchain is clang, select
the tune corresponding to the LITTLE core.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v1: https://lists.openembedded.org/g/openembedded-core/message/220467
v2: Instead of manipulating these arguments in one place, in clang.bbclass,
    make these changes in the affected machine configs.

 .../include/arm/armv8-2a/tune-cortexa75-cortexa55.inc       | 6 +++++-
 .../include/arm/armv8-2a/tune-cortexa76-cortexa55.inc       | 6 +++++-
 .../machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc | 6 +++++-
 .../machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc | 6 +++++-
 .../machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc | 6 +++++-
 .../machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc | 6 +++++-
 6 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
index e18b2cb6e0..6b9b541f9a 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
@@ -5,7 +5,11 @@ DEFAULTTUNE                                        ?= "cortexa75-cortexa55"
 
 TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "", d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
+
+CPU_TUNE_ARG = "cortex-a75.cortex-a55"
+# clang doesn't support big.LITTLE tunes, select the LITTLE tune
+CPU_TUNE_ARG:toolchain-clang = "cortex-a55"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
index 7daf9d91a8..8195782cd9 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
@@ -5,7 +5,11 @@ DEFAULTTUNE                                        ?= "cortexa76-cortexa55"
 
 TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "", d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
+
+CPU_TUNE_ARG = "cortex-a76.cortex-a55"
+# clang doesn't support big.LITTLE tunes, select the LITTLE tune
+CPU_TUNE_ARG:toolchain-clang = "cortex-a55"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 
 require conf/machine/include/arm/arch-armv8-2a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
index 052d1173c9..ee86c1c84b 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
@@ -1,7 +1,11 @@
 DEFAULTTUNE ?= "cortexa57-cortexa53"
 
 TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=cortex-a57.cortex-a53", "", d)}"
+
+CPU_TUNE_ARG = "cortex-a57.cortex-a53"
+# clang doesn't support big.LITTLE tunes, select the LITTLE tune
+CPU_TUNE_ARG:toolchain-clang = "cortex-a53"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
index ff188aec5f..ba92161b9f 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
@@ -1,7 +1,11 @@
 DEFAULTTUNE ?= "cortexa72-cortexa53"
 
 TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=cortex-a72.cortex-a53", "", d)}"
+
+CPU_TUNE_ARG = "cortex-a72.cortex-a53"
+# clang doesn't support big.LITTLE tunes, select the LITTLE tune
+CPU_TUNE_ARG:toolchain-clang = "cortex-a53"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
index 4f4f25f511..370882f299 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
@@ -5,7 +5,11 @@ DEFAULTTUNE ?= "cortexa73-cortexa35"
 
 TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "", d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
+
+CPU_TUNE_ARG = "cortex-a73.cortex-a35"
+# clang doesn't support big.LITTLE tunes, select the LITTLE tune
+CPU_TUNE_ARG:toolchain-clang = "cortex-a35"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
index 1d152ed83b..388df5fb66 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
@@ -2,7 +2,11 @@ DEFAULTTUNE ?= "cortexa73-cortexa53"
 
 TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "", d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=cortex-a73.cortex-a53", "", d)}"
+
+CPU_TUNE_ARG = "cortex-a73.cortex-a53"
+# clang doesn't support big.LITTLE tunes, select the LITTLE tune
+CPU_TUNE_ARG:toolchain-clang = "cortex-a53"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=${CPU_TUNE_ARG}", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 

