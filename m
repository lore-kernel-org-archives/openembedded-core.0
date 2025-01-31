Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7BBC02199
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 16:58:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.24122.1738342721325997633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 08:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j4Wsh8kE;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361815b96cso15684185e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 08:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738342719; x=1738947519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z51HHkk2Jp0WahwgkBt39YSaXEBTltLWMyHnBH/TP4k=;
        b=j4Wsh8kEOaNognOB92rgLm84/yasZYBcYD9aQZ43KiWbKO01dWwwJMPZCRezUsPrmH
         Rx/U+xBIdHZXMu+j3/wyW+eC5LbSOZYnAHy3v0XgdyY2NjZjLpICsGbNoJmcQfIyc8Ik
         HJHM1zcCqaUqQIh27Tfk0tYbeI7P+aOguEBmQA/woI/qiE98HKphEgJSRwJEbYYtgM2Z
         BPu50QYkT3JG2UOR091AAP5FUUMw4RoiA3TgvxYvBBFmVaEmFnJF/bxtkrYvbuIfX7Xj
         XBleONqnEa7YroL7v1YUNolSMoXZfAB5/4Np+409Sy2JYKkTzvm4aaqh0FXEXs9sF8+d
         EkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342719; x=1738947519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z51HHkk2Jp0WahwgkBt39YSaXEBTltLWMyHnBH/TP4k=;
        b=aIGBfKNdCN6d/ZOgNtyIKgqMbtQmo3DH7gFSA71/s28idxM34b+Ihx1P9ZxagNBM67
         HbHv7h/BuL0+UdIiLyuRRVkxZzeqGnO4P6mRQpd5SVT4SBr03awBZoTcsGF8z26OeBkV
         qhgMrnbSEmUrMA8O8lfKfe6/I5rKiBKpwNyDa3AYWBhEhEnEP7NLSevmNVzV2AXSlkzt
         BZQRHE/8viys9xwJDDWhDUWZNnCCBc+0xxioEaNZN8wMzyoxJHyiSp7xqihpnjptCytG
         ndOzC06DcfGz3J7BSiGciRfVUXtPsdFWLQQG5CqV16yzDsG+rirvm1ouHaiJUyE6F2/e
         E8vg==
X-Gm-Message-State: AOJu0YwQx0TuqznWdcs19+pErKZyr9tw1GhFhXovhn/Z8p9obEv67HT7
	AkSrB+sx1kMLO0M2sV8gf+Si12xHVUgswGd16PAZt3cMCdsd19ePLZS0pRCq
X-Gm-Gg: ASbGncsGmy1udipb6DjfFGm5ZnolZ9VnpaT61gXhwMoCpjmOihPcLBmL3ljARV8w3BO
	cabCIZBrZkje/F6qUaMRxo37Xh6FMte/me8AP8segqJmoI1pZ2/M+UjEeHyrDlh2ffLldVe9ieu
	nP24SD7heJbPawABfcYLSG/L/Kw9vDzunDLPezSmc2xr9FUZPMF6HCniVIehlAE3PvgUDqZkNjf
	LKfGq5VAP1qInPZPE6AQVPDMTSo1PGhCmLGmYelxIkNuKqZ01oeX7c0S4z2YFH+tRU3+f+rKydM
	Sz85GAlmvbf0dmGavJXeYSNr9EzneEWPMy5vSfz3+sGwUDdgvMWTtalY2vc=
X-Google-Smtp-Source: AGHT+IHKT8+anc15WjbKzCKbxjcstCtm5pK9gbqt6HBl6AfHyqbY8dGkoBnG2l4fZPKHargewwaS3w==
X-Received: by 2002:a05:600c:c87:b0:434:feb1:adcf with SMTP id 5b1f17b1804b1-438ea3c1cdfmr25565785e9.25.1738342719068;
        Fri, 31 Jan 2025 08:58:39 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de35csm60422565e9.10.2025.01.31.08.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:58:38 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] alsa-utils: Backport fix for alsa_restore_go/std
Date: Fri, 31 Jan 2025 16:58:11 +0000
Message-Id: <20250131165810.69625-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 16:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210492

Fix the label mismatch which was introduced in the transition from the
temporary test rules:

  udevd[120]: GOTO 'alsa_restore_std' has no matching label in: '/lib/udev/rules.d/90-alsa-restore.rules'

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...restore.rules-fix-alsa_restore_go-st.patch | 42 +++++++++++++++++++
 ...restore.rules-fix-AMD-acp-pdm-mach-l.patch | 35 ++++++++++++++++
 .../alsa/alsa-utils_1.2.13.bb                 |  2 +
 3 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch
