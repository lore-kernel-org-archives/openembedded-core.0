Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6CFC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 19:49:32 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.955.1652730566264792995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 12:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QBVrp0dH;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id ks9so30672808ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HFgsiGvqKSpoGsUsuNSyHKVL8l9Q+Yp07NpQy27aPns=;
        b=QBVrp0dHmQly+lhXPcMIcuQvtNpaA+P87vrMPe0e8eQ+Lsq7NBz3lkch0tRD5PL05y
         Av/UkspGJ2N7gzPv/0KBkUFdm32QEDfQhibYK4KMibwUNihP6LIyqaI/LNXA9VD6Lqc5
         BC1scYSioD9S00SEfEbIpzYKPlmUP/PPtZCEZnqhJUYp2AQqDVDgU9Z8MtO1JhKU4lBJ
         /pbZNmyNmr+fX/lUWtItCdiYSn8czawultTvzLxO0+ZgX8uSHN/kxqteDkoahinGK6cq
         pZ3U8+TFqyOqc+7puUBMspw881WBX541hmB46BsfbxXFT8XsEwY4BKBuzkCBkTnTvxHy
         YSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HFgsiGvqKSpoGsUsuNSyHKVL8l9Q+Yp07NpQy27aPns=;
        b=wzHLBvnFRUkyggJrNUgrzxMovbK1C1VAoc28nWoXvBTp0Y4C7Y/SfBDlV+k+QRsZrO
         bVyF86dVI/IrZ3amo+owRDk9UerDD8igHxU/4xmzApuAC4GIwMf1MCdfO7yo2dRzC0HW
         IBm5PwBrLtV8FxJMVCgrR2p505NAbr/vY1R0x3QnGtaxXKBRS2npqrePwONwqKgeyWYS
         JpxRTiAp7Qc85X3FYJbfr3a5iUUmUgi70aeWkl45ymhcjy20MbSCnXuppXIMY3IOuGFy
         8/R8FW0vF2ECvn9qyCZn9qgbVXoEc+MDaaQY8wT7RWjwMf42QnXiblNJYfJlLI3ES1M5
         DXXQ==
X-Gm-Message-State: AOAM531rKEkr3z56Q61kyTiSzRyfgUJuPVoSFdn4+Iu44qUeMs/SG6l7
	ybT9Dbr9WBByq+XJ2PxmbOLl53QJcYg=
X-Google-Smtp-Source: 
 ABdhPJxReR1G14kl4SausiaPzYMmcQ5Unty1S2P0ub7W/KrJ02Lv+6xNKOzklj0T1VTt4wyAp1epfw==
X-Received: by 2002:a17:906:559:b0:6f3:8ba6:39c8 with SMTP id
 k25-20020a170906055900b006f38ba639c8mr16831880eja.486.1652730564705;
        Mon, 16 May 2022 12:49:24 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 o23-20020aa7dd57000000b0042abfe32ac8sm533125edw.30.2022.05.16.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 12:49:24 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH 1/3] eudev: Convert dependencies to PACKAGECONFIG
Date: Mon, 16 May 2022 20:49:13 +0100
Message-Id: <20220516194915.29231-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 19:49:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165695

GObject support was dropped in 252150e181c5 ("src/gudev: remove Gobject
libudev support."), but some gir support appears to still exist.

Fill out PACKAGECONFIG options.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 841039f6d745..0fd1b6ab2283 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:libudev = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod util-linux"
+DEPENDS = "gperf-native"
 
 PROVIDES = "udev"
 
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed
 UPSTREAM_CHECK_URI = "https://github.com/eudev-project/eudev/releases"
 UPSTREAM_CHECK_REGEX = "eudev-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools update-rc.d qemu pkgconfig features_check manpages
+inherit autotools update-rc.d qemu pkgconfig features_check manpages gobject-introspection
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -30,11 +30,14 @@ EXTRA_OECONF = " \
     --with-rootprefix= \
 "
 
-PACKAGECONFIG ?= "hwdb \
+PACKAGECONFIG ?= "blkid hwdb kmod \
                   ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
 "
+PACKAGECONFIG[blkid] = "--enable-blkid,--disable-blkid,util-linux"
 PACKAGECONFIG[hwdb] = "--enable-hwdb,--disable-hwdb"
+PACKAGECONFIG[kmod] = "--enable-kmod,--disable-kmod,kmod"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages"
+PACKAGECONFIG[rule-generator] = "--enable-rule-generator,--disable-rule-generator"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 do_install:append() {
-- 
2.35.1


