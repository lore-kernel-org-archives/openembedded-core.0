Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.4487.1591214865766153515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 13:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bvbw8PuZ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id c3so3679190wru.12
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 13:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pGWAFB4LvnHTpaGFq+RPiHyUfuU9O7P4iHUwbIO1BWc=;
        b=bvbw8PuZxIx6jxbbI739f19g+xv1orFUuWU3xe0nL+005cnLihkPsjIdGlXljpj0hH
         SBiv/uSCrPr1/2RBsZYPoWLouQKKy6694vjRKWMl8ojo9DNSSsfMXTNM0Vvo5Ss+FLUJ
         koV6RQvbm7Zg6Erqu/RMOD/guj+xq+sclBad0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pGWAFB4LvnHTpaGFq+RPiHyUfuU9O7P4iHUwbIO1BWc=;
        b=JZW0U4XK3OCKho6evJ8V3wXOGuYvNW7qZjg18BtmG2UW1lTy0zAKY/rGoIyIBWtGTd
         9PJmHZsOZh1x99P+/YeM/orS0+cCgQaGf9PDb9uvrF8PuUMq+EYpDxQBhICPXWVTAU5H
         YxZnVplZLCNhmvcoVnjw1GsZvrDDFR4CinMyl7KKGaGpmoQrrEEF8K71HtOQf9+USJMq
         JIlcSUownpaUgzIGZpdH2RyNPCYlBP3/s9kijn4Hzpf5NpPOi5LENjMV4R/e5NVZbjtM
         YdfgYdWz9T5YgGfbsC2kYw2p33Zul5wA257S93w37SJ0t5GPZ9PkmyfjO9lpw7kVRxr7
         Z4mw==
X-Gm-Message-State: AOAM530JrRVlJ98IdNBaBFQ0b9NsylUvG2v3fAfvO4vbP8g7Wy3uTpp7
	0YHeG9SeukdS92G6ihhWqLCJVNbQ8dW8uA==
X-Google-Smtp-Source: ABdhPJyilNnNxtqhtWW6v4hjNdJBxmj4751U5i002AaEAfZEeSCqUaUDiMbOI+7y0v51vNZH2YyW4g==
X-Received: by 2002:adf:b354:: with SMTP id k20mr1009920wrd.412.1591214864168;
        Wed, 03 Jun 2020 13:07:44 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id y19sm4186338wmi.6.2020.06.03.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 13:07:43 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 3/3] oe-selftest: Recursively patch test case paths
Date: Wed,  3 Jun 2020 21:07:38 +0100
Message-Id: <20200603200738.23534-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603200738.23534-1-pbarker@konsulko.com>
References: <20200603200738.23534-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that builddir is updated correctly to point to the new
selftest build directory when we're given a list of test suites instead
of a list of test cases.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/lib/oeqa/selftest/context.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 7589ca3c1f..494e9dbd1e 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -10,6 +10,7 @@ import glob
 import sys
 import importlib
 import subprocess
+import unittest
 from random import choice
 
 import oeqa
@@ -60,9 +61,9 @@ class OESelftestTestContext(OETestContext):
 
         os.chdir(newbuilddir)
 
-        for t in suite:
+        def patch_test(t):
             if not hasattr(t, "tc"):
-                continue
+                return
             cp = t.tc.config_paths
             for p in cp:
                 if selftestdir in cp[p] and newselftestdir not in cp[p]:
@@ -70,6 +71,15 @@ class OESelftestTestContext(OETestContext):
                 if builddir in cp[p] and newbuilddir not in cp[p]:
                     cp[p] = cp[p].replace(builddir, newbuilddir)
 
+        def patch_suite(s):
+            for x in s:
+                if isinstance(x, unittest.TestSuite):
+                    patch_suite(x)
+                else:
+                    patch_test(x)
+
+        patch_suite(suite)
+
         return (builddir, newbuilddir)
 
     def prepareSuite(self, suites, processes):
-- 
2.26.2

