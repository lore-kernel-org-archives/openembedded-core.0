Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 46C6A7FC92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 11:25:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so2105475wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 03:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5P/U0Z4Qbw64iVJ0eB1vBoIbqD9GlGCmL3JHLXbit3E=;
	b=pd+YxyYwen0e7bcpGEPHBCY/FyCmf/30/sqOJL5IqXhGCoPaFzrJM7CGfoHXzzCuXm
	+dpbFPeVZ9I1SuL70VeG8/1szPwdJPcPMDB3xQtn98dQJJOp7mXVs3DyPXpu1MkyPZ57
	gD2SklNJXZwoYE23omlgiiG5mIJrkC7CQ9nKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5P/U0Z4Qbw64iVJ0eB1vBoIbqD9GlGCmL3JHLXbit3E=;
	b=jNoZxr5EPabJOUtytHlH4QEeNFR9zR7WwcCLEhBNmDm+Fyi5W7681J+QJu+qdwPakZ
	HOwpWJ1U0KCpzlS/7AC02cLecjqSMI1VYNhHt8ODQdNlgj+N8pt+1osSdGjenccpL3vq
	MnVaCHPOum4ctrZS+b+5CRejLx7DMIccvuQhguUAexvOXutF0jx5qs6MeIKqMtW+VxNP
	8RfnuPgX0kYv+iTTi21VbiwIc3G5t13oeSm+RLuXJmzS1qLK1hhW373FYF6tIr9pQxb8
	gH8ICxTzvi7DZlNvMWLpFqpnbJWaVUDQ3v5bUn7UZ7yZhXN7rmxBvp/iY0AnEAyoo9y3
	Rlrw==
X-Gm-Message-State: APjAAAXMhoggaWSrBYh59cyRM9NvrwrqekCluGN8SfzLAcEOGjL9evFM
	Vkp+cmDmDf8H4B02/6f1+L6fDchT2YeeUFkF
X-Google-Smtp-Source: APXvYqxNvcYl6P/lUBsYnFvIhJXqGQDwFozKGjLHieruhXCj0Mz7n8soe5Tt9oDmSv4IO4oJtnkDXw==
X-Received: by 2002:a1c:ddc5:: with SMTP id u188mr3112683wmg.83.1578482751790; 
	Wed, 08 Jan 2020 03:25:51 -0800 (PST)
Received: from arch0.home.b5net.uk ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	g21sm3978213wrb.48.2020.01.08.03.25.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 03:25:51 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 11:25:46 +0000
Message-Id: <20200108112546.8571-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108112546.8571-1-pbarker@konsulko.com>
References: <20200108112546.8571-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] wic: Add --include-path argument
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
X-List-Received-Date: Wed, 08 Jan 2020 11:25:52 -0000
Content-Transfer-Encoding: 8bit

This option adds the contents of the given path to a partition built
with the rootfs source plugin. The path is relative to the directory in
which wic is running not the rootfs itself so use of an absolute path
is recommended. This option is most useful when multiple copies of the
rootfs are added to an image and it is required to add extra content to
only one of these copies. This option only has an effect with the
rootfs source plugin.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/wic.py      | 73 ++++++++++++++++++------
 scripts/lib/wic/help.py                  | 10 ++++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/source/rootfs.py |  7 ++-
 5 files changed, 72 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 3c5be2f501..46cd98b193 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -44,6 +44,24 @@ def only_for_arch(archs, image='core-image-minimal'):
         return wrapped_f
     return wrapper
 
+def extract_files(debugfs_output):
+    """
+    extract file names from the output of debugfs -R 'ls -p',
+    which looks like this:
+
+     /2/040755/0/0/.//\n
+     /2/040755/0/0/..//\n
+     /11/040700/0/0/lost+found^M//\n
+     /12/040755/1002/1002/run//\n
+     /13/040755/1002/1002/sys//\n
+     /14/040755/1002/1002/bin//\n
+     /80/040755/1002/1002/var//\n
+     /92/040755/1002/1002/tmp//\n
+    """
+    # NOTE the occasional ^M in file names
+    return [line.split('/')[5].strip() for line in \
+            debugfs_output.strip().split('/\n')]
+
 
 class WicTestCase(OESelftestTestCase):
     """Wic test class."""
@@ -393,24 +411,6 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                 runCmd("dd if=%s of=%s skip=%d count=%d" %
                                            (wicimg, part_file, start, length))
 
