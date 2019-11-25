Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 682856C37E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 06:57:46 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id o9so6086147plk.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 22:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=S32mrd67CxfKbR2lZPgKx6t3p1dKt1cXNtdzBdLnPls=;
	b=PI7arg+jnE9O211WaTfHiOxXUhzLEo1qO82O0x9797o/6x/tXiv7XGFVyNaDyqIyHj
	dhqDV8LXQ7w8d2hqsQ9aRywp8aDWVJyscKiMDokOO3FwjdVJajR8EOnVAlfNGOTAzAGv
	lKsFA/UrRAhBujiCIeSc797adNin/OGp6p1k8aUKUP/gMd6yLcB41nggX/7Ql1kmBOxe
	XZFZ9+t4oVVGXdx9kAmoegr+XwvzJrbKCWk6aCQIpwYLWtAMi0lBFlx4N/UgjuQDsDxe
	0xjeKd1cIspWMyOldBB0IJi1lbRXcZYPyAJ1nDfiiyNC2Rf/0lFZ+ElF/3qHyHzTGgZl
	5/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=S32mrd67CxfKbR2lZPgKx6t3p1dKt1cXNtdzBdLnPls=;
	b=pj/xPyKcfnsQ1l5luVbL7O3QcmLhSWnUT01C9ZkMJ7RZp17k8j4MGvMsfa9W38Uqzf
	CHr0cFjRtx+icleXSFP5V0tvfch8IYvP5pm/GKvfl56a/QXscKFW/xBjbdqIox+VBH+8
	vQyA+n1Vs4ZnUqd0snUQuL626YGa50K+rR1DJr8Sqo6UDuh8rOkv56v2nuwkmiH+vKw5
	LPODNsIHxXMIEqYm95gvXP/gfE34JFKjd7jpx/tdh/EfIFN/amxwjPrqORZwKi4wp6n1
	XLlzuff7ZYOIn06KD7K3YiluHY4a0T+UOaHbDCJgmb30ZP4jbSv8OOK14lRGvOzV1hAM
	9/jg==
X-Gm-Message-State: APjAAAXHmpRRxtqbOX9R6arp+rvy85A3+Jo0A3LpZQ8O1UbtqFNdYfP/
	5/QBQfOIzYJp5LvPOMyvhSDbfUunU2A=
X-Google-Smtp-Source: APXvYqzyMgPxXC/t9wBtfGHWeRqNJJjUuBhBWVN9GpbeIX9QAS8X4ty90Y/+gwSd9Mp8s1D4kc5cdg==
X-Received: by 2002:a17:90a:6d64:: with SMTP id
	z91mr37274878pjj.44.1574665067123; 
	Sun, 24 Nov 2019 22:57:47 -0800 (PST)
Received: from [127.0.1.1] ([101.184.7.224])
	by smtp.gmail.com with UTF8SMTPSA id
	a68sm6622061pfa.160.2019.11.24.22.57.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 24 Nov 2019 22:57:46 -0800 (PST)
Date: Mon, 25 Nov 2019 06:57:41 +0000
Message-Id: <20191125065741.332361-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] oeqa/selftest/cases/gcc.py: Split 'gcc' and 'g++' testsuites
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
X-List-Received-Date: Mon, 25 Nov 2019 06:57:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Split the GccCrossSelfTest testcase into separate testcases for 'gcc'
and 'g++' respectively. In order to split them use the "check-gcc-*"
language make check targets.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/cases/gcc.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 5a917b9c44..3efe15228f 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -21,8 +21,10 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
     def run_check(self, *suites, ssh = None):
         targets = set()
         for s in suites:
-            if s in ["gcc", "g++"]:
-                targets.add("check-gcc")
+            if s == "gcc":
+                targets.add("check-gcc-c")
+            elif s == "g++":
+                targets.add("check-gcc-c++")
             else:
                 targets.add("check-target-{}".format(s))
 
@@ -77,7 +79,12 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
 @OETestTag("toolchain-user")
 class GccCrossSelfTest(GccSelfTestBase):
     def test_cross_gcc(self):
-        self.run_check("gcc", "g++")
+        self.run_check("gcc")
+
+@OETestTag("toolchain-user")
+class GxxCrossSelfTest(GccSelfTestBase):
+    def test_cross_gxx(self):
+        self.run_check("g++")
 
 @OETestTag("toolchain-user")
 class GccLibAtomicSelfTest(GccSelfTestBase):
@@ -109,7 +116,12 @@ class GccLibItmSelfTest(GccSelfTestBase):
 @OETestTag("toolchain-system")
 class GccCrossSelfTestSystemEmulated(GccSelfTestBase):
     def test_cross_gcc(self):
-        self.run_check_emulated("gcc", "g++")
+        self.run_check_emulated("gcc")
+
+@OETestTag("toolchain-system")
+class GxxCrossSelfTestSystemEmulated(GccSelfTestBase):
+    def test_cross_gxx(self):
+        self.run_check_emulated("g++")
 
 @OETestTag("toolchain-system")
 class GccLibAtomicSelfTestSystemEmulated(GccSelfTestBase):
---
2.24.0

