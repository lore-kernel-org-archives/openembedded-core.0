Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CE8CD4F41
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:27 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19916.1778787746929474962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=wW+VZKv/;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-90fbf21d9d3so329733485a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787746; x=1779392546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0oz8UC0HsO76iOCQQOJfXC7w97F/7y97/18eSRQVyA=;
        b=wW+VZKv/9GVjLNYqefbgK8D8tjRz1W6RNE1cejirylLwpBRCSVFWw8yMqCsBJzLAEH
         Fr7Ta+AHgsigoW5Ch8a9bIErjUX+fJl/KgSpevbQHRqbQ4NbKuYIIygn7/1zMrdCDoKe
         lp682L1giQAHfGaSDjkzxgEHnx6N4l9Tw9Xzt9Hk/ORGqU2p5Q0YkQ/I2DgdzRxDLiL3
         OWSm2wvD8e/zZA7DTAaW5ljB3gKCOHe4rlfg3d7t96uCEGSTuC2ZQGql6cyFsmporS5s
         Cb/bpJoNNQhf6TVc/ZeOCbtwAKXWzB4+OjP7qWV7NAQu/DdThqlbnTotk1CnVnI/cwVs
         xVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787746; x=1779392546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0oz8UC0HsO76iOCQQOJfXC7w97F/7y97/18eSRQVyA=;
        b=f+5oNFD5tDd+Ca1826jANM0XRsBPu0UIppbY5oIVvTtVfGIUDzz+Bo9Ha9pakQMTf/
         vpNfbsw2glJ+zRg59HnERuqh6P7Kc4Jcjk/ir3ntObTx7n1wJ/7R1SohhRVp0GaTEe8b
         rRLlc/cvCV4nvA3va+XBAVCEX9D2JQ45DFJNyZrjhFnKx9A3K8mPxxqWDRMBu8pgKiri
         UgL1NoUitO4RXF+VusDWyei4+T4ZmO4u32dx5MP4pNwC3Q4jaMoNPF7EkdtC83Z7FzbH
         yJ2LChoZa4/HVh6Cx2bwUJSuRrTsP0pjNUv+znUYBLOf3aNckIK23RY3PlPH6VhjhhG6
         Mofg==
X-Gm-Message-State: AOJu0YwkaTV/AlGaIzlf8tic/SJRmc55Jd/YkznW4hpHNCluhIW3EkAI
	3nH15vLBTKqhGyID9eAfsIPEaJj7OJ3IUJ7t/0c/UXPjQW/8nLoQ7HS6dMVPkcYGM++7dgqoDku
	CgyBKp6Y=
X-Gm-Gg: Acq92OGZY3ovIZDj5Agv7LFbNiLHZ2CIS3/8QjqUenSgzCzglqHSJag20WCfXrTOjEH
	ZTkRDvRY/aPUJh50BcW5FKGbMNWTpHBo2E4cp3R74iqqsJ3iz5zhiQoUeRaNbvUZ9a9Cv+Y2E02
	c66TYNRFUrEyKr/49Ye5p+96rb0mKIsFXJHxt8JcSQU94GHbK22njDPR47jaQdSw87Se4Uo6N0A
	0Vnde+u66qcbnn2Qmpl/TitUbZr2qE+TEADpZhPZoogU8cQRFH0CAJuZjE2AirIxR3v1FglPKR/
	+cY6sIJUYVp3JcBXUtxpJTqdXw86kvMwpoaepspISIu1HDpv3hGXtQBy6PRqf6yNlNCWjIu36SL
	kZOWQc0G2Y0teb8zNtsFZkFXoxMy2oe7xbtFdalLMlUZpfV16SLd0a0WrtsJyWPMfHV+LOM+kS/
	wnMfwiUh7lk+Xhd/0bIj6Ob4FQeKYB4BNhZcOv
X-Received: by 2002:a05:620a:4481:b0:8cd:b6b7:1e6c with SMTP id af79cd13be357-911cdc4336emr172512785a.35.1778787745819;
        Thu, 14 May 2026 12:42:25 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c372117sm31517336d6.47.2026.05.14.12.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:24 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 08/11] patchtest: mbox.py: improve 'From' line matching
Date: Thu, 14 May 2026 15:42:04 -0400
Message-ID: <20260514194207.1958325-9-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237055

It's possible that a patch's commit message includes a line that begins
with 'From' to indicate a range, where a change's inspiration came from,
and so on. The current patchtest logic automatically splits on anything
that looks this way, which results in an error thrown due to missing
context in the diff list. Add a new regex pattern matching the typical
'From' line format in patch files so that patchtest splits on the
correct text.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/mbox.py               | 3 ++-
 meta/lib/patchtest/patchtest_patterns.py | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/mbox.py b/meta/lib/patchtest/mbox.py
index 2342fbda65..990ae02109 100644
--- a/meta/lib/patchtest/mbox.py
+++ b/meta/lib/patchtest/mbox.py
@@ -11,6 +11,7 @@
 #
 
 import email
+import patchtest_patterns
 import re
 
 # From: https://stackoverflow.com/questions/59681461/read-a-big-mbox-file-with-python
@@ -32,7 +33,7 @@ class MboxReader:
         lines = []
         while True:
             line = self.handle.readline()
-            if line == b'' or line.startswith(b'From '):
+            if line == b'' or patchtest_patterns.mbox_from.match(line):
                 yield email.message_from_bytes(b''.join(lines))
                 if line == b'':
                     break
diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/patchtest_patterns.py
index b3478d2f0f..e12e85c65b 100644
--- a/meta/lib/patchtest/patchtest_patterns.py
+++ b/meta/lib/patchtest/patchtest_patterns.py
@@ -61,6 +61,10 @@ mbox_cover_letter_regex = pyparsing.Regex(r'\[\S+\s+0+/\d+\]')
 mbox_shortlog_maxlength = 90
 # based on https://stackoverflow.com/questions/30281026/regex-parsing-github-usernames-javascript
 mbox_github_username = pyparsing.Regex(r'\B(?<!\${)@([a-z0-9](?:-(?=[a-z0-9])|[a-z0-9]){0,38}(?<=[a-z0-9]))')
+# Standard mbox From_ separator line: "From <addr> Www Mmm [D]D HH:MM:SS YYYY"
+mbox_from = re.compile(
+    rb'^From \S+ \w{3} \w{3} [ \d]\d \d{2}:\d{2}:\d{2} \d{4}'
+)
 
 # patch
 
-- 
2.54.0


