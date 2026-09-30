Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6791ACA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:44:05 +0000 (UTC)
Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18112.1790786323669537098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=m7zxNBDz;
 spf=pass (domain: baylibre.com, ip: 74.125.230.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-917912f0b95so15417836d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786322; x=1791391122; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wo2WWA5mH75RNnzitZhIWqBZ5D+JzSUJ7l6oRur6pSo=;
        b=m7zxNBDzIixwaJAQAV7Qut/J6LJuzOz2bMo/7ljDJY/4hwSqC3ddIFaoWGJxEtZa9u
         zegy1PqVRzeK3u5pzxywgZq+3Ns9uSLs+1YfmADFFTq+vsgN475QChU+Mgu57/rkkYe9
         Uv/jlyPZppll+S5MSsQA5fVX5qI0AJejVq1vYdLuBN/3AleB2Y2LNTqPRUL7V7gLs145
         iYm3pis65IH1fS44WKUJ8/FLedXFsSXxfT0YvKlrsMwe+UGTde6rEkX6wmOo6bG+knt1
         GCHpXs1/uhvEyYCBqwK2pR+sqUcmhF/yZS2wD3Ut8BvAn/yOFCm7EM4S6TATORP7iG72
         K2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786322; x=1791391122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wo2WWA5mH75RNnzitZhIWqBZ5D+JzSUJ7l6oRur6pSo=;
        b=me2HI5uMX2b7lewWoFeEYjk5MKETLqxaHbnhoMgpgI2xMBEID5CoidUqM9TUHt0gJl
         huY8kYEn3dJJIQ21ejpTsFUfmfJZ+eCo6/r6vyfHwvJYmQcNjVWWQNfY66ga2G4FDw0u
         VZwlLBhwDeioVDUbELmcWaLdVzJlJdcWCPdzZ4qdUd7Bgb/O7BRocyRvhmXq8jVnr3RE
         lI5umbqolAJdBihWpB8ELNZvMzfIl9NDgBh16ki6f+4iZfNrIo+FQB2ezJQs88bvDHJI
         iLiTjvvEPOWVqlwI92+OFh8xhEFuV2qxZelW9YiObz99PqYvJ/sjUlyb9/bhVIY99zEe
         Bklw==
X-Gm-Message-State: AFuF++nD8r4H2wGusSpt4AfY67nkFptW43izunh7qwRUMtVMwvjLIHp7
	DIpub3659+ZoZypflREHa2sLL63IwtgpKVjnUI++u6BCpHfnOfzlff/3BiRKdtFikoI/phaQ3wl
	ENrNc
X-Gm-Gg: AYBFou0LDKMQjESJ80O5VqRKMPZrHJ7pi6Zl+i5TNGhaBzaf8aXYGCOqfuopUJtuuZO
	bTP0uqirEW/8qlq87KCJeir1ehrWP5GsobtRBW5WX10ilVXyTULSd2lwHs1C8C3lFQeF6NNmfUf
	wJeJbfmexdvtaQ9qjiCHtbOqPYoRTVIHzFuPCKHGKufItLoQSh9LI4frn1EM+XgRU4ASiiah/Tm
	a/dVoNVjJH3xukeDeDMwBNc7txGrHA42hKDjM+yntwPDHrpFbv+BNHqNKGhlDoihvq9pf+treig
	83gvsV/+P5WvksmxLVqbaexHkQKvUUg6YSqrO965qYfmL2z6q2i8j0ELmoeUxh3iXkro1ZKCKZD
	xz+o031+qv1M2SwwUG/ZRAtcH4hrXcypQF8jPXMhA84VShycJo3qz1G5+3qicMq/D1162lZ2uWH
	0rPZ648zOTTwVmitBXNRWjASYjNA+mOsZ/ckF1aZYJK9uLev9AWaVRj+NH4O8DXdC4nxAg+Rb6g
	AQ/9/54CCnEbBlnWM4SrPSD9Cwow3c6DcrOdA4/9hs=
X-Received: by 2002:ad4:5cc1:0:b0:910:3453:8f28 with SMTP id 6a1803df08f44-917a0ec3091mr32454886d6.36.1790786322638;
        Wed, 30 Sep 2026 09:38:42 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:41 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:23 -0400
Subject: [OE-core][PATCH RFC v2 19/19] selftest: cases: add riscvtune.py
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-19-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246999

Add a test suite to ensure that all RISC-V tunes (default or 'unusual')
yield valid pkgarch combinations and that PACKAGES_EXTRA_ARCHS lists
only compatible tunings.

AI-Generated: Uses Claude Opus 5.5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/riscvtune.py | 96 +++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/riscvtune.py b/meta/lib/oeqa/selftest/cases/riscvtune.py
new file mode 100644
index 0000000000..2716b5bd02
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/riscvtune.py
@@ -0,0 +1,96 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oe.tune import riscv_implied, riscv_isa_to_tune
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
+
+class RiscvTuneTests(OESelftestTestCase):
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        cls.orig_machine = get_bb_var('MACHINE')
+
+    def machine_config(self, machine):
+        # Builds set up by bitbake-setup select the machine with a builtin
+        # fragment, which is fatal alongside a MACHINE assignment, so drop it
+        return 'OE_FRAGMENTS:remove = "machine/%s"\nMACHINE = "%s"\n' % (self.orig_machine, machine)
+
+    def test_riscv_default_tunes(self):
+        """
+        Parse every RISC-V tune and check it yields a usable package arch, and
+        that PACKAGE_EXTRA_ARCHS only lists archs of other tunes whose
+        extensions are all available in this one.
+        """
+        self.write_config(self.machine_config('qemuriscv64'))
+        tunes = get_bb_var('AVAILTUNES').split()
+
+        vars = {}
+        for tune in tunes:
+            machine = 'qemuriscv32' if 'riscv32' in tune else 'qemuriscv64'
+            self.write_config(self.machine_config(machine) + 'DEFAULTTUNE = "%s"\n' % tune)
+            vars[tune] = get_bb_vars(['TUNE_FEATURES', 'TUNE_PKGARCH', 'PACKAGE_EXTRA_ARCHS', 'PACKAGE_ARCHS'])
+
+        pkgarch_features = {v['TUNE_PKGARCH']: set(v['TUNE_FEATURES'].split()) for v in vars.values()}
+
+        for tune, v in vars.items():
+            with self.subTest(tune=tune):
+                self.assertTrue(v['TUNE_FEATURES'], 'empty TUNE_FEATURES')
+                self.assertTrue(v['TUNE_PKGARCH'], 'empty TUNE_PKGARCH')
+                self.assertIn(v['TUNE_PKGARCH'], v['PACKAGE_ARCHS'].split())
+                # sstate/package names get unwieldy past this
+                self.assertLessEqual(len(v['TUNE_PKGARCH']), 64, v['TUNE_PKGARCH'])
+
+                features = set(v['TUNE_FEATURES'].split())
+                features |= riscv_implied(features)
+                for arch in v['PACKAGE_EXTRA_ARCHS'].split():
+                    self.assertIn(arch, pkgarch_features, '%s is not the package arch of any tune' % arch)
+                    self.assertLessEqual(pkgarch_features[arch], features, '%s needs extensions %s lacks' % (arch, tune))
+
+        # Profile tunes are named after the profile
+        for profile in ['rva20u64', 'rva22u64', 'rva23u64']:
+            self.assertEqual(vars[profile]['TUNE_PKGARCH'], profile + '_zifencei')
+
+        # Legacy tune names behave exactly like the tunes they alias
+        for alias, target in [('riscv64', 'riscv64gc'), ('riscv32', 'riscv32gc')]:
+            with self.subTest(alias=alias):
+                self.assertIn(alias, tunes)
+                self.assertEqual(vars[alias], vars[target])
+
+    def test_riscv_unusual_tunes(self):
+        """
+        Define custom tunes with unusual extension combinations, as a BSP
+        might, and check each one builds: the sanity checks accept the
+        package arch, gcc and binutils accept the -march string, and the
+        package arch fits in the sstate object names.
+        """
+        def profile(name, drop=None):
+            return ' '.join(f for f in riscv_isa_to_tune(name).split() if f != drop) + ' zifencei'
+        tunes = {
+            # no float (lp64 ABI), with bitmanip
+            'rv64-nofloat-bitmanip': riscv_isa_to_tune('rv64imac_zicsr_zifencei_zba_zbb_zbs'),
+            # no profile, scalar extensions on top of gc
+            'rv64gc-scalar-extras': riscv_isa_to_tune('rv64gc_zicbom_zicboz_zicond_zfa_zfhmin'),
+            # profile plus vector crypto extensions
+            'rva20-vector-crypto': profile('rva20u64') + ' v zvbb zvkt',
+            # a profile missing one extension, falling back to the previous one
+            'rva22-no-zkt': profile('rva22u64', 'zkt'),
+            # rva23u64 without the full vector extension
+            'rva23-no-v': profile('rva23u64', 'v'),
+        }
+
+        config = self.machine_config('qemuriscv64')
+        for tune, features in tunes.items():
+            config += 'AVAILTUNES += "%s"\n' % tune
+            config += 'TUNE_FEATURES:tune-%s = "%s"\n' % (tune, features)
+            config += 'PACKAGE_EXTRA_ARCHS:tune-%s = "${TUNE_RISCV_PKGARCH}"\n' % tune
+
+        for tune in tunes:
+            with self.subTest(tune=tune):
+                self.write_config(config + 'DEFAULTTUNE = "%s"\n' % tune)
+                # small, and compiled with TUNE_CCARGS. It has no do_build, and
+                # populate_sysroot also writes an sstate object.
+                bitbake('libgcc-initial -c populate_sysroot')

-- 
2.55.0


