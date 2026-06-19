Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2368DCD98F6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 11:21:10 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40117.1781868058764630017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 04:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=jo7lpPwa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260619112053e1dd32973500020703-r70t5z@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260619112053e1dd32973500020703
        for <openembedded-core@lists.openembedded.org>;
        Fri, 19 Jun 2026 13:20:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8hBSUupES/9IOIW3UE+WOfTRpA2+ei+fNHoVm/3mSI4=;
 b=jo7lpPwaVTz0fsQAFSjejljcU34vLT2F3YXYP66KDDw2exwV4gm8d5ptcVlHZDiYxlxcFd
 tgg9G9XumXY93zGFb0CLISmn/b9pumxePDys5vF/GZAyhG2+gOOlzYttkgVi+cSXYf0JJNkB
 hQqOYRwEMIdeeNVkDtpAh3q56TnOqmvPnPzXITp4U/Zlf6hkZZ+H2k1EjGiW3HKt/0xHe1ZD
 M+rgfbtAzK6zNANg4Tj2kIyG4O9+PN7tcsmc8miw7GnzmZyVr9RQjaSaOEd0anCNKb6XHYiU
 QywdivXM/TDKHG99LHuwzLN9iKIUV04wL1TCk/QuPUgDxP/piwGdZSqQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 1/6] oe-selftest: fitimage: replace _gen_random_file with _gen_elf64_dummy
Date: Fri, 19 Jun 2026 13:17:09 +0200
Message-ID: <20260619112046.125876-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260619112046.125876-1-adrian.freihofer@siemens.com>
References: <20260619112046.125876-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 11:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239164

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Some boards (e.g. RK3399 with evb-rk3399_defconfig) use binman to build
U-Boot and require BL31 to be a structurally valid ELF file so binman can
parse the load/entry addresses. A plain random-byte file fails with
"Magic number does not match".

Add _gen_atf_tee_dummy_images(bb_vars) which generates both the ATF and
TEE dummy binaries when the corresponding bb_vars keys are set. Tests
will call this helper instead of duplicating the generate-and-path logic.

So far this is a refactoring without functional changes, but it will be
used in a follow-up commit when we are going to replace the beaglebone
MACHINE by other MACHINEs which require a structurally valid ELF for
BL31.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 82 ++++++++++++++++++------
 1 file changed, 63 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 34b248ee0b..2d3337aabd 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -110,9 +110,67 @@ class FitImageTestCase(OESelftestTestCase):
             ))
 
     @staticmethod
-    def _gen_random_file(file_path, num_bytes=65536):
-        with open(file_path, 'wb') as file_out:
-            file_out.write(os.urandom(num_bytes))
+    def _gen_elf64_dummy(file_path, load_addr=0x80000000):
+        """Generate a minimal valid ELF64 (ARM64, little-endian) file.
+
+        Some boards (e.g. RK3399) let binman parse BL31 as an ELF to extract
+        load/entry addresses.  A plain random binary fails ELF magic checks, so
+        we need a structurally valid ELF even for a dummy/fake binary.
+        """
+        import struct
+        payload = b'\x00' * 4
+        phoff = 64                    # program header immediately after ELF header
+        payload_off = phoff + 56      # after one ELF64 program header entry
+        elf_ident = (
+            b'\x7fELF'   # magic
+            + b'\x02'    # ELFCLASS64
+            + b'\x01'    # ELFDATA2LSB
+            + b'\x01'    # EV_CURRENT
+            + b'\x00' * 9  # OS/ABI + padding
+        )
+        elf_header = struct.pack(
+            '<HHIQQQIHHHHHH',
+            2,            # e_type  = ET_EXEC
+            0xb7,         # e_machine = EM_AARCH64
+            1,            # e_version = EV_CURRENT
+            load_addr,    # e_entry
+            phoff,        # e_phoff
+            0,            # e_shoff
+            0,            # e_flags
+            64,           # e_ehsize
+            56,           # e_phentsize
+            1,            # e_phnum
+            64,           # e_shentsize
+            0,            # e_shnum
+            0,            # e_shstrndx
+        )
+        ph = struct.pack(
+            '<IIQQQQQQ',
+            1,            # p_type  = PT_LOAD
+            5,            # p_flags = PF_R | PF_X
+            payload_off,  # p_offset
+            load_addr,    # p_vaddr
+            load_addr,    # p_paddr
+            len(payload), # p_filesz
+            len(payload), # p_memsz
+            0x1000,       # p_align
+        )
+        with open(file_path, 'wb') as f:
+            f.write(elf_ident + elf_header + ph + payload)
+
+    def _gen_atf_tee_dummy_images(self, bb_vars):
+        """Generate dummy ATF and TEE images when the corresponding variables are defined
+
+        This is needed for testing the presence of the corresponding nodes in the its file and the FIT image.
+        For arm64 this is more or less a hard dependency because the BL31 binary is needed for the build to succeed.
+        """
+        if bb_vars.get('UBOOT_FIT_ARM_TRUSTED_FIRMWARE') == "1":
+            dummy_atf = os.path.join(self.builddir, bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE'])
+            FitImageTestCase._gen_elf64_dummy(dummy_atf)
+
+        if bb_vars.get('UBOOT_FIT_TEE') == "1":
+            dummy_tee = os.path.join(self.builddir, bb_vars['UBOOT_FIT_TEE_IMAGE'])
+            FitImageTestCase._gen_elf64_dummy(dummy_tee)
 
     @staticmethod
     def _setup_native(native_recipe):
@@ -1765,14 +1823,7 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
             'UBOOT_FIT_TEE_IMAGE',
         ])
 
-        # Create an ATF dummy image
-        dummy_atf = os.path.join(self.builddir, bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE'])
-        FitImageTestCase._gen_random_file(dummy_atf)
-
-        # Create a TEE dummy image
-        dummy_tee = os.path.join(self.builddir, bb_vars['UBOOT_FIT_TEE_IMAGE'])
-        FitImageTestCase._gen_random_file(dummy_tee)
-
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
     def test_sign_standalone_uboot_atf_tee_fit_image(self):
@@ -1837,14 +1888,7 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
             'UBOOT_FIT_TEE_IMAGE',
         ])
 
-        # Create an ATF dummy image
-        dummy_atf = os.path.join(self.builddir, bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE'])
-        FitImageTestCase._gen_random_file(dummy_atf)
-
-        # Create a TEE dummy image
-        dummy_tee = os.path.join(self.builddir, bb_vars['UBOOT_FIT_TEE_IMAGE'])
-        FitImageTestCase._gen_random_file(dummy_tee)
-
+        self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
 
-- 
2.54.0


