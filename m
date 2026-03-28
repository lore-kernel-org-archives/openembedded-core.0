Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA1E10F3DD9
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 09:49:20 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8246.1774691354667948964
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Mar 2026 02:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=tjI22ZPJ;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=KONttv39;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E678CEC0227;
	Sat, 28 Mar 2026 05:49:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 28 Mar 2026 05:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774691353;
	 x=1774777753; bh=/swMbxnWzcCJdWbVT/EyohKAydsvvEoGA0SZnwGXgnc=; b=
	tjI22ZPJUfe9nYFs3BuKkG3UokBRUviye/ozL0dXrhu0Zqdl5Glz5sxfh4Y7lqll
	gFi8Qi6US1HyKoTdN8HBh+yrtAV6pMQCT21LUOZVEdvx+mjQXzKHqbf0a7x5pMxe
	/VHPBDwZkyIOiEUPNUkJCvIWjaWDP2F350iwJVfDk30gKdtd2GCfNc5gtIAKtnI8
	BOXAQxoWYzPh5fwHNVCvZqlrCvE3fILCmMLoZrGJryYoUgBJ3scno3OdNWjIHPI4
	4FdwkklDBVBs1xF1gOv62Otu52/TIYNkn0utxaIUHxb6gjP8ekRmfdICVm7OBxGm
	TrynTh3aZrFj/NxPA9qcPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774691353; x=
	1774777753; bh=/swMbxnWzcCJdWbVT/EyohKAydsvvEoGA0SZnwGXgnc=; b=K
	ONttv39TBz0Qx6aIhCDfgFrJqZQ8DJn7cdSG5CAsSypT9HeVZ6I9RfbTS3NaFjOn
	Cxx51Uj67I6Xj4NUMhDBSqfzsfANhJLk4zMap8kwnDqsbDkQO4ooCeq6Br+20h6g
	wEna55M4Cdeo9pwNr+C3QwKEg1kFHerOkYBYPqe3sH0znPCmpf9VZ/bqwP0GmkMA
	7A2e2HrFsRnh7cmuvXEOWtOZ3wAu8ktkvybBHR2M7hk9bhxm53TJXhojFlVjHWB9
	5uhRIsIjoSyFxurxtO12pNirqX7jC92VG4P8iAoDYF12imQ+727nbtONalCgIYTa
	VJeAPe0ttFhpywLycQryQ==
X-ME-Sender: <xms:GaTHaaTFYPJuyCHGp0Me8Reh6Csey6w2wZ-bEnBacVALFnwvEIEJuQ>
    <xme:GaTHaVweiWjh-r9Byca5-hnQamyE5ZziF7Tz0sIrPj8GypghJzn_MuDU04ZXLEQ8n
    XdKFivqrLjvY5vale8tXFH393MV028_vVutDti3ngzynfgpUwM9pA>
X-ME-Received: <xmr:GaTHaVeLwayUsBHiDFnZIZ_p8ebWIHKpqDpNJpciiISygqEuOrmt9P7aPf2R38rBjIr-BFG3-rKpsKyNP3OEejwgD5ucIM4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedvkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:GaTHaRLHpn-PWfqqtEIRt1J88aEb9izvLmDosLlnuuCbQ_VtJdpPuw>
    <xmx:GaTHaWFsOzucgx1ATyIAIAxEVhjrLBzywM1xq_qtarFl0ZtiMeunRQ>
    <xmx:GaTHabo2sED2Luyo6i9NyPlNI5IrNZOo-SmfskpdFRYoesutgcyouw>
    <xmx:GaTHafQbP3eWvs5TFuaMTM3P2kMtz2qp-p7bJwFZgXfK4OImRmpcUg>
    <xmx:GaTHaS15TH78LV6315FG6Mkq-8bIKpXzv0JJAVtV20Z-Uq-f0yFz0Oic>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Mar 2026 05:49:13 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Sat, 28 Mar 2026 09:48:59 +0000
Subject: [PATCH 1/4] oelib: utils: Support filtering default features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-default-features-v1-1-90790864d734@pbarker.dev>
References: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
In-Reply-To: <20260328-default-features-v1-0-90790864d734@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4530; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=9++4ZQ3mBiIAeyV27S+Hjj+A7Su2VdmDxAjOxLUxkA0=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQeXyKxqz6K4+q5Jx+aTiaf4GrW1r62a6Os8cakkriII
 xOi989K6ihlYRDjYpAVU2TZ3PP1/tNeR96MkFsKMHNYmUCGMHBxCsBEBEMYGaY+ZNArueScU3Xh
 h9zFz8fe39lio/u2t+L57Q/2Klks/A2MDLPN2XlELB9N0l/U2b/FfXno72Vf1jdPtBOdlPl52sw
 zCxgA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Mar 2026 09:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234123

The new library function filter_default_features() allows us to support
opting out of any default features without having to use :remove.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oe/utils.py                        | 35 +++++++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/oelib/utils.py | 31 ++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index afcfeda0c6d5..928b38c64cf9 100644
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
@@ -133,6 +158,16 @@ def features_backfill(var,d):
     if addfeatures:
         d.appendVar(var, " " + " ".join(addfeatures))
 
+def filter_default_features(varname, d):
+    # Process default features to exclude features which the user has opted out
+    # of. This should be called from an anonymous Python function and uses
+    # d.setVar() to avoid unnecessarily evaluating this on every data store
+    # update.
+    default_features = set_difference(varname + "_DEFAULT_RAW",
+                                       varname + "_OPTED_OUT",
+                                       d)
+    d.setVar(varname + "_DEFAULT", default_features)
+
 def all_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     Returns truevalue if *all* given features are set in DISTRO_FEATURES,
diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index 0cb46425a02d..4ba4b14f3742 100644
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
@@ -102,3 +102,32 @@ class TestMultiprocessLaunch(TestCase):
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
+        d.setVar("DISTRO_FEATURES_DEFAULT_RAW", "alpha beta gamma")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES_DEFAULT"), "alpha beta gamma")
+
+        # opt out of a single feature
+        d.setVar("DISTRO_FEATURES_OPTED_OUT", "beta")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES_DEFAULT"), "alpha gamma")
+
+        # opt out of everything
+        d.setVar("DISTRO_FEATURES_OPTED_OUT", "gamma alpha beta")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES_DEFAULT"), "")
+
+        # opt out of something that isn't in our defaults
+        d.setVar("DISTRO_FEATURES_OPTED_OUT", "omega")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES_DEFAULT"), "alpha beta gamma")

-- 
2.43.0


