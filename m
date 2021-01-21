Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.543.1611267645862258211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:20:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X3IRpkEa;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id n11so4322381lji.5
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 14:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TDk7V5xYKAAuNdUcrLjBi0HN8BgDEZ/Z3tqzGQk8UoY=;
        b=X3IRpkEaGguXwyM8eghjw7aoSRz+0/MfS6Hx7HJ8HNZKzx0gN3efXcXvfBtqfC5wbX
         uFTB48gGwuN4x5s5PWALfb3Uz2XhqGm1HmwgiijGTGL97bdkKVlMngPzwA4juBdgvm9y
         QdeVNjJX2ghS62Vorly+AhYYC6zldzvF8fwIOXd0Pfzs3zCwP/Pjm9IhMsCDPjSzNJ+5
         i6JnW0gx6GL2hrSxgOB6wQnT4BmGIiVIhsqamyKq6T3sT8o16/1/6RNeJRWCepTQywT9
         LfqkfC7i6XpJJgn2TEhyjJ6O/NurkqPHJsv0bPOrP+dLTG3sNCud9SD9DXNRJHJ4RkUK
         mRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TDk7V5xYKAAuNdUcrLjBi0HN8BgDEZ/Z3tqzGQk8UoY=;
        b=d0X6hRApvQEvz4g7ixyodqNWttX4tNSF27JHPySRmd4ZzTuet7FTA7Qu+9KuHYKbRu
         dlGO5VncvdkRiHmizZy6/1ot3cI5j6mePg4/7G8WUUBaHaNW+WpJ7yAntNSAqnT85kfD
         BfZYNJ3l6OEw6Jjy3SCH/JVl5Crf5pkf03t5N14WQU1CJbYoPFa27kPq5Dw/+cZ/BGOC
         Yj+t3X1MleLC6U/9s/+A4yb5RLnkyUQ0xEK2/Y+9QNbCL9IK3OAIiffzjjtpEqTtwOZm
         n/bcrtbf/6wnF0RSBXaz7KoDm0qR4lQa58pDU+gjIoICxBe5d99IWqXJbOvzGUo6sNDw
         9VAQ==
X-Gm-Message-State: AOAM531+aUVV4IOe+45sy98yjgbyJbhbb+r7q93BCE/6F0M++OENPqUW
	ARBGxrsYBBjmNnZAxaBzII0xTCDOTF8=
X-Google-Smtp-Source: ABdhPJz8jiS/bSPrkNidYS/FJPRQQq0vgUTQgwMy0aatITetEasBH3SodFVSHmq6QWS/TK3zHKKh3Q==
X-Received: by 2002:a2e:90cb:: with SMTP id o11mr792382ljg.60.1611267643868;
        Thu, 21 Jan 2021 14:20:43 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id n10sm733037lji.99.2021.01.21.14.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:20:43 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] devtool: Fix file:// fetcher symlink directory structure
Date: Thu, 21 Jan 2021 23:23:13 +0100
Message-Id: <20210121222313.34874-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add backward relative path if file is under directory.

[YOCTO #13738]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 scripts/lib/devtool/standard.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f7d8a82117..7b62b7e7b8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -474,7 +474,11 @@ def symlink_oelocal_files_srctree(rd,srctree):
                 destpth = os.path.join(srctree, relpth, fn)
                 if os.path.exists(destpth):
                     os.unlink(destpth)
-                os.symlink('oe-local-files/%s' % fn, destpth)
+                if relpth != '.':
+                    back_relpth = os.path.relpath(local_files_dir, root)
+                    os.symlink('%s/oe-local-files/%s/%s' % (back_relpth, relpth, fn), destpth)
+                else:
+                    os.symlink('oe-local-files/%s' % fn, destpth)
                 addfiles.append(os.path.join(relpth, fn))
         if addfiles:
             bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
-- 
2.29.2

