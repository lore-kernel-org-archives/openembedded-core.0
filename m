Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web10.16117.1595952873385102891
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 09:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q/ntPZKA;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id r12so16671250ilh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2020 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARUvDA68SJGb/2Ex3v/zq65NK0PcKVDt9/mcYCmhS1U=;
        b=q/ntPZKAbkL+yTLNT/3TUm4VheC2LexARklOXIWGYOr4vuwdjxvxY8kTb0j1xYAxq+
         B3rR/RHZiVyvU59rKcmnDdR0Fw/tGVXLDDSy7d7+Hnceo8TXvs7zau+MxPnLykPXX9XG
         NgVItt6nIsH+hAoaz/8cUtgtHR6XJPgS86GO7pMff1WXsxaB+tzIX0OC3I3J9/NuqfUT
         1DyE6zoaurHZbOrEJl7eT0EWZcf9jekfeVezDsHROwCXukodqzz9gXt5pYepvPhRHiTh
         junh0o8cIwztpcWNeFq8Hg3jQhO+dp0WDcI7TxUZ/rlXf85p+PFO9c4rcs4CwSbXohpA
         9pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARUvDA68SJGb/2Ex3v/zq65NK0PcKVDt9/mcYCmhS1U=;
        b=ExAqSoBtIdaHRKIdNZOrjFHgeQXLmYDDxXaICbfw7G6S+NLuHkdTQcFckrtmsWP+hg
         jRKv/fmJHutmvLIbDJeHhywesXTCFhkJKRLZu8AYdqtRpF9wOXM3TojPdxVSL0bTcHYM
         bvr8g/rSwmR4cOlDdPhlxCbgqw05simwrBDe6zUMYNwHitHJkGy4SuZYn769tCFJNIlx
         QwHoetZ9WSeUJ5CKC/rSqM3n7X+yjjtFErd9OIjik9jvMX3sJmjPIRi289u6P6yRChdm
         w10pDNat4cqJWxzXzeETIFERM1zt5Iij9YSXwFOFRTB/6uec/6jATelFP+S4+1AZPWiO
         Z+pQ==
X-Gm-Message-State: AOAM533g8H4HLfjbwhOiZAY0c/RQsZG5uBeN5pyOfWp+ZHHNc1H3B9Ax
	B5Cen7R3ul4eXyId5ivrg4QjnwgGB80=
X-Google-Smtp-Source: ABdhPJzL+PE1HUHvwLT1EYhApjT8Rd36u945KlXxs9EvXns7wTQRyZ0BsCoiWNDhelx9NSMZCYnIlw==
X-Received: by 2002:a05:6e02:1105:: with SMTP id u5mr343516ilk.258.1595952869532;
        Tue, 28 Jul 2020 09:14:29 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:8884:5f51:bc84:89b5])
        by smtp.gmail.com with ESMTPSA id h5sm10330325ilq.22.2020.07.28.09.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 09:14:28 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib/oe/reproducible.py: Fix git HEAD check
Date: Tue, 28 Jul 2020 11:14:26 -0500
Message-Id: <20200728161426.29928-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for a git HEAD still wasn't quite correct because it was using
the .git directory as the current working directory. Instead, it should
be passed as the --git-dir argument when running git. Running `git
rev-parse HEAD` in a .git directory with no HEAD reports 'HEAD' and
exits with success but then 'git log' will fail, which is not what we
want.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
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
2.27.0

