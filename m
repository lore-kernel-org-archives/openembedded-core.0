Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0036C021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 13:49:40 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.12829.1739281772427303124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 05:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mytwvaRk;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: colinmca242@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-8553e7d9459so38732639f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 05:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739281771; x=1739886571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jjZwEN7vw+KRUTS2YjS8KO79QaOMrvnSq5t8mBvrLiY=;
        b=mytwvaRkQipxxGvNNoOwCDwzT05TAyJQIzSd4ZzzlnVxl4qiHiUMb0+mniGz86jONW
         L6vJC4P/ryk65qG8Om1LfDvVw4X1naVc/9EXe0ihlCWb05C/20X0w3uwuYINlNqJ3oUb
         mVLZAfmG4RBxf3PlyfDGQriX6+nETmm10hg4xfXqNKa/3ONfk4dkEzxRDPDqfXs42Hkp
         x4vrS0N2O4qVsZt6zKbuI0AYAt0/iFZ/EyiG3j1eBHX9bqkZiwSNnUDo46HTCAcchqrd
         MvsuP4Tr0AUi9aUR5VnaHV+GuE+tqUuYGgr3P32b/+mLZ5siAKmMP2qWF8McHSJkJsUR
         jpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739281771; x=1739886571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjZwEN7vw+KRUTS2YjS8KO79QaOMrvnSq5t8mBvrLiY=;
        b=lQ2k9wt0P8JWj+AcWEotwSeQOThPdAuZuuuOEa4CpTyV4MHmEAlrnUvP5OJcJfExdE
         njglf9YOrSPtGr/tTkHhSyhRDHO+y8hUsnHjHbZizB+pKPoZc9VTN6Nun1ndIGjzCdvC
         Yjsqqgcfd6Q6o0WJB5YJYW3cXQK7RhT+Q//J+cvG0t5yFwp+gZ6DvpcSCfrfYBqGG5FP
         tgphz++Swc/F8yLIMZJcAudJl0tkhQWC3zZsphQf0gcc4o6+X+AphQsrHtja8I/oO/xM
         lH1fjibgC9xzr8KcLisDw9YU3sbLeRrkh8bfgwDvm94gsYrgS2RI374DZf5vlYvnAEQ8
         dHWw==
X-Gm-Message-State: AOJu0YyHt5VO8I7P8DMtHwEtZwB9gWh0K7N9wgXSJJqdhimvjDd4r9rE
	i0jJstO7BUifFr4OEDkb98vAu0H2kOK/unPoJjgkeX/++ko0MzBhCeS5oQwz
X-Gm-Gg: ASbGncvv7DyIqwtiaUD9uEilsRyqD+w9JTVKEwxLXNMb/zepLH9AKn2iE5uc+njMIP2
	VzctWR6m+mvD4yabq3eqQRPlWBRhJ+efzHlEew2lYP0LwThk3PvTs7xcwQj9QBikqrDeWZEw5jg
	SHHgVBZ41mIgKUtgAMjyBvpRgnVrZtCVgWLHZDSsAA049oASJIQpwfjpFMp4ZK3Io22/YQiP1US
	LiZFwGaY316x80zSZm/qOF+wFKDcC5Btmh0ZgUx05cIRbPSeOWTuiKZp7eS10FYytSTE9KJCLva
	l0v1d1gASiagTGRgw9fGmAXy6VGHEQ==
X-Google-Smtp-Source: AGHT+IGJh21x75KAuQPgv4tziiUBkZkVADX64o8MgelAxRF6W7Z2n4EdP80xA3zp5gVnxctwpz23ng==
X-Received: by 2002:a05:6e02:1546:b0:3d0:10a6:99a3 with SMTP id e9e14a558f8ab-3d13dd4f5c5mr113173075ab.12.1739281770600;
        Tue, 11 Feb 2025 05:49:30 -0800 (PST)
Received: from monolith.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ecdc1c3ed7sm2306289173.87.2025.02.11.05.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 05:49:29 -0800 (PST)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/2] lib/packagedata.py: Add API to iterate over rprovides
Date: Tue, 11 Feb 2025 13:49:17 +0000
Message-Id: <20250211134918.95565-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 13:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211124

From: Joshua Watt <JPEWhacker@gmail.com>

Adds an API that makes it easier to iterate over the package data for a
all providers of a runtime dependency.

(From OE-Core rev: 68bdc219a4a819e83217f5b54c463624af8d3b9e)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/packagedata.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 212f048bc6..205800a407 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -108,3 +108,18 @@ def recipename(pkg, d):
     """Return the recipe name for the given binary package name."""
 
     return pkgmap(d).get(pkg)
+
+def foreach_runtime_provider_pkgdata(d, rdep, include_rdep=False):
+    pkgdata_dir = d.getVar("PKGDATA_DIR")
+    possibles = set()
+    try:
+        possibles |= set(os.listdir("%s/runtime-rprovides/%s/" % (pkgdata_dir, rdep)))
+    except OSError:
+        pass
+
+    if include_rdep:
+        possibles.add(rdep)
+
+    for p in sorted(list(possibles)):
+        rdep_data = read_subpkgdata(p, d)
+        yield p, rdep_data
-- 
2.34.1


