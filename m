Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.23051.1594147199719667096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 11:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bjarne.michelsen@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id y10so47667131eje.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 11:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nYkqNwy6QYtHCYelGI3XB0RddXBZj24ryjGZjwQV9TY=;
        b=qA8h76vMktr8twHhFqyb/VG0HwqOh7OsRbgMIC0+uJWM4dRk0WYRd0KMq1kewzxZoW
         ESZjym2qB5lGnMQ81sXgAtGoqyeXxewN8Yrqc1AMdtb0USzLEGFsJA9ca+OR5218OrH3
         ALtmK/rmgCMQJ9Ne1DypsI+2vuEz6WKHAGgfYhlYiIkKTd/j8gqtuVQvTP6F0KPhgMpa
         o0u/iuuoOWSIsWUc1UaYszkjDcbBCLZf7SV8yMG5pcuyZoiILA+V1oduNpFFyKNL1Y6m
         pu1redqcMYCkYUMKtROwX1XdXkNKVkViAW3SiXJHEBkSvY/OEhL7Mkhhn744yTAstfEt
         rVHw==
X-Gm-Message-State: AOAM532jcVZIBQhDR6rsGlqopcaKOkw00dfz8TP5Cjwn7nX5y0Zef9bL
	b3IWdcssUJFODQoCjNuszTOhyPiGL1w=
X-Google-Smtp-Source: ABdhPJwYKrb1kH4yZ2QLXv3r1eQdRJ2E7bb/JLwK73Ek6BwL9qjAF5IDbxmys8eJ1quKY6XO7Y3sww==
X-Received: by 2002:a17:906:1c0d:: with SMTP id k13mr50615473ejg.477.1594147197985;
        Tue, 07 Jul 2020 11:39:57 -0700 (PDT)
Return-Path: <bjarne.michelsen@gmail.com>
Received: from bjarne-ThinkPad-X1-Extreme-2nd.fritz.box (ip5b402d63.dynamic.kabel-deutschland.de. [91.64.45.99])
        by smtp.gmail.com with ESMTPSA id w3sm715073ejn.87.2020.07.07.11.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:39:57 -0700 (PDT)
From: "Bjarne Michelsen" <bjarne_michelsen@hotmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Subject: [PATCH] devtool: default to empty string, if LIC_FILES_CHKSUM is not available
Date: Tue,  7 Jul 2020 20:39:47 +0200
Message-Id: <20200707183947.12660-1-bjarne_michelsen@hotmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: [YOCTO #13971]

A recipe using LICENSE=CLOSED would normally not have LIC_FILES_CHKSUM
set.
If LIC_FILES_CHKSUM was not set, it would cause `devtool upgrade` to fail.

This fixes the issue by defaulting to an empty string if
LIC_FILES_CHKSUM is not found.

Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index ebe72282bb..0c1de8cdc7 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -550,12 +550,12 @@ def upgrade(args, config, basepath, workspace):
         try:
             logger.info('Extracting current version source...')
             rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
-            old_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
+            old_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             logger.info('Extracting upgraded version source...')
             rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-            new_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
+            new_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             license_diff = _generate_license_diff(old_licenses, new_licenses)
             rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
         except bb.process.CmdError as e:
-- 
2.20.1

