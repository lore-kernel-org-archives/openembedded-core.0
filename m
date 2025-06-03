Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E6FC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 11:36:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9060.1748950588356751360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 04:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mL4Q7mm0;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1763865f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 04:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748950587; x=1749555387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxvmG0uXJ33Tnc3vW3kleVS757GYyB4r0ST7PQhsCf8=;
        b=mL4Q7mm0V3NBa2CUXwua9AKtbs6zps/jE5zAjWfOfgDMfo3VSSlNrVOpSm7+jtFT4D
         Wp7VaayQ1Dr2qI4mZfQYRfdo3Epq8AmKmM4wDNpZzPiM0JRZ0WByz6xEEvHEE49gwsCt
         cSoRzngM2x/JRgAhNk/wZCRB9PfNnwzloICDJM7LTUmu7JnCc2uUnNpIrHxNErH61sRK
         opgkTZ18A6xLNaMwfg5b9n8uLIF5mEedI8MhdwlpCtZ0v2jJ9DSDe1SXdjZ8niz8J+l2
         B8GP26uybzoM+Xi8DV5gIrev3YvTwKNhZeZcdnScjL29pMCusYwkiIS3neLZ+IeT5wv0
         xxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748950587; x=1749555387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxvmG0uXJ33Tnc3vW3kleVS757GYyB4r0ST7PQhsCf8=;
        b=petvVMqArN+xXtsnB2eC6MDCJfWI/00Iy9bdWSu6hb4B4Furel+EF5pX445vL8zkWY
         3LLuHh8xV0vhj4MsAZlPHjYuEMIN3nzdFwR8kiecdyyNHRsMsQZ/aKGU2T8zwlqqlEz1
         lXms5KX1OKG2uxKidhVFbMeJ4cpV5dlo5sOe81GflBcTRPlBlimUJMqDZf1mq7Vm7wXi
         qBiUnMIQ8lxrYjrHwIKt/4k1+QXkPXoywyb296/WA+hRkbLFPYsOsO+LJGK0H/zYvAea
         aNQcziRQ+0N8ExyOXESBtSQKnB3KJbHlWmd/NjcCOBola6Vj4U/2M9iwuSY8u00Ynh7Y
         nRyA==
X-Gm-Message-State: AOJu0Yw0TMCw3JmW2ucvGDRRhYkmOjWF8eqxPsWxm0H8oydqQvCsApIS
	dSiembsij+z1IlXjxMeJtLC3YR20p7dFlyNVZtsWFzGnMW4UdqDYuOjF/EKfLQ==
X-Gm-Gg: ASbGncuZygQPr7+wRGBh+VWsZNZb8CN6Lr4seDIfAS64UFp181MOyw2Xs7S0IueP9xP
	+0aJKgLThcJQaOhZ1OpbRsFJAXenaqTbqMp5Vf/SH8bOmYcSFWR6Mthw5Myzmf0yBjacXfwk/Ev
	lZdJ3A8a4dJ5j9+NWgTqxqM9aPV0n6ZNYQGfSjjg/m9nvcYHUxTKzZCTdtqzx/nSNOX9nWSzgeU
	pOuI3hZB3bTNCcoH00731bo0ncTy6H/sMbKgSt1vxdj+0B9nCeP2HEM1Lbf5s1P6kZ26zI8whRN
	JKUyoily0kdfgO3juW/UTnZzYKf5qdCCnWDyCznTyKfKIDiNEWzsBJOEgcaKcABWToYHBZKwMhz
	Zd8LPxIyFZCLW
X-Google-Smtp-Source: AGHT+IGwQ/mgzD/3TZ5Erq5Audt+zVkyVH8MGlWePN0ibyrt2w9XGZhjNYEw+tjXtWazCQwbldpzCQ==
X-Received: by 2002:a05:6000:2c12:b0:3a4:d0fe:428a with SMTP id ffacd0b85a97d-3a4f7a7cad6mr12707108f8f.28.1748950586611;
        Tue, 03 Jun 2025 04:36:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f22sm17728247f8f.43.2025.06.03.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:36:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] meta/conf/templates: add a blank template
Date: Tue,  3 Jun 2025 13:36:17 +0200
Message-Id: <20250603113620.3104900-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 11:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217805

From: Alexander Kanavin <alex@linutronix.de>

The default oe-core/poky templates have a number of settings
(such as distro and machine) and are thus unsuitable for
building up configurations from fragments. This adds a template
with an empty local.conf, so that it can be used as the starting
point for fragment-driven configuration.

There will also be a blank template in poky; the difference is
that this one includes only oe-core and the poky one
adds poky layers.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../conf/templates/blank/bblayers.conf.sample | 10 ++++++++++
 meta/conf/templates/blank/conf-notes.txt      | 19 +++++++++++++++++++
 meta/conf/templates/blank/conf-summary.txt    |  1 +
 meta/conf/templates/blank/local.conf.sample   | 10 ++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 meta/conf/templates/blank/bblayers.conf.sample
 create mode 100644 meta/conf/templates/blank/conf-notes.txt
 create mode 100644 meta/conf/templates/blank/conf-summary.txt
 create mode 100644 meta/conf/templates/blank/local.conf.sample

diff --git a/meta/conf/templates/blank/bblayers.conf.sample b/meta/conf/templates/blank/bblayers.conf.sample
new file mode 100644
index 00000000000..c985f4f2420
--- /dev/null
+++ b/meta/conf/templates/blank/bblayers.conf.sample
@@ -0,0 +1,10 @@
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+LCONF_VERSION = "7"
+
+BBPATH = "${TOPDIR}"
+BBFILES ?= ""
+
+BBLAYERS ?= " \
+  ##OEROOT##/meta \
+  "
diff --git a/meta/conf/templates/blank/conf-notes.txt b/meta/conf/templates/blank/conf-notes.txt
new file mode 100644
index 00000000000..cfd1f1977bf
--- /dev/null
+++ b/meta/conf/templates/blank/conf-notes.txt
@@ -0,0 +1,19 @@
+
+### Shell environment set up for builds. ###
+
+You can now run 'bitbake <target>'
+
+Common targets are:
+    core-image-minimal
+    core-image-full-cmdline
+    core-image-sato
+    core-image-weston
+    meta-toolchain
+    meta-ide-support
+
+You can also run generated qemu images with a command like 'runqemu qemux86-64'.
+
+Other commonly useful commands are:
+ - 'devtool' and 'recipetool' handle common recipe tasks
+ - 'bitbake-layers' handles common layer tasks
+ - 'oe-pkgdata-util' handles common target package tasks
diff --git a/meta/conf/templates/blank/conf-summary.txt b/meta/conf/templates/blank/conf-summary.txt
new file mode 100644
index 00000000000..7528c297947
--- /dev/null
+++ b/meta/conf/templates/blank/conf-summary.txt
@@ -0,0 +1 @@
+This configuration is empty and is intended as a starting point for adding configuration fragments.
diff --git a/meta/conf/templates/blank/local.conf.sample b/meta/conf/templates/blank/local.conf.sample
new file mode 100644
index 00000000000..41eea8506df
--- /dev/null
+++ b/meta/conf/templates/blank/local.conf.sample
@@ -0,0 +1,10 @@
+#
+# This file is intended for local configuration tweaks. It is intentionally
+# set up empty, so that configuration can be constructed from fragments
+# using bitbake-config-build tool and by setting MACHINE and DISTRO here.
+#
+# If you would like to publish this file (for example as a bitbake
+# configuration template), it is recommended to create fragments
+# from changes made here; the only settings that can remain are
+# MACHINE and DISTRO.
+#
-- 
2.39.5


