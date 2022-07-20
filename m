Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7617DC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 19:44:44 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.1716.1658346277033911884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 12:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=FQzGvz02;
 spf=pass (domain: qtec.com, ip: 209.85.167.46, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f46.google.com with SMTP id o7so31996186lfq.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 12:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TihoJP4sitlehQE7f2UhftBS95L+x1aVgzJv9UfB0fk=;
        b=FQzGvz023ijXVtrTcPV2eT4V4U3BJICZ2TQxKHnm2SPovySR6pdXBDx1HgnktM19DI
         Rugoqvj8HhGDccUYHzqKNT8wFdIT9KB0eRviFqxmWAoEgRJT/yxNo3pjWcYAqPdyEzKi
         2zkceUkdMCAE+ZoEkfFD8Adyph/vb2SfCcSGwhbWsMTSYCGvRPmVI3I2ySMy+c+Z59Pb
         njEAkccw4jfSYghCpf7xyQ61aU3nh2MbWSYoUlTcqCKXYDmtr2nLW4D/MbTdBetc2Bpv
         d6h5CztUKHt3OTIC3iXeR5pOpzef82dm1a+7UFs4cDpZT2XYl8Eo+fPw8VhFSn4PvHOG
         clnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TihoJP4sitlehQE7f2UhftBS95L+x1aVgzJv9UfB0fk=;
        b=O9mYmg/1FyNh9hi0qyOvqQz6+Nty7s4hLF4TSeiXrREnYTSDREC6StZ1T5XQxk5cZ0
         CXwDZDDIsgWT/YZCvabrz/yjK8vYbQMoxl8wFbWBDcBPok41cybPNdwkUzT3ws+tzmqv
         3xMWNue5/koyVOFzhxU6yuJk2Q1KoKwRg4n0mMWwRKcxXIaS4X6bWyb7YJQSql1nzBmN
         ifTLfp7jY9wbBnunuMpM7Zzr7pagrfbiXXmCbo6iSBNmakBNPjlvoGN8HfurJ3SI2au8
         rUZ0K2jkM6Yyx+I4LFTBWOj8OhO8TZNWA9smQDxAZbYBVKRlOXquj5tyLgjbn/dVZ6MZ
         8gDA==
X-Gm-Message-State: AJIora+kt5MdvFLYU7pH+BJ1hp/2YgRm0urLeHin1OSscA2czQE3jjdA
	sJw6z1NU/C6Zc8+JIecBSfGwp8bgoWi/uFYPX23TvXRejAoSBkWpzoRZmsEoum8sGVWHUuzm4jU
	wpXSr4mz9hD8GvartK271gmYAEd4t4Mhoz2MErm0AkamJY0nv9lfflyJ+vUY2PFGarfLX1Ex97e
	OCmYd4KHshn2ZZVzc=
X-Google-Smtp-Source: 
 AGRyM1uPI3eNumV+zcixakPO0EDdbnq8dFmo5zKSuYkNeTYeDKXy8cTLUtZFeJ/9gKyoe7deB0UgAA==
X-Received: by 2002:a05:6512:3a8e:b0:48a:6cb1:1f37 with SMTP id
 q14-20020a0565123a8e00b0048a6cb11f37mr3786lfu.327.1658346274290;
        Wed, 20 Jul 2022 12:44:34 -0700 (PDT)
Received: from datops.qtec.com (188-177-43-54-cable.dk.customer.tdc.net.
 [188.177.43.54])
        by smtp.gmail.com with ESMTPSA id
 k15-20020ac24f0f000000b00489e88d6a72sm3980026lfr.198.2022.07.20.12.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:44:33 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	yi.zhao@windriver.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] dropbear: Enable x11 forwarding
Date: Wed, 20 Jul 2022 21:44:16 +0200
Message-Id: <20220720194416.89631-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 19:44:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168374

Enable X11 forwarding whenever X11 is part of the DISTRO_FEATURES.

Add backport patch to fix X11 forwarding in the current 2022.82
version.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta/recipes-core/dropbear/dropbear.inc       |  5 ++-
 ...d-failure-use-DROPBEAR_PRIO_LOWDELAY.patch | 27 ++++++++++++++++
 ...efault_options-Enable-x11-forwarding.patch | 32 +++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0008-default_options-Enable-x11-forwarding.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index e170587d08..7ee808db61 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -22,7 +22,10 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.socket \
            file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
+           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' \
+                file://0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch \
+                file://0008-default_options-Enable-x11-forwarding.patch', '', d)}"

 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
diff --git a/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
new file mode 100644
index 0000000000..994bbdd42a
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
@@ -0,0 +1,27 @@
+From 0292aacdf0aa57d03f2a3ab7e53cf650e6f29389 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sat, 23 Apr 2022 22:33:31 +0800
+Subject: [PATCH] Fix X11 build failure, use DROPBEAR_PRIO_LOWDELAY
+
+Upstream-Status: Backport
+
+---
+ svr-x11fwd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/svr-x11fwd.c b/svr-x11fwd.c
+index 353cb12..5d9e6a9 100644
+--- a/svr-x11fwd.c
++++ b/svr-x11fwd.c
+@@ -206,7 +206,7 @@ void x11cleanup(struct ChanSess *chansess) {
+ }
+
+ static int x11_inithandler(struct Channel *channel) {
+-	channel->prio = DROPBEAR_CHANNEL_PRIO_INTERACTIVE;
++	channel->prio = DROPBEAR_PRIO_LOWDELAY;
+ 	return 0;
+ }
+
+--
+2.35.1
+
diff --git a/meta/recipes-core/dropbear/dropbear/0008-default_options-Enable-x11-forwarding.patch b/meta/recipes-core/dropbear/dropbear/0008-default_options-Enable-x11-forwarding.patch
new file mode 100644
index 0000000000..b604c0e850
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/0008-default_options-Enable-x11-forwarding.patch
@@ -0,0 +1,32 @@
+From bbdd4e27431df123e9f39c5fea6d1a90e90a4385 Mon Sep 17 00:00:00 2001
+From: Daniel Gomez <daniel@qtec.com>
+Date: Wed, 20 Jul 2022 18:07:51 +0200
+Subject: [PATCH] default_options: Enable x11 forwarding
+
+Activate dropbear X11 forwarding feature.
+
+Disabled by default at rev: a27e8b053e520117b20993b8e51103c5bd22da8c
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Daniel Gomez <daniel@qtec.com>
+---
+ default_options.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/default_options.h b/default_options.h
+index 1a6a911..cd637a1 100644
+--- a/default_options.h
++++ b/default_options.h
+@@ -60,7 +60,7 @@ IMPORTANT: Some options will require "make clean" after changes */
+ #define DROPBEAR_SMALL_CODE 1
+
+ /* Enable X11 Forwarding - server only */
+-#define DROPBEAR_X11FWD 0
++#define DROPBEAR_X11FWD 1
+
+ /* Enable TCP Fowarding */
+ /* 'Local' is "-L" style (client listening port forwarded via server)
+--
+2.35.1
+
--
2.35.1


