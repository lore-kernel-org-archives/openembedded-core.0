Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C540D107639C
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 17:42:05 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19111.1775065325328897228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 10:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=LiYj2n4n;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=vbHWRKix;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id BC8411D00055;
	Wed,  1 Apr 2026 13:42:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 01 Apr 2026 13:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775065324;
	 x=1775151724; bh=mlZRXAui05nXiQv7bTKtZZA/t3aBok3f+bn1ClUGSWs=; b=
	LiYj2n4nK4XvI1KCmYHetpaTldEoPYlqgPXczkCSe61ckqgMALvXXDESGqA83ZID
	ukRSZcMpP811HYF4Qu07o2XIAAp+h1bwKrk2XIMqu0RNJFR7AO+RHiGgjYyoeaf5
	i3ofdypRP3ycXpOQRyvuokSUDNCJudFkiqm8X8MQ+H7nHxtWY4GuBgeePJd+MXl6
	JexjYs7KVSmKjVyqwFJoeEHhmi1VqMRoSrid1kHJ1kEI2/6OqKimGC6E30MdENez
	S6FzpQlYls7hB2eRlN/wIqTgkkOAUxXZXhoP4fxaYuaTdIr6/lRxYF/JAcAI60GS
	pvOClUkAaiAOemGEd4fMhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775065324; x=
	1775151724; bh=mlZRXAui05nXiQv7bTKtZZA/t3aBok3f+bn1ClUGSWs=; b=v
	bHWRKixk5/uMzeB+QUA6x/gXm1m6k0MH5hcezi3Up5FK/dwN4KzlsAFpV4QuP8PR
	63mZF07eh5azwVR4hwRtEUT0U3A1UOWJ5EZ33JZvUIW+H6CvLzPYJkSbfWDz7ms5
	wDF8Hkc3sOyLigZ8FMkINwOWzilONmqmwvecwVKNnelz41HNol/3XYaYx0Jebdhj
	epYn7c2JMusGzya5AHEMPLXfDtVA5VlfvG9wmkQ2vN2WeEDL9Tb21+Si+iLdmW2s
	0GDBAvmWOtYJ4H39VL6ZyXcw7YumtJaQ+pjBdHtE2M9cMYJjWxQ+KbyrinjMmPgB
	Waju9Fhd6BBW6fd1ee6HA==
X-ME-Sender: <xms:7FjNaakJDQXirAF9P_kec7JMFDZ2_TzRcK93F7Js0DcLb4o7EMNx9g>
    <xme:7FjNaX2SmitqXUVsxLKdbBy0GTxzypY37YPE3cARJCbc-0EE6WTrY0QL_kU2ofrX7
    hmtjdSxKRemEMz0yQi-w7Fc_VyZV1AqCKUFjsk_yOwRYppq8v4y0-4>
X-ME-Received: <xmr:7FjNaWSj8RUAeJwyYLtpF939oFz8wGR5hdQuDDH79Z3pKnmlKCjP6-OfgQwjVEtrayGJUiiHXAF0K3yNqiiLkehUiIUP9X4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefueefff
    elvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtth
    hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghrkhgv
    rhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsth
    hsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:7FjNaZuyuPBgJLevkBbQdIQx3P68E7HllYUJaxdIEcFglkZm2RzMwg>
    <xmx:7FjNabbLxWn-YpO0-RuMf7Fcm6d5Rv3iTJxAZU5qV6vFKdRqhWk7kQ>
    <xmx:7FjNaesrnfuLaF5-57aefo8I1o5n8T1lN7zPAdU7TWCoZF9fScIWbw>
    <xmx:7FjNadGHmXlhZQAGtUOlRM82g6xXXvFKK6IZvwplNcxH93dnkcwp_w>
    <xmx:7FjNaQInKhUv3vN-r1aGJNeB61zRjFNeMpt6Bu10C57M_r2DKW2mueAI>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 13:42:03 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 01 Apr 2026 18:41:56 +0100
Subject: [PATCH v3 1/4] oelib: utils: Support filtering default features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-default-features-v3-1-8f4b40401ab7@pbarker.dev>
References: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
In-Reply-To: <20260401-default-features-v3-0-8f4b40401ab7@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4827; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=JwKB9A1cffjLKYJRcR7IX5OV16onn9qv6P8xldY5fSI=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSejXgZuFLXu7zrv8i9917vG9YliXBe+66kUPLV6Wr7x
 LoTBtKVHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZjIqlMM/8PdD5gppmtM6ROY
 /Ev+Zu+zI7semaRvzZKZdVy/oPvhG1NGhnd7JgX+y9eIyfVKUYt7P9/b70ep3Jc7Ey3blIRXJtk
 cYAIA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 17:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234451

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
index 0cb46425a02d..a72a0f5983f1 100644
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
+        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "alpha beta gamma")
+
+        # opt out of a single feature
+        d.setVar("DISTRO_FEATURES", "")
+        d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
+        d.setVar("DISTRO_FEATURES_OPTED_OUT", "beta")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "alpha gamma")
+
+        # opt out of everything
+        d.setVar("DISTRO_FEATURES", "")
+        d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
+        d.setVar("DISTRO_FEATURES_OPTED_OUT", "gamma alpha beta")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "")
+
+        # opt out of something that isn't in our defaults
+        d.setVar("DISTRO_FEATURES", "")
+        d.setVar("DISTRO_FEATURES_DEFAULTS", "alpha beta gamma")
+        d.setVar("DISTRO_FEATURES_OPTED_OUT", "omega")
+        filter_default_features("DISTRO_FEATURES", d)
+        self.assertEqual(d.getVar("DISTRO_FEATURES").strip(), "alpha beta gamma")

-- 
2.43.0


