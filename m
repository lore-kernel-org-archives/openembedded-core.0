Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BE4FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 12:25:44 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12143.1777379138284701428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 05:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OT6mvh+z;
 spf=pass (domain: mvista.com, ip: 74.125.82.50, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c6df0b9bbso3044692c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777379137; x=1777983937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk/igCLvGXV4wzIXRpe/ZHjRNdzt5ako9GkSoWdZenA=;
        b=OT6mvh+z5Id3P/taRcfAr0/uE9qDO6u4GCi+iwtwiCndPCyaNQZGcI2/3YSPXqsZ3L
         2oCVgnEgcbSRTdAL3XIlYYxeSLQMoK5nR4U3f0e/L+eHMVA4YM4xyN96fycBI9kIj13c
         CDMo1q7o9Xu1iShgU57t8yP72cj16/DWRvFj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379137; x=1777983937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk/igCLvGXV4wzIXRpe/ZHjRNdzt5ako9GkSoWdZenA=;
        b=hhmj0WHcqHSs+JgaI9PItyEKiHZv4sImrL13tNHBNol4/IKpMvdgbj9ACJqWBf8R8T
         CHrdRfkZwhBZWe+tMVMIHB7RcYu5BsDaxtKHDxErXLk8N51x1S7ClcaKcIb3KgNNrOQ1
         OxSkFYXzchU9BNhZ6R0gcgdrJppd6yqyZRS3CBFO8BngmfztaY3sW/QD+KWyEFwFVb+B
         2KfdZpXk//hgYEvKdNfggWFodXGAVpHjq91RlI4fi81hWfrXzophz415mO3/+b2sL0SO
         /11LJazLf91nyKCjM2nPuGWBg8mfqALHmtCorcAvRHIjmKmm555o83du//WhclU7LZuU
         jfWA==
X-Gm-Message-State: AOJu0Yy9LlkTDpre1QUxOm41VxLJ92HRwqz7zNq1T+ECdXfNnwMAFDJw
	rSrwXsrmOpaJgBlBlVvgqY291VR5qllRB1zkVBpMDsOzhZ9bZX8IuXVC9E+N04r5kkUKhPHzwTd
	JRm2Q
X-Gm-Gg: AeBDietprIuz/BxcWTFIQ1TmFCc8RYZ/qjI3DCkp2gkdBR1LnT+m6ntP6xP9bShamdk
	4dDk91kqfA/x2DBSwNkVUeA6YNOggti0KikQIwjMzotEAP4CRn+ZrkXEhJGT049k2n+B7j378o2
	jlTXbnh+b1NySNXMQ6QcRKS/uOJ9kwUKyjp75V5zdk2zvRkDv5tVZsiTh5DTmLy+zXT5fq3WJWk
	05MFCPF01fIrVC7/uqJqoSDeSCqrmRiTTLgoJxdi8O0nTwSsTKiubl3UlgNCrYtB8Lcr1tcfa0f
	VAqKA9hlH39tlhcVb4Lb+7mqZnRiKFnODte5/9opVboe9hvTn3OMhwx9I9r9JbO8Y4A0QePU4cq
	2oQD3gtRBwKuzk7uNBAvZvZLeO6jQvI/bz7No7/dh+OhwRpODtCUewUt/A5xDe4G+V7s9/sDVRD
	pT4fP0c2jL/5g+NyDYOejpRw3HX6dRl/GTDQ/VWbp/Sr5n/sQ=
X-Received: by 2002:a05:7300:ef89:b0:2d4:2cc8:67e with SMTP id 5a478bee46e88-2ed0a1558e0mr1222874eec.23.1777379136905;
        Tue, 28 Apr 2026 05:25:36 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09f8efeesm2157868eec.6.2026.04.28.05.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:25:36 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] systemd: fix for CVE-2026-40225
Date: Tue, 28 Apr 2026 17:55:28 +0530
Message-ID: <20260428122528.659662-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 12:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236060

Backport commit[0] and [1] which fixes this vulnerability as mentioned in Debian report [2].

[0] https://github.com/systemd/systemd/commit/03bb697b8df0339c37f4b845025320b261aeb7cc
[1] https://github.com/systemd/systemd/commit/5887e72ff87d3a66a4c3fa91897fbec1545f4d3d
[2] https://security-tracker.debian.org/tracker/CVE-2026-40225

More details : https://nvd.nist.gov/vuln/detail/CVE-2026-40225

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../systemd/systemd/CVE-2026-40225-01.patch   | 131 ++++++++++++++++++
 .../systemd/systemd/CVE-2026-40225-02.patch   |  39 ++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |   2 +
 3 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40225-01.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40225-02.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-40225-01.patch b/meta/recipes-core/systemd/systemd/CVE-2026-40225-01.patch
