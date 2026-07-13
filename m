Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5974C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 06:04:57 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4755.1783922687652242946
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 23:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E+rmFIci;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1536247a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 23:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783922687; x=1784527487; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXb4/TLce6y+gktEHph1KHaAIVNJtgprt0x3/haZxys=;
        b=E+rmFIci/CC+UHLRQccSmo8mI6k0zsC78ILeADEdX3aibFDrkDxCvRgwC2Bw+zhfhM
         1yldMCYa1ytSi0r4/18VKo9n+RisYuRWqc8t8vXQylf7SFK5znfXRaiHjKjEngoSPMC2
         focEZcvRviDP9FShd44Vo/meS67yYfsJCvOMKMWfQNRYbUuSSKI/yhqxVfS+dqo2TyQJ
         6Nj+2TJlvBnOz3DcQnUoF/UqKPaeZUhFMFqgNwQrvBxJ5sYc05UBiupXZSht//sUqqxJ
         rWqt+x+2zQcNCTGU0CkFaNnF//sJ5rm3B7Iz8bY/Uuv2cqCawUObbeG9bQpIPY9MdP0R
         o/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922687; x=1784527487;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXb4/TLce6y+gktEHph1KHaAIVNJtgprt0x3/haZxys=;
        b=RN+SU81DbAwV/CRnyWOGysw9pBhoeqR17LYf8UIAu+lE5Yjx/BHNM5z6JspXlE8J3r
         dJunpWo9WAc9+z1DebGgZnjxNsRmWkGElgXpDAI1FVS58Jce4jgNdrd1Qf4Y7BI62++p
         o5kJ4+8jfAKIZhiqOESM/NHOaK/VTV2CK39CKJ1c/YO8ItVI0G6e+ZrB7z6VCD+ApOC9
         d1mhEPvBiJuHxe5G8vBxSBQXtFMxWGQGxWTZS4Hcurbs/gZowKtfRmYaiaMioZL9EBOT
         MjreYK7db1S19Pzl7WPbyUXjHZAnr5uu8XLLUGfjOugIb8ot+zQRBgYq7LEaq19MYlnq
         8sXg==
X-Gm-Message-State: AOJu0YxuOCuFjpWEmH1rk6K2gHQSxZUIiUjB9hAu/1GzrfZjZMOHeBE7
	aHYD+Y+0bniAYDnHf81RvxH8KbQe67oN7GxYmmGKrdEqCAqTzx3PpRNLBA4td9s+
X-Gm-Gg: AfdE7cmbIB9ZNkvP79BuYsMp/+5prdL7KLR9ANWgV5BG0OPhzfPbApMOEWzlgm1XnNn
	zkqy+UMRMxxxJsqbmfBBSMw8u/L89/SVKOCf2olzX8IlCZMk68QYXSALgvRDDauHBEP3vzs03vY
	Cqg3egqBl7zoTVDWaPjeqTrYzuImsrR2mx0EojVxeDzIaHp1vHBaX99a6o6n9W+pBSSrX2qEOx1
	1ICrOTMXvX/PscJWOdcWHYUaLniJ5xE2TQHLkUVBA6fV0X3FndRG0GnyH2Z/ZZqicerqQMG1m0D
	Fe303g0PQz1CF0rTDVMz/+zNtNUWy9Hn5lZpFXWAEApuhqJxIrKg5SJRkt4AO6UomA+0I4VaQfz
	B7+5TDrrZk+UPn66bVgX20N38YUZobjoof7BqR2Jxd294BO8IPpnDndpxGCsOWfkNp2HTEvhXp4
	dzs24QOFAGMcIs
X-Received: by 2002:a17:90b:4f8e:b0:37f:d262:1e0a with SMTP id 98e67ed59e1d1-38dc74cfe82mr7235380a91.12.1783922686878;
        Sun, 12 Jul 2026 23:04:46 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm93228515ad.18.2026.07.12.23.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:04:46 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 2/2] oeqa/selftest/devtool: add test for finishing a recipe using AUTOREV
Date: Mon, 13 Jul 2026 06:04:44 +0000
Message-ID: <20260713060444.7-3-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713060444.7-1-bbnpreetsingh@gmail.com>
References: <20260713060444.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 06:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240827

Add a test checking that a recipe created with devtool add --autorev
can be finished into a layer, that the finished recipe still uses
SRCREV = "${AUTOREV}", and that no spurious patch files are generated.

Before the previous commit, devtool finish failed on such recipes with:

    fatal: bad revision 'AUTOINC'

Test requested by Randy MacLeod in the bug report.

[YOCTO #16354]

AI-Generated: Uses Claude (claude-sonnet-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b2cd13e9a5..a3c7c293c5 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -469,6 +469,38 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
 
+    def test_devtool_add_git_autorev_finish(self):
+        # Test that a recipe created by devtool add --autorev can be finished
+        # into a layer; this used to fail with "fatal: bad revision 'AUTOINC'"
+        # because the unresolved AUTOREV placeholder was used as the git
+        # revision to export patches from [YOCTO #16354]
+        pn = 'dbus-wait'
+        url = 'git://git.yoctoproject.org/dbus-wait;protocol=https;branch=master'
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd("devtool add --autorev %s '%s'" % (pn, url))
+        recipefile = os.path.join(self.workspacedir, 'recipes', pn, '%s_git.bb' % pn)
+        self.assertExists(recipefile, 'Recipe not created by devtool add')
+        checkvars = {}
+        checkvars['SRCREV'] = '${AUTOREV}'
+        self._test_recipe_contents(recipefile, checkvars, [])
+        # Finish the recipe into a temporary layer
+        templayerdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(templayerdir)
+        self._create_temp_layer(templayerdir, False, 'selftestautorev')
+        result = runCmd('devtool finish %s %s' % (pn, templayerdir))
+        result = runCmd('devtool status')
+        self.assertNotIn(pn, result.output, 'Recipe should have been reset by finish but wasn\'t')
+        newrecipefiles = glob.glob(os.path.join(templayerdir, 'recipes-*', pn, '%s_git.bb' % pn))
+        self.assertEqual(len(newrecipefiles), 1, 'Recipe not moved into destination layer by devtool finish')
+        # The recipe should still use a floating revision and no patch
+        # files should have been created
+        checkvars = {}
+        checkvars['SRCREV'] = '${AUTOREV}'
+        self._test_recipe_contents(newrecipefiles[0], checkvars, [])
+        patchfiles = glob.glob(os.path.join(templayerdir, 'recipes-*', pn, '*', '*.patch'))
+        self.assertEqual(patchfiles, [], 'Unexpected patch files generated by devtool finish')
+
     def test_devtool_add_git_style1(self):
         version = 'v3.1.0'
         pn = 'mbedtls'
-- 
2.43.0


