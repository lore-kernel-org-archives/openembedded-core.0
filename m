Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4325C6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 18:48:25 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b12so2160068wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 11:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Muc4TiCIo/fB9mnTn/hPxFRudD317vaaFwa8vewxsTY=;
	b=MQgTswZAH8nkWC+wpiPb1aG/HCJIfP75cV0PiR66bz9mVF1KbaP8Sfzr1KCCBJpxiv
	aud3ynISlfrhesf85s8Fa/83A1cQCRlqdhnaAasIBKuw1VWSzlfbjvUFlr4ITWl+8ada
	tVOivrFBlKBqcbrb8vXHogTFGvy14Tgv6qXFibOM2OGU7gA4+E6akK3Z/ubFQTsm4ha0
	TWOGl28D/qEr5KjRIIuROXbk2xrkImxt7QvXbNCyR67y1eGm49CbCFPUmEvWsgcswPgN
	1Eta1lEUthdv5iuHaXSz4tGJOZ4nGFWaqndKR6Z9qr8FvpRUYRGX2meM13CdZLjeJrFH
	rw2g==
X-Received: by 10.180.39.233 with SMTP id s9mr27377943wik.25.1369334898383;
	Thu, 23 May 2013 11:48:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ca19sm37546635wib.3.2013.05.23.11.48.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 11:48:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 19:45:01 +0100
Message-Id: <1369334701-18752-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369334701-18752-1-git-send-email-ross.burton@intel.com>
References: <1369334701-18752-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmMWZFwKPIOSvLKavnovkmQaMov0WjWcA3trxeBuINw6U+VyNwhkyI+IfTUHLM5r8P5hWCO
Subject: [PATCH 3/3] utils: add trim_version() function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2013 18:48:25 -0000

Add a helper function that returns just the first <num_parts> of <version>,
split by periods.  For example, trim_version("1.2.3", 2) will return "1.2".

This should help reduce the spread of numerous copies of this idea across
classes and recipes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/tests/test_utils.py |   20 ++++++++++++++++++++
 meta/lib/oe/utils.py            |   15 +++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/meta/lib/oe/tests/test_utils.py b/meta/lib/oe/tests/test_utils.py
index 8bb36f2..5d9ac52 100644
--- a/meta/lib/oe/tests/test_utils.py
+++ b/meta/lib/oe/tests/test_utils.py
@@ -29,3 +29,23 @@ class TestPackagesFilterOutSystem(unittest.TestCase):
         d.setVar("PACKAGES", "foo foo-data foo-locale-en-gb")
         pkgs = packages_filter_out_system(d)
         self.assertEqual(pkgs, ["foo-data"])
+
+
+class TestTrimVersion(unittest.TestCase):
+    def test_version_exception(self):
+        with self.assertRaises(TypeError):
+            trim_version(None, 2)
+        with self.assertRaises(TypeError):
+            trim_version((1, 2, 3), 2)
+
+    def test_num_exception(self):
+        with self.assertRaises(ValueError):
+            trim_version("1.2.3", 0)
+        with self.assertRaises(ValueError):
+            trim_version("1.2.3", -1)
+
+    def test_valid(self):
+        self.assertEqual(trim_version("1.2.3", 1), "1")
+        self.assertEqual(trim_version("1.2.3", 2), "1.2")
+        self.assertEqual(trim_version("1.2.3", 3), "1.2.3")
+        self.assertEqual(trim_version("1.2.3", 4), "1.2.3")
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 0a2092b..82987e8 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -135,3 +135,18 @@ def packages_filter_out_system(d):
 
 def getstatusoutput(cmd):
     return cmdstatus.getstatusoutput(cmd)
+
+
+def trim_version(version, num_parts=2):
+    """
+    Return just the first <num_parts> of <version>, split by periods.  For
+    example, trim_version("1.2.3", 2) will return "1.2".
+    """
+    if type(version) is not str:
+        raise TypeError("Version should be a string")
+    if num_parts < 1:
+        raise ValueError("Cannot split to parts < 1")
+
+    parts = version.split(".")
+    trimmed = ".".join(parts[:num_parts])
+    return trimmed
-- 
1.7.10.4


