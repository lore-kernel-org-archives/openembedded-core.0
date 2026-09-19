Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813C6C982DA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:06:44 +0000 (UTC)
Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16985.1789842349623761505
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 11:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tEnGyD1u;
 spf=pass (domain: gmail.com, ip: 74.125.228.99, mailfrom: thefireking@gmail.com)
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so2288086a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 11:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789842348; x=1790447148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7xps0eyiR8GqaQS7kE+miZ/7bm2WgJpJgk2OvA+3Og=;
        b=tEnGyD1uDyU6PQeDSpgcGGbU9wfJMyb+qO/yMFgnwi3NXhLKHpNZlwQhLR8fN9OHa+
         5oV0VSBhY0CRAgumpy90UNftpfYUcyYitjOUiZJ0wf9nb1IgBTX8iN60G615eXock3Wz
         jFtmpObzLck6Dpp58CtnBMm3DHfJc4ynVyBiYmeu3KB1VmLIbHiW0DQ/kDmsqafm3lqV
         G7Cs45W1WV0s8PlOiu/VqwSxdHW85xkOpeA2YcWuHUuxoK32Dso/0z8y59bQuN417QWr
         e0460SNI376NTBKpWbJoxtHVeTo47UL68DdSdB2NB8PAnoElQqOZYQ3blJVoO3rt37dM
         BB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789842348; x=1790447148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7xps0eyiR8GqaQS7kE+miZ/7bm2WgJpJgk2OvA+3Og=;
        b=CEDFC/fKIsh8C49fvWnM0DxdQqYR4xCAwm4lGLe6QdtxFvOmDtR7s4nrVrk0KeERkA
         B2ftCvIDMXGlSlEgRg/UYplUnQIRVQM4JlH8RZ07ZQHIdkL+vT+r7zaiPVkDT3oq6ZPJ
         mqFKxlmIBZG7YSfdKVNWtSkxz1/lAYbHA4FHCe7MfPgBV7XhmrEMg3xuIWVYujk8oX4/
         iX/B0a030nkjMDREC1D7zxBrQnpcEjt7CF88U0bMBQJPmIZRmOz4KoXEYLtk/hKLYdo7
         YdJA7q1U6+MNFcauz7zh7xv8QCtFtxGc/dhLe3tDbshvrPnkFTtc3H42wi0/4P766ido
         z7tw==
X-Gm-Message-State: AFuF++nvlDqT2iCcldZNaZMKK5VoFiOon1x8fuVVc3gi9tt7e3EHBclC
	7AzJJQ4FQKo3GAEEm+DWoJwypqwH1qX31+b5DeuHq7M4eHGYDXMt4LstY4n66uKz
X-Gm-Gg: AYBFou2OKhf1cwl90dVoWslRJ2c9fccc8KvmD7WfKaF8eBWCokNZyLl025vjID0jHT3
	lIbZRWPgoBOfT/VhtqcrscPQqVVQCLwLPTnG3QU41QcO9BmZHxgkeHKcOJc/2YCHrRVqf1JD3db
	P/zdwPYY0XY9sXOq4hSNaMkx+hfccT5hBaNRAOlBbeM9VfftVIy5y3BcPCuDyGCQ8j2CWcOCP6e
	EpY6yMnJzmGIEjMq7NEa+OF5BrTSlFzl0tEzFK8AV8j/uDIwPfs1QDkbpjQStms5+9vtjXAp5UP
	xPeQ2Qx7iN+YywqIM45feDXLxO2UNciSAAnDFRy3fg66GTfgWXNbueaq9IM+z03UCogCXcSLYRq
	y/Pgm+TYVblluIojSmmzbiufySTlGTfLB3SRe+IEJ75WtOdC2WAF6ohx127YvkmbHmybev3Ywrh
	5ASG2ZIbfGRONScxgbuG4tZRDWPcfD5UDSU2LFYZXK1pp2NcNn3DZ0U9Y/i9j0NxQYjcoS9LyRW
	T/mffUcHIC7IEXQcld5qBCR/hR/AcASdJ/Mar72zJ7VrOuS3r5GRAYD/0GnKNhFKbERsazPyA==
