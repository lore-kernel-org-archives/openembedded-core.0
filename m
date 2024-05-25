Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A450CC25B7A
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 08:44:25 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.7683.1716626658720192714
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 01:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VL/MqH1k;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so82549021fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716626656; x=1717231456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd1tz6mJYBENG2JWdqX4C7YyrXmoT/nyQfOJIzMSZdk=;
        b=VL/MqH1khaeLib91yLKLEw7OB7uy1qlTHuSAf2EAiuQobYt3jOj44bipL7SnPsY013
         2z2LWE6GsCkmcMjpy/0JUr4YlQez1vQmRuqhCQNC/9ywuAo3Cq3A0EVyrreQn3C/1pJm
         QbJll/pUC2Ycinh+eEv01iMQhZSCcDrTR8ehJTA8JTao24p7CrP59K92kXKeG4dB1lRM
         lJlAQAQ/OH0xHImfSM//276p4bmAivZavzeOBiWZjOx7LgOhjFwmPleE2gSjkG5pL9ZY
         nUEUSCJTqy5Vd5zpq6fuyQP7HoCPRZP3NgbmJ8cK5HWr+eX5ie/m6m2YWibktopNtblV
         EG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716626656; x=1717231456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vd1tz6mJYBENG2JWdqX4C7YyrXmoT/nyQfOJIzMSZdk=;
        b=I9/hXvchzlIpPRtgfVaovU1OysW4ZjlhEMAlMz4tQn5fVdXhDoE0pKM0UfGEEUk1Iw
         8NHxXNvZchjTno+DI7X3NtmGTovOIimGaoIEuYRbd6OlE8S6FXPgMovXzQL+3wMpfFiK
         HqvWLEH9fKFcZW0/5Qw+vWWZ6aIbec47AUCHJ9dlqX25yD33Mgbnothp3/1o4hfKccEp
         coEqZmXx6GCS9E8LN8RBy3VDP0rSm/Cm9ECYjx2ZFeeggY7+iKcQsdUmc7KHfzf4/bcy
         wawJakKhfTCUGteLhKNz5Oe5bal8SHKK3fZ89JfCHsn2VYlXHIc6IEX2373U8jWf2vtS
         cSwQ==
X-Gm-Message-State: AOJu0Yz7nAnUSjG+P8igk5q2E7BC+HjnO2IMiZPq4V8coIUwwK3Sp/rp
	0g961gS4vN0g+GvY68TPZfhGT+FjQgQY6kbfjfY7GymL3JAZFzkrvKKV6w==
X-Google-Smtp-Source: AGHT+IGb+dhF+tquiknUJHCoMYmGlmTu96qPyZKO1BlpnDRU8zzJqJsGaPiMc2UhT3kZgkWg1UqgwA==
X-Received: by 2002:a2e:3c0b:0:b0:2e7:a04:4ee0 with SMTP id 38308e7fff4ca-2e95b27699fmr24207171fa.46.1716626656250;
        Sat, 25 May 2024 01:44:16 -0700 (PDT)
Received: from localhost.localdomain (c80-216-168-104.bredband.tele2.se. [80.216.168.104])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd1cb0sm6197871fa.91.2024.05.25.01.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 01:44:15 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 2/2] image-bootfiles.bbclass: new class, copy boot files to root filesystem
Date: Sat, 25 May 2024 10:50:23 +0200
Message-ID: <20240525085023.6042-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240525085023.6042-1-marcus.folkesson@gmail.com>
References: <20240525085023.6042-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 08:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199867

image-bootfiles class copy files listed in IMAGE_BOOT_FILES
to the IMAGE_BOOTFILES_DIR directory of the root filesystem.

This is useful when there is no explicit boot partition but all boot
files should instead reside inside the root filesystem.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 meta/classes/image-bootfiles.bbclass | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/classes/image-bootfiles.bbclass

diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
new file mode 100644
index 0000000000..29a38ac631
--- /dev/null
+++ b/meta/classes/image-bootfiles.bbclass
@@ -0,0 +1,38 @@
+#
+# SPDX-License-Identifier: MIT
+#
+# Copyright (C) 2024 Marcus Folkesson
+# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
+#
+# Writes IMAGE_BOOT_FILES to the IMAGE_BOOTFILES_DIR directory
+#
+#
+# Usage: add INHERIT += "image-bootfiles" to your image
+#
+
+IMAGE_BOOTFILES_DIR ?= "/boot"
+
+def bootfiles_populate(d):
+    import shutil
+    from oe.bootfiles import get_boot_files
+
+    boot_files = d.getVar("IMAGE_BOOT_FILES")
+    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
+    boot_dir = d.getVar("IMAGE_ROOTFS") + d.getVar("IMAGE_BOOTFILES_DIR")
+
+    install_files = get_boot_files(deploy_image_dir, boot_files)
+    if install_files is None:
+        return
+
+    os.makedirs(boot_dir, exist_ok=True)
+    for entry in install_files:
+        src, dst = entry
+        image_src = os.path.join(deploy_image_dir, src)
+        image_dst = os.path.join(boot_dir, dst)
+        shutil.copyfile(image_src, image_dst)
+
+python bootfiles () {
+   bootfiles_populate(d),
+}
+
+IMAGE_PREPROCESS_COMMAND += "bootfiles;"
-- 
2.44.0


