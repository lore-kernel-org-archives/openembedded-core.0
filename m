Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2B7C47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 10:29:11 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.51021.1704364146383315615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 02:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+zf7EmB;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: jhatnedap@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4283670b6e2so1841791cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704364145; x=1704968945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PfVRfjd1CbLXlWEk0KyOfAOz7VmQQBl74366XcQMwjE=;
        b=H+zf7EmBcag7R1Jsh+C5i4Q0dBxQi0hrX49j+9MeG1LimPQdv30YuH/BkD6YUV67du
         V8/cVJDNpk+knuPToQeqblDlJoHWhWufwJZ0aZ+9te2KvXlbL52jyquzjopk1EXP4Wqj
         2AUHSkYIX7u8zOeAmhi+6sST7gr8tBzweDqS0af+9c2HPhpwwG51oily4z2kig70x7Ne
         Nhr3oC34dNxEQuJhjQa9Jn3dzBLknUasZKLIHUPOrCRpfH02suYjoeh9vO7teUhbRtAa
         sxa6YJX/rp1wd94XSKPIEiRjjYmgy1VZP/BT3KeaTos7L4DXLh1+CtzWQ6qm1R2mGZBZ
         lmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704364145; x=1704968945;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfVRfjd1CbLXlWEk0KyOfAOz7VmQQBl74366XcQMwjE=;
        b=EPg5htUaV4i8Qnw7IfkuBBOsuRTJ9TwYKfsEMfHMsIwWdhOoWgBCKJ/JOhOrvDZ00e
         DPn1apHpANM6gb8sOwwIIhqGo9TMU7N0s9hbHN13BL0FDlFN8JB1j4MlpQYEza6o+I70
         lqObKFauD5jlqb4/hwvPmvIFnrxf9ZZ3I0GVy7CwDkz5QlorCSRb5ge5NaZzsQDOaFyt
         kBh1ApGTYFq3oU+NgUbh6/5ktNwn2dFcS7NlVIzv/BX6xVB9NjcII3flHP2I/SUdlx5b
         j71RmYcLCgMwbPKSorIAgawZoEfpdHdr36INm1BNA5SA9FQqp26X4SiyffdiVY3B57eq
         bGkA==
X-Gm-Message-State: AOJu0Yxnl43cHZACol+IliPoCO/GAPVnHBhZutz7vRVmocHafKsFDY2/
	LpN9MKl+iiRzt6bUc9LBe4BsL0KQQ58=
X-Google-Smtp-Source: AGHT+IG7wv2UtS9E0zj11H11/qN2C6gPadL5F+XYShtqrxNcxeGFoFO0ymezvvTV5bYVQGXx8wy4AA==
X-Received: by 2002:ac8:5a86:0:b0:427:a2f7:43b8 with SMTP id c6-20020ac85a86000000b00427a2f743b8mr373166qtc.47.1704364145452;
        Thu, 04 Jan 2024 02:29:05 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id fa15-20020a05622a4ccf00b004280cad48basm5923316qtb.77.2024.01.04.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:29:05 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH 2/2] lib/bblayers/buildconf.py: Remove unused imports/variables
Date: Thu,  4 Jan 2024 11:28:27 +0100
Message-ID: <20240104102827.782-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20240104102827.782-1-jermain.horsman@nedap.com>
References: <20240104102827.782-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193315

From: Jermain Horsman <jermain.horsman@nedap.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/bblayers/buildconf.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.py
index ccab332adf..87a5e5a55b 100644
--- a/meta/lib/bblayers/buildconf.py
+++ b/meta/lib/bblayers/buildconf.py
@@ -6,13 +6,7 @@
 
 import logging
 import os
-import stat
 import sys
-import shutil
-import json
-
-import bb.utils
-import bb.process
 
 from bblayers.common import LayerPlugin
 
@@ -58,7 +52,6 @@ TEMPLATECONF={} . {}/oe-init-build-env build-try-{}"""
 
     def do_save_build_conf(self, args):
         """ Save the currently active build configuration (conf/local.conf, conf/bblayers.conf) as a template into a layer.\n This template can later be used for setting up builds via TEMPLATECONF. """
-        repos = {}
         layers = oe.buildcfg.get_layer_revisions(self.tinfoil.config_data)
         targetlayer = None
         oecore = None
-- 
2.42.0.windows.2


