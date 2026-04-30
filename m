Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A861DFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 08:39:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15626.1777538357486244359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 01:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mUgTci7z;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so10807975e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 01:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777538356; x=1778143156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sytjo+aW5L0sUrULehWZ3qc+2FYRN8Kk/KxFWpPnpig=;
        b=mUgTci7zHSWZj/yjFHGNre9PEd3u1QjyarqSqfvvlUOURHk8GsQ4FtoLi3/PC9LaTX
         N+C3hB+dGPkJufTsVDrKHv6KO6dRXm+vbTSC6/58S5lEbxaEPwpYRVgf9k0gFgoVfwyo
         AeRaplQfQmzapVjhsCugSvxUeoKAf7iM14GP0+JMS9RxtY3M0e2B2jiu/kbU7LQ6io6M
         hBCDpcebuieifdhlYxF70G3z2pK9zl6E+9k5g7DDyaOiQEjL/tfO6JFSFkbV8la61O/V
         ZCV1D0gqmc3OjK/resuiE4AtDfFQn65vUrSv+85ne8/rytAFGo6rRmZI9KASG29ZNSUG
         VY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538356; x=1778143156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sytjo+aW5L0sUrULehWZ3qc+2FYRN8Kk/KxFWpPnpig=;
        b=UaV+qFli+AhVrEIpFwrFd8XYMHs+YxL+bzxdsdjZ+BlxwAotoomMsvL+btxsAJmVUY
         5rvRNPV9M/S1/PqP5aW5YvQqcfBKndiv+iKFGaZnmJhy7LIJr8jk8optCdGMu2hyTdOf
         nwHuqVIzet6oTwRPtcfQx9cVRlquM+wsqaG5HrbyxREaq4ah7YvuqjnDXjenk6XUKwFq
         j81sIoEUda/Q42kfXq7MU96rPpWgCSzO/zrUQjgHuuCmDVqP4Drql8cqamNj+UjasbGy
         OJvsbvDay/zuNIQlG9SEd+SxS7ctsxHdra1OPAEDMBBtszgXdt82ff1t0nWt9qajutnG
         7LuQ==
X-Gm-Message-State: AOJu0YzdptllcHzFcClqdwnUCtrgUNlSbLJ5kX5ivyA/UicztJ44EsCE
	t5ipNA71iEn8vablxTUkEOve+MdyESAVdmKHig5NlZylYT9ngZI9PktjMVuY43AnZII=
X-Gm-Gg: AeBDievhTURsu7uiXk8uY538ODvjIyJ2WAqGpozkfcViUjve+wGYXH0ZPzJI/nID4bP
	DnIgawWGvHP/e8olgMx2FHHIsu/GFf32k8hNZHwTYyScWt/80sO6CCN2mXyqs+Pl+Ibp92G64hy
	5DtO2fW/TxmaZinkBsJhmaDwfhDXzuJWS44TsYKaLoqnpKU9sEHoAwixqaX8dURMKogfjGnTeZH
	fExQMgwbddMguHkFSraw2oKAsB9HSr1X4AviaMh4rDChCOYajeGdeLv+e2Ht0AFbx1d9bmqmZUk
	5VnD8WU9CNZ7koSfLwNHKIk+Fn2jgN//m0/ftGyN+UQ0wXpH//zyEcZnDlHPgHfqH45WC53Exvd
	4h7VVTYfAao7l9lDYKn6lQxcLV3FA/HeFEuhdANsD//GyYr9pJcC+MoaXL0HiBfaNR1wqtLbKgk
	KPB+kBI/TMrrzkoeZJILkGD2jfh+mvrZ9lZI18rUL5FRhIRItUrFQNHC05D1jgFYfQqwMA7/Ki+
	lUvkOM=
