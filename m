Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD66C8303A
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:33 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.10925.1751377110822847032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k7Kwl6A/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso2611703a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377110; x=1751981910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+G6vkRc9ceN5QEcRBAQAc/LkoUaGMW4zE8X9Tnku6I=;
        b=k7Kwl6A/KmlWFI2f89yF4U99segW0UvAZPoxFQ2xXQ3Dd4wUyHRDbxhueJTyWzbBWE
         MQjga7bq2EqPkTPGuyhfFdIW8Wq+dTvS0Googj/CNSToJFAKylHDmK40ylz/9ML1v8YA
         BOBr1EfqbrJ7wXjWh7d4eJ24eBAUx4bd4ZNjuAaBfhuIhOHsaKjqIB6CNzTWxO92rTNg
         1fPAosTIUQYn7MaKgWTYeGUkUFDZgbnKR7F3x7ExH8jJ1rtbXfTPrVP5rdHXqp6ztK4c
         exCFtGd+/rh2doYg3yzoTG/SNHagHFvPeui7jykUbR6S+CoZoSezAkofSnzY9ihfs398
         T37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377110; x=1751981910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+G6vkRc9ceN5QEcRBAQAc/LkoUaGMW4zE8X9Tnku6I=;
        b=J0ADjKJ/wXBuxZ4IsLHJTvsbm+MMbV7BM+59O7y4FbcrgknqEyDMWcd2sMVEJGu0O9
         O7RMmLcXv6Z3yrQP6b/CWecXUL8Afy25xHt4B1pjzrAQhnfA5+YghyWAOn5aieF7hGBb
         XQgSOdjlTEcvOHG+p94ZmMOzPWTLg6EDtH7jmGzNEG+Dxuc2VPDS6Du0DbEHUwYkp8Yd
         it0PYST2seMjSNAUWVlMtOL9s1sJ1BhLiIYXXm3I0nWlYpiy7Ut6FWwTJ1GAZ84yKyUF
         dbfyeLnDKvkNoV6q99KwHjqXM0ZmsWRi7g+pAn/DwkdUmAmF26NN96bQJwlV9IFZD6rj
         dKGQ==
X-Gm-Message-State: AOJu0YxTPJoBS2S5Y6Wd+Zc7RJvG4sFK7cL4wV4k6Ok+EWAj7lKreBPP
	R4EZ8SSmYprou3PIkHl5vQdpZ4dIMlIHAtBdgXAyz5oeylOGhyUre0S92c7ulS745JQSI26OtTv
	1YGsu
X-Gm-Gg: ASbGncuG9W/xOVR8fcjGchUvJOo1NyLeApSCf2eCXY433/OG69Ucy/p+D+zD6uEJTE1
	e/nXpJTu5128Ake8Gm0g8UayhyCPuZRvxUSELPQp6I3tHr3R46zdJiIfW5hCfG0nVmRAZgguCUN
	gwfH9wEEu1ZeFG9/92mbuqzkhFWYSwjcy4cyD1BZB/NMQkWTEUrqUBxN7F3CmqmhtFvxck0qpDB
	AGlqWgxOjbM+RyHgRUS/sjZaSopFqI1WpEdK6w4EgeoFLTmQtrpNhH5cwKBBdRq387AKtGHI+bR
	/RCJ9h31/EyVR4r9y+XQju3YOS/9YqD/Ho5JbaxB4GwUkWNKLrYzu6yqrAHABElp
X-Google-Smtp-Source: AGHT+IFv7z0Bc2zXOk2Obf9SkwXGYsLCBJCyj6t6mRJpbTso1midHRp5idfoz9nXX1NkF7ITLFLXAQ==
X-Received: by 2002:a17:90b:3cc7:b0:311:cc4e:516f with SMTP id 98e67ed59e1d1-318c92ffe75mr23886879a91.31.1751377109926;
        Tue, 01 Jul 2025 06:38:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/11] oeqa/sstatetests: Fix NATIVELSBSTRING handling
