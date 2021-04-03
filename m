Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.32300.1617467844857519279
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Apr 2021 09:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=iBNj3M5z;
 spf=pass (domain: madison.systems, ip: 209.85.210.171, mailfrom: matt@madison.systems)
Received: by mail-pf1-f171.google.com with SMTP id x126so485384pfc.13
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Apr 2021 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q82qy7Je2fdTrS9J2dgQgjZtMeDuEME5krxoDV28pbc=;
        b=iBNj3M5z/b3EJAV6/n0P+7oy6OwDwyJhsCBCRvGNbZNLciqW6HIHDMFc1FaV4/PYZR
         jpPnb10e94wgc+i46SM7KbstO+/v8HxaB8z21ki1W0tUhb9KovkaAz5tRn/D6C4UvdKR
         /04v1NXEUW8umdkc91XRUdeB0ZhVi1Pzy6HKI1+BzHEZ8nqirtvLrbl5+F/nyvL3bJ/U
         JKz1FV14M3Y63aLL4dKyGHvXepLxnyLmr6EliJYB+xfs6dBF9+TYtuhe4rH4VCwMeqPv
         7lb0hs9DT0cd0Gctg6ONSSCNPmbQ3uOd6d9qIs6VCbm5R3Qk85HlR4Oxdnm7ckZo5fwa
         MuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q82qy7Je2fdTrS9J2dgQgjZtMeDuEME5krxoDV28pbc=;
        b=btfrV9AobmGXjPTZECg8cS9KWJE8crv2cge6eDOjE0+QIg8H532KFk3zscLWGl+Q73
         YKvckFA/Bf5MexGbKekSaok0ky9IFb1XBC5FeiBli76/kBML9V85v63+ZKHZIYNv4m6V
         in8GyxIkAtKfEY6IVOd+wSoJqh/kE9dUeZKQoB/D0M3Tq0PckgonhAGPOwhlIYvkKqsB
         DWVGWAT4RvdXlvq9PKV2PYZRXkYOqKPEagjEhTCd7yqSn+xxj/no6e6QcexMJR54Rexj
         IwwIHUyjYPEFizk00kM5mkKvf6Mo6jp6nD42PdMNcLbmqeJ/UanCVxvF9vz3gmW1x3sf
         g2zA==
X-Gm-Message-State: AOAM532SWirwFNktnaxR37+ElUugmtmV1VdI2R5H1P+zaa1+btAHdhHO
	Zn/kyHvt9wxWHAbyi9uOooORmfEve+CzU63H
X-Google-Smtp-Source: ABdhPJzk45B5IZUxyy2NvFf8wJfX9BTQ6p8QX9si8UuMALKE0OLyyHGikyfa/RyagwYZvLMQn6eOLQ==
X-Received: by 2002:a65:41c6:: with SMTP id b6mr16147242pgq.7.1617467843952;
        Sat, 03 Apr 2021 09:37:23 -0700 (PDT)
Return-Path: <matt@madison.systems>
Received: from legion.athrat.org (76-209-242-28.lightspeed.mtryca.sbcglobal.net. [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id 205sm11803745pfc.201.2021.04.03.09.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 09:37:23 -0700 (PDT)
From: "Matt Madison" <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Matt Madison <matt@madison.systems>
Subject: [PATCH] libxcb: use PN for naming dynamic packages
Date: Sat,  3 Apr 2021 09:36:04 -0700
Message-Id: <20210403163604.592627-1-matt@madison.systems>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

so an explicit runtime dependency on one of the library
packages doesn't generate a message about libxcb and
libxcb-native both being providers.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
index e9f6051b6e..f0a223a19c 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
@@ -19,7 +19,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS = "xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
 
-PACKAGES_DYNAMIC = "^libxcb-.*"
+PACKAGES_DYNAMIC = "^${PN}-.*"
 
 FILES_${PN} = "${libdir}/libxcb.so.*"
 
@@ -35,5 +35,5 @@ do_install_append () {
 }
 
 python populate_packages_prepend () {
-    do_split_packages(d, '${libdir}', r'^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
+    do_split_packages(d, '${libdir}', r'^libxcb-(.*)\.so\..*$', '${PN}-%s', 'XCB library module for %s', allow_links=True)
 }
-- 
2.27.0

