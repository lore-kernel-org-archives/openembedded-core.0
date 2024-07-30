Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F15FC52D1F
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 21:19:53 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.28299.1722374391509303232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 14:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mOGW42NQ;
 spf=pass (domain: baylibre.com, ip: 209.85.210.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70938328a0aso2163377a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 14:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722374390; x=1722979190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rgBopC3QYKgKWBW2KuhwHersnsxfYBmklhCf4HgBAM0=;
        b=mOGW42NQCQ/JrFFLbNfDJNpqIBAZG40Nb/OPAkWdi+xUIeZ+PILA/bAIZHqyh2x9KH
         C2GAsbauxfCioGpaJkSpSL+1k/Ft8wGPfrQPmW+sxpYjecG1e5YUikfz8h0rT5uAUNI+
         kunBRPOt6d0XYMKn6n2bMSN/KLqFkuRLC3nZcDVhiRLcYldqfYIGXT/QtkBr38DE2A2K
         hrfMIqU8MRp9RlVMVCoJnn7cbjIh/SCGOV520PzExyVp8ID+JzzFFe3kxvKSROWdW65B
         Lw5CsiJE+KXB/9qiJAuWIX9hPc5JPoMRiQq4y/Q8baso97YtJt4VtdEW3f0ZWBKGy5LO
         pIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722374390; x=1722979190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgBopC3QYKgKWBW2KuhwHersnsxfYBmklhCf4HgBAM0=;
        b=p+TvGh83rDrDWvMIxOSxjdCO+EpfwtqWzG2tl2Q6bykzhM+WgYwj6TE2C1/7rKX/nc
         a0Cjxm4UHUbvh5ETOM9sN/bpVIIfEU9D1e5KLNw1pLPoC6PTIxtUW2lNryo56+89iW8g
         jCt45NpIB2lSEVVrmW8Mau8//UvmjeDDOTvGYDvtBh1ZqquIYhi6cjZX59pyDtM4dNZ9
         v92S1pbqXCV2SGGEXMwi4GdYBFEG3jy+51VnbzAi7+HTZb+2Byu8jXrCO3DbJUEU5H67
         H8I9bASwKRlnwgkeDtjAtc8i7+JjH4oBtxCJhoyAHRl0N+utgGwhi0Y58fbAKpA0Pj4X
         oN3w==
X-Gm-Message-State: AOJu0YyHUm+yyRF2WG8O27E2QQFoUFH/5PvJOQkEXrAVTWd22Vo3XHqN
	GQ6sB8sk+ZiuXZ9leG1r65BNpOwFzr8dUgNdi61ifyydFEPrFhgttJJa3oaDBd7kxdtMa/klCCW
	h
X-Google-Smtp-Source: AGHT+IEzvxPlfgpFoBFfuqzuyDhMONlx1pW2D+0nkRGPi1DiegpVEJBanNuLSdgaPx4tbkIXPcPW0w==
X-Received: by 2002:a05:6830:3c81:b0:703:b0e9:d951 with SMTP id 46e09a7af769-70940c06941mr16261369a34.6.1722374388383;
        Tue, 30 Jul 2024 14:19:48 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73ef379sm671889985a.62.2024.07.30.14.19.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 14:19:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] patchtest/patch.py: remove cruft
Date: Tue, 30 Jul 2024 17:19:45 -0400
Message-Id: <20240730211946.93909-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 21:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202684

Remove some minor chunks of code in patch.py that serve no purpose.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/patch.py | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/meta/lib/patchtest/patch.py b/meta/lib/patchtest/patch.py
index baf6283873..90faf3eeb4 100644
--- a/meta/lib/patchtest/patch.py
+++ b/meta/lib/patchtest/patch.py
@@ -14,22 +14,12 @@ import utils
 logger = logging.getLogger('patchtest')
 
 class PatchTestPatch(object):
-    MERGE_STATUS_INVALID = 'INVALID'
-    MERGE_STATUS_NOT_MERGED = 'NOTMERGED'
-    MERGE_STATUS_MERGED_SUCCESSFULL = 'PASS'
-    MERGE_STATUS_MERGED_FAIL = 'FAIL'
-    MERGE_STATUS = (MERGE_STATUS_INVALID,
-                    MERGE_STATUS_NOT_MERGED,
-                    MERGE_STATUS_MERGED_SUCCESSFULL,
-                    MERGE_STATUS_MERGED_FAIL)
-
     def __init__(self, path, forcereload=False):
         self._path = path
         self._forcereload = forcereload
 
         self._contents = None
         self._branch = None
-        self._merge_status = PatchTestPatch.MERGE_STATUS_NOT_MERGED
 
     @property
     def contents(self):
@@ -51,12 +41,3 @@ class PatchTestPatch(object):
         if not self._branch:
             self._branch = utils.get_branch(self._path)
         return self._branch
-
-    def setmergestatus(self, status):
-        self._merge_status = status
-
-    def getmergestatus(self):
-        return self._merge_status
-
-    merge_status = property(getmergestatus, setmergestatus)
-
-- 
2.39.2