new file mode 100644
index 000000000000..ea02fdb8c527
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch
@@ -0,0 +1,42 @@
+From f90124c73edd050b24961197a4abcf17e53b41a8 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Thu, 14 Nov 2024 09:38:49 +0100
+Subject: [PATCH 1/2] alsactl: 90-alsa-restore.rules - fix alsa_restore_go/std
+
+Fix the label mismatch which was introduced in the transition from the
+temporary test rules.
+
+Closes: https://github.com/alsa-project/alsa-utils/issues/280
+Fixes: 8116639 ("alsactl: 90-alsa-restore.rules - add support for AMD ACP digital microphone")
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/f90124c73edd050b24961197a4abcf17e53b41a8]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ alsactl/90-alsa-restore.rules.in | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/alsactl/90-alsa-restore.rules.in b/alsactl/90-alsa-restore.rules.in
+index 85f0b15f4856..dae2ed8ccc8f 100644
+--- a/alsactl/90-alsa-restore.rules.in
++++ b/alsactl/90-alsa-restore.rules.in
+@@ -3,6 +3,8 @@
+ ACTION=="add", SUBSYSTEM=="sound", KERNEL=="controlC*", KERNELS!="card*",@extratest@ GOTO="alsa_restore_go"
+ GOTO="alsa_restore_end"
+ 
++LABEL="alsa_restore_go"
++
+ ENV{ALSA_CARD_NUMBER}="$attr{device/number}"
+ 
+ # mark HDA analog card; HDMI/DP card does not have capture devices
+@@ -21,7 +23,7 @@ TEST!="/run/udev/alsa-hda-analog-card", GOTO="alsa_restore_std"
+ IMPORT{program}="/usr/bin/cat /run/udev/alsa-hda-analog-card"
+ ENV{ALSA_CARD_HDA_ANALOG}!="", ENV{ALSA_CARD_NUMBER}="$env{ALSA_CARD_HDA_ANALOG}"
+ 
+-LABEL="alsa_restore_go"
++LABEL="alsa_restore_std"
+ TEST!="@daemonswitch@", RUN+="@sbindir@/alsactl@args@ restore $env{ALSA_CARD_NUMBER}"
+ TEST=="@daemonswitch@", RUN+="@sbindir@/alsactl@args@ nrestore $env{ALSA_CARD_NUMBER}"
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch b/meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch
new file mode 100644
index 000000000000..2299718d14ca
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch
@@ -0,0 +1,35 @@
+From 6f7ce73159c02b726a6f0fe0acff961c95e337a8 Mon Sep 17 00:00:00 2001
+From: Aaron Ma <aaron.ma@canonical.com>
+Date: Wed, 20 Nov 2024 15:55:02 +0800
+Subject: [PATCH 2/2] alsactl: 90-alsa-restore.rules - fix AMD acp-pdm-mach
+ link
+
+The link name of AMD ACP digital microphones driver acp-pdm-mach
+is acp-dmic-codec. Fix it to make UCM initialize it again.
+
+Closes: https://github.com/alsa-project/alsa-utils/pull/281
+Fixes: 8116639 ("alsactl: 90-alsa-restore.rules - add support for AMD ACP digital microphone")
+Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/6f7ce73159c02b726a6f0fe0acff961c95e337a8]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ alsactl/90-alsa-restore.rules.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/alsactl/90-alsa-restore.rules.in b/alsactl/90-alsa-restore.rules.in
+index dae2ed8ccc8f..5db6080b0dc6 100644
+--- a/alsactl/90-alsa-restore.rules.in
++++ b/alsactl/90-alsa-restore.rules.in
+@@ -14,7 +14,7 @@ DRIVERS=="snd_hda_intel", TEST=="device/pcmC$env{ALSA_CARD_NUMBER}D0p", RUN+="/b
+ TEST=="device/device/acp3x-dmic-capture", GOTO="alsa_hda_analog"
+ TEST=="device/device/acp6x-dmic-capture", GOTO="alsa_hda_analog"
+ TEST=="device/device/acp63-dmic-capture", GOTO="alsa_hda_analog"
+-TEST=="device/device/acp-pdm-dmic", GOTO="alsa_hda_analog"
++TEST=="device/device/acp-dmic-codec", GOTO="alsa_hda_analog"
+ GOTO="alsa_restore_std"
+ 
+ LABEL="alsa_hda_analog"
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
index b681922bbf80..91dcee1453f0 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.13.bb
@@ -25,6 +25,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
+           file://0001-alsactl-90-alsa-restore.rules-fix-alsa_restore_go-st.patch \
+           file://0002-alsactl-90-alsa-restore.rules-fix-AMD-acp-pdm-mach-l.patch \
            "
 SRC_URI[sha256sum] = "1702a6b1cdf9ba3e996ecbc1ddcf9171e6808f5961d503d0f27e80ee162f1daa"
 
-- 
2.25.1


