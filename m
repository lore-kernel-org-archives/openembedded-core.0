Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE946CA1015
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 12:24:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.20305.1757075077111496068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 05:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PeA1E4iZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 821A51A0DC8;
	Fri,  5 Sep 2025 12:24:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 577996060B;
	Fri,  5 Sep 2025 12:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EE12102F1BCE;
	Fri,  5 Sep 2025 14:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757075074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=biAL101HJ1VeXNAtuVrcdg7A8VDGkGTSKajYtdo+lCQ=;
	b=PeA1E4iZn1TJ+Nx+QbcQsTpZQEnLR9Ux6jxn89nqENF7wMR2qt1HDBm/eJwe8yTn2RhvcR
	RHpzV5e0YKoZz+qyzA/QKx8sF8SHOBf4kQesFNriwBEUWZ3mfzHLklSwsRSSggYFfz/qtS
	NWIjWJvoqaiNiSMcj+Hh8E9Ulk4bA79fmk7Cp+75louFaMxDoYtaUrjgUG3OkGT2TYXvFw
	+ps3VMap0vCL/Yx5lSSlFmrtMJa5v+2Rw3CMeAL9bbNiNJ1OUkea41aqShwAoyNOf3niII
	Dx6x6nbmErWXfsTEfoHmCle2xgFyQVC7K4z8ZehkyQt/gMbqy7qD/7r1jDLbKw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Sep 2025 14:23:58 +0200
Subject: [PATCH v2 2/2] oeqa/bblayers.py: add a test case for
 bitbake-config-build show-fragment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-show-fragments-v2-2-c13ec8df9296@bootlin.com>
References: <20250905-show-fragments-v2-0-c13ec8df9296@bootlin.com>
In-Reply-To: <20250905-show-fragments-v2-0-c13ec8df9296@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=m2CH0WePolXzXrVbShqNJD19y6yVpS3v47B7VyV0TvU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoutZ+i6vtblnPSmLeVzTxcpX3ij1ZOPpwhqWI6
 yPNnD775wiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaLrWfgAKCRDRgEFAKaOo
 NptpD/wOW5xmABf1a4oP5GCq+slphkkggMJQnsWWp/CjDviWNApUc2EPv1A2NK7Ph7WBmKCGqCd
 Lzm2iEl9XR94WsFIND9YwQNMmWcm5QE/Dh9S8tkvn0wyRAL/pdQlgLJiJlsy8xtyBPYcgPYuXZg
 O1U8cMsZv1eYfSIl2rKfSE7bB4sH2Xkquo3Cap2GLBb4kWm+wG8YqZgopc3XXcHRkqvQvisD+y8
 cx1qJPRl8U3fEGF/BGWdYO4dFAf/5mps3n/xCwCQ5IDxU1Bi9torEbcPbtmt6b63kzjD6R+eznU
 gc9zaob+4vRHYqpQ0n6j1NyYb8iaay9JPirRI/eB1T8K46Oust8dE9R6tST5XGBZPP6/W7EoRr/
 z87DG/WQbCIswGWG6gFfh+iIj9AobomGhFN0XFkd48ZP5D66JtKiFucgPjZaGkToOle1jBm4655
 Gk7ZPjbAOW8Isigsa9oD/yXi6coAB6NaD9Pv76gfdtKY9plCSYyBpf+hPJI+tLkZiMfFM9l+0/y
 gRzasSSM9cj2AtfzM/mMWENZ1aiZNYcGkPdHEU7RzSU1Yy2O/3CQ2SSy4XkpfOnM/kX0xIuM25f
 zJdrqxItYIiOMVi7T1W6Mso/LnTGjqElqGdK9UiyJM9YGpJWwcS2y0Ff35S9JVwzLr7bHYK1YFS
 pxtfYH4rMOJnazg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 12:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222997

Add a test case for 'bitbake-config-build show-fragment' and use
'bitbake-config-build list-fragments' to get the path to the fragment.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 68b0377720..8c05ec5d3d 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -271,3 +271,29 @@ class BitbakeConfigBuild(OESelftestTestCase):
         runCmd('bitbake-config-build disable-fragment selftest/more-fragments-here/test-another-fragment')
         self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
         self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
+
+    def test_show_fragment(self):
+        """
+        Test that bitbake-config-build show-fragment returns the expected
+        output. Use bitbake-config-build list-fragments --verbose to get the
+        path to the fragment.
+        """
+        result = runCmd('bitbake-config-build --quiet list-fragments --verbose')
+        test_fragment_re = re.compile(r'^Path: .*conf/fragments/test-fragment.conf$')
+        fragment_path, fragment_content = '', ''
+
+        for line in result.output.splitlines():
+            m = re.match(test_fragment_re, line)
+            if m:
+                fragment_path = ' '.join(line.split()[1:])
+                break
+
+        if not fragment_path:
+            raise Exception("Couldn't find the fragment")
+
+        with open(fragment_path, 'r') as f:
+            fragment_content = f'{fragment_path}:\n\n{f.read()}'.strip()
+
+        result = runCmd('bitbake-config-build --quiet show-fragment selftest/test-fragment')
+
+        self.assertEqual(result.output.strip(), fragment_content)

-- 
2.51.0


