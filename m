Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 45F0265C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:19:49 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id x79so39754369lff.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 05:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=l2SMZiWlU8h0k9C9GB+qzUht7kKZVHGRtMeB9wixrmM=;
	b=qpD2YOUCdXFxshn3k9klBupiZoVmGeJ1g59RYWuaWD3jI7HMpIlpH1lt8au9iCfZvO
	HmrUoWxFvHRth+bu3zX2LmGe/HihsTt1FRyxBvRdBZFupBxNlk3Hmmi24FTMo0+vacuY
	vG87TuiSQCMxi5mMOiHVYiiLcVaWkjwTocq9NOwKXAcDNR4y1Afqu8f/xB8uABsuslY+
	oBZ1poOYZto3KK0nk6UTFEaau4VPifr/LYWzgyAwbhWh4Mg0FOfwKjKcFOPZ/SWR4dRA
	Jyv/n9R/AsMQFJfEKVQo0fLkJ700vUvyP1r4oCByvNZKqIdcYJMg7KR2+FpztyKu5sdF
	0kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=l2SMZiWlU8h0k9C9GB+qzUht7kKZVHGRtMeB9wixrmM=;
	b=giIviA0Rb0nv1V4KAcucyHFqY4uKdsa17biY+b1Cn6brOpGG9axkrt5o84vWyEM07q
	WcPLtNbTgBiPxK/NcyG5DBeJ83OgCJWU9VByY+DTs3gb/ICIKaE7TPGPFIASMm+PJoGQ
	aofaI+F8O+Tpp2DX094CW2H45d9GZN1o8jwNfomEkfzQ7UwB2Cz241O+XZvwzABQJkk3
	hwrvaXF4No/1E6Sjb8zEP/ncY/qQaAv1IAbG6VY0vOAGEYrAGBxtWoY915+y+C+azkxA
	udHXYIrPhouLiuRUIdXOa/gyutMWykwZ5f+6yjbVHEkMwqYvxBWshgudbY89axTamo6x
	w7rg==
X-Gm-Message-State: AA6/9RnasTlKyDXeczDgSe3EEJs1S3cQlrik6KtxHVukSnqkA8UbMYP0NXli9v4X/hCA5iHC
X-Received: by 10.194.129.137 with SMTP id nw9mr4625421wjb.13.1476188389585;
	Tue, 11 Oct 2016 05:19:49 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yo1sm6005196wjc.16.2016.10.11.05.19.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Oct 2016 05:19:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 13:19:43 +0100
Message-Id: <1476188384-16064-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] lib/oe/qa: add ELF machine to string function
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
X-List-Received-Date: Tue, 11 Oct 2016 12:19:51 -0000

Add a function (and test suite) to turn the ELF machine field (e_machine) into a
string, so we can tell the user "x86-64" instead of 0x3E.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/qa.py             | 20 ++++++++++++++++++++
 meta/lib/oe/tests/test_elf.py | 21 +++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/lib/oe/tests/test_elf.py

diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 75e7df8..fbe719d 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -144,6 +144,26 @@ class ELFFile:
             bb.note("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
             return ""
 
+def elf_machine_to_string(machine):
+    """
+    Return the name of a given ELF e_machine field or the hex value as a string
+    if it isn't recognised.
+    """
+    try:
+        return {
+            0x02: "SPARC",
+            0x03: "x86",
+            0x08: "MIPS",
+            0x14: "PowerPC",
+            0x28: "ARM",
+            0x2A: "SuperH",
+            0x32: "IA-64",
+            0x3E: "x86-64",
+            0xB7: "AArch64"
+        }[machine]
+    except:
+        return "Unknown (%s)" % repr(machine)
+
 if __name__ == "__main__":
     import sys
     elf = ELFFile(sys.argv[1])
diff --git a/meta/lib/oe/tests/test_elf.py b/meta/lib/oe/tests/test_elf.py
new file mode 100644
index 0000000..1f59037
--- /dev/null
+++ b/meta/lib/oe/tests/test_elf.py
@@ -0,0 +1,21 @@
+import unittest
+import oe.qa
+
+class TestElf(unittest.TestCase):
+    def test_machine_name(self):
+        """
+        Test elf_machine_to_string()
+        """
+        self.assertEqual(oe.qa.elf_machine_to_string(0x02), "SPARC")
+        self.assertEqual(oe.qa.elf_machine_to_string(0x03), "x86")
+        self.assertEqual(oe.qa.elf_machine_to_string(0x08), "MIPS")
+        self.assertEqual(oe.qa.elf_machine_to_string(0x14), "PowerPC")
+        self.assertEqual(oe.qa.elf_machine_to_string(0x28), "ARM")
+        self.assertEqual(oe.qa.elf_machine_to_string(0x2A), "SuperH")
+        self.assertEqual(oe.qa.elf_machine_to_string(0x32), "IA-64")
+        self.assertEqual(oe.qa.elf_machine_to_string(0x3E), "x86-64")
+        self.assertEqual(oe.qa.elf_machine_to_string(0xB7), "AArch64")
+
+        self.assertEqual(oe.qa.elf_machine_to_string(0x00), "Unknown (0)")
+        self.assertEqual(oe.qa.elf_machine_to_string(0xDEADBEEF), "Unknown (3735928559)")
+        self.assertEqual(oe.qa.elf_machine_to_string("foobar"), "Unknown ('foobar')")
-- 
2.8.1


