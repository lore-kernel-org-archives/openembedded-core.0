Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F51D2A54D
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:36:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.32599.1729107372404325223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P2jiWn5Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4314f38d274so2561845e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 12:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107371; x=1729712171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WBs3sIjuOq1Hz73N2mtXShFzbqAoODZKD1Xn+1XWtGU=;
        b=P2jiWn5ZPYz0HXVOPwGC8RhaOXqpovF8QNn9i9482WbgMweBUcpIVix9r7a9DRtLdv
         KswoODHJ4toyZnyj+qz8akuB60qCz+mAzHDgTO1MDM/SIrf5xoxKWvePXsxpwmX6MCZ9
         F4ACgM381pK7trjgGZjbRo0il76qDdueskHsd1yoSYDSoCDEZTTzYTxqbko5UXQv+9ci
         PTub+4toE8orV9/mIlqwH1BosVZMmi4b9VMB8ZV+5eJMwqpZn8AbttzkKLVn90nYJYSC
         EqC5fB9jDXqSEvABjwwhat2LZravrbWBrKLr4xEAC/vPaPwuTuI6u8hy1FcUR6WKFu41
         BhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107371; x=1729712171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBs3sIjuOq1Hz73N2mtXShFzbqAoODZKD1Xn+1XWtGU=;
        b=dPe27Ixu8woF+kvCn9JlJVU3UV8xzX77UVqo0rjb3upCuMXX2eTuXbPFcMNoXaBJ0U
         yKjdZiS+7j9WYW4WOToZaed6v/6pTztiFJGQHsgLGxp1obFtSeduix6sWfoFka580z8R
         7Z/UZxPIz8F8OkI39aYA5KCNTM5qxCs+la8++A5rDphME9etCAmcHKFmNUmbl/PJkliJ
         W/17LE1HFSGkVJ41TldBeEkObGm0/dsmQi8LSR7LAZMkKJvm7nmCQa89DJfCPlB0D6XH
         xZk0B8AJLFkF2/dV1Qd2vjFJlWTj47NIg40cbBvd2wgRsXsTXOMuTWB0TWFxVfOAE0In
         Fn+g==
X-Gm-Message-State: AOJu0Ywk0pbT0vIIW4sXPi77phOs9956gflP32NxIt2hHW3Sd+r0HvAM
	C7ZawzbiifOsPQX0bPxpDjyryHGlKt72To+HaIsWLL1uXhpmTCcYIxrGwA==
X-Google-Smtp-Source: AGHT+IEjV5NTb3/i6BacTOuNO7NuidU73LiRasjonyIN+Rv7/nVk0WyjnLLMMLL3nGsUABHqnMYxeQ==
X-Received: by 2002:a05:600c:1c9e:b0:42c:b508:750e with SMTP id 5b1f17b1804b1-431255dae1bmr180110455e9.11.1729107370532;
        Wed, 16 Oct 2024 12:36:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c359casm3159265e9.8.2024.10.16.12.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:36:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] python3-installer: add a patch to ensure RECORD file reproducibility
Date: Wed, 16 Oct 2024 21:36:02 +0200
Message-Id: <20241016193606.3459951-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 19:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205972

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ils.py-sort-entries-before-writing-o.patch | 27 +++++++++++++++++++
 .../python/python3-installer_0.7.0.bb         |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-installer/0001-src-installer-utils.py-sort-entries-before-writing-o.patch

diff --git a/meta/recipes-devtools/python/python3-installer/0001-src-installer-utils.py-sort-entries-before-writing-o.patch b/meta/recipes-devtools/python/python3-installer/0001-src-installer-utils.py-sort-entries-before-writing-o.patch
new file mode 100644
index 00000000000..a6715ed457d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-installer/0001-src-installer-utils.py-sort-entries-before-writing-o.patch
@@ -0,0 +1,27 @@
+From 760ddf50ce559abd67bbdd31797267d00bcddfb3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 1 Oct 2024 19:22:11 +0200
+Subject: [PATCH] src/installer/utils.py: sort entries before writing out
+ RECORD file
+
+This helps build reproducibility.
+
+Upstream-Status: Submitted [https://github.com/pypa/installer/pull/245]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/installer/utils.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/installer/utils.py b/src/installer/utils.py
+index 3e601d6..073297c 100644
+--- a/src/installer/utils.py
++++ b/src/installer/utils.py
+@@ -207,7 +207,7 @@ def construct_record_file(
+         io.BytesIO(), encoding="utf-8", write_through=True, newline=""
+     )
+     writer = csv.writer(stream, delimiter=",", quotechar='"', lineterminator="\n")
+-    for scheme, record in records:
++    for scheme, record in sorted(records, key=lambda x: x[1].path):
+         writer.writerow(record.to_row(prefix_for_scheme(scheme)))
+     stream.seek(0)
+     return stream.detach()
diff --git a/meta/recipes-devtools/python/python3-installer_0.7.0.bb b/meta/recipes-devtools/python/python3-installer_0.7.0.bb
index 9429705b1f8..6aaf1b3a379 100644
--- a/meta/recipes-devtools/python/python3-installer_0.7.0.bb
+++ b/meta/recipes-devtools/python/python3-installer_0.7.0.bb
@@ -6,7 +6,8 @@ BUGTRACKER = "https://github.com/pypa/installer/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5038641aec7a77451e31da828ebfae00"
 
-SRC_URI += "file://interpreter.patch"
+SRC_URI += "file://interpreter.patch \
+            file://0001-src-installer-utils.py-sort-entries-before-writing-o.patch"
 
 SRC_URI[sha256sum] = "a26d3e3116289bb08216e0d0f7d925fcef0b0194eedfa0c944bcaaa106c4b631"
 
-- 
2.39.5


