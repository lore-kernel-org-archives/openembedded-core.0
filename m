Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.8760.1605624164949356444
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 06:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uenq1K+j;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id s13so3449780wmh.4
        for <Openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 06:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bqs/gO0JvWx89zFYlfOgV6OFcvQ+P4aBSMPjbSurRQQ=;
        b=Uenq1K+j7dSyaskxRQPMTfcO9xphkPtr/CJ8l+uQztYC0fmTGN3l1BxeZYQly9Ef4n
         UJ6nK2DHBg9ah8TCWhTF4JZrzOrasiSxmZzgbGxR5H/5qcEY72H7M6zdaiOQ8d6Z0psG
         x6cruIPZjuqbKfBNzXNoudkS9WpZyYALKYNJYy6GamL/OKYXc1FplCrWgZZN6fVV6SRU
         2WGnSloStSAPTYwa/tvRZl84HtH6+lCPQRaS2iOrylPyItf2/n271WKMPr4KqhNLKYoJ
         nyrhZUMGFDEwXhEPtaCpb2BLfwFoETQOVhI+WsQlQtmu042LR4Sp5WFHKOIWVot8TkRd
         nobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bqs/gO0JvWx89zFYlfOgV6OFcvQ+P4aBSMPjbSurRQQ=;
        b=fHmdDH0kXk7cb6Y9aS4XA63F3ccY7SnFqqdRM5fAvVm9uzwMVpOLpcolGmFbxjTkV8
         zBFmO0jpJCetvRh/WW4dknB9nHMTNNDhcuXaWcwk6RwPNEHHot6KgpIZcI4dT0BbXvYo
         ZnS/rRdUI4vCUH9MzPnzKyzGQudpwpCxFIQekEk/qYCef/zFo4kXRuNW+nExrBmlbMbi
         559hfNrqnqs4BEVfOjshmUDyHaj3xTUIOPlcquHMS+HAuKwyx1tJAMRGR2P8dqlwmYNg
         PWVQR5cfiAqzRG89xy5ZuHlROnU3UHy6uwXysoSEs+LMPUBSu5DlX7hFP6EOVRIXO/fz
         I8ng==
X-Gm-Message-State: AOAM532/jmHpOwaOjxWOgseT5CYF+QaZt4J2o7lxcmLyw8ea/Q/ZFsCv
	71tAw7ny+HvD0YNASF3wXYyNt1yxzR+z8Q==
X-Google-Smtp-Source: ABdhPJxq29CC3G6UKdGjSREAqrdCCgATZPWI0szaY8kmrGFPkbT6sHMJzIGmTYRMIM/1eQXEyDROuQ==
X-Received: by 2002:a1c:4884:: with SMTP id v126mr3435800wma.160.1605624163133;
        Tue, 17 Nov 2020 06:42:43 -0800 (PST)
Return-Path: <uvv.mail@gmail.com>
Received: from localhost.localdomain (dslb-002-205-007-251.002.205.pools.vodafone-ip.de. [2.205.7.251])
        by smtp.gmail.com with ESMTPSA id s202sm3960895wme.39.2020.11.17.06.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 06:42:42 -0800 (PST)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [PATCH] license_image.bbclass: use canonical name for license files
Date: Tue, 17 Nov 2020 15:41:20 +0100
Message-Id: <20201117144120.441804-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When copying license files to the image rootfs, i.e to
/usr/share/common-licenses, a canonical name of a license should be
used, otherwise duplicated files end up in common-licenses directory.

For example, GPL-2.0 license according to conf/license.conf can be
referenced in recipes as GPL-2, GPLv2, and GPLv2.0. If a license name is
used directly, we end up with three files in the rootfs with the same
content. If a canonical name used instead, then each license gets copied
only once.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 meta/classes/license_image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 702e9f9c55..119c8dfc86 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -125,7 +125,6 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
 
                 licenses = os.listdir(pkg_license_dir)
                 for lic in licenses:
-                    rootfs_license = os.path.join(rootfs_license_dir, lic)
                     pkg_license = os.path.join(pkg_license_dir, lic)
                     pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
 
@@ -144,6 +143,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                                 bad_licenses) == False:
                             continue
 
+                        # Make sure we use only canonical name for the license file
+                        rootfs_license = os.path.join(rootfs_license_dir, "generic_%s" % generic_lic)
                         if not os.path.exists(rootfs_license):
                             oe.path.copyhardlink(pkg_license, rootfs_license)
 
-- 
2.25.1

