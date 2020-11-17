Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.16961.1605656906623286484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VIbKGHR6;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id t143so147866oif.10
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QPXVlFshVMvZGT4OC5n0z5/LeoCujGUFQtzeiA4Nhnk=;
        b=VIbKGHR6sxxPO0y9LDc6+8lUKk1r3Mi1vE4Lf1u4Hl80l3IZ672rrOGb9IX6ExEXYo
         qLP5aby8nLhDoEUoWvD9T0Q0twlRFq/Z8U+kW4xR+dxu0D6nO4ghvOgJfQG60VjoLXoz
         UuN3Xef8bhyMwr097qp396Wdez4HFuE6JeHIlHGYYgtcVn/OKZMUoKZFo0EGpQb9Ifkb
         FK86wlIC3bi586cR/6MRT5+mgOxtKeEf0zux0RVLJuvp31rdXSomRW7QTUz4oEgQ8eOY
         XXGHFxaogHKTRHNv6Z83je5WlvesDmR7HNx+IPrDXZ9O5MPg7i2y2D9cNP2MwAGXcDRW
         geHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QPXVlFshVMvZGT4OC5n0z5/LeoCujGUFQtzeiA4Nhnk=;
        b=PQuf8FK1o6ZK+yND+mNSqF5VfqPKvlaX9QMOxUVW8+PCfUgJiiX+K72HBp1D5XXifE
         P2QCVluWpGhfr6uzPBVbqGAfZZTA6IcLfwaBH4Kz1O/n56AQvE+f95e87I/i+g/HRD/l
         RAw8wxpesJeVVmR93oZbtbbmqkHiO98v7f63EA3hRHAzAC6Cb1d5gpzcGqJJt24tWGxm
         PfI80TEQu6V1izgMjQjnTk0mB/91wh6NcQ5Qx/XO1UgVQH6/8Z2nIxMUpa/8UwFVDIJD
         zTKrR11Cxx3v8WOROmTndvC83L9sMGHy5ZnaKVZnjaBU4jDkZz1HqlxLaAQ7FK9U4h68
         czFA==
X-Gm-Message-State: AOAM532C2h0sIIwKqtngYNUJZl/6nV7zCQbv1C4mPvZYvF93YyL0AUXt
	scTMt+TUD3FmOCrj4UiizLesVGlcukCDkUyn
X-Google-Smtp-Source: ABdhPJw73X+TuBB+M6rx+3Em5Wu7tOHztzsOBIlYyr2XuyECYi3hJ8TaWi8fjMO2DLyn2Xb08PinQA==
X-Received: by 2002:aca:8c7:: with SMTP id 190mr1107951oii.24.1605656905575;
        Tue, 17 Nov 2020 15:48:25 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.48.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:25 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] lib/oe/reproducible.py: Fix git HEAD check
Date: Tue, 17 Nov 2020 13:47:34 -1000
Message-Id: <31f00ec9c6ab5fe74f1ba59f79322497ef8f4dc7.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605656725.git.steve@sakoman.com>
References: <cover.1605656725.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

The check for a git HEAD still wasn't quite correct because it was using
the .git directory as the current working directory. Instead, it should
be passed as the --git-dir argument when running git. Running `git
rev-parse HEAD` in a .git directory with no HEAD reports 'HEAD' and
exits with success but then 'git log' will fail, which is not what we
want.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cdbd47dd7e1657b91b65a0940b7cbf119764240f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/reproducible.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index f4f58dd952..421bb12f54 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -56,13 +56,13 @@ def get_source_date_epoch_from_git(d, sourcedir):
 
     # Check that the repository has a valid HEAD; it may not if subdir is used
     # in SRC_URI
-    p = subprocess.run(['git', 'rev-parse', 'HEAD'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, cwd=gitpath)
+    p = subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', 'HEAD'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
     if p.returncode != 0:
         bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.stdout.decode('utf-8')))
         return None
 
     bb.debug(1, "git repository: %s" % gitpath)
-    p = subprocess.run(['git','log','-1','--pretty=%ct'], check=True, stdout=subprocess.PIPE, cwd=gitpath)
+    p = subprocess.run(['git', '--git-dir', gitpath, 'log', '-1', '--pretty=%ct'], check=True, stdout=subprocess.PIPE)
     return int(p.stdout.decode('utf-8'))
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
-- 
2.17.1

