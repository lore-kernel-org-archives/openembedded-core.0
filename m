Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.15922.1613303787466590990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 03:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hoWrfgjJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id u14so5255257wri.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 03:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0AX1i+5amaTySeQEjVaPO4qesl6+Gojlg1HiPsgNFAE=;
        b=hoWrfgjJkC8IG2ndwaiArKIzjqzIWoPKxp2zy/ePII5thi0LPm7A+0aZBHiSkXCImm
         NJnPbMY+hFi3omApqnj/k9VuMKFQdEmq/GnhaBbpQfYX2UZwb0n4xb4676Qz0tUrpzhs
         eODR4RBw3BKmNeBF6exr+X1InzmzEUOdEN4rQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0AX1i+5amaTySeQEjVaPO4qesl6+Gojlg1HiPsgNFAE=;
        b=AS3Y/9BeCN92YthD9BfXXB1aJFp04Q8LYhS+v7HxeGt/bH/nrqXPIDiYJ358NJbJNq
         jqoqSdtoJMoP74nRIjim6qj5N39Xr+1Qypj2WtjE9G3s2f0dwcRTMHX1HRtIIYzBazRm
         QArNpplDGtYn5UD1+UXFyfPeTqMhVouyXB+898tOgvZsk1cHIIB++vdNSSxn3g2GE0xF
         OhlBQIOSZKiCxYJTbcqDjqyUHEYuhdTq6ILyXQUE0DUApZZw4bv7Drx/Dy47kDTqEsfA
         qpDX5nMtPbRJKFobXVDbJlM6/AA/bXgu0ovuOy32EEvC1y5DBnmhoZ6zK2jAbHwwxZlz
         m4iw==
X-Gm-Message-State: AOAM532g+5rTN0HDguNrWfls7iO9H8LKRy3CJfUClLIRBdqvhH7Q9SKu
	5MZ9V/Vv4tQdzkF1BkL5UG6+1JMmJpx9pg==
X-Google-Smtp-Source: ABdhPJxfx5qVAumS3YGeBeGvZCw47EovcEiEcmtN/k2c74rWGRn7Cz1H6MtnZvOG5MwqAW4qcXenWA==
X-Received: by 2002:adf:8365:: with SMTP id 92mr13715412wrd.23.1613303785963;
        Sun, 14 Feb 2021 03:56:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id k11sm18713394wrv.51.2021.02.14.03.56.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 03:56:25 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] classes: Drop now unneeded umask flags
Date: Sun, 14 Feb 2021 11:56:25 +0000
Message-Id: <20210214115625.1961614-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210214115625.1961614-1-richard.purdie@linuxfoundation.org>
References: <20210214115625.1961614-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that 022 is the default in BB_DEFAULT_UMASK in bitbake.conf, we
don't need any of these task flags, clean up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/baremetal-image.bbclass | 1 -
 meta/classes/base.bbclass            | 5 -----
 meta/classes/image.bbclass           | 3 ---
 meta/classes/package_deb.bbclass     | 1 -
 meta/classes/package_ipk.bbclass     | 1 -
 meta/classes/package_rpm.bbclass     | 1 -
 meta/classes/patch.bbclass           | 1 -
 meta/classes/staging.bbclass         | 1 -
 8 files changed, 14 deletions(-)

diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremetal-image.bbclass
index 90d58f26152..b0f5e885b5c 100644
--- a/meta/classes/baremetal-image.bbclass
+++ b/meta/classes/baremetal-image.bbclass
@@ -56,7 +56,6 @@ python do_rootfs(){
 
 # Assure binaries, manifest and qemubootconf are populated on DEPLOY_DIR_IMAGE
 do_image_complete[dirs] = "${TOPDIR}"
-do_image_complete[umask] = "022"
 SSTATETASKS += "do_image_complete"
 SSTATE_SKIP_CREATION_task-image-complete = '1'
 do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d287065e08b..b4160402f08 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -506,15 +506,10 @@ python () {
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
         d.appendVarFlag('do_prepare_recipe_sysroot', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_unpack', 'umask', '022')
-        d.setVarFlag('do_configure', 'umask', '022')
-        d.setVarFlag('do_compile', 'umask', '022')
         d.appendVarFlag('do_install', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_install', 'fakeroot', '1')
-        d.setVarFlag('do_install', 'umask', '022')
         d.appendVarFlag('do_package', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_package', 'fakeroot', '1')
-        d.setVarFlag('do_package', 'umask', '022')
         d.setVarFlag('do_package_setscene', 'fakeroot', '1')
         d.appendVarFlag('do_package_setscene', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_devshell', 'fakeroot', '1')
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3239d5cf5e4..cda866cc81e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -248,7 +248,6 @@ fakeroot python do_rootfs () {
 }
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
-do_rootfs[umask] = "022"
 do_rootfs[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask rootfs after do_prepare_recipe_sysroot
 
@@ -261,7 +260,6 @@ fakeroot python do_image () {
     execute_pre_post_process(d, pre_process_cmds)
 }
 do_image[dirs] = "${TOPDIR}"
-do_image[umask] = "022"
 addtask do_image after do_rootfs
 
 fakeroot python do_image_complete () {
@@ -272,7 +270,6 @@ fakeroot python do_image_complete () {
     execute_pre_post_process(d, post_process_cmds)
 }
 do_image_complete[dirs] = "${TOPDIR}"
-do_image_complete[umask] = "022"
 SSTATETASKS += "do_image_complete"
 SSTATE_SKIP_CREATION_task-image-complete = '1'
 do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index cb723fc1d60..b3d8ce330e8 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -314,7 +314,6 @@ python do_package_write_deb () {
 }
 do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[cleandirs] = "${PKGWRITEDIRDEB}"
-do_package_write_deb[umask] = "022"
 do_package_write_deb[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
 addtask package_write_deb after do_packagedata do_package
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d31dba0c8f1..600b3ac90ce 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -273,7 +273,6 @@ python do_package_write_ipk () {
 }
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[cleandirs] = "${PKGWRITEDIRIPK}"
-do_package_write_ipk[umask] = "022"
 do_package_write_ipk[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
 addtask package_write_ipk after do_packagedata do_package
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 43a825ad424..c48bece7428 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -745,7 +745,6 @@ python do_package_write_rpm () {
 
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[cleandirs] = "${PKGWRITEDIRRPM}"
-do_package_write_rpm[umask] = "022"
 do_package_write_rpm[depends] += "${@oe.utils.build_depends_string(d.getVar('PACKAGE_WRITE_DEPS'), 'do_populate_sysroot')}"
 addtask package_write_rpm after do_packagedata do_package
 
diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 25ec089ae12..cd491a563de 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -160,7 +160,6 @@ python patch_do_patch() {
 patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
 
 addtask patch after do_unpack
-do_patch[umask] = "022"
 do_patch[dirs] = "${WORKDIR}"
 do_patch[depends] = "${PATCHDEPENDENCY}"
 
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index bbe8cff9b1a..806a85773af 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -90,7 +90,6 @@ python sysroot_strip () {
 }
 
 do_populate_sysroot[dirs] = "${SYSROOT_DESTDIR}"
-do_populate_sysroot[umask] = "022"
 
 addtask populate_sysroot after do_install
 
-- 
2.27.0

