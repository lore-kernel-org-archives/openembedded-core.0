Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE6BD44D7D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 14:55:07 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.47674.1730904898415017107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 06:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mjg/zop3;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso53082961fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 06:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730904896; x=1731509696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIZps0vD79qKR/HmbPeHimV2P3lbkXFfh64VwMVkcrI=;
        b=Mjg/zop3zV+x22in9w5raxZdvmYr9AGiAlU6IMtwFbJ+S/J3uXom8mmXKYFxkz347z
         DYFNPhX74bSO9banttIRAtur3WyuyyoGL3Tn+JhOEzTer2OC06Ks6UROCGuc1pWUUuVS
         9XrIwaPJYcqmyEMT62gzivQ74snhJEFTKlFNMHBfH2PR7dH/KpShEygFYBfcoIPjcOCu
         vGEsOMBq2JwUuUWsFPoFmH88rE+gcfuuGWmJIt72MLk6R2evN3BLJcxL3PraVBI8N8g4
         bm+LSZa0tIOSM9Dj/l03vMr5kMGtLqAhpeDnvx2GlRERsB5Ils3fQJBXtnCZt6Mvr+Qq
         c9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730904896; x=1731509696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIZps0vD79qKR/HmbPeHimV2P3lbkXFfh64VwMVkcrI=;
        b=uQxfZuEbBESD8KgNHlmh/AlmoCv/k7ygCd7O7pg7sIPh1FIF6HJiCXN1mIfWwq2YII
         1ynjHIwFNSAh6Q68cWLY7XN4pNLmK7RYEKjRWn2BQJqCbLdCw5R4HRoNqkuD7XkNgrmj
         KB0PivkfM+d3kCj1CmgU08i6xws5JwuYufs8fQrLIKSuNH0ghAO4dSIdHiEJQfiMeJHp
         PLP9rRO4n9Y7PWUdFgBJrCPWcFVDUvOjwoZ3LnylbOB0n5taegCSkN6NN9innBUc8qzd
         QAITDeri0EALKfchRPqMJMuRVWHY3+fCMbrplbz81OJOQlBU7mgsXmOsRPWPz4zZZnfP
         EEfw==
X-Gm-Message-State: AOJu0YwVpYqDV5CBDtJMLx+YShIKKYDUnFZ/PS9YgS7ZUjSUgBmxnxF6
	rfNFJWUyTsx2emEaBjrcU2AGF3BhhdeKa5TzzmLwSg7ljf8Mg2JKCA0KNw==
X-Google-Smtp-Source: AGHT+IFToNdn5DwId2Juz+ht9eUZU1gaG5NIEeY9YruHRjyMhcwKhXvayUeNFr1cUcw++O0aYSGvpQ==
X-Received: by 2002:a2e:be88:0:b0:2fb:6465:3183 with SMTP id 38308e7fff4ca-2fd058fbc1fmr153400651fa.3.1730904895916;
        Wed, 06 Nov 2024 06:54:55 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6a9a410sm2840061a12.13.2024.11.06.06.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:54:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v2] patchreview: use check_upstream_status() from oe.qa
Date: Wed,  6 Nov 2024 15:54:49 +0100
Message-ID: <20241106145449.3516201-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 14:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206786

From: Martin Jansa <Martin.Jansa@gmail.com>

* the idea was to reuse the same function as I've noticed that the
  QA check which was added to insane.bbclass in:
  https://git.openembedded.org/openembedded-core/commit/?id=76a685bfcf927593eac67157762a53259089ea8a
  is in some cases more strcit than scripts/contrib/patchreview.py

  To be honest I wasn't aware of scripts/contrib/patchreview.py
  existence when I've asked about moving check_upstream_status()
  to oe.qa in order to write standalone script just like
  patchreview.py

* I've sent this long time ago:
  https://lists.openembedded.org/g/openembedded-core/message/177207
  but didn't like the sys.path.append to find oe.qa much or the
  duplicated path to .patch file in the output, then I've forgot about
  it until today in https://github.com/OE4T/meta-tegra/pull/1749
  where checklayer found one more issue, which I haven't noticed
  with patchreview.py before (because I've accidentally used a version
  without this change). It's not perfect, but at least it will be
  consistent with checklayer and patch-status QA check.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: just rebased to resolve conflicts from import cleanup

 scripts/contrib/patchreview.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index bceae06561..69ef14eb44 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -14,6 +14,10 @@ import pathlib
 import re
 import subprocess
 
+import sys
+sys.path.append(os.path.join(sys.path[0], '../../meta/lib'))
+import oe.qa
+
 # TODO
 # - option to just list all broken files
 # - test suite
@@ -78,12 +82,11 @@ def patchreview(patches):
         else:
             result.missing_sob = True
 
-
         # Find the Upstream-Status tag
         match = status_re.search(content)
         if match:
-            value = match.group(1)
-            if value != "Upstream-Status:":
+            value = oe.qa.check_upstream_status(patch)
+            if value:
                 result.malformed_upstream_status = value
 
             value = match.group(2).lower()
-- 
2.47.0


