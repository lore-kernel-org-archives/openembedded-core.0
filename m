Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7900C61DB3
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:08:37 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.16866.1700651309258826198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=I0dX4UDK;
 spf=pass (domain: baylibre.com, ip: 209.85.208.48, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so9506304a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700651306; x=1701256106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2A687E+8o0dUDAEmT4ySMrI1BYwgMyYRSIeMN9iJagw=;
        b=I0dX4UDK/0QrIupBSfyRKEV9BTSXlo6YP/bvSMVaVaV2rZV2qlhSgmoHCax5HOJ9QM
         f/Urv+U1Gon1VpLgMn1mpI8KS2oZbEkIZucpF3nApemU1dm2N+0OG0PGQLC+TQQ1uXLk
         C7YqxQ/uGB4ByNEH6mAoBj5DQROJ/ECuqHYVip8SNgoN9YG18rkWl+dmdwwgnz7EVYFg
         Ykl3kdo+WJ8zLyL9qKX6Aikl7J09cfT+D4ZXk+6QUP97s0Sd3E0FvdkviLOyX6YcqpPH
         Ji39aMeub0GPsdwkLu6fEheTVixfTBKS9GWks+h+En/JIXnaYpHtZy+YdMtEwWpOa4Ao
         RLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700651306; x=1701256106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A687E+8o0dUDAEmT4ySMrI1BYwgMyYRSIeMN9iJagw=;
        b=XaaZ35mFFapHW8NQwWy7JBzjFvWze7tFf1RlPLdyZZ9G3Yra3chXQOZ1LicklGWsqo
         YdDiPGXBcqczy1VwTo7pzr+7Hq+IIqy8XtwWvCqilMj7PxHcjiqyt7zyd9kaldTfneU2
         w/YOs6VsWNz03mxriBwUVMzQbTwAQ25KU3Y4IR4+vgAFvDcYvxZWME1DWG6eOICmVs9R
         d7lRSrAPSHqkQVo15vUilw6VGOuqZbh5WeARrt1uaQKWOEloaqSVKYhrI5APYoHTBa7g
         dj0gQYLZCPgJcrjUmeQ+nUmHrLIkDZSmelB4tZo1rDBuAF7YuaQjbFwZJCmtSoQieTxq
         DsPg==
X-Gm-Message-State: AOJu0Yz6IJasJyUHSHgJ6JSONeE7KRi54LGiIFsw9UvTOP3rjy1SkPus
	p14lNYHVWyx6Up0U2A7Qp+GYhU0I1wAW56F0JyISDw==
X-Google-Smtp-Source: AGHT+IEI5tCOO1mCMnF+2P1b+Cu1iKy8lIEI64T2+bq9O9Oh11zrEEXKmET1uUSezdxOjNGCGQvqMw==
X-Received: by 2002:aa7:cd6f:0:b0:543:8498:fda5 with SMTP id ca15-20020aa7cd6f000000b005438498fda5mr1565478edb.14.1700651306243;
        Wed, 22 Nov 2023 03:08:26 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7c7d7000000b0053e88c4d004sm5790713eds.66.2023.11.22.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:08:26 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 2/6] devtool: finish/update-recipe: restrict mode srcrev to recipes fetched from SCM
Date: Wed, 22 Nov 2023 12:08:14 +0100
Message-ID: <20231122110818.932618-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122110818.932618-1-jstephan@baylibre.com>
References: <20231122110818.932618-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191062

When specifying --mode / -m srcrev with devtool finish/update-recipe on
recipes that are not fetched from a SCM repository we get the following
error:

  Traceback (most recent call last):
  [..]
    File "<...>/poky/meta/lib/oe/patch.py", line 49, in runcmd
    raise CmdError(cmd, exitstatus >> 8, "stdout: %s\nstderr: %s" % (stdout, stderr))
oe.patch.CmdError: Command Error: 'sh -c 'git format-patch --no-signature --no-numbered INVALID -o /tmp/oepatchbj7pfmzj -- .'' exited with 0  Output:
stdout:
stderr: fatal: bad revision 'INVALID'

Fix this by adding a check and abort with a proper error message.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/devtool/standard.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index cd79c7802cb..55fa38ccfb8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1530,6 +1530,11 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
     recipedir = os.path.basename(recipefile)
     logger.info('Updating SRCREV in recipe %s%s' % (recipedir, dry_run_suffix))
 
+    # Get original SRCREV
+    old_srcrev = rd.getVar('SRCREV') or ''
+    if old_srcrev == "INVALID":
+            raise DevtoolError('Update mode srcrev is only valid for recipe fetched from an SCM repository')
+
     # Get HEAD revision
     try:
         stdout, _ = bb.process.run('git rev-parse HEAD', cwd=srctree)
@@ -1556,7 +1561,6 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
         if not no_remove:
             # Find list of existing patches in recipe file
             patches_dir = tempfile.mkdtemp(dir=tempdir)
-            old_srcrev = rd.getVar('SRCREV') or ''
             upd_p, new_p, del_p = _export_patches(srctree, rd, old_srcrev,
                                                   patches_dir)
             logger.debug('Patches: update %s, new %s, delete %s' % (dict(upd_p), dict(new_p), dict(del_p)))
-- 
2.42.0


