Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.28973.1612151055193739757
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 19:44:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yf+eqroz;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id a16so345551wmm.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 19:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KD7pA0m6Ujb4kXG2+2u5p5Z+0wB3SKOgmP7dxRDVYsw=;
        b=Yf+eqrozAb7xueTNhFn02hOLuzlzqgH5eM0U455U2mdU3R/AsWiVdvLBKFRshkg28z
         70ZirBzdpRF8y/ncdhNOZxEupsvFK/4h/ZrdtZAgomle40HbvxxSpn8eFrCKE4SPCbXx
         B+aMVtRGvR2Fa4TQ/T3oUBGiAY4j3KdtadBLWfsdLl+rP3El32vMqN7SFgwQvRpbGXEp
         LQwyH3veV0ZPimiXdvqBZWd3WzxUnBuhnpRFg+xTgXyEsvuEw/WqR8W0CMN3QltppDS0
         p3fEVJ0MpRAD83dv1w+lqc5ua6DtKGWLUq3Uacv/uVVytz5ITlZozXn7qlAAK9hic7O+
         qznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KD7pA0m6Ujb4kXG2+2u5p5Z+0wB3SKOgmP7dxRDVYsw=;
        b=DWr/hnQYX+9sD/BsD/H+xKIGVECtcvJy2oMidZu8Tpc11mKNVXgjQ/C3RN+V0XfFQr
         /d+JAU7CISukaz7tQ/wuLYRrIhNzPu4LoLaavBJLTCCmpgRvFEZhQaG5w6PVFC6/J60z
         tLF2FrVHcLDzP3ypRa9U2bnnDYhRMcsiIwh23KA5PvE28NJy4Qe/0XHb5GMFDk6ElaaL
         Y8I7BvADu6keY35UP0T5H6A8Yu810jBgUBWsbTCX++iMZMAyhB/tfee3Ebjc32Gx4KvE
         564ioHrAqa3p0FU3xiaeC1nuCVdgc7q/j6fGDjRiNi4Ajn1zYW/+p4Zmi7kU9rtbgZ1O
         FUFA==
X-Gm-Message-State: AOAM5308c4sCanhMFZLlL7iSTHm9FYyAZ52J96ZJwu0ZKB+BXxqZJRp1
	i5pEdoCKd4ByfBt3d0SYWDpyXIywio25MA==
X-Google-Smtp-Source: ABdhPJxv5wAYPOabcgpyFxYqkZJk9lgyE9ygEspJW5mGzBbMKE7NUCUDeu9CyWn9vmjmSLwBuGYzDg==
X-Received: by 2002:a1c:2c0b:: with SMTP id s11mr12593757wms.13.1612151053503;
        Sun, 31 Jan 2021 19:44:13 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.33.13])
        by smtp.gmail.com with ESMTPSA id p18sm19092608wmc.31.2021.01.31.19.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 19:44:13 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH] oe-pkgdata-util: Check if environment script is initialized
Date: Sun, 31 Jan 2021 22:43:44 -0500
Message-Id: <20210201034344.5661-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Tinfoil doesn't behave well if environment is not initialised, this check ensures a proper error log if environment is not initialzed.

[YOCTO #12096]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 scripts/oe-pkgdata-util | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 93220e3617..169908638d 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -513,6 +513,11 @@ def find_path(args):
 
 
 def main():
+
+    if not os.environ.get('BUILDDIR', ''):
+        logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
+        sys.exit(1)
+
     parser = argparse_oe.ArgumentParser(description="OpenEmbedded pkgdata tool - queries the pkgdata files written out during do_package",
                                         epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
-- 
2.17.1

