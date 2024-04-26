Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A35C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 10:14:04 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10471.1714126438998485610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 03:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=lmijphln;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41b794510cdso6308895e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714126437; x=1714731237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dfrBmS4LBg+qBbtMjkrwBEuH0cXtLWJ8FA4TgDU04g=;
        b=lmijphlnZgK0u0xJzuJELz+I7yk0DWMpMpmamDfXl9gho0JJZJYKmWXP2WYWqinw23
         mMPxnWxugpW+GHk/ynCc8WWq5qdcdr1+KjqWvQxqmg/U6PXuiIcxyeqYTMIWasAeCAqk
         MisjpIl/o33W2oamGD0Ivwt99pu804c2QXG9HNwqfkwuFzcn18xcBRA8TCBBlDflOcCn
         72/dMVK6/gp8RpqzJ3vD8OLPQOzAQMZFzBijF9Camvvyz6ag6GhrsDqU0E/Dxpk1wxcN
         EBwxiEe8beV69WmG/1Gt56JhcZTcOhweH1mLxO+gEPzKe21W/h09L8CYXVCNGGl7vwf8
         Hj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126437; x=1714731237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dfrBmS4LBg+qBbtMjkrwBEuH0cXtLWJ8FA4TgDU04g=;
        b=ruEETe57Dp+/BLVTEqcQ/iYmyGQt2qckabaplpIQNveZo9BMITQYLF7XdLLAefX1fo
         o4+Q43XC4el2LVODHC4Nhvq0TrbDCIRaezBfUU9vdlD8KC5weofObqt4j69t02211roc
         vO+iNxjHOBDqaTcdez2M1eF56XaJL591mAwNs85mio/AMb7OvEbYDMebLgBj+8hINzgc
         /etFag1j51HHK//2Azpv+0y9YZfy/hlVVaUPqlM/rxK7fCmHIOqe2mXy5y+q88t7AvpZ
         qVk85ey5zzxHV1X/tl2eJ8FMhF3viGqFnvc2ijh7d4Zi8Cd6qbnFlEHqd63XFmA9dDn/
         5cVg==
X-Gm-Message-State: AOJu0YzTsCFXwTT5A5xSghFsem9+ODy3bNbOWAGV6e82uBbokeP92wnB
	orpowuzOiuuoAfNw8TL5clYDgwHVFi5LKl1jEibq5OPm0tH7Oval9VrFtUwpaGQXrPb6KvD1KWB
	+
X-Google-Smtp-Source: AGHT+IG3cfWYuYMU3hQ0loyBN8cJz73hQeQFcmEAwFCDpl3IJztSm8507skBW0YDS1cza5XFtbe1rQ==
X-Received: by 2002:a05:600c:8513:b0:416:bbb3:335f with SMTP id gw19-20020a05600c851300b00416bbb3335fmr1471619wmb.24.1714126437015;
        Fri, 26 Apr 2024 03:13:57 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id w17-20020a05600c475100b004162d06768bsm34254171wmo.21.2024.04.26.03.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:13:56 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Vincent Kriek <vincent@coelebs.dev>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 1/2] oeqa/selftest/devtool: fix _test_devtool_add_git_url
Date: Fri, 26 Apr 2024 12:13:37 +0200
Message-Id: <20240426101338.12673-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 10:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198719

This patch is a follow-up to the bug#15466.

As a reminder, the bug was about devtool’s submodule detection
checking for HEAD when a version is being passed.

As Vincent Kriek pointed out:
the --version that is being passed to devtool is only used for
setting the PV value in the recipe. To take into account the tag,
we add --srcrev to the command:
devtool add --srcrev v3.1.0 --version v3.1.0 mbedtls git://git@github.com/ARMmbed/mbedtls.git;protocol=https

Changes to _test_devtool_add_git_url have been made to take
into account the srcrev. srcrev will be passed as an optional
parameter because the test_devtool_add_git_style1
does not need the srcrev contrary to test_devtool_add_git_style2

Fixes [YOCTO #15466]

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reported-by: Alexandre Truong <alexandre.truong@smile.fr>
Suggested-by: Vincent Kriek <vincent@coelebs.dev>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 51949e3c93..5475c029b7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -286,10 +286,13 @@ class DevtoolTestCase(OESelftestTestCase):
         else:
             self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
 
-    def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri):
+    def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri, srcrev=None):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add --version %s %s %s' % (version, pn, git_url))
+        command = 'devtool add --version %s %s %s' % (version, pn, git_url)
+        if srcrev :
+            command += ' --srcrev %s' %srcrev
+        result = runCmd(command)
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Check the recipe name is correct
         recipefile = get_bb_var('FILE', pn)
@@ -479,11 +482,12 @@ class DevtoolAddTests(DevtoolBase):
 
     def test_devtool_add_git_style2(self):
         version = 'v3.1.0'
+        srcrev = 'v3.1.0'
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
         git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
         resulting_src_uri = "gitsm://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
-        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
+        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri, srcrev)
 
     def test_devtool_add_library(self):
         # Fetch source
-- 
2.34.1


