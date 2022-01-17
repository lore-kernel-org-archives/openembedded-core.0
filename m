Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23562C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:11:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bw/1xfOl;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385446; x=1673921446;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sb4ypC/pZPaRxp3m3SragC05Ka61tLd0twpYRequm+Y=;
  b=bw/1xfOl25/1VccN6g/1HSzC2Feri0Wyuj1imhPrqSmJGZxXsYBWK250
   B6cj/CZcmcRsaRUw/QoH+136FUG10yj7H4N95OJJ6IIvETF91igNp584R
   NIzNhdbAsH9usbHyajTh/bsBR8ZcDeZxWjichbRsrQ35eDgwp6oP/xHW/
   9ScdwThzhEgGm2tSk707ZRJLsOx64NSaIgPbWGhTRTO6K1ifwkMKf9LMe
   2smHJsmgwFuRbaxM88ljLUkjx/9jYvcaPtrbzu2jiW6jLjPC4FsDUoiwE
   r/2740Sk5jnJhjeh1X3izhRfttZM0Dq1nabnBOm05Oy8I+j4gJYyP104h
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094219"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094219"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220708"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 06/12] oeqa/sstate: Fix allarch samesigs test
Date: Mon, 17 Jan 2022 10:10:26 +0800
Message-Id: 
 <93a2c497368b56c912d6c9b06f18551cc8c6ddc8.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160625

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The allarch sstate sigs test is supposed to compare the allarch sigs but
does not. Fix this.

Also rename the common function to make it clear it isn't just used by
the allarch test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 549597d422c7bcb467f34139ff25d2bee96bf851)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 7e0ed0dac1..4b8669e9d3 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -347,7 +347,7 @@ TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
-        self.sstate_allarch_samesigs(configA, configB)
+        self.sstate_common_samesigs(configA, configB, allarch=True)
 
     def test_sstate_nativesdk_samesigs_multilib(self):
         """
@@ -371,9 +371,9 @@ require conf/multilib.conf
 MULTILIBS = \"\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
-        self.sstate_allarch_samesigs(configA, configB)
+        self.sstate_common_samesigs(configA, configB)
 
-    def sstate_allarch_samesigs(self, configA, configB):
+    def sstate_common_samesigs(self, configA, configB, allarch=False):
 
         self.write_config(configA)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
@@ -401,6 +401,13 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.maxDiff = None
         self.assertEqual(files1, files2)
 
+        if allarch:
+            allarchdir = os.path.basename(glob.glob(self.topdir + "/tmp-sstatesamehash/stamps/all-*-linux")[0])
+
+            files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps/" + allarchdir)
+            files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps/" + allarchdir)
+            self.assertEqual(files1, files2)
+
     def test_sstate_sametune_samesigs(self):
         """
         The sstate checksums of two identical machines (using the same tune) should be the
-- 
2.34.1


