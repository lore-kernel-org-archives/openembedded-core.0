Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.4211.1611616126250679170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 15:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bFH9onGt;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: dorindabassey@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id n6so17545371edt.10
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 15:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3JQscXuZPZTxC26GnEAeVD8n7yw6hONsYC+ofHApuyI=;
        b=bFH9onGtRP1Htw0fTVCv8eCyoitF7dxzCKvcUDsHscxxIgEYf24MOkBJMILsNb/uAa
         IrQ+3nzXdbI47vPS+T91OWAP39Fw1kPn8XVpe+HCZKKXPBnt35/5ex/IAtBbe66jgo/U
         jKVLYKZxfC4gelrj1pNZk6Kma4Ore7xawiQqe9wqpnRvTMokg8ePMQLPJVSqUbg4NWTy
         NHogYaKbcBlDt8SXsKSu1/fgM7S4cswJoYO5mAGYctREaOOXFgOzRdP5K//2zK/nOY9k
         3iXVVwMht1BaZ7ySl2uIiVB8X38Wl8xLqeZmBwqDoQwZIYDbv8Ks4OtqjijJz9uT3bDD
         07UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3JQscXuZPZTxC26GnEAeVD8n7yw6hONsYC+ofHApuyI=;
        b=Qe2BZn/FqWD9hj+RbDMMse0qbvi9sbxE+pJ2H/mZpeoXuWML1ZhXOaW253V0KuySwB
         0ix6o1TYZuIrd+wjBLGgNlroguPCm4bD8edLkKl4n7yTEm+7kchaujYH0A1ebyELf8Mr
         R2E2f/yJYCVCHSDOYj5PKbvO+IaziEeceY7YQSAppwxL0Tv0qxAI1RR72XY+7/+6UVFl
         aF8HG+k61JwLxqnwV7oOqq9JOqFATSQcX/UmL3AwXDF7L4SKP4CxOFsnc560hRhZHPmw
         W0JbwZ8xiJhAfhLURuJiFshQ7JSG95SukY2MrgFfnBdrLBG80dEukQenpQOcOPXPFTt9
         aRBQ==
X-Gm-Message-State: AOAM5321YpZUP0wuQsJgHA/fnvYbYd/gITfCNQE9znvfnNtruRnzY28B
	aofW/LGWzp81BEJsmPb6GBoNSyXIX+s9Zg==
X-Google-Smtp-Source: ABdhPJx+YquLd3xeBxmE46Np4V0fK2RwSQxtekBKD/ysUfrV89kSrj3JI2vk1kswcTBH60dlBALFIg==
X-Received: by 2002:aa7:cd4c:: with SMTP id v12mr2361995edw.17.1611616124447;
        Mon, 25 Jan 2021 15:08:44 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([197.210.29.84])
        by smtp.gmail.com with ESMTPSA id o10sm8997523eju.89.2021.01.25.15.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 15:08:43 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
Date: Tue, 26 Jan 2021 00:08:11 +0100
Message-Id: <20210125230811.21862-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

If a user builds in a path in PSEUDO_IGNORE_PATHS, random failures are generated. Hence this patch adds a sanity check in sanity.bbclass to ensure that a user isn't building in PSEUDO_IGNORE_PATHS.

[YOCTO #14179]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/classes/sanity.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 2040b48595..14271c1ca9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
     if (tmpdirmode & stat.S_ISUID):
         status.addresult("TMPDIR is setuid, please don't build in a setuid directory")
 
+    # Check that a user isn't building in a path in PSEUDO_IGNORE_PATHS
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    workdir = d.getVar('WORKDIR', expand=True)
+    for i in pseudoignorepaths:
+        if i and workdir.startswith(i):
+            status.addresult("You are building in a path in PSEUDO_IGNORE_PATHS: " + str(i) + " please don't build in this directory: " + str(workdir) + "\n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.17.1

