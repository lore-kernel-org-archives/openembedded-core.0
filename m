Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F7AC25B6F
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:51:25 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.197285.1698317483212584686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+ica3WG;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32d9552d765so558557f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698317481; x=1698922281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVMr8hHg5tuYOB312sAB163s4bCI/sSaj+bUXpFoTng=;
        b=A+ica3WGs+sXn5dYvCWoysWPEAcawICLrQWiz8ygT2TJlQMHwf1hh2wLjU55ecTWSQ
         h2p5B1h8a/YwvfbVgqSPohQ/PQmjLXWUoo+D3HrLnaP4t/JmnpJtLonjEYOnFMytwzrh
         rXO8jWii/5nYoTTzvfMu2z+NtlKbLga5LJqKfiX1fiSCdqM6iLQOOqJoN6HBdWPQDbpt
         AJo1UayYqufwzrYR+gNL/P278ObQPainbYu4kpI7QkGTeS3gVIPncno/pG/L9sDqjTZ1
         wu8f2iquw9XLTe7IkykOWxM7Hb3Cz3iqh+ReAy69RdspxsGbgHmETjwMCxtZc8pHvzaH
         wabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317481; x=1698922281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVMr8hHg5tuYOB312sAB163s4bCI/sSaj+bUXpFoTng=;
        b=fFonDckl/F5F77hN2FRFA65MiZX9fIPgJJeD0emG8eYHv8nTe5PErsCGCbsmFyKLS4
         FSWSddp9svA9RJvA1eDc65G8AXkz/TS0mgk33mr4Wm1Y0LrHzd5T4mCMyOfS52hFkDST
         hUHgDyU/QC7tA20RcScX63gGlit1YR1UXBpwhhwrlaC0PEoik0nATrqZ2r1ZHeDIWD9W
         Z3zRCg99XLIoieyv0xfLhv+8O5HGqq2wri4hVx+y4CMjwO7ckMux7XgKRcOJtOkwEr75
         J0Dr43WDGBi8RJmcvIz91ZAzzQ8i1bf1kl2WjShWOi3vEahz8kg5fJ5Sd7g1MDyPIJd0
         wZ0A==
X-Gm-Message-State: AOJu0Yyo7uXzxUjsSKkxvJGjLICqnt1ePWWSiRO9e9bjDg0w/tF1/yzE
	eKyprEP0SH3QgroEhxq3EoOF20lUZBbYxA==
X-Google-Smtp-Source: AGHT+IEsT5AvnWc1OpBwiCu3A5znp0OBIuxOOYeDNWmv6Yah5yuc/MBah7iw3z7PzqueNsv0rh6Dxg==
X-Received: by 2002:adf:cd0e:0:b0:32d:87df:6dea with SMTP id w14-20020adfcd0e000000b0032d87df6deamr14254992wrm.45.1698317481098;
        Thu, 26 Oct 2023 03:51:21 -0700 (PDT)
Received: from localhost.localdomain ([31.32.81.187])
        by smtp.gmail.com with ESMTPSA id f1-20020adff8c1000000b0032da75af3easm13936004wrq.80.2023.10.26.03.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:51:20 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [RFC][OE-core 5/7] oe/sbom: search into json
Date: Thu, 26 Oct 2023 12:48:45 +0200
Message-ID: <20231026105033.257971-6-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
References: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189716

From: Louis Rannou <louis.rannou@syslinbit.com>

Create a function that search into a json-ld instead of completely loading it.

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/lib/oe/sbom.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 28db9cf719..21333c0a84 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -119,3 +119,35 @@ def read_doc(fn):
         doc = oe.spdx.SPDXDocument.from_json(f)
 
     return (doc, sha1.hexdigest())
+
+
+def search_doc(fn, attr_types=None):
+    """
+    Look for all attributes in the given dictionary. Return the document
+    element, a dictionary of the required attributes and the sha1 of the file.
+    """
+    import hashlib
+    import oe.spdx3
+    import io
+    import contextlib
+
+    @contextlib.contextmanager
+    def get_file():
+        if isinstance(fn, io.IOBase):
+            yield fn
+        else:
+            with fn.open("rb") as f:
+                yield f
+
+    with get_file() as f:
+        sha1 = hashlib.sha1()
+        while True:
+            chunk = f.read(4096)
+            if not chunk:
+                break
+            sha1.update(chunk)
+
+        f.seek(0)
+        doc, attributes = oe.spdx3.SPDX3SpdxDocument.from_json(f, attr_types or [])
+
+    return (doc, attributes, sha1.hexdigest())
-- 
2.42.0


