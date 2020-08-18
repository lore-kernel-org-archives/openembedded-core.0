Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.77729.1597790535005902285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 15:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=A4iv2rtN;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.215.194, mailfrom: jonathan.richardson@broadcom.com)
Received: by mail-pg1-f194.google.com with SMTP id 189so9781138pgg.13
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OWR3dUsuuk+i7/l64p1EQLXlPthbrDff+gd7S0l1M5g=;
        b=A4iv2rtN9PfhpML+A+Qf2rRAFrEaULYo/bSAlgFG3pQeGXEwi5mXcArIm1D8P+b3HW
         tRoEcUPWjS5Zw6AMhLt2beI79MNhH6Ht9dtJ1ooNkwvNooahm3JRFKOINmHay6wgmEvz
         qbFWSwPp5i+Ce3YzQsDrx1zbGl/gpfq9zUezE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OWR3dUsuuk+i7/l64p1EQLXlPthbrDff+gd7S0l1M5g=;
        b=e2F9oZmkkYTWh94USovgbjZ+dzJgPjVl4ThCyNmwBHTRmQIt5CTMXpao3H8uRTa/Ow
         uZIKC/hOU843/7ApQeYpNQSXzQcj/p83GfL3VftAVBEImeHDol+lytvWcmyQ0f24Uh5T
         EWTX6OwQA9rSTKS/g/Bf8Bvn+qCBCBxYfaWjW2uBQh2T98hbyYVVKoHaOODc4t5+oFiY
         Bn974YT7oJCogA3c/BNFfNOgIj6nsw15qC2my6PeFxiCQHbzETmPT1zxprLYUzX40BGU
         baIpZFTnEZKePwoy7xHa/BMEAaOyg2BOd1mN1VVGioAnimU/E4XfkhjKLcWxKwq61vnu
         FBrg==
X-Gm-Message-State: AOAM530slTcGdQLBPcLSeOoDP9j2mhq/EmesjrtEoJ/rQWh6q9vNclr8
	v2FjplofNqLYZdRyPuxhL1P1eWwCMa6+uMdoM4pxKWs1maSd4wn1JatGvfDks3sJ0qDz7RDgbuK
	/fMYCFTiXmkmayaX4WFWdgVkEHF8uyiU+KzDjqQpD/Qkxgnx6734Ulg7fju4pcmyKehaHu4PThL
	ssBaCFTqCSmtDrqzMWuwlgowLBxpZkTgN9kRA=
X-Google-Smtp-Source: ABdhPJwY0YTpom3Yxwe2YZP0khzdUG7Xlaclen30JmaznD/6Oio+m6yhSa3j0g5xb83/OfQTzPnEdA==
X-Received: by 2002:a62:8105:: with SMTP id t5mr17062598pfd.94.1597790534069;
        Tue, 18 Aug 2020 15:42:14 -0700 (PDT)
Return-Path: <jonathan.richardson@broadcom.com>
Received: from lbrmn-lnxub108.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id 198sm25021484pfz.120.2020.08.18.15.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 15:42:13 -0700 (PDT)
From: "Jonathan Richardson" <jonathan.richardson@broadcom.com>
To: openembedded-core@lists.openembedded.org
Cc: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: [OE-core][PATCH v2 1/1] cortex-m0plus.inc: Add tuning for cortex M0 plus
Date: Tue, 18 Aug 2020 15:42:07 -0700
Message-Id: <20200818224207.89914-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tuning files for ARM cortex m0 plus and the armv6-m architecture
that it is based on.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 meta/conf/machine/include/arm/arch-armv6m.inc | 19 +++++++++++++++++++
 .../machine/include/tune-cortex-m0plus.inc    | 11 +++++++++++
 2 files changed, 30 insertions(+)
 create mode 100755 meta/conf/machine/include/arm/arch-armv6m.inc
 create mode 100755 meta/conf/machine/include/tune-cortex-m0plus.inc

diff --git a/meta/conf/machine/include/arm/arch-armv6m.inc b/meta/conf/machine/include/arm/arch-armv6m.inc
new file mode 100755
index 0000000000..68768106c6
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv6m.inc
@@ -0,0 +1,19 @@
+# Tuning for ARMV6-m defined in ARM v6-M ArchitectureReference Manual
+# at https://static.docs.arm.com/ddi0419/d/DDI0419D_armv6m_arm.pdf
+DEFAULTTUNE ?= "armv6m"
+
+TUNEVALID[armv6m] = "Enable instructions for ARMv6-m"
+TUNECONFLICTS[armv6m] = "armv4 armv5 armv6 armv7a"
+
+# Use armv6s-m instead of armv6-m to avoid gcc bug "SVC is not permitted on this architecture".
+# SVC is a valid instruction.
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', ' -march=armv6s-m', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', 'armv6m:', '' ,d)}"
+
+require conf/machine/include/arm/arch-armv5.inc
+
+# Little Endian
+AVAILTUNES += "armv6m"
+ARMPKGARCH_tune-armv6m             = "armv6m"
+TUNE_FEATURES_tune-armv6m          = "armv6m"
+PACKAGE_EXTRA_ARCHS_tune-armv6m    = "armv6m"
diff --git a/meta/conf/machine/include/tune-cortex-m0plus.inc b/meta/conf/machine/include/tune-cortex-m0plus.inc
new file mode 100755
index 0000000000..1c7512b061
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortex-m0plus.inc
@@ -0,0 +1,11 @@
+DEFAULTTUNE ?= "cortexm0-plus"
+require conf/machine/include/arm/arch-armv6m.inc
+
+TUNEVALID[cortexm0-plus] = "Enable Cortex-M0 Plus specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0-plus', ' -mcpu=cortex-m0plus', '', d)}"
+AVAILTUNES += "cortexm0-plus"
+
+ARMPKGARCH_tune-cortexm0-plus = "cortexm0-plus"
+TUNE_FEATURES_tune-cortexm0-plus = "${TUNE_FEATURES_tune-armv6m} cortexm0-plus"
+
+PACKAGE_EXTRA_ARCHS_tune-cortexm0-plus = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0-plus"
-- 
2.20.1

