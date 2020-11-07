Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.7741.1604774486777182451
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 10:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NgMBWIBt;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id q5so1533602pfk.6
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 10:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z89pQr0FM24Mkt1bXPxb/muR5uJ084/wAJi3mRLhdHc=;
        b=NgMBWIBtD+wnKqP4TkftOS0UZZMc5Stst7Zi7aaXJYjToVct7Wlti25pX9OuEYhQ3H
         6sOsD6TuDM/2vHYPMIY1TRdejz4amSsfrHYlA8cQwZt57CQe+po2SmrhqBNVcErfn3ap
         xOrg2xEowZpd1SD6aeJPVlHpRfuXBW5j/U00/4+/ZddKDMqJ623e9Jqzbrgb03FSefb4
         6YpIkzRmYMFzF5q/BmYKqGKifh585hvQ/EDZiQG9aC8BtTQBLbpTEJuUyv9Bx/0BYxTj
         IZpSlXPwXeELRolmLF4KVcxbHGLuJAqD2bc/16TKL0tASxmk6phx+tsmNoEHvJ7NzqD4
         /KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z89pQr0FM24Mkt1bXPxb/muR5uJ084/wAJi3mRLhdHc=;
        b=c0gQhCJnWtx9kt49YoCkWBuo7u9jdwH5mIqCcZEDJdmjn+CJNZjRgiBKl73VwBLEp5
         O84d0ZqPGTKytGHxGFiICImKSZqhQlLelMuzHEnVPneKWC/SWEVOPZ9fEkpUHHP5hq4P
         5JBIF+0aPUsBjY+I5pxqiP0kbrZrQBqAf17xZy0p1Dssfkm/usZBFyJ/ondcoXfvrh/y
         CiELUzJYsc8fBeXaHjDCe4K0BG/Pdb+d4IbKJibTV0eV50eNDpiAQxjSVn5OGSV0i604
         EqYazKTIMWrTiDP4jW8l8PqnYGLXDktD7x3MDu9moMk6rUk1XqkUlYmUGUiMQ555qGIi
         aGVg==
X-Gm-Message-State: AOAM532+0FqWPv1PbaYwxmj5FXydy6xQ+stF/XYgb4yvfkLDQaBvJ85A
	bRVHIz4hVqOGuHvIKbevCr4AQHjNsHgXew==
X-Google-Smtp-Source: ABdhPJxQZ1Ig6VURDccFhNJbdqicWjYu1q0H8UFuLo0EOXu58aEi1sJ9K8/49lrQtS8N1SbIcPcHVQ==
X-Received: by 2002:a63:f242:: with SMTP id d2mr6386388pgk.44.1604774486075;
        Sat, 07 Nov 2020 10:41:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c12sm6218955pgi.14.2020.11.07.10.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 10:41:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] python3: Enable lto if its in DISTRO_FEATURES
Date: Sat,  7 Nov 2020 10:41:19 -0800
Message-Id: <20201107184119.3033956-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201107184119.3033956-1-raj.khem@gmail.com>
References: <20201107184119.3033956-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3_3.9.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.0.bb
index 6402760a1b..7080312ccf 100644
--- a/meta/recipes-devtools/python/python3_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3_3.9.0.bb
@@ -88,7 +88,7 @@ def possibly_include_pgo(d):
     
     return ''
 
-PACKAGECONFIG_class-target ??= "readline ${@possibly_include_pgo(d)} gdbm"
+PACKAGECONFIG_class-target ??= "readline ${@possibly_include_pgo(d)} gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
 PACKAGECONFIG_class-native ??= "readline gdbm"
 PACKAGECONFIG_class-nativesdk ??= "readline gdbm"
 PACKAGECONFIG[readline] = ",,readline"
@@ -96,6 +96,7 @@ PACKAGECONFIG[readline] = ",,readline"
 PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
 PACKAGECONFIG[gdbm] = ",,gdbm"
+PACKAGECONFIG[lto] = "--enable-lto,,"
 
 do_configure_prepend () {
     mkdir -p ${B}/Modules
-- 
2.29.2

