Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.1748.1599498153647093649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=B6WPuMcA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.194, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f194.google.com with SMTP id d19so1266988pld.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JmwCoyu8XMtkTUPDkn7ofgaRxjdWPAOptjtgbxvQ1y8=;
        b=B6WPuMcAX3WSJax9izQcVdYfam9OfFxqUN6ZBCCougV+DcdrqfzVKQn9C8fLJu/3UD
         34pSa1v1fvKMOw7PUX7wDWH+/LW2Kq4f5n1PWPauyk8kljeyfBdauLJUm0Ud0kjNZudp
         04zmY8yMjiB7BXbXUed+NVymKr71T5372t/OLbYBZUoLOVmzNe32tk5GOFllW/L/adm5
         YwpyTCI7lTEjTnE9nAhkEemWoOlgErk2jx44WVRAlcZ25QohH/UM7tshAQO6SBapVC3U
         +LuZojkfLVPhvMhYxckQvHSdkOJ5Xq48qN2EKkTz0BoLyfmKL2bMCSyQeGnZoto+580+
         1DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JmwCoyu8XMtkTUPDkn7ofgaRxjdWPAOptjtgbxvQ1y8=;
        b=hyDKLsNF/5Xg0lnsDS+ZJmjfj4HD6exqAtzsX6FsKq0KnCQXvV6ZVbg1Y15YSNdM3W
         exBkmM06BZQazpX+c3QwabZLOj0hJZq94H/y/WOLV0ul996H5QbbOUYacUwt9wR8wZAO
         ylE8heN7WHZ+/DhCzkFlSCpu3lUhJebanmvXqcwkVcyg75uLx3XKH7qSXsyDFDPQUkjP
         YJcxZj/nLhWFsKpBoiu8wc5NOEsf0ja0wU0JnInd4rGG5pEEG3VrqiZC8MPHvm1yvLrx
         AZ54yVrw8y6KSFO/yeaB2pksh7wfocecRcQeq8sjG89gI47QpZdLooqqjQD1Zr6/nSNI
         I0cw==
X-Gm-Message-State: AOAM530Dr2+6T+6+H0OotmLH4/vyJpZZVR7DSonMkm+Z0Alr+2y/0azQ
	mqyijYQfyZIYBAuMxUaZabevMF8qW+g5DsHb
X-Google-Smtp-Source: ABdhPJzCLAm0kkVpyAvWRyrwk1l7rQxk9cvRDR29U7WA5KKMa1s4R5IieBanWXviULSAwGCmv1ZaUg==
X-Received: by 2002:a17:90b:1988:: with SMTP id mv8mr216020pjb.23.1599498152641;
        Mon, 07 Sep 2020 10:02:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/18] devtool: expand SRC_URI when guessing recipe update mode
Date: Mon,  7 Sep 2020 07:02:01 -1000
Message-Id: <2de84e6e767d4c3e517d7413a37700bf1991a460.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

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

