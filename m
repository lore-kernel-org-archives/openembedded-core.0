Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.36667.1598811505805276083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jZFYodDw;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.68, mailfrom: steve@sakoman.com)
Received: by mail-io1-f68.google.com with SMTP id d18so3784889iop.13
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JmwCoyu8XMtkTUPDkn7ofgaRxjdWPAOptjtgbxvQ1y8=;
        b=jZFYodDwqQuANU1rKtb6ot3G57X4ihdVppFWOo7kLvqBpJVdPGhAixt4N3bfvepu5E
         JTk6dxE0BQ4X2sOJMH7nyQIQPHlNCgWws+Xrp3LX6v1R8OZ/xXlpoZ8kQYAgDf4/HOTC
         9xMDq6o+fhGJf3t1PlYh7bxx9+G4YpuWyVKdfmEfRdfU6YxGdokTnfNvWt9hnAwZLPWf
         +vWtPBAttQ2Fq58nRs5PWuQ2Lggvz8QPzjZTP2LnYFSm0yZTNkUN11Occc1XpoDpyC+g
         sTGImozMd55ZWeDtOAXvvP7VEC8zWe+/AvLGGt2YWyZxH7CyaK6ovj08W8alo5/71uJq
         ekxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JmwCoyu8XMtkTUPDkn7ofgaRxjdWPAOptjtgbxvQ1y8=;
        b=nwEPRplD35e3wKrb5QgfpyGot9lHB61uom5ZFczzjnq0u0DbJDFVeQNg2C3SNFNwoI
         Z2ZCef57YyZjsebVKChRAWeebeK4UMCUmMeSIsh4HkdXz4qGyitfyliHT9Xr+ON2DPfp
         kXFuR/1RDa1LPg3sv7m1TC7nlX2xrDXQEtszcNxno7tjXGJ/Ro1iMc0suv8HVoxu79vG
         B/kculYilTqmaEkd7kzmy1G3BfXX1z/jTqeawkpbU5lG/GPgIXeRPYRB8WNBDU5VUDzI
         /rfSkv7ODYcOZhCx8d1MbLq/TX+iiv5pxquKfJZ7VCG0IhzKSh92M5VxmoXnkcklnoB2
         t9Kw==
X-Gm-Message-State: AOAM531678ZFPhGi3cpXUjzuQxgSFJv8v2p6Xq6/HuGD/71btkPTVbb6
	d9scNc/xLfQY6FPag2ab4N9R6E9Uu81OvKlSPdE=
X-Google-Smtp-Source: ABdhPJw2r3f2W3tPzcOGsS2XTlOIhyq0vaSsju9TBhRloxiDe+b0BWZLdCMBRW3cMY6gUO41eYuPSQ==
X-Received: by 2002:a05:6638:2391:: with SMTP id q17mr8925372jat.31.1598811504709;
        Sun, 30 Aug 2020 11:18:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/25] devtool: expand SRC_URI when guessing recipe update mode
Date: Sun, 30 Aug 2020 08:16:03 -1000
Message-Id: <ad90b377cd8d5c807c59a4efd6fcd3886409f483.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* I have recipes which use variable inside SRC_URI, e.g.:
  ROS_BRANCH ?= "branch=release/melodic/swri_nodelet"
  SRC_URI = "git://github.com/swri-robotics-gbp/marti_common-release;${ROS_BRANCH};protocol=https"

  and devtool modify works fine, but devtool finish fails with:

  $ devtool finish --force-patch-refresh swri-nodelet meta-ros/meta-ros1-melodic/
  ...
  Traceback (most recent call last):
    File "/OE/openembedded-core/scripts/devtool", line 334, in <module>
      ret = main()
    File "/OE/openembedded-core/scripts/devtool", line 321, in main
      ret = args.func(args, config, basepath, workspace)
    File "/OE/openembedded-core/scripts/lib/devtool/standard.py", line 2082, in finish
      updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
    File "/OE/openembedded-core/scripts/lib/devtool/standard.py", line 1737, in _update_recipe
      mode = _guess_recipe_update_mode(srctree, rd)
    File "/OE/openembedded-core/scripts/lib/devtool/standard.py", line 1721, in _guess_recipe_update_mode
      params = bb.fetch.decodeurl(uri)[5]
    File "/OE/bitbake/lib/bb/fetch2/__init__.py", line 390, in decodeurl
      raise MalformedUrl(url, "The URL: '%s' is invalid: parameter %s does not specify a value (missing '=')" % (url, s))
  bb.fetch2.MalformedUrl: The URL: 'git://github.com/swri-robotics-gbp/marti_common-release;${ROS_BRANCH};protocol=https' is invalid: parameter ${ROS_BRANCH} does not specify a value (missing '=')

  let it expand the SRC_URI before trying to decode it.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3535cfdbf3d77f550b804276f957acf859da484f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index bab644b83a..d140b97de1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1711,7 +1711,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
 
 def _guess_recipe_update_mode(srctree, rdata):
     """Guess the recipe update mode to use"""
-    src_uri = (rdata.getVar('SRC_URI', False) or '').split()
+    src_uri = (rdata.getVar('SRC_URI') or '').split()
     git_uris = [uri for uri in src_uri if uri.startswith('git://')]
     if not git_uris:
         return 'patch'
-- 
2.17.1

