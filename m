Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.86285.1597836057013215161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 04:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=He+BGSIz;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id t15so17732088edq.13
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 04:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=raiQD0PLA0Bs9o56uyCx4Rj/C1cBfFdPpXMFactkqFE=;
        b=He+BGSIzNZfIR5NgFnCf9En+h7FMYywDRPPSQwXvc0C3guTyqKQA4AAAHiYtoojEX2
         9t06Nrqf+g24au9ba+9t9S+u8yxKrLJm6axgqNt+mLNHFrQh7bzMe8XtGiom/sK1UYpm
         1dQ8cNDypDiZloKmCAlmO4j3DbStXuRla1kJV4RRqqVCgJfhDYrCF1aer4GFISGOMvLX
         dF/Gxery8vnVz0lxfwxzmNMKCVm6oSs1ITi3MrTGrQMKCDTW7GcAhujc+3hcYVMGNSJ1
         7kS2Dh3TA+zwJsrzC5k8YTrvgn9XnWk6AO7ooXwYMRGjHQApoyyauepKMmNPR7bUmBw+
         wXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=raiQD0PLA0Bs9o56uyCx4Rj/C1cBfFdPpXMFactkqFE=;
        b=XZiBTM74hkzUbOtSmweAdvqIaxbTKfh5slggY/lX/MSmplxxVF08k7u4e7DgJfzoyP
         CQR2FC5OvQ6KXji+TVQ0rQrmw8b8cqyQz1HTuVgVC76RibbRhLUqA4NdSz5yQY7FJT+m
         nHQIoebsMwKYqAi920sXnC2JmU+hoo2J2/azqV1dPFlel8IHwBqpFStG1d3Yy9X1ERf7
         anXG7UNKbxYh8yNOcjn2helv/UBHKRRhH0x4/oBWFi6JtNLtT37MyvX2+EJkTIeCjZSJ
         /isFVeiJOwqOPoAgBUgIy1XRSa5c2op/apknCtnAtvtg+rgBQuN+d0iq2zRTvS3Q98fb
         MeGg==
X-Gm-Message-State: AOAM532SBcvY392PlAz/YpeUYZ/lCmcdof5V6HYyHNM3aZM6k19HmJU2
	ritSNvhqvGynnJR2U0sYeDlRTS4Srag=
X-Google-Smtp-Source: ABdhPJxy/GCkSKrKdqL1GtUaO6aI84zPLz9HyxJypL5x8w+KCrXNf609KwV6KPqsEK+HH8xptYuymQ==
X-Received: by 2002:aa7:de13:: with SMTP id h19mr23274831edv.322.1597836054936;
        Wed, 19 Aug 2020 04:20:54 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m13sm17778526edi.89.2020.08.19.04.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 04:20:54 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] devtool: expand SRC_URI when guessing recipe update mode
Date: Wed, 19 Aug 2020 13:20:51 +0200
Message-Id: <20200819112051.8746-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.25.1

