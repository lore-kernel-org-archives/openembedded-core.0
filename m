Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.7774.1624360892648261616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KZfyrJ70;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id s15so23101939edt.13
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oHGZM9FshOtJFv7qF42Z8ayEihfzDfEHS1f6in9alBs=;
        b=KZfyrJ70brzuCvoUqVUTb/oes3fZtzqoM8GGIFG6APCAETpmrWgtSAj0rh+GcgX1UI
         1JGkuoGsHHKe2gBm/I+DVIMtr0zH2EVaGjuVKyI4UnrKJi3GgoLIdzJiwPny2jdSRydN
         VY4dbl2lkvooxoM/ngR9jcpP5pI/rzlqylSe88GzXOALWZmuSLVCrW76oxhQaKeTozXb
         rgptpjpkhv/CXVobjYHVG1jz/Xd1Hi44o9yjfXv2yICfAWwIH9jhREhoz5LnmcxI2yMw
         aTjIL2y5B1AHSD0fH2VkcU4ubv23MzYr3lJBLxVwaoJGqKaqmwuRSPRGreJabKIxrW7o
         1HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oHGZM9FshOtJFv7qF42Z8ayEihfzDfEHS1f6in9alBs=;
        b=kguj9l0/x+aaDUbd6757YFwk4E9FbVO2EaeMN0oI7kff8A9L7HJv1k5hCEfQ2RGfRK
         FL7GvDWI/yb4fp7U/8H7wNsj4gSjidBdi6Z2ZR/dgVuFXyhSAx1FcOmNr3Q3BX/t8Q6t
         8anPMKt3W9R3Akovc5eYxK2bBP4hPgdrMcsVQRmIG8Yz1DYWVVJkO+QcW/KLwrCazvbL
         eeaJFs9GIO3LYwNGXr1tIaRMx8PQUX8sAIswRk/zQ4tZcgnhkLnjfxnEirFELnNUcVUA
         puJTZesVepav3m5ma4FtJ7pRdoCrwqBxM4nvbJYyecnKVkQCc6crd51dNd2ZU3oZfzLg
         uDFA==
X-Gm-Message-State: AOAM531U3LFH0sFagSOtLwVpoRvI+SXRLT8buGRVKYFd1ssvTryS+OHV
	74r6G6y3zyFkZjFh4gb2nzWSqPvsF+EB+Q==
X-Google-Smtp-Source: ABdhPJzc97iZkP3hBYvdSmoaq+Aqeil0PqA1atMqnZgBN6PFnaS2CNgHnmlxnHndLndbZNukR0eQCw==
X-Received: by 2002:aa7:d799:: with SMTP id s25mr4195301edq.161.1624360891219;
        Tue, 22 Jun 2021 04:21:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/19] devtool upgrade: rebase override-only patches as well
Date: Tue, 22 Jun 2021 13:21:08 +0200
Message-Id: <20210622112126.2026646-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a number of recipes (such as nettle or glib) which were upgraded
incorrectly due to rebasing only the default set of patches in main SRC_URI.
Native-only or musl-only patches were not handled, causing do_patch fails
and overall misery.

Unfortunately, this also necessitates aborting any incomplete rebases as
devtool needs to be able to return to the original branch to complete
the upgrade command.

Also, do not add devtool-patched-%version tags, as they are not used anywhere,
and it's unclear how to extend them to cover multiple override branches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 24e3700ece..c6d98299da 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -261,21 +261,20 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             logger.warning('By user choice, the following patches will NOT be applied to the new source tree:\n  %s' % '\n  '.join([os.path.basename(patch) for patch in patches]))
     else:
         __run('git checkout devtool-patched -b %s' % branch)
-        skiptag = False
-        try:
-            __run('git rebase %s' % rev)
-        except bb.process.ExecutionError as e:
-            skiptag = True
-            if 'conflict' in e.stdout:
-                logger.warning('Command \'%s\' failed:\n%s\n\nYou will need to resolve conflicts in order to complete the upgrade.' % (e.command, e.stdout.rstrip()))
-            else:
-                logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
-        if not skiptag:
-            if uri.startswith('git://') or uri.startswith('gitsm://'):
-                suffix = 'new'
-            else:
-                suffix = newpv
-            __run('git tag -f devtool-patched-%s' % suffix)
+        (stdout, _) = __run('git branch --list devtool-override-*')
+        branches_to_rebase = [branch] + stdout.split()
+        for b in branches_to_rebase:
+            logger.info("Rebasing {} onto {}".format(b, rev))
+            __run('git checkout %s' % b)
+            try:
+                __run('git rebase %s' % rev)
+            except bb.process.ExecutionError as e:
+                if 'conflict' in e.stdout:
+                    logger.warning('Command \'%s\' failed:\n%s\n\nYou will need to resolve conflicts in order to complete the upgrade.' % (e.command, e.stdout.rstrip()))
+                    __run('git rebase --abort')
+                else:
+                    logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+        __run('git checkout %s' % branch)
 
     if tmpsrctree:
         if keep_temp:
-- 
2.31.1

