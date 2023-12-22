Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19ABC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 06:08:43 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.16373.1703225318923365833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 22:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VDzWnXWK;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d422c9f894so769265ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 22:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703225318; x=1703830118; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFx33F3nlzEZieL1aK02WAAZdsSK/y5aYSWcfqCB1qM=;
        b=VDzWnXWKWBv7u/KN7QLQuz2jKJAo88GEeBCkUJgnMzEIClmm6dh4hu0bV9JS8vme4l
         vl8GdIzK7XYETVS53Czr/VTiLgWWxIhVEPhyySuZaKs3bvIfcpl4pvyRKnf+ZaDHIXGQ
         d0dqE/5R1V98ys7a+5wC4Ab+3ftjE98ssnMFtZ0ObyoIzFryb69/CA8SHhP/CY3TXEBz
         xnQTpE+E+fU3vOpjXet/K/qkq3OV4y0phDMIG3R3avDMEeihxdqxTk2JfueCHqKUCg6y
         QVq2INdLNpmJ8rAjuZthNc62iSWjGJhKIBno9Z5VXPsepvzjSccB2qVjw+tF6g25nLTl
         LKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703225318; x=1703830118;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFx33F3nlzEZieL1aK02WAAZdsSK/y5aYSWcfqCB1qM=;
        b=MQElP2EWB0CXN+/QBotc2REN10AHg0OpZNLBYm4joN0N1xTp+/YmGTUy+WfgR8Zqwn
         6VvGCacKvR6KbnDPd8F06OURaer4Z4igXJrJihou3ahT6Ta4nHjjLWjRPh5Qk7F+CXx8
         kOvC29TtA5Y2OpH1vshPh9QaQMhT/mtPM55Gp+R3CkPBu8E3muvhXHZy3OtakZC/Gi1g
         bpefVP7Z6DM+is2PkQ26jUOolWdp589ow1Fo0NGEpJcDstnQJAI10UO8bOGtJcwNXu3f
         iUIPEL+IHHUsj+GN2mAkRT0XJMwr62jlhFSQyjkO54IqOEOyQH48wTlnOZRYDLqv72Be
         pqcg==
X-Gm-Message-State: AOJu0YwjsDya/jl/VBUdiVo5ii7Ecb66Sts7pSuYWyUgB82kR+OmrJ8X
	qeDAM7VIQHqT4T5zhF058E8V77J52hE=
X-Google-Smtp-Source: AGHT+IHrneac8ZYm3XGjCBz60Te3v/SJjiSsN15Vp1dNodN039JEjeSyckGA134fKbkTP9KApH/New==
X-Received: by 2002:a17:903:41c4:b0:1d3:4c35:1791 with SMTP id u4-20020a17090341c400b001d34c351791mr907203ple.55.1703225317950;
        Thu, 21 Dec 2023 22:08:37 -0800 (PST)
Received: from localhost.localdomain ([49.43.251.132])
        by smtp.gmail.com with ESMTPSA id g22-20020a170902869600b001cca8a01e68sm2600290plo.278.2023.12.21.22.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 22:08:37 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	mail2szahir@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Zahir Hussain <zahir.basha@kpit.com>
Subject: [OE-core][dunfell][PATCH] alsa-lib: Enabling ptest for alsa-lib component
Date: Fri, 22 Dec 2023 11:34:22 +0530
Message-Id: <20231222060422.10559-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 06:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192858

From: Zahir Hussain <zahir.basha@kpit.com>

This change adds ptest for alsa-lib.

1) Adding CFLAGS change for include the header file path for resolving
 below compilation issue;
        In file included from ../../../alsa-lib-1.2.1.2/test/lsb/config.c:4:
        ../../../alsa-lib-1.2.1.2/test/lsb/test.h:5:10: fatal error:
        alsa/asoundlib.h: No such file or directory
        5 | #include <alsa/asoundlib.h>

2) Removed the test suite execution 'make' call using 'sed' command.

3) Compiled the test directory source code using "oe_runmake check" command.

4) Copied all the required binaries into PTEST path using do_install_ptest()
 function.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../alsa/alsa-lib_1.2.1.2.bb                  | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 3fb7ec2657..b74e18a322 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -5,6 +5,7 @@
 #
 PTESTS_FAST = "\
     acl-ptest \
+    alsa-lib-ptest \
     apr-ptest \
     apr-util-ptest \
     attr-ptest \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
index 4867c798b9..3f772360f4 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
@@ -52,3 +52,22 @@ RREPLACES_alsa-conf = "alsa-conf-base"
 RCONFLICTS_alsa-conf = "alsa-conf-base"
 
 BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OEMAKE:append = " AM_CPPFLAGS=-I${S}/include"
+
+do_compile:append() {
+	sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test/lsb/Makefile.in
+	oe_runmake check
+}
+
+do_install_ptest:append() {
+    for f in control client_event_filter namehint
+    do
+        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
+    done
+
+    for f in config midi_event
+    do
+        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
+    done
+}
-- 
2.17.1


