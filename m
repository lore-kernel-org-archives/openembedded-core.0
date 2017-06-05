Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 38CCE7808D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 16:36:22 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id x70so17193255wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=zIMijvsRq+9arxjWuq1J8v5wSdn1LmYXpbNQWt9hwHE=;
	b=s4gccN8OCrUUELkrxKTtFT/KS+l67bgzOwS4F5SniUeYvt2Ur8mPM8u9zCtdtlesMr
	9h8Jfy9GdgrGRF51U19io4XZ45O6u4Xj8W+Z6lDkRMRP73BDJapwQ8Q6SFIGHmkjOtXA
	ajluWiQAtfqHRqogQyf+VqdG0v72mzNSb9dGWpgU+4uUYFXRQ/pPR74ozZvY9gExHEaG
	jgahKRNNBBt2/0oCml98GkMqD/sC0yWZinvOacoKultwWmWFt5nT7COlTa8QgZLmCysz
	zFtS5on5gKLlyP64kGVK4j8YdPMzr9Pb3HWNozGl6TyCgSi9rcKbTVZPn1WZ1NeU682I
	CR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zIMijvsRq+9arxjWuq1J8v5wSdn1LmYXpbNQWt9hwHE=;
	b=MyNgrPOUDUqlF2QhS6tyyrk0G7Bwxu0LdZdAnrsIIMRfqVDZ9ASEeepPFsJM1QWLFZ
	tXL4M+1q7WwJchZMrN60BrKVIRBSWVzWRaUQz/n4T3Fty+TDlEfdevdxGQNtx+7Jbz2S
	zrGuVkrVHDk8WWw9bVlQu2KIDEQIG8Mh4JXmqP55RFJ69lmqaxGq1PwNGuWEwS5KioCz
	ziZTaI/eRyMEJDvZSBtTkBakH5mNOAs62aH3EmKYmE8Eti/PRVc/ju4O8gHSsD0aLdOV
	3+oVBs8brQW45Z1/bOoqmOU/Wx/teG/e8RAa3CAkWALbOZiHzOJQyFlcpBv2nuDXoV9T
	kMew==
X-Gm-Message-State: AODbwcD2+Uv6ekJ/7soosiaJU7UVclkVlBIFKta9srLl7sYVaMwxh/DH
	bonQzItZ5FeEow9G1qE=
X-Received: by 10.28.156.142 with SMTP id f136mr8942711wme.24.1496680583215;
	Mon, 05 Jun 2017 09:36:23 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q77sm10655554wmb.4.2017.06.05.09.36.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jun 2017 09:36:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 17:36:21 +0100
Message-Id: <1496680581-5379-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oeqa/selftest: lock down Meson git revision for reliability
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
X-List-Received-Date: Mon, 05 Jun 2017 16:36:24 -0000

The test_recipetool_create_github test fetches HEAD of the repository so
upstream changes can (and do) break the test.  Avoid these problems by passing
the rev= argument in the URL to lock the checkout to the same version that is
fetched in the github_tarball test.

Also pass the commands to runCmd() as a list instead of a string, the semicolon
in the URL needs more quotes if the shell is involved and passing a list
bypasses the shell entirely.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 7bfb02f..4344f9f 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -449,8 +449,8 @@ class RecipetoolTests(RecipetoolBase):
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'meson_git.bb')
-        srcuri = 'https://github.com/mesonbuild/meson'
-        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        srcuri = 'https://github.com/mesonbuild/meson;rev=0.32.0'
+        result = runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['Apache-2.0'])
-- 
2.8.1


