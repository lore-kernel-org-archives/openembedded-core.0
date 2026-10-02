Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB12CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 01:08:52 +0000 (UTC)
Received: from mail-pj2-f35.google.com (mail-pj2-f35.google.com [74.125.227.163])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2082.1790903331524770947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 18:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gWhVZIM5;
 spf=pass (domain: gmail.com, ip: 74.125.227.163, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj2-f35.google.com with SMTP id d9443c01a7336-2dd77300825so38769425ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 18:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790903331; x=1791508131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e205aylaw/SblclSgVXOiotQ58PV+upMpCipMimDYK4=;
        b=gWhVZIM5dnwtR2AXGxBzhwXoxiXeHPjyNN5/4HE3bXp4fyQg65bn5kKhKwmKiuIvgL
         awZ/UiNR1QdP3f5JyZIQdtTl749OJfw9qFfNelFq0tf7oGFSHtlG5TEAw1HWn/psOUcj
         COabfP9vdkttqfvgdpLYQi8XTVpd8xd5pm9NESgq9hEWoSp1lQxtfM7pwtWME1rGbaei
         h+qjg2HB5JhHG8nsj2n4ciiI68pLVSsEp84z1rze3Annmc2e61iBzsgrYCMP1KIpW7VE
         i2VArTBP4f59hfWQCTe/a0dcxdSQatMNrgM2XAoN3iVQmguXiGFcDkD3r9y0v8PH1Kld
         FceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903331; x=1791508131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e205aylaw/SblclSgVXOiotQ58PV+upMpCipMimDYK4=;
        b=W5PzP4TA84WSw8IW+iz3S9nQFXCg2Mut1tcuydlh0Hb0Pzq2HHV7hTfcReBqVRjGXM
         pU+1gWMN9l9GzxVr349gdfmCpIz+yvAE89EyVpwptwEBSc8aO+ey3JiMXD8UKCnm1Kg1
         hfUDw+CDRZh0/TEkScdpOM4bhEF7MKr3jiVLi7G6asmw8s+9gmYoHByXoDiFXXEx6ZUS
         SNHq9/jc9QZ2Ss9eHKWQdadz1YntdKTOnj7L0IOAzYLpE6sKi2ixNcLtvhcdFEkMmusL
         YVhwaadhc+7wYrZYxiF5QqGyaKFRxBFVLOSV+PV019KtfESPa3OPc265ThjfLOKduhX5
         zrrQ==
X-Gm-Message-State: AFq9FYJY39TBEUVOy1Py0jhT7S8K1/t1geekp3dlYSuHS+1Ja/GkPs8E
	fRORzSwH4AGCT+8j28P9Mz+e7CwsZg37qeWvDO4uWc+BSxX4nS+1z8/nQAL75g/iOIoR3ZIS
X-Gm-Gg: AYBFou1L6ixbCioFHB7UTqKBuEORu+9GUQI0FazT4dI+pEB+82nRWTCT5qrZHwu3QXn
	n89EYw8Ldx8HW8tPakXOBApOO+Gv3c9pI046FAo+y8Ht79mgC3PY9nMKmdneU96pjrfec6Fk7dq
	mCwoK2jgHDKGxzBhdlJjJSw3Aka2e0IKNfVOuyHr5kKx2yPspU+A2WSOA49s2b2YDOTr3FpJYPk
	aTsyqsN7PZ54i4FC4pryd5O96tTb4WqNnj9wcOUbl6ZwNviPYIdZHTiZMFzQAo//RFcN2JbDiCs
	ONmw/VoaUN6Z8Ac+RxIlA66O+Utc+glrVQIZfrNvR24Ft/g8EY4BuxJ9vMDvnlRNgpxie49rvXQ
	rsFaloBqjRZ928PCQi/9m3teCNBa0VcEQrJ/CoJsjj1htqgSYcs0hiSBOJf9kl6DrEycauNthav
	nRwFwNdk6OyJ3zOTuOZCYmEBcbDJS85xbXZqR69zTPEoenmpIPjQO59Hjjm0ndL1Cj3tKrpw==
X-Received: by 2002:a17:902:ec92:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2e49b4e5739mr10059605ad.19.1790903330694;
        Thu, 01 Oct 2026 18:08:50 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6fe249sm2375965ad.61.2026.10.01.18.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:08:50 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Julien Stephan <jstephan@baylibre.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [wrynose][PATCH 1/2] devtool: standard: fix update-recipe/finish --initial-rev override
Date: Fri,  2 Oct 2026 01:08:48 +0000
Message-ID: <20261002010849.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 01:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247056

Passing --initial-rev to update-recipe or finish currently has no
effect: the recorded initial revision is skipped as intended, but the
override is never stored in its place. For recipes without submodules
this leaves no initial revision at all, and the command fails with an
error asking the user to pass --initial-rev.

Seed initial_revs with the override before parsing the bbappend so it
takes precedence again. Recorded values are still used for submodules
and when no override is given.

AI-Generated: Uses Claude (claude-fable-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62abb60b899e63ea6db5c745f4b1b6af0d4b40f1)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 scripts/lib/devtool/standard.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 42fb13872d..e2f5c28f8b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1200,6 +1200,10 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None, force_patch_refre
     commits = {}
     patches = []
     initial_revs = {}
+    if initial_rev:
+        # A user-specified override applies to the main repo ("."); the
+        # parse loop below leaves it in place of the recorded value
+        initial_revs["."] = initial_rev
     with open(recipe_path, 'r') as f:
         for line in f:
             pattern = r'^#\s.*\s(.*):\s([0-9a-fA-F]+)$'
-- 
2.43.0


