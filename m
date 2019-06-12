Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6A07E76F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 13:01:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 207so6504093wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AbklxD1dpecPwP/yhPbCp9aHiN1EDKchdr6K0KOA3mc=;
	b=lczs1non1D0luSS2x9uB4Rr/j44scPVlH6W5iKx/emQUWB/nC/hD5KW9mMN71nHtK7
	8+KVpvjNIPhnT2OVI51eZw+oJMDIBLeW2O+uOputTo8u6A10sDb7eC5nBLmmsq/3MRqs
	eIlIASecs8iIcOuHUMGM6iyywbOnKMrOZbKX74QQ8ymtvFRcgB3eSKhnYCvI3vhiW5GQ
	9TscH0S8wvO/su0CYzK/oM8DbFEjDcjXPbFCfOxB/31DMwIOtLSGjQDZ240xlHWSXF1q
	ZV3ZXpK0Mqf2OeVA53TYq7Re5LqmMSROHFAZLzKrJZwzE9H6YfRg/gBGjQSPEXfM+3lZ
	O7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AbklxD1dpecPwP/yhPbCp9aHiN1EDKchdr6K0KOA3mc=;
	b=cET5XXXy2xybBEqWq0eyJ0Yp6hrQayV+yb1gSiiivr3K2Oj/LdgnZX4IGFQoZJp2O6
	wRvO+G6wBJoj7chqpDB1ZjE2mjHXsBNkALA9sKJWtQje4hbQtklP08gFRIGvd0nrM/iZ
	CmW24YXbz23s7eBuv2xn4K/hRsL5Uluvqp8WZz/Dy+py3EKZLIDdlLfKeUphfgdlLHcX
	siCVaBQAK0NvV2QzPxKrrsCliw7w/jbwyb+lpji5yuwEEnfh7DpLqLnBRKCvvftJcRC1
	ai+zWlV9UtsrxB7ch6HsV2u9yt+zKempT1oId/r9pUwMwmB9FktfZUm16Nnbq2Lcwnq9
	2SkQ==
X-Gm-Message-State: APjAAAUzkBg8uyCsMLqDGs+P6d202fSS/LilYkNiO5LuhillNbm48dQp
	ElIpusWIfiyVmn1VJQZRQY1rygIK
X-Google-Smtp-Source: APXvYqwsyrlwSG8kb/9C2iUzZ4W4dPlxfbinBmidqFTvCjaGf0gMGQe61hLRRPc6zZ+lB+N0vW5Tcg==
X-Received: by 2002:a1c:6a11:: with SMTP id f17mr20644782wmc.110.1560344489388;
	Wed, 12 Jun 2019 06:01:29 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d17sm2657086wrw.63.2019.06.12.06.01.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 06:01:28 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 14:00:05 +0100
Message-Id: <20190612130004.21232-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v3 repost] rng-tools: harmonise systemd and sysvinit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2019 13:01:29 -0000
Content-Transfer-Encoding: 8bit

this commit will permit to read the option from
/etc/default/rng-tools both from systemd and sysvinit unit file.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../rng-tools/rng-tools/default               |  3 +--
 meta/recipes-support/rng-tools/rng-tools/init | 21 ++++++-----------
 .../rng-tools/rng-tools/rngd.service          |  4 ++--
 .../rng-tools/rng-tools_6.6.bb                | 23 ++++++++-----------
 4 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
index ab7cd9327f..b9f8e03635 100644
--- a/meta/recipes-support/rng-tools/rng-tools/default
+++ b/meta/recipes-support/rng-tools/rng-tools/default
@@ -1,2 +1 @@
-# Specify rng device
-RNG_DEVICE=/dev/hwrng
+EXTRA_ARGS="-r /dev/hwrng"
diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
index 7cf78393a4..13f0ecd37c 100644
--- a/meta/recipes-support/rng-tools/rng-tools/init
+++ b/meta/recipes-support/rng-tools/rng-tools/init
@@ -1,26 +1,19 @@
-#! /bin/sh 
+#!/bin/sh
 #
 # This is an init script for openembedded
-# Copy it to /etc/init.d/rng-tools and type
+# Copy it to @SYSCONFDIR@/init.d/rng-tools and type
 # > update-rc.d rng-tools defaults 60
 #
 
-rngd=/usr/sbin/rngd
+rngd=@SBINDIR@/rngd
 test -x "$rngd" || exit 1
 
-if [ -e /etc/default/rng-tools ]; then
-    . /etc/default/rng-tools
-fi
-
-if [ -n "$RNG_DEVICE" ]; then
-    EXTRA_ARGS="-- -r $RNG_DEVICE"
-fi
-
+[ -r @SYSCONFDIR@/default/rng-tools ] && . "@SYSCONFDIR@/default/rng-tools"
 
 case "$1" in
   start)
     echo -n "Starting random number generator daemon"
-    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
+    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
     echo "."
     ;;
   stop)
@@ -38,11 +31,11 @@ case "$1" in
     start-stop-daemon -K -q -n rngd
     echo "."
     echo -n "Starting random number generator daemon"
-    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
+    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
     echo "."
     ;;
   *)
-    echo "Usage: /etc/init.d/rng-tools {start|stop|reload|restart|force-reload}"
+    echo "Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|restart|force-reload}"
     exit 1
 esac
 
diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index f0355db14f..b1a78527be 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -5,8 +5,8 @@ After=systemd-udev-settle.service
 Before=sysinit.target
 
 [Service]
-ExecStart=@SBINDIR@/rngd -f -r /dev/hwrng
-SuccessExitStatus=66
+EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
+ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.6.bb b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
index 41959a2695..b0afa4b0eb 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.6.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
@@ -44,18 +44,13 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-    install -d "${D}${sysconfdir}/init.d"
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
-        ${D}${sysconfdir}/init.d/rng-tools
-
-    # Only install the default script when 'sysvinit' is in DISTRO_FEATURES.
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -d "${D}${sysconfdir}/default"
-        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
-    fi
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
+    install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
+    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+    install -Dm 0644 ${WORKDIR}/rngd.service \
+                     ${D}${systemd_system_unitdir}/rngd.service
+    sed -i \
+        -e 's,@SYSCONFDIR@,${sysconfdir},' \
+        -e 's,@SBINDIR@,${sbindir},' \
+        ${D}${sysconfdir}/init.d/rng-tools \
+        ${D}${systemd_system_unitdir}/rngd.service
 }
-- 
2.20.1


