Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.83.1596688937999219597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 21:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GgT63Jkx;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 128so2475921pgd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 21:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72/tNsfOGGn+KI7kYzxiqiXqWL/P5r74fnaz4+GdIP8=;
        b=GgT63JkxyR8+WW2VKDtJ0x6st3PRhsM+skUjSdi69aEkTzXCFsEigJWAriDui0WusC
         w1AZi4VMOZA6tgBtI311zS2so9C5KQR0R+CiCNJqkd5jIOGVlRCMooH/LaFFOVjc9TeE
         9AlwGfSXgZRNX0c3Xru5AAOPCoW4yuZjiNYYAf61SSOsr2+E/bfaMHNDgO/XEU9nqGDC
         TTLKm0Kro/pHVS0DU9aHadnVVa2RF5zqTSiSehOP+xOVfaY80tedYuo2yNA3nvmvy+Zj
         Ic4SLLwvjSRMLU5fd3qkdd5sVJuzGN0MtIJ2hj15Zl6dV9aU258a2gArdrpeFMcoZiRc
         UQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72/tNsfOGGn+KI7kYzxiqiXqWL/P5r74fnaz4+GdIP8=;
        b=VK4xz3OF8l8ElOdbkWnFYTB/d4XzkIth2DZ1P/wu11/j0YTjPPYU47AMJT8h3px1mF
         ecoppkpHvXsQMfwV7Vnqr4AhJyrUE+WkG+aISuWvHrUi1fdNsv4vitjU2e6lLb88AKqJ
         cvIdkuTrbglnTLgtbW7/KhSAJFT0z+KV+WMgs8CvZzgOMZ7DrvQdBIuLCi3+qxGXxiLj
         lCA8K2ZqAsDLT5XkQnrdsymFDqhiIoXd14+zxa6+HTgvCeXHW3seh4hOEhSQjONWG7S9
         paSw1kOv4CGrtR+PjSCpzuStqC47eD+peRdhyeqGdRzYI51yNjqwUlXfq3xGrli+k5ip
         3CYg==
X-Gm-Message-State: AOAM531k5FhlmZ9j/L/2IktqoqLz1tXUsit8vy0w3lDu/lxUvH0X7y/W
	1ySdPnXiMZ3ooUd1b+glqVptTv75Qwk=
X-Google-Smtp-Source: ABdhPJzgFldgJo3MYQDYSQEnw3FceuGYzO2vw8ceScg9G6FiZI1rIin8mKHkCRqL1dV6O9xMb3TUBw==
X-Received: by 2002:a63:6fc3:: with SMTP id k186mr5973906pgc.109.1596688937143;
        Wed, 05 Aug 2020 21:42:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id c132sm6240282pfb.112.2020.08.05.21.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 21:42:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2] xf86-video-intel: Fix build with -fno-common
Date: Wed,  5 Aug 2020 21:41:54 -0700
Message-Id: <20200806044154.1852982-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use the backported patch

 ...plicate-definition-of-I810PatternROP.patch | 27 +++++++++++++++++++
 .../xorg-driver/xf86-video-intel_git.bb       |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch
new file mode 100644
index 0000000000..765d9ec090
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch
@@ -0,0 +1,27 @@
+From c2d730cf79eb3e4bea41f5ed8a8a21092ced8b03 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Hanno=20B=C3=B6ck?= <hanno@gentoo.org>
+Date: Sun, 2 Feb 2020 14:18:39 +0100
+Subject: [PATCH] i810: Avoid duplicate definition of I810PatternROP
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/driver/xf86-video-intel/-/commit/652d93cbbdc159c0883f1b626ea48e28bac63ae3]
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/legacy/i810/i810.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/legacy/i810/i810.h b/src/legacy/i810/i810.h
+index 347188c9..19be049c 100644
+--- a/src/legacy/i810/i810.h
++++ b/src/legacy/i810/i810.h
+@@ -322,6 +322,6 @@ extern void I810InitMC(ScreenPtr pScreen);
+ extern const OptionInfoRec *I810AvailableOptions(int chipid, int busid);
+ 
+ extern const int I810CopyROP[16];
+-const int I810PatternROP[16];
++extern const int I810PatternROP[16];
+ 
+ #endif /* _I810_H_ */
+-- 
+2.28.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 7ab2236237..161371b118 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -15,6 +15,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
            file://0001-Sync-i915_pciids-upto-8717c6b7414f.patch \
+           file://0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.28.0

