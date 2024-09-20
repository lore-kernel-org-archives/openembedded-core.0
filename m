Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD75CCF9C62
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 18:41:42 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.25811.1726857698196267615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 11:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=PNVHiWHk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a9aa913442so216410685a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1726857697; x=1727462497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6VNpY6ZcLQzC9OeI4B1N9H0wEJbrqZOj9wGU1yl4KwM=;
        b=PNVHiWHk3LU4+0BH3KUYs/Q4AkBcKEdEkLcH95ExgkJFErNoUZ4KzKKPYMzEt1ssf7
         GeMt8PO+adcWJlJ93gCAlC7mdZmQoAC80R/KpSgJnF+pfXBZLhf5vi39xKzt9Nz9nDGk
         FyKZ1vMC6x/diiNGL0ynFDCFaz542oEzCNoU0KO5I7SggED/yIex6SK5y7hcm56V5PC2
         TZDAAYdEhl2SICcmkjwoE5sn+K8tR6js2tvLSryKUFtWGvJYujmyYzTBAi3S1iRfPsP/
         xJl+wyx9b4aWtXC1clV4govoCn2ca6fhgmqjhXEeS33PQGAQsHM+VuY5h7KeURp9L2Io
         s24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726857697; x=1727462497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VNpY6ZcLQzC9OeI4B1N9H0wEJbrqZOj9wGU1yl4KwM=;
        b=Bg5f4wmCkJBznYuo7aWf/fxzDQKnYVke+OBrBXRvhHpzS7H3Q2VaNdkQEX1veJe2jZ
         WWwUuyq0pQXmgqD7JBpX6vpqIvsmkJS/s5HKydQt2EbYU0l81eK1auHfXXVo02tF4EI5
         m/fVfxJPIgz1Yu1ACsMMYsG5ytlU1hrTBZJNWXcJOkSQjPbvTNZrBq5/KlpiKGeE6yZi
         oduYB/E+dCUJlnDBb2G9xafIQ3SxwXmpue7de6PVYGjn8p5lUeBI0bfkqoWtYDc5V0+K
         HFHWqPC0W+kveW0c+hWSOdqlPuqn+8RvSecqD1CRLp6HF99kqI90ghD3qWCj9NdwPnrr
         NEYA==
X-Gm-Message-State: AOJu0YzcSGZSrTqn4cfuVQDFi1EYI18dB4aS0nNkJcvW08lNLUDl22GI
	1b9qsRAHZInRXS80UMYXbRQMBtbCl6tIe81b5rtXkEipFArMJUgbF9wlZ6Rcv4CGj2nXcIOTZvw
	=
X-Google-Smtp-Source: AGHT+IHf0YidKRi/B0ZvsHR2ZONConBgNoQTtHlQqZc2pNKhmT2KRVaSKArrrPlnYVPH2gtgaOFWjg==
X-Received: by 2002:a05:620a:4005:b0:7a9:a661:aa63 with SMTP id af79cd13be357-7acb8210837mr662168985a.52.1726857696895;
        Fri, 20 Sep 2024 11:41:36 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb07ea4absm211787585a.20.2024.09.20.11.41.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 11:41:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] default-distrovars: Have KERNEL_CONSOLE reference SERIAL_CONSOLES
Date: Fri, 20 Sep 2024 14:41:35 -0400
Message-Id: <20240920184135.789227-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 18:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204763

Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
(or something else).  These are usually defined by the machine config
file as SERIAL_CONSOLES, which has one or more entries.  Take the first
one of those instead of ttyS0, but default back to ttyS0 if nothing is
set.

Also, use this variable in the efi wic file instead of "ttyS0".

This includes revisions suggested by Quentin Schulz.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/classes-recipe/image_types_wic.bbclass     | 1 +
 meta/conf/distro/include/default-distrovars.inc | 3 ++-
 scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 86f40633ebcb..db598e874ad7 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -26,6 +26,7 @@ WICVARS ?= "\
 	INITRD \
 	INITRD_LIVE \
 	ISODIR \
+        KERNEL_CONSOLE \
 	KERNEL_IMAGETYPE \
 	MACHINE \
 	PSEUDO_IGNORE_PATHS \
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 7554081e8b1a..4d6ddc45b3de 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -1,7 +1,8 @@
 QA_LOGFILE = "${TMPDIR}/qa.log"
 
 OEINCLUDELOGS ?= "yes"
-KERNEL_CONSOLE ?= "ttyS0"
+# if SERIAL_CONSOLES is set, take the first device entry.  Otherwise use ttyS0 as the default
+KERNEL_CONSOLE ?= "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1]) or 'ttyS0'}"
 KEEPUIMAGE ??= "yes"
 
 DEFAULT_IMAGE_LINGUAS = "en-us en-gb"
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index 9f534fe18471..5fa6682a9e10 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
-bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0"
+bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=${KERNEL_CONSOLE} console=tty0"
-- 
2.39.5


