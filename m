Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.662.1592435250396557824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 16:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EXeZTZ/8;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id k22so2988263qtm.6
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 16:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=74GcGCWmMpQCQpyT6cRcH3U944hvvTMmO86hblVEDK4=;
        b=EXeZTZ/8BW4iFKY70rEEcHvaPcUXefCcKiuJmBE+mcFnLWor8dfuMGMyYx8oVBcrZw
         O9PgsP1jc/KHpiALB2pt+2KXvy7mScKnaM0bZRIU3J6sJUV3ZiQq/jcf25L5lMYlhp3m
         YlqRzZizzJTY6teypIwk+7slcIDiWeUbz7/6+18xJHF8U/856D/kPgWyfnDZRv1dZklb
         s0hEEUKpfunadmelMUy+IbHnIZg98xXIIsCBS4P/2hUUEQICmh+K7GyxQmL+ar3LaAUx
         QKkmjF7JOdg5GbijP/vHnkwoBnFIf7ElxDDLbjkjdS1nTk6+mfDMsxVCJC9iTj+tosUT
         32UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=74GcGCWmMpQCQpyT6cRcH3U944hvvTMmO86hblVEDK4=;
        b=jJ5IXhoTG7bb4bffjgqTSqq3hRcWc5NVnyTcdPB/ewcQ7V7faAbvfXTeS4UufXrzcx
         W1MyRwQEpLKNcoxsuBCcrs1hxbsb0DKgb4jI4uaehXrVnvt/c3fWou3yl/k94BifrNIA
         FKWMJH8Jcn3FCiuOmSwa51X8o7KwrshgohE+R2WxRFjHF/08Tip2mjGgeq/pYy56xrUl
         oAgSLFT220VGDUTm5Y/0aYWcvpliz9s8lEe0rWQnRGQgijuEoCPjZs4DMBEERRHTjxUJ
         SoHmARkTIE81HPFNF3SGcSLSAs10KO8cM8uWgIufpSYB5VIX3SSoetrdHu2id/m0lsS/
         JMlg==
X-Gm-Message-State: AOAM533XWF8xI/Ez57ulDp3oDepM43gUkiN5B9DpY7mZKMIbkBtX6axj
	ACPYEvMhp9Fa1WQzICCUKSimE5zf
X-Google-Smtp-Source: ABdhPJyHuM2rae2Ci61Qal6qYOdBydX8hPIgtDNrVAoFZA1qGohNTkrrKD2KXBFQCq4BiFLyo2eHFA==
X-Received: by 2002:ac8:6b53:: with SMTP id x19mr1640868qts.106.1592435249279;
        Wed, 17 Jun 2020 16:07:29 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from localhost.localdomain (mobile-166-176-187-11.mycingular.net. [166.176.187.11])
        by smtp.gmail.com with ESMTPSA id z19sm1497655qtz.81.2020.06.17.16.07.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 16:07:28 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools
Date: Wed, 17 Jun 2020 16:07:10 -0700
Message-Id: <20200617230710.9163-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

Both grub-native and grub-efi-native included packaging for the
grub-mkimage and grub-editenv tools, which prevented concurrent
installation of both the grub-native and grub-efi-native packages.
This caused errors on image generation with wic when populating
partitions with both legacy and efi boot support, so resolve this by
removing the duplicated tools from grub-efi-native and add a
runtime dependency from it to grub-native.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index b9d6225d27..ed43dee152 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -6,6 +6,7 @@ GRUBPLATFORM = "efi"
 
 DEPENDS_append_class-target = " grub-efi-native"
 RDEPENDS_${PN}_class-target = "grub-common virtual/grub-bootconf"
+RDEPENDS_${PN}_class-native = "grub-native"
 
 SRC_URI += " \
            file://cfg \
@@ -61,9 +62,7 @@ do_install_append_class-target() {
 }
 
 do_install_class-native() {
-	install -d ${D}${bindir}
-	install -m 755 grub-mkimage ${D}${bindir}
-	install -m 755 grub-editenv ${D}${bindir}
+	:
 }
 
 do_install_class-target() {
-- 
2.17.1

