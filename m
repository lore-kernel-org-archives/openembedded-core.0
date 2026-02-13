Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB13EF48EB
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67232.1770970231408217099
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aYBBcZd0;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-480706554beso6444865e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970229; x=1771575029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmYcnguMb/RUhOnwZB2HRqnVJ6RhJKdL4LMnnFj6t8o=;
        b=aYBBcZd0GTh3wIEooCAm2g2TqoO9glp8qqdsgeZcy3XXVhbF43PHwi3NUMaSuUTDns
         uliGi+gEUrHfh8huFGso0f8fhudVVKZXU4lZ0ciS2GaBzEU+JfsZ4XfZXQU3L6haIuby
         TbSB4IQmhDUnYM9f7PhGQ0Ht5oSLQJeCjWnZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970229; x=1771575029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nmYcnguMb/RUhOnwZB2HRqnVJ6RhJKdL4LMnnFj6t8o=;
        b=wsChdBfQJpBvPYNL4y71zf+jYCRaTyl9uHIKCbDAWU67WAYqIaIlYh8NcCF6/0t073
         m2vB96N/q5wmadg+rS8xDzxU+M04ddIGucQGJOcVf6g72YosP78iOtninCbBKcve79QU
         ecHVXqGtw+ik4JOlctjYPcHT6JjDBI3eDTO2IX6FOdevcFxU0UZ+jR/pAmYOB6gG3FaO
         nNyUk9wKVy0VfW7mgHIzH95frQGGmWgVnbsW/jXaNoaeQhoAhucJku+MB6zami2Cp95b
         l1xMOQE33H6NinLq4sr2tKAz+zUZxTxuVduEQZ9TS9bxON4rXVunaQOlgxwfdZUdQ8qT
         qSbQ==
X-Gm-Message-State: AOJu0YxQ3RZ6FyKq/Kt9QVW2cxQmY5m0GB0RVt/OBviy0TotF74klDZh
	VRHov05N5N7VZg8nihq7HribRg5CVTpL5TOQ+WwNke6Q8hDjdbzS/NwNZrH8sPw9PjkgKc1OtjM
	wkD77
X-Gm-Gg: AZuq6aLwnT3Y/6fKjptTd32qvetQaA6+uKcvUwgIzlkPQQFWbb9dHlDfDclt2Fa2t6t
	3dlf4G7nfux3kEdB9o8JGMWaphaouNOWHfMuZbiX6eDBYfJ529O2PKdBQLSqUMaSf3SYK4Ezktm
	yfmXSwaJMdQ0mOR5a1evbP2ZqkpWUfXuF11NGX8n5rhmOGRsJItbzxHVn4lBQ7+pueYrKSnzwXD
	jKDer6jTqXWnGHQyJ9gD64J4VcqreiC/1eplfeFAW1lQGlVDA2KTXxN3rnid8Fr6mPV0bX1Dy9W
	uzXbVdhnO/k5D1u5c4CPOaHx979DsP8UqngevDuotSG26VPtdfEgAq9X5hvglR0cIJWkokNgSHC
	lykGRvo6aCmbqYdXVH/HLcAKER48rplK4w4cuL1Mk6vW5E8HDYJAIncrNlHVwQQjB85XS6cyejw
	ceKb3h0bB/bIV+prY6TADWxuoDH6iTeHzBuSVnO08FUbyI2hNX6zKLFZg+jveDkf7RHFcdkA6qN
	LFZV477gGkxv/HNnh+WGlVTNv0=
X-Received: by 2002:a05:600c:528c:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-48373a628damr13048815e9.19.1770970229479;
        Fri, 13 Feb 2026 00:10:29 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 18/19] devtool: deploy: Run pseudo with correct PATH
Date: Fri, 13 Feb 2026 09:08:36 +0100
Message-ID: <2e0afe1da33fbe353182ba63760d7d3e5420dbff.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231101

From: Paul Barker <paul@pbarker.dev>

When running FAKEROOTCMD (i.e. pseudo), we need to use the same PATH as
we would use if we were running inside bitbake instead of the host
environment's PATH. This ensures that we don't pick up any host
executables that may have problems with pseudo (such as the uutils
implementations of common system utilities used in Ubuntu 25.10).

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1551136333876ab8a63e96430a498dcfa580265c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/devtool/__init__.py | 3 ++-
 scripts/lib/devtool/deploy.py   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 969d6dc13ab..7c8de5540c1 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -74,12 +74,13 @@ def exec_watch(cmd, **options):
 
     return buf, None
 
-def exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, **kwargs):
+def exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, cmd, **kwargs):
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
         return 2
     # Set up the appropriate environment
     newenv = dict(os.environ)
+    newenv['PATH'] = path
     for varvalue in fakerootenv.split():
         if '=' in varvalue:
             splitval = varvalue.split('=', 1)
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index a98b33c5718..2bf693d165a 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -186,8 +186,8 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         srcdir = recipe_outdir
         recipe_outdir = os.path.join(workdir, 'devtool-deploy-target-stripped')
         if os.path.isdir(recipe_outdir):
-            exec_fakeroot_no_d(fakerootcmd, fakerootenv, "rm -rf %s" % recipe_outdir, shell=True)
-        exec_fakeroot_no_d(fakerootcmd, fakerootenv, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
+            exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "rm -rf %s" % recipe_outdir, shell=True)
+        exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
         os.environ['PATH'] = ':'.join([os.environ['PATH'], path or ''])
         oe.package.strip_execs(args.recipename, recipe_outdir, strip_cmd, libdir, base_libdir, max_process)
 
@@ -266,7 +266,7 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         shutil.rmtree(tmpdir)
 
     # Now run the script
-    ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+    ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
     if ret != 0:
         raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                         'error message')

