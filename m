Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E72FC25B79
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.12844.1715774188038505890
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EQNjtqOO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-420180b5897so22523745e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774186; x=1716378986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weeqhOZI7QdwGNxdECbfM7t15XMHjD4SKqwEEl/hdgo=;
        b=EQNjtqOOrrdsFHo1mcaxReEw2vB2PWwKNedR3bJmwpwDOSzzb+bMvylWu/KvDrZlJ2
         CjQ1QQ6K6oPpj9E+spmGf5Jji8urqGkoFNMuUeEGwF+dg9izCFOUU3z83ruOiq4CcUn6
         9MDyd4DAeTh067Tq/tJ6dxH7dXiXXiPmz97OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774186; x=1716378986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weeqhOZI7QdwGNxdECbfM7t15XMHjD4SKqwEEl/hdgo=;
        b=CamZmHvrPgGbQqp2AKFt2KsK/TjWfkn3VF9i06IM4KNVlvtkhY11piCNdkk19tj45+
         YgYPHqoAtqXWt/aRyr0GeSDyScxMd6lly6xn+fPvGKGU7oPaeaLxHW08KJE6+ePmjWyP
         DPpKcW65aO9GTsgwScGIVZW4k+F/X9gOtadoSlHfoVJRhxBxg3OvaAj0u7zrGp29qZR0
         1Z98ygeTJMf5efglxVBn0IN2o7PR7kKEvOTmTE99e3SqEcFicgyF49dVFAoIm7rhsRJY
         J+Uz1mBQvb0hJSt12oWJT+xrAlWBLJQZ312Y+GkiIcrBPIp9wBos0zbOWiumK25Tt3Vi
         hKrw==
X-Gm-Message-State: AOJu0YyW/dkyNPiag7hgEwk9PkU4o6FDFSOZqp8Fn5im+gfhewnfUT9M
	6NpgWUkCrOp1PgrKBIkBqWuHLaeB1OsbJVRmn540MJQcRzdGeSsUDxFI8sg4afdwlBCYFZLrYu5
	cg/E=
X-Google-Smtp-Source: AGHT+IHK65ft7xZbfeWdu7mgpYCFVdXcogTBXO1BT9U7/CeReXoChPaOOSfrdHyKexNzois552qyNw==
X-Received: by 2002:a05:600c:3509:b0:420:11cd:d302 with SMTP id 5b1f17b1804b1-42011cdd486mr82348855e9.9.1715774186314;
        Wed, 15 May 2024 04:56:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] recipetool/devtool: Update to work correctly with UNPACKDIR
Date: Wed, 15 May 2024 12:56:16 +0100
Message-Id: <20240515115620.420558-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199282

Tweak recipetool and devtool to correclty use UNPACKDIR. This allows some
simplification of the code. This patch makes things basically work but there
are likely deeper improvements that can be made now that WORKDIR != UNPACKDIR.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/upgrade.py   |  2 +-
 scripts/lib/recipetool/create.py |  2 +-
 scripts/lib/scriptutils.py       | 15 ++-------------
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index fa5b8ef3c77..a8130ed23f5 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -32,7 +32,7 @@ def _run(cmd, cwd=''):
 
 def _get_srctree(tmpdir):
     srctree = tmpdir
-    dirs = scriptutils.filter_src_subdirs(tmpdir)
+    dirs = os.listdir(tmpdir)
     if len(dirs) == 1:
         srctree = os.path.join(tmpdir, dirs[0])
     else:
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 8e9ff38db6c..066366e34f6 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -528,7 +528,7 @@ def create_recipe(args):
         if ftmpdir and args.keep_temp:
             logger.info('Fetch temp directory is %s' % ftmpdir)
 
-        dirlist = scriptutils.filter_src_subdirs(srctree)
+        dirlist = os.listdir(srctree)
         logger.debug('Directory listing (excluding filtered out):\n  %s' % '\n  '.join(dirlist))
         if len(dirlist) == 1:
             singleitem = os.path.join(srctree, dirlist[0])
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index f23e53cba93..81f0b01fa53 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -179,6 +179,8 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
                 f.write('SRCREV = "%s"\n' % srcrev)
                 f.write('PV = "0.0+"\n')
                 f.write('WORKDIR = "%s"\n' % tmpworkdir)
+                f.write('UNPACKDIR = "%s"\n' % destdir)
+
                 # Set S out of the way so it doesn't get created under the workdir
                 f.write('S = "%s"\n' % os.path.join(tmpdir, 'emptysrc'))
                 if not mirrors:
@@ -232,10 +234,6 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
                 if e.errno != errno.ENOTEMPTY:
                     raise
 
-        bb.utils.mkdirhier(destdir)
-        for fn in os.listdir(tmpworkdir):
-            shutil.move(os.path.join(tmpworkdir, fn), destdir)
-
     finally:
         if not preserve_tmp:
             shutil.rmtree(tmpdir)
@@ -271,12 +269,3 @@ def is_src_url(param):
         return True
     return False
 
-def filter_src_subdirs(pth):
-    """
-    Filter out subdirectories of initial unpacked source trees that we do not care about.
-    Used by devtool and recipetool.
-    """
-    dirlist = os.listdir(pth)
-    filterout = ['git.indirectionsymlink', 'source-date-epoch', 'sstate-install-recipe_qa']
-    dirlist = [x for x in dirlist if x not in filterout]
-    return dirlist
-- 
2.40.1


