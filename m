Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7902C3DA40
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:55:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.217.1718121334527180044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 08:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HD36Sijv;
 spf=pass (domain: konsulko.com, ip: 209.85.210.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7041053c0fdso3070694b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 08:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718121333; x=1718726133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6DpzbFnKKsu8zLPch/cMaTLlmqtWQxhi2v6vbPfHAM=;
        b=HD36SijvuWqJmiexdufIt33ggqvTFHw9SKwHaC+iaOdPCa/BJTiu568281ccEi4REJ
         nw540n4MVCPLb+E/2kqWBOjOIuzGzqjj/JdpDEquHDmcy2IE5v58NxcgaSLorJLuxbF9
         6RX5CUUvw+MbvGCLc5KvtPeu6dPuqzKBsS+HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121333; x=1718726133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6DpzbFnKKsu8zLPch/cMaTLlmqtWQxhi2v6vbPfHAM=;
        b=dsN9n9Ge9DB17d9HGLbQq8zxKfPcUOm/EPqnpTnevrGT9wNIBCiAj5/UIUhSpPzPj/
         tan2s78kU/fCVfzTsmCXMXo6OYYn7Lso6aLgklPAq3UlwKpGEklh/BhBr6bdNAHNwG8a
         ZETQRrLHacgcEmXsecLSkUMjctnAw6rbJX5D+bzgSndaqRZLfOC0TqHWMs723pak3u2c
         W6PfLauRw1zpKq1K4FYUXiQXcNwCzHGBY1lnDvjZEmAxf4AT+9N3d7vIKX4eYDHsL02m
         kZxdJLWc+PNKnpC53JE3F4Ab9sHl6gZh3+d+VefYVp1WwySBsPneS8jRZAZuIPIhMIUB
         H8Nw==
X-Gm-Message-State: AOJu0YxpiUC94yK9tL3okssuVhc3CfZbrx9ym4KDMsxCI2jteAcxw/qB
	zGHYEhKhWMh3GUXXlnLylGn1/2vP8BsQ/hLZA3l4O+t8wpAHULsno0NeHeXCeiABwuGPlDRmCDr
	KaBU=
X-Google-Smtp-Source: AGHT+IEsufple8bTGDJTZeyRQig2Jh00LmrXt/xDeCjXXqBcXBn3JuLVor7pS4YnMYHy7yWs8onACQ==
X-Received: by 2002:a05:6a20:1002:b0:1a7:7ac1:a3ba with SMTP id adf61e73a8af0-1b2f9e1450fmr11162865637.53.1718121333144;
        Tue, 11 Jun 2024 08:55:33 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70599bcac14sm3425833b3a.1.2024.06.11.08.55.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:55:32 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/5] oe-selftest: add RECIPE_UPDATE_EXTRA_TASKS test
Date: Tue, 11 Jun 2024 08:55:15 -0700
Message-ID: <991123dcbcaa5a7459b19db7dd5c0f1fad682983.1718120117.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718120117.git.tim.orling@konsulko.com>
References: <cover.1718120117.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 15:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200543

From: Tim Orling <tim.orling@konsulko.com>

Add test_devtool_upgrade_recipe_update_extra_tasks test case
to test upgrade of python3-guessing-game from v0.1.0 to v0.2.0
which will exercise the update_crates task during the upgrade.

Add python3-guessing-game_git.bb.upgraded and
python3-guessing-game-crates.inc.upgraded  which are the 0.2.0
variants.

Check that the new recipe file has the expected differences.

Check that the new -crates.inc file has the expected differences,
which should be reproducible because of Cargo.lock.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  * Switch to git.yoctoproject.org url

 .../python3-guessing-game-crates.inc.upgraded | 88 +++++++++++++++++++
 .../python3-guessing-game_git.bb.upgraded     | 19 ++++
 meta/lib/oeqa/selftest/cases/devtool.py       | 46 ++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc.upgraded
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded

diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc.upgraded b/meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc.upgraded
new file mode 100644
index 00000000000..b19b42832d9
--- /dev/null
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc.upgraded
@@ -0,0 +1,88 @@
+# Autogenerated with 'bitbake -c update_crates python3-guessing-game'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/bitflags/2.5.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/indoc/2.0.5 \
+    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/lock_api/0.4.12 \
+    crate://crates.io/memoffset/0.9.1 \
+    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/parking_lot/0.12.3 \
+    crate://crates.io/parking_lot_core/0.9.10 \
+    crate://crates.io/portable-atomic/1.6.0 \
+    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/proc-macro2/1.0.84 \
+    crate://crates.io/pyo3/0.21.2 \
+    crate://crates.io/pyo3-build-config/0.21.2 \
+    crate://crates.io/pyo3-ffi/0.21.2 \
+    crate://crates.io/pyo3-macros/0.21.2 \
+    crate://crates.io/pyo3-macros-backend/0.21.2 \
+    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/redox_syscall/0.5.1 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/smallvec/1.13.2 \
+    crate://crates.io/syn/2.0.66 \
+    crate://crates.io/target-lexicon/0.12.14 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/unindent/0.2.3 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/windows-targets/0.52.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.5 \
+    crate://crates.io/windows_i686_gnu/0.52.5 \
+    crate://crates.io/windows_i686_gnullvm/0.52.5 \
+    crate://crates.io/windows_i686_msvc/0.52.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.5 \
+"
+
+SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[bitflags-2.5.0.sha256sum] = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
+SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[parking_lot-0.12.3.sha256sum] = "f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27"
+SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
+SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
+SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[proc-macro2-1.0.84.sha256sum] = "ec96c6a92621310b51366f1e28d05ef11489516e93be030060e5fc12024a49d6"
+SRC_URI[pyo3-0.21.2.sha256sum] = "a5e00b96a521718e08e03b1a622f01c8a8deb50719335de3f60b3b3950f069d8"
+SRC_URI[pyo3-build-config-0.21.2.sha256sum] = "7883df5835fafdad87c0d888b266c8ec0f4c9ca48a5bed6bbb592e8dedee1b50"
+SRC_URI[pyo3-ffi-0.21.2.sha256sum] = "01be5843dc60b916ab4dad1dca6d20b9b4e6ddc8e15f50c47fe6d85f1fb97403"
+SRC_URI[pyo3-macros-0.21.2.sha256sum] = "77b34069fc0682e11b31dbd10321cbf94808394c56fd996796ce45217dfac53c"
+SRC_URI[pyo3-macros-backend-0.21.2.sha256sum] = "08260721f32db5e1a5beae69a55553f56b99bd0e1c3e6e0a5e8851a9d0f5a85c"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
+SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+SRC_URI[redox_syscall-0.5.1.sha256sum] = "469052894dcb553421e483e4209ee581a45100d31b4018de03e5a7ad86374a7e"
+SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
+SRC_URI[syn-2.0.66.sha256sum] = "c42f3f41a2de00b01c0aaad383c5a45241efc8b2d1eda5661812fda5f3cdcff5"
+SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[windows-targets-0.52.5.sha256sum] = "6f0713a46559409d202e70e28227288446bf7841d3211583a4b53e3f6d96e7eb"
+SRC_URI[windows_aarch64_gnullvm-0.52.5.sha256sum] = "7088eed71e8b8dda258ecc8bac5fb1153c5cffaf2578fc8ff5d61e23578d3263"
+SRC_URI[windows_aarch64_msvc-0.52.5.sha256sum] = "9985fd1504e250c615ca5f281c3f7a6da76213ebd5ccc9561496568a2752afb6"
+SRC_URI[windows_i686_gnu-0.52.5.sha256sum] = "88ba073cf16d5372720ec942a8ccbf61626074c6d4dd2e745299726ce8b89670"
+SRC_URI[windows_i686_gnullvm-0.52.5.sha256sum] = "87f4261229030a858f36b459e748ae97545d6f1ec60e5e0d6a3d32e0dc232ee9"
+SRC_URI[windows_i686_msvc-0.52.5.sha256sum] = "db3c2bf3d13d5b658be73463284eaf12830ac9a26a90c717b7f771dfe97487bf"
+SRC_URI[windows_x86_64_gnu-0.52.5.sha256sum] = "4e4246f76bdeff09eb48875a0fd3e2af6aada79d409d33011886d3e1581517d9"
+SRC_URI[windows_x86_64_gnullvm-0.52.5.sha256sum] = "852298e482cd67c356ddd9570386e2862b5673c85bd5f88df9ab6802b334c596"
+SRC_URI[windows_x86_64_msvc-0.52.5.sha256sum] = "bec47e5bfd1bff0eeaf6d8b485cc1074891a197ab4225d504cb7a1ab88b02bf0"
diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
new file mode 100644
index 00000000000..f60a62718db
--- /dev/null
+++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
@@ -0,0 +1,19 @@
+SUMMARY = "The guessing game from The Rust Book using pyo3."
+DESCRIPTION = "Wrap a version of the guessing game from The Rust Book \
+to run in Python using pyo3."
+HOMEPAGE = "https://www.maturin.rs/tutorial"
+SECTION = "devel/python"
+LICENSE = "MIT & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
+                    file://LICENSE-MIT;md5=85fd3b67069cff784d98ebfc7d5c0797"
+
+SRC_URI = "git://git.yoctoproject.org/guessing-game.git;protocol=https;branch=main"
+
+PV = "0.2.0"
+SRCREV = "40cf004c2772ffa20ea803fa3be1528a75be3e98"
+
+S = "${WORKDIR}/git"
+
+inherit python_maturin cargo-update-recipe-crates
+
+require ${BPN}-crates.inc
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 1cafb922ea4..432d9c9a673 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2017,6 +2017,52 @@ class DevtoolUpgradeTests(DevtoolBase):
             newlines = f.readlines()
         self.assertEqual(desiredlines, newlines)
 
