Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id C12517F49E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Sep 2019 12:55:49 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id n9so5110491pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Sep 2019 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=9JiVLs9vRTA4Ew+Sze6hYIkibPQkFZbE9gRm7DVTCoQ=;
	b=CMzFGx7g00NMGBRgnhG6uFNR7SuomXjt3EL3XA6iBnXaSxOL5QuV95wfRQurVU0jjT
	rw+pTpE5C5sUmDIWAHkFgGFrAayg3bww7F5aJ9gIipqsp/n10Ly8nAHbKCEAyXiG2YZV
	X9en1Qvb8jGmhMt+ut/THBFC2hkja4Bbn6TNKEmoJEYvjQMOUzvbNlnmd1CklEhnSZ64
	Thf4hn2xUiPvIw5vABeZzMhwiBtr4xicmNtderBg14id22kPUKrVPhzE+X4fcwDg4PJV
	ABTBzbuvgSGnq/bPVOPAn4A3Yk+cSAwn9/kKOqo5Hb3Ih54hf4QbgQIylxA4cua0fYc0
	3zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=9JiVLs9vRTA4Ew+Sze6hYIkibPQkFZbE9gRm7DVTCoQ=;
	b=pD8cNDXBc2jpi4ZtuktfjYffAGB71xJ3+ZCXSQHmlcUKbULPFH1lEc2seHUasNIYp9
	u8AOdb/XJySs9e1ThbxBXhDTm2p5/5lYV9fpdRRDxTqbxOkB8D6ZNCaW7Q8gnP0ujIxi
	9oNE9VDvLVwxoqFntC/rBNGD361Lf3TXxJ1ff/12zMJhwTTXOx2meVpzK94MHOKnf6g3
	IHs66mFfYJn5RrWLORqZMqosB12oIA6znDqQDfTqNazRrIFQmu09wzd61xFKOVHgsp0I
	trpYthWYdAZqUzeDoIzkvuoad5yueVOePbiksi8J/OwYKbT5MXa/V4gLXmHBDgb0JZAS
	GJ+Q==
X-Gm-Message-State: APjAAAVuzcQWDLcUFOHOw1OffDsDAeEtLJWguzCq3+zmIs9uGZoYm95B
	T0dGrbW2jFI41wn8kWgfSyvVEiiiMdOqCg==
X-Google-Smtp-Source: APXvYqyYX+QWr5QwwYc+N1AEM1shi/4l7o2buRbhizHthxlYEb0dzmt6rRF3+1GtHCjwCHI9xCH+xg==
X-Received: by 2002:a62:1955:: with SMTP id 82mr16548098pfz.256.1567860950444; 
	Sat, 07 Sep 2019 05:55:50 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	k5sm7599719pgo.45.2019.09.07.05.55.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 05:55:49 -0700 (PDT)
Date: Sat, 07 Sep 2019 12:55:06 +0000
Message-Id: <20190907125506.17536-7-nathan@nathanrossi.com>
In-Reply-To: <20190907125506.17536-1-nathan@nathanrossi.com>
References: <20190907125506.17536-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 7/7] oeqa/selftest/cases/glibc.py: Rework and tag with toolchain-user/system
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
X-List-Received-Date: Sat, 07 Sep 2019 12:55:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Rework the glibc execution into a common base class. Additionally tag
the tests with "toolchain-user" and "toolchain-system".

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 44 +++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index e13de87014..ea0f79e144 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -13,12 +13,8 @@ def parse_values(content):
                 yield i[len(v) + 2:].strip(), v
                 break
 
-@OETestTag("machine")
-class GlibcSelfTest(OESelftestTestCase):
-    def test_glibc(self):
-        self.glibc_run_check()
-
-    def glibc_run_check(self, ssh = None):
+class GlibcSelfTestBase(OESelftestTestCase):
+    def run_check(self, ssh = None):
         # configure ssh target
         features = []
         if ssh is not None:
@@ -40,25 +36,23 @@ class GlibcSelfTest(OESelftestTestCase):
             for test, result in parse_values(f):
                 self.extraresults["ptestresult.{}.{}".format(ptestsuite, test)] = {"status" : result}
 
-class GlibcSelfTestSystemEmulated(GlibcSelfTest):
-    default_installed_packages = [
-        "glibc-charmaps",
-        "libgcc",
-        "libstdc++",
-        "libatomic",
-        "libgomp",
-        # "python3",
-        # "python3-pexpect",
-        "nfs-utils",
-        ]
-
-    def glibc_run_check(self):
+    def run_check_emulated(self):
         with contextlib.ExitStack() as s:
             # use the base work dir, as the nfs mount, since the recipe directory may not exist
             tmpdir = get_bb_var("BASE_WORKDIR")
             nfsport, mountport = s.enter_context(unfs_server(tmpdir))
 
             # build core-image-minimal with required packages
+            default_installed_packages = [
+                "glibc-charmaps",
+                "libgcc",
+                "libstdc++",
+                "libatomic",
+                "libgomp",
+                # "python3",
+                # "python3-pexpect",
+                "nfs-utils",
+                ]
             features = []
             features.append('IMAGE_FEATURES += "ssh-server-openssh"')
             features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(self.default_installed_packages)))
@@ -80,5 +74,15 @@ class GlibcSelfTestSystemEmulated(GlibcSelfTest):
             if status != 0:
                 raise Exception("Failed to setup NFS mount on target ({})".format(repr(output)))
 
-            super().glibc_run_check(ssh = qemu.ip)
+            self.run_check(ssh = qemu.ip)
+
+@OETestTag("machine", "toolchain-user")
+class GlibcSelfTest(GlibcSelfTestBase):
+    def test_glibc(self):
+        self.run_check()
+
+@OETestTag("machine", "toolchain-system")
+class GlibcSelfTestSystemEmulated(GlibcSelfTestBase):
+    def test_glibc(self):
+        self.run_check_emulated()
 
---
2.23.0.rc1

