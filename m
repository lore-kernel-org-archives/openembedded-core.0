Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191FBC83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 09:16:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.12626.1693473393384359329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 02:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CVukTNmd;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: bbara93@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-401b5516104so5116815e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693473391; x=1694078191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=copuCXMIx9lb2u/Jw2fu7PyYramxMgMYWr3a/fD3gKk=;
        b=CVukTNmdzHMCUPIBpWreAx1BnPo8RriHhFvfRbbAN/gxtDM9H7O8m99mdXjeFw1mEf
         4N2uEbq4y4T9v9+4rVDW9l5pbz7pzsC5bPzA8jBnnDpi2FX7cIQoK1cjkB/YhTdE8933
         WO9NWKSljnCX6EOGgbx6J2D0YBnyEnqW251m59Y7XEU3tGbPE2z2N/hCG4Ep6brL8bJ5
         cd+8e7kiPHPZSkb7G/XM48ynPUIdmIgX5GNdE1IuqoEF1lm8s+g/QRHLZ7ihbwY2TFV+
         f2fr45GNltDbIM/85O0oz1ff9g6y4C6MgCKtpidFEG8DeC04ehfmv+wXg7MNpr5PYJWF
         5Fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693473391; x=1694078191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=copuCXMIx9lb2u/Jw2fu7PyYramxMgMYWr3a/fD3gKk=;
        b=Cr1NWupNah8nW7dX3Co+jYCzq4tTAcUCj5HtphIYVjZx7ZB1baCH6qU4ssl0PKHiMp
         kEOxSvncWh3y5TOpvmIb1gU5wKpHXrmbhv9+/c86xT/m5btWaL257LtPdMBlHL62Xm3M
         J1CAT8hRayEu2MSxK3191wUEw822U9Nvex+vypEZ8AhrDYqtQruw02qcPGoGtfd7+1FU
         ACYuIPUxvp9hDQ8E4oYQNlIznNS/8en/8HuROHWadLbhgUCdFX1X175rrUcMWUJWYKZe
         MWNoRQeKH6fMRLr6PQEHBzQ3V87ACdhdTmb2b2qSm7htr61wyR30sh0vN5f3LY621iuh
         V9bA==
X-Gm-Message-State: AOJu0YzcVn1BcSK5sptNQB+uBSMITdWat0NskbvPRN7v3WjdpIVrMwUJ
	/4unusZjoHZC7tDBgOLl/Pp3IiZ7MmJmDg==
X-Google-Smtp-Source: AGHT+IE9A+e1sbjtqGtmRiWKI9jhIETqeXol+2tBa3zAajdCL2GcFTRCw8GZ0gO8wOgI75skWObRTQ==
X-Received: by 2002:a05:600c:2298:b0:400:6b36:ee2a with SMTP id 24-20020a05600c229800b004006b36ee2amr3625793wmf.26.1693473390868;
        Thu, 31 Aug 2023 02:16:30 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f17-20020a5d4dd1000000b003198a9d758dsm1527250wru.78.2023.08.31.02.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 02:16:30 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH] insane.bbclass: introduce SIGILL finder
Date: Thu, 31 Aug 2023 11:16:18 +0200
Message-Id: <20230831091618.3715995-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 09:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186965

From: Benjamin Bara <benjamin.bara@skidata.com>

This commit should look for unsupported instructions depending on the
active tune features. For now, it checks for vfpv3d16 and other non-neon
machines, but it can be easily extended for other architectures/checks.

Reason for this check is that a couple of packages assume neon support
for armv7, but it is actually optional.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Hi,

as I lately played a little bit around with a vfpv3d16 machine and some
multimedia packages, I stumbled across a couple of illegal instructions
during runtime. Therefore I decided to hack a QA job which should find
these during package time. Not sure if this is the correct location to
do such a check and if this is something needed at all...

Regards,
Benjamin
---
 meta/classes-global/insane.bbclass | 78 +++++++++++++++++++++++++++++-
 meta/lib/oe/qa.py                  | 34 +++++++++++++
 2 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 2e53778934..5b9112d05c 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -44,7 +44,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             configure-gettext perllocalpod shebang-size \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
-            useless-rpaths rpaths staticdev empty-dirs \
+            useless-rpaths rpaths staticdev empty-dirs sigill \
             patch-fuzz \
             "
 # Add usrmerge QA check based on distro feature
@@ -635,6 +635,82 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
                     'Suppress with INSANE_SKIP = "32bit-time"'
                 )
 
