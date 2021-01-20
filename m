Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.28662.1611154372282913485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 06:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T/3doTPC;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id f11so26397109ljm.8
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Jan 2021 06:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fro5yERxJKzci4r99EjK9l/rrmX2WC2QaWlgBnpLQG8=;
        b=T/3doTPC7Dp6deSuyXYVXDqs3bp01E/19CB1Ib2V7XSF9z4ryl4IogEsxU0Lm0QiR4
         ZCGXLwraTIFnzyb5wnDUom/NFehUH5exztiac+Owkc/JOQLg74Lj2LUgsdc5PnqJvkzf
         EpRbw57EOZPBT2zDWVEeiP4QGAOgPt8R8d+jlH6TL9zqvj8vi3Yscm1zngL8rbOPBUC/
         Ik0ggjJKJwtIG1y2cCldGZRjBZxSXj0akGcAaNPYY/XqAtYZYffV6Md3y9QsQ7I3xOqk
         dnp/Mmgb2WmReiwVamoQObkqk9SxlhQEUWQJEfL7mqrt6C69EDgcGApPqe5WHdLzZIqW
         +Gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fro5yERxJKzci4r99EjK9l/rrmX2WC2QaWlgBnpLQG8=;
        b=Maq/MTy5U3FicYuFnOnZa+DdtaB6lJ0ZZx8wK4qokV4SRW3hZPPwhwFWrbJhuznYUC
         h+TRGlPzs5qPReMETJbozzQkU99/sviJuFKJEYFA6K5YXdI5ZmMSeRfkOfADmXDy8snd
         RN4oLZfmPiSw7fPS1ZyvqFQDozTAlo9Qf2+hbqVWv2HFV41RhoGoXF3c/436cHGkqyNF
         rk7iXZdanTsRbgSx4KzoboxhFv+Vf3nH530/xtQl9tHt5Ctk7j+OQgwvQO0hLT8u1Z0I
         Y5sW+snTJD3gA1CDJLXe2r1rMaIZfOso502sByNgP6l9DBHRa/VQXGVk4X87k/oze+5y
         bnDw==
X-Gm-Message-State: AOAM530jdHe8x/bpDUPvN1wFGbQLDXm8f3EOXYQyS9h1nGsPHm8FpWrH
	pU0pHc5tvxSvBulkm63pb+P3YgHxnWcDAw==
X-Google-Smtp-Source: ABdhPJwnWXOHY4rUBiAbMr0iY6NiT/ZiVPRtTHE3BuVSuuC7OJOcMAdChtNQYStqFxsFvo1qm19MoQ==
X-Received: by 2002:a2e:3008:: with SMTP id w8mr4642144ljw.59.1611154370193;
        Wed, 20 Jan 2021 06:52:50 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id v23sm247395ljd.78.2021.01.20.06.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 06:52:49 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH v2] externalsrc: Fix parsing error with devtool non-git sources
Date: Wed, 20 Jan 2021 15:55:25 +0100
Message-Id: <20210120145525.966023-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If srcdir is under poky directory (e.g. devtool poky/build/workspace/sources)
and is not a git repository then ${@srctree_hash_files(d)} will run "git
rev-parse --git-dir" and detect poky directory as git-dir and run "'git', 'add',
'-A', '.'], cwd=s_dir" trying to add srcdir but build dir is in .gitignore and
latest git will fail with "The following paths are ignored by one of your
.gitignore files: build" which will end with "ExpansionError during parsing".

In this commit I added a check if git_dir is the same as git-dir from
TOPDIR (which will detect poky directory) and if yes, then treat srcdir
as non-git sources.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/classes/externalsrc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index dd09395788..7a7d31e311 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -197,6 +197,10 @@ def srctree_hash_files(d, srcdir=None):
     try:
         git_dir = os.path.join(s_dir,
             subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        top_git_dir = os.path.join(s_dir, subprocess.check_output(['git', '-C', d.getVar("TOPDIR"), 'rev-parse', '--git-dir'],
+            stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        if git_dir == top_git_dir:
+            git_dir = None
     except subprocess.CalledProcessError:
         pass
 
-- 
2.29.2

