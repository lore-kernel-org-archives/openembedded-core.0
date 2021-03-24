Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.236.1616596812768138413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zdBuxy4m;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id y200so17463362pfb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=epw9xeYUQzd0+kY6S4L80TQ3Mkmdl5BfjREppbIM7gw=;
        b=zdBuxy4mb2J5uEXzaXiaXoU7YsVzCkoXErYvBlD1LDpv1hV1A1Zwrpuuz2k9Ny1juB
         OVa9fnXwN58K/OGiEW+xqdovS6kx3J3NbozPOx8Kyz+KY5nnFMS8BS9oJX/62J5/P47O
         y3L6EFkoYd1z0NfnK/Mr6dyrHd9u16fpvaYrGWT4NrUlSnn2niuruxS+eT7Z61xoEptV
         8GD4OMAMLqOkChsrMqi15jve1vXSaXv3wh7ZN/qUkhq29+e5HmmlRtkr1eh5cveRCQbC
         y+achjASpCuEZAwFEXtFYJ+zEQRZ4Rp+ay06uxqkz9PhA3vXBAGD0bMxrb1DGaFhKWkn
         f7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=epw9xeYUQzd0+kY6S4L80TQ3Mkmdl5BfjREppbIM7gw=;
        b=uBr7mF2Jrag0XD83MbUltDlUgpGJqgu0ShOC/hFRkHmHZCsRfpsubC4o8cZ1i7CiFI
         bBsfdCj7nUJnzpAdH6q0ZXQ2o5t2ydBDSJa5GfwsCbFHJqYAUB1sRywiCviOLoKmKUVo
         tfN7clZ+sVjhAnXvaEfQ7vpNZfGy8Lgwqp1cYB44A1MMhSQUYC9X3L8/2+uj+dJreXan
         FexZHtLOcrqdDhDEZYnfFOcMoLuqEGQpDhauUCusXWXATHxislJszdd6+fGA3HPPrDaV
         MpxdCa1LC67YnRkYq+R1peoegoWc/AFtQNGDrsaVGKwYCuPIyYjtJOu+DxzZ/x8dqh//
         xfWQ==
X-Gm-Message-State: AOAM530VeECwfvqTX8uSU3X8tmwmYJF1dsMHIHnjwcF7/lRctspQEY/9
	9soMlWPQ5uCvHWWX/loj0iHq+VagKW4HgQRP
X-Google-Smtp-Source: ABdhPJwoZ7rI0cwNtwOTk5+B/EK85I7pu6AtO7mvlE/cBtgSTLDCNGM7LbbF3vV2kXJyAQMdwqMkvg==
X-Received: by 2002:a62:7708:0:b029:1ee:f656:51d5 with SMTP id s8-20020a6277080000b02901eef65651d5mr3632484pfc.59.1616596811603;
        Wed, 24 Mar 2021 07:40:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/21] externalsrc: Detect code changes in submodules
Date: Wed, 24 Mar 2021 04:39:11 -1000
Message-Id: <d1f6fd5817e43e5f002a9430563d6d1b69d77317.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Douglas Royds <douglas.royds@taitradio.com>

Further to 50ff9afb39, only detect code changes in submodules that are
subdirectories of the EXTERNALSRC directory.

git submodule status returns a path relative to the cwd for each submodule.
We don't add submodules that are not within our source subtree.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4525310d49d115a37705f04ac5c03d639e5e8f8c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 1d7300d65b..d1ca11303d 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -216,14 +216,16 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
+            submodule_helper = subprocess.check_output(['git', 'submodule', 'status'], cwd=s_dir, env=env).decode("utf-8")
             for line in submodule_helper.splitlines():
-                module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-                proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
-                proc.communicate()
-                proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
-                stdout, _ = proc.communicate()
-                git_sha1 += stdout.decode("utf-8")
+                module_relpath = line.split()[1]
+                if not module_relpath.split('/')[0] == '..':
+                    module_dir = os.path.join(s_dir, module_relpath)
+                    proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+                    proc.communicate()
+                    proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
+                    stdout, _ = proc.communicate()
+                    git_sha1 += stdout.decode("utf-8")
             sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
-- 
2.25.1

