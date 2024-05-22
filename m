Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8D2C41513
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:28:22 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.5840.1716370101680552547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hEXT6MWB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.173, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e271acb015so82319731fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 02:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716370100; x=1716974900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weeqhOZI7QdwGNxdECbfM7t15XMHjD4SKqwEEl/hdgo=;
        b=hEXT6MWBfjuIiVOtSj8Oqc3rOLKfRKfdSfayN9zx+lfeQnmhObIxNpMe81WvAQ88tU
         UaUjtR31uZnsJHKtCJHK5MXCAxg1a5rbOqocTLQ3EpO1sVFLU3dEN3ye+9Lw5HUXWbJU
         /c3SQoOUWIrzcVDQ5HrfWZ2oifMj0PBidpBvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716370100; x=1716974900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weeqhOZI7QdwGNxdECbfM7t15XMHjD4SKqwEEl/hdgo=;
        b=r3l8lX8T7k7gnl5OjyMdFkSLbGfdEKgY8xu8vvsx05hxOwUELsCLocvtl62VXH3r5Z
         J2NBE8H08Fzh7ZeyjM3mA0tbWYfPFlnwy7pTtlcrrZzrbkM6FgF8q3M0frF0MBub8i1x
         KUK/LId+nkoUvpALQfoQ7YMh313fMxH4b5pwYKVGMmXQfsSXhaEHOG7KjBVkMgSHdPbF
         VkU2gGOsCOuXaMDUgU1BYI2sXXYimJcG89n1tmhjmiNkHB9aRQ3uwXibqRC/XAYBrBo2
         h50GFRUBLxV7CfF8rnUp+MUV4AwMJ9Kj2SiZ2dIlxvczytzJmm97pVYxGmrs0GeWnPCe
         vQ0w==
X-Gm-Message-State: AOJu0Yw7IVQz0gV0Uglz3G6XhydSgTZVcQZ6PTyUW3C2oukwjwgvAKbo
	Gb1f4uep+GmXABakzkhr3ZoAYWeCzPBCAXBZ6f7lUJtR0c4xGy2k7kaLMDkQIDK7j+K9mbulNOl
	t
X-Google-Smtp-Source: AGHT+IFEaQUvljUZraE/82ZiAsZXFaGk2cgK3UqMZBU3BoWN17F/9G0X8WKYUO91N46F+T57DjTtdg==
X-Received: by 2002:a2e:361a:0:b0:2e0:e470:882f with SMTP id 38308e7fff4ca-2e9494bc8b1mr8840821fa.28.1716370099333;
        Wed, 22 May 2024 02:28:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef1c:155d:9d8e:11ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fe36f373fsm470058385e9.20.2024.05.22.02.28.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 02:28:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] recipetool/devtool: Update to work correctly with UNPACKDIR
Date: Wed, 22 May 2024 10:28:16 +0100
Message-Id: <20240522092817.1250809-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240522092817.1250809-1-richard.purdie@linuxfoundation.org>
References: <20240522092817.1250809-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199739

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


