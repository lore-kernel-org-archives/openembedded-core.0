Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.1710.1599498181073301282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gBGwYgDQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.194, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f194.google.com with SMTP id u9so846677plk.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=dHaKDbSRa80TAqCITI+aRfYZqA6UjR8sk/hTx+XBM8c=;
        b=gBGwYgDQ2pgbm9m93PwuVzK8+CY8ZRmegfLS0IVjDIXjHAsw97SIKtxfAG2vLTlEey
         qbUjBdkjOUum/tkLw0mW0wjK32t521PNWSUMpllhd/41mzttRDR1k6hdHMfSR943ATB2
         FpahQNbxRpB/guy4IH9kv79Img/ZyXohMweoWNnlIW14qO2yfCW6Yi8yhS+wuDM+Mr0v
         DFz6aiJnu5EtEImWJ+/+uoSN63fu+DRpjSESkpC4HxNvibOCZHfNypOFeA5WTTmT1nm7
         QQ9XsB+kgBITIdezulKfYyMzMYKqx96pfFeuV/NC9Lig4h82RYCLMObb7D4rPNJGbZJH
         TUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=dHaKDbSRa80TAqCITI+aRfYZqA6UjR8sk/hTx+XBM8c=;
        b=lLxEEm5k9GTfWwr/GrzeRB/S7H/R/YoqSRHn4QcOIWg+H6Ec+2kzXnEMwx2bRZMUYm
         O84alA0tAwhHMVgMQLBmGPTykt58aY1Pzmt7EfU+pnk9+8b10t5/HRvytR+ee7Ky7RtE
         VVrZBVAMWT4f79tJT18b5smUy35DjXJH6bugbiZFES19/jGUYPAsjg0oMJwW0p0uHhI0
         InxMjskK8/fM5iXNoxdDvNNE4wORaivfd7108Inq3oDkonAhD0mhdd87HXn2kwecCo+y
         ZgHHDUqVpXw4tMYeOelT4yG6rmCOlHzbMR2eAK2sKgAJtnoUabj6AZDL2uSzSnqsfTRg
         2iSw==
X-Gm-Message-State: AOAM532Y0n3bqywSMUpUJ8WvrslG95ZFBMQDjSmb8yYP+juub6bZtH34
	1TpvJq21U0F2Ms6L9uv5QExfQyZfO3EJGgn6
X-Google-Smtp-Source: ABdhPJwHdz7+WrRxB7lLYpEMnLn8JPbKaNtVfx0E0jy17A7ukFP/QdQalG14fHDiS5TkZnm68mQKwg==
X-Received: by 2002:a17:902:7896:b029:d0:b9dd:edae with SMTP id q22-20020a1709027896b02900d0b9ddedaemr4301992pll.0.1599498180137;
        Mon, 07 Sep 2020 10:03:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/18] devtool: deploy-target: Fix size calculation for hard links
Date: Mon,  7 Sep 2020 07:02:13 -1000
Message-Id: <85b1e835572d184cfff86a87fced8673d1d40a7c.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Michael Tretter <m.tretter@pengutronix.de>

If a package contains hard links to a file, the file size is added for
each hard link instead of once for the file. Therefore, the calculated
size may be much larger than the actual package size.

For example, the mesa-megadriver package contains several hard links to
the same library.

Keep track of the inode numbers when listing the files that are
installed and use the actual size only for the first occurrence of an
inode. All further hard links to the same inode are added to the file
list, but accounted with size 0.

All file names need to be added to the file list, because the list is
used for preserving the files/hard links on the target.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 17e92572278980d1a7f06de9d72c68baf57698f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/deploy.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 6a997735fc..aaa25dda08 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -177,13 +177,19 @@ def deploy(args, config, basepath, workspace):
                         rd.getVar('base_libdir'), rd)
 
         filelist = []
+        inodes = set({})
         ftotalsize = 0
         for root, _, files in os.walk(recipe_outdir):
             for fn in files:
+                fstat = os.lstat(os.path.join(root, fn))
                 # Get the size in kiB (since we'll be comparing it to the output of du -k)
                 # MUST use lstat() here not stat() or getfilesize() since we don't want to
                 # dereference symlinks
-                fsize = int(math.ceil(float(os.lstat(os.path.join(root, fn)).st_size)/1024))
+                if fstat.st_ino in inodes:
+                    fsize = 0
+                else:
+                    fsize = int(math.ceil(float(fstat.st_size)/1024))
+                inodes.add(fstat.st_ino)
                 ftotalsize += fsize
                 # The path as it would appear on the target
                 fpath = os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn)
-- 
2.17.1

