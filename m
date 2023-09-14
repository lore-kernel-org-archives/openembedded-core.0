Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5579EDE9A9
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 11:25:57 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.9605.1694690749746031610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 04:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CLTUQd99;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9a9d6b98845so437857366b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694690748; x=1695295548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJV9xIkegC/1KTNNCLgDN077WlgsoZu4GiJ8/lyG+Ss=;
        b=CLTUQd99fy8GsWV8M4UbbHLz7hD/Ep8YWEt/nqNkLa2CzJEKH/7MVkjc4V24fuKH54
         hBXzvcror2Pe0WKl8Wu2vI+B85v0WgxqYJQUiiZdPkmQ/PhCbmLIPz1L2VN0iyNDnK1Q
         WF1fU5roxlWV6xrj5JAu1RY8S+0ZzIBa0Flb0CydhENR8QsgCbPNgxq2+rMZGyp9Fr+e
         tYSPq/qXaZm7fY2wWb+5DtMs0+4qLNjr0n3OOxb0pKb+NZ9nWsBjfqwK858HUApTh2NI
         fV8vVSgA8ah6rbPVFhLrVTVGm3l1ljr34rJqjNXJvo59ODw4qpnFB7AmLmXE029HJ7D9
         xuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690748; x=1695295548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJV9xIkegC/1KTNNCLgDN077WlgsoZu4GiJ8/lyG+Ss=;
        b=XexLu9fA2R77NZ/3BKVs3NjDmyHPNdqitRkJnAeAIbTT3U7kyV6zoh5/j1pqFd15A5
         2ehtRgYx32JX494flspNAGpuFeOY7kRaG1iCiZbHHz6GN0fitdX3TTAGsZQjr4+/6ELY
         mR7J934uCE7m4SvaSCQh/fZI+S37J4WzxKyKuznaOtLTeOqhAI5AY/gkEtzEZc50tUW9
         1O7aka7KZPRLaI6nGFwV9C4gqiu7+kzt6fgRhxTjZl46Q0L5B/rGIfgHk+hzE33L6qjK
         aK4Eg2pNWSrV6VevinGCIb5240ZwslXIl/qTuEG8TwmCrCtTWrGDnoX2pEx0UTMJK8J3
         fXtA==
X-Gm-Message-State: AOJu0YxU27sTEyIdq9D3y3Sryf4TrT3Yh7D6W5AZpK+o0Sv+oZbah10c
	FAxRvFKaRBbzr4U3D224M2Op+qpp9e4=
X-Google-Smtp-Source: AGHT+IGzDLSLxZtyuzN6eYMFcBFToeLYLLJMLHo3CrW+LKGTNRtAwawBGouugQvvEZhE1AoUpldeEA==
X-Received: by 2002:a17:906:73cc:b0:9a9:f0e6:904e with SMTP id n12-20020a17090673cc00b009a9f0e6904emr2121539ejl.16.1694690748116;
        Thu, 14 Sep 2023 04:25:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906861700b00992d70f8078sm873832ejx.106.2023.09.14.04.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:25:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] meta/lib/bblayers/buildconf.py: add support for configuration descriptions
Date: Thu, 14 Sep 2023 13:25:39 +0200
Message-Id: <20230914112540.2214062-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230914112540.2214062-1-alex@linutronix.de>
References: <20230914112540.2214062-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 11:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187633

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