+    def test_devtool_upgrade_recipe_update_extra_tasks(self):
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        recipe = 'python3-guessing-game'
+        version = '0.2.0'
+        commit = '40cf004c2772ffa20ea803fa3be1528a75be3e98'
+        oldrecipefile = get_bb_var('FILE', recipe)
+        oldcratesincfile = os.path.join(os.path.dirname(oldrecipefile), os.path.basename(oldrecipefile).strip('_git.bb') + '-crates.inc')
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        # Check that recipe is not already under devtool control
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        # Check upgrade
+        result = runCmd('devtool upgrade %s %s --version %s --srcrev %s' % (recipe, tempdir, version, commit))
+        # Check if srctree at least is populated
+        self.assertTrue(len(os.listdir(tempdir)) > 0, 'srctree (%s) should be populated with new (%s) source code' % (tempdir, commit))
+        # Check new recipe file and new -crates.inc files are present
+        newrecipefile = os.path.join(self.workspacedir, 'recipes', recipe, os.path.basename(oldrecipefile))
+        newcratesincfile = os.path.join(self.workspacedir, 'recipes', recipe, os.path.basename(oldcratesincfile))
+        self.assertExists(newrecipefile, 'Recipe file should exist after upgrade')
+        self.assertExists(newcratesincfile, 'Recipe crates.inc file should exist after upgrade')
+        # Check devtool status and make sure recipe is present
+        result = runCmd('devtool status')
+        self.assertIn(recipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Check recipe got changed as expected
+        with open(oldrecipefile + '.upgraded', 'r') as f:
+            desiredlines = f.readlines()
+        with open(newrecipefile, 'r') as f:
+            newlines = f.readlines()
+        self.assertEqual(desiredlines, newlines)
+        # Check crates.inc got changed as expected
+        with open(oldcratesincfile + '.upgraded', 'r') as f:
+            desiredlines = f.readlines()
+        with open(newcratesincfile, 'r') as f:
+            newlines = f.readlines()
+        self.assertEqual(desiredlines, newlines)
+        # Check devtool reset recipe
+        result = runCmd('devtool reset %s -n' % recipe)
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
+
     def test_devtool_layer_plugins(self):
         """Test that devtool can use plugins from other layers.
 
-- 
2.45.2


