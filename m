Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82484CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 01:09:02 +0000 (UTC)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2089.1790903342151391016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 18:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T7tbXVnb;
 spf=pass (domain: gmail.com, ip: 74.125.227.171, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so2653055a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 18:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790903341; x=1791508141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=16jAeDJ4SKFJpGPl5J+4JU8J8YhrIDBUNC+Rz00Hn7U=;
        b=T7tbXVnb6TQppG+7RVRREQH6XIRB4M4Gm92cW9rKOeS4XuA2/TXmXIhvHhGkKKfprt
         6dzwsjmjzcgMcbCac7paYtOtRL5WtpsDBTVwjgk3pQeoCB9g0tv2wccex/CLeC/Zx6AL
         x55p06W4/bAjtWz20QZxyMnMvJFhvpZ5k9tXWZDKh/o9GLzyb7JatTio6DV980j5Rt1q
         GZpfwp74+DMwAuW3DSM/nihTa6zNb7RqNwE6CJnXkdQWAKYiOKcFd12p1n4JyxFz55Ik
         gxtxPHqe8hk8QfleFq71C5IpvRitzy7LmAoRYDP3NmXQ5ZYi/tLS5xs3FPMRpNpqo5sL
         Twiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903341; x=1791508141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=16jAeDJ4SKFJpGPl5J+4JU8J8YhrIDBUNC+Rz00Hn7U=;
        b=Op203i58oQO7TyPUpKlA5F7LmKDzG8qL+R3uM1XbhuzIxBt0IJ3XdWaqZOCR269KyO
         RQJhS4JUqt+wHRohpOdwSpdy/nSTMc/K8sUBPDiV3/9ZES5XCpqpCS+HdJ+iTDRwOFh9
         PsUhi99JgyN6x+A8BhWcSVjrYVsk8vq7rQRbYMPdYda0hkv2OrE50sSw1GofM7COdumO
         yRVkGdZqR0JACe93JUq4hi/hq/bjKgRvcPXzYy48Vr+H/4uG3qKoYgmx1a7ouBfqPZc8
         qDyHiZXz2udYBPAit2nBa8XemJqcerPcbSC+UTHkhVen4DXlb2QWu/bU8ZOt5aSJ+o2l
         CD1w==
X-Gm-Message-State: AFq9FYIzKRpfYz0kmecN+1Nugn3NtZypsw0bgSK0FOn03uhkqo4uczzu
	JdjHHgab6pqo/8BpeWhiH2DUHcQt3RcX/vgxJG4EC4WMUmQluVBug//TDPVLAwqdTmmbQ4AS
X-Gm-Gg: AYBFou31cMbKLmVzBsnu5NdkSVlnEqYO/p1UqEBGQxiX7hQODkWGH9FzZLhNRI1ElVE
	A+ggwrUBH1L4R6SPaUD0JgEUL7WZ6LRutl95hukMeyYiYx8C+ToiTqfzeDTGdkXkm2B6y5y5sit
	YP34pxOx+kCJsJMj3MYfmBcdjfqFmQAdwbK+JmZ28dqZSySN7usKjjZ78LB4VrsPUmyu8h4oWf1
	6+Z88wBmyThRvC9qioJ6Q0q8Hd553bXc5C/7hI8siFEXiLyPUmqQDMnC2AnZ9bijcUAKL8c53oo
	tkCVTeCz2cqsp7RO1QVpKhX+ZA9FZ3ukBj4ieyujJtZbd2zwjBCzm+Gf4WYcARHZTBDszksKceh
	SRJd2k+JxmO3fPnOvZ6T+NIG6MB9mgGeLHizkSUhDdfNXxPfYjFfwt4f4vQZ2Yb1+XbkVChTy3K
	ASIal6ImeX/G0CGbcwu4cWIAkivahFefiisqTlEQzGJ1CPBrqNdWfAzLZ43sTqTFvA5ucTMQ==
X-Received: by 2002:a17:90b:4a92:b0:3a4:e635:a8b9 with SMTP id 98e67ed59e1d1-3a6ce7aaab7mr1092454a91.32.1790903341054;
        Thu, 01 Oct 2026 18:09:01 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcdac9f7sm431636a91.1.2026.10.01.18.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:09:00 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Julien Stephan <jstephan@baylibre.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [scarthgap][PATCH 2/2] oeqa/selftest/devtool: cover update-recipe --initial-rev
Date: Fri,  2 Oct 2026 01:08:59 +0000
Message-ID: <20261002010859.7-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002010859.7-1-bbnpreetsingh@gmail.com>
References: <20261002010859.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 01:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247059

The --initial-rev option had no selftest coverage. Extend
test_devtool_update_recipe to run update-recipe with --initial-rev
set to the recorded initial revision, which should match the default
output, and to a revision partway through the local commits, which
should export only the commits after it.

AI-Generated: Uses Claude (claude-fable-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 171af3b2915dd076c8d1b205ff75eac1ebd5a586)
[Adjusted for scarthgap: also takes the cleanup_cmd change to this test
from de635a9bc0 ("mdadm: fetch from git"), which the new steps rely on]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 27 ++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 6af3e2417a..cace9d26bd 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1186,13 +1186,38 @@ class DevtoolUpdateTests(DevtoolBase):
         result = runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
         result = runCmd('git add devtool-new-file', cwd=tempdir)
         result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; rm %s/*.patch; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        cleanup_cmd = 'cd %s; rm %s/*.patch; git add %s; git checkout %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile))
+        self.add_command_to_tearDown(cleanup_cmd)
         result = runCmd('devtool update-recipe %s' % testrecipe)
         result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
                            ('A ', '.*/0001-Change-the-README.patch$'),
                            ('A ', '.*/0002-Add-a-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        # Now try the same passing --initial-rev: the recorded initial
+        # revision must give the same result as not passing the option, and a
+        # later revision must export only the commits after it
+        result = runCmd('git rev-parse devtool-base', cwd=tempdir)
+        initial_rev = result.output.strip()
+        result = runCmd('devtool update-recipe --initial-rev %s %s' % (initial_rev, testrecipe))
+        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Change-the-README.patch$'),
+                           ('A ', '.*/0002-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        result = runCmd('git rev-parse HEAD~1', cwd=tempdir)
+        midpoint_rev = result.output.strip()
+        result = runCmd('devtool update-recipe --initial-rev %s %s' % (midpoint_rev, testrecipe))
+        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
 
     def test_devtool_update_recipe_git(self):
         # Check preconditions
-- 
2.43.0


