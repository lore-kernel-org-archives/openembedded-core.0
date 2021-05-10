Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web08.32537.1620657043384754776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SRC+grN6;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id k25so15970697oic.4
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tLh2oBrL++sBnF0HxXQxIZcHY/aHYNYrlHt1yk2vE9M=;
        b=SRC+grN6BPcoL0kzlxF3rqBfBiHoIGqZqGoybBLSfDUNhCR3JTssviJtFbBDILTa5H
         lSPEKaDzxW2BbtLzjoW+97PXqL6l0scNfHUNuF5fqWAghHbrAPkQO8Z/ja7tmnMEwzUV
         LLH0cFAw9yjOb0gbKY1LFeUgC5hKSiwLstG3o/fr9VSnc6awMOJb5vaFydx1+/+AXdsc
         tuqMCqbRzme5l3gyhtKJE3ZU8SzqFJhHXiVG5E6Px2ZydiKmRdWVgLFnn6efM58vu+EE
         o4ECMNRO+/eFTUAAgbKnVolGkp+8YB0ALNoBSmIQD31HQFMAJFrdCGMdXZw7LNMv+1Y6
         0JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tLh2oBrL++sBnF0HxXQxIZcHY/aHYNYrlHt1yk2vE9M=;
        b=sqsTvGh/5E0mBplUKACqmdxqnHhGkKHs4Ajahp6QNuxvxHsdnH+pc9bAGr5rS/PzZI
         +kIc3pOuIUGXk1nnAsuxEJmUpGmEIDcksoh/fHiHxMmts+NMjIypNLm7cWlvWMo5tFnm
         qb3fMOwNKhfIliP7SLmUwbT5yZVpI8a0BnekF7CuTK2syFyWCRK2GrIy17XR5lpgZbMo
         NAHWzHGjhw2+74IoQBD/03czrcqtpBXwitmr9KMQRG31D19K53So5fMjEgXp1Koq2aXI
         7x8vAKvS4JU6ECe6V08Uo4trYxQ5wREOmHTfemtiuNGt9mCfrYLZcbyBjFg+GdCngOVl
         npsg==
X-Gm-Message-State: AOAM5314JPx6kjRuWRrI/HalyTMStKhWcGPCtWI6zyv6XFYrSp3vZMN/
	JVaUg1fCWAtyhDYut6lHVh+oUHNxuV6v11UiEU8=
X-Google-Smtp-Source: ABdhPJzKohhMhyia5dtqDomy76gacC5am8kpsuancRMPK0zMA+ymVrWdOOqbfC2rA3xXzMP02BmeWg==
X-Received: by 2002:a05:6808:1488:: with SMTP id e8mr9385232oiw.122.1620657042283;
        Mon, 10 May 2021 07:30:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/25] rootfs.py: find .ko.gz and .ko.xz kernel modules as well
Date: Mon, 10 May 2021 04:28:53 -1000
Message-Id: <e198806404472a10230086b54544d83077381d19.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christophe Chapuis <chris.chapuis@gmail.com>

* with xz PACKAGECONFIG enabled in kmod and xz module compression enabled in kernel
  the do_rootfs task doesn't run depmod in the image, because it thinks there are no modules:
  NOTE: No Kernel Modules found, not running depmod

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c13ce05eae0f126eb150e48709e9bd06e9280fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index cd65e62030..23e156c47b 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -304,7 +304,7 @@ class Rootfs(object, metaclass=ABCMeta):
     def _check_for_kernel_modules(self, modules_dir):
         for root, dirs, files in os.walk(modules_dir, topdown=True):
             for name in files:
-                found_ko = name.endswith(".ko")
+                found_ko = name.endswith((".ko", ".ko.gz", ".ko.xz"))
                 if found_ko:
                     return found_ko
         return False
-- 
2.25.1

