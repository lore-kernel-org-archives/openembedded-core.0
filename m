Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBB1E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:05 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.21462.1733334897525729838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bL8wM4tg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd10cd5b10so49899a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334897; x=1733939697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urLsotWf+LFXni2+Rz9gvDcElctC4p4PqDSZq8Kvg0M=;
        b=bL8wM4tgfx+H/Isvd5bbWbZqX9GbmDu6FPwu3zzLzVnSRJpgfqUAgVAJUZaEdG/Oer
         QQNISgZ1Y7nxJkyR3OnsoQUCKqXEEy/jyWUAeuyp9M/ILKhLC4XbGx5mMKIsUHx2IV62
         77OKOVvCl1ZAbVTmA0mbRkbof3704v2+kvhL85pdTXa1ZToCanU4PSqgkWej3JlOzZ3x
         Xcr6sDPKFfXn/cBAzE1yWToyiAVgGfYIIZETvYjIkb2jZmvJHYPZ+sVKofLkPFcgy3sv
         MFy1ejKqVjQ3AvE2hMB9bQdJodwsYhhL4/1mvqKoUwzFhJeoyb1oiu86BC9c71W9VZkz
         bC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334897; x=1733939697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urLsotWf+LFXni2+Rz9gvDcElctC4p4PqDSZq8Kvg0M=;
        b=vz53gmZOrBeqmjgZMa+O1reWs3rUYPi6t1qi13gLJqRFrbc5/UXOH/mzjYgWD37jUo
         FiHKiRWmYL2sL87hbwOQrw8FqTqEq+ksF2fLb8Hn2ZVWBt0i0PQwLkwTjOIKqYVh1Ijq
         SNmHqN2yguXPFAMBwRuiG7X4+W4lNJZgvfaft4PzCXIY53/tJtn4knGyqUpQjTr4Ffky
         5H2Rt2JKOsUNlQKI+inBusSlRGHJSmnrhEhx15F90BIF9kHKZMF9ALgOWxU+zRmibIEv
         XEdFAd5u4GZPnJyB9v3jTs9LYaRo72VEcd1mvRhn5wi9YHTGqex0vuagg8h1gRs437qP
         BfYg==
X-Gm-Message-State: AOJu0YwTUTkoGsltHTQrg2te78xQQXfLh2t5zj21AG8BicU8T8+iUb3D
	OF6QXjugQ1rmLwcAuW72+wdr2aPTwv2Yxd5UQkW6b3nm0QRi++eHU6iawMdXkD4CGeDkI0leqlF
	m
X-Gm-Gg: ASbGncuk/ru4mY3rvvycmViy2VBwaj9Tps6hnP78q1yaifoz1cuS5rBCI/oOsmyswy0
	23me7Qdbh80tv86DjgtAsY86liyEC9QpObVTzh+fro8okccSpFz7CLIOWRRHJ1pRE1acPLZig64
	dyJA08nbJ3dV2NmJzqThXhVQHCK40rOaw67R3A2N663hQ0p5oGj0YpIJojhwTpmTlO9y5k2X5Ve
	uVxD3Fa+2kRulz2OcVyuyJp17GUu6mNI3z3iuI=
X-Google-Smtp-Source: AGHT+IEAZ9OEqXA4JahIbqz1/hEBVESAIQrYjHKKlXuyDcceP+zMK0L75B0pVphb2qXl96EkSs0/QA==
X-Received: by 2002:a05:6a20:258a:b0:1e1:384e:20f1 with SMTP id adf61e73a8af0-1e1653d0d7emr11439127637.25.1733334896675;
        Wed, 04 Dec 2024 09:54:56 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/38] qemu: fix CVE-2024-3447
Date: Wed,  4 Dec 2024 09:53:51 -0800
Message-Id: <01d7ac9244364b7f89cd2f99fff11c2417bcad03.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208307

From: Yogita Urade <yogita.urade@windriver.com>

