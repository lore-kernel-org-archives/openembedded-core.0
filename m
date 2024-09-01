Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A200BCD3426
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 00:51:25 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.7702.1725151882272556966
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 17:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=KIB5i1He;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6c331543ef0so17376676d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 17:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725151881; x=1725756681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OaUn/+1oGYSIWd78bUGLd+P3+bDAmXfDwLT6hyyhAdY=;
        b=KIB5i1HeCTBv3T5n9EWR4MJW9VDZ0wBcvA3Pf7Vlg0/1ggRMtCstvY1oaZVN8LzBAy
         XDVHCg+eOTO9jZcEOaS3D749zVRrYX/v2xW3OEymfT9NF77lJylpGVRA6gsp/HiDqYMx
         fumPJCchlZfKcB6OKWrvmF1FTjRIZDYlCv+2b6AbLvFQ49R2IliTlP8U9sR6sPxeCqtU
         xzd/1U+ovFqCE2T2Zqij29w+DPaLgxGY/3d7iAmxM0XIEZhy5KFnekW85q01UnSTBDwP
         BQqKrNM/p/QnLQujgunb4ymlcA7l8uF2yv80jBA7Ev7GlkmDXjOQuftEgTbJlizMlLhm
         wMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725151881; x=1725756681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OaUn/+1oGYSIWd78bUGLd+P3+bDAmXfDwLT6hyyhAdY=;
        b=nsZs+qa36k6zJYOxRj5hrSpvGvf34i2MgOK/WQ2zrPBAcaBRop6CAWkLbR75u/IaY5
         BXTAQ4AvBK20n34RobkgGmbdnq+2RG1JoVrTJt+dhCJ2vLdgvHiR0yFJ1S5ISS0tyK1H
         7baz2+zWmTFJ73DL0OPiKiW1jx48qPHTTobT8cMBXBiIWWkjy7+tIOWFumJ4P9+ePL5T
         mZFEuEZX0VVX79YBbwb//gybR6NvEWyZ1FZ55/VvnN8bE2dVfdO0HCst8pUUje+u2cOC
         4nuhNOKA/uRj/7ztoWG/OZazFb+vGPE1kxbhCRTRFezysl/yUZJpIbaKVM3OOPpImy5a
         mLYA==
X-Gm-Message-State: AOJu0Yw/qH/IBgRafM4dZQ7WUwuGyhH+/KQhwfyuTm0801E+IfgEwcjb
	ui7PsYNxbjL87Wo34ZDYiWQm4TE/JUf01OEEQBCqxrHAyzlf+Y75lEOMKfQ4h1FsWAV4tgVeqEE
	shrU=
X-Google-Smtp-Source: AGHT+IGg2WpaK2uLAsd7IWTCrjwJ13OxPyO4H65SwyQBs+HWJJ3hJOguumzlGzdYfBTMlgGGE1JZ+w==
X-Received: by 2002:a05:6214:460b:b0:6b5:def0:b60 with SMTP id 6a1803df08f44-6c3552e0fb6mr52387776d6.4.1725151880420;
        Sat, 31 Aug 2024 17:51:20 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c3567b43e9sm11899776d6.122.2024.08.31.17.51.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 17:51:20 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: test_non_auh_upgrade: improve parse logic
Date: Sat, 31 Aug 2024 20:51:19 -0400
Message-Id: <20240901005119.2736306-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 00:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203978

The AUH email address used for matching was outdated. Fix it so that it
correctly identifies emails using the new one.

Also make sure to only scan the commit message and not the body, since
it's possible (like in this patch) that the user may be editing actual
code that checks for AUH-related strings.

Fixes [YOCTO #15390].

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_mbox.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 0b623b7d17b..5571ba3a76b 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -22,7 +22,7 @@ def headlog():
 
 class TestMbox(base.Base):
 
-    auh_email = 'auh@auh.yoctoproject.org'
+    auh_email = 'auh@yoctoproject.org'
 
     invalids = [pyparsing.Regex("^Upgrade Helper.+"),
                 pyparsing.Regex(auh_email),
@@ -155,5 +155,5 @@ class TestMbox(base.Base):
 
     def test_non_auh_upgrade(self):
         for commit in self.commits:
-            if self.auh_email in commit.payload:
+            if self.auh_email in commit.commit_message:
                 self.fail('Invalid author %s. Resend the series with a valid patch author' % self.auh_email, commit=commit)
-- 
2.39.2


