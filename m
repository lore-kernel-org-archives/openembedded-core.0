Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.5526.1629503721985502349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 16:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=slDq9k4b;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so8367546pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 16:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZzF3/hn0jGG5ZWRjsws3hjOc2tF2NmJS1Eg5bcET1w=;
        b=slDq9k4buF0tFYev54P1WP/yjFAQyzjV08ucehlTtl5qyjHAaY5UEXENtd0We8xxdZ
         U/M+y9Rpq6jutF/T8c/uKf7SoynqSvfgkBanDdWIAg8PpzIq4Xj5ojMr+3H2Z7bC5N4D
         bMaSkzb3iWDe3EAq+RxIttYPiT3GBe5x1UmjOTYDHqtInE0V6UZDKRVMiyvLCnUsQNIQ
         hrAZFM88xHiMMndS9HYtWixuc5oWWybO6RWGl0IGEkUVNrAvGjntryyVWijfgvyO3Pyn
         7bSuFZsPvQ1wyjF/W1KuFP95ub367qbWmEU9DOf6IlBvREOLzvIXVsKs1p3hExqzRET6
         +d+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZzF3/hn0jGG5ZWRjsws3hjOc2tF2NmJS1Eg5bcET1w=;
        b=q/ilEWZv9GCoqyNbX9G7025EadPRrP98J5mj8Kq8hyjmQriw0bA7i73mqvekk43Hxi
         VLyJWyT88STYFl6/sxBv8ZYC+htmttJBBpPVgQ1ur5seDTfWw/uTTlP8lS+Vm7vZ84uz
         cnpdAlb5oAB8OStUZS8HKVfgxnn0chqjh2svXbOd+aOaAQrFPsr0j1011Dm/EtVUR2pu
         lgclCtg9CU2dJzM2/d81LyKIdx1eYGlx1g6/9nfLI6VZMBRiN8mSTJtM3GVJXN7mgqqN
         S6f3UgC15Dke/w+PVZ/X41A+aTymU1vL7gDLq9MJNsjrvxDDIeGpM0QOGWFJyW/C1h2v
         Xy4g==
X-Gm-Message-State: AOAM533lXvRed1V45+vsFC2xpIn5zpcZWfAedrRDppwi9rmtlk6x0rbk
	nFk8Q3W68o8uhawOIAz3YTrdtLvdiIY=
X-Google-Smtp-Source: ABdhPJz+Z9nQi5TxwNLkzayn1Q4WrO1BwqHXPsxdkBzUxKHY0vD5bDitXe/eqQ6n3rN+106yv3QJLQ==
X-Received: by 2002:a17:90a:4481:: with SMTP id t1mr7258616pjg.232.1629503721304;
        Fri, 20 Aug 2021 16:55:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id i11sm9634705pgo.25.2021.08.20.16.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 16:55:20 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 1/7] qemu: Security fix CVE-2020-25085
Date: Fri, 20 Aug 2021 16:55:13 -0700
Message-Id: <20210820235519.593218-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 105773
Type: Security Fix
Disposition: Backport from https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg00733.html
ChangeID: 77c8a9e75b94da3c03c64c95d9e6ab9d45037572
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           | 41 +++++++++--------
 .../qemu/qemu/CVE-2020-25085.patch            | 46 +++++++++++++++++++
 2 files changed, 67 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e25c2524aa..a33008670b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,27 +35,28 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-7039-2.patch \
            file://CVE-2020-7039-3.patch \
            file://0001-Add-enable-disable-udev.patch \
-	   file://CVE-2020-7211.patch \
-	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
+           file://CVE-2020-7211.patch \
+           file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://CVE-2020-11102.patch \
-	   file://CVE-2020-11869.patch \
-	   file://CVE-2020-13361.patch \
-	   file://CVE-2020-10761.patch \
-	   file://CVE-2020-10702.patch \
-	   file://CVE-2020-13659.patch \
-	   file://CVE-2020-13800.patch \
-	   file://CVE-2020-13362.patch \
-	   file://CVE-2020-15863.patch \
-	   file://CVE-2020-14364.patch \
-	   file://CVE-2020-14415.patch \
-	   file://CVE-2020-16092.patch \
-	   file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
-	   file://CVE-2019-20175.patch \
-	   file://CVE-2020-24352.patch \
-	   file://CVE-2020-25723.patch \
-	   file://CVE-2021-20203.patch \
-	   file://CVE-2021-3392.patch \
-	   "
+           file://CVE-2020-11869.patch \
+           file://CVE-2020-13361.patch \
+           file://CVE-2020-10761.patch \
+           file://CVE-2020-10702.patch \
+           file://CVE-2020-13659.patch \
+           file://CVE-2020-13800.patch \
+           file://CVE-2020-13362.patch \
+           file://CVE-2020-15863.patch \
+           file://CVE-2020-14364.patch \
+           file://CVE-2020-14415.patch \
+           file://CVE-2020-16092.patch \
+           file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
+           file://CVE-2019-20175.patch \
+           file://CVE-2020-24352.patch \
+           file://CVE-2020-25723.patch \
+           file://CVE-2021-20203.patch \
+           file://CVE-2021-3392.patch \
+           file://CVE-2020-25085.patch \
+           "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[md5sum] = "278eeb294e4b497e79af7a57e660cb9a"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch
new file mode 100644
index 0000000000..be19256cef
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch
@@ -0,0 +1,46 @@
+From dfba99f17feb6d4a129da19d38df1bcd8579d1c3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Tue, 1 Sep 2020 15:22:06 +0200
+Subject: [PATCH] hw/sd/sdhci: Fix DMA Transfer Block Size field
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The 'Transfer Block Size' field is 12-bit wide.
+
+See section '2.2.2. Block Size Register (Offset 004h)' in datasheet.
+
+Two different bug reproducer available:
+- https://bugs.launchpad.net/qemu/+bug/1892960
+- https://ruhr-uni-bochum.sciebo.de/s/NNWP2GfwzYKeKwE?path=%2Fsdhci_oob_write1
+
+Cc: qemu-stable@nongnu.org
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Fixes: d7dfca0807a ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20200901140411.112150-3-f4bug@amsat.org>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25085
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/sd/sdhci.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qemu-4.2.0/hw/sd/sdhci.c
+===================================================================
+--- qemu-4.2.0.orig/hw/sd/sdhci.c
++++ qemu-4.2.0/hw/sd/sdhci.c
+@@ -1129,7 +1129,7 @@ sdhci_write(void *opaque, hwaddr offset,
+         break;
+     case SDHC_BLKSIZE:
+         if (!TRANSFERRING_DATA(s->prnsts)) {
+-            MASKED_WRITE(s->blksize, mask, value);
++            MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
+         }
+ 
-- 
2.25.1

