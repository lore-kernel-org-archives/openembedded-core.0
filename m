Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.61442.1594051911629486504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Vqges4ai;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id j20so1480384pfe.5
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yeSJ6vPxEzb5z1EaYLv6xPaGjfqLjjIAD1ruJsS0Zz4=;
        b=Vqges4ainF1pWhHe0/e1wAHmOsGSsSUPx3XjCRrL4zNj0t/vBt2DiXN4Pl+Bwzgubd
         +wUaJBFid8YIchbTcDgd2CsnuF/+XaysrKk58yr36pUdQ3Ir6MS8lr82N7QtuP+HLZeB
         iGaG3MZ2oqNfTZO7eOhpGkGqnFXKsAR7r6SpMO4TRSVJmov4eu2yb2KnNbJwGP2R1kk0
         xBPeIlC20MWz+D+MQ08Uf2NjHQF2DDqpUu4wnL798vT2rSVknQeBBacqY6Ksv0GUb10u
         /pmLyPG3GKCVCFYQiJ1Z2RHr+cAPgNMmOlh28rf+RLBQLYCVoLHimsmVhaXRLbT0DSZH
         018w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yeSJ6vPxEzb5z1EaYLv6xPaGjfqLjjIAD1ruJsS0Zz4=;
        b=D5weIs8ErSN0AuYX/MeqF91SiH1fxCWSzxAywTZ8ltsaSBnc6K8VCDS8T+Vw0x9z+k
         I54KLX6uvlW1a+8bR+zAxI+Rbf8+s8b+h0YGykySS+JNIoGMjTyiXS8SxfCOtj1G9foz
         MZZkUD5SkHjWCuG55FoRcM7c7bT82HhfwLNhUC0YlUhE4UMpqeT2Wtfx1Sb48ohOniXJ
         547ZUr6y9V2uecQVdz9w1g9Fxx6cD8opZG00Ab1PTpBc72XocxhS/VWflThUG8nQdWTJ
         0ezr1p+l1H6Z5BDmEy/7u/YQ4scfkSjJ8jhG4iwEIqIdcW9T51vCmkY3H0YqhX1vgxIL
         Mhiw==
X-Gm-Message-State: AOAM530dVG2Jklue1OEtMnl8d8cELn1B3taEmAWWqoRG99i7pe59Jl5f
	EJPo1vHZhv88NCnu5JQ+9CTOy2sejmTPug==
X-Google-Smtp-Source: ABdhPJwe2pjkeN4AgU1qHKIDRkXOjMoKTKNm0rQS102leNwNsXzxcUtLmnZA3dNn3y0tbbYt3/OEyg==
X-Received: by 2002:a63:f04d:: with SMTP id s13mr21077707pgj.100.1594051910740;
        Mon, 06 Jul 2020 09:11:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/25] oeqa/selftest: recipetool/devtool: Avoid load_plugin test race
Date: Mon,  6 Jul 2020 06:10:21 -1000
Message-Id: <8a4158760224f1c6c950f51e82719d06a6b1d4db.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This bug has plagued the autobuilder for a couple of years and we've
struggled to reproduce/debug it.

The problem is the "lib" directory in meta-poky used during the load_plugin
tests for recipetool and devtool can race and one can delete the files
from the other leading to test failures.

Deleting the lib directory only if empty will avoid this.

[YOCTO #13070]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d603e2fd589e1edbc67c8c2fefb6337e728b9d01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py    | 6 +++++-
 meta/lib/oeqa/selftest/cases/recipetool.py | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5886862d6c..5003f08c75 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1447,7 +1447,11 @@ class DevtoolUpgradeTests(DevtoolBase):
             dstdir = os.path.join(dstdir, p)
             if not os.path.exists(dstdir):
                 os.makedirs(dstdir)
-                self.track_for_cleanup(dstdir)
+                if p == "lib":
+                    # Can race with other tests
+                    self.add_command_to_tearDown('rmdir --ignore-fail-on-non-empty %s' % dstdir)
+                else:
+                    self.track_for_cleanup(dstdir)
         dstfile = os.path.join(dstdir, os.path.basename(srcfile))
         if srcfile != dstfile:
             shutil.copy(srcfile, dstfile)
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 6bfe8f177f..c2ade2543a 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -534,7 +534,11 @@ class RecipetoolTests(RecipetoolBase):
             dstdir = os.path.join(dstdir, p)
             if not os.path.exists(dstdir):
                 os.makedirs(dstdir)
-                self.track_for_cleanup(dstdir)
+                if p == "lib":
+                    # Can race with other tests
+                    self.add_command_to_tearDown('rmdir --ignore-fail-on-non-empty %s' % dstdir)
+                else:
+                    self.track_for_cleanup(dstdir)
         dstfile = os.path.join(dstdir, os.path.basename(srcfile))
         if srcfile != dstfile:
             shutil.copy(srcfile, dstfile)
-- 
2.17.1

