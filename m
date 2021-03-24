Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.176.1616596783517472029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KOLdh6hN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id ha17so11867177pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HoWoy6xzGrQG9kgsgcakyXVZbzh4M6Mt78FpcdZLtCs=;
        b=KOLdh6hNt3CysgK64CTOxDVdY+vXJ7ALrixA5yI45/GD9z9Gym63IBSEd6slmzrDcO
         B7g/UKgCEQKfJM6G89Oa+pDtzRbV0VEMC7DtRqXqoUE+2f53uLuqvQ6wQr7VJxVjcZKt
         KXYPYSTAmQtFYAasM8Ct8r8Hi+RRZ3xGmjkCUPf0zdNdJCBfuR+HMVOC3+4IdwP4hN6W
         ehvfOH3I6xpecO4H98ywvHt2d1RkhHNDv4rQH3Gd+OAmgkYiW9MeTDJ9+kK0BKsajQZQ
         xtfF2vdty88ZO1/nTQFWVYW5YkZm4AbzVA02aH1EJQPWP5Bk5vaxitSMGLTpaHGctR44
         ssEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HoWoy6xzGrQG9kgsgcakyXVZbzh4M6Mt78FpcdZLtCs=;
        b=kKMb9+KTkgnmOj/08YCIDnSiVBHm6dw8EqeI+FejuX+NCeptVH/W7YbszJFJUnqZve
         AsclsRGbhVl4SobeJjS9JTHDm7gJjIgAPdxI1wtHqyNTDA4hFycxkf/s++8V6ZUdFkyM
         gRNHeJ0hFEW9TDbKn3Ngq3DixxDkBTkVVzYqiIyGXzjN6VRnxe7nwW4BcvK5Ft3Tee03
         UZC027S6EI+IJ1YZqVxunIR3NTbAZFlCQ2Vff7DxMQzLpWdVpmEJtczfvNlHEvJ5b5Iy
         fdx39sLoYoTKM0Qq7C8DgNhRkXW9q03dNX+JdQkMe+IGYT3axOhI4zJX9Fst+l6Xy9mU
         KZTw==
X-Gm-Message-State: AOAM530cut18Gef0dGT7aSDwiTzIFU5sjxqW+pu2641OmdVGGq0JXaLx
	jVhqdbW3YxA8IZokXah8X6T4RJ6Y360nsuCI
X-Google-Smtp-Source: ABdhPJx9pa81KfYMveYNZT3lqEDYBy3XIjG45c7tgKkNE9wb5rd3iVOuanVmwfl2TbKpDClzXO7/pg==
X-Received: by 2002:a17:90a:5b0b:: with SMTP id o11mr3739151pji.150.1616596782454;
        Wed, 24 Mar 2021 07:39:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/21] devtool: Fix do_kernel_configme task
Date: Wed, 24 Mar 2021 04:38:58 -1000
Message-Id: <5f27d66b5e3a7bffc23c140edf76fc8fd4cd5b23.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>

The do_kernel_configme task is no longer part of SRCTREECOVEREDTASKS,
its been removed from the kernel-yocto.bbclass since b72dbb2e4, but
there wasnt a matching patch for devtool for those changes.

This patch enables us to invoke the do_kernel_configme task when
using a devtool workspace, it also prepends a check for an existing
.config file in the source directory and moves it if thats the case,
since when using devtool modify a .config is created and
do_kernel_configme complains about it, this is not the case when
using bitbake since the .config file would be on B instead.

Alowing do_kernel_configme to run also fixes the flow where testing a
new config fragment from devtool workspace isnt added properly
(config queue shows it as ///frg.cfg) and as a side effect it never
gets merged into the final config.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 08dcc0e68095dcf2a159546a48b29d40c9aabc0b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7b62b7e7b8..f364a45283 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -953,12 +953,17 @@ def modify(args, config, basepath, workspace):
 
             if bb.data.inherits_class('kernel', rd):
                 f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
-                        'do_fetch do_unpack do_kernel_configme do_kernel_configcheck"\n')
+                        'do_fetch do_unpack do_kernel_configcheck"\n')
                 f.write('\ndo_patch[noexec] = "1"\n')
                 f.write('\ndo_configure_append() {\n'
                         '    cp ${B}/.config ${S}/.config.baseline\n'
                         '    ln -sfT ${B}/.config ${S}/.config.new\n'
                         '}\n')
+                f.write('\ndo_kernel_configme_prepend() {\n'
+                        '    if [ -e ${S}/.config ]; then\n'
+                        '        mv ${S}/.config ${S}/.config.old\n'
+                        '    fi\n'
+                        '}\n')
             if rd.getVarFlag('do_menuconfig','task'):
                 f.write('\ndo_configure_append() {\n'
                 '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
-- 
2.25.1

