Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DB0C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 14:03:21 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.9752.1741701795867283568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 07:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J751Aa7Q;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d43bb5727fso14937825ab.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741701794; x=1742306594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnilzOE1T8F3X0TRevqxMc4t4LLZA2gsWPHPyCIODNk=;
        b=J751Aa7Qu9EEG346wGyg4R8IKySkYx5xqQREizcvqa+nCOk6zPbOSQpl9Us4vUS4Jn
         0iJqhNXhgy7JzuRRJNrarL+yVi8nBrvTlwtmJGsPyrAbrvkMZRtMB1M3OhpbvdFnKslG
         Me6Th+Q7xf68TFdKopsK9bdIFaaUM6jBxJP8JagVUqg5JqDhEgAtRSAkgTgvAOcHwqlg
         crqRwnjUHFRDCYv0+wwTgGK4Ak7LVS2JUK+Z1cJ2xOINU7ZQKSGTiXQK4Yx9MGkHC0I/
         DgCtawxRauiBptkWfTU+qFSL/NRRxvjmXJ0DtFc7QNpFEFTzGBSTmQUxFROHRRfNeEw6
         jarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741701794; x=1742306594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnilzOE1T8F3X0TRevqxMc4t4LLZA2gsWPHPyCIODNk=;
        b=okuk7VlJghNJ3CS2yE0ZVJswZCpuivQpog7F0N0eEm3UM2LiAX53+N4CgA2YrzW5x+
         cqIMnDqFECkkEdqDKQMaxOmCXWjzZ+UqGMEtr/vPigonQPhp6XTqzTQhYXqCxjsKH4Iz
         8ZFZwVqaFMTPmHoMgrKC28cE46Pdy9bELsLyS51uumSr/moGgsJdBbKMteVMHGojx4s7
         du8o1aL2Lg7ytM0RlXBDZS9ynkAVGsa0CrZGz/q5Bd6biC1l+C1MmjSEvLZiIbgA4MJB
         LAlUzl0W4glxyZpJJQHPImxVqwGYHdNBdeIRzFVt9DG7VBbZmhtiR2yUzZwjsVIuWuQq
         kKyQ==
X-Gm-Message-State: AOJu0Ywm50ArxpNL5+281sRTf2OWnCFP2wiNdXT1mmBHzQGFzRoGMXF/
	qQ8gTv/QTAGEIxqELVrwl92/4Z8xhK84AhjBhmQn0RS97FEUdVthDvgaqw==
X-Gm-Gg: ASbGncs01JHMqWZ9ZuqB7G0MYQwx6wdL6T0rI7Z31Am3aNNNV8reEMIjAix4u0CGF5P
	Z9A7YyNUxBOzkPZWjB9SPVmX3iBqCUQjiYDsiLn8vJqdLnI5U0wEGrRsBdH5ooYiiSUv7ec2ugX
	RObbM/VYxHBup9mC18yCoOuV8j70934DHqlPkrGAxwt30Zqq+ikEfeJXI47off/sK8rCx+opNId
	SgDKIcyfsd0tO9WsAPLE1mrNjeSwxM7ARdRnwg2mI032ls5RY7yqVfQbjKJyPQ0ae21tccR1X2e
	Pyp3wJPiAct+sou4lzOQ2X8u02S9o/qaHlQ11vlMqVA=
X-Google-Smtp-Source: AGHT+IFNTFxvDFU6QGOtD7UJi32ULVvZuXiyU0TjErcdhVXy4/goF9tRABcHkxyhCZNrmkHjxZD5KA==
X-Received: by 2002:a05:6e02:32c1:b0:3ce:4b12:fa17 with SMTP id e9e14a558f8ab-3d4419af2a4mr215906685ab.19.1741701794386;
        Tue, 11 Mar 2025 07:03:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::70b8])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f233752cb3sm1223447173.90.2025.03.11.07.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 07:03:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] lib: Fix dependencies on SPDX code
Date: Tue, 11 Mar 2025 08:03:02 -0600
Message-ID: <20250311140302.2947498-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250307154313.1143215-1-JPEWhacker@gmail.com>
References: <20250307154313.1143215-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 14:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212570

The SPDX library code was being ignored from taskhash calculations due
to accidentally being omitted from BBIMPORTS. This meant that changes in
the code or dependent variables would not cause the task to rebuild
correctly.

In order to add spdx_common, convert the `Dep` object from a named tuple
to a frozen dataclass. These function more or less equivalently, but the
bitbake code parser cannot handle named tuples.

Finally, the vardepsexclude that used to be present on the recipe tasks
needs to be moved to the python code in order for the variables to be
correctly ignored. Several unused exclusions were removed

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 3 +--
 meta/lib/oe/__init__.py              | 2 +-
 meta/lib/oe/spdx_common.py           | 8 ++++++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 25f3aa5f433..b4a5156e709 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -134,7 +134,6 @@ python do_create_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_spdx(d)
 }
-do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS SPDX_BUILD_HOST"
 do_create_spdx[vardeps] += "\
     SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
     SPDX_PACKAGE_ADDITIONAL_PURPOSE \
@@ -170,7 +169,7 @@ python do_create_package_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_package_spdx(d)
 }
-do_create_package_spdx[vardepsexclude] += "OVERRIDES SPDX_MULTILIB_SSTATE_ARCHS"
+oe.spdx30_tasks.create_package_spdx[vardepsexclude] = "OVERRIDES"
 
 addtask do_create_package_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_package_spdx"
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


