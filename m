Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web09.7016.1612440646084284197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 04:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uOI47Zc3;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id l12so3128193ljc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 04:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72iFEFE3J3eAWwnC1eNpWaCxmhxbG9DNmCDN/Omw8MI=;
        b=uOI47Zc3VYP9JV74WA+L3GsXXg9P0QQQeSbeQ/nVNMkHut0ohYC3tl7Rm6ydIcr3Ra
         UtmSU3gf78hsoX3/hr3Vn78Cca07FFcPd1UynadQz39U8SW/kjgBh2/ZYQNnUfIU7W7W
         0ZlhTzq6/oXfDLDIYE1ot6n4kAFRCmD4icujLs8GhZrJrNZAxp0jXxOJWgAB/xO5lhTT
         CuiIzTOK63CHWqcDzm4q/Eq+sLdE0vkcgMqFY4IVAIKa9/Jk6BUZYVKpNz1LNwDuJQLe
         Hf2U5SfE5kglLajPTilzg4MaInBJeJ7uZ0E9vamaIsfbgfyXxQzDO6Rq6SGS8+11t23O
         Uk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=72iFEFE3J3eAWwnC1eNpWaCxmhxbG9DNmCDN/Omw8MI=;
        b=ZfyLZRtk7cqX6k2NqCMRwyKoufFTbDPes0RBDoW5UN7NUxHCvEZRaT0Xh1hfoYsbw1
         GSPMI5JNdEdyojroiu9jM3kyqZs1FcvLo4RKr9TDD022ufqhypn49DQlInxkKYBYcsSe
         Il/h4XVLvzRz4XT8BxEUeAr2KmBYDJ2++2EsOcdrDEaJ7VVmSX/ZCI1ft63PVQJqNBVt
         0LhX10yQfabn69AnE2LdWP3dww4lClN/J0Su8wIgaG61Id1mhJAQTtd50n0nkUPihymV
         HC0B1D33RvSw4betXONym5H1e7nTCxd0M1osOvrLLZa4LFWdUmw+VzifyiaWGS7JKIvw
         WH6A==
X-Gm-Message-State: AOAM533x2hxbmYCM5e/UQtTHd8WH1GiFuL4wuCUzXNtyIHq650IqP4vu
	X2NLks9W0fgzkedoFcbaHnJHumwoNSM=
X-Google-Smtp-Source: ABdhPJzXWdrDLf1YXYNL3C4KmZlKmY1wm6ueVemYmPxkKlL3xrzxc6CTUj6a0EnKqQ3qbRiN0DqoiA==
X-Received: by 2002:a05:651c:506:: with SMTP id o6mr4793978ljp.262.1612440643888;
        Thu, 04 Feb 2021 04:10:43 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id d21sm581388lfl.199.2021.02.04.04.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 04:10:43 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] license_image: Introduce SKIP_LICENSE_MANIFEST_RECIPES variable to prevent from trying to use license recipeinfo file from image recipes
Date: Thu,  4 Feb 2021 13:13:23 +0100
Message-Id: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If image recipe depends on another image recipe it will try to use
license recipeinfo that is not deployed. It will result in:
| Exception: FileNotFoundError: [Errno 2] No such file or directory:
| 'TMPDIR/deploy/licenses/foo-image/recipeinfo'

We can't determine in a simple and efficient way if dependency recipe
inherits image.bbclass, so let's introduce SKIP_LICENSE_MANIFEST_RECIPES
variable that will contain list of recipes that should be skipped.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/classes/license_image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 8fd88cfb2d..e2f3178306 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -223,7 +223,8 @@ def get_deployed_dependencies(d):
     pn = d.getVar("PN", True)
     depends = list(set([dep[0] for dep
                     in list(taskdata.values())
-                    if not dep[0].endswith("-native") and not dep[0] == pn]))
+                    if not dep[0].endswith("-native") and not dep[0] == pn
+                    and dep[0] not in (d.getVar("SKIP_LICENSE_MANIFEST_RECIPES", True) or "").split()]))
 
     # To verify what was deployed it checks the rootfs dependencies against
     # the SSTATE_MANIFESTS for "deploy" task.
-- 
2.30.0

