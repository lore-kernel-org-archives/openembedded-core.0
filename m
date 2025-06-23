Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1597C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 16:56:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.61.1750697765288127244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 09:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B2S16kVA;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45365b1a897so21975165e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 09:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750697764; x=1751302564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxvmG0uXJ33Tnc3vW3kleVS757GYyB4r0ST7PQhsCf8=;
        b=B2S16kVAAj804EjRPO+0N49yOppXQ8eG/GUk/eplmh5jvmHqW5UcVfh2I3pAmfMux6
         vSmiNmbWyzObtoLa4U42BU+hmHC4JrqsKD8VX54YV6vLmunD/tgo3FGhFC2vbZkeR5c5
         5pfeIwM6V1U2v6jeqdWelOCNZqOmeqJNI7GowkyheVilJjCxdavS7gMrGEUFUvZINsLT
         b1+nMzjqHFSbIbZlNW9szkj1ZI1nO35IMbTdVJrsh03wGGyavGvLohJpiBPfL0/HzrIF
         Up0GCV2e3LCnPc9BFGNN2weAZJ0Hws/F+d/bFxCRMq/W98KO5kBaJgCUv/tw408F+a3K
         ZYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697764; x=1751302564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxvmG0uXJ33Tnc3vW3kleVS757GYyB4r0ST7PQhsCf8=;
        b=AU59h2QPtI6vqE5cmmvfOt5vQHvALCK2IGT/NS7AlOWLhNLJ6qIauo14OFe0LGclph
         MrLICioV3SqzZVXXFhZFtE1x3G5S6/vHd3XcfckYf7/WzQXg5SARcOAAaB8EgyDmr5s9
         w9emfPgLJM0CgmFD8Lbsb0I+H6lBBmrrxiE67NvCbUgRTKHKgXtY6OxX5ZFFmu8b9wU4
         BXHFIGv1m2xiXkBSxq4SWiTbIff/vMrlDnDi1ORX7cTPVKJY3dmv2h1RV/Sgk4jW/Oa2
         WtyvplhLt5jAUTHfP/ymopHld9maEgOZiMmh9Vn2UWB7l/UC48GtFEtzgQEUKcfWFhjg
         Qd5w==
X-Gm-Message-State: AOJu0YxV70Rw7w+BXzKlp8mY2ORIgSjkOz4Z2jlvMrK3IV7bwP+nTyuZ
	1QTw/VJs8XrXPaMlKn2DGTlxAx7kOr8S6QXOCzhcoVqt+BUZWZYVRiVRFdtHcQ==
X-Gm-Gg: ASbGncsWk1JjOczHs/OoElp37JMHXSsxkh96pv8dZIUQiNxOSqGGBqAK+rJvZkUXFAd
	iLGRPGS9TQ7vbCm+gayjebCwzc1Qizggeq7uqgkaq4RWjXN3oC9B+37f7zy2R1cmb2t8z9m91vx
	mXONUPgE8LALY2neQrSoGEBPH9qZuixd12Vtuv6cwICFrl/1QtRcbAXWKFul1fIAMevw/g0PVzQ
	RN5qKv9p6aGQccXTZrXq1Tc6NO2AKnHJvS2HIjIGOE9ILHNbfu6HYxbRPbwcSoEYhGPlY7JxIYz
	g7a6/k4DEIFb5jL2ZoFWwVbzDclL/k1YhGLdOBonDAoPAAlBM57/dMW6WjY2lkncmHoMglW2ASO
	Kssh96xLoq1F12Wr2ZaChLpM=
X-Google-Smtp-Source: AGHT+IFpEZKCBd939YpwzIkcmOLdex9NNWNln+JPNU+04eGC/DybQKVkMyNHdgnx1Ep7Z95vj3YDCw==
X-Received: by 2002:a05:600c:1c27:b0:453:62e9:125a with SMTP id 5b1f17b1804b1-4537a2f1c30mr17478305e9.18.1750697763431;
        Mon, 23 Jun 2025 09:56:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647082a2sm116651495e9.37.2025.06.23.09.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:56:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] meta/conf/templates: add a blank template
Date: Mon, 23 Jun 2025 18:55:38 +0200
Message-Id: <20250623165538.1633984-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 16:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219217

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


