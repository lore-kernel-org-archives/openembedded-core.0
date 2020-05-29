Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.31657.1590746535782387875
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 03:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SofjPfFg;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: maurofrqueiros@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id j10so2812719wrw.8
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 03:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PRPvBNfULF41X8uOeWS9ppU1dSp4coCQpdvN83aDveg=;
        b=SofjPfFgGScL12R1qer0F5WeANfScCU5tfmRaZh/4+wXsQ+7MjM+qrHZUu+wYNGtN3
         yb0IwzWyXqdrXzI7PjtJViuW1lr78Fkvs+LlxFnUYjyDQXr3EL8y2Ai+1tMfZoluDWDH
         xoTLrAJFIusOwcnUgy25bmOmsHbxzoIeUXjHhgx/NyrP35iPc9tuXgGobzt3ZohhIthK
         XjHA+pRZhwRfpVqx+S4HDObK+iOdt3NOjyhbbk6tKHfjjXvqWet+XweHp9ZwDpt1aQzS
         MJfNpWorT7psA6YMJqFCZ9AlhNVwh6nTtS+Sq+eowatEIuWommAlxl/DUJ4jhdhm7qvA
         puXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PRPvBNfULF41X8uOeWS9ppU1dSp4coCQpdvN83aDveg=;
        b=hrmJWoRODkdPUb9Okg2QPGMpLnGHgOqHIqlE8uJn/fp4OnBfCfz8NNV6crszhi7ssw
         nIe9/0ojNGIafBIGGTesJAzwy6e2c8iJLe0MGY/4ZpoySS5LKrz1IQ2YfGhZ+eaPTMLS
         s5dTIKQd2rOMWb9Q5qe/NhIcTyx1kpSC7t1FKLcffnie5db5qPaUfCLkowcP+OdjRUEx
         O6U6XGQMhYzPhpRG4UEuzAl1obS/2/zFgeYKUBcTrJalqilaP8jUUrp5UZPOP8reXEII
         ozPLjJ/Sv950Yg7qrIVaEgRhvs1kRy5mFJ2eTZDWJ+Tx1v64fBWepHaD4S2S0sCZfg30
         ihtQ==
X-Gm-Message-State: AOAM530CaEGkNf3jjLIRzlCKIWnZk6eOxnsQFRq4KlF9EdurQfH70V4E
	p8u0Y0IkWCxJ+c8ROaYfbW+qDq9qu94=
X-Google-Smtp-Source: ABdhPJyh7H6yMzyM0nJ6WWre2f+mPI1GTokL0oR0MQLogpGYYQZOJlQdbQ8XkENUI6mcxpH8kVk+kg==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr8247365wrt.185.1590746534059;
        Fri, 29 May 2020 03:02:14 -0700 (PDT)
Return-Path: <maurofrqueiros@gmail.com>
Received: from ctw-bre-003.criticaltechworks.com ([83.240.214.249])
        by smtp.gmail.com with ESMTPSA id u3sm9445322wrw.89.2020.05.29.03.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 03:02:12 -0700 (PDT)
From: =?UTF-8?B?TWF1cm8gUXVlaXLDs3M=?= <maurofrqueiros@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mauro Queiros <maurofrqueiros@gmail.com>
Subject: [PATCH v2 3/3] git.py: Use the correct branch to check if the repository has LFS objects.
Date: Fri, 29 May 2020 11:01:59 +0100
Message-Id: <20200529100159.32393-3-maurofrqueiros@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200529100159.32393-1-maurofrqueiros@gmail.com>
References: <20200529100159.32393-1-maurofrqueiros@gmail.com>

Function "contains_lfs" was only looking at the master branch when searching for LFS
content. LFS may be configured in specific branches only, so we need to use the
correct branch.

Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
---
 lib/bb/fetch2/git.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
index eab76a10..dbf87156 100644
--- a/lib/bb/fetch2/git.py
+++ b/lib/bb/fetch2/git.py
@@ -566,8 +566,15 @@ class Git(FetchMethod):
         """
         Check if the repository has 'lfs' (large file) content
         """
-        cmd = "%s grep lfs HEAD:.gitattributes | wc -l" % (
-                ud.basecmd)
+
+        if not ud.nobranch:
+            branchname = ud.branches[ud.names[0]]
+        else:
+            branchname = "master"
+
+        cmd = "%s grep lfs origin/%s:.gitattributes | wc -l" % (
+            ud.basecmd, ud.branches[ud.names[0]])
+
         try:
             output = runfetchcmd(cmd, d, quiet=True, workdir=wd)
             if int(output) > 0:
-- 
2.17.1

