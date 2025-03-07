Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8B2C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 15:43:30 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.14176.1741362200942685153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 07:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vrz20hmg;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72a17886ac5so504996a34.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741362199; x=1741966999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EKcXgA1MINCOwDgCu+SyuF7Gt3xg7YdVY83be17kwzk=;
        b=Vrz20hmgg+h6mtyAIwTIipPEb6yCuDn+VXxdFosgxWnASYs8Gwppgae2hLHEz9EhMV
         ELNouEg/d5GUlW9uOU4U5U57pBlp53SdptI1Ua8JFRkEQir7DmpqTRKjN3F2OI/45IlB
         Bec9nllAsISMMeqzQ97vo2o64XCsomKB4OD3UuYj8CxzSONlEUpQw/PB4kAlYonTddz+
         hI5D37L0YXmn3DjDub6NIsAiTsiMmSblIM5qisDAHNOCFLzFNgieZLY4fxFiWFWLOBMy
         oprHJt4doWYu1rIy8/lTbI3LNdQQQMsHKzj3kYJGZkC8JSdYh0W4Dw4DHfgiO8Wsvh6b
         j1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741362199; x=1741966999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKcXgA1MINCOwDgCu+SyuF7Gt3xg7YdVY83be17kwzk=;
        b=XXEkP8UjcbdS1BuaCiLEvBJwxL4gylekom112MM5aQzoTRbZ++L+Gjto0bp+kyRH08
         oEUk/eDCmZ0EJ0HFX3D1QM0T4VEEqm45WL3FFlSImzo+uGxXmSK31aq5upr+Qm74u+xc
         +bKLidcgvsAbxfBdJj7FxSkEaBg2zAL3qFY2M3m33GWze8iZi8JpY/iBnE33L+SgYvON
         lFUg4/ytvrtDnez1HDWpVPJ+O3HPPr0VjQ4REvGpVvDSHSUCrDgUMN+eii0gOrvg4jSf
         QhlqfoPC76y7pdZIJubVnpub26Aa3Myo+IUivz0h/sAppSzILGWAvHXgFe/OR+hs4DcN
         Tljw==
X-Gm-Message-State: AOJu0YyskV1fivFySmz2AOCQy1Cq4zxC3MlFKQctziIA4YAD3sbI4Xjv
	zQ8IewkX+EufrY8tj2KF/MGj+XV+S6GD1MYzR424vIpgW2w8KaqfYPFQBg==
X-Gm-Gg: ASbGnctJDyuHMPomrGCU8BwzCfzxe7gtDnlZqz0MOuj+zCS6ECQsFRkMaa9hA24ksuJ
	g3h4OL+lvvO34FzjfMD8fzsILa84xXTb4NeOTwqjYakvxUgW/iWj3l+5i7CRX/vqlusDo1r5pE2
	OHFF3qiIjovz5MQSZY7Aoesa3Pu7Qh9Pp0y7YH3fs/EmbhTJnwwLhXTmMdpj8ZfMR+/Uom0hear
	f23b91i1NDBVl17v8dnSzFme1olRnlf06UMnZODBcaPNnSej8TI8LC7FWgngw8RRWhp5ZNjR5g8
	EI0rn8/JWTVIfDLRG40yyJ4pD5LlsVHQAmZ37D3SlpA=
X-Google-Smtp-Source: AGHT+IFPA3m/vl97Lcj4La0Tgv0fWfZEkbIkN9nB7yFRj6ndGsc7o442qUTF7YGD8TiccSlj1/dJVw==
X-Received: by 2002:a05:6830:710c:b0:72a:1625:ef11 with SMTP id 46e09a7af769-72a37c7d26fmr2091531a34.27.1741362199489;
        Fri, 07 Mar 2025 07:43:19 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::1fad])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72a2dae5785sm686483a34.17.2025.03.07.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:43:18 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: Fix dependencies on SPDX code
Date: Fri,  7 Mar 2025 08:43:13 -0700
Message-ID: <20250307154313.1143215-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 15:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212452

The SPDX library code was being ignored from taskhash calculations due
to accidentally being omitted from BBIMPORTS. This meant that changes in
the code or dependent variables would not cause the task to rebuild
correctly.

In order to add spdx_common, convert the `Dep` object from a named tuple
to a frozen dataclass. These function more or less equivalently, but the
bitbake code parser cannot handle named tuples.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/__init__.py    | 2 +-
 meta/lib/oe/spdx_common.py | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index d7604812834..3179a3f3d2c 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -11,4 +11,4 @@ __path__ = extend_path(__path__, __name__)
 # processed correctly (e.g. qa)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
-             "reproducible", "rust", "buildcfg", "go"]
+             "reproducible", "rust", "buildcfg", "go", "spdx30_tasks", "spdx_common"]
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 23a17271d6c..e1b26edaaf6 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -12,7 +12,7 @@ import re
 import shutil
 
 from pathlib import Path
-
+from dataclasses import dataclass
 
 LIC_REGEX = re.compile(
     rb"^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$",
@@ -77,7 +77,11 @@ def process_sources(d):
     return True
 
 
-Dep = collections.namedtuple("Dep", ["pn", "hashfn", "in_taskhash"])
+@dataclass(frozen=True)
+class Dep(object):
+    pn: str
+    hashfn: str
+    in_taskhash: bool
 
 
 def collect_direct_deps(d, dep_task):
-- 
2.47.1


