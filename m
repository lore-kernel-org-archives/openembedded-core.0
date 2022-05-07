Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827F2C433FE
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 06:45:04 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.7383.1651905903371189951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 23:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VwaeqhJG;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id a21so10882242edb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 23:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XYp/lTzIkUY+594RBzYx9NkvUvNCLmdZfWPmayybspw=;
        b=VwaeqhJGMZmRpCv/O2jD3PD3DmxQ4Ln/DNTMdTOXW2V4TjWXbvoB+vEvSjOegTrqZ4
         bJdxbugDR88ibes4uiPKlXZ2+aUT0tZ+R1ORgjhBHRYDmyp9xBliJhw3l7rdms9KcUjz
         P0am+2oqXw/aeTJSG5e+zP5DVklX9DlrrEJCl3MI3VxMgiQKCT1Gr7GQfh5tO2xwft4B
         4Qwn7We6wu2913V68cbFiFB4UNm1x6WmOmupaFrvFjSsE0EQ/6NXDxkLxXkl3gGE7Pe1
         Q7mUWklmdovcbylaY6lnVgCUvQcGFG5NbadpY8sT1evpzQeTn6hFtbpPt/rINAQVff9F
         ZOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYp/lTzIkUY+594RBzYx9NkvUvNCLmdZfWPmayybspw=;
        b=rlrGPulzoabW4dhvj+hWXAJ+fw62oX/eTfQ+reb5RlS6EAx/C83ct05jO4z9Depyeg
         Qt+wkVZVx+ExQtYZfT4opbqGesGOgfhjUAFeP97/XJTxFjb22wzn7XcrfMOvujqWZIhC
         TzwDoKpWLYccaO8juaoSbIicWCBIMMYl/L5s1TMM+j5kfDLxfqd9HPi8S9/SL/kXvafb
         ZA8245T20IF+0HG+jQeMwHcGuXTtHlWcK0KrbZnO4YtGJx0+WRnPbzuSwbv0MfM129fl
         ev7KDlLlJ7t+f1nbeC1/M2ldV1lhb9K6tRhPpG1cNTBvg5rLfSUj5VIYQapTK0jp7hEd
         L1Vg==
X-Gm-Message-State: AOAM530nW5qhTcfezgWyIAzVpeKpSojZ2hkKQvjK/WkzNPwcpnY24Hxa
	Ro7ZR2F2hC8aiP7Jg+YKU5myAyN0DLo=
X-Google-Smtp-Source: 
 ABdhPJw3vu+g9uiLwvaTpvBJqQN7V08jHZhrexBp/tDsMEgabQ30eshBZlHdRkDW53+30dugWbfXfg==
X-Received: by 2002:a05:6402:1a26:b0:425:d3cf:d7f0 with SMTP id
 be6-20020a0564021a2600b00425d3cfd7f0mr7464040edb.251.1651905901827;
        Fri, 06 May 2022 23:45:01 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 g11-20020a170906c18b00b006f5294986besm1294229ejz.111.2022.05.06.23.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 23:45:01 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH 2/4] eudev: Add PACKAGECONFIG for manpages & selinux
Date: Sat,  7 May 2022 07:44:47 +0100
Message-Id: <20220507064449.25809-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507064449.25809-1-alex.kiernan@gmail.com>
References: <20220507064449.25809-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 06:45:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165354

Drop DEPENDS on libxslt-native which is unused as the tarball includes
the manpages and the build process never invokes the script which
regenerates them (make.sh)

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 49fa9a74c3da..276456ae460c 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:libudev = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
+DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod util-linux"
 
 PROVIDES = "udev"
 
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/eudev-project/${BPN}/releases/download/v${PV}/${BP
 
 SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b"
 
-inherit autotools update-rc.d qemu pkgconfig features_check
+inherit autotools update-rc.d qemu pkgconfig features_check manpages
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -27,8 +27,12 @@ EXTRA_OECONF = " \
     --with-rootprefix= \
 "
 
-PACKAGECONFIG ??= "hwdb"
+PACKAGECONFIG ?= "hwdb \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
+"
 PACKAGECONFIG[hwdb] = "--enable-hwdb,--disable-hwdb"
+PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 do_install:append() {
 	install -d ${D}${sysconfdir}/init.d
-- 
2.35.1


