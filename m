Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.9583.1598954562933272886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 03:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eP0Iwq6B;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: vijaikumar.kanagarajan@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id z4so827773wrr.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mFOv17Jz4Xv41GA823JWfmnviMWuwHGvJ7K/CdvJ5Oo=;
        b=eP0Iwq6Baum1g7rY9TPXBtvxQmrnA5kzr8N2jUJ+z2SIqzwAhX4dR6J8VFTxYYs4iA
         4mPcdqL25CKTCiuqP0jiWyxRJPVC0rDOdSgD1w+LuOaDhQmpK3YmJVwEP16ObVBhyBA/
         mla8kb6LtHu2fGfyeKwQYj/k1sxb6VNiS7srU8rA1D0ro+HiaLvZQ1uDaTI8KvRVKtu2
         qLdRwPTkZYy3Z1z2JjnWSpaBCWjJxnDKMgnA8GrJqAFovadWhzhOt5AcS7ciGV7mcxvt
         5VI0b6u9700SYcAcuoS4rkqBDZJe/n3IBqbY13mpxAuZanmXphyJ/xlTn0mygGKUL18h
         Mdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mFOv17Jz4Xv41GA823JWfmnviMWuwHGvJ7K/CdvJ5Oo=;
        b=KYU4+BrHI75xE1E2Dc4Zw0afpe/Cekzs5CDAeMZk3OYjuDIHfCs5eWf3c3+mqWzBCS
         iU9nAjd6ShEjcReq/if/HmAGPxQikBO4sth9TZQjD3vQxkkiXU+qQ5s9m43CThrxkoq0
         zG9OIMXhXbxsS55o7Q6NWWSF2mQ1cF9nmPkC+3WfLRJIdlpiv2QqLUEh5ZneidQ5DimN
         EdqCbVmrJRZlndT8rRK+LU1VTkuqCJFifI3ZpYglG1Feuy0Diq98SVjnyaYO801JqrZ/
         PxVHtCNPkb0M9w3EXFw73R/OAoWcfu0bGJqYExe75Uhk44o39cYqPq3QynMl0d5PADul
         +1XA==
X-Gm-Message-State: AOAM531dcexfkcpbuiKfe8qnfXw3TsSX0v7eYmBiRnFKVTgMKcqHB8d9
	gKss8nP7x7S3zjdBN3AomEJhKy3qz8MRcA==
X-Google-Smtp-Source: ABdhPJwMoD5P3quWsVL9qbI46PvbBJSOe1vkoEmHFctrQPTDtQDtPdqZh/+1CBbhylgeUYyHWBuW9g==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr1027518wrs.230.1598954561092;
        Tue, 01 Sep 2020 03:02:41 -0700 (PDT)
Return-Path: <vijaikumar.kanagarajan@gmail.com>
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id y6sm1443521wrt.80.2020.09.01.03.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 03:02:40 -0700 (PDT)
From: "Vijai Kumar K" <vijaikumar.kanagarajan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH] wic: misc: Add /bin to the list of searchpaths
Date: Tue,  1 Sep 2020 15:32:33 +0530
Message-Id: <20200901100233.8765-1-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1

/bin is also a valid path where one can find executables. Add
that to the search path.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 scripts/lib/wic/misc.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 91975ba151..4b08d649c6 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -138,8 +138,9 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     if pseudo:
         cmd_and_args = pseudo + cmd_and_args
 
-    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
-                   (native_sysroot, native_sysroot, native_sysroot)
+    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin" % \
+                   (native_sysroot, native_sysroot,
+                    native_sysroot, native_sysroot)
 
     native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
                    (native_paths, cmd_and_args)
-- 
2.17.1