A heap-based buffer overflow was found in the SDHCI device
emulation of QEMU. The bug is triggered when both
`s->data_count` and the size of `s->fifo_buffer` are set to
0x200, leading to an out-of-bound access. A malicious guest
could use this flaw to crash the QEMU process on the host,
resulting in a denial of service condition.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-3447

Upstream patch:
https://gitlab.com/qemu-project/qemu/-/commit/2429cb7a9f460b544f4b07bcf02dbdedfc4dcb39

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2024-3447.patch             | 137 ++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 16eb30e572..bee30cd56f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -127,6 +127,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-3446-0004.patch \
            file://CVE-2024-3446-0005.patch \
            file://CVE-2024-3446-0006.patch \
+           file://CVE-2024-3447.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch
new file mode 100644
index 0000000000..e403e3ec25
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch
@@ -0,0 +1,137 @@
+From 2429cb7a9f460b544f4b07bcf02dbdedfc4dcb39 Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daudé <philmd@linaro.org>
+Date: Tue, 3 Dec 2024 08:19:23 +0000
+Subject: [PATCH] hw/sd/sdhci: Do not update TRNMOD when Command Inhibit (DAT)
+ is set Per "SD Host Controller Standard Specification Version 3.00":
+
+  * 2.2.5 Transfer Mode Register (Offset 00Ch)
+
+    Writes to this register shall be ignored when the Command
+    Inhibit (DAT) in the Present State register is 1.
+
+Do not update the TRNMOD register when Command Inhibit (DAT)
+bit is set to avoid the present-status register going out of
+sync, leading to malicious guest using DMA mode and overflowing
+the FIFO buffer:
+
+  $ cat << EOF | qemu-system-i386 \
+                     -display none -nographic -nodefaults \
+                     -machine accel=qtest -m 512M \
+                     -device sdhci-pci,sd-spec-version=3 \
+                     -device sd-card,drive=mydrive \
+                     -drive if=none,index=0,file=null-co://,format=raw,id=mydrive \
+                     -qtest stdio
+  outl 0xcf8 0x80001013
+  outl 0xcfc 0x91
+  outl 0xcf8 0x80001001
+  outl 0xcfc 0x06000000
+  write 0x9100002c 0x1 0x05
+  write 0x91000058 0x1 0x16
+  write 0x91000005 0x1 0x04
+  write 0x91000028 0x1 0x08
+  write 0x16 0x1 0x21
+  write 0x19 0x1 0x20
+  write 0x9100000c 0x1 0x01
+  write 0x9100000e 0x1 0x20
+  write 0x9100000f 0x1 0x00
+  write 0x9100000c 0x1 0x00
+  write 0x91000020 0x1 0x00
+  EOF
+
+Stack trace (part):
+=================================================================
+==89993==ERROR: AddressSanitizer: heap-buffer-overflow on address
+0x615000029900 at pc 0x55d5f885700d bp 0x7ffc1e1e9470 sp 0x7ffc1e1e9468
+WRITE of size 1 at 0x615000029900 thread T0
+    #0 0x55d5f885700c in sdhci_write_dataport hw/sd/sdhci.c:564:39
+    #1 0x55d5f8849150 in sdhci_write hw/sd/sdhci.c:1223:13
+    #2 0x55d5fa01db63 in memory_region_write_accessor system/memory.c:497:5
+    #3 0x55d5fa01d245 in access_with_adjusted_size system/memory.c:573:18
+    #4 0x55d5fa01b1a9 in memory_region_dispatch_write system/memory.c:1521:16
+    #5 0x55d5fa09f5c9 in flatview_write_continue system/physmem.c:2711:23
+    #6 0x55d5fa08f78b in flatview_write system/physmem.c:2753:12
+    #7 0x55d5fa08f258 in address_space_write system/physmem.c:2860:18
+    ...
+0x615000029900 is located 0 bytes to the right of 512-byte region
+[0x615000029700,0x615000029900) allocated by thread T0 here:
+    #0 0x55d5f7237b27 in __interceptor_calloc
+    #1 0x7f9e36dd4c50 in g_malloc0
+    #2 0x55d5f88672f7 in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5
+    #3 0x55d5f844b582 in pci_qdev_realize hw/pci/pci.c:2092:9
+    #4 0x55d5fa2ee74b in device_set_realized hw/core/qdev.c:510:13
+    #5 0x55d5fa325bfb in property_set_bool qom/object.c:2358:5
+    #6 0x55d5fa31ea45 in object_property_set qom/object.c:1472:5
+    #7 0x55d5fa332509 in object_property_set_qobject om/qom-qobject.c:28:10
+    #8 0x55d5fa31f6ed in object_property_set_bool qom/object.c:1541:15
+    #9 0x55d5fa2e2948 in qdev_realize hw/core/qdev.c:292:12
+    #10 0x55d5f8eed3f1 in qdev_device_add_from_qdict system/qdev-monitor.c:719:10
+    #11 0x55d5f8eef7ff in qdev_device_add system/qdev-monitor.c:738:11
+    #12 0x55d5f8f211f0 in device_init_func system/vl.c:1200:11
+    #13 0x55d5fad0877d in qemu_opts_foreach util/qemu-option.c:1135:14
+    #14 0x55d5f8f0df9c in qemu_create_cli_devices system/vl.c:2638:5
+    #15 0x55d5f8f0db24 in qmp_x_exit_preconfig system/vl.c:2706:5
+    #16 0x55d5f8f14dc0 in qemu_init system/vl.c:3737:9
+    ...
+SUMMARY: AddressSanitizer: heap-buffer-overflow hw/sd/sdhci.c:564:39
+in sdhci_write_dataport
+
+Add assertions to ensure the fifo_buffer[] is not overflowed by
+malicious accesses to the Buffer Data Port register.
+
+Fixes: CVE-2024-3447
+Cc: qemu-stable@nongnu.org
+Fixes: d7dfca08 ("hw/sdhci: introduce standard SD host controller")
+Buglink: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=58813
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Chuhong Yuan <hslester96@gmail.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Message-Id: <CAFEAcA9iLiv1XGTGKeopgMa8Y9+8kvptvsb8z2OBeuy+5=NUfg@mail.gmail.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Message-Id: <20240409145524.27913-1-philmd@linaro.org>
+(cherry picked from commit 9e4b27ca)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+CVE: CVE-2024-3447
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/2429cb7a9f460b544f4b07bcf02dbdedfc4dcb39]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/sd/sdhci.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index e0bbc9034..211daa4bb 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -471,6 +471,7 @@ static uint32_t sdhci_read_dataport(SDHCIState *s, unsigned size)
+     }
+
+     for (i = 0; i < size; i++) {
++        assert(s->data_count < s->buf_maxsz);
+         value |= s->fifo_buffer[s->data_count] << i * 8;
+         s->data_count++;
+         /* check if we've read all valid data (blksize bytes) from buffer */
+@@ -559,6 +560,7 @@ static void sdhci_write_dataport(SDHCIState *s, uint32_t value, unsigned size)
+     }
+
+     for (i = 0; i < size; i++) {
++        assert(s->data_count < s->buf_maxsz);
+         s->fifo_buffer[s->data_count] = value & 0xFF;
+         s->data_count++;
+         value >>= 8;
+@@ -1184,6 +1186,12 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+         if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
+             value &= ~SDHC_TRNS_DMA;
+         }
++
++        /* TRNMOD writes are inhibited while Command Inhibit (DAT) is true */
++        if (s->prnsts & SDHC_DATA_INHIBIT) {
++            mask |= 0xffff;
++        }
++
+         MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
+         MASKED_WRITE(s->cmdreg, mask >> 16, value >> 16);
+
+--
+2.40.0
-- 
2.34.1


