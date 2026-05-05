Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEFCCD3441
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1093.1778000348149809142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uEo+Y/Ua;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891f625344so694675e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000346; x=1778605146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtsX5rWLOn1lmdMNV1SC4yYmXWdMuwKNYyzR9JxlT/U=;
        b=uEo+Y/Ua9EKT9uqDXwqY0hBvn/wdDz9+OyQy2EFm60czIsHH2TGOte4EYA7E0oZWb4
         yq233x60CT6itJLqjoJ10ZuztsaWnDxF0YBYMI1+Knmn9ICJJ5vIigXfdfxVabBVGmjs
         i60J8RfGDvegfnwK7Ttlc646FzNldSXLuQe9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000346; x=1778605146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KtsX5rWLOn1lmdMNV1SC4yYmXWdMuwKNYyzR9JxlT/U=;
        b=XPR4WoQTFM3lytd8JHCaU4PYRkvCSViakBKUlG1/FB/5sH2CNHmyYUvjSTJdLueMP1
         ohD9qLHjDAjfHcp1SOifdMtemfbU6UZ61qQh6Wxb/hd0ZkreEmHOSIiGXjFwhDqVFNOh
         eWGrfZXn1lK0OmjeTobXgjJILx07J+IrwJWMWgQQY3sLcg/ipzR4Q2nYkldyE9D2LzIG
         /E4Mstfmk7vIUle/ZthKHKdszxjaV5AnRHqadUbIPsDudcdGOSFjq6/MOxNiQ9mswSCK
         VbNhYw8T00zdTyA8//G46nLe/3SdGDoeAzEunfrmuGqmwp1JyMJMRThMcMKK6Fsl0ELx
         M3wg==
X-Gm-Message-State: AOJu0YyhVAZd9Gdc3mCglvWd/JoACxE5lbyhk6dfWvhI0AdoApskk2t4
	Nk6ibUn6gVBHcZ0w33ze4+6WHoMxD0JZXjtndUef8fb5j5skQYDq3aTQenTh9Beag+bKyPZsFzL
	N5pl/M8M=
X-Gm-Gg: AeBDiesLTdO9DZzgEhte4dqxVU2C8wBb+TNOyMrh7iBRdeqLUICmPqtaxu9bfSvur01
	Gdojru4hNqDDAQTr4N5wgR/7JtD57aX5OTIVVPpQ96baIdVr/5ia3K+VjZlqtuRw1IYohjIM30z
	WD4O8izHzlapKrI7syOd0UL3s8n/m21SEXiWzpFazF4yXzbvedPUGQ7E2H4jrL1H6DVYQblm+1D
	Y7Mi8X/bNWN1LnyJcBY9mL51Y34YYeqbt0+6LgMEaWAQotScAg3Dcl0f6+xXtcFinaxDZjLBN4h
	DQL38+QdEVYt54YWiJxLWW3xCENgIdYSLnd/nn//HXzR+tXhHEeCUf6r3Fo+4/Mmk50965nKSov
	3MJVX8b2ZAZvA0Zi8M+cQaZJxz5ChWVZ8RQWRe1MiHAyPWfKYEUdIIG0//gCMXaviKa7uvVY0kH
	/dErCv/SApqkVRfqCO9DhKQyfK2rUiKkht1IkSo7saFn06A7uIUXxW2MrrQUFO078s6oW7j0aJF
	ezRD7p9xF9OYItAaJe4Byc0YQxeYnYoI6pR
X-Received: by 2002:a05:600c:3152:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48d1422bafamr73293675e9.3.1778000346110;
        Tue, 05 May 2026 09:59:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.59.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:59:05 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/23] systemd: fix for CVE-2026-40225
Date: Tue,  5 May 2026 18:57:37 +0200
Message-ID: <fc2d33dbb2d5180b77c10865156db342f9d582da.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236511

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport commit[0] and [1] which fixes this vulnerability as mentioned in Debian report [2].

[0] https://github.com/systemd/systemd/commit/03bb697b8df0339c37f4b845025320b261aeb7cc
[1] https://github.com/systemd/systemd/commit/5887e72ff87d3a66a4c3fa91897fbec1545f4d3d
[2] https://security-tracker.debian.org/tracker/CVE-2026-40225

More details : https://nvd.nist.gov/vuln/detail/CVE-2026-40225

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
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

