Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.75439.1597785225946077973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 14:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=Ha9xgtka;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.214.195, mailfrom: jonathan.richardson@broadcom.com)
Received: by mail-pl1-f195.google.com with SMTP id r4so9801828pls.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 14:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d3/d4hBNmVxr658Hd/9EIZZyl43k8wxaHMsxdILJPM4=;
        b=Ha9xgtka040q7xThdo/vrbRfXt+qEMp8Yh57UYR1lkCBkNP50AIDZQYOITxIFjyC1j
         H+3ZEYQK1aST2ZxmxV/pSGCNXRMhKpBS98kVa/UMrTDW4L0ubVKyxHDATZq3YjVK6Qbr
         ELEIjeBuKbmplmW1K/4gI/Ww/PtQtTz29O744=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d3/d4hBNmVxr658Hd/9EIZZyl43k8wxaHMsxdILJPM4=;
        b=ivlkz9DOZA6k4PpKm0zzFG+/YIk2qbaZjxilIpCEL8LMAr1O9+cOUa33eUiRbMB2IO
         AJyeZQEdaIRbg7n4VX9K7vsfPdgwSYtCBBxs2nUA6SL53Ys95VmQvoyAO7k65bXWTcmV
         hrGhEwgtrNc7vBdPqJEbo7+Zfj4TeGMRMpys+8ME/tKpPZmppnSjsyl1IiFFkwc0/IrD
         0FpQhT6ksB6EiyvLKIi3Txwd1PsIy6N7u8+sXb/k2B0dr88I5qGzSRBFMJX6e7aLnGYm
         ZeEKAxtXfdQcM8HlUJNucW1AcvWqy2gqzbmKtl4ukUaPzTrWba3dn5Jnvob3cFXj8amJ
         v+OQ==
X-Gm-Message-State: AOAM532p8paKVAdjrLsMxz0lJaRGwclbNWIQ8lLE7MAKXZECEnDH3BaF
	E8eHtzc+tg/DU1Osafyera+HyD+zxEXXKvN9eDbYUQ+eBLOGWdzFSiAmf59L2kjPL78BbFJPWhE
	PN8jYFtfjRO8r5eBZ1NVKFzds8LGRzMrNmROmdUAd47OSmYvx7jmncRSOMZluIMzXwvy47B+zib
	NI+lN2skXKDKrexcT+qk9WqYmCWh2I8RO6v9Q=
X-Google-Smtp-Source: ABdhPJw58MQhwzlFAB1DDqy/Bl10wAYl6K1264iTiwBOx7fmHTrR+PV2mr3opZj7afyY2DlRJdhmSQ==
X-Received: by 2002:a17:90b:784:: with SMTP id l4mr1379200pjz.96.1597785225081;
        Tue, 18 Aug 2020 14:13:45 -0700 (PDT)
Return-Path: <jonathan.richardson@broadcom.com>
Received: from lbrmn-lnxub108.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id y4sm25803186pff.44.2020.08.18.14.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 14:13:44 -0700 (PDT)
From: "Jonathan Richardson" <jonathan.richardson@broadcom.com>
To: openembedded-core@lists.openembedded.org
Cc: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: [OE-core][PATCH 1/1] cortex-m0plus.inc: Add tuning for cortex M0 plus
Date: Tue, 18 Aug 2020 14:13:32 -0700
Message-Id: <20200818211332.38006-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tuning files for ARM cortex m0 plus and the armv6-m architecture
that it is based on.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 meta/conf/machine/include/arm/arch-armv6m.inc | 20 +++++++++++++++++++
 .../machine/include/tune-cortex-m0plus.inc    | 11 ++++++++++
 2 files changed, 31 insertions(+)
 create mode 100755 meta/conf/machine/include/arm/arch-armv6m.inc
 create mode 100755 meta/conf/machine/include/tune-cortex-m0plus.inc

diff --git a/meta/conf/machine/include/arm/arch-armv6m.inc b/meta/conf/machine/include/arm/arch-armv6m.inc
new file mode 100755
index 0000000000..8202ef52f7
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv6m.inc
@@ -0,0 +1,20 @@
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
+BASE_LIB_tune-armv6m               = "lib32"
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

