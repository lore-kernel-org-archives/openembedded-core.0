Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9C9C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 13:38:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.54045.1658324300461248476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 06:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vi8NpraN;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id d16so26152156wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vntZAZhG9UP+P/W7ZVmO/Md8AeysbIUaSQuM6RBykXM=;
        b=Vi8NpraNgs2LCgUc6U3UHlXhkmZVXlyex+o6FwmYlhB9jJlo1+vXJrZBuFiGvFVgyK
         Cd96UGp2YRSFu60zAE+5qe/aa0B+wbpWInwFP/n8B/RTfebjxoPb0qg5iK1bwv+20xEE
         KqFCvBui5DH1D36QU+pRY4/4thHJFSDSl/LUacdgyqhgP2GbJPi0c8O6Uq73gRRDxd6x
         8agPsQmfXgxLbdM5F0VIVnTmoOq/5f30S0eMJWJ/zGmJv4zDq4VDLtranQz0rZhNdbRC
         hqCJP/OKaifdMdUGB8zZU3XMypNyAct9Rgi9HMIQZkbKhQMn8FkKFGbtFaBDSvNTlZvs
         wp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vntZAZhG9UP+P/W7ZVmO/Md8AeysbIUaSQuM6RBykXM=;
        b=BoJsjLIUlowd8JcuZdhKdapi5gbouMiD8Y11y7wh7Ld45K50M7gCjsrpyCP3smPCg/
         ykRws2DUWHfLl02r86qACtFxrIjhINeLI/i4CfcfLBYBsTpg4JSl2XOjtT8l1HyPLxvY
         pQ1mkQ+W5eThXO4ZFmcYAvnr8+TsUm4Vt9DccNyOogEeNMVuRbVnTGogVkMzMm29DNYL
         b8j9THLSaqGtlQBn0q5hrYcabfNS8afwKEEbJGWfKdWAUE5cVJXMBCpAJR3ELhPmTLyz
         G/CXQb0ZpjQ9j5NCs5tkf4f3ObDHt/XlVsYFd9plI9B8Pewa3KtxtOh/ZCrIyPmRbSCZ
         gIvw==
X-Gm-Message-State: AJIora8Jb5jdBbphYwG/h9ONA3OOEk1elUpUQzINbNzJwxdGbBZd6NtL
	kkMghzTx+oTL6+28q3Fwt1PXpK33xqk=
X-Google-Smtp-Source: 
 AGRyM1sq4sywtDqxNyl3nzxc5JqvWjNpF+LsY3C+4fX2WJnpSl8vK3xSkXe6N/h/JBG+FcJGnz1S1Q==
X-Received: by 2002:a5d:598e:0:b0:21d:86b2:f35 with SMTP id
 n14-20020a5d598e000000b0021d86b20f35mr31908445wri.54.1658324298727;
        Wed, 20 Jul 2022 06:38:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b0039db31f6372sm3042658wmq.2.2022.07.20.06.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:38:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] xf86-input-keyboard: remove the recipe
Date: Wed, 20 Jul 2022 15:38:11 +0200
Message-Id: <20220720133811.3433277-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 13:38:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168363

It has been superseded by libinput/evdev on Linux, and upstream specifically
errors out on Linux in latest release:
https://github.com/freedesktop/xorg-xf86-input-keyboard/commit/7e366936d7b7d6c3b4d9c1554908ad20eef74a27

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc            |  1 -
 .../xorg-driver/xf86-input-keyboard_1.9.0.bb        | 13 -------------
 2 files changed, 14 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ac1a1ea1a7..e20275c674 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -841,7 +841,6 @@ RECIPE_MAINTAINER:pn-xdpyinfo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xev = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xeyes = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-evdev = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xf86-input-keyboard = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-libinput = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-mouse = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xf86-input-synaptics = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
deleted file mode 100644
index 1896fff9f9..0000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- keyboard input driver"
-
-DESCRIPTION = "keyboard is an Xorg input driver for keyboards. The \
-driver supports the standard OS-provided keyboard interface.  The driver \
-functions as a keyboard input device, and may be used as the X server's \
-core keyboard."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
-
-SRC_URI[md5sum] = "a3a3f0dd32361dcdbd406e894dafe090"
-SRC_URI[sha256sum] = "f7c900f21752683402992b288d5a2826de7a6c0c0abac2aadd7e8a409e170388"
-- 
2.30.2


