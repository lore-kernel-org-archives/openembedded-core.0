Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.1645.1589908260267491004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 10:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XikAwmLB;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id yc10so12640384ejb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d4I3AvrMpha4LN5KJARl0wvdcOOiu58x5YzkZ/Z/Zuk=;
        b=XikAwmLBuDk0WDdistpen39Ey1wLXTk1nzdwRe5ilquUShfBnTKPSraIhoQBfgeR1g
         DwL//zbTOW9NlZJBTDy9GkrsVSkVBGzm7sprM48pj8QFIyoGA45qtZsUV60adPqR7v9s
         EnxzoTeC5tYahg2WDQC3YxBCJkIEPNXSjUGgtDJAnQjN0zSyZ+gNdYABK5R+IaS4q0Eh
         14R4XzRzXVuElRZjTYxqVxhHLIBIA9J7plSzSYE3k36CY9VmaOV+ukWtH60aaGS14RNf
         eVJ0lwadF/LZDbNQv2KZd+3AwIYPQ1pGce2mhKLPhyTz3wlylzgC8PJCbTP/T77c22Nm
         1IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d4I3AvrMpha4LN5KJARl0wvdcOOiu58x5YzkZ/Z/Zuk=;
        b=A5hzBVJFDMwC3I/p+KCrWHUoGR7Dy0+xKUBf76nJgVD95j1pomTPQ7dVv5nwPVs4dn
         r0pqEfZRR7rrgIuQhcTofeGNPmSY9KPeuXP5Z4eOKFrAUZ5ymVS7G68Iow0aex2DpaW3
         XBeHqJdYMAY1X2BnX0oRf9aDorOXl5Inm6n3WYAoggdKdpsViGiy4NDhCNX28MvkBjAJ
         GGCbKjgAr+XxPeyVFy3A8kyHvyE28NAWJfJbWPaSDRwOcueOZaQYh/HsJxEiYlitjqiq
         DZjPnI9bBo9/FyOuuUh6wVvEuKnnai076AUZ+JhWZ4sohCwI0kBlXTBigHjj6cYJtAZM
         bcUQ==
X-Gm-Message-State: AOAM533wEeFVpbK719K8tGlwTRlB/fDauas3xBbgaZuN5Icty6NzuzYL
	vNjfTIK2Jheu4ErVj5SuKC11TfuF
X-Google-Smtp-Source: ABdhPJxN3mj7naDSu6jG43vqPcZtX1IPVZPSDGLziw3lcKUrXyrvtwu1DSoGLYI/3sAUFnGoJIqhwQ==
X-Received: by 2002:a17:906:584e:: with SMTP id h14mr202797ejs.257.1589908258384;
        Tue, 19 May 2020 10:10:58 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id a18sm79073edb.44.2020.05.19.10.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 10:10:57 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] devtool: do not write md5sums into upgraded recipes
Date: Tue, 19 May 2020 19:10:31 +0200
Message-Id: <20200519171031.28850-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will drop them md5sums from recipes that still have them,
and will not re-add them for recipes where they're already
removed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index cb6dce378a..f962a71e41 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -391,12 +391,12 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
             newvalues['SRC_URI[%s.md5sum]' % name] = None
             newvalues['SRC_URI[%s.sha256sum]' % name] = None
 
-    if md5 and sha256:
+    if sha256:
         if addnames:
             nameprefix = '%s.' % addnames[0]
         else:
             nameprefix = ''
-        newvalues['SRC_URI[%smd5sum]' % nameprefix] = md5
+        newvalues['SRC_URI[%smd5sum]' % nameprefix] = None
         newvalues['SRC_URI[%ssha256sum]' % nameprefix] = sha256
 
     if srcsubdir_new != srcsubdir_old:
-- 
2.26.2

