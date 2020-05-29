Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.31676.1590746530406853091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 03:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f9isD9eC;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: maurofrqueiros@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id u13so2594972wml.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 03:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Pq1rjFiHyVfTgLwrY2X2NNS+e40M06+DBfE8mnJSS1I=;
        b=f9isD9eCffT7Fkc89t/nJaoj2ILs7zm/uA3dSbdfhz+OKJ2eb9MHVosLtBtU62rNyF
         wE/tOnGK/lTOoi6rSiLHjPH9Mo8yDS2GnBPixvG7NmMpDcSIWTCupqqdmLOYVE3TsUxX
         pxAWkwjXQond88+gZG2ikXH3XDxYSxQjhK4lmG11jyaNvj6MjwTFqJjLrR/5roJS5XIN
         OJ8wqlWG0z7maIwlicm1JLOj42T1oH7eHO0H8t4zM8uQ95V9V5+L4bvA9nRKzIyNjoft
         cQyheOsODtNb1BoQUabfX2dw/T7Pthjtx8M5g6lfQDnCajNhnylM8cBP0vli/M0wi8M2
         otaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Pq1rjFiHyVfTgLwrY2X2NNS+e40M06+DBfE8mnJSS1I=;
        b=WldY6fhNihSf9vMPGOjIqwm48ELcrBrdcuh2JRtQEh8IZQLuCd+TCHT/d529HmPTbt
         gO4aQIROq7+VAhgCZJ/KZ8MpB1BZXrNXxVQ6SHaRmbpPJDOjuXc6Y2Qnn/3X8oYH5GUp
         GOW+z1nadDa5B5PGRFgclyDHvHU7zMZPTx6gYh3Niy8CsJjU6/K0kjVSlZhSUJxmQU5W
         TD5Yt7DZHtwgj801eTyeuthAdwFITG6gl6FzwUSU2DrMHee9rHaXaRrsGRNq5mMCLaiS
         ABigZ/5SIRm0vAmKxjP7Z4GbI/c15XZzVK/39XotpmUcbOjSytHdm6vQMVilyDyboSlC
         OXIQ==
X-Gm-Message-State: AOAM532KLxAE6SHv4dqev/Ca2d8Q/DK66VcHTo7HBX9jyjbCmema+znG
	jgj9NSOUZlsqdoXlNScliLw2GhCefdY=
X-Google-Smtp-Source: ABdhPJzQtwvqa54LG6jovTmpuLx052D3gBIOhkpM5xJQggmmi0tFDlPXHB330nV+zGm6FoMmgJen5A==
X-Received: by 2002:a1c:abc3:: with SMTP id u186mr7778325wme.21.1590746528615;
        Fri, 29 May 2020 03:02:08 -0700 (PDT)
Return-Path: <maurofrqueiros@gmail.com>
Received: from ctw-bre-003.criticaltechworks.com ([83.240.214.249])
        by smtp.gmail.com with ESMTPSA id u3sm9445322wrw.89.2020.05.29.03.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 03:02:07 -0700 (PDT)
From: =?UTF-8?B?TWF1cm8gUXVlaXLDs3M=?= <maurofrqueiros@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mauro Queiros <maurofrqueiros@gmail.com>
Subject: [PATCH v2 1/3] git.py: skip smudging if lfs=0 is set
Date: Fri, 29 May 2020 11:01:57 +0100
Message-Id: <20200529100159.32393-1-maurofrqueiros@gmail.com>
X-Mailer: git-send-email 2.17.1

Git-LFS objects were being fetched even when lfs=0 was not set.
This patch disables LFS smudging when lfs=0. That way, only the LFS pointers
are downloaded during checkout.

Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
---
 lib/bb/fetch2/git.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
index 5b3793a7..4c7d388e 100644
--- a/lib/bb/fetch2/git.py
+++ b/lib/bb/fetch2/git.py
@@ -475,6 +475,9 @@ class Git(FetchMethod):
 
         need_lfs = ud.parm.get("lfs", "1") == "1"
 
+        if not need_lfs:
+            ud.basecmd = "GIT_LFS_SKIP_SMUDGE=1 " + ud.basecmd
+
         source_found = False
         source_error = []
 
-- 
2.17.1

