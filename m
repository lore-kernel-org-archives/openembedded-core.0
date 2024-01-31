Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D38DC47DDF
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 12:39:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.12848.1706704768532298215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 04:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CE9sVgVd;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso5336155e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 04:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706704767; x=1707309567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+r3xp0YVppG+K2zbU8EUAKGRhHjAC7qKZPG0gnL87Q=;
        b=CE9sVgVdsd124Lsbhj3k0POYfR94szlu7vipDaNPIzoYmuDDIWzJJBTf3b6mI+fmo/
         UoxOj6RR8her4vxqU6oa+UcmV6eFl/kRaobXk1PN/csZo+fwuxiRsIeyP6fPVLkY3Cph
         2h3pY7LyCQB/jaTVyBze4rVBGlEKt9eskWqfW03TXpM8Ju4fL3Rv1oUgqXma7bVjeKV4
         fbQyuezrWoRKR4dzmBUYqwc7Y/H9x3qdrkjxUF1tXmLYq4jGkumw+IxNCL+I+jGDYmkS
         P7Ytk/Dwq3N8o2BrJJZAGAxqmRJNcevJ1S+myCsSxVXc+d1z88F8HO4zb+uEC2ZzfpSw
         eTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706704767; x=1707309567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+r3xp0YVppG+K2zbU8EUAKGRhHjAC7qKZPG0gnL87Q=;
        b=cxb3pXwnmm7BWMuENxwfjJ9Rqly9m16KgcA6S/NEcLPRNjdILe5q/HiGqnGcUcXPh+
         lICgbHk4DEWb5oyl4CJwcpVwY4Po43LQtkQUyLLXBwtFNiEChCQeIqG57B02O5ewYDqM
         fQoe9AjEyOQ4TwVmqT6i0ReYVy7Zr74zDsi162wSqTPRApYYZG5Ox0RjGqy1zL4SdM2W
         N3hD/TRNKciSL3u0kVOY5RD0+9zd8bj2wCwDTzyG6wxe2pVoIisTQEP3b6CBx9sZoF1M
         UDq0TuPJ+q/s78QM3SKh+B4GuQViavZcqvaQgI+0YjwHX45qZi9n2qYaU5H2EnIABlPh
         65Dw==
X-Gm-Message-State: AOJu0YyD0MjhvPZZE3Dv5bISKkSSh3EpWZ4K1Ll6vQOvJcZc1LAty2ND
	luS9pSqAzSWdLh4ctD/qdu3rO1xx3wXksmbn7wDmvKxmDR2I7oKFwcHcIKxZ
X-Google-Smtp-Source: AGHT+IF9iFAhCQm1tXJLFfpgvYzOdinTLYI2B4YzGjrjT4q0qUrs/A0AK8gsHIIwM6LCSbreFl2oMw==
X-Received: by 2002:a5d:4202:0:b0:33a:e9eb:c637 with SMTP id n2-20020a5d4202000000b0033ae9ebc637mr969929wrq.42.1706704766993;
        Wed, 31 Jan 2024 04:39:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ba1-20020a0560001c0100b0033ae593e830sm10898058wrb.23.2024.01.31.04.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:39:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/5] meta/lib/bblayers/buildconf.py: add support for configuration descriptions
Date: Wed, 31 Jan 2024 13:39:05 +0100
Message-Id: <20240131123908.1098544-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131123908.1098544-1-alex@linutronix.de>
References: <20240131123908.1098544-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 12:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194520

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/buildconf.py           | 10 ++++++++--
 meta/lib/oeqa/selftest/cases/bblayers.py |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.py
index 87a5e5a55bc..a7d06471df5 100644
--- a/meta/lib/bblayers/buildconf.py
+++ b/meta/lib/bblayers/buildconf.py
@@ -20,7 +20,10 @@ def plugin_init(plugins):
     return BuildConfPlugin()
 
 class BuildConfPlugin(LayerPlugin):
-    notes_fixme = """FIXME: Please place here the description of this build configuration.
+    notes_fixme = """FIXME: Please place here the detailed instructions for using this build configuration.
+They will be shown to the users when they set up their builds via TEMPLATECONF.
+"""
+    description_fixme = """FIXME: Please place here the short description of what this build configuration is for.
 It will be shown to the users when they set up their builds via TEMPLATECONF.
 """
 
@@ -41,14 +44,17 @@ It will be shown to the users when they set up their builds via TEMPLATECONF.
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
2.39.2