X-Received: by 2002:a05:600c:699b:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-48a8446d81emr34397835e9.15.1777538355422;
        Thu, 30 Apr 2026 01:39:15 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([45.12.242.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822be902sm57521485e9.6.2026.04.30.01.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:39:15 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH 2/2] image_types_wic: add selftests for do_rootfs_wicenv hash safety
Date: Thu, 30 Apr 2026 09:39:05 +0100
Message-Id: <20260430083905.2967342-2-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430083905.2967342-1-sam.john.kent@gmail.com>
References: <20260430083905.2967342-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 08:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236145

Add WicEnvHashTests to the wic selftest suite to cover the fix for
bug 15662:

 - test_bblayers_excluded_from_task_hash: static check via tinfoil that
   BBLAYERS appears in do_rootfs_wicenv[vardepsexclude].

 - test_hash_does_not_change_when_empty_layer_added_to_bblayers: runs
   with -S none, adds a layer containing no wic plugins, and asserts the
   sigdata hash is unchanged.

 - test_hash_changes_when_wic_plugin_added_to_layer: the inverse — adds
   a layer that contains a wic plugin and asserts the hash does change.

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 111 +++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 4e94f4d..174e57d 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -17,14 +17,13 @@ import filecmp
 
 from glob import glob
 from shutil import rmtree, copy
-from tempfile import NamedTemporaryFile
-from tempfile import TemporaryDirectory
+from tempfile import NamedTemporaryFile, TemporaryDirectory, mkdtemp
 from textwrap import dedent
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotArch
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu, create_temp_layer
 
 
 def extract_files(debugfs_output):
@@ -2300,3 +2299,109 @@ class ModifyTests(WicTestCase):
         # check if it's removed
         result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
         self.assertNotIn('etc', [line.split()[-1] for line in result.output.split('\n') if line])
+
+
+class WicEnvHashTests(OESelftestTestCase):
+    """Tests for do_rootfs_wicenv task hash safety (bug 15662)."""
+
+    def setUpLocal(self):
+        super(WicEnvHashTests, self).setUpLocal()
+        self.topdir = get_bb_var('TOPDIR')
+
+    def _fresh_tmpdir(self, name):
+        """Return a clean TMPDIR path under TOPDIR, removing any prior contents."""
+        import shutil
+        path = os.path.join(self.topdir, name)
+        if os.path.exists(path):
+            shutil.rmtree(path)
+        self.track_for_cleanup(path)
+        return path
+
+    def _get_task_sigdata_hash(self, tmpdir, taskname):
+        """Return the sigdata hash for taskname; fail if no match found."""
+        matches = []
+        for root, _, files in os.walk(os.path.join(tmpdir, 'stamps')):
+            for f in files:
+                if taskname in f and '.sigdata.' in f:
+                    matches.append(f.rsplit('.sigdata.', 1)[-1])
+        self.assertGreater(len(matches), 0,
+                           "No %s sigdata file found in %s" % (taskname, tmpdir))
+        return matches[0]
+
+    def test_bblayers_excluded_from_task_hash(self):
+        """BBLAYERS must appear in do_rootfs_wicenv[vardepsexclude]."""
+        import bb.tinfoil
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            d = tinfoil.parse_recipe('core-image-minimal')
+            vardepsexclude = (d.getVarFlag('do_rootfs_wicenv', 'vardepsexclude') or '').split()
+
+        self.assertIn('BBLAYERS', vardepsexclude,
+                      "BBLAYERS is not in do_rootfs_wicenv[vardepsexclude]; "
+                      "host paths will change the task hash across workspaces")
+
+    def test_hash_does_not_change_when_empty_layer_added_to_bblayers(self):
+        """Adding an empty layer to BBLAYERS must not change the do_rootfs_wicenv hash."""
+        tmpdir1 = self._fresh_tmpdir('tmp-wicenv-hash1')
+        self.write_config(
+            'TMPDIR = "%s"\n'
+            'BB_SIGNATURE_HANDLER = "OEBasicHash"\n'
+            'IMAGE_FSTYPES += "wic"\n' % tmpdir1
+        )
+        bitbake('core-image-minimal -c do_rootfs_wicenv -S none')
+        hash_before = self._get_task_sigdata_hash(tmpdir1, 'do_rootfs_wicenv')
+
+        # Add a layer with no wic plugins — changes BBLAYERS but must not change the hash.
+        templayerdir = mkdtemp(prefix='selftest-wicenv-')
+        self.track_for_cleanup(templayerdir)
+        create_temp_layer(templayerdir, 'selftestwicenvhash')
+        runCmd('bitbake-layers add-layer %s' % templayerdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % templayerdir)
+
+        tmpdir2 = self._fresh_tmpdir('tmp-wicenv-hash2')
+        self.write_config(
+            'TMPDIR = "%s"\n'
+            'BB_SIGNATURE_HANDLER = "OEBasicHash"\n'
+            'IMAGE_FSTYPES += "wic"\n' % tmpdir2
+        )
+        bitbake('core-image-minimal -c do_rootfs_wicenv -S none')
+        hash_after = self._get_task_sigdata_hash(tmpdir2, 'do_rootfs_wicenv')
+
+        self.assertEqual(hash_before, hash_after,
+                         "do_rootfs_wicenv hash changed after adding an empty layer to "
+                         "BBLAYERS even though no wic plugins changed (bug 15662)")
+
+    def test_hash_changes_when_wic_plugin_added_to_layer(self):
+        """Adding a layer that contains a wic plugin must change the do_rootfs_wicenv hash."""
+        tmpdir3 = self._fresh_tmpdir('tmp-wicenv-hash3')
+        self.write_config(
+            'TMPDIR = "%s"\n'
+            'BB_SIGNATURE_HANDLER = "OEBasicHash"\n'
+            'IMAGE_FSTYPES += "wic"\n' % tmpdir3
+        )
+        bitbake('core-image-minimal -c do_rootfs_wicenv -S none')
+        hash_before = self._get_task_sigdata_hash(tmpdir3, 'do_rootfs_wicenv')
+
+        # Add a layer that contains a wic plugin — must change the hash.
+        templayerdir = mkdtemp(prefix='selftest-wicenv-plugin-')
+        self.track_for_cleanup(templayerdir)
+        create_temp_layer(templayerdir, 'selftestwicenvplugin')
+        plugin_dir = os.path.join(templayerdir, 'lib', 'wic', 'plugins', 'source')
+        os.makedirs(plugin_dir)
+        with open(os.path.join(plugin_dir, 'selftest_dummy.py'), 'w') as f:
+            f.write('# selftest dummy wic source plugin\n')
+        runCmd('bitbake-layers add-layer %s' % templayerdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % templayerdir)
+
+        tmpdir4 = self._fresh_tmpdir('tmp-wicenv-hash4')
+        self.write_config(
+            'TMPDIR = "%s"\n'
+            'BB_SIGNATURE_HANDLER = "OEBasicHash"\n'
+            'IMAGE_FSTYPES += "wic"\n' % tmpdir4
+        )
+        bitbake('core-image-minimal -c do_rootfs_wicenv -S none')
+        hash_after = self._get_task_sigdata_hash(tmpdir4, 'do_rootfs_wicenv')
+
+        self.assertNotEqual(hash_before, hash_after,
+                            "do_rootfs_wicenv hash did not change after adding a layer "
+                            "with a wic plugin — file-checksums tracking is not working")
-- 
2.34.1


