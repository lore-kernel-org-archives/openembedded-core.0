Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.2117.1627671850961108847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 12:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F3jgB2ss;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bkylerussell@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id x12so5724850qvo.12
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 12:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K1hp3yb8bQ9Ymd5cKfEIQjsCtNc+Wj9gALrEVjaxU7U=;
        b=F3jgB2ss+0lJYoKbX3SpG33kB7LlDa6tox0PAj/c672TZA1ui/1tNWd2uQDpG4gmrY
         FVXcD8QANg8Ujo+wCXmEcC6PKhcrwmNrot80Gy7fJ//ZzeqboJR2P1MX5aTEJ+mEqLwn
         JdWSYtxh/wRHl62WzG8e07U+DcTba75ws2QxQWZ/7ygi9JXDplmchyPahPx30mT1Ct/v
         jKc6o3x2sT4xdobxN/144jPRsLbATWYc/qRu11DjOIVyQwHwq8XXDOXKB1W8WCw5AOQg
         e6bC3uPMOHvKuuhls5xkxGR8SAiG+GZ9HN5w5YFWSB7sAPqLouSK+yZ6bgpqwWpwkFvZ
         1eeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K1hp3yb8bQ9Ymd5cKfEIQjsCtNc+Wj9gALrEVjaxU7U=;
        b=aa2vBVmPSLMfh9tcKCG6DjsluaQh7g3Zwnpnu754MItJ3LnCtsaNAeSueZKfzCPH6b
         9rRzrVjIrPsAWZ176x+HzkpeQyuguKFxSILzeSmbrTrOo/g9hRzVuXdNplUUYTBH2FUS
         TkjhKPtpvNDk5y4JRfd5eVrJ5EaPEeZvwu+6yiQAOVHdmhAx6zEDRsfMcZD5FRNs2ZDD
         F1m26KLjrxhImovo80YtvZFu5TYzQILIPGzndwJOs55921Y5koc48ql7pzx9BjKw+O3b
         3whWU5LGieJQ8k4oypDrMZzQuhOqG09UXt9kZnV7/KeJQv3wzfPp8a/q6oMfS29qmJrh
         AadQ==
X-Gm-Message-State: AOAM532pNTwOtqxsmrcp2gOa1de8hyaUFn/grmn4qmHCCjfWzMnoYTnt
	HFpwehBeqhQ6zAqKUbXJB9+QUEnXiju0Xg==
X-Google-Smtp-Source: ABdhPJy38ybZ2WhzfalmFjY1TZJEwcncHxvCPBi0x/olQHjI3i1T5RhOUhwxRanvQ7MPwiU23SBZhA==
X-Received: by 2002:a05:6214:e4e:: with SMTP id o14mr4395216qvc.46.1627671849697;
        Fri, 30 Jul 2021 12:04:09 -0700 (PDT)
Return-Path: <bkylerussell@gmail.com>
Received: from poirot.file.core.windows.net (cpe-24-26-62-248.mi.res.rr.com. [24.26.62.248])
        by smtp.gmail.com with ESMTPSA id o6sm1327182qkp.111.2021.07.30.12.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 12:04:09 -0700 (PDT)
From: bkylerussell@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH] gcc-runtime: do_check should execute before do_build
Date: Fri, 30 Jul 2021 15:03:57 -0400
Message-Id: <20210730190357.369782-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise, when rm_work is used, do_check may not execute before rm_work
causing do_check failures if the workdir has been removed underneath it.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 59d9a24686..607971adca 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -314,5 +314,5 @@ do_check() {
 
     oe_runmake -i ${MAKE_CHECK_TARGETS} RUNTESTFLAGS="${MAKE_CHECK_RUNTESTFLAGS}"
 }
-addtask check after do_compile do_populate_sysroot
+addtask check after do_compile do_populate_sysroot before do_build
 
-- 
2.25.1

