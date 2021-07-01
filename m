Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.9357.1625155227337441522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jul 2021 09:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iRbFyR3E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id j11-20020a05600c1c0bb02901e23d4c0977so7203275wms.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jul 2021 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8QOzhYSJO2Gi3zlHt6XTaggcKtTBkLZXr1fqdGQdKc=;
        b=iRbFyR3EYs/gZ9ZSmpNuGsV0ghadMT6I6TXig2nlvNBvhlyw0GUn8YdwQVsFbfWsgP
         dYJderSbozjh9qUw3pohvTkJhCYGDlmLxZ8qhqtcqr2Ww8znwTL5nAORXGiHK9gDQuxo
         GPMjUdsFSRYlpwW61BwTPvtklTTtHLpw0c9RA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F8QOzhYSJO2Gi3zlHt6XTaggcKtTBkLZXr1fqdGQdKc=;
        b=Fa5UKpYsleihnKlwEzR9iKpKTPZDZVFJiGBoe/KMZnhhXo5pxZH1/64yp3IjRdObr/
         +KjwHvxkms8UkAUwJkxxbkkdPF7u/Xd8EC/x+Flvhyp4mJjkfFWQagrgEBlIaWIzCCae
         ILnf6lW+scX/3sQ0Wp4iALdzmBh4RRpOay8/YOVPfFM+Z+cXBd+Y1eN59kLM1szHUux9
         Pna0yZpUVnJ9SxJNOajgfUxozwn7OzehVPSwKMws+xbkFPzWu6I5my8e2MNUria5T0wy
         kCqgKjX4KFTJuctPJh8KG1VF5sxWD+ODWtWjPW/o6zEmfbv/It8TSPosA96xwAz1Ytcy
         /t0A==
X-Gm-Message-State: AOAM530EwmH6egI1P2o4WoeqDuwQCzwlqiDzp10+0v8OPbi7jOvNTs3j
	nJ+v9AOsLM6kO+n8HPAqwmBWIiEnjBM32Q==
X-Google-Smtp-Source: ABdhPJw40Y4y3LNyCFI6DD+YwzdUCkLjtlkwq6WjMU6CfV0kkVxuRuiElmHgrG632WOHtJdoglHZlg==
X-Received: by 2002:a1c:4646:: with SMTP id t67mr458367wma.70.1625155225350;
        Thu, 01 Jul 2021 09:00:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a683:959f:4ccb:54d6])
        by smtp.gmail.com with ESMTPSA id g10sm406168wmh.33.2021.07.01.09.00.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 09:00:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/archiver: Allow tests to ignore empty directories
Date: Thu,  1 Jul 2021 17:00:24 +0100
Message-Id: <20210701160024.1989912-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we tweak sstate to not remove empty directories under conditions
where a race could occur, we see failures from:

"oe-selftest -r archiver.Archiver.test_archiver_filters_by_type archiver.Archiver.test_archiver_filters_by_type_and_name"

since an empty directory is left behind. Update the tests to ignore
empty directories.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index ddd08ecf847..0194ae9f69c 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -35,11 +35,11 @@ class Archiver(OESelftestTestCase):
         src_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
 
         # Check that include_recipe was included
-        included_present = len(glob.glob(src_path + '/%s-*' % include_recipe))
+        included_present = len(glob.glob(src_path + '/%s-*/*' % include_recipe))
         self.assertTrue(included_present, 'Recipe %s was not included.' % include_recipe)
 
         # Check that exclude_recipe was excluded
-        excluded_present = len(glob.glob(src_path + '/%s-*' % exclude_recipe))
+        excluded_present = len(glob.glob(src_path + '/%s-*/*' % exclude_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % exclude_recipe)
 
     def test_archiver_filters_by_type(self):
@@ -67,11 +67,11 @@ class Archiver(OESelftestTestCase):
         src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
 
         # Check that target_recipe was included
-        included_present = len(glob.glob(src_path_target + '/%s-*' % target_recipe))
+        included_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipe))
         self.assertTrue(included_present, 'Recipe %s was not included.' % target_recipe)
 
         # Check that native_recipe was excluded
-        excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipe))
+        excluded_present = len(glob.glob(src_path_native + '/%s-*/*' % native_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipe)
 
     def test_archiver_filters_by_type_and_name(self):
@@ -104,17 +104,17 @@ class Archiver(OESelftestTestCase):
         src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
 
         # Check that target_recipe[0] and native_recipes[1] were included
-        included_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[0]))
+        included_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipes[0]))
         self.assertTrue(included_present, 'Recipe %s was not included.' % target_recipes[0])
 
-        included_present = len(glob.glob(src_path_native + '/%s-*' % native_recipes[1]))
+        included_present = len(glob.glob(src_path_native + '/%s-*/*' % native_recipes[1]))
         self.assertTrue(included_present, 'Recipe %s was not included.' % native_recipes[1])
 
         # Check that native_recipes[0] and target_recipes[1] were excluded
-        excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipes[0]))
+        excluded_present = len(glob.glob(src_path_native + '/%s-*/*' % native_recipes[0]))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipes[0])
 
-        excluded_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[1]))
+        excluded_present = len(glob.glob(src_path_target + '/%s-*/*' % target_recipes[1]))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % target_recipes[1])
 
 
-- 
2.30.2

