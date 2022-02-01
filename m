Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24ACC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 13:31:02 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.48462.1643722261866189593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 05:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ar33XQsv;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id p15so54178438ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 05:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GDcYeG6VcxcbpiJSfFWS/PzITTF/tyciyP9jTschMCw=;
        b=ar33XQsv/Fk5qfq03m+e5hs41O8QFnpXS8R2hTd+GEHx/NePAR9HayRdYFMQrC73Rv
         HjM4t9jZ7GqA6T4QJGegAQeRvoRs3Yp6uCdXWYKfCCcOIJJ42Q7pdKq8en/JW2wqwOcK
         EHNC5aS0/HaspUK4kJQHVqlYoCJsnGf60IsB9dRzwdVWIOx4DTvdYU9pj2/DCOeqvj3T
         FZgdKM7D4O8/wAz1/sozlXT4B4pE1EWlLmyGtGtMqjxhwEXZU2r4MnuAXfc/WybzG9FS
         qdNWPorF/ucKw3NmBgiIXpfnTc6qCt3GCrju2IoMSrYkwLgvi1Ryahze/PF+b2X/eyHP
         chrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GDcYeG6VcxcbpiJSfFWS/PzITTF/tyciyP9jTschMCw=;
        b=VGuuHWpnaYVzqxTAQgNIRzHqZf3bZEFrlXTA9zRejNPCEh4VXzP0hnE93guklWVGc+
         PKSmiZDLonvK5okDn+FlWBwXJgtCn9XlMfgx9NMz4sHvwZAcUYhiq4HwtUN3QsNgjMmW
         DPC92rbZGTUtgwTZ4DtRQbTcl9ffnLT/vcbrulzuI4iLVrrjsiVTD4ew3XWvXfhMPrdC
         wLeUjJePxJ/XRVk7yvXiDEofBXXuuXQXQc5XxJjkEsmq9J/20tSEnHhk1EiI/s8wm1f1
         +L/TU3xVqihPf4IntglqzqtkEE8GiFoEv6p5fYODHjDa39bhCvai5rOh0IUF4CLi9DFR
         Fung==
X-Gm-Message-State: AOAM530vXq8XAcGxBxKJWPzxvRARhmegtjBJkygfPgfEJ4v4MrvlF/yI
	94zPZoyGEsOPiJMAAcorX1sXBP3BVXI=
X-Google-Smtp-Source: 
 ABdhPJyVSIW78xd1185aekjFJ32jWewV60hPLBrx1iEORLVPa2HemvIsobOQvKN+IOwKEDYI5BZ5Gg==
X-Received: by 2002:a17:906:58cc:: with SMTP id
 e12mr21368401ejs.162.1643722260233;
        Tue, 01 Feb 2022 05:31:00 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n6sm19599739edy.87.2022.02.01.05.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 05:30:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 1/2] seatd: add recipe
Date: Tue,  1 Feb 2022 14:30:53 +0100
Message-Id: <20220201133054.3265186-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 13:31:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161155

This is needed to run weston properly as non-root in the absence
of systemd-logind, and other compositors will likely require seatd
as well.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-core/seatd/seatd/init       | 45 ++++++++++++++++++++++++
 meta/recipes-core/seatd/seatd_0.6.3.bb   | 29 +++++++++++++++
 3 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-core/seatd/seatd/init
 create mode 100644 meta/recipes-core/seatd/seatd_0.6.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ae25287c11..cb289a0eee 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -684,6 +684,7 @@ RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-seatd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-serf = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-setserial = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-core/seatd/seatd/init b/meta/recipes-core/seatd/seatd/init
new file mode 100644
index 0000000000..0589c765ac
--- /dev/null
+++ b/meta/recipes-core/seatd/seatd/init
@@ -0,0 +1,45 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides: seatd
+# Required-Start: $local_fs $remote_fs
+# Required-Stop: $local_fs $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+### END INIT INFO
+
+killproc() {
+        pid=`/bin/pidof $1`
+        [ "$pid" != "" ] && kill $pid
+}
+
+case "$1" in
+  start)
+        seatd -g video -n 1 > /tmp/seatd-start-notify &
+        [ -s /tmp/seatd-start-notify ] && exit 0
+        sleep 0.1
+        [ -s /tmp/seatd-start-notify ] && exit 0
+        sleep 0.5
+        [ -s /tmp/seatd-start-notify ] && exit 0
+        sleep 5
+        [ -s /tmp/seatd-start-notify ] && exit 0
+        exit 1
+  ;;
+
+  stop)
+        echo "Stopping seatd"
+        killproc seatd
+  ;;
+
+  restart)
+	$0 stop
+        sleep 1
+        $0 start
+  ;;
+
+  *)
+        echo "usage: $0 { start | stop | restart }"
+  ;;
+esac
+
+exit 0
diff --git a/meta/recipes-core/seatd/seatd_0.6.3.bb b/meta/recipes-core/seatd/seatd_0.6.3.bb
new file mode 100644
index 0000000000..0e1a79dddf
--- /dev/null
+++ b/meta/recipes-core/seatd/seatd_0.6.3.bb
@@ -0,0 +1,29 @@
+SUMMARY = "A minimal seat management daemon, and a universal seat management library."
+DESCRIPTION = "Seat management takes care of mediating access to shared devices (graphics, input), without requiring the applications needing access to be root."
+HOMEPAGE = "https://git.sr.ht/~kennylevinsen/seatd"
+
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
+
+SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
+           file://init"
+SRCREV = "88db55f6068c1c01d85b61aa6adff0a6b2a8dce8"
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig update-rc.d
+
+PACKAGECONFIG ?= "libseat-builtin"
+
+PACKAGECONFIG[libseat-builtin] = "-Dlibseat-builtin=enabled,-Dlibseat-builtin=disabled"
+
+do_install:append() {
+        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
+                install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/seatd
+        fi
+}
+
+INITSCRIPT_NAME = "seatd"
+INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
+INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
+
-- 
2.20.1