new file mode 100644
index 0000000000..f616e636c2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-40225-01.patch
@@ -0,0 +1,131 @@
+From 03bb697b8df0339c37f4b845025320b261aeb7cc Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Fri, 6 Mar 2026 19:32:35 +0000
+Subject: [PATCH] udev: check for invalid chars in various fields received from
+ the kernel
+
+(cherry picked from commit 16325b35fa6ecb25f66534a562583ce3b96d52f3)
+(cherry picked from commit 3513862eabe9ec4a6a095d7266e98f998f289ed2)
+(cherry picked from commit c20d21e0da293e715db468f9f4a15a5c8fbf8273)
+
+CVE: CVE-2026-40225
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/03bb697b8df0339c37f4b845025320b261aeb7cc]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/udev/dmi_memory_id/dmi_memory_id.c | 3 ++-
+ src/udev/scsi_id/scsi_id.c             | 5 +++--
+ src/udev/udev-builtin-net_id.c         | 9 +++++++++
+ src/udev/v4l_id/v4l_id.c               | 5 ++++-
+ 4 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/src/udev/dmi_memory_id/dmi_memory_id.c b/src/udev/dmi_memory_id/dmi_memory_id.c
+index 52ea250af8..4f2c21b80b 100644
+--- a/src/udev/dmi_memory_id/dmi_memory_id.c
++++ b/src/udev/dmi_memory_id/dmi_memory_id.c
+@@ -51,6 +51,7 @@
+ #include "string-util.h"
+ #include "udev-util.h"
+ #include "unaligned.h"
++#include "utf8.h"
+ 
+ #define SUPPORTED_SMBIOS_VER 0x030300
+ 
+@@ -185,7 +186,7 @@ static void dmi_memory_device_string(
+ 
+         str = strdupa_safe(dmi_string(h, s));
+         str = strstrip(str);
+-        if (!isempty(str))
++        if (!isempty(str) && utf8_is_valid(str) && !string_has_cc(str, /* ok= */ NULL))
+                 printf("MEMORY_DEVICE_%u_%s=%s\n", slot_num, attr_suffix, str);
+ }
+ 
+diff --git a/src/udev/scsi_id/scsi_id.c b/src/udev/scsi_id/scsi_id.c
+index 6308c52b7e..7e18bc755a 100644
+--- a/src/udev/scsi_id/scsi_id.c
++++ b/src/udev/scsi_id/scsi_id.c
+@@ -27,6 +27,7 @@
+ #include "strv.h"
+ #include "strxcpyx.h"
+ #include "udev-util.h"
++#include "utf8.h"
+ 
+ static const struct option options[] = {
+         { "device",             required_argument, NULL, 'd' },
+@@ -443,8 +444,8 @@ static int scsi_id(char *maj_min_dev) {
+                 }
+                 if (dev_scsi.tgpt_group[0] != '\0')
+                         printf("ID_TARGET_PORT=%s\n", dev_scsi.tgpt_group);
+-                if (dev_scsi.unit_serial_number[0] != '\0')
+-                        printf("ID_SCSI_SERIAL=%s\n", dev_scsi.unit_serial_number);
++                if (dev_scsi.unit_serial_number[0] != '\0' && utf8_is_valid(dev_scsi.unit_serial_number) && !string_has_cc(dev_scsi.unit_serial_number, /* ok= */ NULL))
++                        printf("ID_SCSI_SERIAL=%s\n", serial_str);
+                 goto out;
+         }
+ 
+diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_id.c
+index 91b40088f4..715184e282 100644
+--- a/src/udev/udev-builtin-net_id.c
++++ b/src/udev/udev-builtin-net_id.c
+@@ -39,6 +39,7 @@
+ #include "strv.h"
+ #include "strxcpyx.h"
+ #include "udev-builtin.h"
++#include "utf8.h"
+ 
+ #define ONBOARD_14BIT_INDEX_MAX ((1U << 14) - 1)
+ #define ONBOARD_16BIT_INDEX_MAX ((1U << 16) - 1)
+@@ -247,6 +248,9 @@ static int get_port_specifier(sd_device *dev, bool fallback_to_dev_id, char **re
+                         }
+                 }
+ 
++                if (!utf8_is_valid(phys_port_name) || string_has_cc(phys_port_name, /* ok= */ NULL))
++                        return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EINVAL), "Invalid phys_port_name");
++
+                 /* Otherwise, use phys_port_name as is. */
+                 buf = strjoin("n", phys_port_name);
+                 if (!buf)
+@@ -351,6 +355,9 @@ static int names_pci_onboard_label(sd_device *dev, sd_device *pci_dev, const cha
+         if (r < 0)
+                 return log_device_debug_errno(pci_dev, r, "Failed to get PCI onboard label: %m");
+ 
++        if (!utf8_is_valid(label) || string_has_cc(label, /* ok= */ NULL))
++                return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EINVAL), "Invalid label");
++
+         char str[ALTIFNAMSIZ];
+         if (snprintf_ok(str, sizeof str, "%s%s",
+                         naming_scheme_has(NAMING_LABEL_NOPREFIX) ? "" : prefix,
+@@ -1209,6 +1216,8 @@ static int names_netdevsim(sd_device *dev, const char *prefix, bool test) {
+         if (isempty(phys_port_name))
+                 return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EOPNOTSUPP),
+                                               "The 'phys_port_name' attribute is empty.");
++        if (!utf8_is_valid(phys_port_name) || string_has_cc(phys_port_name, /* ok= */ NULL))
++                return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EINVAL), "Invalid phys_port_name");
+ 
+         char str[ALTIFNAMSIZ];
+         if (snprintf_ok(str, sizeof str, "%si%un%s", prefix, addr, phys_port_name))
+diff --git a/src/udev/v4l_id/v4l_id.c b/src/udev/v4l_id/v4l_id.c
+index 30527e9556..2ec96d8d3a 100644
+--- a/src/udev/v4l_id/v4l_id.c
++++ b/src/udev/v4l_id/v4l_id.c
+@@ -29,6 +29,8 @@
+ #include "build.h"
+ #include "fd-util.h"
+ #include "main-func.h"
++#include "string-util.h"
++#include "utf8.h"
+ 
+ static const char *arg_device = NULL;
+ 
+@@ -82,7 +84,8 @@ static int run(int argc, char *argv[]) {
+                 int capabilities;
+ 
+                 printf("ID_V4L_VERSION=2\n");
+-                printf("ID_V4L_PRODUCT=%s\n", v2cap.card);
++                if (utf8_is_valid((char *)v2cap.card) && !string_has_cc((char *)v2cap.card, /* ok= */ NULL))
++                        printf("ID_V4L_PRODUCT=%s\n", v2cap.card);
+                 printf("ID_V4L_CAPABILITIES=:");
+ 
+                 if (v2cap.capabilities & V4L2_CAP_DEVICE_CAPS)
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-40225-02.patch b/meta/recipes-core/systemd/systemd/CVE-2026-40225-02.patch
new file mode 100644
index 0000000000..bc0a5514d4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-40225-02.patch
@@ -0,0 +1,39 @@
+From 5887e72ff87d3a66a4c3fa91897fbec1545f4d3d Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Fri, 13 Mar 2026 11:10:47 +0000
+Subject: [PATCH] udev: fix review mixup
+
+The previous version in the PR changed variable and sanitized it
+in place. The second version switched to skip if CCs are in the
+string instead, but didn't move back to the original variable.
+Because it's an existing variable, no CI caught it.
+
+Follow-up for 16325b35fa6ecb25f66534a562583ce3b96d52f3
+
+(cherry picked from commit 54f880b02ecf7362e630ffc885d1466df6ee6820)
+(cherry picked from commit 4425d8523e79f3cc00b3b93a0b5e7c6cdc284a97)
+(cherry picked from commit 75c585beae60e73208941e6b3f64cf249223f53d)
+
+CVE: CVE-2026-40225
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/5887e72ff87d3a66a4c3fa91897fbec1545f4d3d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/udev/scsi_id/scsi_id.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/udev/scsi_id/scsi_id.c b/src/udev/scsi_id/scsi_id.c
+index 7e18bc755a..b2df8d9f7f 100644
+--- a/src/udev/scsi_id/scsi_id.c
++++ b/src/udev/scsi_id/scsi_id.c
+@@ -445,7 +445,7 @@ static int scsi_id(char *maj_min_dev) {
+                 if (dev_scsi.tgpt_group[0] != '\0')
+                         printf("ID_TARGET_PORT=%s\n", dev_scsi.tgpt_group);
+                 if (dev_scsi.unit_serial_number[0] != '\0' && utf8_is_valid(dev_scsi.unit_serial_number) && !string_has_cc(dev_scsi.unit_serial_number, /* ok= */ NULL))
+-                        printf("ID_SCSI_SERIAL=%s\n", serial_str);
++                        printf("ID_SCSI_SERIAL=%s\n", dev_scsi.unit_serial_number);
+                 goto out;
+         }
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index 87e186bbfa..fe9d699816 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -29,6 +29,8 @@ SRC_URI += " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
+           file://CVE-2026-40225-01.patch \
+           file://CVE-2026-40225-02.patch \
            "
 
 # patches needed by musl
-- 
2.50.1


