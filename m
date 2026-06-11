Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99E7CD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:05:26 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41274.1781169342803579471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 02:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Cx9thXz6;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: adityags2004@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-138129a622dso587006c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781169342; x=1781774142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4Im+0RQohSSA7n9xIsBhsqtBcPvnfPs6h+oKtUdUdQ=;
        b=Cx9thXz6/IGkxyIcJBM/YSmssg43RMQ8rRWLPMaPacH/F2H3GZIlS1IU+ncDkMoJXw
         Rgz2sBRWPv3ORJeACtqrOr7tYPAIDaEZ8lRySipb7/9WKlIiodhm980ntUQTCg5IZb1t
         V1b7PzV0UiHiUMx+sserrOmhIYMx6NwSs0q2KijbjlUcKl/6N1pOdavkCxMO6lv13MIe
         CxxnQv5aAHVX7Iwap659jAlpEg8sVGXwjufgJ3KJhlzDfGawuCTHNX497opb5v3EwwDV
         wAvUxt8oW8bKdWsGp1MPYrxfaRKYqiikhXqp5exf7DqWgySOmopFdo4v6s+Nj9gxzU62
         DlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169342; x=1781774142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4Im+0RQohSSA7n9xIsBhsqtBcPvnfPs6h+oKtUdUdQ=;
        b=DPYe38kjT/ZflrEoI1xIHhpb2Ltu8y8eCh0n+sXBY5kgD56RwT7WZT55wi5+TBqHYS
         DYqFNqyUkrDR2gNHDOXBBFXliFOii55VUCm2ua2FS4tORi4GRD9VQTpkhnVzAujTS/YC
         aPVFjdOqN5JVb6J1HRdsz8CCmFqFevX2IS4hJ01aA3iUXE9oM7DJsLmYDfrVymp4gev4
         C4qwcF2web13jK2ji0LpiwOPZfFGj4KVivoDBHEmnIHIwjKV08MpIPsXbAStz5tespC7
         3xXEh2mgkSv9YeabuOclrEhooz6heFdH0cmHRoUB0+fi8GGJDNJS1fCdI0lgxT1WdRve
         l74Q==
X-Gm-Message-State: AOJu0YwFp/LwwFSDGzOouvCFcKouaOnsjL9kG6r5qGp+GR3ph3BbcwMY
	DqOXrehC4dtqUtlG3KfZ37wMv/DJsfqMRu0D00ep4WoWWUrYtGk0+ZfYcY9V4LIE
X-Gm-Gg: Acq92OHL6ahjMnUH0GYYdmVsD/2S9Iw/EzDv4+ZH9PHu2tPtbU5eK7AAhat9YSy1Rh7
	dZK4esA6UjbSatMuh6c9VWarIhTbTZEFcBs83OJZC0d60UO3Gqd77ngIn9tKFEsmiWmHTSebfGF
	BTdwRF0kkXfuEL+uJX+WbjH7jr0O2qns1ssNJ5BDqn2E8z8gKLkcKYq9xxaJjuD8SsoDjaCp5t3
	birNj6nbr8Vkzt5Onin02h2NuJFIFYkYG6thoZu9Ez6zxUCYDVOlOP7LNz4GuhFfRspxMQuBq2L
	fow5o2tc4tTytMly5ZwjM9d7UvQrpMutMXBU6HObjtiKWyEXoHuJY91psaI93eCkMr8oAMjOa3D
	57A8V7FjB031o/N8rro7LhiEd2zIvKqDFYA45IgJg+jK0spA08m9vnpFKxkLk2cNkEgaSJcTvrp
	RkQ9kgx7rGzvo6kwV9TMi1u3Y3dRNpqGxsogZNYS03XQLwkIp1GU5xzRefa+krZqW0CSp9wPOyH
	OczhpaN49x90lY9S1g=
X-Received: by 2002:a05:6a00:8d2:b0:835:4291:6975 with SMTP id d2e1a72fcca58-84336e0ce17mr2224731b3a.39.1781169038422;
        Thu, 11 Jun 2026 02:10:38 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([152.57.121.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843383197f2sm1723988b3a.54.2026.06.11.02.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:10:37 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: tgamblin@baylibre.com,
	Aditya GS <adityags2004@gmail.com>
Subject: [PATCH v3] patchtest: warn if Upstream-Status is after patch scissors
Date: Thu, 11 Jun 2026 14:39:57 +0530
Message-Id: <20260611090957.2606-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238448

[YOCTO #15940]

Detect cases where Upstream-Status is placed after the patch
scissors ("---") and emit a warning instead of failing.

Such placement may be intentional in some workflows to avoid
including the tag in upstream commits.

v3:
- Fix indentation issues from previous version
- Keep changes minimal and avoid unrelated formatting changes
- Retain intended warning behavior

Signed-off-by: Aditya GS <adityags2004@gmail.com>
---
 meta/lib/patchtest/tests/test_patch.py | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index 3b33b5a199..598a2234aa 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -67,13 +67,10 @@ class TestPatch(base.Base):
 
             if not header_has_upstream:
                 if body_has_upstream:
-                    self.fail(
-                        'Upstream-Status is present only after the patch scissors. '
-                        "It must be placed in the patch header before the scissors line.",
-                        data=[
-                            ("Standard format", self.standard_format),
-                            ("Valid status", self.valid_status),
-                        ],
+                    print(
+                        "WARNING: Upstream-Status is present only after the patch scissors. "
+                        "It may be ignored by git and lost during patch refresh. "
+                        "Consider placing it before the scissors line."
                     )
                 else:
                     self.fail(
@@ -92,15 +89,12 @@ class TestPatch(base.Base):
                     continue
 
                 if scissors_index is not None and idx > scissors_index:
-                    self.fail(
-                        'Upstream-Status must be placed in the patch header before the scissors line, '
-                        "but was found afterwards.",
-                        data=[
-                            ("Current", line.lstrip("+")),
-                            ("Standard format", self.standard_format),
-                            ("Valid status", self.valid_status),
-                        ],
+                    print(
+                        "WARNING: Upstream-Status found after patch scissors. "
+                        "It may be ignored by git and lost during patch refresh. "
+                        "Consider placing it before the scissors line."
                     )
+                    continue
 
                 if patchtest_patterns.inappropriate.searchString(line):
                     try:
-- 
2.34.1


