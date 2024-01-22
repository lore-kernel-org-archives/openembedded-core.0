Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C627C47DDB
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:59:31 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.74368.1705931967665846752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PzfdAxe9;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55c1ac8d2f2so1504272a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931966; x=1706536766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwRA+OhhW5FIBT2i7TxbtL1+itpsmXTPUTEbpdriySI=;
        b=PzfdAxe9i1n3MI0KaeaMJU3UP6Vy0A3PMVOcGHZaH0tJdG87H4j3VIYQxwbbMDOhIw
         Mt5wHDU8pWlA7tGjZuUXWw1ojbqe1ta1Rkqh0WNWF3rzN4LTDNDnufVJtpdcjR0cIu8V
         VWdRi7sPD/aWf+lggUJThkUM9QAtb8fInEfsUNl1hlFZagiK8RNFFkChtJ7029ian1hX
         /9IPgFDf5kEw97PKfMgFjDgU323glAnYJIoZBEHT1uxPFAg3OCOImfwJ57YDr3VV32mV
         Dk7CeM30rbtVPyyg3WYACLmB6rS/0RvLKW4NVH0wEVYu14pQcJZen98vZpxaNt/L/6Vo
         uHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931966; x=1706536766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwRA+OhhW5FIBT2i7TxbtL1+itpsmXTPUTEbpdriySI=;
        b=gAV7Z3yuzx6pqjBTcutESu5JtHZOJ1S7AZcS4umhLsxXjLegmlqOUIs2d3Ajr51NeL
         oZ4blHJ2axlgdZHA2F1Ng6XQ3AYUHbh74Cj+NJgLwtmRefuNogRDdcU8dZXLe9L44roH
         EOe4TrlkhJRMbjRbPce4kyiZlJkXT4+D7IBfvAXT5RjQgH/99EwvfBWHp49DAFpTmxkN
         0UZy/u794UBILb7cEnAMMhhPxYdWUI7cWUCK/AMJg8sFmVBfJWFb8acK8KcwfqBRDrFO
         Q53QjvBGQWCu7Ds3qaNwLLZzZbM1jMuOALevoMKN4JcTAoAdjWXUJV5MnhbfB+uoQHoK
         dp3Q==
X-Gm-Message-State: AOJu0YzCEBVTXud0236VDx9Lhp38MNwbupOtA/VVluCkRgBm5hGJVGOC
	zysgycNKAliCCqUAkGNSl7qJpssOR+AQXJ5UVHt6nd3bQsS2aSs1/kIsJ2jp
X-Google-Smtp-Source: AGHT+IECfutax2e6Z2DtpE8LuiGD8kFB8Sa801+9i6I12xXJkKfRbgqnIhfG/o1/qxlRlsdy8Kly4Q==
X-Received: by 2002:a17:906:493:b0:a2f:de3b:1307 with SMTP id f19-20020a170906049300b00a2fde3b1307mr1862689eja.135.1705931965877;
        Mon, 22 Jan 2024 05:59:25 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a2d0595cd0dsm11568513ejc.86.2024.01.22.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:59:24 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v10 6/9] devtool: refactor deploy to use exec_fakeroot_no_d
Date: Mon, 22 Jan 2024 14:58:24 +0100
Message-ID: <20240122135901.171596-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122135901.171596-1-adrian.freihofer@siemens.com>
References: <20240122135901.171596-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194155

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