+QAPATHTEST[sigill] = "package_qa_check_sigill"
+def package_qa_check_sigill(path, name, d, elf, messages):
+    """
+    Check that the package doesn't contain unsupported instructions.
+    """
+    import re
+
+    if not elf:
+        return
+
+    if os.path.islink(path):
+        return
+
+    def test_skeleton(grep, test):
+        dump = elf.run_filtered_objdump_unstripped("-d", grep, d, name)
+        if dump == 'stripped':
+            # stripped binaries might give false positives
+            return
+
+        # get all instructions and registers from the disassembled binary
+        instr_list = []
+        regs_list = []
+        for line in dump.split("\\n"):
+            splitted = dump.split("\\t")
+            if len(splitted) < 3:
+                continue
+            # 0 is just empty, as line starts with \t
+            instr_list.append(splitted[1])
+            regs_list.append(splitted[2])
+
+        # loop through instr+regs list and apply the given test function
+        uniques = set()
+        for index, regs in enumerate(regs_list):
+            instr = instr_list[index]
+            affected = test(instr, regs)
+            if affected:
+                uniques.add(f"{instr} {regs}")
+
+        for instr_regs in uniques:
+            oe.qa.add_message(messages, "sigill", "%s contains %s" % (path, instr_regs))
+
+    features = d.getVar('TUNE_FEATURES')
+    if "vfpv3d16" in features:
+        # grep for d16-d31, d0-d15 are valid for f64 instructions
+        vfpv3d16_grep = "f64\s+(d1|d2|d3)"
+
+        def vfpv3d16_test(instr, regs):
+            for reg in re.findall(r'd(\d+)', regs):
+                return int(reg) >= 16
+
+        test_skeleton(vfpv3d16_grep, vfpv3d16_test)
+
+    if "armv7a" in features and "neon" not in features:
+        # https://developer.arm.com/documentation/den0018/a/NEON-and-VFP-Instruction-Summary/List-of-all-NEON-and-VFP-instructions
+        neon_instrs = ["vq?r?shl", "vq?abs", "vq?add", "vq?movn", "vq?sub",
+                       "vr?addhn", "vr?hadd", "vr?shrn?", "vr?sra", "vr?subhn",
+                       "vabal?", "vabdl?", "vacge", "vacgt", "vacle", "vaclt",
+                       "vaddl", "vaddw", "vand", "vbic", "vbif", "vbit", "vceq",
+                       "vcge", "vcgt", "vcle", "vcls", "vclt", "vclz", "vcnt",
+                       "vdup", "veor", "vext", "vhsub", "vmax", "vmin", "vmlal",
+                       "vmlsl", "vmov2", "vmovl", "vmull", "vmvn", "vqneg",
+                       "vorn", "vorr", "vpadal", "vpaddl?", "vpmax", "vpmin",
+                       "vqr?dmulh", "vqr?shru?n", "vqdmlal", "vqdmlsl",
+                       "vqdmull", "vqmovun", "vqshl", "vqshlu", "vcrecpe",
+                       "vcrecps", "vrev", "vrsqrte", "vrsqrts", "vshl", "vshll",
+                       "vsli", "vsri", "vsubl", "vsubw", "vswp", "vtbl", "vtbx",
+                       "vtrn", "vtst", "vuzp", "vzip"]
+        # most of them are only NEON when the used data type isn't floating-point
+        neon_grep = "\s(" + "|".join(neon_instrs) + ")\.(s|u|p)"
+
+        def neon_test(instr, regs):
+            # if something is found by the grep, the package is affected
+            return True
+
+        test_skeleton(neon_grep, neon_test)
+
 # Check license variables
 do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
 python populate_lic_qa_checksum() {
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index de980638c4..075622c98f 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -157,6 +157,40 @@ class ELFFile:
             bb.note("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
             return ""
 
+    def run_filtered_objdump_unstripped(self, cmd, filter, d, pn):
+        import bb.process
+        import sys
+
+        objdump = d.getVar('OBJDUMP')
+
+        # we require the unstripped binary here, as objdump might have problems
+        # detecting the correct instruction format, which leads to false positives
+        name = self.name.replace(d.getVar('PKGDEST') + '/' + pn, d.getVar('D'))
+
+        env = os.environ.copy()
+        env["LC_ALL"] = "C"
+        env["PATH"] = d.getVar('PATH')
+
+        # ensure that binary is unstripped
+        try:
+            bb.note("file %s" % (name))
+            output = bb.process.run(["file", name], env=env, shell=False)[0]
+            if ", stripped" in output:
+                return "stripped"
+        except Exception as e:
+            bb.note("file %s failed: %s" % (name, e))
+            return ""
+
+        try:
+            bb.note("%s %s %s | grep -E %s" % (objdump, cmd, name, filter))
+            objdump_proc = bb.process.Popen([objdump, cmd, "--no-addresses", "--no-show-raw-insn", name], env=env, shell=False)
+            grep_proc = bb.process.Popen(["grep", "-E", filter], env=env, shell=False, stdin=objdump_proc.stdout)
+            objdump_proc.stdout.close()
+            return str(grep_proc.communicate()[0])
+        except Exception as e:
+            bb.note("%s %s %s failed: %s" % (objdump, cmd, name, e))
+            return ""
+
 def elf_machine_to_string(machine):
     """
     Return the name of a given ELF e_machine field or the hex value as a string
-- 
2.34.1


