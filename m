Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.4341.1625358502329502935
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jul 2021 17:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BUllnr6U;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bkylerussell@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id z3so13483947qkl.4
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jul 2021 17:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eSmrg7qo1RF/pd9QPxTbExG5ELbvEDJMBiwBmSNvnxE=;
        b=BUllnr6Uj5o5X8XUxT6i5PVSq+2BQZ9wfLIh1wNtFqmA6dgzRaaxBX64LidTgUvbWc
         /3MyfeP07whnt6gCG/G9GKlEFcXRpp4rkubhd1D3GkV/bZc2G47Qs7rpjOVgroQ4cJbt
         htabkoe+1Bo4QWs8oKlRFgIdnI4GLif/E9QCC9CJtn5a+OCuHBRc+sUiikJ87rAgblKI
         oqkd6O4Uib+qKsP54h7V2PTmzGEA+ftUofhDilFlEPX1bTGJckMulONPVLVYdFf1nama
         4EN1Kl++xGiMGYJ1HCCyfYSyDY9Veu+cC4f9lhV48VA9P4gRKS6ut7OjK5OHUYOvO3Io
         IxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eSmrg7qo1RF/pd9QPxTbExG5ELbvEDJMBiwBmSNvnxE=;
        b=OSPte6aeOskXAOFCdGmk1OoYmkaOqXK8z/8rWk7KK0hlAv3HP3q7kCoDPXcEm3aPg1
         bFEuS+4dsUWWh56OaSaUE6oYxPAYNBu6Z0Lh/suRhgqQNoZHof3yFJo2F0VOxYfbrmbC
         dyXTKESW3Gh7f8TPyTYtrzBZMyLjF4/I37PgB1CN8KCqSJswkORH6DRO3D0r5rpFT70s
         x7jtNjDip8mE993tApk7b1YMpzzTuf2VMHCxh1cm55BzcjUerfEwyfVddR8PjIHmuHaH
         lEIadD+ST/tl5b/mDI1F+a/yD6QcSgvhZjqnNR26LNO+kxK4gpMoEUEIkgTn8dgEtTEv
         gEFg==
X-Gm-Message-State: AOAM5316I8DvczIJ+9ExZt91P3RgKsef8x8dXzUvmfDZleElj/VUwqat
	qB09CwNWTEaW9n+gJLtajuZSz2/2GJvzTg==
X-Google-Smtp-Source: ABdhPJwg8SrzV5pa7OBn2DYp+IT0wtjDW95yips1i1LECKXpI2Uq/Ty6xmPctZGojjJZMyusnPdE6A==
X-Received: by 2002:a37:f60a:: with SMTP id y10mr7232163qkj.375.1625358501394;
        Sat, 03 Jul 2021 17:28:21 -0700 (PDT)
Return-Path: <bkylerussell@gmail.com>
Received: from poirot.file.core.windows.net (cpe-74-138-104-174.kya.res.rr.com. [74.138.104.174])
        by smtp.gmail.com with ESMTPSA id c22sm1848303qtd.42.2021.07.03.17.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 17:28:21 -0700 (PDT)
From: bkylerussell@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH] gstreamer: add libgst packages to PACKAGES_DYNAMIC
Date: Sat,  3 Jul 2021 20:28:11 -0400
Message-Id: <20210704002811.103424-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the dynamic libgst* plugin packages and libgstrtspserver-1.0
to be used correctly in RDEPENDS.

All gstreamer1.0-plugins-* recipes and gstreamer1.0-rtsp-server include
gstreamer1.0-plugins-packaging.inc, which creates multiple libgst*
packages through split_gstreamer10_packages(), but only one of the
do_split_packages() regexes was included in PACKAGES_DYNAMIC, and only
for the plugins packages (through gstreamer1.0-plugins-common.inc).
Now the PACKAGES_DYNAMIC definition exists with the do_split_packages()
regexes.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-common.inc                  | 3 ---
 .../gstreamer/gstreamer1.0-plugins-packaging.inc               | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
index dba96e0f6e..cb1c9aaec1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
@@ -45,6 +45,3 @@ EXTRA_OEMESON += " \
 
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
-
-# Dynamically generate packages for all enabled plugins
-PACKAGES_DYNAMIC = "^${PN}-.*"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
index 9a7a1b6afe..5b80a46b40 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
@@ -6,6 +6,9 @@
 # This is mainly used by the gstreamer1.0-plugins-* plugin set recipes,
 # but can be used in any recipe that produces GStreamer plugins.
 
+# Dynamically generate packages for all enabled plugins
+PACKAGES_DYNAMIC = "^${PN}-.* ^libgst.*"
+
 PACKAGESPLITFUNCS_prepend = " split_gstreamer10_packages "
 PACKAGESPLITFUNCS_append = " set_gstreamer10_metapkg_rdepends "
 
-- 
2.25.1

