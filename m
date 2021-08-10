Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.1280.1628631395833023477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 14:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=MVxHCliZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id az7so14082qkb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 14:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4hMk+P1MlbSh75BOVVRYoR3rySDueCdmuE3rafGPTI=;
        b=MVxHCliZa702GvbwLitDUTo3KT0I9FaJnBHwY5f2Q/kfGdXkcp/FRwixSz7wLZ9Sex
         Nd8Ao3H8kXsBGGAtTVv9DCfdG6Q++n3wRVxpPZot+44tZKS2H9TbvB9uXdjVjcNpTikb
         axPbRbatyYzVarcmr8mDZBCabbFkkfDdamdJ2I9Kl3GKMLGycO3C2dbJyNZZ68FcuRjV
         v6cTHYil88LWQfl5dALMM692+NfovpcYfzvBA2g6hnDaCnuf8yphC0yLCPLNTEPHR54Z
         PoRZm44w01LLpVxGfT4CXTYr6HRYZr0MMtLouT9XHU1DbsVretz3HB4cYAvSUZvRmhwz
         sFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4hMk+P1MlbSh75BOVVRYoR3rySDueCdmuE3rafGPTI=;
        b=tNzBcVy6AxfrrZanRcgcKTbwsZ594uckXygGN8BU19l/WTwFCkKNffeCd5glxiEvVL
         9TqMPzTKEFBo43wEUhwvjVVMysw9yoTlM28QTo5WKetMQDwwAdRfJOh1ujtPJ8bELw/R
         cRjhaoMOBJCXFvZXPi5gn0vooo8WTFx2oXWWzqDViwPjZ/PiXrUDUx4pgTi9d2aW/EsW
         b1PGLl5jODybASqpO2xSnEbHsyyzyJiJ4JjXbAJSuDlGD7gjEyO6sOGSx3atVbchZUY+
         m8Xtm/JmqGfGy/CfYsj64Llnzb7hags25iKkkGvkZhdXSRDk3Ri0AazE6x2a952XYRGP
         0UBw==
X-Gm-Message-State: AOAM533Nioj6DdaZSLujO94STsWLfv7W9e77x3/3IMCtad1kf1WzjSvG
	+O0WqTSy3tUdTjE8dsB1zrNO9dYF2i4PWQ==
X-Google-Smtp-Source: ABdhPJxKoDmDkxeSIeHw0copVeWISLrbUQWfMnOSvb05GB46UDVZUyG/GQJMwdfETsG0nyXhMC7JLg==
X-Received: by 2002:a37:84c3:: with SMTP id g186mr30092715qkd.276.1628631394410;
        Tue, 10 Aug 2021 14:36:34 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:3d70:ad83:63ae:3283])
        by smtp.gmail.com with ESMTPSA id o25sm6863633qkj.113.2021.08.10.14.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 14:36:34 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] tune-cortexm*: add support for all Arm Cortex-M processors
Date: Tue, 10 Aug 2021 17:36:33 -0400
Message-Id: <20210810213633.17187-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tune entries for all Arm Cortex-M processors currently supported in
GCC (that are not currently present).  The ARMv7 entries were added in
conf/machine/include/ to match the existing Cortex-M and Cortex-A tune
files.  The ARMv8 entries were added to conf/machine/include/arm/armv8-m
to match how ARMv8 was done for Cortex-A processor tune files.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 .../conf/machine/include/arm/arch-armv7em.inc | 17 +++++++++
 meta/conf/machine/include/arm/arch-armv7m.inc | 17 +++++++++
 .../include/arm/arch-armv8-1m-main.inc        | 18 ++++++++++
 .../machine/include/arm/arch-armv8m-base.inc  | 17 +++++++++
 .../machine/include/arm/arch-armv8m-main.inc  | 36 +++++++++++++++++++
 .../include/arm/armv8-1m/tune-cortexm55.inc   | 14 ++++++++
 .../include/arm/armv8-m/tune-cortexm23.inc    | 14 ++++++++
 .../include/arm/armv8-m/tune-cortexm33.inc    | 17 +++++++++
 .../include/arm/armv8-m/tune-cortexm35p.inc   | 17 +++++++++
 meta/conf/machine/include/tune-cortexm1.inc   | 14 ++++++++
 meta/conf/machine/include/tune-cortexm3.inc   | 14 ++++++++
 meta/conf/machine/include/tune-cortexm4.inc   | 14 ++++++++
 meta/conf/machine/include/tune-cortexm7.inc   | 14 ++++++++
 13 files changed, 223 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv7em.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv7m.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8-1m-main.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8m-base.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv8m-main.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
 create mode 100644 meta/conf/machine/include/tune-cortexm1.inc
 create mode 100644 meta/conf/machine/include/tune-cortexm3.inc
 create mode 100644 meta/conf/machine/include/tune-cortexm4.inc
 create mode 100644 meta/conf/machine/include/tune-cortexm7.inc

