Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EDFC83F18
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 15:43:33 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.493.1693410212172806525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 08:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=W2UbB79S;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99bcfe28909so740685566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693410210; x=1694015010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJV9xIkegC/1KTNNCLgDN077WlgsoZu4GiJ8/lyG+Ss=;
        b=W2UbB79SaIiqSnuHMEXiOCAGSxG3o7xRX7f8jUHDipngJ/4SRkGe5y7CaMMs5PnKrG
         7bl/IfVQ4+G2yu92BVea3NuLLPEcCiW4zDdvNlo2ucmpTs81nq9pa4TZP1UJvX+qTG0B
         mLGjKNU59dXExBr78CGLdLHd+Fx9AcGfz7wXnAELv32yPtuFYsHMZtIUKcWA5Q/uVq+p
         b1nOyhVybq89ToAkSH38rA2rs9zspmlnEkJ6kvAjEdCEGpi0B+qpFVtRwE1kJKMh3u8L
         HaSHISrEC8xq8OHtjl2WdnjzyNaoQpQIweaACCAK5Zml9GSZS6kl4ZWdXX7Cd7uDGpB9
         7eQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693410210; x=1694015010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJV9xIkegC/1KTNNCLgDN077WlgsoZu4GiJ8/lyG+Ss=;
        b=C80IixYhdAUmKoTBNvBESV6ysJVM+wOEbrAdGRVJ088M/kQcQNgSTqfndR5Fg+mOb9
         if4UB+K+GJNQVG5OyUkPnm6j9jCW8Gx6tzt1lfWykU8mL/13VfeaEBbBcHYyM63qZn4m
         qVTZx+IOl146UaS4n3NwV584QyDr4GjgcVWNsqwCITjTB3zN6VEiwlCzbXMM87qGk8ry
         8T+HSDVUeRygsbY60fU3C7Lg2ocJFt4L+6c0zb9/6tzuBCE8UQKDkcSSmVWQAzPwzzUp
         AUZMzQKoNd3tcSlYV5/JgHS6TA98tHdq2T+a+T5O7y09NmhI6iw0xgwC/rY6lxN8EFOK
         Iwaw==
X-Gm-Message-State: AOJu0YwNeuMLNiZxaR+L2Kci2d83q89MVT0Ufkwhy9Nf2G1uDlRhQqo2
	/4n3mo+PCa5yPYE/4Jz8jz1dRK7tjXM=
X-Google-Smtp-Source: AGHT+IHbCPk03tT7NUViZ85buaumdRn8DzKUu5YTzBWHvOLOb09ir51Q+D5xqLTE0rRwH4++JYD9ww==
X-Received: by 2002:a17:907:a05b:b0:9a5:9ddc:607d with SMTP id gz27-20020a170907a05b00b009a59ddc607dmr1957592ejc.61.1693410210211;
        Wed, 30 Aug 2023 08:43:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jj26-20020a170907985a00b00988e953a586sm7336559ejc.61.2023.08.30.08.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:43:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] meta/lib/bblayers/buildconf.py: add support for configuration descriptions
Date: Wed, 30 Aug 2023 17:43:13 +0200
Message-Id: <20230830154314.661141-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 15:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186896

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/buildconf.py           | 10 ++++++++--
 meta/lib/oeqa/selftest/cases/bblayers.py |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.py
index ccab332adfb..a299b135669 100644
--- a/meta/lib/bblayers/buildconf.py
+++ b/meta/lib/bblayers/buildconf.py
@@ -26,7 +26,10 @@ def plugin_init(plugins):
     return BuildConfPlugin()
 
 class BuildConfPlugin(LayerPlugin):
-    notes_fixme = """FIXME: Please place here the description of this build configuration.
+    notes_fixme = """FIXME: Please place here the detailed instructions for using this build configuration.
+They will be shown to the users when they set up their builds via TEMPLATECONF.
+"""
+    description_fixme = """FIXME: Please place here the short description of what this build configuration is for.
 It will be shown to the users when they set up their builds via TEMPLATECONF.
 """
 
@@ -47,14 +50,17 @@ It will be shown to the users when they set up their builds via TEMPLATECONF.
                     bblayers_data = bblayers_data.replace(abspath, "##OEROOT##/" + relpath)
                 dest.write(bblayers_data)
 
+        with open(os.path.join(destdir, "conf-description.txt"), 'w') as dest:
+            dest.write(self.description_fixme)
         with open(os.path.join(destdir, "conf-notes.txt"), 'w') as dest:
             dest.write(self.notes_fixme)
 
         logger.info("""Configuration template placed into {}
 Please review the files in there, and particularly provide a configuration description in {}
+and notes in {}
 You can try out the configuration with
 TEMPLATECONF={} . {}/oe-init-build-env build-try-{}"""
-.format(destdir, os.path.join(destdir, "conf-notes.txt"), destdir, oecorepath, templatename))
+.format(destdir, os.path.join(destdir, "conf-description.txt"), os.path.join(destdir, "conf-notes.txt"), destdir, oecorepath, templatename))
 
     def do_save_build_conf(self, args):
         """ Save the currently active build configuration (conf/local.conf, conf/bblayers.conf) as a template into a layer.\n This template can later be used for setting up builds via TEMPLATECONF. """
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8faa0602348..819ddf51bcd 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -121,7 +121,7 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertEqual(bb_vars['BBFILE_PRIORITY_%s' % layername], str(priority), 'BBFILE_PRIORITY_%s != %d' % (layername, priority))
 
         result = runCmd('bitbake-layers save-build-conf {} {}'.format(layerpath, "buildconf-1"))
-        for f in ('local.conf.sample', 'bblayers.conf.sample', 'conf-notes.txt'):
+        for f in ('local.conf.sample', 'bblayers.conf.sample', 'conf-description.txt', 'conf-notes.txt'):
             fullpath = os.path.join(layerpath, "conf", "templates", "buildconf-1", f)
             self.assertTrue(os.path.exists(fullpath), "Template configuration file {} not found".format(fullpath))
 
-- 
2.30.2


