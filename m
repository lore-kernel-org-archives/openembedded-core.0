Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.611.1611268166533560062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 14:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cA3dFX0s;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id o13so4857077lfr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 14:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71ym5+GRzdr1mlFNeuuw34l9IX3VtfTqtTca92KKocc=;
        b=cA3dFX0srHlEVfPgV+xIllpsGt9JmfgbtQsLK31V/av4wY0zzM3lkAtmKGwLiBzhzl
         XQjYQO0gOG9de+v5Ha8U5NG7m+rwEKE+Oh+mKNtcEvAvQ8n7TuynosdLtXWAOjygsOWZ
         SqArVmLCB/7gQObDxBJ39W5KRRaWj7szQHfvPWTb7u+Tgppy2Dp0vHLjBeYB4YxVs/H+
         VHehkJ/ffoTvG/qMJI5wbn0kVA9cYhXeR8oa8vtGUbCfmv4ZD26s8h5o1PrlTH1LRIPV
         jwSlAnqZuevKklTpsLcyg1Kf+FWOUQudWNzY3Q7c3LlhPqZMYfKQoa3kJmWYrOc1rWxm
         1udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71ym5+GRzdr1mlFNeuuw34l9IX3VtfTqtTca92KKocc=;
        b=nhrzg0cZqabKzRkBoRDN0aZt5678T6y1Qs4DuDcBwDs7DE5sTy0sDFx2dJbaWrcPbM
         7gpANobrUqRaiDxC38b/WpIGohgTN7/3eZ5EZYSNIZ3WUpaOXs8VA4zhvziiLbpgF8vY
         pDAE71SHndAZ5R4Wd1moipZSGeS/RsSaCuwUsMcNsR6m95wjCNt6l3NAM/5AC2a8K/Or
         xi+tTH58G455K968kubMR44yQSD+5WvXwnRYJlA68jBefbJaE0XBx2d+YFpOdHy8bRhO
         q85tem7DKriJ7c5cnDw9338aXqSe13oNaLbaKiG7PgK+GN5sWbq/7ZBiYCzrOIx/3yVw
         +l3g==
X-Gm-Message-State: AOAM5335gw4foc+afrZvqXU82uDujz/APhxYM/MtR70aGPHFHs3AwC7X
	KYabVk8UkMTgtGoC1KlIEpg3C6O91yg=
X-Google-Smtp-Source: ABdhPJyCiMhhhOo0C181isqi4mrrA/rfNIIJ0pZAHskv1SPxKOAEW2Mcvj+U8jlflXTnJbjo1oaeIw==
X-Received: by 2002:a19:2245:: with SMTP id i66mr693782lfi.400.1611268164444;
        Thu, 21 Jan 2021 14:29:24 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id f23sm669369lfh.196.2021.01.21.14.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 14:29:23 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH v2] devtool: Fix file:// fetcher symlink directory structure
Date: Thu, 21 Jan 2021 23:31:53 +0100
Message-Id: <20210121223153.1347-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add relative path if file is under directory.

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

