Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAA3CC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32819.1792040626163016211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ir81ZQ+h;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so14137225e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040624; x=1792645424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uR1u05EWS7I9rdHzaA6wXCyJDm5rc8kgH9PsWSihIQA=;
        b=Ir81ZQ+hWrT+i4JQ/5U11DJjHWCJoKbIKScX61u070oACjHUjnMozxe0WNBSOq9/h7
         36UcMWFktocGkgxtJmyku5l/pO4H/AlglR9nCAY1AmoBgAWPDhgyU3LOp6Q0rYbRAZXj
         FcFQcWafLTXqYdMTPH/DPks4FZkIiN9uayatk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040624; x=1792645424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uR1u05EWS7I9rdHzaA6wXCyJDm5rc8kgH9PsWSihIQA=;
        b=jIC3HAAUcL5sVbJbeVJDIN4KjuH+NxKJQxOhBiRO610+hkCvOMKe9hnwRe8XRjYLFh
         6fqgDQJWE24sgIa9RYOKxOmibPgih4vdq/CwqrvWWqIVkUmDRXgSnsGPKftdmctAkJE4
         F3zlTqKig1acsk/PhQmYueWQxbFU4niNxOenYhwEZoA/xQSm5vN1cDUdYc/kCf5LwlHu
         ilqMM32MBDMQoirQBo23jkcbTMADneY49+XDikIcdAjhCB/Jq9pO8viZvzTPMWWMUxrq
         A2JseIPcjnA8EuxtVHv1H9KKes4x3EZneFoqCdauJaN4UNpxv04zCB9Q6HQqzv5m+GM7
         V0MQ==
X-Gm-Message-State: AFq9FYJd+B97akvAWoQQQIt9gWw7Z481O25Om+u+8lBUnBIdkqgAzpDH
	oOSQcn+k23VNKaWCRuYUYEkSyI35nVBE2pUHBbJTIwMk01qF1zdk8GrfhikSXxxU+NlIC9teBKd
	odre/VYA=
X-Gm-Gg: AYBFou13YBuz7feUjJMKzO/nTe0OXhZPzpyjJqx4VO0qe9xs99RTZh8spZ4LHLundKm
	aPVut4pV/4KMwVE2tnbWDk0S9HY+DkpFpYgkV0B8TreF+25a6z6a4w91H8HBEYB7LVUE9/wr/4c
	xWNl/WwP0/NfknmxB+tZTDiuyks+L27IddWw5NeoFdRA9uivyvYy4Cp61fG1MFuIeSS8qENQ/Mf
	F2g9Uhgn6okCsvfaZgIDtpJbAIMkMLxgxpoxFcY9lxImwTD/kIpFdOqfrhy9d+TmpYLxb1M9fRU
	cAHbZ627GuUXAtwHK4fVR0m8tMc9y8gktr8x/G/nZGX/WxDOkphRjfTcuUq8efnoeDWfu3yNzZP
	cfZUsjilmgujhZ/KnrSlRa1pN3Tm5iGeYfQFtgrakGjS4IOe820Dx5hxzELcK6r83dxBbsAJrO4
	Kf9mgvCRNFLaEMz97DwdveXmxTbcBFddyd7H1UV2x7TO49yjpZCJK6CswslgwJz6mT3OgO0Q+aB
	OAYp/7LdJloZPGoRB/Tn1/Rq27396CGhGK/0fiIzIAOZXKl0EteEPiIRqf1RLW5na/FZUIZnQ==
X-Received: by 2002:a05:600c:5251:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a18e4d5a01mr354837485e9.32.1792040622489;
        Wed, 14 Oct 2026 22:03:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/55] oeqa/selftest/devtool: cover update-recipe --initial-rev
Date: Thu, 15 Oct 2026 07:02:32 +0200
Message-ID: <c2c94a081d812c4712726cb5fc59b878af600cc0.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247807

From: Babanpreet Singh <bbnpreetsingh@gmail.com>

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 27 ++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 6af3e2417a3..cace9d26bd6 100644
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

