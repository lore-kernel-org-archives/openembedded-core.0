Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 851A078F6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:28:42 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id s12-v6so9102385wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EbEE9BlM7OtznetF6s4ft/H+h7fDjAemL3h9jumNAIg=;
	b=S/jRMezJMNYsEgAf0rUWd0TDjwWq7YvsKtdEyEQnhRHTF5HmRJXb4umvOw1nc0k+fv
	1v08YJRBOcP1TRRYfqF9qLUima2MCYiS2eEmy8qsE1WhZnS6Ph4f1uy1P9ktWB+T1MtB
	rWnfETdDhbmxf48pz05TNkiYXfuQn05OKr0AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EbEE9BlM7OtznetF6s4ft/H+h7fDjAemL3h9jumNAIg=;
	b=tQDftjLvliIjZKpfZWexJMhbGe9N7vkElxFCLy7QyK1U7vxRZWX03JciALg+eOkUGV
	jMAZeBSrOdkme+TgEtaYMIvn89uqDdIK0iR/fdVlA4O5EUdCsRwP/KypCB+uChp+aZx6
	AUu3Ca+6z4lBdEeSwMEdc9Nlgk06aERn39v274xgIiC3MJRfsLc4gEOR9h7FHCm4rjCV
	GNmV4zJpYej65XJ/dxFfgoj5RU1lJ947P1enalnWxXPGaVGtC5OdB+WcSpq6mQ9PjesE
	D5v2q2u+9iceAozjHrouJG5TKuW8I91UMvtL1pXahIEOp0/zLuMf5XPcQsuG1rJr+9iK
	xtDA==
X-Gm-Message-State: AOUpUlE/pdTgYDHo6ukFQpzlJR+03oS3lZOxKMpX+rDpRx2lwZ7Bn6GH
	RXBjMS2ISnQa2CTdnEMESWXz+s1zEIQ=
X-Google-Smtp-Source: AA+uWPybq/S4fGfxviU/mx4DSueIMHGr+GxvZUetmP9d4Foo1AuxwJyHE94BlZiHYIJfBmLX9uAqOQ==
X-Received: by 2002:a1c:adca:: with SMTP id
	w193-v6mr7731805wme.147.1534170523069; 
	Mon, 13 Aug 2018 07:28:43 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm13488254wrr.95.2018.08.13.07.28.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 07:28:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 15:28:33 +0100
Message-Id: <20180813142835.5309-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
References: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/7] selftest/package: Add test to ensure sparse files are preserved
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
X-List-Received-Date: Mon, 13 Aug 2018 14:28:42 -0000

Add a new element to the hardlink test to check we also preseve file
sparseness during the packing process. This should ensure we don't regress this
issue again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/selftest-hardlink/selftest-hardlink.bb     | 1 +
 meta/lib/oeqa/selftest/cases/package.py                     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
index 8a0e6336aa8..ec330fa9fff 100644
--- a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -16,4 +16,5 @@ do_install () {
 	ln ${D}${bindir}/hello ${D}${bindir}/hello2
 	ln ${D}${bindir}/hello ${D}${bindir}/hello3
 	ln ${D}${bindir}/hello ${D}${bindir}/hello4
+	dd if=/dev/zero of=${D}${bindir}/sparsetest bs=1 count=0 seek=1M
 }
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index f288fcafdb4..4ff9b08c96a 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -88,6 +88,7 @@ class VersionOrdering(OESelftestTestCase):
 
 class PackageTests(OESelftestTestCase):
     # Verify that a recipe which sets up hardlink files has those preserved into split packages
+    # Also test file sparseness is preserved
     def test_preserve_hardlinks(self):
         result = bitbake("selftest-hardlink -c package")
 
@@ -97,3 +98,8 @@ class PackageTests(OESelftestTestCase):
         # Recipe creates 4 hardlinked files, there is a copy in package/ and a copy in packages-split/
         # so expect 8 in total.
         self.assertEqual(os.stat(dest + "/selftest-hardlink" + bindir + "/hello").st_nlink, 8)
+
+        # Test a sparse file remains sparse
+        sparsestat = os.stat(dest + "/selftest-hardlink" + bindir + "/sparsetest")
+        self.assertEqual(sparsestat.st_blocks, 0)
+        self.assertEqual(sparsestat.st_size, 1048576)
-- 
2.17.1


