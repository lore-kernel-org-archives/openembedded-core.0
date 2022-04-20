Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6DEC48BCB
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.6722.1650455713538744604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 04:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KIwP2Mg/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id bv16so1903453wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 04:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44Bk1vUQ5BNO47dmuskCUojqV8BCvoV9Wrtc5lAJ1o8=;
        b=KIwP2Mg/L1QuCdiXrLMuJAZufJf9GRc8jwbQFZOO8uFPluV9Hdq1N8nRYCGiAyVkQJ
         JAJVLOTgGXf3HjrJ1yFEyNQei/xJ4VRrxe0g+gAr5uMmB3fWP5i4T6sQCdoJUF0n+lIo
         DgKbLdEKZ/FmEXhSscjjnmDssFDMZd1Ycz9EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=44Bk1vUQ5BNO47dmuskCUojqV8BCvoV9Wrtc5lAJ1o8=;
        b=vleoTvN8aBLNllqG7ytbdu0eg4ks0UKmWYDkorJ/xXU614Ly5T45bcjqQ/XMyYDDD6
         D+3w1cq0FARozqBFAr2QvRhHuR9aIRSnPZTkynIKdARVacyaa8meBbSwpME5gusv17qr
         T9r/fJmWjR+uF9IZ1/EHFCRMPsldr/69eWQIckhrSr/Qlf/9NMR5NfBqbBnVT0ASRyMI
         i6JojtigXUVv6Gpy2TTtLLLKgCsqHvP5Rpw2UbQ46OFCdjUXWnZRLjITZydH6x2zKwV9
         GDP+Ksl7vFuAx2GbGRiP0xYbEZM/kp6tpDY76DptjFi/UjNHMKI202uXMBOTq580RLDW
         fxTg==
X-Gm-Message-State: AOAM5337uc/6IQmLl3h97OFNWy5kTkkzijU7Ny+TAjLkuF/9Lmna90lK
	gjb5z64gFUR2mZfHMu/ioyChVX/PoFHiaQ==
X-Google-Smtp-Source: 
 ABdhPJyAGvZN1Jzm3rIcoy+VZOEzSqL9w9rsnjlHk3wU1s7OIzGL9jhsYbhSshzfZ7SF+hGScZvPDg==
X-Received: by 2002:a5d:584f:0:b0:20a:83aa:ad2a with SMTP id
 i15-20020a5d584f000000b0020a83aaad2amr15997512wrf.610.1650455711553;
        Wed, 20 Apr 2022 04:55:11 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9745:8b8f:81da:af07])
        by smtp.gmail.com with ESMTPSA id
 x4-20020adfdd84000000b00207b60ed68esm14455362wrl.100.2022.04.20.04.55.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 04:55:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xorg-app: Tweak handling of compression changes in SRC_URI
Date: Wed, 20 Apr 2022 12:55:09 +0100
Message-Id: <20220420115509.2525431-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164666

Rather than duplicating SRC_URI, change the compression to a variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb | 3 +--
 meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb    | 3 +--
 meta/recipes-graphics/xorg-app/xorg-app-common.inc  | 3 ++-
 meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb      | 3 +--
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
index 573b05128e4..cd658ab219c 100644
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
index fa0fe36451a..e75a840b7de 100644
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
index 1c64e20aac7..6a9ebe842de 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -8,7 +8,8 @@ DEPENDS = "util-macros-native virtual/libx11"
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
+SRC_URI_EXT = ".bz2"
+SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.${SRC_URI_EXT}"
 
 inherit autotools pkgconfig features_check
 
diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
index 57b43ff28c4..0e0347f768b 100644
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
2.32.0


