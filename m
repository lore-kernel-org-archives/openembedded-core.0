Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97963C636D7
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 17:20:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.21358.1676481655283413036
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 09:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ayN2/Stz;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id o15so16598825wrc.9
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 09:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1GZk4ZoALb3Dz6/DciIX4hzJhNGJ4VeVucIwwJFV18=;
        b=ayN2/StzpZHRGFU6eMQ7osE1+U+mCc/7jk+Qaf2kdzeUoZCJ4wvOAKG2vsn2UqDHLW
         EA7Xqr4LZU4dpbC9YGDVZQzz5r8j566ZhBybTPLxxjXRbCzZXMRrC6G7Duqag3E8XVN8
         o4s6bj/TYkpwtvQ85XE/ycMC76LPZKk5m87bGfW1YfbjCD3W4Td/vlpwawBnuPoBBWgR
         rCMUVlS2aNaNLYLcrmT/vGneTOFQD9Q4iIdodR0t1ZVNNl/UtgTtpaIaAKlv6N7o3xGh
         0xrAqMNQzuAdzKkTplYT1t6Vd7uEMc4ecWghG3k/RZfhsV9V7eOpu0WPMKQAwnrpGmOh
         5pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1GZk4ZoALb3Dz6/DciIX4hzJhNGJ4VeVucIwwJFV18=;
        b=oDqvPgwDRY0nyPnAST/Io7S4Gdn9Taq8JD3JXYztP8+zBihVqBz3kS7T4hzgk3M74c
         B+t6VJ9gZOsvsd7/iaKCIqVc6EWzxJgbw1Agny1vHI5bGlRAzMO0SS3HaEBNKYEUqvUs
         yz3EXoILx5Qv8l9TpeQ6fRNL+MjbWZWaFdwf6lYb/u2SY3mFMYJUh56/7XHAWmi86y7v
         HTsivzoIWPP8lXTDd2WqVJNPPvM4RgfuiigHNoOKS13gnls41UI/qvX64dv+aEw6K/l4
         vbw/J323NR7ol6IsZgtwyOrHh4QkjUFgtlMw7dwYFe+rjVtlE/qhq3n6+hV0jDWjjvtA
         3p4w==
X-Gm-Message-State: AO0yUKX6AbkvXE4E+uU9bxdFI2aMQH+b+QaMySEUh9zXFxVEOhNKhJQa
	pgM45vUqoUY87H5Ei9ARNVNxI75jUeo=
X-Google-Smtp-Source: AK7set/ErVvZFuQTqs8XxKnLzmhVpjyf10kMex/hQh2EM/yrvaXbq88OTGAnyMfxmakcajlIP6CQdw==
X-Received: by 2002:adf:e4cc:0:b0:2c5:3ccf:e99a with SMTP id v12-20020adfe4cc000000b002c53ccfe99amr2131673wrm.6.1676481653733;
        Wed, 15 Feb 2023 09:20:53 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z13-20020adfe54d000000b002c567e3808bsm4194774wrm.40.2023.02.15.09.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 09:20:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 2/3] insane.bbclass: move Upstream-Status logic to oe.qa
Date: Wed, 15 Feb 2023 18:20:40 +0100
Message-Id: <20230215172041.636292-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215172041.636292-1-Martin.Jansa@gmail.com>
References: <20230215172041.636292-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 17:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177206

* to be used by standalone script scripts/contrib/patchreview.py
  as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-global/insane.bbclass | 19 +++----------------
 meta/lib/oe/qa.py                  | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 720b75c395..c8e4219389 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1358,22 +1358,9 @@ python do_qa_patch() {
             if not allpatches:
                 continue
 
-        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
-        strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
-        guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
-
-        with open(fullpath, encoding='utf-8', errors='ignore') as f:
-            file_content = f.read()
-            match_kinda = kinda_status_re.search(file_content)
-            match_strict = strict_status_re.search(file_content)
-
-            if not match_strict:
-                if match_kinda:
-                    msg = "Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0))
-                    oe.qa.handle_error(patchtype, msg, d)
-                else:
-                    msg = "Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines)
-                    oe.qa.handle_error(patchtype, msg, d)
+        msg = oe.qa.check_upstream_status(fullpath)
+        if msg:
+            oe.qa.handle_error(patchtype, msg, d)
 
     oe.qa.exit_if_errors(d)
 }
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index b4cbc50045..de980638c4 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -213,6 +213,23 @@ def exit_with_message_if_errors(message, d):
 def exit_if_errors(d):
     exit_with_message_if_errors("Fatal QA errors were found, failing task.", d)
 
+def check_upstream_status(fullpath):
+    import re
+    kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
+    strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
+    guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
+
+    with open(fullpath, encoding='utf-8', errors='ignore') as f:
+        file_content = f.read()
+        match_kinda = kinda_status_re.search(file_content)
+        match_strict = strict_status_re.search(file_content)
+
+        if not match_strict:
+            if match_kinda:
+                return "Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0))
+            else:
+                return "Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines)
+
 if __name__ == "__main__":
     import sys
 
-- 
2.39.2


