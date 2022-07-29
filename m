Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6056C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 20:11:54 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.1531.1659125513422868579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 13:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dZaLW+zW;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id p1so5512921plr.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 13:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxqS+rFsid6nJLuuT2zS/jCPrNhoKCx2MoSURrQc4TA=;
        b=dZaLW+zWpju7gTNzgdUNwBX4YYiHVZVVPeK3XuK+TRAJdUCfSuMY9gPskTJd4mYh4N
         22/SVEat9Un4bmzt2196ycT8nrCta27GqtQ8kw+Y1J8kPUpQ1P0xLyjk+iJhF2SDqdbK
         ZpZx5HOTOKHw9zBVwNqyJq0woocQ9YmcFLZRtNbANsiBAZN1Ch/0QSwqecCIMvBmvqHM
         KlWSDn1xByGAN5I33deH8pn1QOdxQo6w8Vd0Hm5vxonuSSdSS5z/bRGJp1UK7jEaiSXX
         4HxBKx5eZAaGvAiWT9UjCGxzS1+TlWuOSM3Eodtkr2h7jtdGj8b/9ZvXp8d/Wv7N1DQY
         nr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxqS+rFsid6nJLuuT2zS/jCPrNhoKCx2MoSURrQc4TA=;
        b=fO+vVj05EpXl42hNPQ5vATiAv4MDTyl2L4xTPcGiITfq2jU612fn/6I2fkSJEjRL0b
         wrWmtDF3NLa5kVtMxFM/bPv2klllBp2gbjeU592nmd1200WbiA+/sh/2GlX57C/TOghv
         Rqu2lEwFDjujyYpE+5tqkDSKuy7TkOaSfx6cSxhERBQuNzrdELXSg7MeGM9kmT0Zu4Ld
         ipSl5FxdZMRs06UOWGqDN3TYnbgddDjmHCqVdqy8BBhM30YmZTKXbGZUR8MjRZ5C0xba
         XP4qJyAQ+WE3zKXmVhMj7EN9xFaROzf9mmtrNMUnkS5ZIqdWHymtzFQ/ZmNvOdIdip2s
         qfrg==
X-Gm-Message-State: ACgBeo1aAl9O72xvLQq551nqqWhg005DFDbNvuR/3i3WPPzezK2IA1el
	0wVwdaiiWaoKJxJnOsUro5oz1bhq/zRGXQ==
X-Google-Smtp-Source: 
 AA6agR4zSCcC51bN454vg6FIRKXTG2SsexXYHob5gyTq8ZnIHMU0+Cfzty5uK021u/KCTAv9K8L0Ww==
X-Received: by 2002:a17:903:1d0:b0:16d:8a0c:39a3 with SMTP id
 e16-20020a17090301d000b0016d8a0c39a3mr5387633plh.88.1659125512521;
        Fri, 29 Jul 2022 13:11:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8ca5])
        by smtp.gmail.com with ESMTPSA id
 cp14-20020a170902e78e00b0016d42244886sm3994520plb.94.2022.07.29.13.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 13:11:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] hdparm: Fix build with glibc 2.36
Date: Fri, 29 Jul 2022 13:11:49 -0700
Message-Id: <20220729201149.1107572-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 20:11:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168675

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...parm-Remove-unused-linux-fs.h-header.patch | 32 +++++++++++++++++++
 meta/recipes-extended/hdparm/hdparm_9.64.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/hdparm/hdparm/0001-hdparm-Remove-unused-linux-fs.h-header.patch

diff --git a/meta/recipes-extended/hdparm/hdparm/0001-hdparm-Remove-unused-linux-fs.h-header.patch b/meta/recipes-extended/hdparm/hdparm/0001-hdparm-Remove-unused-linux-fs.h-header.patch
new file mode 100644
index 00000000000..dd88743d1ec
--- /dev/null
+++ b/meta/recipes-extended/hdparm/hdparm/0001-hdparm-Remove-unused-linux-fs.h-header.patch
@@ -0,0 +1,32 @@
+From c8fc52968f9e97d29ccf6deb348ec02627d74235 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Jul 2022 13:00:40 -0700
+Subject: [PATCH] hdparm: Remove unused linux/fs.h header
+
+this helps fixing builds with glibc 2.36 where mount.h conflits now with
+kernel mount.h which is included indirectly by linux/fs.h see [1] for
+details
+
+[1] https://sourceware.org/glibc/wiki/Release/2.36
+
+Upstream-Status: Submitted [https://sourceforge.net/p/hdparm/patches/52/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ hdparm.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/hdparm.c b/hdparm.c
+index fa21e2f..901bdd8 100644
+--- a/hdparm.c
++++ b/hdparm.c
+@@ -25,7 +25,6 @@
+ #include <sys/mman.h>
+ #include <sys/user.h>
+ #include <linux/types.h>
+-#include <linux/fs.h>
+ #include <linux/major.h>
+ #include <endian.h>
+ #include <asm/byteorder.h>
+-- 
+2.37.1
+
diff --git a/meta/recipes-extended/hdparm/hdparm_9.64.bb b/meta/recipes-extended/hdparm/hdparm_9.64.bb
index 558dd53f8f7..eeb63a27e5e 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.64.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.64.bb
@@ -24,6 +24,7 @@ RDEPENDS:wiper = "bash gawk coreutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
+           file://0001-hdparm-Remove-unused-linux-fs.h-header.patch \
           "
 
 SRC_URI[sha256sum] = "315b956951c3fea027287de204381534217c0bd0f37b4935877fe2db0cab859a"
-- 
2.37.1


