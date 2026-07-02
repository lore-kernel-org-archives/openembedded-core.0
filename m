Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3F1C44501
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 15:22:28 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72289.1783005744459669988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 08:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=CKPZVkoX;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5cb052edso153215885a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783005743; x=1783610543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PGY9fiYj5E1V1ib9hEZOQELeHaxR2kg16b0f2Cujmc=;
        b=CKPZVkoXYP2rgMZ0GCxKpJlvAI5O37DA/3gBNaiDPrjBlWGcwkCGjNntyZfiOvYrHy
         igHAMQibkj82WG9KNAffkipgy8OQV/qtcPNPaLe6FQsXgvUKJFkEr5H+XcgEgUP0p5A8
         k9fMMcuHuRTlzoxi0249aCaW8pmEKvddIT72ZPdSLKjiOUGT/RnbMJVlMoBFMQWHKlSr
         z2Kqr+RE8L5jXp8SAALDINVNpq85RnOc+7GvQ1BMykvR7T7hW09CHxAqA173/M37oWPH
         FJS6SPTSH2WHRq4KWC0XjaNKVq8tlJlW1YcJmh0gaX2aJclYr/iO1u8jGSPbyeE5OlAQ
         f2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005743; x=1783610543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PGY9fiYj5E1V1ib9hEZOQELeHaxR2kg16b0f2Cujmc=;
        b=nsOdgkeFYMyBymrXno6NYihuqD1xzRuAIQaarCJhk19ZxAmGlRApeJ9E/XzHw1ukJg
         0+Mn4HBeO3tlUhDjFbsDdqh2vlV4SNdksiX7sHzdtUUAcBkxa6/yITGQpzZx5jD60yIG
         tti6ilKDydjnjiq6ubpNL1h1dbtBMYWEL4AZBwhG6Rvm5PXmD0Y8vcMfBO9Iq5GHrtQw
         FOeSOqA1k9oEYTFNYFKFxfDdqVXNK2aHNYaI8ZsC+1r0IS6x4+D0RIiImLwlO35MwTD9
         PX6xEO/JGwtg0enDiNlvweV5S+BpKX3hDZa+7O6I4As0uq4GE45T5KXVPO/ZcLRdNzas
         wgYA==
X-Gm-Message-State: AOJu0Yxt3y+s74jWp+DALnPjk2axFvyZIfhmC8ABEBih6F2hsvI3Opvk
	U5HiOFn0LnWc+/W916NMPmN0gEijVC7uYv8jJiQS0jHZkCI+Eddpq2LACqc7+WfKkafAldM/Fmp
	+vizYOAQj2Q==
X-Gm-Gg: AfdE7cmXHGYzuhoeSwGZXSU3+FzteBtOBFP2h8y3KOu/Yk3wPabBwzBwl1ZqYalKlfX
	xD5Wc5/XUUqAx96L6F9l3btiKCvWGgPucRxb+GfQL5+m+fJ09Nv4/ls/erryT8zTvnd0fbBOWyE
	Y8ZEQR4bf/gv7asKFtS6EkvpkH8G4i3E9dSO0PslGU8/BJpG7pIXOpy0yn/y8vjHE4V6Doe9anW
	j5i0F0Zhrc3yluknjGFdQ6f6B5NHSBoOQosLF2kHOwNP+zJ7e6Yru+l+pAZp1vmUMxJ8QX4uUlT
	QdYim0xGy6qU8990eexWCkW8r1qDXuwHAH7mOzlGMTqoDL6PLG1lhuOIOaI4B8iyBqeG7dexE9K
	uimXp8qhIVl2L5OZVLPfAHlQMOyjSUqiRlcu3tE7J9TYhilWZfHW/4/pTUfkwNphw9hMDSWgu3+
	3Q339l0x8Wv85YjGeO
X-Received: by 2002:a05:620a:458d:b0:92e:7317:8aee with SMTP id af79cd13be357-92e7afb17abmr728505885a.8.1783005743214;
        Thu, 02 Jul 2026 08:22:23 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801bbec0sm245243085a.45.2026.07.02.08.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:22:22 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 3/6] patchtest: tests: test_metadata.py: simplify SRC_URI collection, remove unneeded import
Date: Thu,  2 Jul 2026 11:22:10 -0400
Message-ID: <20260702152213.1439717-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702152213.1439717-1-tgamblin@baylibre.com>
References: <20260702152213.1439717-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 15:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240061

The pretest_src_uri_left_files() and test_src_uri_left_files() functions
both use the same logic to check for changes, so encapsulate that into a
function for easier re-use. Also remove a pyparsing import which isn't
needed, since it already gets pulled in through other patchtest modules.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 32 +++++++----------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 30da8dbe60..442e80973d 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -8,7 +8,6 @@ import base
 import collections
 import os
 import patchtest_patterns
-import pyparsing
 from patchtest_parser import PatchtestParser
 
 # Data store commonly used to share values between pre and post-merge tests
@@ -108,39 +107,28 @@ class TestMetadata(base.Metadata):
                             ],
                         )
 
-    def pretest_src_uri_left_files(self):
-        # these tests just make sense on patches that can be merged
-        if not PatchtestParser.repo.canbemerged():
-            self.skip("Patch cannot be merged")
-        if not self.modified:
-            self.skip('No modified recipes, skipping pretest')
-
-        # get the proper metadata values
+    def _collect_src_uri(self, key_prefix):
         for pn in self.modified:
-            # we are not interested in images
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
             PatchTestDataStore[
-                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
+                "%s-%s-%s" % (key_prefix, patchtest_patterns.metadata_src_uri, pn)
             ] = rd.getVar(patchtest_patterns.metadata_src_uri)
 
-    def test_src_uri_left_files(self):
-        # these tests just make sense on patches that can be merged
+    def pretest_src_uri_left_files(self):
         if not PatchtestParser.repo.canbemerged():
             self.skip("Patch cannot be merged")
         if not self.modified:
             self.skip('No modified recipes, skipping pretest')
+        self._collect_src_uri(self.shortid())
 
-        # get the proper metadata values
-        for pn in self.modified:
-            # we are not interested in images
-            if 'core-image' in pn:
-                continue
-            rd = self.tinfoil.parse_recipe(pn)
-            PatchTestDataStore[
-                "%s-%s-%s" % (self.shortid(), patchtest_patterns.metadata_src_uri, pn)
-            ] = rd.getVar(patchtest_patterns.metadata_src_uri)
+    def test_src_uri_left_files(self):
+        if not PatchtestParser.repo.canbemerged():
+            self.skip("Patch cannot be merged")
+        if not self.modified:
+            self.skip('No modified recipes, skipping test')
+        self._collect_src_uri(self.shortid())
 
         for pn in self.modified:
             pretest_src_uri = PatchTestDataStore[
-- 
2.54.0


