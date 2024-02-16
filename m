Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F21C48BF6
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:52:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.16961.1708084355923647481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RD/YI/TE;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso2678495a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 03:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708084354; x=1708689154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qyBbc7y3p1erSMp5lM8uIMJFpZVsck0VE16hy3eLqk=;
        b=RD/YI/TE2wU019cAFbYPKulLs/pKxm6kM8j+RlqrOAiFBtig7C6uVf5LFE9IToKcmu
         C5a/X1ZbXQthRzWP5qMbPnJyQrszOBSOMvhH5MRHiwqAtp2LDgIoENyiE/DMi63UFoax
         T8BPaKJE4iTelnuCu/lNQ5lT/I8l7E/iHTxjvoanBUEd6NypeHUgQH1x0iwUOrb9OheS
         ggYC3gECYxrWLTk8O3JQMyDlwWBQnOEz/Mo0sfZ7dwwi17Psz5pEAMTOg3jFWJ8oxg2N
         JSGNdGf3tyjPuQ8sqZYYTmT69SXKr3psnKXRGAcaFxFTR/XD1uF6kwlyELl0tdMxkkwG
         HkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084354; x=1708689154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qyBbc7y3p1erSMp5lM8uIMJFpZVsck0VE16hy3eLqk=;
        b=C+/ZCISnY1K9iIRIKY8Uf6xaFVMyEL/sRiCiy2HO8cFdxOkkifrF80PA9CnMoH8DdI
         9/zheSFCKV7ESby9XaLAEw++UvlYFubUqwve1oy/X6NX2wZNoM2GZXJtH3YISRIIHW6l
         Te7+XtuZjJ2GsjjHYyZ/9UTNTRUk0ztzuwKtDaV2Fd2DkDoyq+EmaxC5owQ8Og2mCG10
         XH8YNdQSyROgECR8yW33eNyT7JU0b1yVlAggF5/ppfAU2C7r+6Ct+U3epLONfpz8GAsj
         p//dxghqsdQ7siLtfLVlYssg8LoE8QjznxHOsReB0sJwwcRBlP5nyoSBioHqRNL7krvy
         JWkw==
X-Gm-Message-State: AOJu0YwyEmfGT3ENjm5rDJJYIyLUmjOlXP5niwYwxEjMGfNbHV3/+hXO
	zMLocVUjWLqXuN58nrx3aoYT8GS+DxAZIqW48ClXl7HXH6LfFAYBw11nP9J1
X-Google-Smtp-Source: AGHT+IHFZvrQJ+eRtJ08cVwbBsAxr1eq+IGTK2kUMpg0SIlPXYFQ4FLTPpHbY2G0GSpWHgJXhElP1Q==
X-Received: by 2002:a17:906:780f:b0:a3d:cf66:51ff with SMTP id u15-20020a170906780f00b00a3dcf6651ffmr1195798ejm.13.1708084354164;
        Fri, 16 Feb 2024 03:52:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906d11000b00a3dbd16d1b0sm845788ejz.54.2024.02.16.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:52:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/5] meta/lib/bblayers/buildconf.py: add support for configuration summaries
Date: Fri, 16 Feb 2024 12:52:19 +0100
Message-Id: <20240216115222.3545462-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216115222.3545462-1-alex@linutronix.de>
References: <20240216115222.3545462-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195759

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/buildconf.py           | 12 +++++++++---
 meta/lib/oeqa/selftest/cases/bblayers.py |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.py
index 87a5e5a55bc..722cf0723c1 100644
--- a/meta/lib/bblayers/buildconf.py
+++ b/meta/lib/bblayers/buildconf.py
@@ -20,7 +20,10 @@ def plugin_init(plugins):
     return BuildConfPlugin()
 
 class BuildConfPlugin(LayerPlugin):
-    notes_fixme = """FIXME: Please place here the description of this build configuration.
+    notes_fixme = """FIXME: Please place here the detailed instructions for using this build configuration.
+They will be shown to the users when they set up their builds via TEMPLATECONF.
+"""
+    summary_fixme = """FIXME: Please place here the short summary of what this build configuration is for.
 It will be shown to the users when they set up their builds via TEMPLATECONF.
 """
 
@@ -41,14 +44,17 @@ It will be shown to the users when they set up their builds via TEMPLATECONF.
                     bblayers_data = bblayers_data.replace(abspath, "##OEROOT##/" + relpath)
                 dest.write(bblayers_data)
 
+        with open(os.path.join(destdir, "conf-summary.txt"), 'w') as dest:
+            dest.write(self.summary_fixme)
         with open(os.path.join(destdir, "conf-notes.txt"), 'w') as dest:
             dest.write(self.notes_fixme)
 
         logger.info("""Configuration template placed into {}
-Please review the files in there, and particularly provide a configuration description in {}
+Please review the files in there, and particularly provide a configuration summary in {}
+and notes in {}
 You can try out the configuration with
 TEMPLATECONF={} . {}/oe-init-build-env build-try-{}"""
-.format(destdir, os.path.join(destdir, "conf-notes.txt"), destdir, oecorepath, templatename))
+.format(destdir, os.path.join(destdir, "conf-summary.txt"), os.path.join(destdir, "conf-notes.txt"), destdir, oecorepath, templatename))
 
     def do_save_build_conf(self, args):
         """ Save the currently active build configuration (conf/local.conf, conf/bblayers.conf) as a template into a layer.\n This template can later be used for setting up builds via TEMPLATECONF. """
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 2475a79468f..ca1470ced0a 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -121,7 +121,7 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertEqual(bb_vars['BBFILE_PRIORITY_%s' % layername], str(priority), 'BBFILE_PRIORITY_%s != %d' % (layername, priority))
 
         result = runCmd('bitbake-layers save-build-conf {} {}'.format(layerpath, "buildconf-1"))
-        for f in ('local.conf.sample', 'bblayers.conf.sample', 'conf-notes.txt'):
+        for f in ('local.conf.sample', 'bblayers.conf.sample', 'conf-summary.txt', 'conf-notes.txt'):
             fullpath = os.path.join(layerpath, "conf", "templates", "buildconf-1", f)
             self.assertTrue(os.path.exists(fullpath), "Template configuration file {} not found".format(fullpath))
 
-- 
2.39.2


