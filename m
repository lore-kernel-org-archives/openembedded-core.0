Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.3022.1596654503101548114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 12:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WSn4DVkx;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z20so5165238plo.6
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 12:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cyyL4x30PEz9MVvYODYjuy/OdbqmpslnhWqXAmHDIoI=;
        b=WSn4DVkxwcNorOWDY+5GkK0udCQHz91mQYUAcQeQRZ65+RzVvpO0i3qj4oeAqLgPxL
         DG7OEBZh1e61Ie7WhQ29p/iLVppNfxsIcntTKGSYHd1LcLKyOEoP0YUFjO0yzTlVDowD
         x1LbMbX/fnhi6iAWRVo6o45ksZVO/6c+6u5HQ09j5J13j4g9hvPnFjPr7LGeptftmZsq
         sq4RJe/9KQUyzYC3fGrpsh5fxMuQuvZIzJliG9tOr8bI9e331hZH7GOXMYurH1Qyst84
         33dOfzcC+81HbvahjPIO1kDa2nr22RxV/qbWExYsbvdWEfkOtzQa/ybsE0la2BnpVPjU
         KG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cyyL4x30PEz9MVvYODYjuy/OdbqmpslnhWqXAmHDIoI=;
        b=AQa7AJACXgPC1Gp3mMuCUgz4Dgqqyxpad6DX0T+Tr4T2A29gJYhdRwMWZP3TNjxqxb
         9VG3zj8o1nVyJB8exJQl4972EBLj/oAGsW4RYr50LCg7E9OlkClwQxKriTUMvLLzVfcW
         jX179oXCuyLfgDNt7w43cNAgjuBIwQ74itJ9KVvjN3wPvjhIdEn4SImpqgIeHznMJrDs
         vv3lp0BNXxgU9UKRRoH/XeapOYorEM94ZQ77Uy6tpKR4W4HsuqZQioQUtJaFy3NSc1O2
         mVaX44ep4U5ZOvLwEymbRfEfNfpFA1IRYf9xrefb6N9Z5vApUpmYFv3acFr0q7hhpYp4
         mLcQ==
X-Gm-Message-State: AOAM531cMjL3jQtvZyGOdtyiqGh6qy3npDaymPDnpWIGtTevtFDoRquV
	wiAVTW/NajNeo5285VV36x6JxuCoudU=
X-Google-Smtp-Source: ABdhPJxBBOj3uQSpnjp1WslNJbqq0ArxX6ik2pPt4GD7ikO5lcTo+Bfr768lt/7YlSFqUesJaZX0lw==
X-Received: by 2002:a17:90a:3268:: with SMTP id k95mr4744117pjb.153.1596654502033;
        Wed, 05 Aug 2020 12:08:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id b13sm4243790pjl.7.2020.08.05.12.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 12:08:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] xf86-video-intel: Fix build with -fno-common
Date: Wed,  5 Aug 2020 12:08:18 -0700
Message-Id: <20200805190819.935438-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-i810-Make-I810PatternROP-extern.patch | 29 +++++++++++++++++++
 .../xorg-driver/xf86-video-intel_git.bb       |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Make-I810PatternROP-extern.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Make-I810PatternROP-extern.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Make-I810PatternROP-extern.patch
new file mode 100644
index 0000000000..610efd65d9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-i810-Make-I810PatternROP-extern.patch
@@ -0,0 +1,29 @@
+From c9a9791576025e46f4411342c0e29ffcc79869ca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Aug 2020 11:51:54 -0700
+Subject: [PATCH] i810: Make I810PatternROP extern
+
+Its also defined in i810_accel.c
+Fixes build with -fno-common
+
+Upstream-Status: Pending
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
index 7ab2236237..3c97b8c4f4 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -15,6 +15,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
            file://0001-Sync-i915_pciids-upto-8717c6b7414f.patch \
+           file://0001-i810-Make-I810PatternROP-extern.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.28.0

