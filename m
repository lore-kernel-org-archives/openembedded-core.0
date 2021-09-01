Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web08.8310.1630503922876603629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fuzK0gSu;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 6so3759255oiy.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ivtAbL+Ey7J/a68aePNvwaI1fgHd/k2no0GlvZxezlw=;
        b=fuzK0gSuh9HgTKMwgabtUpmSi6FlDtF9Tw2WVDI0cQh6W/yVvJEw4vr3t2XUx8CmTb
         TvIhXhLahwnZ7T/9OoKZCxMjYDQvbmMWoyRD4c/hFagcMREUapMUj3XsULQuDRdkPAvi
         sO59OwDcHfFMLRwqYi5WU7Mx4vI3kOWVIFwTIHFV6WvL0YVYJK1+jbfuusZW/A5/3VHZ
         QpR9b2TRaDwqT1y7HxKNuDdfRrS0HT9uz1gsqWSfbBCrgxetiivzdh6dC89V2itg86Zc
         BzGZp+Y9p5E/FZsfAMTH6XV5Kc3DMRKzvgTAmJtCgD96jC2vWDnfhV5rN+BPodI9PZOB
         yiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ivtAbL+Ey7J/a68aePNvwaI1fgHd/k2no0GlvZxezlw=;
        b=ldbHFgxXNiRq6g3SKVA94jRqGvX5T2ecVg3C9OsP/NM53FCBTWh3+9rcBn+J9PlXMU
         /xe9Q+3qW7Dfeh6DF4jnlXAm8V+Owb/vpkrdt2j6xGKlGgTndioNw/0VTJy+wgiMZTLj
         7qrhFBIKedI/Ti6pvSXq5PVQ4+wO+9TxJY1sajhlHjOEBCxw5z5hUJBP5q8KnHdZJTPz
         eBP3F2qQ5uOCGy8HiDcUSYq/w+V3K+7vyeYnWNLcpkz6xRnTYTMTpWVWLfciTO0ArCOY
         ahEhXDX1Q5KHDYQ1NRL5CAepnXzY/4i3GyXmr2G0QM7QsfjD5aiG4xdFk6zTQZGDSkaX
         QrgA==
X-Gm-Message-State: AOAM530jTCPFe9MSVv8NweLphWogwBH+b9oBpDEiCwo8BYVBzMYAtN0x
	/Bkp76hKB8I3JHbz5NkQUljaezmCKnY=
X-Google-Smtp-Source: ABdhPJxI1Q0vkDIEehNJyEBz6fEfM5lDvPoPhjMq9uot4f34y29ksamZeZ7iQnCX9dttGNWUPb7ukA==
X-Received: by 2002:aca:1304:: with SMTP id e4mr7399009oii.89.1630503922021;
        Wed, 01 Sep 2021 06:45:22 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:21 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 04/31] classes/create-spdx: Add SHA1 to index file
Date: Wed,  1 Sep 2021 08:44:43 -0500
Message-Id: <20210901134510.29561-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass |  3 ++-
 meta/lib/oe/sbom.py              | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index e49d4d7e3c..5adad59065 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -627,7 +627,7 @@ python image_combine_spdx() {
                 visited_docs.add(path)
 
                 with path.open("rb") as f:
-                    doc = oe.spdx.SPDXDocument.from_json(f)
+                    doc, sha1 = oe.sbom.read_doc(f)
                     f.seek(0)
 
                     if doc.documentNamespace in visited_docs:
@@ -651,6 +651,7 @@ python image_combine_spdx() {
                     index["documents"].append({
                         "filename": info.name,
                         "documentNamespace": doc.documentNamespace,
+                        "sha1": sha1,
                     })
 
                 for ref in doc.externalDocumentRefs:
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index d40e5b792f..294feee10b 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -45,11 +45,21 @@ def write_doc(d, spdx_doc, subdir):
     return doc_sha1
 
 
-def read_doc(filename):
+def read_doc(fn):
     import hashlib
     import oe.spdx
-
-    with filename.open("rb") as f:
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
         sha1 = hashlib.sha1()
         while True:
             chunk = f.read(4096)
-- 
2.32.0

