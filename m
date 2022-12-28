Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC378C4708D
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.176132.1672213052771447699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B0g6AxGB;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bs20so12121411wrb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UtC6bGLeGD36Hoypne/ROVZlx95nuyoDewfI3N0DOP4=;
        b=B0g6AxGBowXI9LvHwoLmSWyXc0ra4duNmgWzHJHFp/kInNzwhsF3svmAF3lNGPwQ3B
         wl7oyGxUufjUYiK946AT2+Zy4AFyDRYDZ2lFgDSZCendNcaUnHGM+uBkavigzfjfq+FU
         Qve0wKwzM4e54OkrbH2tUKoF+B3wnMjiDh1QY944ETnK7iYyfjnBhbz5P+6+ZCUCZcXp
         8YOBKRJLqBU931/JYe3OYroi2wi4/1IV6rgWXJBhNVfR2+/V9qSym2wjc/Yr/2SxJol+
         GuQ6WiGOllKd5NdRhG2pbEkhm3WTPnnhIyXMHY3Lzm/cMrPaTVFstb8QNZaBGdWc25CB
         xYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtC6bGLeGD36Hoypne/ROVZlx95nuyoDewfI3N0DOP4=;
        b=tUMs72suPLjZsBoQSrF5Mn8ibWtx2QU94+Rq/XxbmFQogkpL5wdGb6H6C9K3eCx3mB
         glx0nHoXZBou+o1MKVdLkFtqVuvbf568fPVM+U/MBacOTizr+CCM9hvkggP3YDop5RjM
         uXeS+By8+P8OG8nupg/mfR07emvJHCPNaSMM1W9cKtJuFQr94fKTmkRGodBxYMtwXRh5
         MjoStfXvsEfa9p4uOYEPLZlT+nTo3bCCINV8ACZq7+CEecsftgdDKnylIsPRYY17RLil
         JaT/sIaCS1wjZzFGl+4DlsAUR+L8xWQfnqZ6lZJ8ITXVIfybk7hXpFN9/w/MggS7ETMd
         7ugw==
X-Gm-Message-State: AFqh2kp6T1Nwv4NxI1Pl5KwzaDURgtqihzoWCb433cIKPp1+WdCphxee
	F7MWe7hevdLabO+5J2Kp3fsgCP+I0Z4=
X-Google-Smtp-Source: AMrXdXvfa5DKXaqJvO0MYva5MKx+MDmDQu5DsM5A3iq8zbCMxZetKckxckoLBKAymE2ZrNDtSQMWOQ==
X-Received: by 2002:adf:cd82:0:b0:24d:867f:10e3 with SMTP id q2-20020adfcd82000000b0024d867f10e3mr17934353wrj.0.1672213049426;
        Tue, 27 Dec 2022 23:37:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/25] systemd: update 251.8 -> 252.4
Date: Wed, 28 Dec 2022 08:36:57 +0100
Message-Id: <20221228073721.3454255-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175042

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../systemd/{systemd-boot_251.8.bb => systemd-boot_252.4.bb}  | 0
 meta/recipes-core/systemd/systemd.inc                         | 4 ++--
 .../systemd/{systemd_251.8.bb => systemd_252.4.bb}            | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_251.8.bb => systemd-boot_252.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_251.8.bb => systemd_252.4.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_251.8.bb b/meta/recipes-core/systemd/systemd-boot_252.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_251.8.bb
rename to meta/recipes-core/systemd/systemd-boot_252.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3bb6b0efe6..9d747ef64d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,8 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "ae8b249af4acb055f920134f2ac584c4cbc86e3b"
-SRCBRANCH = "v251-stable"
+SRCREV = "4b48117716f84751dc6c8ee16c94de9858eaef4f"
+SRCBRANCH = "v252-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
 
diff --git a/meta/recipes-core/systemd/systemd_251.8.bb b/meta/recipes-core/systemd/systemd_252.4.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_251.8.bb
rename to meta/recipes-core/systemd/systemd_252.4.bb
index 8f2fb90455..3271b225fc 100644
--- a/meta/recipes-core/systemd/systemd_251.8.bb
+++ b/meta/recipes-core/systemd/systemd_252.4.bb
@@ -602,6 +602,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/resolv-conf.systemd \
                 ${sysconfdir}/X11/xinit/xinitrc.d/* \
                 ${rootlibexecdir}/systemd/* \
+                ${rootlibdir}/systemd/libsystemd-core* \
                 ${libdir}/pam.d \
                 ${nonarch_libdir}/pam.d \
                 ${systemd_unitdir}/* \
@@ -616,6 +617,7 @@ FILES:${PN} = " ${base_bindir}/* \
                 ${bindir}/timedatectl \
                 ${bindir}/bootctl \
                 ${bindir}/oomctl \
+                ${bindir}/userdbctl \
                 ${exec_prefix}/lib/tmpfiles.d/*.conf \
                 ${exec_prefix}/lib/systemd \
                 ${exec_prefix}/lib/modules-load.d \
@@ -658,7 +660,7 @@ INSANE_SKIP:${PN}-dbg += "libdir"
 INSANE_SKIP:${PN}-doc += " libdir"
 INSANE_SKIP:libsystemd-shared += "libdir"
 
-FILES:libsystemd-shared = "${rootlibexecdir}/systemd/libsystemd-shared*.so"
+FILES:libsystemd-shared = "${rootlibdir}/systemd/libsystemd-shared*.so"
 
 RPROVIDES:udev = "hotplug"
 
-- 
2.30.2


