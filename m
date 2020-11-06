Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.12505.1604673393868370764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hGtKX+m+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id g7so1511365pfc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=d8L+SCTLgnytmJDp0mpCSZfrfqm4dRhqhDDyoy7OHEE=;
        b=hGtKX+m+sytz7tkqW/6Isg81dzyzUohG+r2jXwIIlBQAACRQvIr7/kiy6AwWFCji+d
         cCeAt0Sydma9gStPmZShIRG0jSP0w1XIC9+snqZpcQLCgR+rY2ItRwppeC6GQxQdn1Vc
         l0xU8v7Q2B0m2VhxdJ3Ki14CtZLpPsAlqUvC6EAcWC9o/6nUBvJQSf/KSh2qR+I+z/OX
         00m3j4rR3iOJdKITeF5wuY0nLw680aiqT+6oXIzA/NnzyqvhP/ZHS8q4JWE8mmeO07u/
         t84hU7O+HR2aLRAX+0m+QHQUK0OMnlJwwoMe0dE2g648xFsXAEnZM890WR+kA+NKKbfh
         J6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=d8L+SCTLgnytmJDp0mpCSZfrfqm4dRhqhDDyoy7OHEE=;
        b=iHV1b4NZHp6abxlAiwNS0KwNbJpjTdKxBvYrE3C8Nm18Ug3Rc+3XdLfnOYuEkHP+yh
         fPHNywRi/aa6dA4MEHhwCkeF8PgkXOb1iySd7gCQdMVHsS448X9bnrn3KbkwrxGiZENP
         /OXiZhF77eEhQtMpoVzXZBy35IDDYII2l7QLSU1NGuAEtmpHARL7aVwjApsu8YnrRWlZ
         eB2UmliaUQg/pxFeo5UwpsqfEjZAAdCT7co0pArttnzGFX3yxhkR1VkCeC/hmrQXMEm8
         R6qmklUTDy//QrGuyKLemG7n1EnRpI49mOySturyoBLeFfJnb5+Ba0eLFxJi2XcUbJM0
         yp4w==
X-Gm-Message-State: AOAM530/l6L3crymo7qN6wZJA3yBVfwdO0nL3DKLtexXpqrpvOm+/avu
	dSrwTdpqykx5s0v9JK9YaGDfAOEc1LYCNtVR
X-Google-Smtp-Source: ABdhPJxwC/nJFEck7nj5Yq0Jcr69/JKd42/fGp3aYA2QNO3pKffYtYlXZz0sVmlQOE5lWfSs4oa32w==
X-Received: by 2002:aa7:970f:0:b029:161:ee2d:bb9b with SMTP id a15-20020aa7970f0000b0290161ee2dbb9bmr2253391pfg.63.1604673393013;
        Fri, 06 Nov 2020 06:36:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/20] sstatesig: Log timestamps for hashequiv in reprodubile builds for do_package
Date: Fri,  6 Nov 2020 04:35:20 -1000
Message-Id: <cda769ed7c120edd7db0ff77e34fa1aa611a3082.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently if a task generates the same output with different timestamps,
hasequiv won't detect it but reproducibile builds will fail tests due
to the different timestamps.

Add do_package timestamps to the hash when reproducibile builds are enabled
to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 11e8200ccec765ff6a4263e06512e5751eca261a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index d24e3738ae..d5a6200562 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -477,6 +477,9 @@ def OEOuthashBasic(path, sigfile, task, d):
     h = hashlib.sha256()
     prev_dir = os.getcwd()
     include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
+    include_timestamps = False
+    if task == "package":
+        include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
     try:
@@ -551,6 +554,9 @@ def OEOuthashBasic(path, sigfile, task, d):
                         bb.warn("KeyError in %s" % path)
                         raise
 
+                if include_timestamps:
+                    update_hash(" %10d" % s.st_mtime)
+
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
                     update_hash("%9s" % ("%d.%d" % (os.major(s.st_rdev), os.minor(s.st_rdev))))
-- 
2.17.1

