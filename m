Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12F510F92F6
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 19:29:41 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2263.1774985375484554059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 12:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Sa1k0tQf;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=HcJ5UNEm;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B078014001A3;
	Tue, 31 Mar 2026 15:29:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 15:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774985374;
	 x=1775071774; bh=/HKL8t1k83mDVwTSkl13zzaXszwiAQSEVk6AMitvqpk=; b=
	Sa1k0tQfEZHs3P6iBJU9V+8onnmSF3wtvwQxEF2g5ms/zVxng+rzFvPMMjHHMIKE
	kC5OCESdBriinkB/+USreNwiob1UN39BCaeoxSaN9hwqnwpxkfat0b6A5eA/mlP1
	lfd1tyyINbfn26CSFs44JILxIyEZTciMBgMKlI3Tv4IzGreGLYskQu7+ELNecOqb
	VFCnRZWF4s9d/3W/w3wV83WybmX2O3b74IopKMargUMXD1Dxusjy8wo/+9ewBqHH
	d9BJHHlN47t68qKmj/lCHof1obxqqDdz3igNb3WnKGfdthovcqCoRbcl/UC62JQf
	ClrJhysfKTBJR8UFr+/NDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774985374; x=
	1775071774; bh=/HKL8t1k83mDVwTSkl13zzaXszwiAQSEVk6AMitvqpk=; b=H
	cJ5UNEm/0DKhS/MI4NN7bMCW2Fm2xjj0mO58k7xbvyFKd2XJVjeAuEFNQNOmgQAz
	TrsU6yQ63JS+9X2RWF5RHIVgwVPs4haprzE7tPpBss7H4NC0DOr4EzjSgZ5suMzQ
	XDu6vKMyQOJyeTKuVGfEQZWpXYgJ+JJNUlzLBOAa3JZsyHJ6f9m7DwOp5+5FWXdi
	xQE/WX7eSQ2ZlPVSeunm2ZTeu65eFU6NhvBNyCAddnfPbE2e6Gd0+CYMoIUIopUi
	BjJxIVgh1TLpiv8q4/5qeNNEwvvroDXzUbTSiYLWXlae/GURgZoNReHusOMFIaTz
	PnroSHm5s7akq9C1OCLdA==
X-ME-Sender: <xms:niDMadmuwSWL8GGC0o9ZzPyjAhccqFt4PQbAF59w_z1xDJet66ZgJg>
    <xme:niDMae0HLk1sSWFViqR3Cy_qFH309iB0EMdjPPNVACBet22dqThM2xvXk1Oz2sFeR
    4dMKbDPLXT9scJUGwxcOjmYaESuYvJY3j2LVkVUFSAHjjQTqnQgjSY>
X-ME-Received: <xmr:niDMaRREfUBP6d1WcEFGKyN0kAkIY112NP0M8k0N_kBpeI7lh3scpHRTlDBwl3HW4s3MEd0rnGMSX25wV4cLopvzfqI7tOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefueefff
    elvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtth
    hopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:niDMaYs9ykKWjgniW6ldn7ilVA9iwyNQmp-ShIsQApBTU9j5GIm-Lg>
    <xmx:niDMaeaTUVNzLkKe_ka43hypZwTLS69M5bJYJuwMlUFYeVmWegRjDQ>
    <xmx:niDMaVuIPC4gKh2V_DLkZoajRHpi0aWjGqTLk3_gT9qBEhoCBCGLdQ>
    <xmx:niDMaYGDwIuVZh6Fe-W4UQpIGi3ZNMFwfyOa86t4zfNKuhAjjScIgg>
    <xmx:niDMaTLHreS7_Ch_d5kCEDB_D63MIxIoN7xXB6uhuAN4jb6MxwaSPzvR>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:29:34 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 31 Mar 2026 20:29:30 +0100
Subject: [PATCH v2 1/4] oelib: utils: Support filtering default features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-default-features-v2-1-f73b43d8bd57@pbarker.dev>
References: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
In-Reply-To: <20260331-default-features-v2-0-f73b43d8bd57@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4795; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=4FK2+vqdM8oCbtzdnVKrDULf+KwDtTZHj8SHHJCIZtY=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSeUZizzi5/cekdHVvll9+PHJtS762t7Drx3YUK1/+rj
 nhN01kl2lHKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJ7FNiZFhj8+n+tDnretK5
 xDKsH9YsXdDXePBn3tTZJ3qPukw5GXSS4X9xst68mExJl8AtJwtvhV4pXtn7MYT3cE/l3AhHlsW
 yX7kA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 19:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234308

