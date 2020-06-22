Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web12.401.1592848812639588001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RsyAf6zH;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id p70so16390385oic.12
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rsQTA373EIqeZKdwnZWYhwz566elJl4ijW834f7ZATo=;
        b=RsyAf6zHkHGhrGvW49htwgAk8EVUk/yxB4N0EICvo54r++isrn9QhrHtD0NxDU/PVL
         Sjs+qm9h5F52tfTcMrEpJNvaPLqSZUcL11BwMO9Cw6zN7ds/LjpWJ04CgHH6d3jTJ6jL
         DHKFR/HdINGqlUD1oJCW3fOxGcZRgGx5WQ7eju71nUcI3aHyFl9ETGtsh8vm8ay8UYnO
         5qAccISuyHDnwkleIhSQ15unW72UkYzACD7cjxIWNaSel89vzyQnIKtazysA6HJigOtt
         S/x8Wm8DB0u+gzCJ5YEC6QLZBosa6Hebr6TcY3mkl6tzqC9Zbw1Ek2n3STY0g/1+yMAI
         +Qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rsQTA373EIqeZKdwnZWYhwz566elJl4ijW834f7ZATo=;
        b=qb83Mz1zeREMwyy8OtRLu8PMXPahIzon2ahYopKwahcNV0Es8M+IT2ULFM4cX17ZAp
         2miRVjBNelqwGDr6sl4CHbdoyrkR5BC6MAx908nR5eyAD9co42ahr5q/vzmENcZ9atz+
         WKe7pXXl/lBPogBbqSiTbYNf1GDRcHcXnQ/TdVOv/KRLh3tE4Sa6f07C3CqcBRYIZfqr
         eYyAfv4Nqw8Ugy0IRNp/sY/iLMGEuuQsK/c1Ti9rACKQJcFsqTRMq6W91loKnyc76LDo
         lGVMvhog8aNGXrGtuFk62VKvSpIXrW44d56jJJ9pMI+0xTZDohcuepVOcXnCOhM2GiGu
         bN3Q==
X-Gm-Message-State: AOAM532XqcFX3KLZQDNzWgbK827JcUNY8Vy/otrYbJk5DDj6HmDTyOqf
	v7H5NFAnMGKXvYHlXY5gyNjPTSJuer+Zqw==
X-Google-Smtp-Source: ABdhPJygIVPR3qIhbKUrRpZxKAiPjNrK5tCFOB/hNOx2alBvwU3CcbmvtG+GP/VLHGx+T+wYLLb8fA==
X-Received: by 2002:a05:6808:299:: with SMTP id z25mr13486313oic.26.1592848811570;
        Mon, 22 Jun 2020 11:00:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/33] recipetool: Fix list concatenation when using edit
Date: Mon, 22 Jun 2020 07:58:04 -1000
Message-Id: <9a45c7fb2d4491d2d34500acef8ea6dcd4f5d9d4.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Alex Kiernan <alex.kiernan@gmail.com>

If there are multiple appends, ensure we concatenate compatible things:

Traceback (most recent call last):
  File "/home/akiernan/poky/scripts/recipetool", line 111, in <module>
    ret = main()
  File "/home/akiernan/poky/scripts/recipetool", line 100, in main
    ret = args.func(args)
  File "/home/akiernan/poky/scripts/lib/recipetool/edit.py", line 38, in edit
    return scriptutils.run_editor([recipe_path] + appends, logger)
TypeError: can only concatenate list (not "tuple") to list

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4c1e74bdf4922519d168434afd69c9bebcb9bd82)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/edit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/edit.py b/scripts/lib/recipetool/edit.py
index 94bdf7bca4..d5b980a1c0 100644
--- a/scripts/lib/recipetool/edit.py
+++ b/scripts/lib/recipetool/edit.py
@@ -34,7 +34,7 @@ def edit(args):
     recipe_path = tinfoil.get_recipe_file(args.target)
     appends = tinfoil.get_file_appends(recipe_path)
 
-    return scriptutils.run_editor([recipe_path] + appends, logger)
+    return scriptutils.run_editor([recipe_path] + list(appends), logger)
 
 
 def register_commands(subparsers):
-- 
2.17.1

