Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F803C4332F
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 07:07:17 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.852.1653635234181132019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 00:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24R77CH9026835
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 00:07:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24R77BWV029053
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 00:07:12 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 27 May 2022 00:07:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 27 May 2022 00:07:11 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 27 May 2022 00:07:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] systemd: Set RebootWatchdogSec to 60s as watchdog
Date: Fri, 27 May 2022 00:07:11 -0700
Message-ID: 
 <c05b2737acb3c1b1d91085eb38c183214f478c62.1653635182.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1653635182.git.liezhi.yang@windriver.com>
References: <cover.1653635182.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 07:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166202

The systemd-shutdown sets watchdog timeout to 10m (600 seconds) which is too
large, and caused errors when reboot on boars such as rpi4:

systemd-shutdown[1]: Failed to set timeout to 10min: Invalid argument

The watchog's default value is 60s, so set RebootWatchdogSec to 60s to fix the
errors. And <machin.conf> can set WATCHDOG_TIMEOUT when needed, for example,
the max timeout of rpi4 is 15 seconds.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/systemd/systemd_250.5.bb        | 8 ++++++++
 meta/recipes-extended/watchdog/watchdog-config.bb | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 006b2f86eab..6fac27ee56d 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -238,6 +238,9 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dnologin-path=${base_sbindir}/nologin \
                   -Dumount-path=${base_bindir}/umount"
 
+# The 60 seconds is watchdog's default vaule.
+WATCHDOG_TIMEOUT ??= "60"
+
 do_install() {
 	meson_do_install
 	install -d ${D}/${base_sbindir}
@@ -337,6 +340,11 @@ do_install() {
 
 	# add a profile fragment to disable systemd pager with busybox less
 	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
+
+    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
+        sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
+            ${D}/${sysconfdir}/systemd/system.conf
+    fi
 }
 
 python populate_packages:prepend (){
diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/recipes-extended/watchdog/watchdog-config.bb
index a28d28033bc..f1389521284 100644
--- a/meta/recipes-extended/watchdog/watchdog-config.bb
+++ b/meta/recipes-extended/watchdog/watchdog-config.bb
@@ -13,8 +13,15 @@ SRC_URI = " \
     file://watchdog.conf \
 "
 
+# The default value is 60 seconds when null.
+WATCHDOG_TIMEOUT ??= ""
+
 do_install() {
     install -Dm 0644 ${WORKDIR}/watchdog.default ${D}${sysconfdir}/default/watchdog
     install -Dm 0644 ${WORKDIR}/watchdog.conf ${D}${sysconfdir}/watchdog.conf
+
+    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
+        echo "watchdog-timeout = ${WATCHDOG_TIMEOUT}" >> ${D}/etc/watchdog.conf
+    fi
 }
 
-- 
2.35.1


