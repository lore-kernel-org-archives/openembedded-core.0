Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883BBC3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:38 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.57.1659106055317792530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=b9o+urKZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id c139so4829346pfc.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OToOd7k5cqip8kzyw1d2hTsjxzTDl7YOsXDdKcb51eo=;
        b=b9o+urKZigB29cKQkgQGqgke4r8PCb4Ik/1nvbQwogYSIIqgd+I7X4CTD40d430Qpg
         20m6Xfl/4QgtQNJGkBqi4+0G4W/eAXUI9BkczkcgElRWISCNhc+oXyQ8q6fKeGxuhNfM
         LOB1D1NxK41sYXcZyls3P2Wqyw+DqCLYLDQSF+iLqFMePmi+oDWBoNUGsnGOpWYl7ZAt
         HRhxpmAUbz0/Jzkxl12JN/l7PcRoYDqcyCaAtYaV05l8DzlFCPD6FJ9HV+LLuxy4otWx
         rQ0SaWlvdVgj3r2m4sZ/79fJJpFy0fuizKBBMrkAZP9p3LQtajFsHGhDmvrH6x+A1HlV
         TymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OToOd7k5cqip8kzyw1d2hTsjxzTDl7YOsXDdKcb51eo=;
        b=z264tZGmgHj7KlT+AX6zHWAM0bxI/yTDSWQ8QnK3cDIjzXiQPzIPJnl1dUXXqtQ0mf
         42X2YPL17Li23XAe46Z8wEv9pRSo6/lsu4w8gDFjGhb5RzSPenkLp1XeLsrHiKLxieHM
         K7/9ydozT5kqt+vc3qHtdTFi892IteEs45WT3LZIGcdQ7AuKUrFlj4Ab5Saa5uU18ssu
         OtsqCNfX9Ipjh15BNM0qOvzNRFeExtCtYumCXw4bw1KNOJ2GbLJ+5zlXUYkeSWqqCiux
         hEQvFR+akCAAxie2RUSz77Kj18Yon/p2wQKvpiPDSWTpEz3+4CLHEVUDr80zsJzOLZdt
         Gi4A==
X-Gm-Message-State: AJIora+/IwCYPYKjEyHCBJ11Jaexx0JewgBH99GLZNcMls8jULHYkSa5
	vrfecaPyoSl5O0SlxtZ3uLgFlDpSypc91UTD
X-Google-Smtp-Source: 
 AGRyM1uLI6Qn20lzCscb+DCHhVO2lH8liNjhFG7H7pRqf801axO0NVe3Gy2H7gjACFpNJHguNkAEYA==
X-Received: by 2002:a63:e908:0:b0:41b:390a:f60d with SMTP id
 i8-20020a63e908000000b0041b390af60dmr3223341pgh.147.1659106054281;
        Fri, 29 Jul 2022 07:47:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/29] xorg-app: Tweak handling of compression
 changes in SRC_URI
Date: Fri, 29 Jul 2022 04:46:21 -1000
Message-Id: 
 <5f3d70970746ee6d9ad68f16419a016331b45df4.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168640

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Rather than duplicating SRC_URI, change the compression to a variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21547dd5319f27a8f7f20a80e39478f816b4bbe0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb | 3 +--
 meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb    | 3 +--
 meta/recipes-graphics/xorg-app/xorg-app-common.inc  | 3 ++-
 meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb      | 3 +--
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
index 573b05128e..cd658ab219 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
@@ -15,8 +15,7 @@ RPROVIDES:${PN} += "mkfontdir"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=99b1e1269aba5179139b9e4380fc0934"
 
+SRC_URI_EXT = "xz"
 SRC_URI[sha256sum] = "8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4"
diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
index fa0fe36451..e75a840b7d 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
@@ -8,14 +8,13 @@ predefined values for various parameters used in communicating between \
 clients and the server, and the different types of screens and visuals \
 that are available."
 
-SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3"
 DEPENDS += "libxtst libxext libxxf86vm libxi libxrender libxinerama libdmx libxau libxcomposite"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
+SRC_URI_EXT = "xz"
 SRC_URI[sha256sum] = "356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206"
 
 EXTRA_OECONF = "--disable-xkb"
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 1c64e20aac..5dbe8abe86 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -8,7 +8,8 @@ DEPENDS = "util-macros-native virtual/libx11"
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
+SRC_URI_EXT = "bz2"
+SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.${SRC_URI_EXT}"
 
 inherit autotools pkgconfig features_check
 
diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
index 57b43ff28c..0e0347f768 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
 
-SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
-
+SRC_URI_EXT = "xz"
 SRC_URI[md5sum] = "fe40f7a4fd39dd3a02248d3e0b1972e4"
 SRC_URI[sha256sum] = "7bc76daf9d72f8aff885efad04ce06b90488a1a169d118dea8a2b661832e8762"
 
-- 
2.25.1


