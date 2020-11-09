Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.4530.1604880142101771492
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eJMGcFVd;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id h6so5330134pgk.4
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2vQhRrJZiHEqk04jobms8Ipc52TqCysWURD0Fcop8K8=;
        b=eJMGcFVdDuTSIqurCHhRlj7zLvNqJbBcNA6g5w+A1/u+f+HL1xVChATazOoKfBKfFj
         2u8Kuvvhuq1kI0/fKLobbcW1FvCTpG0HwVPqwD5EJ6/NV8YIG2DEaGj88phAw8cfYYAl
         LfWiFieUaJ2JVHZIn8yM8vtH4uEcknQz0Ddmh7aqWZS767IeEPgrxNSU/s0twomr/6LF
         BDw38e96eSw8SaGXzxkRGUs4pInpBMxlKXevuueVET9EIZmG2tAZm8DSCil1yIt2ID2v
         K9H4ZnC8FcgWwvEm2z0SYVBl7zeikGl8jXhF7ZCqpzjiPyUx2+AWfvGVFT3LvuINnxFn
         eypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2vQhRrJZiHEqk04jobms8Ipc52TqCysWURD0Fcop8K8=;
        b=hbLwR595xIb+W91lErHrpW/jdWcgGJ1xWeC3x97U6LoMI5/JR9ZtaewW+KQzQg29mf
         M0n33QGSC3kiSJaUIgpFuTKT51ZFtM6zZwHPzp4NOwMBNCsAhS+umoojMm3Sc2ZeLXMj
         CpHHXwnGw1bs6h5zYI9SyrP3GvvbIuA8w5d4BrGrOhicALVy5LJcN4KlbhGQCwXqr3GF
         GhNMDUME8YxFh3vKq6tyAs+sFbV8sukw5nMc3SFfdlE+28yrStndYdKbjy4zTErVV7IX
         +3AOonvaNr6geUdmthFFDWVg4Z9S3KpSkbAplPzTQSJB7++ELjDVlTJwhU12uTEYIPRh
         pMyw==
X-Gm-Message-State: AOAM5327uKBssBPEORUwpgmepWQwnYAqYCzPzcBmaNc6SRllMafmsqFY
	eABsNnPPyFSKmiFyuz5Bv/iLeLpY2VRg+w==
X-Google-Smtp-Source: ABdhPJy1rgI3fBQkXbvSOsKcq1HfIo0OB9D6jftL651ybmWoJdrYZhK+FN+2JerDcBTLbPEoPkwHFg==
X-Received: by 2002:aa7:92c3:0:b029:163:d2d6:8db1 with SMTP id k3-20020aa792c30000b0290163d2d68db1mr11621243pfa.17.1604880141191;
        Sun, 08 Nov 2020 16:02:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:20 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 01/11] lto: Add global LTO distro policy file
Date: Sun,  8 Nov 2020 16:02:07 -0800
Message-Id: <20201109000217.3008448-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Distros which want to enable LTO can utilize this file, it only covers
packages from OE-Core, other layers should include there own exclusion
list for recipe which dont work with LTO

Document the needed changes in local.conf.extended

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc     | 28 ++++++++++++++++++++++++++++
 meta/conf/local.conf.sample.extended |  4 ++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/conf/distro/include/lto.inc

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
new file mode 100644
index 0000000000..fe0f6c9f44
--- /dev/null
+++ b/meta/conf/distro/include/lto.inc
@@ -0,0 +1,28 @@
+# To enable LTO, add following in local.conf
+# require conf/distro/include/lto.inc
+# DISTRO_FEATURES_append = " lto"
+#
+
+# Disable LTO for following packages
+LTO_pn-glibc = ""
+LTO_pn-gcc-runtime = ""
+LTO_pn-libgcc-initial = ""
+LTO_pn-libgcc = ""
+LTO_pn-libpam = ""
+LTO_pn-elfutils = ""
+LTO_pn-perl = ""
+LTO_pn-busybox = ""
+LTO_pn-libxcrypt = ""
+LTO_pn-curl = ""
+LTO_pn-libcap = ""
+LTO_pn-libproxy = ""
+LTO_pn-libbsd = ""
+
+# Override it for additional or different options if needed e.g.
+# with clang thin-lto might be better for compile speed
+LTO ?= "-flto"
+
+SELECTED_OPTIMIZATION_append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
+TARGET_LDFLAGS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
+
+SELECTED_OPTIMIZATION[vardeps] += "LTO"
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 9aa226a2d0..2c4b8ad8cb 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -417,3 +417,7 @@
 # ERR_REPORT_UPLOAD_ALL = "1"
 #
 # INHERIT += "report-error"
+
+# Enable LTO Distro-wide
+# require conf/distro/include/lto.inc
+# DISTRO_FEATURES_append = " lto"
-- 
2.29.2

