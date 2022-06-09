Return-Path: <luoxiaobing0926@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A28EC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 11:49:12 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.11940.1654775348835653267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQBjPw5e;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: luoxiaobing0926@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id x16so13626652qtw.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K8QBWEIDrJGTojBpCm7oqsJAQjuR9BNw6ua5lL6ID3E=;
        b=cQBjPw5eVM6KHstrSo94VjUO/PCXrrADfdfOecRO+hMXGYd9i2nsWYhgmozGXBRlu3
         MY2kDmoxlUdsRp3JedhVgtyMmC2Nm8d3dGokIT7+sBur8M0et78buuqiJ+VzNDjg7RSC
         2PSiA0glpq+SpFAMxFJ+bOVHhx2ncrZlKBORTCTS50DcQujp2Z3mogzY4S8YcuftKu+r
         1pl4vr+aiCQg3+jyXAOl9kFr/FuXt9fQ1gEiBp1IX/n3kx5MKpIkQjsTiURrTMY2LJbG
         FjVRTHGHzwqtPFxRNOvc94RpGZ799Xdjt7czmZRURXJo3JEfglEsGJ3loqgSDpGaKLWu
         0owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K8QBWEIDrJGTojBpCm7oqsJAQjuR9BNw6ua5lL6ID3E=;
        b=56idJvsuinErrLJG6heqFwqhHoC/BZs20lX82WnGLQirybMTwkeTuMqFh4D3mMw+St
         GCrXCs83wowQj6134Alkcd+RA5vo43YOjTti9nEdTI7CaKusDUfn81lby5nXhKXBYL1+
         4xoq0MGcrWLYWxuCQPu7C+fuTMpx7+7s6Xr12gX1teWh3JBg8tlChv8lnxN3Xv4nyZM1
         +1c+uSxLvktXfJFaE/mL02fSaNR+uAyDm/FQ3DuR/f5tCbm/W3KiUSMw0aAR3E6IkoGX
         iZwp2k+Kttoq4BMmO1tIbLA0Zw/zT8dvL0l68XkW55qEwV8FBgpGeN42fKh3E+3lqUC+
         jUhA==
X-Gm-Message-State: AOAM5300pJYKiiiqhWx8D6DuQEyyNdhfmWcYGFpxrE6WFWvglZcEJexa
	9gUtjIDUEFPH0ZQNQaagXBAI2pBh8iPIWA==
X-Google-Smtp-Source: 
 ABdhPJxxoRCD9f8mW/GHFQrweTLVr/sEc2Mr6wt4FQ7V2srv7RAz+YAtwzvucp7Aeq9kBgvgEWDbFQ==
X-Received: by 2002:ac8:7fc2:0:b0:304:f234:4597 with SMTP id
 b2-20020ac87fc2000000b00304f2344597mr14066506qtk.673.1654775347633;
        Thu, 09 Jun 2022 04:49:07 -0700 (PDT)
Received: from baseos.ecopo3xzcezu3cvzekt204vcqb.bx.internal.cloudapp.net
 ([138.91.126.204])
        by smtp.gmail.com with ESMTPSA id
 m16-20020a05620a291000b006a6bb044740sm10884454qkp.66.2022.06.09.04.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:49:07 -0700 (PDT)
From: Xiaobing Luo <luoxiaobing0926@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Xiaobing Luo <luoxiaobing0926@gmail.com>
Subject: [PATCH] devtool: Fix _copy_file() TypeError
Date: Thu,  9 Jun 2022 11:47:03 +0000
Message-Id: <20220609114703.170757-1-luoxiaobing0926@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 11:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166775

From: Xiaobing Luo <luoxiaobing0926@gmail.com>

when devtool finish, the _copy_file() failed.
--------------------------------------------
TypeError: _copy_file() got an unexpected keyword argument
'base_outdir'
--------------------------------------------

Fixes: 05f2d5d2ce00 ("devtool: finish: add dry-run option")

Signed-off-by: Xiaobing Luo <luoxiaobing0926@gmail.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 01fb5ad96ff6..4b50e3c63bac 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -353,7 +353,7 @@ def _move_file(src, dst, dry_run_outdir=None, base_outdir=None):
             bb.utils.mkdirhier(dst_d)
         shutil.move(src, dst)
 
-def _copy_file(src, dst, dry_run_outdir=None):
+def _copy_file(src, dst, dry_run_outdir=None, base_outdir=None):
     """Copy a file. Creates all the directory components of destination path."""
     dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
     logger.debug('Copying %s to %s%s' % (src, dst, dry_run_suffix))
-- 
2.25.1


