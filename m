Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.20294.1591969070691696366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 06:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vFVjv3us;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id p5so9750362wrw.9
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LyJ6wGQ3nqKU+Il8fbJ/PyXmSLomL0cEYioeI0w+M44=;
        b=vFVjv3usYRYgrBY5IYogvH/uPjnJCGmv9HEhRUbf703HJB/k5W/j3KkdOI6RsmxkMx
         xUvQfJ4mcqTkh5hV1nwEKt8Tg7QV2CazNXfmPb3V5mHDKurl+2v01mba0CgcG1V9aHNB
         mStPUXgpIPfhKTV/Yxc8eUEbRw2Z42EH0RAbe+YzTrlqjDGyHyKCCu1LQ1EqrhqMHdxF
         b8iV+y5AwpkvdOnA57hoCE9ee8QVNbCIz5BzUgJkytmlVwmSxZ8tWvBtf3gkSpFGOgjb
         RE87+XOWnIjjEGZe/nGnabA/QFh4FLV2CBWeAgN9t0JsWROCXTyYOHBESA5A5DxbHvHf
         0O2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LyJ6wGQ3nqKU+Il8fbJ/PyXmSLomL0cEYioeI0w+M44=;
        b=NL8pkLJxXGvulx83QT0zd4z45BH+HOdwfzS6BfJvuWg6PrnGASqIzHJueQ69agzLFT
         NF9qWle6NfyBz1HY1e0iVRD5ngDzvJ+VqpQENpJxDK0A1sE3X2opDjSDGf26peC0vVAm
         s16qiREBCRYqRGMjFEfCWfMIxQBLLTGKRFS+2zwtqhXH+kfdB6lc04tuhXF8u1CS24xt
         SL/taHNgjxNjD3QGaUnUwltWI/U6Kc3qvfrd4OsWACqGN0HZTpcXUd+oAm665ILUHhgr
         ZPq7LRTYX4XHv8BJ7WHmZPLTqL3Z9w1YaRAoE07BOAEcKR5lvyOjp3r07aEM5QOjA1nB
         W8aw==
X-Gm-Message-State: AOAM530rAvPEAKqYDLGhC8i5S8g437r93RB72qSUmz89YhonsVO1g7mf
	n+W6JuWxfqpyAvFL1NYWDRbJCbgzv3I=
X-Google-Smtp-Source: ABdhPJwVLMV9GVLnK+oMdTLX+9BtyjV7gqYXDto0j9Dv4B8A+C7jT7urfu+VarKICkyPqlv5GHv6dw==
X-Received: by 2002:a5d:4705:: with SMTP id y5mr14000807wrq.98.1591969068827;
        Fri, 12 Jun 2020 06:37:48 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u13sm10158600wrp.53.2020.06.12.06.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:37:47 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] recipetool: Fix list concatenation when using edit
Date: Fri, 12 Jun 2020 14:36:40 +0100
Message-Id: <20200612133640.79089-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

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
---

 scripts/lib/recipetool/edit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/edit.py b/scripts/lib/recipetool/edit.py
index 94bdf7bca4eb..d5b980a1c03e 100644
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

