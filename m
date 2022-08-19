Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB0FC3F6B0
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.482.1660894106540118321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VRKw6VmC;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id s23so1883226wmj.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=J9zvhjfWxW0pH2je/FnjGXewWJqVDjXp1F+Z/9+sn1w=;
        b=VRKw6VmCZAZlO2WlAGzglrMsTrrOFsGuiD5x0Esp8yNDzKqCNieoEBH5n3wb77IlYK
         vN99dPzBUiFI3A3Xq8GOgNOYqH8TnwwBfLricsS6juCxf2nDUM0XOSb1YXTcpxvYok2+
         9jG7tpYF/AwEL5qlVuSPKf9nNO1Ee4A775+AeqHpBOnrHE9VTxC7OmlvN6QB92jF7pFp
         eluf66o0UjWHVHIq4FjQgsKYes+DOuXXdonw/lKcokEWFflxOpQho/qM/eZaRUD5Fw2x
         +1FOEj6xz3rjHVXJ/1fp8M+OvBZUqjjkoSlVy933CcTjUFLQdU/NusKhqDjHYdt7hA2p
         rw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=J9zvhjfWxW0pH2je/FnjGXewWJqVDjXp1F+Z/9+sn1w=;
        b=U9y6SGV5fgNVSyr/OePBF/DRYE1oVD42nvLxLpGOTGWD3LWCvwMR4vFa2ef/3UGZhY
         YBL5KBK8orj3rYqDJpi9LMxKPdP0n8ipVhcQizkOHwMhc8y0Duu2g3Km/edF5QRp31tx
         WpeIDQQJEhu7hl092opzHG9IKNCjv4cYZH0LeHVF/IAyUyE4aM6mRzKSMSimUvuBOk6U
         W3ypxhfYpZvXHgQdBlBjzys3LB8rXUV16O3q37mL/tOUCEQ7Hrjf2ZVQC6G0rRhUumNa
         aNKo5mTTym4c4NHpeAqzxK0xXQs8IKNEBWDgA8rpafEmN6ebPK8RhfU2GVEUfFa8TA/p
         MeIQ==
X-Gm-Message-State: ACgBeo3WJoNvU0NZiFBrdutJvZNYgKjJDGNeAupB05kGpdXcuKe7nhq5
	u3dyOVmQthZbvUWkwt2DzoiEessYPxU=
X-Google-Smtp-Source: 
 AA6agR6axtttRs2hk+mBe8HgttlCl1SzJNOmwZrj5X7zt4/8hzDlcP5I2pkRsYVxnwOYBvu9x3ni7w==
X-Received: by 2002:a05:600c:1e8b:b0:3a6:acc:ebfb with SMTP id
 be11-20020a05600c1e8b00b003a60accebfbmr3924477wmb.66.1660894104983;
        Fri, 19 Aug 2022 00:28:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/42] devtool: do not leave behind source trees in
 workspace/sources
Date: Fri, 19 Aug 2022 09:27:27 +0200
Message-Id: <20220819072727.2236928-42-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169613

These are typically auto-extracted with modify/upgrade from recipes
and can be easily recreated. On the rare occasions where they need
to be reused, they are still available under workspace/attic (which
is already used for old recipes and appends), so nothing gets lost.

This avoids the annoyance of devtool refusing to proceed because
there is a previous source tree in workspace/sources.

For independent source trees behave as before: do nothing.

Adjust the test that previously deleted those trees by hand.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/devtool.py |  2 --
 scripts/lib/devtool/standard.py         | 16 +++++++++++++---
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ec08ac6d60..142932e12f 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1957,7 +1957,6 @@ class DevtoolUpgradeTests(DevtoolBase):
         self._test_recipe_contents(newrecipefile, checkvars, [])
         # Try again - change just name this time
         result = runCmd('devtool reset -n %s' % newrecipename)
-        shutil.rmtree(newsrctree)
         add_recipe()
         newrecipefile = os.path.join(self.workspacedir, 'recipes', newrecipename, '%s_%s.bb' % (newrecipename, recipever))
         result = runCmd('devtool rename %s %s' % (recipename, newrecipename))
@@ -1970,7 +1969,6 @@ class DevtoolUpgradeTests(DevtoolBase):
         self._test_recipe_contents(newrecipefile, checkvars, [])
         # Try again - change just version this time
         result = runCmd('devtool reset -n %s' % newrecipename)
-        shutil.rmtree(newsrctree)
         add_recipe()
         newrecipefile = os.path.join(self.workspacedir, 'recipes', recipename, '%s_%s.bb' % (recipename, newrecipever))
         result = runCmd('devtool rename %s -V %s' % (recipename, newrecipever))
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c98bfe8195..e3b74ab8f0 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1975,9 +1975,19 @@ def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
                         shutil.rmtree(srctreebase)
                     else:
                         # We don't want to risk wiping out any work in progress
-                        logger.info('Leaving source tree %s as-is; if you no '
-                                    'longer need it then please delete it manually'
-                                    % srctreebase)
+                        if srctreebase.startswith(os.path.join(config.workspace_path, 'sources')):
+                            from datetime import datetime
+                            preservesrc = os.path.join(config.workspace_path, 'attic', 'sources', "{}.{}".format(pn,datetime.now().strftime("%Y%m%d%H%M%S")))
+                            logger.info('Preserving source tree in %s\nIf you no '
+                                        'longer need it then please delete it manually.\n'
+                                        'It is also possible to reuse it via devtool source tree argument.'
+                                        % preservesrc)
+                            bb.utils.mkdirhier(os.path.dirname(preservesrc))
+                            shutil.move(srctreebase, preservesrc)
+                        else:
+                            logger.info('Leaving source tree %s as-is; if you no '
+                                        'longer need it then please delete it manually'
+                                        % srctreebase)
             else:
                 # This is unlikely, but if it's empty we can just remove it
                 os.rmdir(srctreebase)
-- 
2.30.2


