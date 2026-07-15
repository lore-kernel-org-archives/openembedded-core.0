Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C212CC44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 22:13:18 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.530.1784153588758664350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 15:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ozOPLhpP;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ee6912d86dso20186616d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784153588; x=1784758388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UHWyP6C9RO1cR0Q39T8hPasFwyTHgJx/1qizImZrLF0=;
        b=ozOPLhpPClRm7tcRDyGUABB/D1WH7rzR3Iox2Ixkca+pdVhIIUGK+gdcAJt/n4EYUJ
         kQp+gHLy4pn9m9ouTDvc93tTYokoskJJBcuDHag2kkkChdErGOv/L6t2weQ0T9cr1yQf
         lj0zXJrnqv8uQxZ8UM8pg7YpD7kyPvCeJjy5b6RZUQRyXxp/BQCv7nkcS5PTxIssUXV5
         uHemOKE4qbL9oeguNnTFRiky58BPl/GTCaG9KEXq+mDjn3isTxkl+QJpb9gvXz0raom9
         ZBR8+DG/Ew6iLOhthe6DVMtyTHlYXc0nznH4UkWqiHwWKKS7ydzS1KmkvTWflL6Rs5mi
         VZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153588; x=1784758388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UHWyP6C9RO1cR0Q39T8hPasFwyTHgJx/1qizImZrLF0=;
        b=gv11y8nVQl/C4uxId1ZsIs+K9y2iDkBqNUhojDdBdridv4EbdOggyVeHvHa9ZBSoTd
         pdKBLim/eoocZpxx7/eaHMZrwtf4oHA58XnQyMpj/U1HyK21Ty3TANs5hvWBR3G1o7n5
         R7RD9aFyWM607kHu+n9Uf3mphjuNTofBmk9vtgcq6n1CO4jtsROuGp9rAlr1KPqnE7Pk
         RSMAc1V0Dq398nkQ27EwVTxqit6gg9w4+zF7Bf1A7Cy9BisRC3Qs8cnQ0+owoEyQacBL
         iA6nKB4h97j7XKHcAdWezMGiIMyOzhoOb3gapJgxuLStHURYTPoQKHFZ5o9Bjh9jcflN
         cUAQ==
X-Gm-Message-State: AOJu0YyzZOFYieh204KuOI5Yl1GIfoar97uDTXJPHnC0s1yexIg4b3DZ
	23hV0U90ELbmBAOYtkvYpSYjNnRMw6kI/zGkB3fGGWHD/PbG1R1pgYcH7NsChg==
X-Gm-Gg: AfdE7ckXsbFp6c/0lR07dO3Ppn1L+/r11G0iGv58mX99gsWU6FAS4YnaW8ojo+DHPpT
	HxvPhLY1aGSMlTmkLflYt82Lh/J9+Ug3qql40PEIKZA8aDiXtsTLGYkhIv0Wzz+40E7UoL2SnIV
	P7JRwzaKcjoXhTZZQY5P58GOG+cjElDQKXEzByOMQdbMIYk3SSakd8KdpN4zSffki76oHOuYwag
	4u0+5wxgzCUF6K5qSz2CyeZWkIq85okm5BU1QPZJsSm8E8u1nWgnNHnGeENKwRlUR32rU5Ha9tT
	Rg2C8XqlXBAZErYsM9t2vj7g8mhLOsUZdZuyk7sRkorHBMljibkbM1U1FooiT0O41cTfWqTnFTs
	yKFZSnPtIDET+TP0ZcTFHltCEI+4rxzsj4e2fTubu/Ga5EzXZLVwEX+uoWu13/1XTHNP94ySP4a
	xJBew/Y4RvpTRbhDBiRItxWFZPnE5dbM4Nz0PwKsmQtrMA
X-Received: by 2002:a05:6214:5e12:b0:8e9:f62b:8fa0 with SMTP id 6a1803df08f44-90401d69c74mr206382366d6.53.1784153587645;
        Wed, 15 Jul 2026 15:13:07 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e081dsm204822086d6.9.2026.07.15.15.13.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:13:06 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] oe/path: fix bare `false` NameError in __realpath's isdir guard
Date: Wed, 15 Jul 2026 18:12:49 -0400
Message-ID: <20260715221252.3369108-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715221252.3369108-1-twoerner@gmail.com>
References: <20260715221252.3369108-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 22:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241044

__realpath() wraps its os.path.isdir() probe in a bare except that
assigns `is_dir = false`. `false` is not a Python name, so when
os.path.isdir() does raise (for example on an ELOOP path), the handler
meant to absorb the error instead raises NameError and aborts the walk.

Use the builtin False so the guard degrades to "not a directory" as
intended.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oe/path.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index c4588ad0e65a..f0462d276196 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -234,7 +234,7 @@ def __realpath(file, root, loop_cnt, assume_dir):
     try:
         is_dir = os.path.isdir(file)
     except:
-        is_dir = false
+        is_dir = False
 
     return (file, is_dir)
 
-- 
2.50.0.173.g8b6f19ccfc3a


