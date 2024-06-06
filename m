Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09182C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 14:06:33 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.15392.1717682789051000088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 07:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=msn+echK;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7eb0116faf8so28483339f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717682787; x=1718287587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBGCFefJYrzHwbZwdoU3smbeRn37Ywr/NYfTupVi4Ig=;
        b=msn+echK/xQQbqjkog28wQWR4o4baHY8o2ttdQl5HO2arfpzyJaZpLqr7dUDlMWZ+d
         BUv4z6PcHMr1gMUBxhBY422y9O3gCOQhEgwS6glaW1RH1kf1WxkUiigWgimYpbyegL9g
         UTTOSaWTv2Kv2DFiazcVjKiRvVVv+FFwKjJmmtw+KaGr/ZtJaCYhJXfBh/bQItxUyZPB
         h6pgAqB0xhdyop369BxhHZHopN2dUDoaMWR0PR2SP4tLtje77oe5uzZ4Cvn3XWFTffy7
         nw+SYmLreI15KxDReovQo6c53pJN7S+YbKBqaj5btwCS/SnbBClGAG2oAwHUL/kkmOlL
         40PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717682787; x=1718287587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBGCFefJYrzHwbZwdoU3smbeRn37Ywr/NYfTupVi4Ig=;
        b=mKQBl1TGZK7JYpCtQSDH6G3k9WRrcpvwcwtAzkibBPE2JV+sgtihcjZ7T7N3WcBoPb
         K7IYJ9/DddE73Bvp3Niq96qLzwuJqV7Fg7420hXr0X/StQXvnq8zX90GS61L9t1z/yj9
         0VRvfLJ6Nz6PGZq8zIv2n1x1sx3lSvrLK5NpbspUF1Aqn1z4a/9ihl5uA8VX8tbu96VZ
         fQxwr444HUAtg6ZjDAJ0vcBnVsNx1nvtaHziN7GYsRmQnXaL2of3UgE0q2U1gF61Jf5A
         JWsa88hMe5jxb6vmzx1yU3wZYb8aeAArJo0PYSLpE/kpMKmfw4ZpVeC1RmZOri5X+94m
         YwGg==
X-Gm-Message-State: AOJu0Yzbvc+ffzHedKhq8jHhT6ldvmGoa5+vY8sjzghOSYrJyC/LjrbY
	bRB1VL64/rVtHYqUjDUu419UuvBelczyeWfvMU05L3na3faluggvUfuqGw==
X-Google-Smtp-Source: AGHT+IFRWEwdCNAK6mhg+E1P70XJ5xJlSZb65ni1Mo1Rf1LO8WVi8b/pmKT9/ieXf9GL/JjkzDj+TQ==
X-Received: by 2002:a05:6602:1582:b0:7eb:52f1:53d with SMTP id ca18e2360f4ac-7eb52f106a2mr136307339f.13.1717682787125;
        Thu, 06 Jun 2024 07:06:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::3969])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b7a2070f95sm346411173.0.2024.06.06.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:06:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC 1/2] utils: Add write_files_manifest helper
Date: Thu,  6 Jun 2024 08:03:03 -0600
Message-ID: <20240606140622.2494668-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240606140622.2494668-1-JPEWhacker@gmail.com>
References: <20240606140622.2494668-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 14:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200403

Adds a helper function to write out a JSON file with a manifest of
files

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/utils.py | 67 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 14a7d07ef01..5437e7a2d9f 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -8,6 +8,9 @@ import subprocess
 import multiprocessing
 import traceback
 import errno
+import json
+import hashlib
+import re
 
 def read_file(filename):
     try:
@@ -540,3 +543,67 @@ def touch(filename):
         # Handle read-only file systems gracefully
         if e.errno != errno.EROFS:
             raise e
+
+
+def write_file_manifest(path, outfile, *, include_hash=True, extract_lic=False, ignore_dirs=[]):
+    LIC_REGEX = re.compile(rb'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
+
+    manifest = {
+        "files": [],
+        "symlinks": [],
+        "dirs": [],
+    }
+
+    for root, dirs, files in os.walk(path):
+        dirs[:] = [d for d in dirs if d not in ignore_dirs]
+
+        for fn in files:
+            p = os.path.join(root, fn)
+            stat = os.lstat(p)
+            if os.path.islink(p):
+                manifest["symlinks"].append({
+                    "path": os.path.relpath(p, path),
+                    "target": os.readlink(p),
+                    "mode": stat.st_mode,
+                })
+                continue
+
+            data = {
+                "path": os.path.relpath(p, path),
+                "size": stat.st_size,
+                "mode": stat.st_mode,
+            }
+
+            if include_hash or extract_lic:
+                h = hashlib.sha256()
+                with open(p, "rb") as f:
+                    if extract_lic:
+                        d = f.read(15000)
+                        h.update(d)
+
+                        licenses = re.findall(LIC_REGEX, d)
+                        if licenses:
+                            data["licenses"] = [lic.decode('ascii') for lic in licenses]
+
+                    if include_hash:
+                        while True:
+                            d = f.read(4096)
+                            if not d:
+                                break
+                            h.update(d)
+
+            if include_hash:
+                data["sha256"] = h.hexdigest()
+
+            manifest["files"].append(data)
+
+        for dn in dirs:
+            p = os.path.join(root, dn)
+            stat = os.lstat(p)
+            manifest["dirs"].append({
+                "path": os.path.relpath(p, path),
+                "mode": stat.st_mode,
+            })
+
+    with open(outfile, "w") as f:
+        json.dump(manifest, f)
-- 
2.43.2


