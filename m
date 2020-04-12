Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.11380.1586697763989080835
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2020 06:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: bjarne.michelsen@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id f20so7506633wmh.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2020 06:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DMCiu7pDJ2DeFkfXoS8QRzdapMc32wMpSnjfQNglMsU=;
        b=FF6S2TkMoBHf1gupmEvS4gufGwZQjlC/nwt/dG31/N/t65GrHvDvhLIOlh/sEbbpSk
         2OmjaUHlml0djAO8lCI7UyrgaMxjJSEiioFX1DXTbR+CotmdlbHUBvlQE34TnCDYxyTz
         PS/Q+mTSI4cuzNycJTyf/AuWWGxiWRbATtJwjI/2eyv3wX2jKfemzMALMNdwctVkHeLx
         kbfi4FIWT54smRNfWHCeCsfpc49DJtd07hwsju8ciOuduMUT445RhDZwdl9Cep/zgDPT
         lOr1eUjX6pSyBBw0itdAj7mgMYq5tnj44u6tOrF+ioTPj7KbU9fStCj2WIZbKNZWGgDQ
         57rQ==
X-Gm-Message-State: AGi0PuaYfFjoqQ6CqujPU5LhjGp0vjOvlK9hnGZ/LfIpV7A23EGYeTIK
	AfIaqiLrUHNPTyg007NHzHVXq6hmzLeII/Ll
X-Google-Smtp-Source: APiQypKeSFZxky1xzgVKCJA15kcpVb1qZEBrjGTrrrtS3tpBJ87/9o8ZOhLgT37n7Nn290QQ5vAhLg==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr14285894wme.20.1586697762111;
        Sun, 12 Apr 2020 06:22:42 -0700 (PDT)
Return-Path: <bjarne.michelsen@gmail.com>
Received: from bjarne-VirtualBox.fritz.box (ip5b40d6eb.dynamic.kabel-deutschland.de. [91.64.214.235])
        by smtp.gmail.com with ESMTPSA id z18sm4706355wrw.41.2020.04.12.06.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 06:22:41 -0700 (PDT)
From: bjarne_michelsen@hotmail.com
To: openembedded-core@lists.openembedded.org
Cc: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Subject: [PATCH] devtool: fix error where no license checksum was found in recipe
Date: Sun, 12 Apr 2020 15:22:23 +0200
Message-Id: <20200412132223.15582-1-bjarne_michelsen@hotmail.com>
X-Mailer: git-send-email 2.17.1

devtool upgrade currently assumes that a md5 and sha256 sum is available
in the recipe, no matter what is the value of LICENSE.
This fix will just default to an empty checksum, if the parameter is not
found in the recipe.

Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index cb6dce378a..7066ddd51e 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -215,8 +215,8 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         if ftmpdir and keep_temp:
             logger.info('Fetch temp directory is %s' % ftmpdir)
 
-        md5 = checksums['md5sum']
-        sha256 = checksums['sha256sum']
+        md5 = checksums.get('md5sum', '')
+        sha256 = checksums.get('sha256sum', '')
 
         tmpsrctree = _get_srctree(tmpdir)
         srctree = os.path.abspath(srctree)
-- 
2.17.1

