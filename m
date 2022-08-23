Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F625C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:29:08 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.4444.1661293747049798422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uef1qlpq;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y127so11803935pfy.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=jVUB2Y9ZTPx1DuAJ7K8LJnAez6kVkjdMD6xSGySaWQU=;
        b=Uef1qlpqx73u3yCjXWIn3/OCBMvs+6g4gTy3+0DKsRBN47/hXgpPTuqv7QIS/3nBm2
         S/lY3dHjigwxlDu4cWmpjnlIPHPKUswAHNd9/SazjFc3HUlYZ2TbC9WiNvtdnA4K6H5w
         DuAHZIHDQ2pJ7N/maz/u+cRXLsw26pLIN9MP3tNU3garhUqby3sgvzAV2ZPGUlWj38Eo
         Iu06SBh9uUCxURsc5VbiKxePxAgd0TobOAWZOGGl910xkS7Jh43L1BlRRBZeC5gBjsIe
         O1FpdT1BW4YW5yvhjglEQqj85fuUBZyhX5P8U0ySuwZJZzKbQOLaTGBhCnzN3VURripP
         lVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=jVUB2Y9ZTPx1DuAJ7K8LJnAez6kVkjdMD6xSGySaWQU=;
        b=Wt95aS38/hM5jazmD4ap5zKG6D1huOkt7VBTcD75uUMiyPUPvXsh4PJGE46uAw4Yyg
         /8AlaXA6UDSopfBXdyZ9SqJegf/hBIg8C2U/hLLanEAQpm3q+0e3xhuvEv6v1RfBgoQT
         o+PYu49GKXlGVuZmwlZ+yUw+NDX+vsAZx8qfHLiOHzwVYhOrp5FzdsYbaSdV79s/U2gq
         iQI6wBHQMEg/Tgkygviqrldbf+OWbIdyT/3OcZetciR/T/TsPjq/HCioS8wszHSRyZVp
         hP2O83l028GPSmQUS6BcZoRxisbevokasOy4NJ2nYpKuFwfCVMdmCAzX0mh29JlaUKaU
         nBgQ==
X-Gm-Message-State: ACgBeo0vIN4MG079ZQ+EobHwOyjIKx40Gd212tx0aR8Eov0LabBPXufM
	VcSvNrSWzTdg4mIip0LPs/Lq5Tl7FqxJHg==
X-Google-Smtp-Source: 
 AA6agR546daF6AkZiMxadI74o1JPsAhLA/4teJVbt34zfpK5mLiyi8WPo9hJOjqvXcZUCA8uoEMI9A==
X-Received: by 2002:a63:7457:0:b0:42a:f1ed:f624 with SMTP id
 e23-20020a637457000000b0042af1edf624mr3072630pgn.102.1661293746167;
        Tue, 23 Aug 2022 15:29:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 a9-20020a62d409000000b0053645475a6dsm7679550pfh.66.2022.08.23.15.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:29:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] alsa-plugins: Include missing string.h
Date: Tue, 23 Aug 2022 15:29:02 -0700
Message-Id: <20220823222902.1827013-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:29:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169731

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-arcam_av.c-Include-missing-string.h.patch | 25 +++++++++++++++++++
 .../alsa/alsa-plugins_1.2.7.1.bb              |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam_av.c-Include-missing-string.h.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam_av.c-Include-missing-string.h.patch b/meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam_av.c-Include-missing-string.h.patch
new file mode 100644
index 0000000000..ff7745d637
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam_av.c-Include-missing-string.h.patch
@@ -0,0 +1,25 @@
+From b01b176a665ba65979d74922955f51dc4888a713 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Aug 2022 15:21:16 -0700
+Subject: [PATCH] arcam_av.c: Include missing string.h
+
+bzero() function needs this header to be included
+
+Upstream-Status: Submitted [https://github.com/alsa-project/alsa-plugins/pull/47]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ arcam-av/arcam_av.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arcam-av/arcam_av.c b/arcam-av/arcam_av.c
+index 63f9b4e..29fc537 100644
+--- a/arcam-av/arcam_av.c
++++ b/arcam-av/arcam_av.c
+@@ -27,6 +27,7 @@
+ #include <signal.h>
+ #include <stddef.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <termios.h>
+ #include <unistd.h>
+ 
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb
index 62505fee83..9500462d5c 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb
@@ -22,7 +22,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://rate/rate_samplerate.c;endline=35;md5=fd77bce85f4a338c0e8ab18430b69fae \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2 \
+           file://0001-arcam_av.c-Include-missing-string.h.patch \
+           "
 SRC_URI[sha256sum] = "8c337814954bb7c167456733a6046142a2931f12eccba3ec2a4ae618a3432511"
 
 DEPENDS += "alsa-lib"
-- 
2.37.2


