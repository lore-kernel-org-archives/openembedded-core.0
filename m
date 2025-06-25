Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58640C7EE30
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 13:52:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.15937.1750859551616641477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 06:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OOl1lmbP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so5556729f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750859549; x=1751464349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt+7ffIF1VRL0MiU6KQsgh93xfcYicKUAbB2nyIk7V8=;
        b=OOl1lmbP12jIYnL7t1YoYxA6TMwCZLFaTHcgcVJmMnrB/QbRmdeA3Y7nkiAsYk938D
         HmZJJ9+dY+IkuBZ048WwcXj34PNXc4ewSEzh7oqeOqDEj9TTCdXzn0HzIcif6GYrmk6M
         sU5m1DOX2gl98BctSFRei30EPJyOZhjVdIc5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859549; x=1751464349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt+7ffIF1VRL0MiU6KQsgh93xfcYicKUAbB2nyIk7V8=;
        b=QHYi9BTMXoHFMa/q9ZevAlZprSEDO3dPRvwLtatceShCQeultAfYJnDi0LpEa1oBmN
         PKLHBYVztpH2eDi9lvv15AoFa18bapznaAOAffRHPKFPqLEb1uDfbbZgVbFqfDATOmIA
         t7LHcTqmcQlJH4MIQJ+EmYy+hYle/XVRb7j7UxLsY+RFQEJdvmzZeix93otW5pEeSuwT
         wdTD0ikfWKrJdqEB8sU9b7QXBjV0XFE77g0iEpptdKrFiE8hnIwbVK5XVJ3P44kUlh8g
         ZZn03954Vq3rCXjJUOvm39jg8CVj+rmhZLHqCBfiPfvp7Cv81SXGLisb0NKwcFOoZ8Sm
         rpuA==
X-Gm-Message-State: AOJu0YwwBPoRR6OHBxRPZ9tjBN1Hsfj/jjB8A7BKCiLeSiCYwEjgOFtP
	7OrlFR+P1kJkU9CMW3hjDzycQFSm/SKHd51uzEo7N/a9UqFxd6zsDMkJTT8d9xcvukU4xVyrJ24
	9qnRE
X-Gm-Gg: ASbGncsgZfHTGQBvX/DaeguxOOyV/ZOJ+NMGicNMTeGXP/2xeDN2XmrHwuPIhA7mMaB
	zv9ntElEeGCrLALS1ogzDF10DmPnKg0SINpcoFIgWpcHNr4GeL3eqfmlevqhjO+36bb/q3YJ+KW
	Ghh2M+gF+RkiZVbTCJTLNOYyKI7/m/i6lUm6ogsMnseag4iSbRhgc4qvCNAC03Vg4cVcRgh3KBz
	t7OmStVKyH1SgfrhG37Caqm1bn1kaXE3wAEEYj2HDc6+nsjZLOmgrBzjxDUZpJoE6XKcGwqsSmv
	9SDWLVs+IjAmsYiCzd6yy+YGXHkmRzVWdgE2NH3E4bviSRLER51/vcgw4P2gvaVMKPX++J3Yw2D
	7Dsv9mGIW1peORAg=
X-Google-Smtp-Source: AGHT+IElsk/+z1gf+GGbga82QvzbEjYwFblPdOuG6JoxBa6KgEymE+UtQYwPfycjhwNVNmqEpMylUg==
X-Received: by 2002:a05:6000:2502:b0:3a5:2848:2445 with SMTP id ffacd0b85a97d-3a6ed5f27e2mr2474653f8f.16.1750859549390;
        Wed, 25 Jun 2025 06:52:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810b140sm4657419f8f.80.2025.06.25.06.52.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:52:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/sstatetests: Fix NATIVELSBSTRING handling
Date: Wed, 25 Jun 2025 14:52:26 +0100
Message-ID: <20250625135227.3106042-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 13:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219320

The NATIVELSBSTRING variable changes value once a BuildStarted event occurs in a build
directory. This meant running some of the tests directly in a fresh build directory
would fail but they'd pass when run as a group of tests. This is clearly suboptimal.

Move the NATIVELSBSTRING handling to a location where the value is consistent
and a comment about the interesting behaviour of the variable so it hopefully doesn't
catch out others in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 487995acc3a..7231115a6b9 100644
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

