Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA30CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 16:17:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.12977.1759421826653010687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 09:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dongaf41;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso919892f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421825; x=1760026625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ca9sTkvSAgHtLMLNLuW1L0huPZEBYu9Nz05hQobjQSg=;
        b=Dongaf41TYrd/87doseMJ611nxvG+XOhfU2Jex89qAVV/1fpH0kSjuhWxqs44nFSh+
         QHjbVv5aBhdLsVS/mcZj79umdpwzOOhNsYoUVDCfCSZweJpKoypD+8/eLkg76jjvZk4q
         2P55UzI0SSytfAVvd/S0I6dk6gdhx1W2vPdlatFqREZlJxnq3uHHrwDXBohG5Com1vVc
         96w8ezKRFef+JwGCMuWMwBkI5LQFeGytPtKHnf7HNOFvq9b9wfzRGc3yHTHyy5w689qr
         Y2OXEmwxARBFtk4+BZ7Yj29CzIZt0307vUynpSfQ6S/9aaJ5/u00XFDD8vjSGc305/HA
         CU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421825; x=1760026625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ca9sTkvSAgHtLMLNLuW1L0huPZEBYu9Nz05hQobjQSg=;
        b=mhSSPxfqK7we0UYScL0OpPOzhjPwC1roely33IFHZOPkX3S7bzP3/uohJWt3+D+7H7
         afApyoCL91e2VuAjupHUDV2tvuR34XsUV5HDGZiJUD3HhIZLTCKFodab2MO1xu91eICr
         XOUcCnSRszJ1sWqgmzk0xlNB9Kme/11OM1bqTb98Uth6zfPO8lI0o5eVrjDxhhjNH3hx
         eJIVxw/OSRo2eoVOh+PWZbPnq5ji62GWpBrUqTHDfxICRVSZeHUWmeZedDFkxkHSe/lU
         77hdigu0JCF3fGpjrQQsdRUqFRC9Y0anNHQrgso6Ya+8XQv/7lTMJvP8gghxPe0/sl/0
         uXaQ==
X-Gm-Message-State: AOJu0YxeVadB3sxDz2u5rnmd7POxBr9+APbeC+0VKZC8Lz6YdTDXkxbY
	ew5XTpX2mNXNJVSBtptnahbsFMkTaOVK8oQUZQq6GIV1Yr63ptOeWYtco07gCw==
X-Gm-Gg: ASbGnctK1flEWb4XvY3+pLa1IIdqWOii3gZv4s6Lr3XM6Yl0m+RCpI/qAsR2W4tagBz
	zgddWfF0ail4HCsoneEgVacb3dR8d9/kAyS+r/RTmlYJvRMTUo9El2Z9D+hpRdsHoJguMC5pIUU
	PvG0LtkPYe64UL/unaPhq3WcEaobPPznL3cLIzkfcWm6nyvG8ltXbV8umT8ROTujqZVzGf4qbhg
	eJ66jNDlWw6O4AA7ipG9uBXLbB14SCwHIEXF2XIS+tGq3X4vDrywTbY+Pa5fzUvhsJgPVK7gWPA
	XmZbb5CGFodAaDc4j4F5CwWrj1pHgegKvG0m4wILzUbcjEifU1o04LcYsN8may1Uos9LymZcm6I
	HRNUQ8n6q1r2j32/5hzYbwhQFSv5zP5abZO0KOspFvT1q2K6L0PvOWRHbl1Cu1uve2HKZAlzlDK
	BqsPzuIRoDec3eT49OhNpf7jTdNpR2z251c6EuM7NUS/SdKME91dA6tRGD5ZuikKNmrqyHbkVve
	2KYAZ3vEw==
X-Google-Smtp-Source: AGHT+IFHNCgGUHnFK1AzKj+OUW6CJQb2ji6RxnqXZzmka4Ypo0etYNcXD4dTrqP9PAPJIHLmYoDvIg==
X-Received: by 2002:a05:6000:2284:b0:3ee:154e:504 with SMTP id ffacd0b85a97d-425577f1c60mr5540682f8f.19.1759421824737;
        Thu, 02 Oct 2025 09:17:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e693c33adsm39445145e9.18.2025.10.02.09.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 09:17:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] lib/bbconfigbuild/configfragments: disable the previous builtin fragment when enabling a new one
Date: Thu,  2 Oct 2025 18:16:58 +0200
Message-Id: <20251002161658.1356793-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 16:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224372

From: Alexander Kanavin <alex@linutronix.de>

There was a flaw in the logic that allowed multiple builtin fragments with
the same prefix to be enabled at the same time. The correct behaviour
is that only one of them should be enabled, and when enabling it
all previously enabled fragments should be removed.

The issues that this caused are further explained in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15987

[YOCTO #15987]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bbconfigbuild/configfragments.py |  7 ++++++-
 meta/lib/oeqa/selftest/cases/bblayers.py  | 15 +++++++++------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index fce3301bac9..34c6a3b4bcc 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -104,8 +104,11 @@ class ConfigFragmentsPlugin(LayerPlugin):
                   return True
         return False
 
+    def fragment_prefix(self, fragmentname):
+        return fragmentname.split("/",1)[0]
+
     def builtin_fragment_exists(self, fragmentname):
-        fragment_prefix = fragmentname.split("/",1)[0]
+        fragment_prefix = self.fragment_prefix(fragmentname)
         fragment_prefix_defs = set([f.split(':')[0] for f in self.tinfoil.config_data.getVar('OE_FRAGMENTS_BUILTIN').split()])
         return fragment_prefix in fragment_prefix_defs
 
@@ -128,6 +131,8 @@ class ConfigFragmentsPlugin(LayerPlugin):
                 if f in enabled_fragments:
                     print("Fragment {} already included in {}".format(f, args.confpath))
                 else:
+                    # first filter out all built-in fragments with the same prefix as the one that is being enabled
+                    enabled_fragments = [fragment for fragment in enabled_fragments if not(self.builtin_fragment_exists(fragment) and self.fragment_prefix(fragment) == self.fragment_prefix(f))]
                     enabled_fragments.append(f)
             return " ".join(enabled_fragments), None, 0, True
 
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index d82c5aaf376..7eb176aa04b 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -281,11 +281,11 @@ class BitbakeConfigBuild(OESelftestTestCase):
         2. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is set after setting
            the fragment.
         3. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is set after setting
-           the fragment with another value that overrides the first one.
-        4. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is set to the previous
-           value after removing the second assignment (from step 3).
+           the fragment with another value that replaces the first one.
+        4. Repeat steps 2 and 3 to verify that going back and forth between values
+           works.
         5. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is not set after
-           removing the original assignment.
+           removing the final assignment.
         """
         self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), None)
 
@@ -295,10 +295,13 @@ class BitbakeConfigBuild(OESelftestTestCase):
         runCmd('bitbake-config-build enable-fragment selftest-fragment/someothervalue')
         self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), 'someothervalue')
 
-        runCmd('bitbake-config-build disable-fragment selftest-fragment/someothervalue')
+        runCmd('bitbake-config-build enable-fragment selftest-fragment/somevalue')
         self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), 'somevalue')
 
-        runCmd('bitbake-config-build disable-fragment selftest-fragment/somevalue')
+        runCmd('bitbake-config-build enable-fragment selftest-fragment/someothervalue')
+        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), 'someothervalue')
+
+        runCmd('bitbake-config-build disable-fragment selftest-fragment/someothervalue')
         self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), None)
 
     def test_show_fragment(self):
-- 
2.39.5


