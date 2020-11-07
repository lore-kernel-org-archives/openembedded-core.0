Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.10406.1604787841661568342
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 14:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uuuJPB9B;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id g11so2650980pll.13
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 14:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rUaixJj/J9Zp5azTujgKFfMSjp3pE7vj5GBWOD9kMjo=;
        b=uuuJPB9BYYVndgpbBv3p5Lt+P9jOgGFf5ElmhtwRG9zome87ggIySzGlET/mZzkbMY
         JIGsYXOR7l1QVdjWJbZ9So3mTM8NQL2wP4LvN0SCRNRQwUfGBM+RvO1/QAxVPOlbAy82
         s/MCNeQfwSRJA9lCRFadIL+At1cyaCbbscot45seotgBCYzc6uvA4HaGhh7VdcT7EK4s
         MG3sQi+r4EqGLngLPWFW3EuU8FZkj+z4k4L8lZr2GWwhTtBB40k0ZlyKwdG5IuBozTJC
         UsLtKcLBlGcOUqlPTU7TKM2wJwzrp+nFd/s+nRWMuv/2/Y5vQEWs/sui75KhLgKHxibk
         LIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rUaixJj/J9Zp5azTujgKFfMSjp3pE7vj5GBWOD9kMjo=;
        b=diXxLEFBG30snMpYCZA/AOjzrweX2qaBG5a4CgI6mJxXzvZJGegi+g+DaEp/ndhgim
         1HzOaHLf2nqNSZ4O4Qn6AEgVHJx4hWPhIeDbvjQuMNGqGz5HaiHdtFDOumf9bqxhK8bD
         XgYFBfFSLY5My3ZnUSDfzvpudiSCmwMTxXAK+3D143Nl0byaoARppjuMPTF+lravfiWU
         gelAxpuW50cXznF68oIJrsGY+NmP/kl5xEWGIvEgEGQV0nfeFMWFi21PG6u4l/+s1R04
         caM1tnvPAGdtVaotCmT1N0ywZzMnIKwLZ7VXXzceaY8SD6cNF/xRonckQ2qxmup3UzMs
         NgoQ==
X-Gm-Message-State: AOAM533iKv+fJ0Ok2UHz5cp3wiRW0omoG+RH/vuQsQNVAd7a4V6he3wb
	1vNSymSa4IoIycK2fsuYrmbkekKC+788ew==
X-Google-Smtp-Source: ABdhPJxRGTNnfJQvsCAS5b08XBdZd4BKdt6eye0rUVCSVgHzYiTgNvRJTL0C2HzRep6Ho9GIXNkhIQ==
X-Received: by 2002:a17:90a:d244:: with SMTP id o4mr5806106pjw.183.1604787840844;
        Sat, 07 Nov 2020 14:24:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id s18sm6900725pfc.5.2020.11.07.14.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 14:24:00 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 1/4] lto: Add global LTO distro policy file
Date: Sat,  7 Nov 2020 14:23:54 -0800
Message-Id: <20201107222357.43102-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Distros which want to enable LTO can utilize this file, it only covers
packages from OE-Core, other layers should include there own exclusion
list for recipe which dont work with LTO

Document the needed changes in local.conf.extended

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Include feeedback for adding DISTRO_FEATURE knob
v3: Drop unused PACKAGE_DEBUG_SPLIT_STYLE settings
v4: No change

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

