Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.6501.1601503960772277692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S19xE12J;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id g29so2132142pgl.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uTMDxG8H42HcUzzW4/F4aU8uDc1ZLQkqNG1ue31rC8M=;
        b=S19xE12J1EYO0la8rpkpbpa7RXMYC25W9tyCDBd4dQdmXGT+IZgguaIDr9Ph60TJWv
         LYmSB60HlcAxuJb3ZENCzb/4j6PjGTLpdXRojsCdPa53CCsnCHVfjHnA3WmIetjG/MaM
         5x/srntsfX9ECdvemMTgJgVmSkfxw96jq7xZPd65LsRXc0spBgry7GXl0eAuW0Y5z/pV
         kp+094vEjl7T+xMiGvIykOOwmAYU4/iJhOo01Ken1LaOp1BMHD/IbmvgqCSO4PM1dhyD
         9pXSx6M/myUGpH4uJqDtzadaaB2pM4m+vfktd0lJpzOv6Hyuv3ZCFGk4MBdF7I9UwQb1
         bDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uTMDxG8H42HcUzzW4/F4aU8uDc1ZLQkqNG1ue31rC8M=;
        b=iS6ig6jbm2cV4rnqj2q86EnaHUiSu7+iL2kRlNF4DJrU1XFqsdYDAm4C+uQa0s8xNB
         GOs5mWG8KYXVhxUgYN+fOAseM2cYjwxKQUaeyVsQofxR/2Gj/jqydDRsG56vlHwhX2nc
         Ch4n+siXCdAm9ekfpUKz4Ro3jQTxtcGa+mRb0s03qtOTJLMwkP0De94oImwBt04etE/b
         fUPBfUmdr3TXfY/PmjQEfeVAyAnFHFZmFSZpO7PNu+WXCqZYY3G0bNfuRkGc6Wt9j76u
         BvPX2o+TB8dCH+zS1UZeV1DbIFMZfQo7zzYTaKcoKAMLZ7uUfhrNR1+beq7ukBvAVRV8
         QEBQ==
X-Gm-Message-State: AOAM531oQ8aL/fLMhntSzIvV5OawJw00f8kIxmsMNNHRu0g4V6Uyqtvz
	nqJS5YYrJr0CBgzdLd2GlcvTv5mnkdKcXl6MZFg=
X-Google-Smtp-Source: ABdhPJxCRPiymu2suN6jhIxglyXrUTR5ACu7ko1uXPtfSlkB9H7M3hQmSkbVqDq8HhCBcrP+L5tZoQ==
X-Received: by 2002:a17:902:74c5:b029:d2:ab80:4a56 with SMTP id f5-20020a17090274c5b02900d2ab804a56mr4346497plt.30.1601503958925;
        Wed, 30 Sep 2020 15:12:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/41] insane: check for missing update-alternatives inherit
Date: Wed, 30 Sep 2020 12:11:17 -1000
Message-Id: <0845f6b09716d927c586be5be878d08fa53b31d1.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Andrey Zhizhikin <andrey.z@gmail.com>

Add a package QA check to test if the recipe sets ALTERNATIVE variable
for any of its packages, and does not inherit update-alternatives class.
This causes the do_rootfs to fail since a proper alternative cannot be
created.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 24b5ccc76d5660fac38ac5346666380a0ecce359)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5b18fadd60..601b6b65bf 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -29,6 +29,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
+            missing-update-alternatives \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -988,6 +989,14 @@ def package_qa_check_unhandled_features_check(pn, d, messages):
         if var_set:
             package_qa_handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
 
+QARECIPETEST[missing-update-alternatives] = "package_qa_check_missing_update_alternatives"
+def package_qa_check_missing_update_alternatives(pn, d, messages):
+    # Look at all packages and find out if any of those sets ALTERNATIVE variable
+    # without inheriting update-alternatives class
+    for pkg in (d.getVar('PACKAGES') or '').split():
+        if d.getVar('ALTERNATIVE_%s' % pkg) and not bb.data.inherits_class('update-alternatives', d):
+            package_qa_handle_error("missing-update-alternatives", "%s: recipe defines ALTERNATIVE_%s but doesn't inherit update-alternatives. This might fail during do_rootfs later!" % (pn, pkg), d)
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
2.17.1

