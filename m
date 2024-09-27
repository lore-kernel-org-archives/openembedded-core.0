Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51675CDD1C3
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:53:05 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.72634.1727452380094099629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 08:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ik6TS4JS;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5e1c49f9b9aso961402eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727452378; x=1728057178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SC3IBKw2/HElcbd3h80mLrnWXCPS+iRd0gpYsjLw6Y=;
        b=ik6TS4JSxlR7+CD2ymZjLzYveyMrp+v0gYQxV7wE83bRb9xZOcaoqmnd+WxvxXf9Dn
         33GdBHX8L0xDzZ06xwEFPHDQbuJu9MMlHkq8GAcz99uWIAHueBSBKFxoAniI72Kj2bhm
         tdMtdcdTiTAJMjCtznBPNF8vuT+M80oOjglnj3Gbgh9qcJGrUQGl51giNmDv18IwpoTi
         lipQbs5ZGLkbLw/+IJrr8gZvUudvUt7VWITc6MzJSvT7YlJZXPffJvTsyFbY6mK7qjFp
         VeJ2QAZUcbML4xOLhgTHSHdn4J0zjiY/irCtyoaZXmmU9DD/+i/8VGSGv2r7v8v/U5yA
         H3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727452378; x=1728057178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SC3IBKw2/HElcbd3h80mLrnWXCPS+iRd0gpYsjLw6Y=;
        b=nl6WdkJUZDsHleF3CPFkgDXecA5ahmwHOgVq9xRAkd1S58GOF0wGJ3F8GeeMfUTqk5
         F2MCBNbi5I/MBzxzqHJP79Stmh82Eis+rxALTz9P6j1Al4oTldDOblJNDzd/shxjscGA
         M3oYbuTiB50kZhHbmld3nzZoTsHSrPYMd33zssL80Eey+I07V6BMHyNYdMbB041kxVXv
         6uAEnhqlUsvr2PXX/XRJ2ZY/6ryYM4IhW+RpEcXoNtYxzh/ltxtkEqSVV05gq1VQvbA/
         bfTd2KWxsyBCeoUUdID17YK5TmjmOCLlTxMYQvZ7QWWDg0gj1HDAFmvABEcaVmZuwM46
         l5Cg==
X-Gm-Message-State: AOJu0YzapeEQYtLQaZJZ1+fAyWOOGeR9/i5vJ6Dap8pSPbcqHbN6kSNc
	4JwoopULNC6S9V3do4FIezjdwnWmjIQw2z7GFfXmSRRc8qntzr/XEKUtMg==
X-Google-Smtp-Source: AGHT+IEuo14aNAwpyiT9HaiVHkjVDmM1D9oNq/hNYuslPp/JFrPvkBcE5MpEvfEdrYjwca824zILSg==
X-Received: by 2002:a05:6870:9123:b0:260:eb3a:1b2 with SMTP id 586e51a60fabf-287109f601fmr3071981fac.7.1727452378693;
        Fri, 27 Sep 2024 08:52:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::8a23])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2870f778f1bsm698589fac.1.2024.09.27.08.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 08:52:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/4] spdx 3.0: Map gitsm URI to git
Date: Fri, 27 Sep 2024 09:51:55 -0600
Message-ID: <20240927155247.1012846-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240927155247.1012846-1-JPEWhacker@gmail.com>
References: <20240927155247.1012846-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 15:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205032

"gitsm" is not a recognized URI protocol (outside of bitbake), so map it
to "git" when writing. This should be OK since we report all of the
submodule source code (if enabled), and it's still possible for 3rd
party analyzers to determine that submodules are in use by looking at
.gitmodules.

The code to do the mapping is moved to a common location so it covers
SPDX 2.2 also

[YOCTO #15582]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 11 +----------
 meta/lib/oe/spdx30_tasks.py          | 13 +++----------
 meta/lib/oe/spdx_common.py           | 20 +++++++++++++++++++-
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 795ba1a8826..cd1d6819bf7 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -354,15 +354,6 @@ def add_download_packages(d, doc, recipe):
             if f.type == "file":
                 continue
 
-            uri = f.type
-            proto = getattr(f, "proto", None)
-            if proto is not None:
-                uri = uri + "+" + proto
-            uri = uri + "://" + f.host + f.path
-
-            if f.method.supports_srcrev():
-                uri = uri + "@" + f.revisions[name]
-
             if f.method.supports_checksum(f):
                 for checksum_id in CHECKSUM_LIST:
                     if checksum_id.upper() not in oe.spdx.SPDXPackage.ALLOWED_CHECKSUMS:
@@ -377,7 +368,7 @@ def add_download_packages(d, doc, recipe):
                     c.checksumValue = expected_checksum
                     package.checksums.append(c)
 
-            package.downloadLocation = uri
+            package.downloadLocation = oe.spdx_common.fetch_data_to_uri(f, name)
             doc.packages.append(package)
             doc.add_relationship(doc, "DESCRIBES", package)
             # In the future, we might be able to do more fancy dependencies,
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 70d1bc7e8ae..1ae13b4af82 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -379,22 +379,15 @@ def add_download_files(d, objset):
                     inputs.add(file)
 
             else:
-                uri = fd.type
-                proto = getattr(fd, "proto", None)
-                if proto is not None:
-                    uri = uri + "+" + proto
-                uri = uri + "://" + fd.host + fd.path
-
-                if fd.method.supports_srcrev():
-                    uri = uri + "@" + fd.revisions[name]
-
                 dl = objset.add(
                     oe.spdx30.software_Package(
                         _id=objset.new_spdxid("source", str(download_idx + 1)),
                         creationInfo=objset.doc.creationInfo,
                         name=file_name,
                         software_primaryPurpose=primary_purpose,
-                        software_downloadLocation=uri,
+                        software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
+                            fd, name
+                        ),
                     )
                 )
 
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index dfe90f96cf9..1ea55419aeb 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -42,7 +42,6 @@ def is_work_shared_spdx(d):
 
 
 def load_spdx_license_data(d):
-
     with open(d.getVar("SPDX_LICENSES"), "r") as f:
         data = json.load(f)
         # Transform the license array to a dictionary
@@ -225,3 +224,22 @@ def get_patched_src(d):
             bb.utils.mkdirhier(spdx_workdir)
     finally:
         d.setVar("WORKDIR", workdir)
+
+
+def fetch_data_to_uri(fd, name):
+    """
+    Translates a bitbake FetchData to a string URI
+    """
+    uri = fd.type
+    # Map gitsm to git, since gitsm:// is not a valid URI protocol
+    if uri == "gitsm":
+        uri = "git"
+    proto = getattr(fd, "proto", None)
+    if proto is not None:
+        uri = uri + "+" + proto
+    uri = uri + "://" + fd.host + fd.path
+
+    if fd.method.supports_srcrev():
+        uri = uri + "@" + fd.revisions[name]
+
+    return uri
-- 
2.46.0


