Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.13163.1619796920711344216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zSTUt2jz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id lp8so6575662pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tA96pX/fmp6FMPOB4T3RydSjudmnrS7oRvuFnLRaNl0=;
        b=zSTUt2jzQ/U4VSn1kOkgGroJSuIhqVFlrODEjdIcV9/KbUGWMW/KVGv9Dm4K+yw3L+
         NCn1DJupDTWJrKliCjWti4upcnwDsmIzaMkHrhC1k1C56TP/YL73y9ZVw11UzAUZTsT7
         ozc6fGLt4SrjR6HZJK5ayPSvum62ovBZ/jy4zjlYBILYZ1xf6VJoPEa9HJY7srET8MrM
         Y26BbLtd3A0pR4qirQeSbD/mg9nUC20pdvCnLnT6+1zVTLtM7IJSeNqpML5VG8x62zmg
         2CtbBhkUvs2p01GCORgHfzz78Qi5PAFlxdpX7c8Q9Und2VQTk/yuySYcSa2JQqMhlt/O
         b8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tA96pX/fmp6FMPOB4T3RydSjudmnrS7oRvuFnLRaNl0=;
        b=Gy+LriaQB36TW47VBBuZW+DjvokP9LWo/Lszs6yh0stScB3ffFESo9JpWZcuTG4F6B
         KNqGXy3btAExRPUbPouAMh8T19FFxjEPa7aXck7mUezAs6s0Vk+wmz0wQJ/cfUmLKSQz
         D4aTx9ISe+uCCyezdeOkM+eURKn383ZI7Qbx0lMXE6o2lznBTo+prMrYUWSxNiPol1Y/
         8Tac8o80fHJg6Qv+hiodExRmoxUEdSp8MXdbiFKMZ1kN7B2ikAfXZN8ZClIP5mcAjZZb
         l8wm27x/9SdJImTKys87drezy1iFQ5iO6LZtsoSi3vI5ZTOjwqqXBlEgf46b/ddVEdII
         bj5Q==
X-Gm-Message-State: AOAM5328ee74/QHrYjOzPttuFAlT/FGEQ8V0dHlRuSDJ+tybNmUoMqpa
	naibxQ0UpJw3qNg3PvEXgqtfni2+at646hPG
X-Google-Smtp-Source: ABdhPJxf+eCGI0NNibffw8o6vg+a2RHu0edHdEjS01EREivyVNdCqHINFLr0A6oCw4jchWvn2kq3fw==
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id p6-20020a170902a406b02900e678c471c8mr5758425plq.17.1619796919727;
        Fri, 30 Apr 2021 08:35:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.35.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:35:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] license_image.bbclass: Detect broken symlinks
Date: Fri, 30 Apr 2021 05:33:50 -1000
Message-Id: <d224e3be41933756656a9db21a932aaff08a110a.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

Find and report symlinks which point to a non-existing file.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81809a1ffe67aade1b2ed66fe95044ffbf7d3df8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license_image.bbclass | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index a69cc5f065..cfb0606da9 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -1,3 +1,5 @@
+ROOTFS_LICENSE_DIR = "${IMAGE_ROOTFS}/usr/share/common-licenses"
+
 python write_package_manifest() {
     # Get list of installed packages
     license_image_dir = d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
@@ -105,8 +107,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
     copy_lic_manifest = d.getVar('COPY_LIC_MANIFEST')
     copy_lic_dirs = d.getVar('COPY_LIC_DIRS')
     if rootfs and copy_lic_manifest == "1":
-        rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS'), 
-                                'usr', 'share', 'common-licenses')
+        rootfs_license_dir = d.getVar('ROOTFS_LICENSE_DIR')
         bb.utils.mkdirhier(rootfs_license_dir)
         rootfs_license_manifest = os.path.join(rootfs_license_dir,
                 os.path.split(license_manifest)[1])
@@ -256,3 +257,13 @@ python do_populate_lic_deploy() {
 addtask populate_lic_deploy before do_build after do_image_complete
 do_populate_lic_deploy[recrdeptask] += "do_populate_lic do_deploy"
 
+python license_qa_dead_symlink() {
+    import os
+
+    for root, dirs, files in os.walk(d.getVar('ROOTFS_LICENSE_DIR')):
+        for file in files:
+            full_path = root + "/" + file
+            if os.path.islink(full_path) and not os.path.exists(full_path):
+                bb.error("broken symlink: " + full_path)
+}
+IMAGE_QA_COMMANDS += "license_qa_dead_symlink"
-- 
2.25.1

