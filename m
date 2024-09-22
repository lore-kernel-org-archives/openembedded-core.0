Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50C9CF9C6E
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 15:58:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.17399.1727020709981168025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 08:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JwJHLBVA;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so27732735e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727020708; x=1727625508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNaJtlpXb+aVtjgNhuyvvuUQzCVhXkLOnRPGLKFknu8=;
        b=JwJHLBVA8TN6hdogXg2xOz62MEbZi58segxgqar2DsEoLqqFAxRinYhJmvIn016Sct
         JtjcyaTVQHbprAjjQEF+HKUgcM/4Nj/s+GCnZlLHLA4tz9Q0odJxofgSiXo1q4Ren20C
         fwRolRtR4uOnb5vDFnEz4jpE7zneEdP4PPRvvGf4X/0QffF+ct1fHBlBuluePi2blbgG
         j7uojwruGaF594/nCFN0xioz38qImlgp3w5U+nSs9CMj5De/BDXvZdY6VIkEhc9lMbUB
         UGSVLTg/aXtvxgdNLa9fnllbHyNR2w0SxTTk/4EDYapjEpMfyHg1FZe+Aoh0lg78sGDz
         wOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727020708; x=1727625508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNaJtlpXb+aVtjgNhuyvvuUQzCVhXkLOnRPGLKFknu8=;
        b=oc1mi9slzfsDQHq6kdSEvut6SCSzdJdnAd0+nk6JtS4L3skX2jH7j00Ml+7eM/BjLq
         WGqPI/VVk/ft7/QVD9TamBynfU/Bo1Vp7uEcoNtH0XB70CtjoxtvUW4wUDg5B/VXDrLl
         7wwt0FTOizpHUVjonTm0rOIuPwM4RHnHIabMZzUmVniiDdbJQ9gZjNWZFfuOdpVTn38m
         WDzDIDD5ohgQ1Mvkgcfc4drIYFj9TPtTzjmn1+WZRGtFIbmU6QazNm3qUSz13CO0NanH
         Hy6NcH1uQXFFO5YjyNWfr8fOH8+x5DzrB/JHNRcqM4LL1rY03utnoK8cXv1Uqp+9xN+Y
         I/OA==
X-Gm-Message-State: AOJu0YyF6Lpj8ACKM0BE/Atg83QBOJ+2YwZ9ghyJTNbJ+u4giEUGwCnQ
	Do3LBurmK3lZtWeGOPqnkU7qTu76VeF83A1K0kVzln3vASEe5C+rsq/6LA==
X-Google-Smtp-Source: AGHT+IGtTZq18QiZi+kxAaVoP42aI4+e6Lazf40V5siElen0/fmnUFiUi6gZlUoDR9vg5eqGTE3Sjw==
X-Received: by 2002:adf:ef89:0:b0:374:babf:ac4d with SMTP id ffacd0b85a97d-37a42392ec2mr3868603f8f.58.1727020707809;
        Sun, 22 Sep 2024 08:58:27 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e429sm104126405e9.3.2024.09.22.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 08:58:27 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/3] devtool: menuconfig remove useless code
Date: Sun, 22 Sep 2024 17:43:15 +0200
Message-ID: <20240922155810.1139539-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240922155810.1139539-1-adrian.freihofer@siemens.com>
References: <20240922155810.1139539-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 15:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204791

When I tried to understand whether oe-local-files is actually still
needed here, I found some useless lines that can be dropped.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/menuconfig.py | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
index 18daef30c3b..1054960551b 100644
--- a/scripts/lib/devtool/menuconfig.py
+++ b/scripts/lib/devtool/menuconfig.py
@@ -23,9 +23,6 @@
 import os
 import bb
 import logging
-import argparse
-import re
-import glob
 from devtool import setup_tinfoil, parse_recipe, DevtoolError, standard, exec_build_env_command
 from devtool import check_workspace_recipe
 logger = logging.getLogger('devtool')
@@ -34,7 +31,6 @@ def menuconfig(args, config, basepath, workspace):
     """Entry point for the devtool 'menuconfig' subcommand"""
 
     rd = ""
-    kconfigpath = ""
     pn_src = ""
     localfilesdir = ""
     workspace_dir = ""
@@ -51,7 +47,6 @@ def menuconfig(args, config, basepath, workspace):
             raise DevtoolError("This recipe does not support menuconfig option")
 
         workspace_dir = os.path.join(config.workspace_path,'sources')
-        kconfigpath = rd.getVar('B')
         pn_src = os.path.join(workspace_dir,pn)
 
         # add check to see if oe_local_files exists or not
@@ -70,7 +65,7 @@ def menuconfig(args, config, basepath, workspace):
     logger.info('Launching menuconfig')
     exec_build_env_command(config.init_path, basepath, 'bitbake -c menuconfig %s' % pn, watch=True)
     fragment = os.path.join(localfilesdir, 'devtool-fragment.cfg')
-    res = standard._create_kconfig_diff(pn_src,rd,fragment)
+    standard._create_kconfig_diff(pn_src,rd,fragment)
 
     return 0
 
-- 
2.46.0


