Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3DEC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 15:47:12 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.9119.1657813630841933768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 08:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JBYL81lL;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 19so2645822ljz.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 08:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hI9h24IdhXVf7/bV+IvHtr4hV+tOPkpukn8jVMU/cGw=;
        b=JBYL81lL1jLnSVibXTuyCMzkIqYAgUl+OpCDFYZXWRUsv/XzjyDympPjYIYExo1iOi
         1evbyRVMF1nvSytvdrWqTst2SB3NOm3G+gco24457sCMThCRXaFyK1ncYH2iJTQvkrQ5
         A1TbLEihSc6EbIrF0tZhF+eDjKp/UC43Smnb3nFqf79q2blDBHlgHTijlLomIu4Oqoq4
         CCdJFhoClWIHS4VWHa2QacWczxMyoSBTBjSWhDQZ8ulUYVj3rmn+h+2gzZ1V2I231Rt1
         +9+VcgQq1/ikhGfu+TbXJkUf/RC19uLJv+cKWjxNHRCW8aULr7mnirg1bRvTEt1qPN6G
         5FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hI9h24IdhXVf7/bV+IvHtr4hV+tOPkpukn8jVMU/cGw=;
        b=joFyX+es1z06yPEn0/eBU/gm/QaSVEUgABXom7ftJgHaAxA4p7fC6ZHlUVwjByWND+
         tNdvV9IaTJhXnd+a7vVm8I3iWxCrJBAR5AAKK7jviFCrZmeAmucYIbflHYJljDW1GdGJ
         VLOSuDwROQDekEXeflAm0uBSWbYFN5bSV0PueF72ndElFqcfkVhYzEXfG3nX/H7Woi+M
         HSz5YPJQGYyCu3WfOEGR5l4AehTNmc60zH3Q/AED0LNy7UjQKwfkWAWLbKzqyT+8dEVT
         ef4zEy0d2hRfoqDWP3oPxpdPUAG7emPPhG0DMHteiEOnNgVNX4xkE8O/httwgNz6Y+ek
         sNug==
X-Gm-Message-State: AJIora/iRfmN5BQY3y9B8MAXa8ifxqcLjqbcGREJlnUVkVgVIsiMKyoa
	HfnhYXnkj/3TMkP2t+iPZ6disSImOr8=
X-Google-Smtp-Source: 
 AGRyM1vIaf/msQRlF3jdDfYc0CtR+AknZsBm084ozED9LrFTRgoMbnHnb67YdPrvzfbm/i0aLVK4TQ==
X-Received: by 2002:a2e:bc18:0:b0:25d:735c:b57f with SMTP id
 b24-20020a2ebc18000000b0025d735cb57fmr4852637ljf.118.1657813628506;
        Thu, 14 Jul 2022 08:47:08 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:236:2d61:212f:bf66:41d7:6031])
        by smtp.gmail.com with ESMTPSA id
 o22-20020ac25e36000000b00482f206b087sm418923lfg.39.2022.07.14.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 08:47:08 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] udev-extraconf:mount.sh: fix path mismatching
 issues
Date: Thu, 14 Jul 2022 17:47:53 +0200
Message-Id: <20220714154753.2071535-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 15:47:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168037

From: Ming Liu <liu.ming50@gmail.com>

Since commit f077befd5f36ad88623aaf6a38b1a837ecb18650:
[ udev-extraconf: let automount base directory configurable ]

the mount base directory was configurable, we need drop 'run-media'
usage as well, change to figure it out from MOUNT_BASE.

Also 'get_label_name' function needs to be called ealier in
automount_systemd before checking '/tmp/.automount-$name', otherwise
they would never match.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 8b6ce77741..43acb3a7a0 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -40,11 +40,14 @@ automount_systemd() {
     name="`basename "$DEVNAME"`"
 
     # Skip already mounted partitions
-    if [ -f /run/systemd/transient/run-media-$name.mount ]; then
+    if [ -f /run/systemd/transient/$(echo $MOUNT_BASE | cut -d '/' -f 2- | sed 's#/#-#g')-*$name.mount ]; then
         logger "mount.sh/automount" "$MOUNT_BASE/$name already mounted"
         return
     fi
 
+    # Get the unique name for mount point
+    get_label_name "${DEVNAME}"
+
     # Only go for auto-mounting when the device has been cleaned up in remove
     # or has not been identified yet
     if [ -e "/tmp/.automount-$name" ]; then
@@ -61,9 +64,6 @@ automount_systemd() {
         grep "^[[:space:]]*$tmp" /etc/fstab && return
     done
 
-    # Get the unique name for mount point
-    get_label_name "${DEVNAME}"
-
     [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
 
     MOUNT="$MOUNT -o silent"
-- 
2.25.1


