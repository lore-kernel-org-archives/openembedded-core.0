Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446C8C5516F
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 02:10:18 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16980.1785636617782174396
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 19:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TSi93I7b;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c0cea8883so15985701cf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 19:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785636617; x=1786241417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eA0D/NHq0eran3XhzlFG832gCbRpxTG//sPCBC1+yrQ=;
        b=TSi93I7bLI/TnV2S/ux3J0fDgyQKJBashSe44ud/qs8g0UEdsWsa3BC70L4sp1NsYk
         lnq1PblYkr4YnDdWi9zUWeoQvlMEW65PFKIXrEclpnzWutdXgb+gDxa5ejrYPagbKbnE
         J0VmgvEdyD30FhxZg5/xkceavvoGRCMJsvi9xxfQ4CzSvC2QkrPXGrU9auWMw+f2kaa6
         LcpIOkdKHz2Qhc7G5prBo5+nZLZR2Ixjsz4OxGKvXtREoQ7iStD8JwKlzOxsxqtIBJaH
         C83F8Kegfm0Vb+IQL77w7I2voQepCmdkCESz6xuXXu+b2VzlUWO+P3tIXpuYss992uBW
         yncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785636617; x=1786241417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eA0D/NHq0eran3XhzlFG832gCbRpxTG//sPCBC1+yrQ=;
        b=YlzdTsPoHHMc6vzE26QLKfTi8hhKjBNvGAdRVUjL9GzRBdCjEYbG7A7XLbPd1H6MB0
         dI5QlxQ0gz+jB1oqsD/EGJldLC4pybkYj7KMzSwDkm42CuzugF9jnIXW4Q0H64CeNgy2
         RuVM1vcSOfi7YmbTpQYwPcFpwkUbAM1tGFzxtqoY6GHUvi53Bh4+o3xgbGhAD2ZWt4FX
         XiRmnB87sLZ7l5I4lZfvo1Nd8h3vtoNKmT7ixfIJHea7xfFX9u16Qjfe3WBSMcjXjNVd
         jUJ59bPARStXeDhDHijuAQGBHHcyFL6Z5gJEM3s9XKIIHGn7rDZgrhTVy05w/8T3maVX
         JohA==
X-Gm-Message-State: AOJu0Yy3vMbzlM26uo31z1e+jzYQd62JYy1rPWnRvsHreE9+AVqCdNWX
	1QJE2Zh4hNrLY3BoLUlfZR3qeyHoTFaey9n3IeqadUHwJ0eJcVVDND3siXImYQ==
X-Gm-Gg: AR+sD1104goFJ1O32/wDO+nSl93iWzlDUV/t+vQI4TZltCQxlrjnqOkwYl30aR97epP
	XnwF+CKLzLiTBpfhW1Qz2++cKVuROoPbOTHyuxvJ+bOe45FubFCDJxrCY9FqeOd5p/B8SuD0ycK
	EUZTsm/fWtKvEwKZ41fn4uBbxXzm1ZZ5ceHatix3u4sgijsbz/OvKmTgNoVZjIL9hQZmbvxKWen
	B2x1RHYxEn5Gtp7cAPCTx07gwjph+lrl4QnfTJS6JEOqb7073LnmRr2fUyPAXhRSODP93Ex13SJ
	JtPv4CDUR+bbrZL+s+dQjb6Jdt0dsVqnE2oJDgjHytSN87WqQ3DfNbvT4BALCpVf7OttyedRVnE
	8htNb6NeN4bWGIkSyUHLbL9natrGXnV3F8LUmJP4RjY1dz/9VBfdum8GqgwQMbN4/IGCg4OzgNJ
	UWN7+buO4SeUYJ/nAT36HfkY+gBN4xT91CfFRFqVmTWNK3/wVNZjt9ia0+fR2V7Q3mQBgZe9XTf
	Ez4pVEEq84hElqtCDiuNQDFuPrnkPU=
X-Received: by 2002:a05:622a:1194:b0:528:38b1:b550 with SMTP id d75a77b69052e-52b4c58ecc9mr119229221cf.16.1785636616714;
        Sat, 01 Aug 2026 19:10:16 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a26basm44733566d6.12.2026.08.01.19.10.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:10:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 4/6] oeqa/selftest/wic: drop dead COREBASE/scripts wic lookup
Date: Sat,  1 Aug 2026 22:09:58 -0400
Message-ID: <20260802021000.2886095-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260802021000.2886095-1-twoerner@gmail.com>
References: <20260802021000.2886095-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 02:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242513

wic moved to a standalone repository and is no longer shipped in
scripts/, so that search path can never match. Look for wic only in the
wic-tools native sysroot.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- none

changes in v5:
- trimmed the commit message

changes in v4:
- new in v4
---
 meta/lib/oeqa/selftest/cases/wic.py | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index f9b893fc8581..8a39a4ddc603 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -100,18 +100,11 @@ class WicTestCase(OESelftestTestCase):
 
     def _get_wic_path(self):
         if WicTestCase.wic_bindir is None:
-            search_paths = [
-                os.path.join(self.td['COREBASE'], 'scripts'),
-                os.path.join(get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools'), 'usr', 'bin'),
-            ]
-
-            for bindir in search_paths:
-                if os.path.exists(os.path.join(bindir, 'wic')):
-                    WicTestCase.wic_bindir = bindir
-                    break
-
-            if WicTestCase.wic_bindir is None:
-                self.fail("Unable to find the wic binary in %s" % ', '.join(search_paths))
+            bindir = os.path.join(get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools'),
+                                  'usr', 'bin')
+            if not os.path.exists(os.path.join(bindir, 'wic')):
+                self.fail("Unable to find the wic binary in %s" % bindir)
+            WicTestCase.wic_bindir = bindir
 
         path_entries = []
         for path_group in (
-- 
2.50.0.173.g8b6f19ccfc3a


