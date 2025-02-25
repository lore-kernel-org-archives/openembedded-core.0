Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E03C021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 12:08:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6596.1740485329630006026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 04:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dEJFe8sr;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4397e5d5d99so34184945e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 04:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740485328; x=1741090128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxvmG0uXJ33Tnc3vW3kleVS757GYyB4r0ST7PQhsCf8=;
        b=dEJFe8srYJ+TgMh9oBuFBHpK+/OiYSt4yMV5GtqDaF7pyLAlvM+3bSJFHA2+CwhKoM
         +MlvHlR0CY6icVDsoBS1BfeenmOqbDZQPjF+xx++Apqn/gNNOxd7ucho1hAIBh9z7EBF
         jG4eArvMJ9oy/8YQBh2u7j/Ziibs957TXMmTHKaaHKkRv40+Y7ZcRUapVDdXqrWHNrMo
         npTLLX/Va8jA3G5tXJOtA7gkhzhGzTnk0FZz4JdJ39QObKb5K+haNY45K5eFqmrPGuMU
         AK21YpKhrKAAT4Y14R980VixIOcRi/2ijD9tuntym3sVdCB0QKp5RTO3p5ou4m25Gv6C
         0EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740485328; x=1741090128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxvmG0uXJ33Tnc3vW3kleVS757GYyB4r0ST7PQhsCf8=;
        b=QEbUYTW7fhnwseyCZu+QFd49YDk2yHh5e9w4H2hkT2fCSvrOfBf1ay6t1uwYhSS4iv
         hGkm8HaC2xGJdivaaX5B+Fdbz6SADDGdKK2af37MK3bTa1UMyag7XDB98SXTy4FlvsQn
         tOyMS70eDa4+k/nBBREinl/LhjNGD8bAHVw/ZoemeZkZyeyO/gv8TQal/eRadmuDlop4
         FFCTlgJMjm3jdV3HR9WCdyxpDhzBFTRrBhRecsz2sUWC9dTnG+XkzW9YZEqC05j20Xf5
         ywSQ9SWntU5724WaGMOLuFVpx0u4glbcj3TBcAE+FkdFBysBO3/RMUGbgACNccU9OdiX
         bauw==
X-Gm-Message-State: AOJu0YzbH+kG9C5uV4jKaa+8HmAme4QF4fbeyLi5wBYhMTbG5YbA1A3i
	H++rJ6gy2YosP2qcCq88P5SlDHeC9W4lbiqbTy0l5p7yLdDXGg8+vKnCHA==
X-Gm-Gg: ASbGncvio+Vpz4GJtBRxKtl+q/3tHvL40bY20pdWqN7J9oE+ns+7GJPZhkfbGUB+DDZ
	2Zh3OcPoN/HQ++TvU2ZW1YS2ZKRO1UKZHanE8gi4AjicvUvh6q4Xs3xz0rtjXm38iSvX6ILKvNu
	OcYoe5XXiJJbgeKtfYTVnw7RTm26+zWQG39ILDU86y6COjVUDd9hzT4tyHp0oPGJxdOBQKlAyRc
	sRn2j6WcWdkqhQCB4G4PwKAZflgmnIAY+efmH1cfrVRMwvMo/Z4doqah5WYbx8pxKG8ajwMK5E3
	CMYgKXkdg2S5+Z7s/m3jBsZM5eBp3ZZk4lobes+t+LMq2ydT0Va/iA9iHrOdrYI=
X-Google-Smtp-Source: AGHT+IFeA9ze3jsadwAV9iVdkxwoQmbRegJGJtgnQLD0fYcLIZjXLD4ZJKamkGcFS1umVZA9NRrx+w==
X-Received: by 2002:adf:fdc9:0:b0:38d:dd8c:51a1 with SMTP id ffacd0b85a97d-390cc60ce42mr2251616f8f.27.1740485327611;
        Tue, 25 Feb 2025 04:08:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc31fsm2018305f8f.87.2025.02.25.04.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 04:08:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] meta/conf/templates: add a blank template
Date: Tue, 25 Feb 2025 13:08:33 +0100
Message-Id: <20250225120836.171976-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211873

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