X-Received: by 2002:a05:6000:26d1:b0:487:27f9:841 with SMTP id ffacd0b85a97d-48727f90b44mr2901124f8f.54.1789841974087;
        Sat, 19 Sep 2026 11:19:34 -0700 (PDT)
Received: from SegFaultinator ([2a00:a041:e1b6:c400:29cf:e244:57dc:2b6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872459d409sm8472276f8f.33.2026.09.19.11.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:19:33 -0700 (PDT)
From: Angel2Eyes <thefireking@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Angel2Eyes <thefireking@gmail.com>
Subject: [OE-core][PATCH] oeqa/selftest: add fs-uuid.bbclass coverage
Date: Sat, 19 Sep 2026 21:19:00 +0300
Message-ID: <20260919181900.443-1-thefireking@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246275

The class has had no tests since it was added. Load the live helpers
and cover tune2fs UUID parsing, placeholder replacement used by
syslinux/grub/systemd-boot, and a real ext image when e2fsprogs is
present.

[YOCTO #15020]

AI-Generated: Cursor Grok 4.6

Signed-off-by: Angel2Eyes <thefireking@gmail.com>
---
 meta/lib/oeqa/selftest/cases/oelib/fs_uuid.py | 311 ++++++++++++++++++
 1 file changed, 311 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/fs_uuid.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/fs_uuid.py b/meta/lib/oeqa/selftest/cases/oelib/fs_uuid.py
new file mode 100644
index 0000000000..83337eaf88
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/fs_uuid.py
@@ -0,0 +1,311 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# Coverage for meta/classes-recipe/fs-uuid.bbclass (bug 15020).
+# AI-Generated: Cursor Grok 4.6
+#
+# The helpers live in a bbclass rather than meta/lib/oe, so these tests load
+# that file and run the functions with a fake bitbake 'bb' module and a mocked
+# tune2fs. That is the same approach as other oelib tests: no image build, but
+# the production parser and placeholder replacement are exercised directly.
+#
+
+import os
+import shutil
+import subprocess
+import tempfile
+import types
+import unittest
+from unittest.case import TestCase
+from unittest.mock import patch
+
+import oe
+
+
+UUID_PLACEHOLDER = '<<uuid-of-rootfs>>'
+SAMPLE_UUID = '5a3c2b1d-4e6f-7890-abcd-ef1234567890'
+SAMPLE_ROOTFS = '/not/a/real/rootfs.ext4'
+
+
+class BBFatal(Exception):
+    """Stand-in for bb.fatal(), which logs and does not return."""
+
+
+class FakeBB:
+    def __init__(self):
+        self.notes = []
+
+    def note(self, msg):
+        self.notes.append(msg)
+
+    def fatal(self, msg):
+        raise BBFatal(msg)
+
+
+class FakeDataStore:
+    def __init__(self, rootfs=SAMPLE_ROOTFS):
+        self.rootfs = rootfs
+
+    def getVar(self, name):
+        if name != 'ROOTFS':
+            raise KeyError(name)
+        return self.rootfs
+
+
+def _bbclass_path():
+    # meta/lib/oe/__init__.py -> meta/classes-recipe/fs-uuid.bbclass
+    meta_dir = os.path.dirname(os.path.dirname(os.path.dirname(oe.__file__)))
+    return os.path.join(meta_dir, 'classes-recipe', 'fs-uuid.bbclass')
+
+
+def _tune2fs_output(uuid, extra_before=None, extra_after=None, uuid_line=None):
+    """A realistic `tune2fs -l` dump. Only the UUID line is required by the class."""
+    lines = [
+        'tune2fs 1.47.2 (1-Jan-2025)',
+        'Filesystem volume name:   <none>',
+        'Last mounted on:          <not available>',
+    ]
+    if extra_before:
+        lines.extend(extra_before)
+    if uuid_line is None:
+        uuid_line = 'Filesystem UUID:          %s' % uuid
+    if uuid_line is not False:
+        lines.append(uuid_line)
+    lines.extend([
+        'Filesystem magic number:  0xEF53',
+        'Filesystem revision #:    1 (dynamic)',
+        'Filesystem features:      ext_attr',
+        'Filesystem state:         clean',
+    ])
+    if extra_after:
+        lines.extend(extra_after)
+    return '\n'.join(lines) + '\n'
+
+
+def _load_fs_uuid(bb_mod):
+    path = _bbclass_path()
+    with open(path, 'r', encoding='utf-8') as f:
+        source = f.read()
+    ns = {'__name__': 'fs_uuid_bbclass', 'bb': bb_mod}
+    exec(compile(source, path, 'exec'), ns)
+    return ns['get_rootfs_uuid'], ns['replace_rootfs_uuid']
+
+
+class FsUuidTestCase(TestCase):
+    """Shared loader so each test runs the functions from the live bbclass."""
+
+    @classmethod
+    def setUpClass(cls):
+        cls.bb = FakeBB()
+        get_rootfs_uuid, replace_rootfs_uuid = _load_fs_uuid(cls.bb)
+        # Keep these off the TestCase class: a raw function stored there
+        # becomes a bound method and would swallow the datastore argument.
+        cls.fns = types.SimpleNamespace(
+            get_rootfs_uuid=get_rootfs_uuid,
+            replace_rootfs_uuid=replace_rootfs_uuid,
+        )
+
+    def setUp(self):
+        self.bb.notes.clear()
+        self.d = FakeDataStore()
+
+
+class TestGetRootfsUuid(FsUuidTestCase):
+
+    def test_parses_typical_tune2fs_output(self):
+        output = _tune2fs_output(SAMPLE_UUID)
+        with patch('subprocess.check_output', return_value=output) as mock:
+            uuid = self.fns.get_rootfs_uuid(self.d)
+        self.assertEqual(uuid, SAMPLE_UUID)
+        mock.assert_called_once_with(['tune2fs', '-l', SAMPLE_ROOTFS], text=True)
+
+    def test_uses_rootfs_variable(self):
+        other = '/work/tmp/foo.ext4'
+        output = _tune2fs_output(SAMPLE_UUID)
+        with patch('subprocess.check_output', return_value=output) as mock:
+            self.fns.get_rootfs_uuid(FakeDataStore(other))
+        mock.assert_called_once_with(['tune2fs', '-l', other], text=True)
+
+    def test_uuid_is_last_token_on_the_line(self):
+        # tune2fs pads the label with spaces; the class uses split()[-1].
+        line = 'Filesystem UUID:\t\t   %s' % SAMPLE_UUID
+        output = _tune2fs_output(SAMPLE_UUID, uuid_line=line)
+        with patch('subprocess.check_output', return_value=output):
+            self.assertEqual(self.fns.get_rootfs_uuid(self.d), SAMPLE_UUID)
+
+    def test_first_uuid_line_wins(self):
+        later = 'ffffffff-ffff-ffff-ffff-ffffffffffff'
+        output = _tune2fs_output(
+            SAMPLE_UUID,
+            extra_after=['Filesystem UUID:          %s' % later],
+        )
+        with patch('subprocess.check_output', return_value=output):
+            self.assertEqual(self.fns.get_rootfs_uuid(self.d), SAMPLE_UUID)
+
+    def test_notes_path_and_uuid(self):
+        output = _tune2fs_output(SAMPLE_UUID)
+        with patch('subprocess.check_output', return_value=output):
+            self.fns.get_rootfs_uuid(self.d)
+        self.assertEqual(self.bb.notes, ['UUID of %s: %s' % (SAMPLE_ROOTFS, SAMPLE_UUID)])
+
+    def test_fatal_when_uuid_line_missing(self):
+        output = _tune2fs_output(SAMPLE_UUID, uuid_line=False)
+        with patch('subprocess.check_output', return_value=output):
+            with self.assertRaisesRegex(BBFatal, SAMPLE_ROOTFS):
+                self.fns.get_rootfs_uuid(self.d)
+
+    def test_fatal_on_empty_tune2fs_output(self):
+        with patch('subprocess.check_output', return_value=''):
+            with self.assertRaisesRegex(BBFatal, 'Could not determine filesystem UUID'):
+                self.fns.get_rootfs_uuid(self.d)
+
+    def test_ignores_uuid_text_that_is_not_at_line_start(self):
+        # startswith('Filesystem UUID:') is the contract; a mention later on a
+        # line must not be treated as the UUID field.
+        output = _tune2fs_output(
+            SAMPLE_UUID,
+            uuid_line=False,
+            extra_after=['Default mount options:    Filesystem UUID: ignored'],
+        )
+        with patch('subprocess.check_output', return_value=output):
+            with self.assertRaises(BBFatal):
+                self.fns.get_rootfs_uuid(self.d)
+
+    def test_tune2fs_failure_propagates(self):
+        # Non-ext images (or missing e2fsprogs) fail at tune2fs; the class
+        # does not catch CalledProcessError.
+        err = subprocess.CalledProcessError(
+            1, ['tune2fs', '-l', SAMPLE_ROOTFS], output='Bad magic number in super-block'
+        )
+        with patch('subprocess.check_output', side_effect=err):
+            with self.assertRaises(subprocess.CalledProcessError):
+                self.fns.get_rootfs_uuid(self.d)
+
+    def test_missing_tune2fs_propagates(self):
+        with patch('subprocess.check_output', side_effect=FileNotFoundError('tune2fs')):
+            with self.assertRaises(FileNotFoundError):
+                self.fns.get_rootfs_uuid(self.d)
+
+
+class TestReplaceRootfsUuid(FsUuidTestCase):
+
+    def test_no_placeholder_is_noop(self):
+        original = 'root=/dev/sda2 rw'
+        with patch('subprocess.check_output') as mock:
+            result = self.fns.replace_rootfs_uuid(self.d, original)
+        self.assertIs(result, original)
+        mock.assert_not_called()
+        self.assertEqual(self.bb.notes, [])
+
+    def test_empty_string_is_noop(self):
+        with patch('subprocess.check_output') as mock:
+            result = self.fns.replace_rootfs_uuid(self.d, '')
+        self.assertEqual(result, '')
+        mock.assert_not_called()
+
+    def test_replaces_syslinux_style_append(self):
+        append = 'root=UUID=%s rw console=ttyS0,115200' % UUID_PLACEHOLDER
+        output = _tune2fs_output(SAMPLE_UUID)
+        with patch('subprocess.check_output', return_value=output):
+            result = self.fns.replace_rootfs_uuid(self.d, append)
+        self.assertEqual(result, 'root=UUID=%s rw console=ttyS0,115200' % SAMPLE_UUID)
+
+    def test_replaces_grub_style_root_argument(self):
+        root = 'root=UUID=%s' % UUID_PLACEHOLDER
+        output = _tune2fs_output(SAMPLE_UUID)
+        with patch('subprocess.check_output', return_value=output):
+            result = self.fns.replace_rootfs_uuid(self.d, root)
+        self.assertEqual(result, 'root=UUID=%s' % SAMPLE_UUID)
+
+    def test_replaces_systemd_boot_options_line(self):
+        # systemd-boot-cfg.bbclass writes: options LABEL=boot <APPEND>
+        options = 'LABEL=boot root=UUID=%s quiet' % UUID_PLACEHOLDER
+        output = _tune2fs_output(SAMPLE_UUID)
+        with patch('subprocess.check_output', return_value=output):
+            result = self.fns.replace_rootfs_uuid(self.d, options)
+        self.assertEqual(result, 'LABEL=boot root=UUID=%s quiet' % SAMPLE_UUID)
+
+    def test_replaces_every_placeholder(self):
+        string = 'root=%s resume=%s' % (UUID_PLACEHOLDER, UUID_PLACEHOLDER)
+        output = _tune2fs_output(SAMPLE_UUID)
+        with patch('subprocess.check_output', return_value=output) as mock:
+            result = self.fns.replace_rootfs_uuid(self.d, string)
+        self.assertEqual(result, 'root=%s resume=%s' % (SAMPLE_UUID, SAMPLE_UUID))
+        self.assertEqual(mock.call_count, 1)
+
+    def test_placeholder_only(self):
+        output = _tune2fs_output(SAMPLE_UUID)
+        with patch('subprocess.check_output', return_value=output):
+            self.assertEqual(self.fns.replace_rootfs_uuid(self.d, UUID_PLACEHOLDER), SAMPLE_UUID)
+
+    def test_near_miss_placeholders_are_left_alone(self):
+        # Users must use the exact token documented in the class.
+        for token in (
+            '<uuid-of-rootfs>',
+            '<<uuid-of-rootfs>',
+            '<uuid-of-rootfs>>',
+            '<<UUID-OF-ROOTFS>>',
+            'uuid-of-rootfs',
+        ):
+            with patch('subprocess.check_output') as mock:
+                result = self.fns.replace_rootfs_uuid(self.d, 'root=UUID=%s' % token)
+            self.assertEqual(result, 'root=UUID=%s' % token, token)
+            mock.assert_not_called()
+
+    def test_placeholder_as_substring_is_replaced(self):
+        # in/replace are substring matches, so an extra trailing '>' is kept.
+        extra = UUID_PLACEHOLDER + '>'
+        output = _tune2fs_output(SAMPLE_UUID)
+        with patch('subprocess.check_output', return_value=output):
+            result = self.fns.replace_rootfs_uuid(self.d, 'root=UUID=%s' % extra)
+        self.assertEqual(result, 'root=UUID=%s>' % SAMPLE_UUID)
+
+    def test_replacement_failure_when_uuid_cannot_be_read(self):
+        with patch('subprocess.check_output', return_value=''):
+            with self.assertRaises(BBFatal):
+                self.fns.replace_rootfs_uuid(self.d, 'root=UUID=%s' % UUID_PLACEHOLDER)
+
+
+@unittest.skipUnless(shutil.which('tune2fs'), 'tune2fs not installed')
+@unittest.skipUnless(
+    shutil.which('mkfs.ext4') or shutil.which('mkfs.ext3') or shutil.which('mkfs.ext2'),
+    'no mkfs.ext* available',
+)
+class TestGetRootfsUuidLive(FsUuidTestCase):
+    """Parser vs a real ext image. Skipped on hosts without e2fsprogs."""
+
+    def _mkfs(self):
+        for name in ('mkfs.ext4', 'mkfs.ext3', 'mkfs.ext2'):
+            path = shutil.which(name)
+            if path:
+                return path
+        self.fail('mkfs.ext* disappeared after skip check')
+
+    def test_reads_uuid_from_real_ext_image(self):
+        mkfs = self._mkfs()
+        with tempfile.TemporaryDirectory(prefix='oe-fs-uuid-') as tmp:
+            image = os.path.join(tmp, 'rootfs.img')
+            with open(image, 'wb') as f:
+                f.truncate(8 * 1024 * 1024)
+            subprocess.check_call(
+                [mkfs, '-F', '-q', image],
+                stdout=subprocess.DEVNULL,
+                stderr=subprocess.DEVNULL,
+            )
+            dumped = subprocess.check_output(['tune2fs', '-l', image], text=True)
+            expected = None
+            for line in dumped.split('\n'):
+                if line.startswith('Filesystem UUID:'):
+                    expected = line.split()[-1]
+                    break
+            self.assertIsNotNone(expected, 'tune2fs -l did not print a UUID')
+
+            uuid = self.fns.get_rootfs_uuid(FakeDataStore(image))
+            self.assertEqual(uuid, expected)
+            replaced = self.fns.replace_rootfs_uuid(
+                FakeDataStore(image),
+                'root=UUID=%s' % UUID_PLACEHOLDER,
+            )
+            self.assertEqual(replaced, 'root=UUID=%s' % expected)
-- 
2.53.0.windows.1


