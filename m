Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.2395.1609185884400629481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M2lNNDqP;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id ga15so15590253ejb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Us2dpdyyGNP+26WBfhSZNN52f5OYghOD7/0ObbiCIe0=;
        b=M2lNNDqPd+GVtj8cFGBUoPtkHKVWsBVsj37l3XKG1l5fMT+O2HSPjO1Pog239NI26S
         ksUKM1zL6gYjYJsjPgkAyxYDziSOGlUyYaMVrcALAnWDN2y9NpOz3eCyp7L3dGCnBMrL
         N0jQ3y5FpUqMPnE3karsfy9qKtlCesOwJfOuFWh+6vxeEepgxHYcH8csc4UyL529dFWH
         LRP4NIyNza4XvnIMZcQGgwZ6u/ZpR2J8J38By+4bz8v3w6lKXJ407SQgiOgJJIUldFYX
         yI8PrKPM7+kR3liKV0hBgMIdjpZ/+bTVwBzvj91dfLTUErCh+sCgfoQBtFXrsGzOAzeR
         s+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Us2dpdyyGNP+26WBfhSZNN52f5OYghOD7/0ObbiCIe0=;
        b=ZAwXyrcGa6iL3MRBT4TASYgQN45o//J9Uy1D9/IMyUXoyFEvbHv9vn+DZRZ8vsiipM
         JylgJtfXOPPrqcJbYd5nG+3phe9d5m6JWEgj55R/mItXtI1GTLr+dR82eifDF+1L/ZBu
         E3P+NsSuNMrEXX94vaz3EZ5SDDjjkspPde03ImdaHim0yuPgkdO14u/Vm6RKkG/73lej
         QApK4UGHRRQ2MoerYLZ82Lv3AB95ZqH+tLXiZPNcrsb+DRgJFuF/4M6A85hNifLg2c+M
         ocNI75B4ZQY6/UlusxO9Fvi/tWdDIqcNMUzJWCaL9I2EjvK/1SPqHnLXSknOdQdLeVhA
         we5A==
X-Gm-Message-State: AOAM533/Rk90tNWAn7XKp8CdeXJBuq5sdoBfC5n1wY6yOwA6QVLKH7k2
	1P6Wty1Q4oNfhKkAbVO9kodIWeiffyA=
X-Google-Smtp-Source: ABdhPJy/GkL4Ph+A6+CUvcUTODFzaZ3r5Xwnh/ugdEnG5DRXmu2jfYl2Rbuz9Jp+tBB+DTnbRqSojg==
X-Received: by 2002:a17:906:e84:: with SMTP id p4mr29984802ejf.141.1609185882813;
        Mon, 28 Dec 2020 12:04:42 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:42 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/22] devtool: gitsm:// should be handled same as git:// in upgrades
Date: Mon, 28 Dec 2020 21:04:15 +0100
Message-Id: <20201228200436.78130-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 0c1de8cdc7..5a057e95f5 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -178,7 +178,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
     uri, rev = _get_uri(crd)
     if srcrev:
         rev = srcrev
-    if uri.startswith('git://'):
+    if uri.startswith('git://') or uri.startswith('gitsm://'):
         __run('git fetch')
         __run('git checkout %s' % rev)
         __run('git tag -f devtool-base-new')
@@ -270,7 +270,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             else:
                 logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
         if not skiptag:
-            if uri.startswith('git://'):
+            if uri.startswith('git://') or uri.startswith('gitsm://'):
                 suffix = 'new'
             else:
                 suffix = newpv
-- 
2.29.2

