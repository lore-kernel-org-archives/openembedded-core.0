Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C454879261
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 04:12:18 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f6-v6so2003292plo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 21:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K0SKnv9wAZmxxsKaLWRmTFJ7J4Q0/nYk4VqIJZefWAE=;
	b=D4Pw4V7z9sj4Xnb1RvP4iun6Yy4mbSS0WHE84v0CJpksogkWeJfhu8dSzM6SL/YLTq
	fMaRbqfQURhBrouasguJ9GRPVaaX/Rv/EOJdEF0v3KLUT/iGgelnWj7IrXie1lsUthii
	oBQ9IW/JqTwyWvoHXDp7APxDP07EvacsZKc06IM7MVt52qLUKpnPl8t1O8ZkkP53EPCZ
	jbRkj8jP5ZntGkrMnVREe1kuyYDiV6LpQ2cqirlACNN03RDkQieOPTjvUiVcQq6wn5qC
	YDjloGkRZ3KSvUOvIOmFwk+9xnv2LVp3aJiuwVquLY5HMWo3543UpNryIOuoNATDcw1a
	cMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K0SKnv9wAZmxxsKaLWRmTFJ7J4Q0/nYk4VqIJZefWAE=;
	b=CZxH9bLXDQdHc8DVz/f8wSubiPNvdDWPnvp8jkXE71LOCr+cUsVmdK76PUuivFF2nQ
	rVHmLXI06MHiKPennd08ssMBkF15Sbv/5O2gBF2EtFTxoLP2L5Z40stobMDYaazpUIlS
	7rz5ObSKu9MdaIlwmSruMltO7tUM6nG57pznQJgJ5IZOFdBz+ERAG0+VO0729zgGW1bX
	VOnZ2mQxgT6XQWrYIRfHIZ0eMvwKLGPCl9QUH1+Mey35Vvn3LEvtlkL6RjZUo0rEcw9Z
	ZWy8FE01jdvLkbyr/K+IY8ZKz/JcWiB4XntvzOzuGfeGKMVxBQqd/GnpHwFeGQa8tFNs
	0qqg==
X-Gm-Message-State: APzg51A7ICrB9Q9me/V4FFDMb3W19mUb0sBsmyyw8/H+9pwL1JwWv19Z
	nue0AxDqY4P6RH+7RcblisikNQX5
X-Google-Smtp-Source: ANB0VdYwD804imJSwGfmiRa4WD/WH0BWMZsE4AP0Kzh81ZdOGQ9wcj0o4ayc5/SLchL0gwEM7bAaRg==
X-Received: by 2002:a17:902:a507:: with SMTP id
	s7-v6mr5168516plq.303.1536811939172; 
	Wed, 12 Sep 2018 21:12:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm3742067pfy.156.2018.09.12.21.12.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Sep 2018 21:12:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 21:12:09 -0700
Message-Id: <20180913041209.33108-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH] insane: Recognise BPF as a valid EM_MACHINE type
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
X-List-Received-Date: Thu, 13 Sep 2018 04:12:19 -0000
Content-Transfer-Encoding: 8bit

BPF Linux ELF objects are generated with kernel-selftests with
>= 4.18 kernel and when clang is enabled which packages BPF objects
into packages, therefore recongnise this as a valid ELF target

Add a selftest for BPF

Do not flag BPF objects in target, since they pretty much will be ok for
most of kernels architectures we care do support BPF

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass               | 6 ++++--
 meta/lib/oe/qa.py                         | 3 ++-
 meta/lib/oeqa/selftest/cases/oelib/elf.py | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 8c360c83e7..4644221bc6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -301,8 +301,10 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     # Check the architecture and endiannes of the binary
     is_32 = (("virtual/kernel" in provides) or bb.data.inherits_class("module", d)) and \
-            (target_os == "linux-gnux32" or target_os == "linux-muslx32" or target_os == "linux-gnu_ilp32" or re.match('mips64.*32', d.getVar('DEFAULTTUNE')))
-    if not ((machine == elf.machine()) or is_32):
+            (target_os == "linux-gnux32" or target_os == "linux-muslx32" or \
+            target_os == "linux-gnu_ilp32" or re.match('mips64.*32', d.getVar('DEFAULTTUNE')))
+    is_bpf = (oe.qa.elf_machine_to_string(elf.machine()) == "BPF")
+    if not ((machine == elf.machine()) or is_32 or is_bpf):
         package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
                  (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
     elif not ((bits == elf.abiSize()) or is_32):
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 3231e60cea..59c72ce580 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -158,7 +158,8 @@ def elf_machine_to_string(machine):
             0x2A: "SuperH",
             0x32: "IA-64",
             0x3E: "x86-64",
-            0xB7: "AArch64"
+            0xB7: "AArch64",
+            0xF7: "BPF"
         }[machine]
     except:
         return "Unknown (%s)" % repr(machine)
diff --git a/meta/lib/oeqa/selftest/cases/oelib/elf.py b/meta/lib/oeqa/selftest/cases/oelib/elf.py
index 74ee6a11cc..15c03f4609 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/elf.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/elf.py
@@ -15,6 +15,7 @@ class TestElf(TestCase):
         self.assertEqual(oe.qa.elf_machine_to_string(0x32), "IA-64")
         self.assertEqual(oe.qa.elf_machine_to_string(0x3E), "x86-64")
         self.assertEqual(oe.qa.elf_machine_to_string(0xB7), "AArch64")
+        self.assertEqual(oe.qa.elf_machine_to_string(0xF7), "BPF")
 
         self.assertEqual(oe.qa.elf_machine_to_string(0x00), "Unknown (0)")
         self.assertEqual(oe.qa.elf_machine_to_string(0xDEADBEEF), "Unknown (3735928559)")
-- 
2.19.0


