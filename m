Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.10722.1604788317839656661
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 14:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rsus179R;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id m26so355067pgd.9
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 14:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BGqIWij+r3mRe6ddsm29c3baa8vtzy+Hu05CbD4f9i0=;
        b=rsus179R7K164PyZhyXulSwDHzFUwlHis7seZwvWMR0it4X5/IEK4Ru0k7IMoDBFZv
         mwS01LNpMb+NdD4AmlWCwKyfl3+gVMOf3mANAFOF7RgmTJ/DyYosvFMDjk6qYOQAXGXg
         PJbEjXVF/Qr+JP7/bYhiJMrn9cA631q0aOtkLd/5136dumArilsaTFu4rQl7EK7u4Ksh
         JIDjwD+1+YCxNSBoSZdD75kebOoM16X8hbAWQ82i8rgk6OOayeRWdtIBc66uhfqvQgLv
         oBww6CSJmtd/eJYLOsPTZf3YJ5PKdInA9P0wtUMIFDODrFfijP7kxpC0rkzYZWKIxRhu
         tzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BGqIWij+r3mRe6ddsm29c3baa8vtzy+Hu05CbD4f9i0=;
        b=H/QM1et+wwD8d4sFxIMZA5Cae8W8USwfXpdcIJdchiVIvwJTr1UywBhTlHDPWjsNrb
         vvLpyrWzc5O5X1y0hTuqIY+JUC3kNH9u7Pme1SQmuTaCX8t2+OVZb+plrdPugipnjH17
         LyO/MrddsGd/jwJ/LntrliWoxBwMw3juOJuLwh0FxTKg87FXItKmI8lbosPjCHOytyLf
         C61DW2brxkXAM68ZPYJtQ3G4U1brihYgtBrBpv/1c/lsBjbyDeQQKk7Oq+yGnLHAMkpQ
         kw9Qmirqw3dheVkZvstsnUk+b48Xmeis5Jv09+8Lf6Lhg9czApvAi/WHFlIB2sM1jeYs
         SUDA==
X-Gm-Message-State: AOAM533PENXL4nTQ2BqEofKtU6C2hZIGSdbmbITwKLxuQ9tJqxLGpjqw
	VfE8fr5pucJfRZQbRG6ywxTqYix8AEJcVw==
X-Google-Smtp-Source: ABdhPJyeWJBcQRddN5rBM76TLAG4Kt/v8pobboORN1zL72nk0K9zdmBGkdDRtrMjVQNkkItMKmadNw==
X-Received: by 2002:a63:f14:: with SMTP id e20mr7458033pgl.52.1604788317182;
        Sat, 07 Nov 2020 14:31:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id l22sm6644150pff.27.2020.11.07.14.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 14:31:56 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5] lto: Introduce LTOEXTRA variable
Date: Sat,  7 Nov 2020 14:31:52 -0800
Message-Id: <20201107223152.427811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain packages may need additional flags to enable LTO, therefore
LTOEXTRA can be used to pass those flags

Add -flto-partition=none for alsa-lib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v5: Fix typo s/alsa-libs/alsa-lib

 meta/conf/distro/include/lto.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index d7fea26c64..eb36b892ca 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -18,6 +18,13 @@ LTO_pn-libcap = ""
 LTO_pn-libproxy = ""
 LTO_pn-libbsd = ""
 
+# Custom LTO flags
+# disable partitioning/streaming algorithm since its uses ASM
+# constructs not compatible with lto
+LTOEXTRA_pn-alsa-lib = "-flto-partition=none"
+
+LTOEXTRA ?= ""
+
 # Override it for additional or different options if needed e.g.
 # with clang thin-lto might be better for compile speed
 #
@@ -29,9 +36,9 @@ LTO_pn-libbsd = ""
 # -fuse-linker-plugin
 # ensures that libraries participate in LTO by supplying intermediate
 # code from .a files to linker
-LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin "
+LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin ${LTOEXTRA}"
 
 SELECTED_OPTIMIZATION_append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 TARGET_LDFLAGS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 
-SELECTED_OPTIMIZATION[vardeps] += "LTO"
+SELECTED_OPTIMIZATION[vardeps] += "LTO LTOEXTRA"
-- 
2.29.2