-            def extract_files(debugfs_output):
-                """
-                extract file names from the output of debugfs -R 'ls -p',
-                which looks like this:
-
-                 /2/040755/0/0/.//\n
-                 /2/040755/0/0/..//\n
-                 /11/040700/0/0/lost+found^M//\n
-                 /12/040755/1002/1002/run//\n
-                 /13/040755/1002/1002/sys//\n
-                 /14/040755/1002/1002/bin//\n
-                 /80/040755/1002/1002/var//\n
-                 /92/040755/1002/1002/tmp//\n
-                """
-                # NOTE the occasional ^M in file names
-                return [line.split('/')[5].strip() for line in \
-                        debugfs_output.strip().split('/\n')]
-
             # Test partition 1, should contain the normal root directories, except
             # /usr.
             res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % \
@@ -451,6 +451,43 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         finally:
             os.environ['PATH'] = oldpath
 
+    def test_include_path(self):
+        """Test --include-path wks option."""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        try:
+            include_path = os.path.join(self.resultdir, 'test-include')
+            os.makedirs(include_path)
+            with open(os.path.join(include_path, 'test-file'), 'w') as t:
+                t.write("test\n")
+            wks_file = os.path.join(include_path, 'temp.wks')
+            with open(wks_file, 'w') as wks:
+                rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
+                wks.write("""
+part /part1 --source rootfs --ondisk mmcblk0 --fstype=ext4
+part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
+                          % (include_path))
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+
+            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
+            part2 = glob(os.path.join(self.resultdir, 'temp-*.direct.p2'))[0]
+
+            # Test partition 1, should not contain 'test-file'
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
+            files = extract_files(res.output)
+            self.assertNotIn('test-file', files)
+
+            # Test partition 2, should not contain 'test-file'
+            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part2))
+            files = extract_files(res.output)
+            self.assertIn('test-file', files)
+
+        finally:
+            os.environ['PATH'] = oldpath
+
     def test_exclude_path_errors(self):
         """Test --exclude-path wks option error handling."""
         wks_file = 'temp.wks'
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 29c4e436d8..4d342fcf05 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -969,6 +969,16 @@ DESCRIPTION
                          is omitted, not the directory itself. This option only
                          has an effect with the rootfs source plugin.
 
+         --include-path: This option is specific to wic. It adds the contents
+                         of the given path to the resulting image. The path is
+                         relative to the directory in which wic is running not
+                         the rootfs itself so use of an absolute path is
+                         recommended. This option is most useful when multiple
+                         copies of the rootfs are added to an image and it is
+                         required to add extra content to only one of these
+                         copies. This option only has an effect with the rootfs
+                         source plugin.
+
          --extra-space: This option is specific to wic. It adds extra
                         space after the space filled by the content
                         of the partition. The final size can go
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 6a643ba3af..707a2e8019 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -137,6 +137,7 @@ class KickStart():
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
         part.add_argument('--exclude-path', nargs='+')
+        part.add_argument('--include-path', nargs='+')
         part.add_argument("--extra-space", type=sizetype)
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype', default='vfat',
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index d809408e1a..2d95f78439 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -30,6 +30,7 @@ class Partition():
         self.device = None
         self.extra_space = args.extra_space
         self.exclude_path = args.exclude_path
+        self.include_path = args.include_path
         self.fsopts = args.fsopts
         self.fstype = args.fstype
         self.label = args.label
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index e26e95b991..705aeb5563 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -71,7 +71,7 @@ class RootfsPlugin(SourcePlugin):
 
         new_rootfs = None
         # Handle excluded paths.
-        if part.exclude_path is not None:
+        if part.exclude_path or part.include_path:
             # We need a new rootfs directory we can delete files from. Copy to
             # workdir.
             new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
@@ -81,7 +81,10 @@ class RootfsPlugin(SourcePlugin):
 
             copyhardlinktree(part.rootfs_dir, new_rootfs)
 
-            for orig_path in part.exclude_path:
+            for path in part.include_path or []:
+                copyhardlinktree(path, new_rootfs)
+
+            for orig_path in part.exclude_path or []:
                 path = orig_path
                 if os.path.isabs(path):
                     logger.error("Must be relative: --exclude-path=%s" % orig_path)
-- 
2.24.1