diff --git a/meta/conf/machine/include/arm/arch-armv7em.inc b/meta/conf/machine/include/arm/arch-armv7em.inc
new file mode 100644
index 000000000000..adcab272edab
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv7em.inc
@@ -0,0 +1,17 @@
+#
+# Defaults for ARMv7e-m
+#
+DEFAULTTUNE ?= "armv7em"
+
+TUNEVALID[armv7em] = "Enable instructions for ARMv7e-m"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7em', ' -march=armv7e-m', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7em', 'armv7em:', '', d)}"
+
+TUNECONFLICTS[armv7em] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv7m.inc
+
+AVAILTUNES                            += "armv7em"
+ARMPKGARCH:tune-armv7em                = "armv7em"
+TUNE_FEATURES:tune-armv7em             = "armv7em"
+PACKAGE_EXTRA_ARCHS:tune-armv7em       = "armv7em"
diff --git a/meta/conf/machine/include/arm/arch-armv7m.inc b/meta/conf/machine/include/arm/arch-armv7m.inc
new file mode 100644
index 000000000000..a36c265bc123
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv7m.inc
@@ -0,0 +1,17 @@
+#
+# Defaults for ARMv7-m
+#
+DEFAULTTUNE ?= "armv7m"
+
+TUNEVALID[armv7m] = "Enable instructions for ARMv7-m"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', ' -march=armv7-m', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 'armv7m:', '', d)}"
+
+TUNECONFLICTS[armv7m] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv6m.inc
+
+AVAILTUNES                            += "armv7m"
+ARMPKGARCH:tune-armv7m                 = "armv7m"
+TUNE_FEATURES:tune-armv7m              = "armv7m"
+PACKAGE_EXTRA_ARCHS:tune-armv7m        = "armv7m"
diff --git a/meta/conf/machine/include/arm/arch-armv8-1m-main.inc b/meta/conf/machine/include/arm/arch-armv8-1m-main.inc
new file mode 100644
index 000000000000..9171b31c9001
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8-1m-main.inc
@@ -0,0 +1,18 @@
+#
+#
+# Defaults for ARMv8.1-M.main
+#
+DEFAULTTUNE ?= "armv8-1m-main"
+
+TUNEVALID[armv8-1m-main] = "Enable instructions for ARMv8.1-m.main"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1m-main', ' -march=armv8.1-m.main', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1m-main', 'armv8-1m-main:', '', d)}"
+
+TUNECONFLICTS[armv8-1m-main] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv8m-main.inc
+
+AVAILTUNES                            += "armv8-1m-main"
+ARMPKGARCH:tune-armv8-1m-main          = "armv8-1m-main"
+TUNE_FEATURES:tune-armv8-1m-main       = "armv8-1m-main"
+PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main = "armv8-1m-main"
diff --git a/meta/conf/machine/include/arm/arch-armv8m-base.inc b/meta/conf/machine/include/arm/arch-armv8m-base.inc
new file mode 100644
index 000000000000..d9a341c66e13
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8m-base.inc
@@ -0,0 +1,17 @@
+#
+# Defaults for ARMv8-m.base
+#
+DEFAULTTUNE ?= "armv8m-base"
+
+TUNEVALID[armv8m-base] = "Enable instructions for ARMv8-m.base"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-base', ' -march=armv8-m.base', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-base', 'armv8m-base:', '', d)}"
+
+TUNECONFLICTS[armv8m-base] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv7m.inc
+
+AVAILTUNES                          += "armv8m-base"
+ARMPKGARCH:tune-armv8m-base          = "armv8m-base"
+TUNE_FEATURES:tune-armv8m-base       = "armv8m-base"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-base = "armv8m-base"
diff --git a/meta/conf/machine/include/arm/arch-armv8m-main.inc b/meta/conf/machine/include/arm/arch-armv8m-main.inc
new file mode 100644
index 000000000000..27f552b2d726
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8m-main.inc
@@ -0,0 +1,36 @@
+#
+# Defaults for ARMv8-m.main
+#
+DEFAULTTUNE ?= "armv8m-main"
+
+require conf/machine/include/arm/arch-armv8m-base.inc
+
+TUNEVALID[armv8m-main] = "Enable instructions for ARMv8-m.main"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', ' -march=armv8-m.main${MARCH_DSP}${MARCH_FPU}', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', 'armv8m-main:', '', d)}"
+
+TUNECONFLICTS[armv8m-main] = "armv4 armv5 armv6 armv7a"
+
+# FIXME - below taken from meta/conf/machine/include/arm/arch-armv5-dsp.inc and should be put into something more generic
+TUNEVALID[dsp] = "ARM DSP functionality"
+ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], 'e', '', d)}"
+MARCH_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], '+dsp', '+nodsp', d)}"
+
+# FIXME - Below belongs in meta/conf/machine/include/arm/feature-arm-neon.inc
+TUNEVALID[vfpv5spd16] = "Enable Vector Floating Point Version 5, Single Precision. with 16 registers (fpv5-sp-d16) unit."
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv5spd16', 'fpv5-sp-d16', '', d)}"
+MARCH_FPU = "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv5spd16' ], '+fp', '+nofp', d)}"
+
+AVAILTUNES                                      += "armv8m-main armv8m-mainearmv8m-main-vfpv5spd16 armv8m-maine-vfpv5spd16"
+ARMPKGARCH:tune-armv8m-main                      = "armv8m-main"
+ARMPKGARCH:tune-armv8m-maine                     = "armv8m-main"
+ARMPKGARCH:tune-armv8m-main-vfpv5spd16           = "armv8m-main"
+ARMPKGARCH:tune-armv8m-maine-vfpv5spd16          = "armv8m-main"
+TUNE_FEATURES:tune-armv8m-main                   = "armv8m-main"
+TUNE_FEATURES:tune-armv8m-maine                  = "${TUNE_FEATURES:tune-armv8m-main} dsp"
+TUNE_FEATURES:tune-armv8m-main-vfpv5spd16        = "${TUNE_FEATURES:tune-armv8m-main} vfpv5spd16"
+TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16       = "${TUNE_FEATURES:tune-armv8m-main-vfpv5spd16} dsp"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-main             = "armv8m-main"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-maine            = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-main-vfpv5spd16  = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-main-fpv5-spd16"
+PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16 = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine-fpv5-spd16"
diff --git a/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc b/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
new file mode 100644
index 000000000000..493ad67b21d0
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-M55
+#
+DEFAULTTUNE ?= "cortexm55"
+
+TUNEVALID[cortexm55] = "Enable Cortex-M55 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm55', ' -mcpu=cortex-m55', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-1m-main.inc
+
+AVAILTUNES                            += "cortexm55"
+ARMPKGARCH:tune-cortexm55              = "cortexm55"
+TUNE_FEATURES:tune-cortexm55           = "${TUNE_FEATURES:tune-armv8-1m-main} cortexm55"
+PACKAGE_EXTRA_ARCHS:tune-cortexm55     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main} cortexm55"
diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
new file mode 100644
index 000000000000..25780bc08026
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-M23
+#
+DEFAULTTUNE ?= "cortexm23"
+
+TUNEVALID[cortexm23] = "Enable Cortex-M23 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm23', ' -mcpu=cortex-m23', '', d)}"
+
+require conf/machine/include/arm/arch-armv8m-base.inc
+
+AVAILTUNES                          += "cortexm23"
+ARMPKGARCH:tune-cortexm23            = "cortexm23"
+TUNE_FEATURES:tune-cortexm23         = "${TUNE_FEATURES:tune-armv8m-base} cortexm23"
+PACKAGE_EXTRA_ARCHS:tune-cortexm23   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-base} cortexm23"
diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
new file mode 100644
index 000000000000..04d1fe2bde80
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
@@ -0,0 +1,17 @@
+#
+# Tune Settings for Cortex-M33
+#
+DEFAULTTUNE ?= "cortexm33"
+
+TUNEVALID[cortexm33] = "Enable Cortex-M33 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm33', ' -mcpu=cortex-m33', '', d)}"
+
+require conf/machine/include/arm/arch-armv8m-main.inc
+
+# GCC thnks that DSP and VFP are required, but Arm docs say it is
+# optional.  So forcing below so that compiling works, but this should
+# be fixed in GCC
+AVAILTUNES                          += "cortexm33"
+ARMPKGARCH:tune-cortexm33            = "cortexm33"
+TUNE_FEATURES:tune-cortexm33         = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm33"
+PACKAGE_EXTRA_ARCHS:tune-cortexm33   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16"
diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
new file mode 100644
index 000000000000..60e978facdce
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
@@ -0,0 +1,17 @@
+#
+# Tune Settings for Cortex-M35P
+#
+DEFAULTTUNE ?= "cortexm35p"
+
+TUNEVALID[cortexm35p] = "Enable Cortex-M35p specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm35p', ' -mcpu=cortex-m35p', '', d)}"
+
+require conf/machine/include/arm/arch-armv8m-main.inc
+
+# GCC thnks that DSP and VFP are required, but Arm docs say it is
+# optional.  So forcing below so that compiling works, but this should
+# be fixed in GCC
+AVAILTUNES                          += "cortexm35p"
+ARMPKGARCH:tune-cortexm35p           = "cortexm35p"
+TUNE_FEATURES:tune-cortexm35p        = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm35p"
+PACKAGE_EXTRA_ARCHS:tune-cortexm35p  = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16"
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
new file mode 100644
index 000000000000..16661f3a26d0
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-M1
+#
+DEFAULTTUNE ?= "cortexm1"
+
+TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mcpu=cortex-m1', '', d)}"
+
+require conf/machine/include/arm/arch-armv6m.inc
+
+AVAILTUNES                            += "cortexm1"
+ARMPKGARCH:tune-cortexm1               = "cortexm1"
+TUNE_FEATURES:tune-cortexm1            = "${TUNE_FEATURES:tune-armv6m} cortexm1"
+PACKAGE_EXTRA_ARCHS:tune-cortexm1      = "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm1"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
new file mode 100644
index 000000000000..a6cb566387a8
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-M3
+#
+DEFAULTTUNE ?= "cortexm3"
+
+TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex-m3', '', d)}"
+
+require conf/machine/include/arm/arch-armv7m.inc
+
+AVAILTUNES                            += "cortexm3"
+ARMPKGARCH:tune-cortexm3               = "cortexm3"
+TUNE_FEATURES:tune-cortexm3            = "${TUNE_FEATURES:tune-armv7m} cortexm3"
+PACKAGE_EXTRA_ARCHS:tune-cortexm3      = "${PACKAGE_EXTRA_ARCHS:tune-armv7m} cortexm3"
diff --git a/meta/conf/machine/include/tune-cortexm4.inc b/meta/conf/machine/include/tune-cortexm4.inc
new file mode 100644
index 000000000000..e86622ff3da0
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexm4.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-M4
+#
+DEFAULTTUNE ?= "cortexm4"
+
+TUNEVALID[cortexm4] = "Enable Cortex-M4 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm4', ' -mcpu=cortex-m4', '', d)}"
+
+require conf/machine/include/arm/arch-armv7em.inc
+
+AVAILTUNES                            += "cortexm4"
+ARMPKGARCH:tune-cortexm4               = "cortexm4"
+TUNE_FEATURES:tune-cortexm4            = "${TUNE_FEATURES:tune-armv7em} cortexm4"
+PACKAGE_EXTRA_ARCHS:tune-cortexm4      = "${PACKAGE_EXTRA_ARCHS:tune-armv7em} cortexm4"
diff --git a/meta/conf/machine/include/tune-cortexm7.inc b/meta/conf/machine/include/tune-cortexm7.inc
new file mode 100644
index 000000000000..6434ec63983d
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexm7.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-M7
+#
+DEFAULTTUNE ?= "cortexm7"
+
+TUNEVALID[cortexm7] = "Enable Cortex-M7 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm7', ' -mcpu=cortex-m7', '', d)}"
+
+require conf/machine/include/arm/arch-armv7em.inc
+
+AVAILTUNES                            += "cortexm7"
+ARMPKGARCH:tune-cortexm7               = "cortexm7"
+TUNE_FEATURES:tune-cortexm7            = "${TUNE_FEATURES:tune-armv7em} cortexm7"
+PACKAGE_EXTRA_ARCHS:tune-cortexm7      = "${PACKAGE_EXTRA_ARCHS:tune-armv7em} cortexm7"
-- 
2.20.1

