Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C64C43219
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3576.1652871537727940583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nN5C9csM;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id y7so1540909ejr.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FNhwL6HVE+DlxBDOEbkib9r3D+DDy8Md7UFbIrGg3uQ=;
        b=nN5C9csMaF33pYPXnv52R9e4q3d91XQRz0NDEX09RU0OLyW7nlR+vHvM7KTbnIB+im
         IB5r7bMWrpxNSNq6Hl6TwbdEFHjKzBQmK8r4aOgDcrIzfuQoGrltu1Wm2qpGZD2rX+te
         9D7l7MGtbs/ZDdJKyFPw05BEPjHtE5HCjUlmv4sAEyAVDksL/zXxdFrxNWkmHhX5B7DZ
         sFivOwOzrhOxRhH0S8vyeIXZFr34qikAvwTJNXqjAi/uCOTEwRk9hn0eQ9EkdnSsdXNx
         HlSzwE3ejP3Z0xfIM96dHPQAN4eJVS0lKjlwc+pi0AmkZ//xR5dLiqwO0TJqSRMA7K/V
         tObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FNhwL6HVE+DlxBDOEbkib9r3D+DDy8Md7UFbIrGg3uQ=;
        b=e7cCiEK5q0zEq1E0fwCDvj3TZnyXpsCcZh4Yv0EwBLbgq32QA0LJvjE5CbHxdAAZBf
         pnNYQ2slx1sHPcvuyHd42aL2DJCHrKXJGDdsYvPLz8gf5qAFbG3B9VUXSB79S6Zhaigw
         iK3lHmXFObxds1zl1c/RS5jXUlFuoLJZUs2YobU5rTCnWIQlqDmYUYEQDMoQkqvX7y/H
         19Bn85sibhLbS2DIfrElri4qBikU0TLznunV3VjoXWBMShlgO3N4tHUcqAvMMo4AZCRB
         GWXN0xW8FJNY2tEjYlWbgMAfdEY0uIe/YXkwgDTkdY8smXmYdQ16B9Mc8vqleMAzt3jL
         OCkw==
X-Gm-Message-State: AOAM533e6VVGBS/I0ODixNtrFvPOt7jGLpFMkzgDBSYDdRWySgvDaiAg
	Hb2AJP6nKzy+DBrj+9JJI+P50Isp+PI=
X-Google-Smtp-Source: 
 ABdhPJzDGPDKnbeaoAYd1PA1/EcjlBPjoAWkONjlmDxhMloJasjJhZejrPb+tLm01aPpHjrTeIa8Gg==
X-Received: by 2002:a17:907:948e:b0:6fe:27b:bc8f with SMTP id
 dm14-20020a170907948e00b006fe027bbc8fmr21867035ejc.715.1652871536252;
        Wed, 18 May 2022 03:58:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/49] libxcb: update 1.14 -> 1.15
Date: Wed, 18 May 2022 12:58:03 +0200
Message-Id: <20220518105843.3299331-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165806

Drop disable-check.patch, with recipe-specific sysroots
it is no longer necessary.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/libxcb/disable-check.patch       | 25 -------------------
 .../{libxcb_1.14.bb => libxcb_1.15.bb}        |  6 ++---
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.14.bb => libxcb_1.15.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch b/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
deleted file mode 100644
index c0efbdc213..0000000000
--- a/meta/recipes-graphics/xorg-lib/libxcb/disable-check.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-The "check" package is checked for without an explicit enable/disable option,
-which can lead to non-deterministic build issues with both check and libxslt.
-
-As the unit test suite is minimal at present, simply disable the test suite.  In
-the future if the test suite is expanded this can be made conditional on the
-ptest DISTRO_FEATURE.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-
-Index: libxcb-1.12/configure.ac
-===================================================================
---- libxcb-1.12.orig/configure.ac
-+++ libxcb-1.12/configure.ac
-@@ -36,7 +36,8 @@ if test x"$HAVE_DOT" = xno; then
-     AC_MSG_WARN([dot not found - doxygen targets will be skipped])
- fi
- 
--PKG_CHECK_MODULES(CHECK, [check >= 0.9.4], [HAVE_CHECK=yes], [HAVE_CHECK=no])
-+dnl PKG_CHECK_MODULES(CHECK, [check >= 0.9.4], [HAVE_CHECK=yes], [HAVE_CHECK=no])
-+HAVE_CHECK=no
- AM_CONDITIONAL(HAVE_CHECK, test x$HAVE_CHECK = xyes)
- 
- XSLTPROC=no
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
index 5341bbd4bc..839577326e 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
@@ -9,11 +9,9 @@ SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
-           file://disable-check.patch \
-          "
+SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a55ed6db98d43469801262d81dc2572ed124edc3db31059d4e9916eb9f844c34"
+SRC_URI[sha256sum] = "cc38744f817cf6814c847e2df37fcb8997357d72fa4bcbc228ae0fe47219a059"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


