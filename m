Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.4933.1611618839443154692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 15:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I8FWRQ0U;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id q8so20326544lfm.10
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 15:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C/iU+zFK49NuddWQt6IW2W62UwL4Fl9/0sjchLmvFKI=;
        b=I8FWRQ0UV5+nq3PDuZf/2IJTwf8ONWqDmT2iitB2+mEwotOutuhJ7218XTok2KMO/u
         DZVBj5wHelyiCljzqQmVv9WVIEQvq60wxZEkkrngGB/Zc67eh5GckqXSxrLnH9PMxdK8
         7IBERkw9MIojyqhboGWlQiMV7IPUIMhPvlgi3uI3SWAEjXkw8akzEzcVGmKCoMRDj6EA
         ONfAmkLiZloAwWLTjVIWLBcMuPmWB0qpk1CWhwDxtehscWjVxkMeeDZ8L993N2IcHHhg
         rN7B7mgP3nS/ZlhR4Wf7qaEZVVmKS1Wcb/W5ICKD8OZ19AGPaT3dZiHRbExNdUzJRpOH
         KZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C/iU+zFK49NuddWQt6IW2W62UwL4Fl9/0sjchLmvFKI=;
        b=mpet1ykNbvGkenoXQruru8wcGory81RxF+tXTgznTZQqSCjCSYpGRWHZ0uUAgltKmw
         NqWDSGtY2AOirtH05imRggxtim8Ef4sQRdJW5exLe+1S37z7hDwJtx4trizwv+7ji1/V
         q5lzFmaTjE7bkU+c02KHetqn5QiSoBR8xbZqzf2xedCehvDVRiK045leswxYQALZfVvE
         NP6xGKTJ6Gn0ly9SdKxC7GyPDHxhCKowPMv4wsKcO74r3Gec9/E8OmklkYfz7t7ic92H
         MxVtHMyX3mPxG9KiaebQjx0dpZq8bRrgySuQ8MeU+YUKZdbWp3RQ+mpimWTMF3+SMJuN
         FNKw==
X-Gm-Message-State: AOAM531FbJuXPkelqCFA5zJFs13FAmAHcReIYAY3z/r6epFalC9mclLq
	eySZJ91JKXi0vzPQwCk9psZu9zNga34=
X-Google-Smtp-Source: ABdhPJxnvdAs15JXgDGjFiLl2zoJnSkkDP+Pi0GIyGkG1UguMEPe28jAoHxBPp1KfIoy5iDTB1k/AA==
X-Received: by 2002:a19:838c:: with SMTP id f134mr1296288lfd.424.1611618837361;
        Mon, 25 Jan 2021 15:53:57 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id y10sm2659306ljk.10.2021.01.25.15.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 15:53:56 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] python3: Use addtask statement instead of task dependencies
Date: Tue, 26 Jan 2021 00:56:26 +0100
Message-Id: <20210125235626.41707-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The externalsrc class deletes do_patch task which results with:
| ERROR: Task do_create_manifest in <PATH>/python3_3.8.2.bb depends upon
| non-existent task do_patch in <PATH>/python3_3.8.2.bb

Use addtask to define correct order to prevent this error, since addtask
mechanism accepts deleted tasks.

[YOCTO #14151]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/recipes-devtools/python/python3_3.9.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.9.1.bb b/meta/recipes-devtools/python/python3_3.9.1.bb
index 17d0c032f7..093ebfe7ef 100644
--- a/meta/recipes-devtools/python/python3_3.9.1.bb
+++ b/meta/recipes-devtools/python/python3_3.9.1.bb
@@ -315,11 +315,8 @@ do_create_manifest() {
 }
 
 # bitbake python -c create_manifest
-addtask do_create_manifest
-
 # Make sure we have native python ready when we create a new manifest
-do_create_manifest[depends] += "${PN}:do_prepare_recipe_sysroot"
-do_create_manifest[depends] += "${PN}:do_patch"
+addtask do_create_manifest after do_patch do_prepare_recipe_sysroot
 
 # manual dependency additions
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
-- 
2.30.0

