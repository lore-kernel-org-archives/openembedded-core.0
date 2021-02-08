Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web08.35511.1612792485073136401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MA0CGhMz;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id r75so2017395oie.11
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eAWI85bPhq0BlrRDuPAXqmfzNqnVNplc98Dz7s3iszs=;
        b=MA0CGhMzI6i0BAoSyNA/qLIgSNSB5fcd9dqeiDuTS6/6FvlBfIIRsj4MdaF+UoUHRz
         cJ4PMbeyWOs9qcG82CX2KCGniqhp7yRWDkcfVwcjfB4PjFd3iARsit25eod3bLEEvnml
         uCx5erwxQvnzrzdBOfCpHR2UCdGjkblDE0Tm1o1YNqXCRKsjq3fc0kFVNWm4jvQB/uiS
         MPrBzGcSoZQ1mMvsyU8m9sLizrxRrKKawq4ykdicnS5R4tHibzipXt52lbJO7vfGAG+T
         Nzc+D7lKO3dSYRPrcduFqeVNxp5hJL4Qjhmw+WRHqu+FZ0/LDgO1E/7CLcE15iC7YKML
         WZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eAWI85bPhq0BlrRDuPAXqmfzNqnVNplc98Dz7s3iszs=;
        b=Ct2a69aG5vH6vy9yOs5CcmxHHhOBuD0vyZYxecaYcytXLUuC+iE9DzhEQPSJWGYzyu
         YbxvZeDX1UxYccUCOVISljic0OsP5KWqUHaoJEE2MJm1N9wDTcVNcyYQSf1VU8RU7i4I
         zoEKJ+5yCqHjdWvxdetmV+ui+w28EPRruHVglFv0ddTECfKCfkf9GDW+qE7DY3zPoQGg
         Etp15KUojQ1A2/kgOBcLaHWPr1XryPCctNhHYuXn8yDe6mdOgIUGjwBjw1QKxdIYBYgN
         UogJYqY70iI6/hi4UuCMTUT8wAmHRNe/8G+ipGugDmsarQ9vM3dmNqX9rBoWOdll3kaz
         lhKA==
X-Gm-Message-State: AOAM531nIyiPrvq+GxmdN8PDGfjehtzKxJJqeBwjHOnwlHq1cLULn8ua
	590GRflWlB3Kxd+/7QUtrS5LCXAHMnDgAXjHdyk=
X-Google-Smtp-Source: ABdhPJwwEyZ6A2JaGzO3YAHZ/1DFFNXw7XqvN3lLzzexxsC9B+1Wh4ye2wjgv1CtB1M6HuCo5ClgDA==
X-Received: by 2002:a54:4108:: with SMTP id l8mr2500690oic.177.1612792484021;
        Mon, 08 Feb 2021 05:54:44 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.54.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:54:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/28] python3: Use addtask statement instead of task dependencies
Date: Mon,  8 Feb 2021 03:52:09 -1000
Message-Id: <35ca0a401e62a8a8b88c3089929eda401a90f762.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

The externalsrc class deletes do_patch task which results with:
| ERROR: Task do_create_manifest in <PATH>/python3_3.8.2.bb depends upon
| non-existent task do_patch in <PATH>/python3_3.8.2.bb

Use addtask to define correct order to prevent this error, since addtask
mechanism accepts deleted tasks.

[YOCTO #14151]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a746d034fa7eaad4f4876fa61c5a8c3c15e211c8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index a86542e547..a448b3ed97 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -312,11 +312,8 @@ do_create_manifest() {
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
2.25.1

