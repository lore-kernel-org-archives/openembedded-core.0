Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC437C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 10:11:05 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.52117.1658311860646436768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 03:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QVWYxsC/;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 19so20585472ljz.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 03:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXS5NXCbtWfRAdSBdl7M4qGIQvfuWBBE3XBTD7ItKXQ=;
        b=QVWYxsC/cesiDu+ilEb1PMg/Se/1WkeWZAHPPBl/JUoOsqlHHaJcTrLGmYuOSbZbLN
         0jhp19U/vDw7MzySkQYH/tVQeb/3+VyKQU1OfOIoN++HydngPxkelNm/FF/t7AVnDH5S
         InX+/nYc570xiiyXAYdH+sdrO2SZynTdz0DKxuFJ0lsGixPJkq/yutYmoWHyUG5YfFBP
         4hFJrv1gYzCi7o+PEK7ozFt75x96o4D5B2Vrg8MdjDFnUyFWgIuGp3+xFP7CvfMjs16D
         DmqSsscIIdnPjc+mu1fcaKNOUd/9RJ1CjQ4w3l022+KPMliyRhzCyq41c6Y3qJwVQLT6
         17vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXS5NXCbtWfRAdSBdl7M4qGIQvfuWBBE3XBTD7ItKXQ=;
        b=jsiENv0cCo2iaVMsDzoXtLdvKAVb1lInY73Aa5SbDHhyyRPEhKN7FRRdJuXXzR6Dch
         msCSBuduT/XMRrbfYMma2RRJolthaaZx8d+Pa1FvTBWHbqZxJsYsmd8yakjuGrAzhsNF
         4DzR/3xCp5IMw1H4lwk3SVPDiTC/bOLJ3L3rXPnbNz/X3fpgwbAf+GStRLwOOwWtM7Of
         RQuVx0Tk0IhBdlUuSIrPx0UCvLhFNphbHojaEDrFy/FVSMLZBfR8Igtwn/KjiLRF7ep7
         63nIKNbQ9OdiUV8k+Mvzet7j6l1QAdQO/yQIlPWZOkTHE46aCrdMMPNo95R2Y/4Ei4uH
         PjYg==
X-Gm-Message-State: AJIora+WMit09AxMNLw5B21IU8XMI76oRsEVZI5qZTkYhoa8I/bjZ/jf
	R6i7TxkTWy6yvz9YQW2AJiWvfuoKd3Y=
X-Google-Smtp-Source: 
 AGRyM1sf4wREzZs/4jKhsYu/P1ao3GTAgmpRdA1hqsl5nY+914YBaMDKkihgzwceJth3s/b8zZKHrw==
X-Received: by 2002:a2e:3112:0:b0:24f:132a:fd71 with SMTP id
 x18-20020a2e3112000000b0024f132afd71mr16323554ljx.522.1658311858121;
        Wed, 20 Jul 2022 03:10:58 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 c8-20020a197608000000b0048724eb8cffsm3693440lff.255.2022.07.20.03.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 03:10:57 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] udev-extraconf:mount.sh: fix a umount issue
Date: Wed, 20 Jul 2022 12:10:51 +0200
Message-Id: <20220720101051.185537-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 10:11:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168357

From: Ming Liu <liu.ming50@gmail.com>

Only touching /tmp/.automount-$name is not good enough, it must contain
the mount name, otherwise umount could not get the path from it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 43acb3a7a0..b7e86dbc0e 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -89,7 +89,7 @@ automount_systemd() {
         rm_dir "$MOUNT_BASE/$name"
     else
         logger "mount.sh/automount" "Auto-mount of [$MOUNT_BASE/$name] successful"
-        touch "/tmp/.automount-$name"
+        echo "$name" > "/tmp/.automount-$name"
     fi
 }
 
-- 
2.25.1