Date: Tue,  1 Jul 2025 06:38:07 -0700
Message-ID: <cb50ca2faac6418ec8f3f3fefa162531177f7460.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219580

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The NATIVELSBSTRING variable changes value once a BuildStarted event occurs in a build
directory. This meant running some of the tests directly in a fresh build directory
would fail but they'd pass when run as a group of tests. This is clearly suboptimal.

Move the NATIVELSBSTRING handling to a location where the value is consistent
and a comment about the interesting behaviour of the variable so it hopefully doesn't
catch out others in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1c46fdb44fed18909d9ff4b43b4e445c5a22d33)
Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 487995acc3..7231115a6b 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -27,17 +27,15 @@ class SStateBase(OESelftestTestCase):
     def setUpLocal(self):
         super(SStateBase, self).setUpLocal()
         self.temp_sstate_location = None
-        needed_vars = ['SSTATE_DIR', 'NATIVELSBSTRING', 'TCLIBC', 'TUNE_ARCH',
+        needed_vars = ['SSTATE_DIR', 'TCLIBC', 'TUNE_ARCH',
                        'TOPDIR', 'TARGET_VENDOR', 'TARGET_OS']
         bb_vars = get_bb_vars(needed_vars)
         self.sstate_path = bb_vars['SSTATE_DIR']
-        self.hostdistro = bb_vars['NATIVELSBSTRING']
         self.tclibc = bb_vars['TCLIBC']
         self.tune_arch = bb_vars['TUNE_ARCH']
         self.topdir = bb_vars['TOPDIR']
         self.target_vendor = bb_vars['TARGET_VENDOR']
         self.target_os = bb_vars['TARGET_OS']
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
 
     def track_for_cleanup(self, path):
         if not keep_temp_files:
@@ -52,10 +50,7 @@ class SStateBase(OESelftestTestCase):
             config_temp_sstate = "SSTATE_DIR = \"%s\"" % temp_sstate_path
             self.append_config(config_temp_sstate)
             self.track_for_cleanup(temp_sstate_path)
-        bb_vars = get_bb_vars(['SSTATE_DIR', 'NATIVELSBSTRING'])
-        self.sstate_path = bb_vars['SSTATE_DIR']
-        self.hostdistro = bb_vars['NATIVELSBSTRING']
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
+        self.sstate_path = get_bb_var('SSTATE_DIR')
 
         if add_local_mirrors:
             config_set_sstate_if_not_set = 'SSTATE_MIRRORS ?= ""'
@@ -65,8 +60,16 @@ class SStateBase(OESelftestTestCase):
                 config_sstate_mirror = "SSTATE_MIRRORS += \"file://.* file:///%s/PATH\"" % local_mirror
                 self.append_config(config_sstate_mirror)
 
+    def set_hostdistro(self):
+        # This needs to be read after a BuildStarted event in case it gets changed by event
+        # handling in uninative.bbclass
+        self.hostdistro = get_bb_var('NATIVELSBSTRING')
+        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
+
     # Returns a list containing sstate files
     def search_sstate(self, filename_regex, distro_specific=True, distro_nonspecific=True):
+        self.set_hostdistro()
+
         result = []
         for root, dirs, files in os.walk(self.sstate_path):
             if distro_specific and re.search(r"%s/%s/[a-z0-9]{2}/[a-z0-9]{2}$" % (self.sstate_path, self.hostdistro), root):
@@ -153,6 +156,8 @@ class SStateBase(OESelftestTestCase):
 
         bitbake(['-ccleansstate'] + targets)
 
+        self.set_hostdistro()
+
         bitbake(targets)
         results = self.search_sstate('|'.join(map(str, [s + r'.*?\.tar.zst$' for s in targets])), distro_specific=False, distro_nonspecific=True)
         filtered_results = []
-- 
2.43.0


