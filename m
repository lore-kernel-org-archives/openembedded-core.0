Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68464C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.2276.1643826483793848782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SM0x845a;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id p7so347830edc.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GDcYeG6VcxcbpiJSfFWS/PzITTF/tyciyP9jTschMCw=;
        b=SM0x845aaBf6P0GHtjWLWpnn/LyO6PgsjIFgwQAG41uIhC2NBkT9SCktdetatgG7wv
         B12akQKSzmeQL7ZJBWLLO/9JJOPm+QkxXkR3PH1dnRdnUJWO/Izk0cKEjCNnsSkTdzhu
         eqjokA38EjPdg4VyXwIxE7DWea6ocgI0ezr1cRvzarXNrpMsAIOPl9FrIOVyD8S7MYjk
         VbWt0PcLZFStW2zzWkVYwmdaig8tZHAI2dENWicLMi1RxyB83YE7Q7BuYa1n8kz6zcA/
         G9awaOn4k4fHKsXG6PxvbcLOiAkLT5Hz7V71l1FymE9D05QvCRI631RHO6kvz4g5GAr0
         kUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GDcYeG6VcxcbpiJSfFWS/PzITTF/tyciyP9jTschMCw=;
        b=iyDjDc0R7RUngP9dY5OEfxNo1lZa8yygJ2ad9MqaDBijPwuUBBhgvhwO/fWuHOUvzJ
         F6SkLux7m+pjvmv4/4xndk4CQq8ZDS+p7spYtNu93DMVlbU306kLj4e3wZtHJqIz8Zyo
         NrVhf5Oe4uLi0WwzlIwCI3sDKlEyUlZM465HBRc8NblvXiAXCG+yxgN4grbkckvnh9Lo
         mZl4vvIZBEINS8BSOA/I3lUw2pFKbI4Hdaa3YheQvNc5ctetI0u6l1jSumXDuadhoFju
         BaXUIA9Ivkr68NLYnRa19buEhzSaL0VDogJgDqYebeKp1wS6cslmh2C2tYdqH34Vmcwz
         qhsw==
X-Gm-Message-State: AOAM5309RHAddFu8yVI2vprLzPuJ55fPw6NrrNiFM9S6ZUsEXS5lKGP8
	x03ywkxNMTA92JhHz1O2WWCdM0KI1Ns=
X-Google-Smtp-Source: 
 ABdhPJz0YIq7tpsHOsb2dv93sF2BJkNhpUVG/rgP8Gw4/4FNpgt8+2qbWy5LHRrXLhHQ7BUMgDcO+w==
X-Received: by 2002:aa7:d6d4:: with SMTP id
 x20mr31502948edr.307.1643826481863;
        Wed, 02 Feb 2022 10:28:01 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/33] seatd: add recipe
Date: Wed,  2 Feb 2022 19:27:26 +0100
Message-Id: <20220202182758.919991-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161226

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


