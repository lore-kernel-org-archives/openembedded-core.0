Return-Path: <eric.meyers15310@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976A1CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 13:34:56 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20446.1781098491116667770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 06:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=saJgKnx+;
 spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: eric.meyers15310@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-486b95fcdc7so1743157b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781098490; x=1781703290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFuZtSjhszf0hMnKlqmzqh09Ea6vrUjMK4B/4gC/j0w=;
        b=saJgKnx+TRYK2WgGXw9Skp7oSclRng2dozGGrpmRMhRQSxkv63+xjilQBwWuR90lli
         Xtjv+USzJ6DaHki7bklcjd9cIraxTfB/cPOnkmVf5QJTPWJCFwHiEbHEYWJiLURq0G6I
         vB8l5G48h0vFHX39M2txfUJyeGIbzPlLMMwY/XTZ05/eJnV2qTOGe3oZ56Nid1iwxcar
         i6++oGl/hEr6p6hfWPT73WwOa/IpzQt0tDh8kMyVudsLrWjWyiI7hyBEbXMUu8MNBOhv
         cvXgFRYoLEPqYh4vrgaYWCjIqGSEWXA1dr81sz8CDo7citSqVAsOYInuQKzFpQH4Ux4b
         TpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098490; x=1781703290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFuZtSjhszf0hMnKlqmzqh09Ea6vrUjMK4B/4gC/j0w=;
        b=NQH+z2DNOoQe1dT50KIuzTxjpeYfk8f+u9/E+jR3RwJUe9CFKr8lvZj/Kt8g4RSTLb
         6Vxr2030XmeQ5jFPpP7DVdLiQrDlCeBRYUjg+VAqkfm/4PxoL9BILnKBOXjvEoHSigSp
         fL823znS6+aE7KyFZbC0VhXgUqnCGdyctM2c9knnkPlGl3xPykZwwRyN5FGFsZ47H2gj
         lX/NYEp4TLhxigxt2iKNul4ewlsNGo6uKwf5obD3WM0cLmzFwZV4t8/gi/kIWYLei5GO
         ppTQz1hvDROG4WxoSQ1kTH4fRr2opHVOXav3GXBmH41spEZiQnvXJOfEI8VvhfuR6XOM
         fZvw==
X-Gm-Message-State: AOJu0YwtpA/O1vS9FYOdD1CWhcpEePwZOGQ8sLwdHyJn4IoPPklMl0gr
	Pal9R+BM3iNeWh2U8VTE/sZNI8lfdfR2TKe3Ap+/bjmOw0lAQYLWQNIm9gVGXAQe
X-Gm-Gg: Acq92OGQg/2MIrwb2S2iWYC9ovdSTRqPG1Sf4HzYvBt2AdyEXy/EdvG+IVvi3RS0T7a
	DT3trsUps3fUYRfVgNZpNoMALkzUAU1SKIhFVqLBmpS0h/Ryhq0wF9NqktCEhEnCnbOrTNUO+fO
	hzQLBVj7OK1iVN5clIW/VdgfMLzP6yE43uduiiOjYEBGZD9llYETzTwz99O6GBVTv9/gAds6dOH
	kP+y4Pz06MSe6be9HLAcOZPgfH77eBS8H2a/a9zqDGTBKzPPLnKKwaS6JtuwBUHcvkH93fM2MYp
	kPVeoJjaKTcDT79BYdt/UT+ukxdGNggs4KS/URwWh4rbEVWBEpzDxMJ2WKAHV6dGoFyTJlinu+J
	9+3svfFxJ/+MAw4T/KnQ82d3YZ5VLyJkl/0ckgH+cE4AWM1rOASJdAa9MuhZ68TQF+Q86Hrw7xT
	Do/TOzEQ88B36WvbDedYTaCPrROfBDHP+Ez6lYsjsdgKFAfbyYostVxkoDDWcoto/xs0ot1i9Id
	Yj4e3438m9XVvuewJVPACRkz0zTZcoagg==
X-Received: by 2002:a05:6808:1185:b0:484:afc2:eee3 with SMTP id 5614622812f47-4868dbf2a5fmr14274642b6e.5.1781098490205;
        Wed, 10 Jun 2026 06:34:50 -0700 (PDT)
Received: from ACT-L-SWD024.yourbase.domain.local (c-73-168-239-54.hsd1.il.comcast.net. [73.168.239.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b91f944sm18570128b6e.9.2026.06.10.06.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:34:49 -0700 (PDT)
From: Eric Meyers <eric.meyers15310@gmail.com>
X-Google-Original-From: Eric Meyers <eric.meyers@arthrex.com>
To: openembedded-core@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>
Subject: [PATCH 1/1] npm: Convert to list-based commands for NpmEnvironment.run()
Date: Wed, 10 Jun 2026 08:34:44 -0500
Message-Id: <20260610133444.29699-1-eric.meyers@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 13:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238360

This only affects those who have bypassed npm being disabled in bitbake (post commit 355cd226)

This recent upstream bitbake commit:
https://git.openembedded.org/bitbake/commit/?id=2ee0a002cd50eec1a0743c9ced9e07e529c79ddf

broke npm install commands within the npm bitbake class since NpmEnvironment.run() expects a list
instead of a string. Update the remaining callers to pass list-based commands to avoid:

  AttributeError: 'str' object has no attribute 'append'

Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
---
 meta/classes-recipe/npm.bbclass      | 2 +-
 scripts/lib/recipetool/create_npm.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 7bb791d543..b1183a7ae3 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -300,7 +300,7 @@ python npm_do_compile() {
 
         # Pack and install the main package
         (tarball, _) = npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
-        cmd = "npm install %s %s" % (shlex.quote(tarball), d.getVar("EXTRA_OENPM"))
+        cmd = ["npm", "install", tarball] + shlex.split(d.getVar("EXTRA_OENPM") or "")
         env.run(cmd, args=args)
 }
 
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 8c4cdd5234..4d316d9a55 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -97,14 +97,14 @@ class NpmRecipeHandler(RecipeHandler):
         bb.utils.remove(os.path.join(srctree, "node_modules"), recurse=True)
 
         env = NpmEnvironment(d, configs=configs)
-        env.run("npm install", workdir=srctree)
+        env.run(["npm", "install"], workdir=srctree)
 
     def _generate_shrinkwrap(self, d, srctree, dev):
         """Check and generate the 'npm-shrinkwrap.json' file if needed"""
         configs = self._npm_global_configs(dev)
 
         env = NpmEnvironment(d, configs=configs)
-        env.run("npm shrinkwrap", workdir=srctree)
+        env.run(["npm", "shrinkwrap"], workdir=srctree)
 
         return os.path.join(srctree, "npm-shrinkwrap.json")
 