The new library function filter_default_features() allows us to support
opting out of any default features without having to use :remove.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oe/utils.py                        | 34 ++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/oelib/utils.py | 38 ++++++++++++++++++++++++++++-
 2 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index afcfeda0c6d5..52f2f1bd55e0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -83,6 +83,31 @@ def set_intersect(variable1, variable2, d):
     val2 = set(d.getVar(variable2).split())
     return " ".join(val1 & val2)
 
+def set_difference(variable1, variable2, d):
+    """
+    Expand both variables, interpret them as lists of strings, and return the
+    intersection as a flattened string.
+
+    For example:
+    s1 = "a b c"
+    s2 = "b c d"
+    s3 = set_difference(s1, s2)
+    => s3 = "a"
+    """
+    val1 = d.getVar(variable1)
+    if not val1:
+        return ""
+    val2 = d.getVar(variable2)
+    if not val2:
+        return val1
+
+    val1 = set(val1.split())
+    val2 = set(val2.split())
+
+    # Return a sorted string to ensure that the result is consistent between
+    # parser runs.
+    return " ".join(sorted(val1 - val2))
+
 def prune_suffix(var, suffixes, d):
     # See if var ends with any of the suffixes listed and
     # remove it if found
@@ -133,6 +158,15 @@ def features_backfill(var,d):
     if addfeatures:
         d.appendVar(var, " " + " ".join(addfeatures))
 
+def filter_default_features(varname, d):
+    # Process default features to exclude features which the user has opted out
+    # of. The result is appended to the target variable (e.g. DISTRO_FEATURES
+    # or MACHINE_FEATURES).
+    default_features = set_difference(varname + "_DEFAULTS",
+                                      varname + "_OPTED_OUT",
+                                      d)
+    d.appendVar(varname, " " + default_features)
+
 def all_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     Returns truevalue if *all* given features are set in DISTRO_FEATURES,
diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index 0cb46425a02d..f886b00e18ab 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -8,7 +8,7 @@ import sys
 from unittest.case import TestCase
 from contextlib import contextmanager
 from io import StringIO
-from oe.utils import packages_filter_out_system, trim_version, multiprocess_launch
+from oe.utils import packages_filter_out_system, trim_version, multiprocess_launch, filter_default_features
 
 class TestPackagesFilterOutSystem(TestCase):
     def test_filter(self):
@@ -102,3 +102,39 @@ class TestMultiprocessLaunch(TestCase):
         with captured_output() as (out, err):
             self.assertRaises(bb.BBHandledException, multiprocess_launch, testfunction, ["1", "2", "3", "4", "5", "6"], d, extraargs=(d,))
         self.assertIn("KeyError: 'Invalid number 2'", out.getvalue())
+
+
+class TestDefaultFeatures(TestCase):
+    def test_filter_default_features(self):
+        try:
+            import bb
+            d = bb.data_smart.DataSmart()
+        except ImportError:
+            self.skipTest("Cannot import bb")
+
+        # Test with nothing opted out
+        d.setVar("DISTRO_FEATURES", "")
+        d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES"), "alpha beta gamma")
+
+        # opt out of a single feature
+        d.setVar("DISTRO_FEATURES", "")
+        d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
+        d.setVar("DISTRO_FEATURES_OPTED_OUT", "beta")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES"), "alpha gamma")
+
+        # opt out of everything
+        d.setVar("DISTRO_FEATURES", "")
+        d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
+        d.setVar("DISTRO_FEATURES_OPTED_OUT", "gamma alpha beta")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES"), "")
+
+        # opt out of something that isn't in our defaults
+        d.setVar("DISTRO_FEATURES", "")
+        d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
+        d.setVar("DISTRO_FEATURES_OPTED_OUT", "omega")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES"), "alpha beta gamma")

-- 
2.43.0


