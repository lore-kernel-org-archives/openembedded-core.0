Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099A8C47422
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 22:14:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.51510.1705270488482104649
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 14:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNayfaff;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso8720895e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 14:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705270487; x=1705875287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwRA+OhhW5FIBT2i7TxbtL1+itpsmXTPUTEbpdriySI=;
        b=YNayfaffdxkqohuG9pZ1kdBIu95JZc8Rir/z8TVOhnbK6zJiw7WvYQ3oPud/LfvMdQ
         lnr5fqPplwcvyEDL0srgjI2lZrUuJ7FsPEGkQfV0ZI9X/gJFViiybIXji0TtPDtuxz22
         B7Ug8WAveHtreneCslUH+RhD6wiYOJFz1+6bKoWYhVLJdThogdQ997o8AOTRQhEJYME8
         HF9OQ5P7c1+26VISBpe1KTsQ34vsmBqyn1IdFsn0nfzLFLLMuOYpqOh9T9FZ3hJ3S50/
         ZuqCpLmnt1SEYhZyrENTpaFOcItxNuLHPvUfO4enkGI8m8G67yJ7GfF9nO8YVeTyyguZ
         beng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705270487; x=1705875287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwRA+OhhW5FIBT2i7TxbtL1+itpsmXTPUTEbpdriySI=;
        b=HxpBtK0YUi/1Xzl823Qim5V1puI4bq8HaprdlMGxYCAw3u2rswXfTR8jYXzP8C4L07
         G5KTO5jqZNjo3owwRguvNV36el9INMf51f0Xi98ESvsel8zy1Ok6bOxtIZVPF35ybX6z
         lgTozJ4gf7UWYd+9z/6FXI1PtPzSUglUGMyuLPD3HqTs04MNPz8xSJaB/T8ijdzJxnik
         E902Lm1KuYOWivZHQBUqX2U/BHizS/iKmzz615pPn3rGgO5TAqYaA6GijxxN5lcvlnR4
         CpTALG8JlRVFpnZAZhv+wrs6CxgQwZh+A1x4gUcO7gwN+q/YJEORCFFkjrBgbTGYkO33
         rILQ==
X-Gm-Message-State: AOJu0Yww6ezsmIj17kYb2cISiVix5EPm/qbL/UECyj7DvkwTWe9awhGy
	c+lSVh58mP2p5FkVrEaAJ3rMavSm8Us=
X-Google-Smtp-Source: AGHT+IFPG4395T0k/ldwLHc/QubdmrdrY1cnD6wScs4bXmOYzTdy/pBPE5pkQm/v9Bi4ONQtlyEv3A==
X-Received: by 2002:a05:600c:2e51:b0:40e:4267:5738 with SMTP id q17-20020a05600c2e5100b0040e42675738mr1332809wmf.96.1705270486692;
        Sun, 14 Jan 2024 14:14:46 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id t21-20020a05600c451500b0040e3ac9f4c8sm17451943wmo.28.2024.01.14.14.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:14:45 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v9 6/9] devtool: refactor deploy to use exec_fakeroot_no_d
Date: Sun, 14 Jan 2024 23:14:18 +0100
Message-ID: <20240114221437.1255866-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
References: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193624

This is a step towards a deploy function which can be called without
passing the d variable.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index eadf6e15214..b71d55e2312 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -16,7 +16,7 @@ import bb.utils
 import argparse_oe
 import oe.types
 
-from devtool import exec_fakeroot, setup_tinfoil, check_workspace_recipe, DevtoolError
+from devtool import exec_fakeroot_no_d, setup_tinfoil, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -160,19 +160,22 @@ def deploy(args, config, basepath, workspace):
         except Exception as e:
             raise DevtoolError('Exception parsing recipe %s: %s' %
                             (args.recipename, e))
+
         recipe_outdir = rd.getVar('D')
         if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
             raise DevtoolError('No files to deploy - have you built the %s '
                             'recipe? If so, the install step has not installed '
                             'any files.' % args.recipename)
 
+        fakerootcmd = rd.getVar('FAKEROOTCMD')
+        fakerootenv = rd.getVar('FAKEROOTENV')
         if args.strip and not args.dry_run:
             # Fakeroot copy to new destination
             srcdir = recipe_outdir
             recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'devtool-deploy-target-stripped')
             if os.path.isdir(recipe_outdir):
-                exec_fakeroot(rd, "rm -rf %s" % recipe_outdir, shell=True)
-            exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
+                exec_fakeroot_no_d(fakerootcmd, fakerootenv, "rm -rf %s" % recipe_outdir, shell=True)
+            exec_fakeroot_no_d(fakerootcmd, fakerootenv, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
             os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])
             oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),
                         rd.getVar('base_libdir'), oe.utils.get_bb_number_threads(rd), rd)
@@ -251,7 +254,7 @@ def deploy(args, config, basepath, workspace):
             shutil.rmtree(tmpdir)
 
         # Now run the script
-        ret = exec_fakeroot(rd, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+        ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
         if ret != 0:
             raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                             'error message')
-- 
2.43.0


