Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.15024.1590160420882850140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 08:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XCZWkedL;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id l15so12695872lje.9
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XEc/28rdDt/GXx1aljnm2II+jFAw6Y5BZc0auJ5nYzI=;
        b=XCZWkedLcLEs4a+I5stxJuS2MqUNq53gMc+qXIQuxrlYUZpT5AB/KUQGGvVXvzwgbF
         o3eO/AWJr+au9Ps5ADEulEmbYeir5sWOXAod4F8zGpwlPhZLgBgL9qZU9pHmaNqlsL0A
         jsrFF72HtYDl5FS5bVV8tshUJAGTN4eaT/2e45uROn13zKssFu4YAgEV/RZLJnyvPuNB
         CrH6V/xTd40rHsyVMY4FvpKojnV57rFs09y4fZLqPFzGnrj6H6uRi816dht7H2KiCTDO
         9IUbS/xv6bX31WOiUC8cAiXJEj49rF2G6yD5BYXTECLE/ZyCCsYNbnZcZiFvzvizEG/t
         Wocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XEc/28rdDt/GXx1aljnm2II+jFAw6Y5BZc0auJ5nYzI=;
        b=FM00fRujpAE+d4nvULPO2tV+WyKeunpZPJXEKpX+yJ9Wo3l1bWCHJHOwTzl8VQgFsP
         2+v3McBdqMoIchHF5SWlEigDdnRMTSANUzR8uyuVem9/nMhBw+nsXt9y/d8DC6wvxtwK
         P0bj1RMPnsB8eYykAQLclTO65oNYjwb8V4rDvCmS1Bk2sTUju51waL9SWN4NeX896n9o
         fPyC2Bl2SOTCgVSe1NKyA0f3qaCrv2htxqTB/wQvXaO4ibrxj72FM8aoDcX9tFC9R/5T
         NEorhfZpWrAvJHDvUc5h1TQVa9OBbh+eZ9U0lUAQ3+nItIg4fwVcpfi0ChiE4M16Poxh
         NICA==
X-Gm-Message-State: AOAM5333/3H8s6OnEhpL9mCCvXtHu3ysdxmXtd6STDznNkr2Ee1hKpFW
	5EVoz8rYrxWxD+fzo/kSWyXdTS84XQ==
X-Google-Smtp-Source: ABdhPJzIYXhTtitQ8lHcXpjfFGLpTSHQJ9VvXKKHqDg+3dhvGa/NeB7y5tMbxohQdrD1Mq/ZstFWLA==
X-Received: by 2002:a2e:89d9:: with SMTP id c25mr6299186ljk.366.1590160418489;
        Fri, 22 May 2020 08:13:38 -0700 (PDT)
Return-Path: <ptsneves@gmail.com>
Received: from localhost.localdomain ([176.221.120.36])
        by smtp.gmail.com with ESMTPSA id i1sm2388025lja.3.2020.05.22.08.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 08:13:37 -0700 (PDT)
From: "Paulo Neve" <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [meta-oe][PATCH] 1/2] package-manager: Allow for package manager user fields.
Date: Fri, 22 May 2020 17:13:34 +0200
Message-Id: <20200522151335.7918-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want the user metadata added on the packages but
if the index generator filters them they are useless
as they get to the index.

Allow user fields when populating the package index.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c055d2b0f7..b4b3324d0a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -218,7 +218,7 @@ class OpkgIndexer(Indexer):
                 if not os.path.exists(pkgs_file):
                     open(pkgs_file, "w").close()
 
-                index_cmds.add('%s --checksum md5 --checksum sha256 -r %s -p %s -m %s' %
+                index_cmds.add('%s --checksum md5 -f --checksum sha256 -r %s -p %s -m %s' %
                                   (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
 
                 index_sign_files.add(pkgs_file)
-- 
2.20.1

