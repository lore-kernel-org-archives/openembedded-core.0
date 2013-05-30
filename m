Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5FFDC6A4B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:12 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id q55so276701wes.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Muc4TiCIo/fB9mnTn/hPxFRudD317vaaFwa8vewxsTY=;
	b=ammWlD+SswyAd5l9crnW4jXsKT5mcL2VGwWWvEMlXMW43KNj+3bOm+oAoEBWnlus7S
	czMZ1iouybI4mdGT5BsTgcIb8fe+Nxh8eK6xATX/AQ34IpCqNrgVUiOLM8zDTSWcGtbu
	09UmgDtP1Sie1sd5RELtO9ggI0qHALwqc4/tkb3SJtpOV1sLAgnUiw9WVSlbX2E3rebu
	dNHTzkiLnoJ0EI0G+TvO+k5rvCO30vUeTQk+cVbV6R5MkXi/KIAbY0glmrHUd6h0IJn7
	pyhbY2cehuY7cS092F5nGH4KglFfcYryNxf/2E6TwlMswApKvDtrWQVhJDaYyUszAC2H
	w3/A==
X-Received: by 10.194.171.65 with SMTP id as1mr4835360wjc.40.1369922172871;
	Thu, 30 May 2013 06:56:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:37 +0100
Message-Id: <ae21fe8c8e38ed0b23b3a50aa5e404f652196a6d.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQli9ea5x6FtDUrrEtA4YfsuN5FeOfqg/QIzAyA0EfH5YXKZ+q54wcuNZtBb6Isws+J3cEiK
Subject: [PATCH 03/14] utils: add trim_version() function
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
X-List-Received-Date: Thu, 30 May 2013 13:56:13 -0000

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


