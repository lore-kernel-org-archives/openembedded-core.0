Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD92C636EE
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 17:15:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.1945.1724865351541532313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 10:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NRkEbrLO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so61450705e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 10:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724865350; x=1725470150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBJ/xxUE1voVX2HUJ/U0T9Y8vT/z5qHAI5ESgDdmpWY=;
        b=NRkEbrLOa0YMr5/Iv3S6ocAyQlKICLbFNdhEvVU728GKHoVEc6y/OIH0u/dt95YaJd
         YZHlJm5p6OBx17gasxOtZ88bLlPC/achVNASohWUWKQag6ZZcPwCBELy0hygSqqsqwjf
         1x58Udzuofi2whae9DZ42R6oE6icCTaYjfED4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724865350; x=1725470150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBJ/xxUE1voVX2HUJ/U0T9Y8vT/z5qHAI5ESgDdmpWY=;
        b=xTG+wtba725rFD9X+45ubespE3ik9cCWrI7hmG5hm+GhTp2RCPCKSA2enb6ouNXbxe
         6PNNjgpgYac5QRtl0/ShNgP/qvCLmUkEeg4WpBeb/jxl70PFh2uV3tsWf0oDJ1RnliKJ
         wgbBW0yrMXHBhU/V/H6wNnQ3suAiJlGgT8TiSUX4SI6CY1Q70FG6rEd/SSTE8nFH1Tzz
         mvOZrKfNXhrWLRyP3fPYUHyqWKv+OdWhdTdsuQbANrRQhVgUVQOTJTwpp/lMZC7DyjNP
         MXW2zdcZU4e/AMTilDue06rX8xfDndfpVhPq0mLe580BhRmGdbBS8jqY3PJTj0k2ATKC
         9ywg==
X-Gm-Message-State: AOJu0Yw97/FS9UX3Q1NyHm7DjZGo1xi0VfxYGKmxqXJzR0So02T40PCC
	Dm1bSJ33kZFmMvBuVAET4umqH9C0lxIgmwX2t9vyu4NW0rErlvkSYvkzJvX++OQ9fV1u0obBGZE
	7
X-Google-Smtp-Source: AGHT+IHK9JFfKmXMYSGB1BSv/75nXLiIcyNZd8sH0l0lqZrMjjeGIqe0E4Fpu8HGyi9luRhGI1Xaqw==
X-Received: by 2002:a05:600c:3ba7:b0:426:622d:9e6b with SMTP id 5b1f17b1804b1-42bb032c949mr2368775e9.23.1724865349493;
        Wed, 28 Aug 2024 10:15:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:354e:532a:804e:264e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6425bf2sm26715935e9.46.2024.08.28.10.15.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 10:15:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] lib/oe: Use new visitorcode functionality for qa.handle_error()
Date: Wed, 28 Aug 2024 18:15:47 +0100
Message-ID: <20240828171548.1545246-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 17:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203886

Early functions like do_recipe_qa (which do_fetch depends upon) reference
oe.qa.handle_error() which in turn adds dependencies on ERROR_QA and
WARN_QA. This means that ERROR_QA:append = " nothing" will cause
literally everything to rebuild and break sstate reuse.

Take advantage of new bitbake functionality to add a custom visitorcode
function to handle_error which optimises the references into contains
expressions which means the ERROR_QA and WARN_QA references are optmised
to containing specific strings. This dramatically improves sstate reuse.

The qa module has to be imported first since other code in later modules
references it and bitbake can't handle the dependency ordering internally
without a lot of unwanted complexity.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/__init__.py |  6 ++++--
 meta/lib/oe/qa.py       | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 6eb536ad284..d7604812834 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -7,6 +7,8 @@
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
 
-BBIMPORTS = ["data", "path", "utils", "types", "package", "packagedata", \
+# Modules with vistorcode need to go first else anything depending on them won't be
+# processed correctly (e.g. qa)
+BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
-             "qa", "reproducible", "rust", "buildcfg", "go"]
+             "reproducible", "rust", "buildcfg", "go"]
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index f8ae3c743ff..2f928804447 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import ast
 import os, struct, mmap
 
 class NotELFFileError(Exception):
@@ -186,6 +187,20 @@ def write_error(type, error, d):
         with open(logfile, "a+") as f:
             f.write("%s: %s [%s]\n" % (p, error, type))
 
+def handle_error_visitorcode(name, args):
+    execs = set()
+    contains = {}
+    warn = None
+    if isinstance(args[0], ast.Constant) and isinstance(args[0].value, str):
+        for i in ["ERROR_QA", "WARN_QA"]:
+            if i not in contains:
+                contains[i] = set()
+        contains[i].add(args[0].value)
+    else:
+        warn = args[0]
+        execs.add(name)
+    return contains, execs, warn
+
 def handle_error(error_class, error_msg, d):
     if error_class in (d.getVar("ERROR_QA") or "").split():
         write_error(error_class, error_msg, d)
@@ -198,6 +213,7 @@ def handle_error(error_class, error_msg, d):
     else:
         bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
     return True
+handle_error.visitorcode = handle_error_visitorcode
 
 def add_message(messages, section, new_msg):
     if section not in messages:

